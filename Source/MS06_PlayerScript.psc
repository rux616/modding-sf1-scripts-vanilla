Scriptname MS06_PlayerScript extends ReferenceAlias

FormList Property MS06_ResourceTypes Mandatory Const Auto


Function RegisterPlayerForResourceTracking()
    AddInventoryEventFilter(MS06_ResourceTypes)
    RunCheckResources()
EndFunction


;runs the ResourceCheck script on MS06_QuestScript
Function RunCheckResources()
    Quest myQuest = GetOwningQuest()
    MS06_QuestScript myQIScript = myQuest as MS06_QuestScript
    myQIScript.ResourceCheck()
EndFunction



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Event OnAliasInit()
    RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    RunCheckResources()
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
    RunCheckResources()
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
    Quest myQuest = GetOwningQuest()
    MS06_QuestScript myQIScript = myQuest as MS06_QuestScript

    If auiStageID == myQiScript.GatherResourcesStage
        RegisterPlayerForResourceTracking()
    ElseIf auiStageID == myQiScript.ResourcesCompletedStage
        RemoveInventoryEventFilter(MS06_ResourceTypes)
    EndIf
EndEvent