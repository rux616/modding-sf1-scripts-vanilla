Scriptname SFBGS00D:EMODAchievementScript extends ReferenceAlias
{Script that grants the player an achievement for adding a new Equipment Module to their ship.}

;Properties
ActorValue Property EMODInstalled Mandatory Const Auto
ReferenceAlias Property PlayerShip Mandatory Const Auto

;Non-Properties
SpaceshipReference ActiveShip

Event OnPlayerModifiedShip(SpaceshipReference akShip)
    ActiveShip = PlayerShip.GetShipRef() 
    If (akShip == ActiveShip)
        If (ActiveShip.GetValue(EMODInstalled) >= 1)
            Game.AddAchievement(74)
        EndIf
    EndIf
EndEvent
