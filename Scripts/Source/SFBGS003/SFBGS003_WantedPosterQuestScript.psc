Scriptname SFBGS003:SFBGS003_WantedPosterQuestScript extends Quest

Group Autofill
    SFBGS003_SQ_WantedPostersQuestScript Property SFBGS003_SQ_WantedPosters Mandatory Const Auto
    {System quest script that houses wanted poster functions and an array of trackers alliance quests}
EndGroup

Group Required_Properties
    int Property AddPosterStage Mandatory Const Auto
    {Quest stage that adds the poster to the display case}
    int Property BountyAcceptedStage Mandatory Const Auto
    {Quest stage to be set when the player accepts the bounty by interacting with the poster}
    int Property BountyCompletedStage = -1 Mandatory Const Auto
    {Quest stage that sets this quest completed. Leave this blank and fill OverrideBountyCompletedQuest and OverrideBountyCompletedStage if checking the completion of a stage on a different quest}
    MiscObject Property WantedPoster Mandatory Auto
    {Poster item that is added to the display case when AddPosterStage is set}
    MiscObject Property CompletedPoster Mandatory Const Auto
    {Completed poster item that is added to the display case when the quest is completed}
EndGroup


Group Optional_Properties
    Quest Property OverrideBountyCompletedQuest = None Mandatory Const Auto
    {OPTIONAL: Use this with OverrideBountyCompletedStage if you need to check a different quest for completion}
    int Property OverrideBountyCompletedStage = -1 Mandatory Const Auto
    {OPTIONAL: Use this with OverrideBountyCompletedQuest if you need to check a different quest for completion}
EndGroup


Event OnQuestInit()
    if OverrideBountyCompletedQuest
        RegisterForRemoteEvent(OverrideBountyCompletedQuest, "OnStageSet")
    endif
EndEvent


;call SQscript functions when various stages are set
Event OnStageSet(int auiStageID, int auiItemID)
    if auiStageID == AddPosterStage
        SFBGS003_SQ_WantedPosters.PrepareBountyArrayAndPoster(self, WantedPoster)
    endif

    if auiStageID == BountyCompletedStage
        SFBGS003_SQ_WantedPosters.AddCompletedWantedPoster(CompletedPoster)
    endif
EndEvent


Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
    if akSender == OverrideBountyCompletedQuest && auiStageID == OverrideBountyCompletedStage
        SFBGS003_SQ_WantedPosters.AddCompletedWantedPoster(CompletedPoster)
        UnregisterForRemoteEvent(OverrideBountyCompletedQuest, "OnStageSet")
        Stop() ; <<< adding this to stop SFBGS003_MiscPointer or any quest that uses an override quest for checking if the bounty is complete
    endif
EndEvent


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "WantedPoster",  string SubLogName = "Quest_Script", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "WantedPoster",  string SubLogName = "Quest_Script", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction