Scriptname TestPlayerCrimeEventScript extends Actor Const

Event OnInit()
    Trace(self, "OnInit()")
EndEvent

Event OnPlayerCrimeGold(ObjectReference akVictim, Form akFaction, int aeCrimeGold, int aeCrimeType)
    Trace(self, "OnPlayerCrimeGold() akVictim: " + akVictim + ", akFaction: " + akFaction + ", aeCrimeGold: " + aeCrimeGold + ", aeCrimeType: " + aeCrimeType)
EndEvent

Event OnPlayerAssaultActor(ObjectReference akVictim, Location akLocation, bool aeCrime)
    Trace(self, "OnPlayerAssaultActor() akVictim: " + akVictim + ", akLocation: " + akLocation + ", aeCrime: " + aeCrime)
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Test",  string SubLogName = "TestPlayerCrimeEventScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Test",  string SubLogName = "TestPlayerCrimeEventScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction

