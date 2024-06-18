Scriptname Rad01_LIST_QuestScript extends Quest

Group autofill
	Book Property Rad01_Pamphlet Mandatory Const Auto
	GlobalVariable Property Rad01_PamphletCost Mandatory Const Auto
EndGroup

Group Properties
	int Property StageSurveyComplete = 190 Const Auto
	int Property PamphletAmount = 5 Const Auto
	int Property StagePlayerNeedsToScan = 100 Const Auto
EndGroup

Event OnQuestInit()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerPlanetSurveyComplete")
EndEvent

Function PurchasePamphlets()
	Game.GetPlayer().RemoveItem(Game.GetCredits(), Rad01_PamphletCost.GetValueInt())
	Game.GetPlayer().AddItem(Rad01_Pamphlet, PamphletAmount)
EndFunction

Function SurveyCompleted()
	if GetStageDone(StagePlayerNeedsToScan)
		Trace(self, "SurveyComeplete() and GetStageDone(StagePlayerNeedsToScan)... setting StageSurveyComplete")
		SetStage(StageSurveyComplete)
	else
		Trace(self, "SurveyComeplete() and GetStageDone(StagePlayerNeedsToScan) == FALSE... NOT setting StageSurveyComplete")
	endif
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Rad01",  string SubLogName = "Rad01_LIST_QuestScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Rad01",  string SubLogName = "Rad01_LIST_QuestScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction