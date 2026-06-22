Scriptname TestJeffBLookScript extends Actor Conditional

Bool Property isLooking = FALSE Auto Conditional
Int Property howClose = 3000 Auto
Bool Property isClose = FALSE Auto Conditional

Actor player

Event OnLoad()
	RegisterForDetectionLOSGain(Game.GetPlayer(), self)
	player = game.getPlayer()
EndEvent

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
	;debug.notification("Player just saw me!")
	if(getDistance(player) <= howClose)
		isClose = TRUE
	else
		isClose = FALSE
	EndIf
	
	if(isClose == TRUE)
		isLooking = TRUE
		EvaluatePackage()
	EndIf
	RegisterForDetectionLOSLost(Game.GetPlayer(), self)
endEvent

Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)
    ;debug.notification("Player is not looking at me!")
    if(getDistance(player) <= howClose)
		isClose = TRUE
	else
		isClose = FALSE
	EndIf
	
	if(isClose == TRUE)
		isLooking = FALSE
		EvaluatePackage()
	EndIf
	RegisterForDetectionLOSGain(Game.GetPlayer(), self)
EndEvent