scriptName DefaultAliasDisableHavokOnLoad extends ReferenceAlias Default
{Disable havok on a ref OnLoad(), then optionally enable havok OnHit(), OnActivate(), or OnGrab()}
Group Optional_Properties
	bool property HavokOnHit Auto Const
	{Start Havok Sim when hit? DEFAULT: FALSE}
	bool property HavokOnActivate Auto Const
	{Start Havok Sim when activated? DEFAULT: FALSE}
	bool property HavokOnZKey Auto Const
	{Start Havok Sim when grabbed by player? DEFAULT: FALSE}
	keyword property LinkHavokPartner Auto Const
	{Link with this keyword and that ref will also sim with myself}
EndGroup

bool property BeenSimmed auto hidden
{Prevent an object that has been havok'd in-game from going static}

EVENT onLoad()
	ObjectReference ref = Self.GetReference()
	if (BeenSimmed == FALSE && ref.Is3DLoaded())
		ref.SetMotionType(ref.Motion_Keyframed, TRUE)
		RegisterForHitEvent(self) ; listen for a single hit event, any source
	endif
endEVENT

Event onUnload()
	UnregisterForAllHitEvents()
endEvent

EVENT onActivate(ObjectReference triggerRef)
	if HavokonActivate == TRUE && BeenSimmed == FALSE
		ReleaseToHavok()
	endif
endEVENT

EVENT onHit(ObjectReference akTarget, ObjectReference var1, Form var2, Projectile var3, bool var4, bool var5, bool var6, bool var7, string asMaterialName)
	if HavokOnHit == TRUE && BeenSimmed == FALSE 
		ReleaseToHavok()
	endif
endEVENT

EVENT onGrab()
	if HavokOnZkey == TRUE && BeenSimmed == FALSE
		ReleaseToHavok()
	endif
endEVENT

FUNCTION ReleaseToHavok()
		BeenSimmed = TRUE
		ObjectReference ref = Self.GetReference()
		objectReference myLink = ref.getLinkedRef(LinkHavokPartner)
		if myLink != NONE
			defaultDisableHavokOnLoad linkScript = myLink as defaultDisableHavokOnLoad
			if (linkScript)  && (linkScript.BeenSimmed == FALSE)
				linkScript.ReleaseToHavok()
			endif
		endif
		ref.setMotionType(ref.Motion_Dynamic, TRUE)
		ref.ApplyHavokImpulse(0, 0, 1, 5)
endFUNCTION
