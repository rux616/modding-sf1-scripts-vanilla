Scriptname MQ101FuelBinScript extends ReferenceAlias

MiscObject Property FuelObject Auto
Int Property FuelNeeded Auto
ActorValue Property SpaceshipGravJumpFuel Auto

Event OnLoad()
	AddInventoryEventFilter(FuelObject)
endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
	If akBaseItem == FuelObject
		;check to see if we have enough fuel
		If (Self.GetRef().GetItemCount(FuelObject) >= FuelNeeded) || (Self.GetRef().GetCurrentShipRef().GetValue(SpaceshipGravJumpFuel) as Int) >= FuelNeeded
			GetOwningQuest().SetStage(900)
		EndIf
	EndIf
EndEvent