Scriptname UC_GG_Connect_EmptyTriggerCollScript extends RefCollectionAlias

int Property PrereqStage = 200 Auto Const
{Only start shutting off trigger once this stage is set}

int Property ShutdownStage = 350 Auto Const
{Once this stage is set, we can stop checking (because the player's already found the right one)}

int Property ObjectiveIndex = 200 Auto Const
{Objective index we're modifying as each one of these triggers is updated}

GlobalVariable Property UC_GG_Connect_StopsCompleted Mandatory Const Auto
{Global used to track how many triggers the player's entered}

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        Quest OQ = GetOwningQuest()

        if OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(ShutdownStage)
            RemoveRef(akSenderRef)
            OQ.ModObjectiveGlobal(1.0, UC_GG_Connect_StopsCompleted, aiObjectiveID = ObjectiveIndex)
        endif      
    EndIf
EndEvent