Scriptname LC039QTTriggerScript extends ObjectReference Const

Quest Property LC039Quest Mandatory Const Auto
int Property QuestStage Mandatory Const Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    LC039Quest.SetStage(QuestStage)
EndEvent