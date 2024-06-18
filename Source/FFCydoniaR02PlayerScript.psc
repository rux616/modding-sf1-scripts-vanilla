Scriptname FFCydoniaR02PlayerScript extends ReferenceAlias

GlobalVariable Property FFCydoniaR02_EquipmentNeededCount Mandatory Const Auto
Int Property TurnInStage = 300 Const Auto
Weapon Property Eon Mandatory Const Auto

Function RegisterPlayerForItemTracking()
    AddInventoryEventFilter(Eon)
    ItemCheck()
EndFunction

Function ItemCheck()
    If GetRef().GetItemCount(Eon) >= FFCydoniaR02_EquipmentNeededCount.GetValue()
        GetowningQuest().SetStage(TurnInStage)
        RemoveInventoryEventFilter(Eon)
    EndIf
EndFunction

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    If akBaseItem == Eon && !GetOwningQuest().GetStageDone(TurnInStage)
        ItemCheck()
    EndIf
EndEvent

Event OnAliasInit()
    RegisterPlayerForItemTracking()
EndEvent