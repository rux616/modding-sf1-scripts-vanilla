Scriptname CompanionActorScript extends Actor
;most things live elsewhere, this script mainly acts as a repository of information that other scripts can use to find the data functions they need.ActorBase
;it can also be used to cast actors to ensure they are actually companions


Group Autofill
	SQ_CompanionsScript Property SQ_Companions Mandatory Const Auto
	{autofill; this is a pointer to the main companion system quest and script}

	ActorValue Property COM_Affinity Mandatory Const Auto
	{Autofill}

	Keyword Property COM_PreventStoryGateScenes Mandatory Const Auto
	{autofill}
EndGroup

Group Properties
	COM_CompanionQuestScript Property COM_CompanionQuest Mandatory Const Auto
	{Filter for "COM_Companion_*"}

	GlobalVariable Property COM_CompanionID Mandatory Const Auto
	{the global "enum" that means this companion. Can be stored in other globals, variables, etc. when needing a numeric ID for this companion}

	Activator Property COM_PQ_TxtReplace_QuestName Mandatory Const Auto
	{holds a pointer to an activator with a name the same as the personal quest name, for use in message text replacement.
	
	Filter for:
	COM_PQ_TxtReplace_QuestName*
	}
EndGroup

Event OnDeath(ObjectReference akKiller)
	Trace(self, "OnDeath() setting SQ_Companions role inactive and unavailable. ")
	;to remove them from aliases that add factions that respond to affinity events
	SQ_Companions.SetRoleInactive(self)
	SQ_Companions.SetRoleUnavailable(self)
EndEvent

GlobalVariable Function GetCompanionIDGlobal()
	Trace(self, "GetCompanionIDGlobal() returning COM_CompanionID: " + COM_CompanionID)
	return COM_CompanionID
EndFunction

float Function GetCompanionIDValue()
	Trace(self, "GetCompanionIDValue() returning " + GetCompanionIDGlobal().GetValue())
	return GetCompanionIDGlobal().GetValue()
EndFunction

int  Function GetCompanionIDValueInt()
	return GetCompanionIDGlobal().GetValue() as int
EndFunction

Function SetGlobalToCompanionID(GlobalVariable GlobalToSet)
	Trace(self, "SetGlobalToCompanionID() GlobalToSet: " + GlobalToSet)

	float companionIDValue = GetCompanionIDValue()

	Trace(self, "SetGlobalToCompanionID() setting global to companionIDValue: " + companionIDValue)

	GlobalToSet.SetValue(companionIDValue)
EndFunction

bool Function HasGreaterAffinityThanTestedCompanion(CompanionActorScript TestedCompanion)
	Trace(self, "HasGreaterAffinityThanTestedCompanion() TestedCompanion: " + TestedCompanion)

	bool returnVal = false

	;if the TestCompanion is none, treat it as true
	if TestedCompanion == None
		returnVal = true

	;next compare affinity level
	elseif GetValue(SQ_Companions.COM_AffinityLevel) > TestedCompanion.GetValue(SQ_Companions.COM_AffinityLevel)
		returnVal = true

	;next check affinity
	elseif GetValue(SQ_Companions.COM_Affinity) > TestedCompanion.GetValue(SQ_Companions.COM_Affinity)
		returnVal = true
	endif

	Trace(self, "HasGreaterAffinityThanTestedCompanion() returning returnVal: " + returnVal)
	return returnVal
EndFunction

bool Function IsRomantic()
	Trace(self, "IsRomantic()")
	return SQ_Companions.IsCompanionRomantic(self)
EndFunction

Function AddAffinity(int AmountToAdd)
	Trace(self, "AddAffinity() Base AmountToAdd: " + AmountToAdd + ", current value: " + GetValue(COM_Affinity))
	AddPassiveAffinity(AmountToAdd as Float)
	Trace(self, "AddAffinity() New value: " + GetValue(COM_Affinity))
	COM_CompanionQuest.CheckAndSetWantsToTalk()
EndFunction

;this is needed for Companions who are made active companions during portions of the main quest but who we want to wait to have Story Gate scenes with after the player is done exploring with them during those Main Quests
Function AllowStoryGatesAndRestartTimer()
	Trace(self, "AllowStoryGatesAndRestartTimer() ")
	RemoveKeyword(COM_PreventStoryGateScenes)
	RestartStoryGateTimer(1)
EndFunction

Function RestartStoryGateTimer(int nextStoryGate = 1)
	COM_CompanionQuest.StartStoryGateTimer(nextStoryGate)
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "CompanionActor", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "CompanionActor", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction