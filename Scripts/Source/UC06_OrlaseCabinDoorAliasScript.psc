Scriptname UC06_OrlaseCabinDoorAliasScript extends ReferenceAlias

Key Property UC06_OrlaseCabinKey Mandatory Const Auto
{Item to check if the player has to see if we should set this stage}

int Property ShutdownStage = 450 Auto Const
{Player already unlocked the door. Can now ignore setting this stage.}

int Property StageToSet = 445 Auto Const
{Stage to set if all criteria's met}

Event OnTriggerEnter(ObjectReference akActionRef)
    Quest OQ = GetOwningQuest()
    Actor PlayACT = Game.GetPlayer()

    if akActionRef == PlayACT

        if !OQ.GetStageDone(StagetoSet) && !OQ.GetStageDone(ShutdownStage) && PlayACT.GetItemCount(UC06_OrlaseCabinKey) < 1
            OQ.SetStage(StageToSet)
        endif
    endif
EndEvent