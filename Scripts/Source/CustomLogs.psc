Scriptname CustomLogs

Struct LogDatum
	string MainLogName
	{Main log to trace to}

	string SubLogName
	{Sub log to trace to}

	bool PrefixTracesWithLogNames
	{if true, will prefix traces with log names}

	bool PrefixTracesWithCallingObject
	{if true, will prefix traces with calling object}

	string Prefix
	{prefix to add to all traces (after log names if PrefixTracesWithLogNames == true)}

	bool ShowNormalTraces
	{ALSO print to standard papyrus.0.log}
EndStruct

Function AddCustomLog(LogDatum[] ArrayOfLogs, string MainLogName, string SubLogName ="" , bool PrefixTracesWithLogNames = true, bool PrefixTracesWithCallingObject = true, string Prefix = "", bool ShowNormalTraces = false ) global
	LogDatum newLog = new LogDatum
	newLog.MainLogName = MainLogName
	newLog.SubLogName = SubLogName
	newLog.PrefixTracesWithLogNames = PrefixTracesWithLogNames
	newLog.PrefixTracesWithCallingObject = PrefixTracesWithCallingObject
	newLog.Prefix = Prefix
	newLog.ShowNormalTraces = ShowNormalTraces

	ArrayOfLogs.Add(newLog)
EndFunction

Function Trace(LogDatum[] ArrayOfLogs, ScriptObject CallingObject, String asTextToPrint, int aiSeverity = 0) DebugOnly global
	int i = 0
	While (i < ArrayOfLogs.length)
		LogDatum currentLog = ArrayOfLogs[i]

		if currentLog.Prefix != ""
			asTextToPrint = currentLog.Prefix + ": " + asTextToPrint
		endif

		debug.TraceLog(CallingObject, asTextToPrint, currentLog.MainLogName, currentLog.SubLogName, aiSeverity, currentLog.ShowNormalTraces, bShowWarning = false, bPrefixTraceWithLogNames = currentLog.PrefixTracesWithLogNames, bPrefixTracesWithCallingObject = currentLog.PrefixTracesWithCallingObject)

		i += 1
	EndWhile
EndFunction

Function Warning(LogDatum[] ArrayOfLogs, ScriptObject CallingObject, String asTextToPrint) BetaOnly global
	int i = 0
	While (i < ArrayOfLogs.length)
		LogDatum currentLog = ArrayOfLogs[i]

		if currentLog.Prefix != ""
			asTextToPrint = currentLog.Prefix + ": " + asTextToPrint
		endif

		debug.TraceLog(CallingObject, asTextToPrint, currentLog.MainLogName, currentLog.SubLogName, aiSeverity = 2, bShowNormalTrace = currentLog.ShowNormalTraces, bShowWarning = true, bPrefixTraceWithLogNames = currentLog.PrefixTracesWithLogNames, bPrefixTracesWithCallingObject = currentLog.PrefixTracesWithCallingObject)

		game.Warning("WARNING!!! " + asTextToPrint)

		i += 1
	EndWhile
EndFunction

