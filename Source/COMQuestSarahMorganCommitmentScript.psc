Scriptname COMQuestSarahMorganCommitmentScript extends Quest

GlobalVariable Property GameDaysPassed Mandatory Const Auto
GlobalVariable Property COM_Quest_SarahMorgan_Commitment_Time Mandatory Const Auto
LocationAlias Property LeavingLocationAlias Mandatory Const Auto
Int Property PlayerLeftParadisoStage = 1000 Const Auto

SQ_PlayerShipScript property SQ_PlayerShip auto const mandatory
{ autofill }


Function StartAbigailLeave()
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip, "OnLocationChange")
EndFunction


Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    debug.trace(self + " OnLocationChange " + akSender + " akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
	; watch for player to change location
	If akSender == Game.GetPlayer() && GameDaysPassed.GetValue() >= COM_Quest_SarahMorgan_Commitment_Time.GetValue()
        If akOldLoc == LeavingLocationAlias.GetLocation() || akNewLoc == LeavingLocationAlias.GetLocation()
		    SetStage(PlayerLeftParadisoStage)
        EndIf
	EndIf
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
    debug.trace(self + " OnLocationChange " + akSender + " akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
	; watch for player ship to change location
	If akSender == SQ_PlayerShip.PlayerShip && GameDaysPassed.GetValue() >= COM_Quest_SarahMorgan_Commitment_Time.GetValue()
        If akOldLoc == LeavingLocationAlias.GetLocation() || akNewLoc == LeavingLocationAlias.GetLocation()
		    SetStage(PlayerLeftParadisoStage)
        EndIf
	EndIf
EndEvent