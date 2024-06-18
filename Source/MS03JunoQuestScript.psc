Scriptname MS03JunoQuestScript extends Quest

Group Autofill
	ReferenceAlias Property JunoMoveToMarker Mandatory Const Auto
	ReferenceAlias Property JunoShip Mandatory Const Auto
	ReferenceAlias Property PlayerShip Mandatory Const Auto
	ReferenceAlias Property RyujinShip Mandatory Const Auto
	RefCollectionAlias Property EclipticShips Mandatory Const Auto
EndGroup

Event OnQuestInit()
	Trace(self, "OnQuestInit() moving Juno from unique holding cell to instanced space cell, Ecliptic start combat with player.")

	MoveJuno()
	StartCombat()

EndEvent

Function MoveJuno()
	Trace(self, "MoveJuno()")
	JunoShip.GetReference().MoveTo(JunoMoveToMarker.GetReference())
	RyujinShip.GetReference().Enable() ;has sit package to dock with JunoShip immediately when enabled
EndFunction

Function StartCombat()
	Trace(self, "StartCombat() ")

	SpaceshipReference[] enemyShips = EclipticShips.GetArray() as SpaceshipReference[]
	int i = 0
	While (i < enemyShips.length)
		SpaceshipReference currentShipRef = enemyShips[i]
		
		currentShipRef.StartCombat(Game.GetPlayerHomeSpaceShip())
		i += 1
	EndWhile

EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "MS03",  string SubLogName = "MS03JunoQuestScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "MS03",  string SubLogName = "MS03JunoQuestScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction