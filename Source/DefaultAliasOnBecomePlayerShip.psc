Scriptname DefaultAliasOnBecomePlayerShip extends DefaultAliasParent Default
{sets stage and removes factions from this alias's ship when it becomes the current player ship (i.e. player sits in the pilot seat)
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
}

Group Script_Specific_Properties
	SQ_PlayerShipScript property SQ_PlayerShip auto Const Mandatory
	{autofill - used to register for player ship change event }

    Faction[] property FactionsToRemove auto Const
    { factions to remove when this ship becomes the player ship }
EndGroup

Event OnAliasInit()
    ; register for custom event
    RegisterForCustomEvent(SQ_PlayerShip, "SQ_PlayerShipChanged")
endEvent

Event SQ_PlayerShipScript.SQ_PlayerShipChanged(SQ_PlayerShipScript akSender, Var[] akArgs)
	SpaceshipReference newPlayerShip = akArgs[0] as SpaceshipReference

    if newPlayerShip == GetShipRef()
        
        DefaultScriptFunctions.Trace(self, "SQ_PlayerShipChanged()", ShowTraces)

        DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams = DefaultScriptFunctions.BuildParentScriptFunctionParams(RefToCheck = None, LocationToCheck = TryToGetCurrentLocation())
        DefaultScriptFunctions.Trace(self, "SQ_PlayerShipChanged() calling CheckAndSetStageAndCallDoSpecificThing() ParentScriptFunctionParams: " + ParentScriptFunctionParams, ShowTraces)
        CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)		
    endif
EndEvent

;OVERRIDE PARENT SCRIPT
Function DoSpecificThing(DefaultScriptFunctions:ParentScriptFunctionParams ParentScriptFunctionParams, ObjectReference RefToDoThingWith = None, bool LastRefToDoThingWith = true)
    DefaultScriptFunctions.Trace(self, "DoSpecificThing() - removing factions", ShowTraces)
    ; remove factions from this ship
    int i = 0
    while i < FactionsToRemove.Length
        TryToRemoveFromFaction(FactionsToRemove[i])
        i += 1
    EndWhile
EndFunction

