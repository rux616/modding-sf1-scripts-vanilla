Scriptname OE_DialogueAVScript extends Quest
{script to handle setting actorvalues that will be used as conditions for dialogue}

Group Autofill
    ActorValue Property OE_Civilians_DIAL_CanIHelp Mandatory Const Auto
    ActorValue Property OE_Civilians_DIAL_WhatsGoingOn Mandatory Const Auto
    ActorValue Property OE_Civilians_DIAL_HowsLife Mandatory Const Auto
    ActorValue Property OE_Civilians_DIAL_Topic04 Mandatory Const Auto
EndGroup

Function SetCanIHelp(ObjectReference SpeakerRef, int InfoNumber)
    Trace(self, "SetCanIHelp() SpeakerRef: " + SpeakerRef + ", InfoNumber: " + InfoNumber)
    SpeakerRef.SetValue(OE_Civilians_DIAL_CanIHelp, InfoNumber)
EndFunction

Function SetWhatsGoingOn(ObjectReference SpeakerRef, int InfoNumber)
    Trace(self, "SetWhatsGoingOn() SpeakerRef: " + SpeakerRef + ", InfoNumber: " + InfoNumber)
    SpeakerRef.SetValue(OE_Civilians_DIAL_WhatsGoingOn, InfoNumber)
EndFunction

Function SetHowsLife(ObjectReference SpeakerRef, int InfoNumber)
    Trace(self, "SetHowsLife() SpeakerRef: " + SpeakerRef + ", InfoNumber: " + InfoNumber)
    SpeakerRef.SetValue(OE_Civilians_DIAL_HowsLife, InfoNumber)
EndFunction

Function SetTopic04(ObjectReference SpeakerRef, int InfoNumber)
    Trace(self, "SetTopic04() SpeakerRef: " + SpeakerRef + ", InfoNumber: " + InfoNumber)
    SpeakerRef.SetValue(OE_Civilians_DIAL_Topic04, InfoNumber)
EndFunction

;convenient to place here as dialogue is already using this script as kmyquest in info fragments
Function ShowMissionTerminalObjective(ObjectReference SpeakerRef)
    ((self as quest) as OE_MissionTerminalQuestScript).PlayerToldAboutMissionTerminal(SpeakerRef)
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "OverlayEncounters",  string SubLogName = "OE_DialogueAVScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "OverlayEncounters",  string SubLogName = "OE_DialogueAVScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction