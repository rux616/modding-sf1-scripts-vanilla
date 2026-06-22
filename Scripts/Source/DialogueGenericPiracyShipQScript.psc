Scriptname DialogueGenericPiracyShipQScript extends Quest

ReferenceAlias Property DialogueGenericPiracyShips_Ship Mandatory Const Auto
ActorValue Property DialogueGenericPiracyShipsAV Mandatory Const Auto
ActorValue Property PiracySurrenderCountAV Mandatory Const Auto
{ used to track number of ships that surrender to the player }

SQ_ParentScript Property SQ_Parent auto const mandatory
{ autofill }

int iPiracy_Win = 1
int iPiracy_Lose = 2
int iPiracy_LoseGU = 3

;The Player's Speech Challenge was a success
Function PiracySuccess(SpaceshipReference ShipRef)
    debug.trace(self + " PiracySuccess " + shipRef)
    ShipRef.SetValue(DialogueGenericPiracyShipsAV, iPiracy_Win)
    ShipRef.OpenInventory()
    SendPiracyAlarm(ShipRef, true)
    Game.GetPlayer().ModValue(PiracySurrenderCountAV, 1)
EndFunction

;This is if the Player ever choses the attack option
Function PiracyFail(SpaceshipReference ShipRef)
    debug.trace(self + " PiracyFail " + shipRef)
    ShipRef.SetValue(DialogueGenericPiracyShipsAV, iPiracy_Lose)
    SendPiracyAlarm(ShipRef, false) ; so player gets bounty
    ShipRef.StartCombat(Game.GetPlayer().GetCurrentShipRef())
EndFunction

;This is if the Player loses the Speech Challenge
Function PiracyLoseSpeechChallenge(SpaceshipReference ShipRef)
    debug.trace(self + " PiracyLoseSpeechChallenge " + shipRef)
    ShipRef.SetValue(DialogueGenericPiracyShipsAV, iPiracy_LoseGU)
    SendPiracyAlarm(ShipRef, false) ; so player gets bounty
EndFunction

Function SendPiracyAlarm(SpaceshipReference shipRef, bool piracySuccess)
    SQ_Parent.SendPiracyEvent(shipRef, piracySuccess)
    shipRef.SendPiracyAlarm()
endFunction