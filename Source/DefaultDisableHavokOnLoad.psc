scriptName DefaultDisableHavokOnLoad extends ObjectReference Default
{Disable havok on a ref OnLoad(), then optionally enable havok OnHit(), OnActivate(), or OnGrab()}
Group Optional_Properties
	bool property HavokOnHit = False Auto Const
	{Start Havok Sim when hit? DEFAULT: False}
	bool property HavokOnActivate = False Auto Const
	{Start Havok Sim when activated? DEFAULT: False}
	bool property HavokOnZKey = False Auto Const
	{Start Havok Sim when grabbed by player? DEFAULT: False}
	keyword property LinkHavokPartner Auto Const
	{Link with this keyword and that ref will also sim with myself}
	bool property BeenSimmed = false auto hidden
	{Prevent an object that has been havok'd in-game from going static}
	float property HavokImpulseMagnitude = 0.07 auto const
	{havok impulse to apply when released to havok sim}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = False Auto Const
	{Default = False, Set to True if you want the traces in this script to show up in the log.}
EndGroup

bool bHasChangedContainers

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    bHasChangedContainers = TRUE
    BeenSimmed = TRUE
EndEvent

EVENT onLoad()
	if !HavokOnHit && !HavokOnActivate && !HavokOnZKey && !LinkHavokPartner
		Game.Warning(self + ": All properties at their default values, use Disable Physics Sim flag on this reference instead!")
	endif

	DefaultScriptFunctions.Trace(self, "onLoad", ShowTraces)
	if (BeenSimmed == FALSE && Self.Is3DLoaded())
		setMotionType(Motion_Keyframed, TRUE)
		if !bHasChangedContainers
			MoveToMyEditorLocation()
		endif
		if HavokOnHit
			RegisterForHitEvent(self)
		endif
	endif
endEVENT

EVENT onUnload()
	UnregisterForAllHitEvents()
endEVENT

EVENT onActivate(ObjectReference triggerRef)
	DefaultScriptFunctions.Trace(self, "onActivate", ShowTraces)
	if HavokonActivate == TRUE && BeenSimmed == FALSE
		ReleaseToHavok()
	endif
endEVENT

EVENT onHit(ObjectReference akTarget, ObjectReference var1, Form var2, Projectile var3, bool var4, bool var5, bool var6, bool var7, string asMaterialName)
	DefaultScriptFunctions.Trace(self, "onHit", ShowTraces)
	if HavokOnHit == TRUE && BeenSimmed == FALSE
		ReleaseToHavok()
	endif
endEVENT

EVENT onGrab()
	DefaultScriptFunctions.Trace(self, "onGrab", ShowTraces)
	if HavokOnZkey == TRUE && BeenSimmed == FALSE
		ReleaseToHavok()
	endif
endEVENT

FUNCTION ReleaseToHavok()
	DefaultScriptFunctions.Trace(self, "ReleaseToHavok", ShowTraces)
	BeenSimmed = TRUE
	objectReference myLink = getLinkedRef(LinkHavokPartner)
	if myLink != NONE
		defaultDisableHavokOnLoad linkScript = myLink as defaultDisableHavokOnLoad
		if (linkScript)  && (linkScript.BeenSimmed == FALSE)
			linkScript.ReleaseToHavok()
		endif
	endif
	setMotionType(Motion_Dynamic, TRUE)
	ApplyHavokImpulse(0, 0, 1, havokImpulseMagnitude)
endFUNCTION
