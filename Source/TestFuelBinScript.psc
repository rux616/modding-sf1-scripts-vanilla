Scriptname TestFuelBinScript extends ObjectReference
{attempts to refuel the spaceship it is in}

MiscObject Property FuelObject Auto

Float Property FuelScorePerObject Auto Const
Float Property MaxPossibleFuel Auto Const

ActorValue Property FuelActorValue Auto Const
Quest Property myQuest Auto Const
Int Property StageToSet Auto Const
Int Property PrereqStage = -1 Auto Const
Int Property FuelNeededToSetStage = 10 Auto Const

Event OnLoad()
	AddInventoryEventFilter(FuelObject)
endEvent

Event OnClose(ObjectReference akActionRef)
	;note this doesn't work right now; i don't know how to make a container that gets a close event
	ObjectReference spaceship
	spaceship = GetCurrentShipRef()
	if (GetItemCount(FuelObject) > 0 && spaceship && spaceship.GetValue(FuelActorValue) < 100.0)
		RemoveItem(FuelObject)
		ModValue(FuelActorValue, FuelScorePerObject)
	endIf
endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
	ObjectReference spaceship
	spaceship = GetCurrentShipRef()
	if( spaceship )
		float currentFuel = spaceship.GetValue(FuelActorValue)
		int numFuel = GetItemCount(FuelObject)
		if( FuelScorePerObject*numFuel + currentFuel > MaxPossibleFuel )
			numFuel = Math.Floor( (MaxPossibleFuel-currentFuel) / FuelScorePerObject )
		endIf
		RemoveItem(FuelObject, numFuel)
		spaceship.ModValue(FuelActorValue, FuelScorePerObject*numFuel)
	endIf

	;update quest if necessary
	If (spaceship.GetValue(FuelActorValue) as Int) >= FuelNeededToSetStage
		If (PrereqStage == -1) || (myQuest.GetStageDone(PrereqStage) == 1)
			myQuest.SetStage(StageToSet)
		EndIf
	EndIf
endEvent