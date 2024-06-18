Scriptname TestDisplayCaseScript extends ObjectReference Const

Event OnLoad()
    AddInventoryEventFilter(NONE)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    debug.trace(self + " OnItemAdded " + akBaseItem)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
    debug.trace(self + " OnItemRemoved " + akBaseItem)
EndEvent

function testGetItemCount()
    debug.trace(self + " GetItemCount=" + GetItemCount())
endFunction