Scriptname MQ204SarahScript extends ReferenceAlias

Int StagePlayerLeftLodge = 420

Int StageToSetLeftLodge = 440

Event OnActivate(ObjectReference akActionRef)
    Quest myMQ204 = GetOwningQuest()
    If akActionRef == Game.GetPlayer()
        If myMQ204.GetStageDone(StagePlayerLeftLodge)
            myMQ204.SetStage(StageToSetLeftLodge)
        EndIf
    EndIf
EndEvent