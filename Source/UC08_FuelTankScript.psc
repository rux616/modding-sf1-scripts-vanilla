Scriptname UC08_FuelTankScript extends RefCollectionAlias
;Script cut from the game

int Property StageToSet = 590 Const Auto
{Stage to set when the proper switch is thrown}

int Property PrereqStage = 570 Auto Const
{Only set the stage if we're at the right part of the quest}

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    Quest OQ = GetOwningQuest()
    if OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(StageToSet)
        OQ.SetStage(StageToSet)
    endif
EndEvent