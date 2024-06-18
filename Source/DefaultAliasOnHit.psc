Scriptname DefaultAliasOnHit extends DefaultAlias Default
{Sets stage when THIS Alias is hit.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference hitting THIS Alias.
<LocationToCheck> is the current location of THIS Alias.

SEE ALSO DefaultAliasOnCombatStateChanged which includes the ability to also check for OnHit.
(You probably want to use DefaultAliasOnCombatStateChanged if THIS is an actor and you are testing to see if it's becoming hostile)}

Group Script_Specific_Properties
	Bool Property SpellHits_HostileOnly = true Auto Const
	{(Default: true) If true, stage will be set when hits from spells are flagged as "hostile". If false, stage will be set from any kind of spell hit. }
EndGroup

Event OnAliasInit()
	if GetReference().Is3DLoaded()
		RegisterOnHitFilters()
	endif
EndEvent

Event OnLoad()
	RegisterOnHitFilters()
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

State Done
	Event OnLoad()
		;don't register
	EndEvent
EndState

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akAggressor, LocationToCheck = TryToGetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnHit() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)

	; first, if this is a spell hit make sure it passes SpellHits_HostileOnly
	Spell sourceSpell = akSource as Spell
	if SpellHits_HostileOnly == false || sourceSpell == NONE || sourceSpell.IsHostile()
		CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
	EndIf

	RegisterOnHitFilters()
EndEvent

