Scriptname RECleanupEventTrigger extends ObjectReference
{used for testing - simply sends cleanup event}


REParentScript Property REParent Auto
{BASEOBJECT property - REParent quest, used to send cleanup custom event }

Event OnTriggerEnter(ObjectReference akActionRef)
	debug.trace(self + "OnTriggerEnter")
	; send cleanup event
	REParent.SendCleanupEvent()
EndEvent
