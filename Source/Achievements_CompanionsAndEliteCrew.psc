Scriptname Achievements_CompanionsAndEliteCrew extends Quest

Group RecruitedCountAchievement
    RefCollectionAlias Property RecruitedCompanionsAndEliteCrew Mandatory Const Auto
    {autofill}

    int Property CountForAchievement = 10 Const Auto

    int Property AchievementID_RecruitedCount = 38 Const Auto
EndGroup

Group RelationshipLevelAchievement
    ActorValue Property COM_AffinityLevel Mandatory Const Auto
    {autofill}

    int Property AffinityLevelNeeded = 3 Const Auto

    int Property AchievementID_MaxRelationshipLevelReached = 39 Const Auto
EndGroup


Function RecruitedCompanionOrEliteCrew(Actor RecruitedActor)
    Trace(self, "RecruitedCompanionOrEliteCrew() RecruitedActor: " + RecruitedActor)
    RecruitedCompanionsAndEliteCrew.AddRef(RecruitedActor)

    Trace(self, "RecruitedCompanionOrEliteCrew() RecruitedCompanionsAndEliteCrew.GetCount: " + RecruitedCompanionsAndEliteCrew.GetCount())

    if RecruitedCompanionsAndEliteCrew.GetCount() >= CountForAchievement
        Trace(self, "RecruitedCompanionOrEliteCrew() calling AddAchievement(AchievementID_RecruitedCount), AchievementID_RecruitedCount: " + AchievementID_RecruitedCount)
        Game.AddAchievement(AchievementID_RecruitedCount)
    endif
EndFunction

Function AffinityLevelReached(Actor CompanionActor)
    Trace(self, "AffinityLevelNeeded() CompanionActor: " + CompanionActor + ", CompanionActor.GetValue(COM_AffinityLevel: " + CompanionActor.GetValue(COM_AffinityLevel))

    if CompanionActor.GetValue(COM_AffinityLevel) >= AffinityLevelNeeded
        Trace(self, "AffinityLevelNeeded() calling AddAchievement(AchievementID_MaxRelationshipLevelReached), AchievementID_MaxRelationshipLevelReached: " + AchievementID_MaxRelationshipLevelReached )
        Game.AddAchievement(AchievementID_MaxRelationshipLevelReached)
    endif
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Achievements",  string SubLogName = "CompanionsAndEliteCrew", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Achievements",  string SubLogName = "CompanionsAndEliteCrew", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction