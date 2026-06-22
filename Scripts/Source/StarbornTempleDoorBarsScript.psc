Scriptname StarbornTempleDoorBarsScript extends ObjectReference
{Script for the Starborn Temple Door Bars.}

Group BaseProperties CollapsedOnRef
	float property AnimateDistanceOpen = 6.0 Auto Const
	float property AnimateDistanceClose = 10.0 Auto Const
	String property OpenAnimation = "Play01" Auto Const
	String property CloseAnimation = "Play02" Auto Const
EndGroup

Group RefProperties CollapsedOnBase
	bool property ShouldRegisterForOpenEvent = True Auto ;NOT Const
EndGroup


Event OnLoad()
	if (ShouldRegisterForOpenEvent)
		RegisterForDistanceLessThanEvent(Self, Game.GetPlayer(), AnimateDistanceOpen)
	EndIf
EndEvent

Function SetShouldRegisterForOpenEvent(bool shouldRegister)
	ShouldRegisterForOpenEvent = shouldRegister
	if (shouldRegister)
		RegisterForDistanceLessThanEvent(Self, Game.GetPlayer(), AnimateDistanceOpen)
	Else
		UnregisterForDistanceEvents(Self, Game.GetPlayer())
	EndIf
EndFunction


Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	PlayAnimationAndWait(OpenAnimation, "Done")
   	RegisterForDistanceGreaterThanEvent(Self, Game.GetPlayer(), AnimateDistanceClose)
EndEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	PlayAnimationAndWait(CloseAnimation, "Done")
   	RegisterForDistanceLessThanEvent(Self, Game.GetPlayer(), AnimateDistanceOpen)
EndEvent