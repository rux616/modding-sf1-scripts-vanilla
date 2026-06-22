Scriptname TestLinkedRefPatrolScript extends Actor

Float Property Speed = 500.0 Auto Const
Float Property SplineMagnitude = 100.0 Auto Const
Float Property TurnSpeed = 10.0 Auto Const

ObjectReference currentPoint

Event OnLoad()
	SetMotionType(Motion_Keyframed)
	currentPoint = GetLinkedRef()
	SplineTranslateToRef(currentPoint, SplineMagnitude, Speed, TurnSpeed)
EndEvent

Event OnTranslationAlmostComplete()
	currentPoint = currentPoint.GetLinkedRef()
	SplineTranslateToRef(currentPoint, SplineMagnitude, Speed, TurnSpeed)
EndEvent