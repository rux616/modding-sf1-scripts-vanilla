Scriptname OE_KT_FoodGiftFilter extends ReferenceAlias

Group Script_Specific_Properties
    FormList Property ItemFilter Auto Const Mandatory
    Int Property StageToSet Auto Const Mandatory
EndGroup

Event OnAliasInit()
	AddInventoryEventFilter(ItemFilter)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
        if akSourceContainer == Game.GetPlayer()
            GetOwningQuest().SetStage(StageToSet)
        endif
EndEvent