Scriptname CityCYRedTape02ShipScript extends ReferenceAlias

ActorValue property ShipSystemEngineHealth Auto Const Mandatory
ActorValue property ShipSystemGravDriveHealth Auto Const Mandatory

Event OnLoad()
    SpaceshipReference myHurstShip = GetShipReference()
    myHurstShip.EnablePartRepair(ShipSystemEngineHealth, false)
    myHurstShip.DamageValue(ShipSystemEngineHealth, 100000)
    myHurstShip.DamageValue(ShipSystemGravDriveHealth, 100000)
EndEvent
