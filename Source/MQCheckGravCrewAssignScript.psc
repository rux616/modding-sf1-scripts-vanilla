Scriptname MQCheckGravCrewAssignScript extends ReferenceAlias

Int Property PreReqStageGravJumpRange=12 Const Auto
Int Property StageToSetGravJumpRange=13 Const Auto
Int Property GravJumpRangeToCheck=28 Const Auto

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
    ;if the player changes crew on their current ship, check the grav range again
    SpaceshipReference MyShip = Self.GetShipRef()
    If MyShip.GetGravJumpRange() >= GravJumpRangeToCheck
        quest myQuest = GetOwningQuest()
        If myQuest.GetStageDone(PreReqStageGravJumpRange)
            myQuest.SetStage(StageToSetGravJumpRange)
        EndIf
    EndIf
endEvent