Scriptname DefaultCollectionOnCombatStateChanged extends DefaultCollectionAlias Default
{Sets stage when THIS RefCollection's members' combat state changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference THIS RefCollection's members are getting into combat with
<LocationToCheck> is the current location of each ref in THIS collection.}


Group Script_Specific_Properties
bool Property IncludeOnHitEvent = true Const Auto
{If true (default), exceute script functionality when THIS actor is hit in combat and <RefToCheck> will be the aggressor.}

Int Property CombatStateToCheckFor = 4 Auto Const
{0: Not In Combat
1: In Combat
2: Searching
4 (Default): In Combat or Searching}
EndGroup

Event OnAliasInit()
	if IncludeOnHitEvent
		RegisterOnHitFilters()
	EndIf
EndEvent

Event OnLoad(ObjectReference akSenderRef)
	if IncludeOnHitEvent
		RegisterOnHitFilters()
	endif
EndEvent

Event OnUnload(ObjectReference akSenderRef)
	UnregisterForAllHitEvents()
EndEvent

State Done
	Event OnLoad(ObjectReference akSenderRef)
		;don't register
	EndEvent
EndState


Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	DefaultScriptFunctions.Trace(self, "OnHit() akTarget: " + akAggressor, ShowTraces)
	CombatStateChangedOrHit(akTarget, akAggressor)	
EndEvent

Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, int aeCombatState)
	if ((aeCombatState > 0) && (CombatStateToCheckFor == 4)) || (aeCombatState == CombatStateToCheckFor)
		DefaultScriptFunctions.Trace(self, "OnCombatStateChanged() akTarget: " + akTarget + ", aeCombatState: " + aeCombatState, ShowTraces)
		CombatStateChangedOrHit(akSenderRef, akTarget)
	endif
EndEvent

Function CombatStateChangedOrHit(ObjectReference akSenderRef, ObjectReference TargetOrAggressor)
	Quest myQuest = GetOwningQuest()
	if myQuest.GetStageDone(StageToSet) == false && (PrereqStage < 0 || myQuest.GetStageDone(PrereqStage)) && (TurnOffStage < 0 || myQuest.GetStageDone(TurnOffStage) == false) 
		DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = TargetOrAggressor, LocationToCheck = akSenderRef.GetCurrentLocation())
		DefaultScriptFunctions.Trace(self, "CombatStateChangedOrHit() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
		CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
	endif
EndFunction
