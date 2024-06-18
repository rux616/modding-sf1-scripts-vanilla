Scriptname ENV_Temp_BiomePackinSpawnScript extends ObjectReference const
{This is a temporary script until Biome Markers can place Packins directly}

string Property PackinEditorID Mandatory Const Auto 

Event OnInit()
	
	string refHexFormID = Utility.IntToHex(GetFormID())

	string consoleCommand = refHexFormID + ".placeatme " + PackinEditorID

	Trace(self, "OnInit() consoleCommand: " + consoleCommand)

	Debug.ExecuteConsole(consoleCommand)

EndEvent


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "ENV_Temp_BiomePackinSpawnScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly Protected
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "ENV_Temp_BiomePackinSpawnScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly Protected
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction