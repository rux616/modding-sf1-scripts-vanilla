Scriptname UC04_RefColl_WarnIfHitScript extends DefaultCollectionAliasOnHit

Keyword Property WeaponTypeEM Mandatory Const Auto
{Weapon type we're checking the player has equipped before triggering Hadrian's scene}

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
    Actor PlayACT = Game.GetPlayer()
    if akAggressor == PlayACT && PlayACT.WornHasKeyword(WeaponTypeEM)

        DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = akAggressor, LocationToCheck = akTarget.GetCurrentLocation())
        DefaultScriptFunctions.Trace(self, "OnHit() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
        CheckAndSetStageAndCallDoSpecificThing(akTarget, ParentScriptFunctionParams)
        
        if DoOnce == false
            RegisterOnHitFilters()
        EndIf
    endif
EndEvent