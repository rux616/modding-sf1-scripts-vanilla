Scriptname MQ206BPlayerScript extends ReferenceAlias

ReferenceAlias Property SanctumPlayerSeat Mandatory Const Auto
Int Property iPrereqStage=140 Const Auto
Int Property iSetStage=150 Const Auto

Event OnSit(ObjectReference akFurniture)
    Quest myQuest = GetOwningQuest()
    If akFurniture == SanctumPlayerSeat.GetRef()
        If myQuest.GetStageDone(iPrereqStage)
            myQuest.SetStage(iSetStage)
        EndIf
    EndIf
EndEvent