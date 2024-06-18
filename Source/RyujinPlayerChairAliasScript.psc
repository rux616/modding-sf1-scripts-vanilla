Scriptname RyujinPlayerChairAliasScript extends ReferenceAlias

Int Property iStageToSet Auto Const Mandatory
Int Property iPreReqStage Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)

    Actor PlayerRef = Game.GetPlayer() 
    Quest OwningQuest = GetOwningQuest()

    If akActionRef == PlayerRef
        If !PlayerRef.IsInCombat() && OwningQuest.GetStageDone(iPreReqStage)
            OwningQuest.SetStage(iStageToSet)
        EndIf
    EndIf
EndEvent
