Scriptname SFBGS00D:SSFL_SE_EC07_PlayerAliasScript extends ReferenceAlias

Quest Property SFFL_SE_EC07 Auto Const Mandatory

LocationAlias Property PassengerDestination Auto Const

Int Property StageToSetIfJailed Auto Const

Event OnPlayerPayFine(ObjectReference akGuard, Form akFaction, int aeCrimeGold)
    ;Check to see if we paid the fine on New Atlantis
    if (!SFFL_SE_EC07.IsStageDone(700) && Game.GetPlayer().GetCurrentLocation() == PassengerDestination.GetLocation())
        SFFL_SE_EC07.SetStage(StageToSetIfJailed)
    endif
EndEvent

Event OnPlayerJail(ObjectReference akGuard, Form akFaction, Location akLocation, int aeCrimeGold)
    ;Check to see if we were jailed on New Atlantis
    if (!SFFL_SE_EC07.IsStageDone(700) && akLocation == PassengerDestination.GetLocation())
        SFFL_SE_EC07.SetStage(StageToSetIfJailed)
    endif
EndEvent
