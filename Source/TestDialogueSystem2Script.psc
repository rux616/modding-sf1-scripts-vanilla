Scriptname TestDialogueSystem2Script extends Quest

Event OnAffinityEventSent(AffinityEvent akAffinityEvent, ObjectReference akTarget)
	debug.trace("Receiving Affinity Event on Quest Script: " + akAffinityEvent)
EndEvent