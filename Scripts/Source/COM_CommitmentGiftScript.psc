Scriptname COM_CommitmentGiftScript extends ObjectReference Const

GlobalVariable Property CommitmentGiftEnabled Mandatory Const Auto
Quest Property SQ_Companions Mandatory Const Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
Actor PlayerRef = Game.GetPlayer()
    if akNewContainer == PlayerRef
        Trace(self, "OnContainerChanged() player gained gift, set global to 1: CommitmentGiftEnabled: " + CommitmentGiftEnabled)
        CommitmentGiftEnabled.SetValue(1)
    endif
    if akOldContainer == PlayerRef
        Trace(Self, "OnContainerChanged() player created outpost item. Remove " + Self)
        (SQ_Companions as SQ_CompanionsScript).CommitmentGifts.RemoveRef(Self)
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
