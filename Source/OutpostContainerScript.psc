Scriptname OutpostContainerScript extends ObjectReference
{put this on containers that we want to update linked containers when the player modifies inventory}

Event OnLoad()
    RegisterForEvents(true)
EndEvent

Event OnUnload()
    RegisterForEvents(false)
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
    RegisterForEvents(false)
EndEvent

auto State ready
    Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
        if akSourceContainer == Game.GetPlayer()
            GotoState("busy")
            debug.trace(self + " OnItemAdded akSourceContainer=" + akSourceContainer + " aiTransferReason=" + aiTransferReason)
            MoveContainerContentToUnfilledContainers()
            GotoState("ready")
        endif
    EndEvent

    Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
        if akDestContainer == Game.GetPlayer()
            GotoState("busy")
            debug.trace(self + " OnItemRemoved akDestContainer=" + akDestContainer + " aiTransferReason=" + aiTransferReason)
            MoveContainerContentToUnfilledContainers()
            GotoState("ready")
        endif
    EndEvent

    Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
        if abOpening
            debug.trace(self + " OnMenuOpenCloseEvent asMenuName=" + asMenuName)
            GotoState("busy")
        endif
    endEvent
EndState

state busy
    Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
        if abOpening == false
            debug.trace(self + " OnMenuOpenCloseEvent asMenuName=" + asMenuName)
            MoveContainerContentToUnfilledContainers()
            gotoState("ready")
        endif
    endEvent
    Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
        ; do nothing
    EndEvent

    Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
        ; do nothing
    EndEvent
EndState

function RegisterForEvents(bool bRegister)
    if bRegister
        RegisterForMenuOpenCloseEvent("ContainerMenu")
        AddInventoryEventFilter(NONE)
        gotoState("ready")
    Else
        UnregisterForMenuOpenCloseEvent("ContainerMenu")
        RemoveAllInventoryEventFilters()
    EndIf
endFunction
