Scriptname SFBGS003:SFBGS003_ShutdownQuestScript extends Quest
{Used by the Bounty Scanner system to shutdown the quest. }

; This script was extracted from the RQScript and made into a standalone script. 

Group Shutdown
	Alias[] Property ShutdownAliases Mandatory Const Auto
	{Aliases that will be considered when determining shutdown logic}

	int Property ShutdownStageRequired_Stage = 100 Const Auto
	{ Prior to this stage being set, quest will shutdown when player leaves the planet.
	  After this stage is set, quest won't shutdown until ShutdownAllowed_Stage is set.
	}

	int Property ShutdownAllowed_Stage Mandatory Const Auto
	{Automated system (defined by ShutdownOn_ property below) will shutdown the quest only if this stage has been set.}

	bool Property ShutdownAllowed_UnloadedOrDeadAlisaes = true Const Auto
	{If true (default), automated system (defined by ShutdownOn_ property) will shutdown the quest only if refs in ShutdownAliases have no 3d or are dead.}

	bool Property ShutdownOn_LocationChange = true Const Auto
	{if true (default), will attempt to shut down when player changes locations}
EndGroup

Event OnQuestStarted()
	Trace(self, "OnQuestStarted() ")

    if ShutdownOn_LocationChange
		RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	endif
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	Trace(self, "OnLocationChange() akSender: " + akSender + ", akOldLoc: " + akOldLoc + ", akNewLoc: " + akNewLoc)
	if akSender == Game.GetPlayer()
		; There's a small chance a Bounty Target NPC won't get cleaned up when the player leaves the area despite not having any 
		; persistence (check with console command: dppi). But it does seem to clean up when another instance of the same Duplicate quest starts.
		; So, we disable the bounty target reference just in case so it won't continue to show up after the player leaves the location, 
		; before it gets cleaned up.
		  ; There will only ever be one RefAlias in ShutdownAliases[]. We had to do it this way because of the issue with duplicate quests, and an 
		  ; inability to check them all in again.
		ReferenceAlias[] refAliasArray = CommonArrayFunctions.GetReferenceAliasesFromAliasArray(ShutdownAliases)
		refAliasArray[0].GetRef().Disable()
		ShutDown()
	endif
EndEvent


Function Shutdown()
	Trace(self, "Shutdown() calling Stop()")
	Stop()
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_BountyScanner",  string SubLogName = "QuestScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_BountyScanner",  string SubLogName = "QuestScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction
