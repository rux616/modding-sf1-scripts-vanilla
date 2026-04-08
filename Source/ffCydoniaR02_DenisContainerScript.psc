Scriptname ffCydoniaR02_DenisContainerScript extends ReferenceAlias

GlobalVariable Property FFCydoniaR02_EquipmentNeededCount Mandatory Const Auto
Int Property PlacedInBinStage = 400 Const Auto

Form myItem


Function CheckItemCount()
    Int iItemsNeeded = FFCydoniaR02_EquipmentNeededCount.GetValue() as Int
    If myItem != None
        If GetRef().GetItemCount(myItem) >= iItemsNeeded
            GetOwningQuest().SetStage(PlacedInBinStage)
        EndIf
    EndIf
EndFunction

Function SetupData(Form akItemForm)
    AddInventoryEventFilter(akItemForm)
    myItem = akItemForm
EndFunction


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    CheckItemCount() 
EndEvent