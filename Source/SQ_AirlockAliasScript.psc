Scriptname SQ_AirlockAliasScript extends RefCollectionAlias const

Event OnInit()
    Trace(self, "OnInit()")
EndEvent

Event OnUnload(ObjectReference akSenderRef)
    ;when actors unload, we remove them from the alias... they will get re-added by trigger volumes

    Trace(self, "OnUnload() calling RemoveRef() for: akSenderRef: " + akSenderRef)
    RemoveRef(akSenderRef)
EndEvent


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Airlock",  string SubLogName = "AliasScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Airlock",  string SubLogName = "AliasScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction