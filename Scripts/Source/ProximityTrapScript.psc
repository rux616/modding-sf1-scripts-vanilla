Scriptname ProximityTrapScript extends ObjectReference Const
{Damages itself when linked trigger is entered.}

float Property TimeToExplode = 3.0 Const Auto
float Property DamageToDo = 100.0 Const Auto

string property SequenceName = "Play01" auto const
	{Effect Sequence to play when this is activated.}
ObjectReference Property TargetArt Auto const

WwiseEvent Property WarningSound Const Auto
Keyword Property IgnoredByTrapFloraKeyword Mandatory Const Auto

Event OnCellLoad()
    if(GetLinkedRef())
        RegisterForRemoteEvent(GetLinkedRef(), "OnTriggerEnter")
        RegisterForRemoteEvent(GetLinkedRef(), "OnTriggerLeave")
    EndIf
EndEvent

Event OnUnload()
    UnregisterForAllEvents()
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
    if!(akActionRef.HasKeyword(IgnoredByTrapFloraKeyword))
        if(timeToExplode != 0.0)
            StartTimer(timeToExplode)
            ;Start Warning VFX
            ;Start Warning Sound
            WarningSound.Play(self)
        Else
            Explode()
	     TargetArt.StartSequence(SequenceName, true)
	 
        EndIf
    EndIf
EndEvent

Event OnTimer(int aiTimerID)
    Explode()
EndEvent

Function Explode()
    DamageObject(DamageToDo)
    UnregisterForAllEvents()
    ;Stop Warning VFX
    ;Stop Warning Sound
EndFunction