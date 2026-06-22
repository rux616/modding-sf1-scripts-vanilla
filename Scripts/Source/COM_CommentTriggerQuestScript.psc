Scriptname COM_CommentTriggerQuestScript extends Quest
{Used to handle scene driven AffinityEvent sending initiaited by COM_CommentTriggerScript}

Scene Property CommentScene Mandatory Const Auto
ReferenceAlias Property Alias_Companion Mandatory Const Auto
ReferenceAlias Property Alias_CommentTrigger Mandatory Const Auto
ReferenceAlias Property Alias_Target Mandatory Const Auto

;should be called somewhere in CommentScene
Function SendAffinityEvent()
	CompanionActorScript CompanionRef = Alias_Companion.GetActorReference() as CompanionActorScript
	COM_CommentTriggerScript CommentTriggerRef = Alias_CommentTrigger.GetReference() as COM_CommentTriggerScript
	ObjectReference TargetRef = Alias_Target.GetReference()

	Trace(self, "SendAffinityEvent() CommentTriggerRef: " + CommentTriggerRef + ", CompanionRef: " + CompanionRef + ", TargetRef: " + TargetRef)

	if CommentTriggerRef && CompanionRef
		CommentTriggerRef.SendAffinityEvent(CompanionRef, TargetRef)
	Else
		Warning(self, "SendAffinityEvent() CompanionRef OR CommentTriggerRef is NONE!!! Cannot send affinity event.")
	endif
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "CommentTrigger", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "CommentTrigger", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction