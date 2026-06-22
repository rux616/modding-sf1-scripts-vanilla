Scriptname SFBGS003:SFBGS003_WantedPosterRefScript extends ObjectReference

Group Autofill
    SFBGS003_SQ_WantedPostersQuestScript Property SFBGS003_SQ_WantedPosters Mandatory Const Auto
    {System quest script that houses wanted poster functions and an array of trackers alliance quests}
EndGroup


Event OnActivate(ObjectReference akActionRef)
    SFBGS003_SQ_WantedPosters.WantedPosterActivated(self)
EndEvent


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "WantedPoster",  string SubLogName = "Ref_Script", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "WantedPoster",  string SubLogName = "Ref_Script", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction