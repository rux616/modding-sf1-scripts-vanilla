Scriptname UC03_LouSceneComplete extends Scene Const

int Property PlanSceneCompleteStage = 442 Const Auto
{Stage that should be set if the player has heard Lou's plan}

int Property AgreetoHelpJakobStage = 500 Const Auto
{Stage that should be set if the player agreed to help}

int Property CambridgeShoutsStage = 510 Const Auto
{Stage to set once the player knows the plan}

Event OnEnd()
    Quest myQuest = GetOwningQuest()
    if myQuest.GetStageDone(PlanSceneCompleteStage) && myQuest.GetStageDone(AgreetoHelpJakobStage)
        myQuest.SetStage(CambridgeShoutsStage)
    endif
EndEvent
