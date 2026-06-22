Scriptname TestPatrolScript extends ObjectReference

int currentPatrolPoint

Event OnLoad()
	currentPatrolPoint=0
	SplineTranslateToRef(PatrolMarkers[currentPatrolPoint], 200.0, Speed, 10.0)
EndEvent

Event OnTranslationAlmostComplete()
	currentPatrolPoint=currentPatrolPoint + 1
	if( currentPatrolPoint >= PatrolMarkers.Length )
		currentPatrolPoint=0
	endif
	SplineTranslateToRef(PatrolMarkers[currentPatrolPoint], SplineMagnitude, Speed, TurnSpeed)
EndEvent

Float Property Speed Auto Const

ObjectReference[] Property PatrolMarkers Auto Const Mandatory

Float Property SplineMagnitude Auto Const

Float Property TurnSpeed = 10.0 Auto Const

