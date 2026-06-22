Scriptname DefaultCollectionAliasOnHit extends DefaultCollectionAlias Default
{Sets stage when THIS RefCollection's members are hit.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference hitting each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection.

SEE ALSO DefaultCollectionOnCombatStateChanged which includes the ability to also check for OnHit.
(You probably want to use DefaultCollectionOnCombatStateChanged if THIS is an actor and you are testing to see if it's becoming hostile)}

Group Script_Specific_Properties
	Bool Property SpellHits_HostileOnly = true Auto Const
	{(Default: true) If true, stage will be set when hits from spells are flagged as "hostile". If false, stage will be set from any kind of spell hit. }
EndGroup

Event OnAliasInit()
	RegisterOnHitFilters()
EndEvent

Event OnLoad(ObjectReference akSenderRef)
	RegisterOnHitFilters()
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
	DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akAggressor, LocationToCheck = akTarget.GetCurrentLocation())
	DefaultScriptFunctions.Trace(self, "OnHit() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
	
	; first, if this is a spell hit make sure it passes SpellHits_HostileOnly
	Spell sourceSpell = akSource as Spell
	if SpellHits_HostileOnly == false || sourceSpell == NONE || sourceSpell.IsHostile()
		CheckAndSetStageAndCallDoSpecificThing(akTarget, ParentScriptFunctionParams)
	EndIf

	if DoOnce == false
		RegisterOnHitFilters()
	EndIf
EndEvent