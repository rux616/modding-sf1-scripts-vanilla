Scriptname MQ101ShipInventoryScript extends ReferenceAlias

Int Property PrereqStage=680 Const Auto
Int Property TurnOffStage=900 Const Auto
Int Property StageToSet=690 Const Auto

Int HeliumCount = 10
MiscObject Property InorgCommonHelium3 Auto
Int Property HeliumStage=680 Const Auto

Event OnAliasInit()
	AddInventoryEventFilter(InorgCommonHelium3)
EndEvent

Event OnQuickContainerOpened()
    Quest myQuest = GetOwningQuest()
    If (myQuest.GetStageDone(PrereqStage)) && !(myQuest.GetStageDone(TurnOffStage))
        myQuest.SetStage(StageToSet)
    EndIf
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
	Quest myQuest = GetOwningQuest()
    ObjectReference myRef = Self.GetRef()

	If (akBaseItem == InorgCommonHelium3)
		If myRef.GetItemCount(InorgCommonHelium3) >= HeliumCount
			myQuest.SetStage(HeliumStage)
			RemoveInventoryEventFilter(InorgCommonHelium3)
		EndIf
	EndIF
EndEvent