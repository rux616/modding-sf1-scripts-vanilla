Scriptname COM_CommitmentGift_ActivatorScript extends ObjectReference Const

GlobalVariable Property CommitmentGiftEnabled Mandatory Const Auto

Event OnLoad()
    if CommitmentGiftEnabled.GetValue() == 1
        Trace(self, "OnLoad() enabling because CommitmentGiftEnabled: " +  CommitmentGiftEnabled + " == 1 ")
        Enable()
    else
        Trace(self, "OnLoad() disabling because CommitmentGiftEnabled: " +  CommitmentGiftEnabled + " != 1 ")
        Disable()
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "CommitmentGift", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction


bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "CommitmentGift", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction
