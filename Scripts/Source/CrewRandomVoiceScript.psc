Scriptname CrewRandomVoiceScript extends Actor

Group Autofill
	FormList Property CREW_VoiceTypes_Generic Mandatory Const Auto
EndGroup

bool voiceTypeSet = false

function TryToSetCrewVoiceType()
	bool enabled = IsEnabled()
	bool loaded = Is3DLoaded()

	if !voiceTypeSet && enabled && loaded
		GoToState("Done")
		Trace(self, "TryToSetCrewVoiceType() passed conditions, setting voicetype. voiceTypeSet: " + voiceTypeSet + ", enabled: " + enabled + ", loaded: " + loaded)
		voiceTypeSet = true
		VoiceType forcedVoice = SetOverrideVoiceTypeRandom(CREW_VoiceTypes_Generic)
		Trace(self, "TryToSetCrewVoiceType() forcedVoice: " + forcedVoice)
	else
		Trace(self, "TryToSetCrewVoiceType() failed conditions, voicetype not set. voiceTypeSet: " + voiceTypeSet + ", enabled: " + enabled + ", loaded: " + loaded)
	endif
endFunction

Auto State Waiting
	Event OnLoad()
		Trace(self, "OnLoad() Trying to set crew voice type")
		TryToSetCrewVoiceType()
	EndEvent
EndState

State Done
	Event OnLoad()
		; Do nothing.
	endEvent
EndState

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Crew",  string SubLogName = "CrewRandomVoiceScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Crew",  string SubLogName = "CrewRandomVoiceScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction