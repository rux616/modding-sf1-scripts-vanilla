Scriptname DebugQuestScript extends Quest
{Used to send debug output for quest stages}

Event OnQuestInit()
	Debug.TraceFunction(self + "DEBUG FUNCTION PARAMS")
    Debug.TraceStack(self + "DEBUG TRACING STACK CALLS")
EndEvent

Event OnReset()
	Debug.TraceFunction(self + "DEBUG FUNCTION PARAMS")
    Debug.TraceStack(self + "DEBUG TRACING STACK CALLS")
EndEvent

Event OnStageSet(int auiStageID, int auiItemID)
	Debug.TraceFunction(self + "DEBUG FUNCTION PARAMS")
    Debug.TraceStack(self + "DEBUG TRACING STACK CALLS")
EndEvent

Event OnQuestShutdown()
	Debug.TraceFunction(self + "DEBUG FUNCTION PARAMS")
    Debug.TraceStack(self + "DEBUG TRACING STACK CALLS")
endEvent

Event OnQuestStarted()
	Debug.TraceFunction(self + "DEBUG FUNCTION PARAMS")
    Debug.TraceStack(self + "DEBUG TRACING STACK CALLS")
endEvent