Scriptname CityCYRedTape01PlayerScript extends ReferenceAlias

MiscObject Property InorgCommonIron Mandatory Const Auto


Function RegisterPlayerForResourceTracking(bool bRegister=true)
    debug.trace(self + " RegisterPlayerForResourceTracking " + bRegister)
    if bRegister
        AddInventoryEventFilter(InorgCommonIron)
        RunCheckResources()
    Else
        RemoveInventoryEventFilter(InorgCommonIron)
    endif
EndFunction


;runs the ResourceCheck script on CityCYRedTape01QuestScript
Function RunCheckResources()
    Quest myQuest = GetOwningQuest()
    CityCYRedTape01QuestScript myQIScript = myQuest as CityCYRedTape01QuestScript
    myQIScript.ResourceCheck()
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    debug.trace(self + " OnItemAdded " + akBaseItem)
    RunCheckResources()
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
    debug.trace(self + " OnItemRemoved " + akBaseItem)
    RunCheckResources()
EndEvent



