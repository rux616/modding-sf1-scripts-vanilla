Scriptname Mq305PlayerScript extends ReferenceAlias

Int Property BuildArmillaryPrereqStage = 10 Const Auto
Int Property BuildArmillaryStage = 40 Const Auto
ActorValue Property MQArmillaryShipBuilderCheck Mandatory Const Auto

;if the player builds a ship module with the Armillary in it, advance quest
Event OnPlayerModifiedShip(SpaceshipReference akShip)
    Quest myQuest = GetOwningQuest()
    if akShip.GetValue(MQArmillaryShipBuilderCheck) >= 1
        If (myQuest.GetStageDone(BuildArmillaryPrereqStage)==True) && (myQuest.GetStageDone(BuildArmillaryStage)==False)
            myQuest.SetStage(BuildArmillaryStage)
        EndIf
    EndIf
EndEvent

;if player enters a ship with the Armillary in it, advance quest
Event OnEnterShipInterior(ObjectReference akShip)
    Quest myQuest = GetOwningQuest()
    If akShip.GetValue(MQArmillaryShipBuilderCheck) >= 1
        If (myQuest.GetStageDone(BuildArmillaryPrereqStage)==True) && (myQuest.GetStageDone(BuildArmillaryStage)==False)
            myQuest.SetStage(BuildArmillaryStage)
        EndIf
    EndIf
EndEvent