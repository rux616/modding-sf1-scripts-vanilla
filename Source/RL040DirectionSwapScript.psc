Scriptname RL040DirectionSwapScript extends ObjectReference Const

ObjectReference Property PirateLeader Mandatory Const Auto
ObjectReference Property PirateLeaderMoveToMarker Mandatory Const Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    PirateLeader.MoveTo(PirateLeaderMoveToMarker, abMatchRotation = true)
EndEvent