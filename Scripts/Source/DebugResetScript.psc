Scriptname DebugResetScript extends ObjectReference

Event OnReset()
	Debug.Trace("Got OnReset")
EndEvent

Event OnCellLoad()
	Debug.Trace("Got OnCellLoad")
EndEvent
