Scriptname SY_TestPilot01_Script extends Quest

ReferenceAlias Property PrototypeShip Auto Const
ActorValue Property SpaceshipEnginePartMaxForwardSpeed Auto Const Mandatory
ActorValue Property SpaceshipEngineHealth Auto Const Mandatory

Function ChangeShipSpeed(float fNewSpeed)
; Change the speed - the default max speed is 300
    SpaceshipReference sPrototypeShip = PrototypeShip.GetRef() as SpaceshipReference
    sPrototypeShip.SetValue(SpaceshipEnginePartMaxForwardSpeed, fNewSpeed)

    ; TEMP: We have no command to refresh the speed settings - so tricking the system
    ;sPrototypeShip.DamageValue(SpaceshipEngineHealth, 1)
    ;sPrototypeShip.RestoreValue(SpaceshipEngineHealth, 1)
EndFunction

