Scriptname DefaultActivateLinkedRefOnCombat extends DefaultActor Default
{Activates THIS actor's linked ref when THIS actor's combat state changes.
<RefToCheck> is the reference THIS actor is getting into combat with.
<LocationToCheck> is the current location of THIS actor's reference.}

Group Quest_Properties collapsed
{Double-Click to EXPAND}
	bool Property xxxPlaceHolderForEmptyGroup2xxx Const Auto HIDDEN
	{`TTP-27034: Papyrus: Need a way to manage groups across parents and children`}
EndGroup

Group Script_Specific_Properties
	bool Property IncludeOnHitEvent = true Const Auto
	{If true (default), exceute script functionality when THIS actor is hit in combat and <RefToCheck> will be the aggressor.}

Int Property CombatStateToCheckFor = 4 Auto Const
{0: Not In Combat
1: In Combat
2: Searching
4 (Default): In Combat or Searching}

	Keyword Property LinkedRefKeyword Auto Const
	{The Keyword of the LinkedRef you want to activate when this activated.}

	bool Property ShouldUseLinkedRefChain = false Const Auto
	{(Default: false) If true, will execute over the entire Linked Ref Chain.}

	bool Property ActivatorIsRefToCheck = true Const Auto 
	{If true (default), Activate function's akActivator param will be <RefToCheck>. If false, akActivator param will be THIS object.}
EndGroup

Event OnLoad()
	if IncludeOnHitEvent
		RegisterOnHitFilters()
	endif
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

State Done
	Event OnLoad()
		;don't register
	EndEvent
EndState

;Reimplementing Parent's empty function
ObjectReference[] Function GetRefsToDoSpecificThingsWith()
	if ShouldUseLinkedRefChain
		DefaultScriptFunctions.Trace(self, "GetRefsToDoSpecificThingsWith() returning linked ref chain.", ShowTraces)
		return GetLinkedRefChain(LinkedRefKeyword)
	else
		return GetLinkedRef(LinkedRefKeyword).GetSingleRefArray()
	endif
EndFunction



Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	DefaultScriptFunctions.Trace(self, "OnHit() akTarget: " + akAggressor, ShowTraces)
	CombatStateChangedOrHit(akAggressor)	
EndEvent

Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)
	if ((aeCombatState > 0) && (CombatStateToCheckFor == 4)) || (aeCombatState == CombatStateToCheckFor)
		DefaultScriptFunctions.Trace(self, "OnCombatStateChanged() akTarget: " + akTarget + ", aeCombatState: " + aeCombatState, ShowTraces)
		CombatStateChangedOrHit(akTarget)
	endif
EndEvent

Function CombatStateChangedOrHit(ObjectReference TargetOrAggressor)
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = TargetOrAggressor, LocationToCheck = GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "CombatStateChangedOrHit() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndFunction

;Reimplementing Parent's empty function
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
	ObjectReference ActivatorRef = self
	if ActivatorIsRefToCheck
		ActivatorRef = ParentScriptFunctionParams.RefToCheck
	endif
	
	DefaultScriptFunctions.trace(self, "DoSpecificThing() ActivatorRef: " + ActivatorRef + " is activating RefToDoThingWith: " + RefToDoThingWith, ShowTraces)
	RefToDoThingWith.Activate(ActivatorRef)
EndFunction