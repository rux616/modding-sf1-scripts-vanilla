Scriptname MQ305ArmillaryAliasScript extends ReferenceAlias

ReferenceAlias Property PlayerShip Auto Const
GlobalVariable Property MQArmillaryCompleteGlobal Mandatory Const Auto
InputEnableLayer MQ305ArmillaryEnableLayer

Event OnAliasChanged(ObjectReference akObject, bool abRemove)
    SpaceshipReference PlayerShipREF = PlayerShip.GetShipRef()

    If abRemove
        ;unlock AI allocation to the grav-drive
        PlayerShipREF.LockPowerAllocation(3, -1, False)

        ;release control locks
        MQ305ArmillaryEnableLayer.EnableGravJump(True)
        MQ305ArmillaryEnableLayer = None
    ElseIf MQArmillaryCompleteGlobal.GetValueInt() == 1
        ;set the player's grav-drive to be unpowered and lock AI allocation to it
        PlayerShipREF.LockPowerAllocation(3, -1, True)
        PlayerShipREF.SetPartPower(3, -1, 0)

        ;disable grav jumping
        MQ305ArmillaryEnableLayer = InputEnableLayer.Create()
        MQ305ArmillaryEnableLayer.EnableGravJump(False)
    EndIf
EndEvent