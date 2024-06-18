Scriptname MQ404PlayerScript extends ReferenceAlias

Int Property BuildArmillaryPrereqStage = 110 Const Auto
Int Property BuildArmillaryStage = 120 Const Auto
ActorValue Property MQArmillaryShipBuilderCheck Mandatory Const Auto
Keyword Property ShipTypeStarborn Mandatory Const Auto
ReferenceAlias Property PlayerShip Auto Const Mandatory

;if the player builds a ship module with the Armillary in it, advance quest
Event OnPlayerModifiedShip(SpaceshipReference akShip)
    Quest myQuest = GetOwningQuest()
    if akShip.GetValue(MQArmillaryShipBuilderCheck) >= 1
        If (myQuest.GetStageDone(BuildArmillaryPrereqStage)==True) && (myQuest.GetStageDone(BuildArmillaryStage)==False)
            myQuest.SetStage(BuildArmillaryStage)
        EndIf
    EndIf
EndEvent


Event OnEnterShipInterior(ObjectReference akShip)
    Quest myQuest = GetOwningQuest()
    SpaceshipReference PlayerShipREF = PlayerShip.GetShipReference()

    ;if the player enters their Starborn ship during the Armillary step, advance quest (since the Starborn ships always have room for Armillary)
    If (akShip == PlayerShipREF) && (akShip.HasKeyword(ShipTypeStarborn))
        If (myQuest.GetStageDone(BuildArmillaryPrereqStage)==True) && (myQuest.GetStageDone(BuildArmillaryStage)==False)
            myQuest.SetStage(BuildArmillaryStage)
        EndIf
    EndIf
EndEvent