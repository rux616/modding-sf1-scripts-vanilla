Scriptname RQ_SetStageOnExternalScene extends Quest
{typically for audio log scenes}

Struct SceneStageDatum
    Scene ExternalScene
    int StageToSetOnEnd
EndStruct

SceneStageDatum[] Property SceneStageData Mandatory Const Auto

Event OnQuestInit()
    Trace(self, "OnQuestInit()")

    int i = 0
    While (i < SceneStageData.length)
        Scene currentScene = SceneStageData[i].ExternalScene
        Trace(self, "OnQuestInit() registering for OnEnd for currentScene: " + currentScene)
        RegisterForRemoteEvent(currentScene, "OnEnd")
        i += 1
    EndWhile

EndEvent

Event Scene.OnEnd(Scene akSender)
    Trace(self, "OnEnd() akSender: " + akSender)
    int iFound = SceneStageData.FindStruct("ExternalScene", akSender)
    SceneStageDatum foundSceneStageDatum
    if iFound > -1
        foundSceneStageDatum = SceneStageData[iFound]
        SetStage(foundSceneStageDatum.StageToSetOnEnd)
    endIf
EndEvent



;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "RQ",  string SubLogName = "RQScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "RQ",  string SubLogName = "RQScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction
