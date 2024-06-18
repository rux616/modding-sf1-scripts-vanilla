Scriptname OE_MissionTerminalQuestScript extends Quest


Group Autofill
    LocationAlias Property CurrentMissionTerminalLocation Mandatory Const Auto
    ReferenceAlias Property CurrentMissionTerminal Mandatory Const Auto
EndGroup

int Property MissionTerminalObjective = 10 Const Auto

;called from dialogue
Function PlayerToldAboutMissionTerminal(ObjectReference SpeakerRef)
    Location currentLocation = SpeakerRef.GetCurrentLocation()
    
    CurrentMissionTerminalLocation.ForceLocationTo(currentLocation)

    CurrentMissionTerminal.ClearAndRefillAlias() ;LocRef fill type using CurrentMissionTerminalLocation

    ObjectReference currentTerminalRef = CurrentMissionTerminal.GetReference()

    Trace(self, "PlayerToldAboutMissionTerminal SpeakerRef: " + SpeakerRef + ",  currentLocation  : " +  currentLocation + ", currentTerminalRef: " + currentTerminalRef)
    
    if currentTerminalRef
        SetObjectiveActive(MissionTerminalObjective)
    else
        SetObjectiveSkipped(MissionTerminalObjective)
    endif
EndFunction

;called by OE_MissionTerminalAliasScript
Function PlayerActivateMissionTerminal()
    Trace(self, "PlayerActivateMissionTerminal()")
    SetObjectiveCompleted(MissionTerminalObjective)
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "OverlayEncounters",  string SubLogName = "OE_MissionTerminalQuestScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "OverlayEncounters",  string SubLogName = "OE_MissionTerminalQuestScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction