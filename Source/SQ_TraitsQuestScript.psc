Scriptname SQ_TraitsQuestScript extends Quest

struct TaskmasterSystemDatum
	string SystemName
	{for readability and console command use, not used by script logic}
	ActorValue SystemAV
	{the AV the code uses for the health of this system}
	ActorValue SystemHealthAV
	{the ship part id associated with this system - for repairs}
	Perk AssociatedCrewSkill
	{the skill that crew need to repair this system with Taskmaster. For multiple skills, use AssociatedCrewSkillsList}
	Formlist AssociatedCrewSkillsList
	{IGNORED if AssociatedCrewSkill is set, the skills that crew need to repair this system with Taskmaster}
	Message RepairedMessage
	{message to display when repairing}
	bool allowToRollForRestore = true
endstruct

Group Taskmaster

	Perk Property TRAIT_Taskmaster Mandatory Const Auto
	{autofill}

	ReferenceAlias Property PlayerShip Mandatory Const Auto
	{autofill; linked alias to PlayerShip alias on SQ_PlayerShip}

	float Property ShipPartHealthPercentTriggerThreshold = 0.5 Const Auto
	{in 0-1 range, the system health percent that triggers the Taskmaster die roll}

	int Property TaskmasterChance = 25 Const Auto
	{chance on a d100, chance to restore system health when rolling to do so}

	TaskmasterSystemDatum[] Property TaskmasterSystemData Mandatory Auto
	{data to connect ship part IDs to various data}

EndGroup

Group Empathy
	Perk Property TRAIT_Empath Mandatory Const Auto
	{Autofill}

	ActorValue Property COM_Affinity Mandatory Const Auto
	{autofill}

	Spell Property Trait_EmpathBuff Mandatory Const Auto
	{autofill}

	Spell Property Trait_EmpathDebuff Mandatory Const Auto
	{autofill}

	Message Property Trait_EmpathyBuff_Msg Mandatory Const Auto
	{autofill}

	Message Property Trait_EmpathyDebuff_Msg Mandatory Const Auto
	{autofill}

EndGroup


Group KidStuff
	Quest Property MQ101 Mandatory Const Auto
	{autofill}
	Int Property CharGenCompleteStage = 105 Const Auto
	{stage in MQ101 that means player finished creating their character and has traits}

	Perk Property Trait_KidStuff Mandatory Const Auto
	{autofill}

	Message Property Trait_KidStuff_Msg_SentCredits Mandatory Const Auto
	{Autofill}

	GlobalVariable property Trait_KidStuff_WeeklyParentalGiftPercentage Mandatory Const Auto
	{0-1, percentage of player credits to remove each week}

	GlobalVariable property Trait_KidStuff_WeeklyParentalGiftMax Mandatory Const Auto
	{Autofill. The total amount of Credits that can be sent each week.}

	WwiseEvent property ITM_Credits_Down_WEF Mandatory Const Auto
	{Autofill. Credits removal SFX. For use with Kid Stuff Parental Gift.}
EndGroup

int TimerID_KidStuff = 1 const

; temp
bool initialized

Event OnQuestInit()
	Trace(self, "OnQuestInit()")
	initialized = true
	RegisterForRemoteEvent(PlayerShip, "OnShipSystemDamaged")
	RegisterForRemoteEvent(PlayerShip, "OnShipSystemRepaired")
	RegisterForRemoteEvent(MQ101, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
	if akSender == MQ101 && auiStageID == CharGenCompleteStage
		if Game.GetPlayer().HasPerk(Trait_KidStuff)
			Trace(self, "OnStageSet() MQ101 CharGen Complete. Calling StartKidStuffGameTimeTimer() ")
			StartKidStuffGameTimeTimer()
		endif
		UnregisterForRemoteEvent(MQ101, "OnStageSet")
	endif
EndEvent

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == TimerID_KidStuff
		Trace(self, "OnTimerGameTime() aiTimerID == TimerID_KidStuff")

		;we check here because player can get the perk removed
		Actor playerRef = Game.GetPlayer()
		if playerRef.HasPerk(Trait_KidStuff)
			HandleKidStuffTimer()
			StartKidStuffGameTimeTimer()
		endif	
	endif
EndEvent

Event ReferenceAlias.OnShipSystemDamaged(ReferenceAlias akSender, ActorValue akSystem, int aBlocksLost, bool aElectromagneticDamage, bool aFullyDamaged)
	Trace(self, "DefaultAliasOnShipSystemDamaged() akSender: " + akSender + ", akSystem: " + akSystem + ", aBlocksLost: " + aBlocksLost + ", aElectromagneticDamage: " + aElectromagneticDamage + ", aFullyDamaged: " + aFullyDamaged)
	if Game.GetPlayer().HasPerk(TRAIT_Taskmaster) && aElectromagneticDamage == false
		TaskmasterPossibleRestore(akSender.GetShipReference(), akSystem)
	endif
EndEvent

Event ReferenceAlias.OnShipSystemRepaired(ReferenceAlias akSender, ActorValue akSystem, int aBlocksGained, bool aElectromagneticDamage)
	Trace(self, "OnShipSystemRepaired() akSender: " + akSender + ", akSystem: " + akSystem + ", aBlocksGained: " + aBlocksGained + ", aElectromagneticDamage: " + aElectromagneticDamage)
	if Game.GetPlayer().HasPerk(TRAIT_Taskmaster) && aElectromagneticDamage == false
		TaskmasterSystemRepaired(akSender.GetShipReference(), akSystem)
	endif
EndEvent

Function TaskmasterSystemRepaired(SpaceshipReference shipRef, ActorValue systemAV, int debugDieRoll = -1)
	Trace(self, "TaskmasterSystemRepaired() shipRef: " + shipRef + ", systemAV: " + systemAV)

	TaskmasterSystemDatum systemDatum = GetTaskmasterSystemDatum(systemAV)
	if systemDatum.allowToRollForRestore == false
		float shipPartHealthPercent = GetSystemHealthPercent(shipRef, systemDatum.systemHealthAV)

		Trace(self, "    shipPartHealthPercent: " + shipPartHealthPercent)

		if shipPartHealthPercent >= 1.0
			systemDatum.allowToRollForRestore = true
		endif
	EndIf
EndFunction

Guard TaskMasterRestoreGuard ProtectsFunctionLogic

Function TaskmasterPossibleRestore(SpaceshipReference shipRef, ActorValue systemAV, int debugDieRoll = -1)
	; temp to fix saves that won't have this quest registered for all the needed events
	if initialized == false
		OnQuestInit()
	endif

	TryLockGuard TaskMasterRestoreGuard
		Trace(self, "TaskmasterPossibleRestore() shipRef: " + shipRef + ", systemAV: " + systemAV)
		TaskmasterSystemDatum systemDatum = GetTaskmasterSystemDatum(systemAV)
		if systemDatum.allowToRollForRestore
			float shipPartHealthPercent = GetSystemHealthPercent(shipRef, systemDatum.systemHealthAV)

			Trace(self, "    shipPartHealthPercent: " + shipPartHealthPercent)

			if shipPartHealthPercent <= ShipPartHealthPercentTriggerThreshold
				;roll die
				bool dieRollSucess = Game.GetDieRollSuccess(TaskmasterChance, DebugDieRoll = debugDieRoll)
				Trace(self, "    dieRollSucess: " + dieRollSucess)

				if dieRollSucess
					TaskmasterRepair(shipRef, systemDatum)
				endif
				; shut off additional rolls until system repaired
				systemDatum.allowToRollForRestore = false
			endif
		EndIf
	Else
		Trace(self, "TaskmasterPossibleRestore() shipRef: " + shipRef + ", systemAV: " + systemAV + " - locked - ignore this damage event")
	EndTryLockGuard

EndFunction

float Function GetSystemHealthPercent(SpaceshipReference shipRef, ActorValue systemHealthAV)
	float currentHealth = shipRef.GetValue(systemHealthAV)
	float baseHealth = shipRef.GetBaseValue(systemHealthAV)
	float shipPartHealthPercent = currentHealth/baseHealth
	return shipPartHealthPercent
EndFunction

TaskmasterSystemDatum Function GetTaskmasterSystemDatum(ActorValue systemAV)
	TaskmasterSystemDatum systemDatum
	int iFound = TaskmasterSystemData.FindStruct("systemAV", systemAV)

	if iFound >= 0
		systemDatum = TaskmasterSystemData[iFound]
	EndIf

	Trace(self, "    GetTaskmasterSystemDatum() systemAV: " + systemAV + " returning systemDatum: " + systemDatum)
	Return systemDatum
EndFunction

Actor[] Function GetTaskmasterSystemMatchingCrewMembers(SpaceshipReference shipRef, TaskmasterSystemDatum systemDatumToFindMatchCrewMembersFor)
	Trace(self, "    GetTaskmasterSystemMatchingCrewMembers() systemDatumToFindMatchCrewMembersFor: " + systemDatumToFindMatchCrewMembersFor + ", ")
	
	Perk[] crewSkillsNeeded
	
	if systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkill
		crewSkillsNeeded = new Perk[1]
		crewSkillsNeeded[0] = systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkill
	
	elseif systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkillsList
		crewSkillsNeeded = systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkillsList.GetArray() as Perk[]
	
	Else
		Warning(self, "GetTaskmasterSystemMatchingCrewMembers() no defined crew skills for: systemDatumToFindMatchCrewMembersFor: " + systemDatumToFindMatchCrewMembersFor)
		return none
	endif
	
	Actor[] matchingCrewMembers = new Actor[0]

	Actor[] crewMembers = shipRef.GetAllCrewMembers()
	int iCrewMember = 0
	;loop through crew
	While (iCrewMember < crewMembers.length)
		Actor currentCrewMember = crewMembers[iCrewMember]
		
		;loop from skills need to see if current crew member has skill
		int iSkill = 0
		While (iSkill < crewSkillsNeeded.length)
			Perk currentSkill = crewSkillsNeeded[iSkill]
			
			if currentCrewMember.HasPerk(currentSkill)
				matchingCrewMembers.Add(currentCrewMember)
				;we're done with this crew member, we only care that he has one of these skills
				iSkill = crewSkillsNeeded.length
			endif

			iSkill += 1
		EndWhile

		iCrewMember += 1
	EndWhile

	return matchingCrewMembers
EndFunction

Function TaskmasterRepair(SpaceshipReference shipRef, TaskmasterSystemDatum systemDatum)
	Trace(self, "    TaskmasterRepair() shipRef: " + shipRef + ", systemAV: " + systemDatum.SystemAV)

	Actor[] matchingCrew = GetTaskmasterSystemMatchingCrewMembers(shipRef, systemDatum) 

	if matchingCrew.Length > 0 	;doing the finding of actors in here, as I assume testing system health and rolling a die which happens outside this function is lighter weight
		int i = Utility.RandomInt(0, matchingCrew.Length - 1)
		Actor randomMatchingCrewMember = matchingCrew[i]
		Trace(self, "        matching crew: " + randomMatchingCrewMember)
		
		;fully repair
		shipRef.RestoreValue(systemDatum.SystemHealthAV, 10000)

		;display message
		systemDatum.RepairedMessage.Show()
	Else
		Trace(self, "    TaskmasterRepair() did not find any matching crew, NOT repairing part.")
	endif
EndFunction



;called by CompanionAffinityScript
Function HandleAffinityEvent(Actor CompanionRef,  AffinityEvent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
	Trace(self, "HandleAffinityEvent() CompanionRef: " + CompanionRef + ", akAffinityEvent: " + akAffinityEvent + ", akActorValue: " + akActorValue + ", akReactionValue: " + akReactionValue + ", akTarget: " + akTarget)

	if akActorValue == COM_Affinity
		Actor playerRef = Game.GetPlayer()
		float reactionValue = akReactionValue.GetValue()
		Trace(self, "HandleAffinityEvent() reactionValue: " + reactionValue)
		Trace(self, "HandleAffinityEvent() is COM_Affinity, will check for positive or negative...")	

		if reactionValue > 0 ;positive
			Trace(self, "HandleAffinityEvent() positive.")
			if playerRef.IsSpellTarget(Trait_EmpathDebuff) && playerRef.HasPerk(TRAIT_Empath)
				playerRef.DispelSpell(Trait_EmpathDebuff)
			endif
			TriggerEmpath(companionRef, Trait_EmpathBuff, Trait_EmpathyBuff_Msg)
		elseif reactionValue < 0 ; negative
			Trace(self, "HandleAffinityEvent() negative.")	
			if playerRef.IsSpellTarget(Trait_EmpathBuff) && playerRef.HasPerk(TRAIT_Empath)
				playerRef.DispelSpell(Trait_EmpathBuff)
			endif
			TriggerEmpath(companionRef, Trait_EmpathDebuff, Trait_EmpathyDebuff_Msg)
		else ;neutral
			Trace(self, "HandleAffinityEvent() neutral.")	
		endif

	endif

EndFunction

Function TriggerEmpath(ObjectReference CompanionRef, Spell SpellToCast, Message MessageToDisplay)
	bool playerHasPerk = Game.GetPlayer().HasPerk(TRAIT_Empath)
	Trace(self, "TriggerEmpath() playerHasPerk: " + playerHasPerk + ", CompanionRef: " + CompanionRef + ", SpellToCast: " + SpellToCast + ", MessageToDisplay: " + MessageToDisplay)
	if playerHasPerk
		SpellToCast.Cast(akSource = CompanionRef, akTarget = Game.GetPlayer())
		MessageToDisplay.Show()
	endif
EndFunction

Function HandleKidStuffTimer()
	Actor playerRef = Game.GetPlayer()
	MiscObject credits = Game.GetCredits()
	int playerCredits = playerRef.GetItemCount(credits)
	
	float weeklyParentalGiftPercentage = Trait_KidStuff_WeeklyParentalGiftPercentage.GetValue()
	int parentalGiftAmount = (playerCredits * Trait_KidStuff_WeeklyParentalGiftPercentage.GetValue()) as Int
	int parentalGiftMax = Trait_KidStuff_WeeklyParentalGiftMax.GetValueInt()
	
	if parentalGiftAmount > parentalGiftMax
		parentalGiftAmount = parentalGiftMax
	endif

	Trace(self, "HandleKidStuffTimer() playerCredits: " + playerCredits + ",  weeklyParentalGiftPercentage: " +  WeeklyParentalGiftPercentage + ", parentalGiftMax: " + parentalGiftMax + ", parentalGiftAmount: " + parentalGiftAmount)

	if parentalGiftAmount > 0
		; Remove the player's credits, silently.
		playerRef.RemoveItem(credits, parentalGiftAmount, abSilent = true)

		; Display a single message with the amount sent, and play the Credits removal SFX.
		int sfx = ITM_Credits_Down_WEF.Play(playerRef)
		Trait_KidStuff_Msg_SentCredits.Show(parentalGiftAmount)
	endif
EndFunction

Function StartKidStuffGameTimeTimer()
	float hoursUntilNextMondayAt8AM = GetHoursUntilNextMondayAt8AM()
	Trace(self, "StartKidStuffGameTimeTimer() hoursUntilNextMondayAt8AM: " + hoursUntilNextMondayAt8AM)
	StartTimerGameTime(hoursUntilNextMondayAt8AM, TimerID_KidStuff)
EndFunction


float Function GetHoursUntilNextMondayAt8AM()
	;game starts on a Sunday, at 0.3333 which is 8am
	;Sundays are thus multiples of 7
	;GameDaysPassed is 1 = 24 hours
	;8am = 1/24 = .04166 * 8 = .3333

	float currentDay = Utility.GetCurrentGameTime()

	;if game days passed is 10, and we want 14...
	;10 + 7 = 17, 17 mod 7 = 3, 17 -3 = 14
	int nextWeek = Math.Floor(CurrentDay + 7)
	int nextSunday = nextWeek - (nextWeek % 7)

	int nextMonday = nextSunday + 1 ;note, if currentDay is 0 then next monday is technically 1, but this will be 8. That's okay for our purposes because we want at least one week to pass
	float nextMondayAt8AM = nextMonday + 0.3333
	float daysUntilNextMondayAt8AM = nextMondayAt8AM - currentDay
	float hoursUntilNextMondayAt8AM = daysUntilNextMondayAt8Am * 24

	Trace(self, "GetHoursUntilNextMondayAt8AM()... ")
	Trace(self, "GetHoursUntilNextMondayAt8AM()... currentDay: " + currentDay)
	Trace(self, "GetHoursUntilNextMondayAt8AM()... nextWeek: " + nextWeek)
	Trace(self, "GetHoursUntilNextMondayAt8AM()... nextSunday: " + nextSunday)
	Trace(self, "GetHoursUntilNextMondayAt8AM()... nextMonday: " + nextMonday)
	Trace(self, "GetHoursUntilNextMondayAt8AM()... daysUntilNextMondayAt8AM: " + daysUntilNextMondayAt8AM)
	Trace(self, "GetHoursUntilNextMondayAt8AM()... hoursUntilNextMondayAt8AM: " + hoursUntilNextMondayAt8AM)

	return hoursUntilNextMondayAt8AM
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Traits",  string SubLogName = "SQ_TraitsQuestScript", bool bShowNormalTrace = true, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Traits",  string SubLogName = "SQ_TraitsQuestScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction