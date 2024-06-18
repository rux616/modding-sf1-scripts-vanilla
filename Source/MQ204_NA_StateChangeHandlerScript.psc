Scriptname MQ204_NA_StateChangeHandlerScript extends Quest

Location Property CityNewAtlantisLocation Const Auto
Int Property LeftNAStageToSet=100 Const Auto
Int Property LeftNAPrereqStage=10 Const Auto
SQ_PlayerShipScript property SQ_PlayerShip auto const mandatory

Event OnQuestInit()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip, "OnLocationChange")
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    if akSender == Game.GetPlayer()
        if GetStageDone(LeftNAPrereqStage)
            If (akOldLoc == CityNewAtlantisLocation) || (akOldLoc.IsChild(CityNewAtlantisLocation))
                If akSender.IsInLocation(CityNewAtlantisLocation) == 0
                    SetStage(LeftNAStageToSet)
                EndIf
            EndIf
        EndIf
    endif
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
    if akSender == SQ_PlayerShip.PlayerShip
        if GetStageDone(LeftNAPrereqStage)
            If (akOldLoc == CityNewAtlantisLocation) || (akOldLoc.IsChild(CityNewAtlantisLocation))
                If akSender.GetRef().IsInLocation(CityNewAtlantisLocation) == 0
                    SetStage(LeftNAStageToSet)
                EndIf
            EndIf
        EndIf
    endif
EndEvent