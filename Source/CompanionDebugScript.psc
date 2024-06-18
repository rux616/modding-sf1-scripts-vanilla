Scriptname CompanionDebugScript extends Actor
{holds various functions for ease of debugging that you can call directly on the actor from the console}

Struct QuestStageDatum
	Quest QuestToSet
	int StageToSet
EndStruct

ActorValue Property COM_DEBUG_OnPlayerShip Mandatory Const Auto
{autofill}

QuestStageDatum[] Property QuestStageData Const Auto
{set quest stages when Calling DebugMakeActiveCompanion to prepare them for being testable as companions}

SQ_Companions_ActiveCompanionScript Property ActiveCompanion Mandatory Const Auto
{pointer to ActiveCompanion alias in SQ_Companions}

CompanionActorScript CompanionRef

Event OnInit()
	CompanionRef = ((self as Actor) as CompanionActorScript)
EndEvent

Function DebugMakeAvailableCompanion()
	Trace(self, "DebugMakeAvailableCompanion()")
	CompanionRef.SQ_Companions.SetRoleAvailable(self)
	CompanionRef.MoveTo(Game.GetPlayer())
EndFunction

Function DebugMakeActiveCompanion()
	Trace(self, "DebugMakeActiveCompanion()")

	if QuestStageData.Length > 0
		int i = 0
		While (i < QuestStageData.length)
			QuestStageDatum currentDatum = QuestStageData[i]
			currentDatum.QuestToSet.SetStage(currentDatum.StageToSet)
			i += 1
		EndWhile
	endif

	CompanionRef.RemoveKeyword(CompanionRef.COM_PreventStoryGateScenes)
	CompanionRef.SQ_Companions.SetRoleActive(self)
	CompanionRef.MoveTo(Game.GetPlayer())
EndFunction

Function DebugMakeInactiveCompanion()
	Trace(self, "DebugMakeInactiveCompanion()")
	CompanionRef.SQ_Companions.SetRoleInactive(self)
EndFunction

Function DebugSetAffinityLevel(GlobalVariable AffinityLevel)
	Trace(self, "SetAffinityLevel()	AffinityLevel: " + AffinityLevel)
	CompanionRef.SQ_Companions.SetAffinityLevel(self, AffinityLevel)
EndFunction

Function DebugModAffinity(float Amount)
	Trace(self, "DebugModAffinity() Amount: " + Amount)
	CompanionRef.SQ_Companions.DebugModAffinity(self, Amount)
EndFunction

Function DebugSetStoryGateTimerComplete()
	Trace(self, "DebugSetTimerComplete() ")
	CompanionRef.COM_CompanionQuest.DebugSetStoryGateTimerComplete()
EndFunction

Function DebugSetAngerLevel(GlobalVariable AngerLevel, GlobalVariable AngerReason)
	Trace(self, "DebugSetAngerLevel() AngerLevel: " + AngerLevel + ", AngerReason: " + AngerReason)
	CompanionRef.COM_CompanionQuest.SetAngerLevel(AngerLevel, AngerReason)
EndFunction

Function DebugExpireAngerCoolDownTimer()
	Trace(self, "DebugExpireAngerCoolDownTimer()")
	CompanionRef.COM_CompanionQuest.ExpireAngerCoolDownTimer()
EndFunction

Function DebugAwardSecondChance()
	Trace(self, "DebugAwardSecondChance()")
	CompanionRef.COM_CompanionQuest.AwardSecondChance()
EndFunction

Function DebugMakeRomantic()
	ActorValue COM_AffinityLevel = CompanionRef.SQ_Companions.COM_AffinityLevel
	GlobalVariable COM_AffinityLevel_2_Affection = CompanionRef.SQ_Companions.COM_AffinityLevel_2_Affection

	if CompanionRef.GetValue(COM_AffinityLevel) < COM_AffinityLevel_2_Affection.GetValue()
		Trace(self, "DebugMakeRomantic() forcing affinity to COM_AffinityLevel_2_Affection")
		CompanionRef.COM_CompanionQuest.SetAffinityLevel(COM_AffinityLevel_2_Affection)
	endif

	CompanionRef.COM_CompanionQuest.MakeRomantic()
EndFunction

Function DebugTestConditionForm(ConditionForm ConditionFormToTest)
	Trace(self, "ConditionForm() ConditionFormToTest: " + ConditionFormToTest + ", IsTrue() with self as subject: " + ConditionFormToTest.IsTrue(self))
EndFunction

Function DebugIsPlayerLoitering()
	Trace(self, "DebugIsPlayerLoitering IsPlayerLoitering(): " + Game.IsPlayerLoitering())
EndFunction

Function DebugSetOnPlayerShip()
	Trace(self, "DebugSetOnPlayerShip()")

	CompanionRef.SetValue(COM_DEBUG_OnPlayerShip, 1)
EndFunction

Function DebugExpireFlirtCooldown()
	Trace(self, "DebugExpireFlirtCooldown()")
	CompanionRef.SetValue(CompanionRef.COM_CompanionQuest.COM_FlirtCooldownExpiry, 0)
EndFunction

Function DebugExpireTravelAffinityCoolDown()
	Trace(self, "DebugExpireTravelAffinityCoolDown()")
	ActiveCompanion.StartTimer_AffinityTravelCoolDown(ExpireTimer = true)
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "Debug", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "Debug", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction