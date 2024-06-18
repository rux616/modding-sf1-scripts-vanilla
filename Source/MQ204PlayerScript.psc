Scriptname MQ204PlayerScript extends ReferenceAlias

ReferenceAlias Property PlayerShip Auto Const Mandatory
Int NewAtlantisToShipStage = 135
Int NewAtlantisToShipPrereqStage = 110

Int EyePathRunToShipStage = 490
Int EyePathRunToShipPrereq = 480

Int Property BuildArmillaryPrereqStage = 510 Const Auto
Int Property BuildArmillaryStage = 620 Const Auto

Int Property EyePathPostRescuedEyeStage = 455 Const Auto
Int Property EyePathPostRescuedEyePrereq = 450 Const Auto

ActorValue Property MQArmillaryShipBuilderCheck Mandatory Const Auto
Keyword Property ShipTypeStarborn Mandatory Const Auto

Event OnEnterShipInterior(ObjectReference akShip)
    Quest myMQ204 = GetOwningQuest()
    SpaceshipReference PlayerShipREF = PlayerShip.GetShipReference()
    If akShip == PlayerShipREF
        If myMQ204.GetStageDone(NewAtlantisToShipPrereqStage)
            myMQ204.SetStage(NewAtlantisToShipStage)
        EndIf
        If myMQ204.GetStageDone(EyePathRunToShipPrereq)
            myMQ204.SetStage(EyePathRunToShipStage)
        EndIf
        If myMQ204.GetStageDone(EyePathPostRescuedEyePrereq)
            myMQ204.SetStage(EyePathPostRescuedEyeStage)
        EndIf
    EndIf
EndEvent