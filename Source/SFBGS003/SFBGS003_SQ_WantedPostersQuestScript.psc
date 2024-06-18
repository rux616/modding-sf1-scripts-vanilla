Scriptname SFBGS003:SFBGS003_SQ_WantedPostersQuestScript extends Quest

Group Required_Properties
    ObjectReference Property BountyBoard Mandatory Const Auto
    {Display case container that houses wanted poster misc items}
    Quest Property SFBGS003_MiscPointer Mandatory Const Auto
    {PreReq quest for SFTA00}
    int Property SFBGS003_MiscPointerPreReqStage Mandatory Const Auto
    {PreReq quest stage that lets the player accept the first TA bounty poster and presents the SFBGS003_SFTA00_PreReq_Msg for all other bounty posters}
    int Property SFBGS003_MiscPointerCompletedStage Mandatory Const Auto
    {Quest completed stage of SFBGS003_MiscPointer that is set when the player accepts the first bounty}
    Quest Property SFTA00 Mandatory Const Auto
    {Prereq quest for allowing activation of purchased DLC posters}
    Message Property SFBGS003_MiscPointer_PreReq_Msg Mandatory Const Auto
    {The message that is displayed when the player activates a poster BEFORE getting approval from Agent No. 1}
    Message Property SFBGS003_SFTA00_Prereq_Msg Mandatory Const Auto
    {The message that is displayed when the player activates a poster BEFORE completing SFTA00}
EndGroup

SFBGS003_WantedPosterQuestScript[] WantedPosterQuestArray

Function PrepareBountyArrayAndPoster(SFBGS003_WantedPosterQuestScript QuestToAdd, MiscObject WantedPoster)
    if WantedPosterQuestArray == None
        WantedPosterQuestArray = new SFBGS003_WantedPosterQuestScript[0]
    endif

    WantedPosterQuestArray.Add(QuestToAdd)
    BountyBoard.AddItem(WantedPoster)
EndFunction


Function WantedPosterActivated(ObjectReference PosterToActivate)

    SFBGS003_WantedPosterQuestScript MatchingQuest = FindMatchingQuest(PosterToActivate.GetBaseObject() as MiscObject)
    
    if MatchingQuest == None ;did not find a matching quest
        Warning(self, "WantedPosterActivated(): MatchingQuest not found")
    
    elseif !SFBGS003_MiscPointer.GetStageDone(SFBGS003_MiscPointerPreReqStage)
        SFBGS003_MiscPointer_PreReq_Msg.Show()
    
    elseif MatchingQuest != SFBGS003_MiscPointer && !SFTA00.IsCompleted()
        SFBGS003_SFTA00_Prereq_Msg.Show()
    
    else
        PosterButtonPressed(MatchingQuest, PosterToActivate)

    endif
EndFunction


Function PosterButtonPressed(SFBGS003_WantedPosterQuestScript MatchingQuest, ObjectReference PosterToActivate)
    MatchingQuest.SetStage(MatchingQuest.BountyAcceptedStage)
    WantedPosterQuestArray.Remove(WantedPosterQuestArray.Find(MatchingQuest))
    PosterToActivate.Delete()
    ;this completes the trackers alliance prereq quest the first time the player accepts a bounty (which can only be SFTA00)
    if !SFBGS003_MiscPointer.IsCompleted()
        SFBGS003_MiscPointer.SetStage(SFBGS003_MiscPointerCompletedStage)
    endif
EndFunction


Function AddCompletedWantedPoster(MiscObject CompletedPoster)
    BountyBoard.AddItem(CompletedPoster)
EndFunction


SFBGS003_WantedPosterQuestScript Function FindMatchingQuest(MiscObject WantedPosterRef)

    SFBGS003_WantedPosterQuestScript MatchingQuest = None

    int i = 0
    while i < WantedPosterQuestArray.Length && MatchingQuest == None
        If (WantedPosterQuestArray[i].WantedPoster == WantedPosterRef)
            MatchingQuest = WantedPosterQuestArray[i]
        EndIf
        i += 1
    EndWhile
    RETURN MatchingQuest
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "WantedPoster",  string SubLogName = "SQ_Script", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "WantedPoster",  string SubLogName = "SQ_Script", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction