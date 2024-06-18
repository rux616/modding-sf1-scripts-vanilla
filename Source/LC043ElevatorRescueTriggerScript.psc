Scriptname LC043ElevatorRescueTriggerScript extends ObjectReference Const
{Script for the elevator triggers in LC043.}
;
;These triggers have interaction conditions restricted to the actors in LC043.

;When an actor enters the trigger, if they're from a different cell, eject them.
Event OnTriggerEnter(ObjectReference akActionRef)
    if (akActionRef.GetEditorLocation() != akActionRef.GetCurrentLocation())
        akActionRef.MoveToMyEditorLocation()
    EndIf
EndEvent