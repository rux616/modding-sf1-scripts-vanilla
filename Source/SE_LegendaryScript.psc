Scriptname SE_LegendaryScript extends Quest

; This function moves the legendary ship to a new location
bool Function MoveShip()
	bool isShipMoving
	if PlayerShip.GetRef().GetDistance(LegendaryShip.GetRef()) > PlayerDistanceCheck 
		; Change the orbit location (where the legendary ship is - and move it)
		OrbitLocation.RefillAlias()

		; Need to account if this does not fill. We shouldn't stop the space cell quest and leave the objectives if this did not fill with anything
		if OrbitLocation.GetLocation() != None
		isShipMoving = true
		;End the old quest - which had the legendary ship in its old location
		SE_ZW08_SpaceCell.Stop()

		;Timing issue fix. It appears the space cell quest is failing to start up if start is called immediately after the shutdown
		while (SE_ZW08_SpaceCell.IsStopped()) == false
			Utility.Wait(0.5)
		endWhile

		;Spin up the quest where the bad guys live
		SE_ZW08_SpaceCell.Start()
		endif

		; Cycle the objective (if you have it) - so it's now current
		if ( IsObjectiveDisplayed(10) ) && OrbitLocation.GetLocation() != None
			SetObjectiveDisplayed(10, TRUE, TRUE)
		endif
		Alias_MapMarker.GetRef().SetMarkerDiscovered()
	endif
	return isShipMoving
EndFunction

Event OnTimerGameTime(int aiTimerID)
    Debug.Trace(SELF + " has had its timer pop.")
	if aiTimerID == timerID
		if MoveShip() == false
			StartMoveTimer() ; Every two days the ship will try to move
		endif
	EndIf
EndEvent

Function StartMoveTimer()
    StartTimerGameTime(GameHours, timerID)
EndFunction

Function DebugTimerNow()
    CancelTimerGameTime(1)
    StartTimerGameTime(0.000001, 1)
EndFunction

LocationAlias Property OrbitLocation Auto Const
Quest Property SE_ZW08_SpaceCell Auto Const Mandatory
ReferenceAlias Property playerShip Auto Const
ReferenceAlias Property LegendaryShip Auto Const
ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
int Property timerID = 1 Auto Const
int Property GameHours = 48 Auto Const
float Property PlayerDistanceCheck = 10000.0 Auto Const
