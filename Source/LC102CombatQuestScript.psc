Scriptname LC102CombatQuestScript extends Quest

Quest property targetQuest auto const mandatory
int property stageToSet auto const mandatory

function SetTargetQuestStage()
    if(!targetQuest.IsStageDone(stageToSet))
        targetQuest.SetStage(stageToSet)
    endIf
endFunction