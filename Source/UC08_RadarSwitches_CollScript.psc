Scriptname UC08_RadarSwitches_CollScript extends RefCollectionAlias

int Property PrereqStage = 526 Auto Const
{Only process these activations once the player has reached the right point in the sequence}

int Property ShutdownStage = 530 Auto Const
{If the Queen's dead, don't sweat processing any more}

int Property StageToSet = 529 Auto Const
{Stage to set once all switches are thrown}

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    Quest OQ = GetOwningQuest()

    if OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(ShutdownStage)
        RemoveRef(akSenderRef)

        if GetCount() <= 0
            OQ.SetStage(StageToSet)
        endif
    endif
EndEvent