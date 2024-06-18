Scriptname MQ_TutorialPlayerScript extends ReferenceAlias

Keyword Property Contraband Mandatory Const Auto
Message Property Tutorial_ContrabandMSGBox Mandatory Const Auto

Auto State WaitingForPlayer
    Event OnAliasInit()
        AddInventoryEventFilter(Contraband)
    EndEvent

    Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
        If akBaseItem.HasKeyword(Contraband)
            GotoState("HasBeenTriggered")
            Tutorial_ContrabandMSGBox.Show()
            RemoveAllInventoryEventFilters()
        EndIf
    EndEvent
EndState

state HasBeenTriggered
    Event OnAliasInit()
        ;do nothing
    EndEvent

    Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
        ;do nothing
    EndEvent
EndState