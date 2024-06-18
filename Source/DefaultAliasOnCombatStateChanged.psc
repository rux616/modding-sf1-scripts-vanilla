Scriptname DefaultAliasOnCombatStateChanged extends DefaultAlias Default
{Sets stage when THIS Alias's combat state changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference THIS Alias is getting into combat with
<LocationToCheck> is the current location of THIS Alias's reference.}

Group Script_Specific_Properties
	bool Property IncludeOnHitEvent = true Const Auto
	{If true (default), exceute script functionality when THIS actor is hit in combat and <RefToCheck> will be the aggressor.}

	Bool Property SpellHits_HostileOnly = true Auto Const
	{(Default: true) If true, stage will be set when hits from spells are flagged as "hostile". If false, stage will be set from any kind of spell hit.
		NOTE: this only matters if IncludeOnHitEvent = true }

	Int Property CombatStateToCheckFor = 4 Auto Const
	{0: Not In Combat
	1: In Combat
	2: Searching
	4 (Default): In Combat or Searching}
EndGroup

Event OnAliasInit()
	if IncludeOnHitEvent && GetReference().Is3DLoaded()
		RegisterOnHitFilters()
	EndIf
EndEvent

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
	; if this is a spell hit make sure it passes SpellHits_HostileOnly
	Spell sourceSpell = akSource as Spell
	if SpellHits_HostileOnly == false || sourceSpell == NONE || sourceSpell.IsHostile()
		CombatStateChangedOrHit(akAggressor)
	endif
EndEvent

Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)
	if ((aeCombatState > 0) && (CombatStateToCheckFor == 4)) || (aeCombatState == CombatStateToCheckFor)
		DefaultScriptFunctions.Trace(self, "OnCombatStateChanged() akTarget: " + akTarget + ", aeCombatState: " + aeCombatState, ShowTraces)
		CombatStateChangedOrHit(akTarget)
	endif
EndEvent

Function CombatStateChangedOrHit(ObjectReference TargetOrAggressor)
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = TargetOrAggressor, LocationToCheck = TryToGetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "CombatStateChangedOrHit() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndFunction