Scriptname LoadElevatorRequestFloorOnActivate extends ObjectReference
; This script exists on Activators (like elevator buttons), which the player can use to travel between elevator floors.
; When its reference is activated, this script calls RequestFloorTravel() on the LoadElevatorManagerScript which controls its elevator system. This is how the Player travels between elevator floors.
;
; For more information, look for "Load elevator implementation details" on confluence

int currentFloorIndex = -1
LoadElevatorManagerScript loadElevatorManager

; Called during initialization, to populate this Activator with the data it needs to make floor travel requests.
function AssignLoadElevatorData(int newCurrentFloorIndex, LoadElevatorManagerScript newLoadElevatorManager)
	currentFloorIndex = newCurrentFloorIndex
	loadElevatorManager = newLoadElevatorManager
endFunction

function AssignButtonName(Message buttonNameMessage)
	SetOverrideName(buttonNameMessage)
endFunction

auto state WaitingForPlayerToRequestFloorTravel
; Call the LoadElevatorManagerScript to make a floor travel request
event OnActivate(ObjectReference akActionRef)
	GotoState("RequestingFloorTravel")

	if(currentFloorIndex != -1 && loadElevatorManager != NONE && akActionRef == Game.GetPlayer())
		if(loadElevatorManager == None)
			DefaultScriptFunctions.Trace(self, "LoadElevatorManagerScript not found.", true, "LoadElevators")
		else
			loadElevatorManager.RequestFloorTravel(currentFloorIndex, akActionRef)
		endIf
	endIf

	GotoState("WaitingForPlayerToRequestFloorTravel")
endEvent
endState

state RequestingFloorTravel
event OnActivate(ObjectReference akActionRef)
endEvent
EndState