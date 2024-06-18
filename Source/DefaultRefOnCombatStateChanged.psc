Scriptname DefaultRefOnCombatStateChanged extends DefaultActor Default
{Sets stage when THIS actor's combat state changes.
<RefToCheck> is the reference THIS actor is getting into combat with.
<LocationToCheck> is the current location of THIS actor's reference.}

Group Script_Specific_Properties
bool Property IncludeOnHitEvent = true Const Auto
{If true (default), exceute script functionality when THIS actor is hit in combat and <RefToCheck> will be the aggressor.}

Int Property CombatStateToCheckFor = 4 Auto Const
{0: Not In Combat
1: In Combat
2: Searching
4 (Default): In Combat or Searching}
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