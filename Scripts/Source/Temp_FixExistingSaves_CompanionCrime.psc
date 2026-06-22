Scriptname Temp_FixExistingSaves_CompanionCrime extends Actor

bool Done

faction Property PersonalCrimeFaction Mandatory Const Auto

Event OnInit()
    if Done == false
        Trace(self, "OnInit()")
        ((Self as Actor) as CompanionCrimeResponseScript).RegisterForEvents()
        SetValue(Game.GetAggressionAV(), 1)

        SetCrimeFaction(PersonalCrimeFaction)

        Done = true
    EndIf
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "TEMP",  string SubLogName = "Temp_FixExistingSaves_CompanionCrime", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "TEMP",  string SubLogName = "Temp_FixExistingSaves_CompanionCrime", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction

