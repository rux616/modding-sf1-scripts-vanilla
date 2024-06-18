Scriptname MQ305PlayerShipAliasScript extends ReferenceAlias

ReferenceAlias Property Armillary Mandatory Const Auto
ActorValue Property SpaceshipGravJumpPower Mandatory Const Auto
GlobalVariable Property MQArmillaryCompleteGlobal Mandatory Const Auto
Scene Property MQ305_000_GravJumpUnity Mandatory Const Auto

Event OnShipSystemPowerChange(ActorValue akSystem,bool abAddPower,bool abDamageRelated)

    ;check if the player manually adds power to the grav-drive
    If akSystem == (SpaceshipGravJumpPower) && (abAddPower) && (abDamageRelated==False)
        ;if this ship is the same ship that the Armillary is in and the Armillary is complete, then go to the Unity
        ObjectReference ArmillaryREF = Armillary.GetRef()
        Int iArmillaryComplete = MQArmillaryCompleteGlobal.GetValueInt()
        ObjectReference ArmillaryShipREF = ArmillaryREF.GetCurrentShipRef()
        SpaceshipReference MyShipREF = Self.GetShipReference()

        If (ArmillaryShipREF == MyShipREF) && (iArmillaryComplete >= 1) && (MyShipREF.IsInSpace())
            MQ305_000_GravJumpUnity.Start()
        EndIf
    EndIf
EndEvent