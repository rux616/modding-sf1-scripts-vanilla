Scriptname TestAvoidanceChangeAVTimer extends ObjectReference

ActorValue Property TestAvoidance_Start Auto Const
ObjectReference Property Pirate Auto Const
ObjectReference Property PatrolMarker Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    PatrolMarker.SetPosition(Utility.RandomFloat(1, 20), Utility.RandomFloat(-34, -50), -32)
    StartTimer(Utility.RandomFloat(0, 3.0))
EndEvent

Event OnTimer(int aiTimerID)		
	(Pirate as Actor).SetValue(TestAvoidance_Start, 1)
    (Pirate as Actor).EvaluatePackage()
EndEvent

