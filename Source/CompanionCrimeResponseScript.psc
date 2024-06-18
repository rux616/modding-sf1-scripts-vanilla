Scriptname CompanionCrimeResponseScript extends Actor
{handles having the companion bail on combat with people they consider civilians and respond to player killing them as murder

***REMINDERS
all actors with this script MUST have their own "personal crime faction" faction that has a shared crime faction list of factions they consider "civilians"
}

Group Autofill
	SQ_CompanionsScript Property SQ_Companions Mandatory Const Auto
	Faction Property CurrentCompanionFaction Mandatory Const Auto
	GlobalVariable Property COM_AngerReason_Common_1_Murder Mandatory Const Auto
	Keyword Property COM_NotCivilian Auto Const Mandatory
	ActorValue Property Aggression Mandatory Const Auto
	ActorValue Property  Assistance Mandatory Const Auto
EndGroup


Group Properties
	AffinityEvent Property AffinityEventOnCombat Mandatory Const Auto
	{filter for: COM_Event_Action_CivilianCombat}

	AffinityEvent Property AffinityEventOnKill Mandatory Const Auto
	{filter for: COM_Event_Action_CivilianKilled}

	Faction[] Property IgnoreSharedCrimeForAnyoneInTheseFactions const auto
	{Even if the companion would help them because they are in his shared crime list, ignore it if they are in this faction.}

;Might need for code debugging, leaving for now until code solution is determined
;	FormList Property SharedCrimeFactionList Mandatory Const Auto
;	{this needs to be the same formlist used in the actors personal crime faction's shared crime list}
	
EndGroup

Event OnLoad()
	RegisterForEvents()
EndEvent

Event OnUnload()
	UnregisterForEvents()
EndEvent

;called externally from temp script to fix currently broken saves
Function RegisterForEvents()
	Trace(self, "RegisterForEvents()")
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerAssaultActor")
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerMurderActor")
	RegisterForRemoteEvent(Game.GetPlayer(), "OnCombatStateChanged")
EndFunction

Function UnregisterForEvents()
	Trace(self, "UnregisterForEvents()")
	UnregisterForRemoteEvent(Game.GetPlayer(), "OnPlayerAssaultActor")
	UnregisterForRemoteEvent(Game.GetPlayer(), "OnPlayerMurderActor")
	UnregisterForRemoteEvent(Game.GetPlayer(), "OnCombatStateChanged")
EndFunction

bool Function AmIHere()
	return Is3DLoaded()
EndFunction

;overridden in child script EliteCrewCrimeResponseScript
bool Function AmIAngry()
	bool returnVal = SQ_Companions.GetAngerLevel(self).GetValue() >= SQ_Companions.COM_AngerLevel_2_Angry.GetValue()

	Trace(self, "AmIAngry() returnVal: " + returnVal)

	return returnVal
endFunction

Function ProcessCombatantsForCrimeFactionAnger(bool TestMyCombatTargets = false) Private
	Trace(self, "ProcessCombatantsForCrimeFactionAnger() TestMyCombatTargets: " + TestMyCombatTargets)


	;are you already angry? if so, ignore (yes, this means if you only have a little time left being angry player could be a jerk and you'll come out of anger sooner than you should, but it speeds this script up and is kind of an edge case)
	if AmIAngry()
		trace(self, "ProcessCombatantsForCrimeFactionAnger() AmIAngry == true, BAILING")
		RETURN
	endif


	faction myCrimeFaction = GetCrimeFaction()
	trace(self, "ProcessCombatantsForCrimeFactionAnger() myCrimeFaction:" + myCrimeFaction)
	
	Actor ActorWhoseCombatantTargetsToTest = Game.GetPlayer()
	if TestMyCombatTargets
		ActorWhoseCombatantTargetsToTest = self
	endif

	trace(self, "ProcessCombatantsForCrimeFactionAnger() ActorWhoseCombatantTargetsToTest: " + ActorWhoseCombatantTargetsToTest)

	Actor[] combatants = ActorWhoseCombatantTargetsToTest.GetAllCombatTargets()

	trace(self, "ProcessCombatantsForCrimeFactionAnger() combatants:" + combatants)

	int i = 0
	int max = combatants.length
	while (i < max)
		ProcessCrimeFactionAnger(combatants[i], myCrimeFaction, SkipLockedInCompanionCheck = true)

		i += 1
	endwhile

	if TestMyCombatTargets == false && myCrimeFaction.IsPlayerEnemy() == false
		;done testing player's combatants, if I'm not already upset personally, test my combatants in case the player somehow dropped out of combat before me
		ProcessCombatantsForCrimeFactionAnger(TestMyCombatTargets = true)
	endif

EndFunction

Function ProcessCrimeFactionAnger(Actor ActorToTest, Faction myCrimeFaction, bool SkipLockedInCompanionCheck = false) Private
	trace(self, "ProcessCrimeFactionAnger() ActorToTest:" + ActorToTest + ", SkipLockedInCompanionCheck: " + SkipLockedInCompanionCheck)

	;check to see if the combatant's crime faction is an enemy of the player
	faction actorToTestCrimeFaction = ActorToTest.GetCrimeFaction()

	trace(self, "ProcessCrimeFactionAnger() actorToTestCrimeFaction:" + actorToTestCrimeFaction)

	if actorToTestCrimeFaction && actorToTestCrimeFaction.IsPlayerEnemy()
		trace(self, "ProcessCrimeFactionAnger() actorToTestCrimeFaction.IsPlayerEnemy() and not in IgnoreSharedCrimeForAnyoneInTheseFactions")

		;check to see if the crime faction is in my shared crime faction list and the actor isn't in the ignore array
		if myCrimeFaction.IsFactionInCrimeGroup(actorToTestCrimeFaction) && CommonArrayFunctions.CheckActorAgainstFactionArray(ActorToTest, IgnoreSharedCrimeForAnyoneInTheseFactions) == false
			
			trace(self, "ProcessCrimeFactionAnger() currentCrimeFaction is in my Crime Faction's shared crime group.")

			;i consider this civilian combat and I don't like it:
			CivilianCombat(ActorToTest)

			RETURN
		endif

	endif 
EndFunction


Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, int aeCombatState)
	if AmIHere() == false
		return
	endif
	
	trace(self, "Player OnCombatStateChanged() akTarget:" + akTarget + ", aeCombatState:" + aeCombatState)

    if aeCombatState > 0
		ProcessCombatantsForCrimeFactionAnger()
    endif
EndEvent

Event Actor.OnPlayerAssaultActor(Actor akSender, ObjectReference akVictim, Location akLocation, bool aeCrime)
	if AmIHere() == false
		return
	endif
	
	Trace(self, "OnPlayerAssaultActor() akSender: " + akSender + ", akVictim: " + akVictim + ", aeCrime: " + aeCrime)
	Actor victimActor = akVictim as Actor
	if IsValidCrimeVictim(victimActor) ;NOTE: we don't care if anyone reported the crime (gained bounty) since this event is for an unprovoked attack which is immoral regardless of crime status
		CivilianCombat(victimActor)
	endif
EndEvent

Event Actor.OnPlayerMurderActor(Actor akSender, ObjectReference akVictim, Location akLocation, bool aeCrime)
	if AmIHere() == false
		return
	endif
	
	Trace(self, "OnPlayerMurderActor() akSender: " + akSender + ", akVictim: " + akVictim + ", aeCrime: " + aeCrime)
	Actor victimActor = akVictim as Actor
	if IsValidCrimeVictim(victimActor) ;NOTE: we don't care if anyone reported the crime (gained bounty) since this event is for an unprovoked attack which is immoral regardless of crime status
		CivilianKilled(victimActor)
	endif
EndEvent

bool Function IsValidCrimeVictim(Actor ActorToCheck)
	Trace(self, "IsValidCrimeVictim() ActorToCheck: " + ActorToCheck)
	
	bool returnVal = false

	if ActorToCheck && AmIHere()
		faction myCrimeFaction = GetCrimeFaction()
		faction ActorToCheckCrimeFaction = ActorToCheck.GetCrimeFaction()
		bool isInSharedCrimeFaction = myCrimeFaction.IsFactionInCrimeGroup(ActorToCheckCrimeFaction)
		Trace(self, "IsValidCrimeVictim() ActorToCheck: " + ActorToCheck + ", isInSharedCrimeFaction: " + isInSharedCrimeFaction)

		if isInSharedCrimeFaction
			bool isActorValidCrimeVictim = ActorToCheck.HasKeyword(COM_NotCivilian) == false && CommonArrayFunctions.CheckActorAgainstFactionArray(ActorToCheck, IgnoreSharedCrimeForAnyoneInTheseFactions) == false

			Trace(self, "IsValidCrimeVictim() ActorToCheck: " + ActorToCheck + ", isActorValidCrimeVictim: " + isActorValidCrimeVictim)

			if isActorValidCrimeVictim
				;passed all the tests
				returnVal = true

			endif
		endif
	endif

	Trace(self, "IsValidCrimeVictim() returnVal: " + returnVal)
	return returnVal
EndFunction

Function CivilianCombat(Actor CivilianActor) Private
	Trace(self, "CivilianCombat() Actor CivilianActor: " + CivilianActor)
	Pacify()
	AffinityEventOnCombat.Send(CivilianActor) ;this will make companions angry
	AutoDismiss()
EndFunction

Function CivilianKilled(Actor CivilianActor) Protected
	Trace(self, "CivilianKilled() Actor CivilianActor: " + CivilianActor)
	Pacify()
	AffinityEventOnKill.Send(CivilianActor)
	;AutoDismiss caused by Anger state triggered by CompanionAffinityScript.AngerEvents including the event in AffinityEventOnKill
	ProcessCrimeFactionAnger(CivilianActor, GetCrimeFaction())
EndFunction

Function AutoDismiss() Protected
	Trace(self, "AutoDimiss()")
	if SQ_Companions.IsCompanionLockedIn((self as actor) as CompanionActorScript)
		Trace(self, "AutoDismiss() companion is currently Locked In, cannot auto dismiss.")
	elseif SQ_Companions.IsRoleActive(self)
		SQ_Companions.SetRoleInactive(self) ;combat is also stopped here
	endif
EndFunction

bool Function TestForLockedInCompanion() Protected
	bool returnVal
	
	CompanionActorScript companion = (self as actor) as CompanionActorScript ;reminder there is a child extending script for Elite Crew so we need to make sure we are a companion here
	returnVal = companion && SQ_Companions.IsCompanionLockedIn(companion)
	Trace(self, "TestForLockedInCompanion() returnVal: " + returnVal) 
	
	RETURN returnVal
EndFunction				


Function Pacify() Protected
	;note sure if this is needed or not:
	StopCombat()
	StopCombatAlarm()

	;REMINDER: there is a always flee combat override package on current follower conditioned on if they are angry or not.
EndFunction



;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "CompanionCrimeResponseScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "CompanionCrimeResponseScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction

