Scriptname MS04PlayerScript extends ReferenceAlias

Book Property Slate1 Auto Const
Book Property Slate02 Auto Const
FormList Property MS04SlateFilter Auto Const Mandatory

Event OnAliasInit()
	AddInventoryEventFilter(MS04SlateFilter)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    Debug.Trace("MS04 Player: Item Added = "+akBaseItem)

    ; Did the player pick up Alice's first slate?
    if akBaseItem == Slate1
        GetOwningQuest().SetStage(355)
    endif

    ; Did the player pick up Alice's second slate?
    if akBaseItem == Slate02
        GetOwningQuest().SetStage(360)
    endif
EndEvent

