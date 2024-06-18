Scriptname MissionBountyQuestScript extends missionquestscript
{for bounty missions that need to select enemy type}

group Bounty
    ReferenceAlias property EnemyType auto Const Mandatory
EndGroup

Event OnQuestStarted()
	Trace(Self, " OnQuestStarted")
    ; pick enemy type
    Actor enemyActor = PrimaryRef.GetActorRef()
    if enemyActor
        int i = 0
        Form enemyTypeMarker
        while i < MissionParent.enemyTypes.Length && enemyTypeMarker == NONE
            MissionParentScript:MissionEnemyType theEnemyType = MissionParent.enemyTypes[i]
            if enemyActor.IsInFaction(theEnemyType.enemyFaction)
                enemyTypeMarker = theEnemyType.enemyName
            endif
            i += 1
        EndWhile
        if enemyTypeMarker
            EnemyType.ForceRefTo(enemyActor.PlaceAtMe(enemyTypeMarker, abInitiallyDisabled=true))
            Parent.OnQuestStarted()
        Else
            Trace(Self, " Didn't find matching enemy type for " + enemyActor + " - stop quest")
        endif
    Else
        Trace(Self, " No target enemy - stop quest")
        Stop()
    endif
endEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Missions",  string SubLogName = "Bounty", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Missions",  string SubLogName = "Bounty", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction
