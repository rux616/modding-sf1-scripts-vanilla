Scriptname COM_ConvoQuestScript extends Quest

Quest Property QuestToSet Mandatory Const Auto
{Convo tracking quest whose stage we should set.}

int Property StageToSet Mandatory Const Auto
{what stage to set in QuestToSet when "kmyquest.SceneCompleted()" is called from scene fragmen}

Function SceneCompleted()
	QuestToSet.SetStage(StageToSet)
EndFunction