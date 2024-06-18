Scriptname MQ207BPlayerScript extends ReferenceAlias

ReferenceAlias Property PlayerShip Mandatory Const Auto
Int Property PreReqStageGravJumpRange=12 Const Auto
Int Property StageToSetGravJumpRange=13 Const Auto
Int Property GravJumpRangeToCheck=28 Const Auto

Event OnPlayerModifiedShip(SpaceshipReference akShip)
    ;if the player has modified their ship to extend the grav-jump range, update objectives
    Quest myQuest = GetOwningQuest()
    Float myGravJumpRange = akShip.GetGravJumpRange()
    If akShip == PlayerShip.GetShipRef()
        If myGravJumpRange >= GravJumpRangeToCheck            
            If myQuest.GetStageDone(PreReqStageGravJumpRange)
                myQuest.SetStage(StageToSetGravJumpRange)
            EndIf
        EndIf
    EndIf
endEvent

Event OnHomeShipSet(SpaceshipReference akShip, SpaceshipReference akPrevious)
    Quest myQuest = GetOwningQuest()
    Float myGravJumpRange = akShip.GetGravJumpRange()
    If myGravJumpRange >= GravJumpRangeToCheck        
        If myQuest.GetStageDone(PreReqStageGravJumpRange)
            myQuest.SetStage(StageToSetGravJumpRange)
        EndIf
    EndIf
endEvent