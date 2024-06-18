Scriptname UC08_AnomalyAliasScript extends ReferenceAlias

int Property StageToSet = 528 Const Auto
{Stage to set when the "OnDying" event for this NPC is triggered}

Event OnDying(ObjectReference akKiller)
    if !GetOwningQuest().GetStageDone(StageToSet)
        GetOwningQuest().SetStage(StageToSet)
    endif
EndEvent