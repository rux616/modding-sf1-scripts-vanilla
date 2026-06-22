Scriptname CuttableWallOnOpenScript extends ReferenceAlias

Keyword Property LinkCustom02 Mandatory Const Auto
Int Property QuestStageToSet Const Auto
Int Property QuestPrereqStage = -1 Const Auto
Int Property QuestTurnOffStage = -1 Const Auto

Event OnLoad()
    ;get the OnOpen event from the linked ref because this is a dynamically instanced packin
    RegisterForRemoteEvent(Self.GetRef().GetLinkedRef(LinkCustom02), "OnOpen")
EndEvent

Event ObjectReference.OnOpen(ObjectReference akSender, ObjectReference akActionRef)
    Quest MyQuest = GetOwningQuest()
    MyQuest.SetStage(QuestStageToSet)
EndEvent