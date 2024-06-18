Scriptname MS06ResetActorsScript extends ObjectReference Const

Quest property DialogueECSConstant auto const

Event OnReset()
    DialogueECSConstantQuestScript questScript = DialogueECSConstant as DialogueECSConstantQuestScript

    questScript.GenericNPCs.ResetAll()
EndEvent