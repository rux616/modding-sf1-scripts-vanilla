Scriptname UC08_AB_CollCleanUpScript extends RefCollectionAlias

int Property CleanUpStage = 900 Auto Const
{Once this stage is set, start cleaning up the NPCs}

Event OnUnload(ObjectReference akSenderRef)
    if GetOwningQuest().GetStageDone(CleanUpStage)
        akSenderRef.Disable()
    endif
EndEvent