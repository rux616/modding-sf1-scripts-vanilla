Scriptname MissionBoardCargoContainerScript extends ObjectReference Const
{holds data for the cargo this container represents}

MiscObject Property CargoMiscObject Auto Const
{misc object to use to create cargo in inventory}

int property CargoWeightMultMin = 15 auto Const
{ cargo items will be randomized between min and max }

int property CargoWeightMultMax = 200 auto Const
{ cargo items will be randomized between min and max }

Function CreateCargo(RefCollectionAlias CargoCollection, int cargoItems)
	; does this work? if not, create them one at a time and put into ref collection
	int i = 0
	while i < cargoItems
		ObjectReference cargoRef = PlaceAtMe(CargoMiscObject, aiCount=1, akAliasToFill=CargoCollection, abInitiallyDisabled=true)
		i += 1
	EndWhile
endFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Missions",  string SubLogName = "Cargo", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Missions",  string SubLogName = "Cargo", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction