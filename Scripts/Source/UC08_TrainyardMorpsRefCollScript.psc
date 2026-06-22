Scriptname UC08_TrainyardMorpsRefCollScript extends RefCollectionAlias

int Property PrereqStage = 381 Auto Const
{Looking for this stage before we start setting anything}

int Property StagetoSet = 382 Auto Const
{Set this stage once this ref collection is empty. It's possible this could get emptied before the prereq is set. That handling is managed on stage 381.}

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
    RemoveRef(akSenderRef)
    Quest OQ = GetOwningQuest()

    if OQ.GetStageDone(PrereqStage) && GetCount() <= 0
        OQ.SetStage(StagetoSet)
    endif
EndEvent