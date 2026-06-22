Scriptname FFCydoniaZ07PlayerScript extends ReferenceAlias


MiscObject Property FFCydoniaZ07_HeartOfMarsTitanium Mandatory Const Auto
ReferenceAlias Property HeartOfMarsInv Mandatory Const Auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    If akBaseItem == FFCydoniaZ07_HeartOfMarsTitanium
        HeartOfMarsInv.ForceRefTo(akItemReference)
    EndIf
EndEvent


Event OnAliasInit()
    AddInventoryEventFilter(FFCydoniaZ07_HeartOfMarsTitanium)
EndEvent