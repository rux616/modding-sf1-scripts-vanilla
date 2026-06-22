Scriptname DebugSceneScript extends Scene

Event OnAction(int auiActionID, ReferenceAlias akAlias)
	Debug.TraceFunction(self + "DEBUG FUNCTION PARAMS")
    Debug.TraceStack(self + "DEBUG TRACING STACK CALLS")
EndEvent

Event OnBegin()
	Debug.TraceFunction(self + "DEBUG FUNCTION PARAMS")
    Debug.TraceStack(self + "DEBUG TRACING STACK CALLS")
EndEvent

Event OnEnd()
	Debug.TraceFunction(self + "DEBUG FUNCTION PARAMS")
    Debug.TraceStack(self + "DEBUG TRACING STACK CALLS")
EndEvent

Event OnPhaseBegin(int auiPhaseIndex)
	Debug.TraceFunction(self + "DEBUG FUNCTION PARAMS")
    Debug.TraceStack(self + "DEBUG TRACING STACK CALLS")
EndEvent

Event OnPhaseEnd(int auiPhaseIndex) 
	Debug.TraceFunction(self + "DEBUG FUNCTION PARAMS")
    Debug.TraceStack(self + "DEBUG TRACING STACK CALLS")
EndEvent