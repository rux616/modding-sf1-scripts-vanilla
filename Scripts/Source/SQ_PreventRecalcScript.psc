Scriptname SQ_PreventRecalcScript extends Quest

RefCollectionAlias Property Refs Mandatory Const Auto
{autofill}

Function AddRef(ObjectReference RefToAdd)
    if IsRunning() == false
        Trace(self, "AddRef(), quest not running. Calling Start()")
        Start()
    endif

    Trace(self, "AddRef() RefToAdd: " + RefToAdd)
    Refs.AddRef(RefToAdd)
EndFunction

Function RemoveRef(ObjectReference RefToRemove)
    Refs.RemoveRef(RefToRemove)
endFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_PreventRecalc",  string SubLogName = "SQ_PreventRecalcScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_PreventRecalc",  string SubLogName = "SQ_PreventRecalcScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction