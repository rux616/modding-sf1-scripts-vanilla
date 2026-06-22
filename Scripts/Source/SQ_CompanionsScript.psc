Scriptname SQ_CompanionsScript extends SQ_ActorRolesScript


Struct AffinityLevelDatum
	GlobalVariable AffinityLevel
	{filter for: COM_AffinityLevel*}
		
	Message MessageToDisplay
	{filter for: SQ_Companions_AffinityLevel*Message}
EndStruct

Struct AngerLevelDatum
	GlobalVariable AngerLevel
	{filter for: COM_AngerLevel*}

	Message MessageToDisplay
	{filter for: SQ_Companions_AngerLevel*Message}

	float CoolDownTimerDuration = -1.0
	{(Default: -1; no timer) How long, in *game day hours*, of a duration for the "cool down" timer.}

	bool AutoDismiss = false
	{(Default: false) if true, when setting this anger state, also have the companion dismiss themselves}
EndStruct

Group Affinity
	ActorValue Property COM_Affinity Mandatory Const Auto
	{autofill; holds value of accrued affinity "points"}

	ActorValue Property COM_AffinityLevel Mandatory Const Auto
	{autofill; holds value equaling the related AffinityLevelData[i].AffinityLevel globalvariable}

	GlobalVariable Property COM_AffinityLevel_0_Neutral Mandatory Const Auto
	{autofill}

	GlobalVariable Property COM_AffinityLevel_1_Friendship Mandatory Const Auto
	{autofill}

	GlobalVariable Property COM_AffinityLevel_2_Affection Mandatory Const Auto
	{autofill}

	GlobalVariable Property COM_AffinityLevel_3_Commitment Mandatory Const Auto
	{autofill}

	GlobalVariable[] Property COM_AffinityLevel_EnumGlobals Mandatory Auto Hidden
	{an array of all possible values of the associated actorvalues created and filled in_Init_COM_AffinityLevel_EnumGlobals() which is called in OnInt() }

	AffinityLevelDatum[] Property AffinityLevelData Mandatory Const Auto
EndGroup

Group Anger
	ActorValue Property COM_AngerLevel Mandatory Const Auto
	{autofill; holds the current anger level (see globals in AngerLevelData) and description field in the COM_AngerLevel actorvalue}

	ActorValue Property COM_AngerSceneCompleted Mandatory Const Auto
	{autofill}

	GlobalVariable Property COM_AngerLevel_0_NotAngry Mandatory Const Auto
	{autofill}

	GlobalVariable Property COM_AngerLevel_1_Annoyed Mandatory Const Auto
	{autofill}

	GlobalVariable Property COM_AngerLevel_2_Angry Mandatory Const Auto
	{autofill}

	GlobalVariable Property COM_AngerLevel_3_Furious Mandatory Const Auto
	{autofill}

	GlobalVariable[] Property COM_AngerLevel_EnumGlobals Auto Hidden
	{an array of all possible values of the associated actorvalues created and filled in_Init_COM_AngerLevel_EnumGlobals() which is called in OnInt() }

	AngerLevelDatum[] Property AngerLevelData Mandatory Const Auto

	ActorValue Property COM_AngerReason Mandatory Const Auto
	{autofill; holds the last (or prioritized) anger reason - used to conditionalize anger scene dialogue}

	GlobalVariable[] Property COM_AngerReason_EnumGlobals Mandatory Const Auto
	{an array of all possible values of the associated actorvalues.
Note: This includes common as well as "companion specific" anger reasons}

	GlobalVariable Property COM_AngerReason_Common_0_NotAngry Mandatory Const Auto
	{autofill}

	GlobalVariable Property COM_AngerReason_Common_3_BreakCommitment Mandatory Const Auto
	{autofill}
EndGroup

Group Romance
	ActorValue Property COM_FlirtCount Mandatory Const Auto
	{autofill}

	ActorValue Property COM_IsRomantic Mandatory Const Auto
	{autofill}

	Keyword[] Property BedTypeKeywords Mandatory Const Auto
	{used to find beds for companion placement when player sleeps}

	ReferenceAlias Property SleepCompanion Mandatory Const Auto
	{autofill}

	ReferenceAlias Property SleepCompanionRomantic Mandatory Const Auto
	{autofill}

	ReferenceAlias Property PlayerBedNoReuse Mandatory Const Auto
	{autofill; forces non-romantic furniture to NOT be the player's bed when when refilling SleepCompanionFurniture, and to test romantic companions when they wake up if they are in the player's bed}

	ReferenceAlias Property SleepCompanionFurniture Mandatory Const Auto
	{autofill}

	Keyword Property COM_SleepTopic_PlayerWakesUp Mandatory Const Auto
	{autofill}

	Keyword Property COM_SleepTopic_WakeUpInPlayersBed Mandatory Const Auto
	{autofill}
EndGroup

Group Personal_Quest
	Message Property COM_PQ_AdvancingQuestWarning Mandatory Const Auto ;accessed in COM_CompanionQuestScript
	{autofill}

	Message Property COM_PQ_LockedInMsg Mandatory Const Auto
	{autofill}

	Message Property COM_PQ_LockedInReleasedMsg Mandatory Const Auto
	{autofill}

	Message Property COM_PQ_LockedInReminder Mandatory Const Auto
	{autofill}

	GlobalVariable Property COM_PQ_LockedInCompanion Mandatory Const Auto RequiresGuard(LockedinCompanionGuard)
	{autofill; will hold ID of companion who is locked in. Will be -1 if no one is locked in}

	ActorValue Property COM_PQ_LockedIn Mandatory Const Auto RequiresGuard(LockedinCompanionGuard)
	{autofill; 0 = not locked in, 1 = locked in}
Endgroup
CompanionActorScript PQ_LockedInActor
Activator Txt_Replace_QuestName

Group Misc
	Faction Property PotentialCrewFaction Mandatory Const Auto
	{autofill}
	
	SQ_TraitsQuestScript Property SQ_Traits Mandatory Const Auto
	{autofill}

	Keyword	Property Crew_CrewTypeElite Mandatory Const Auto
	{autofill}

	ReferenceAlias Property ActiveEliteCrew Mandatory Const Auto
	{autofill}

	Achievements_CompanionsAndEliteCrew Property Achievements_Quest Mandatory Const Auto
	{autofill}

	RefCollectionAlias Property CommitmentGifts Mandatory Const Auto
	{autofill}
EndGroup

Actor PlayerRef ;convenience, holds the player - set in OnInit()

Guard LockedinCompanionGuard
Keyword Property COM_NoSleepTeleportLocation Mandatory Const Auto

;************************************************************************************
;****************************           TIMERS          *****************************
;************************************************************************************
int TimerID_SleepWake = 1 const ;used to get companions to wake up after a moment so they are actually in furinture when player stops sleeping
float TimerDur_SleepWake = 2.0 const
Function StartTimer_SleepWake()
	StartTimer(TimerDur_SleepWake, TimerID_SleepWake)
EndFunction

Event OnTimer(int aiTimerID)
	Trace(self, "OnTimer() aiTimerID: " + aiTimerID)

	if aiTimerID == TimerID_SleepWake
		HandleTimer_SleepWake()
	endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM EVENTS 		*****************************
;************************************************************************************

;****************************  ActiveCompanionChanged	*****************************
CustomEvent ActiveCompanionChanged

Struct ActiveCompanionChangedArgs
	Actor NewActiveCompanion
	Actor OldActiveCompanion
EndStruct

ActiveCompanionChangedArgs Function GetActiveCompanionChangedArgsStruct(var[] akArgsFromEvent)
	return akArgsFromEvent[0] as ActiveCompanionChangedArgs
EndFunction

Function _SendActiveCompanionChanged(Actor NewActiveCompanion, Actor OldActiveCompanion)
	ActiveCompanionChangedArgs eventArgsStruct = new ActiveCompanionChangedArgs
	eventArgsStruct.NewActiveCompanion = NewActiveCompanion
	eventArgsStruct.OldActiveCompanion = OldActiveCompanion
	
	var[] args = new var[1]
	args[0] = eventArgsStruct

	SendCustomEvent("ActiveCompanionChanged", args)
EndFunction






;************************************************************************************
;****************************	   	INITIALIZATION		*****************************
;************************************************************************************
Event OnInit()
	Trace(self, "OnInit()")
    PlayerRef = Game.GetPlayer()
	_Init_COM_AngerLevel_EnumGlobals()
	_Init_COM_AffinityLevel_EnumGlobals()
EndEvent

Event OnQuestInit()
	RegisterForPlayerSleep()
EndEvent

Function _Init_COM_AngerLevel_EnumGlobals()
	Trace(self, "_Init_COM_AngerLevel_EnumGlobals() ")
	COM_AngerLevel_EnumGlobals = New GlobalVariable[0]
	COM_AngerLevel_EnumGlobals.Add(COM_AngerLevel_0_NotAngry)
	COM_AngerLevel_EnumGlobals.Add(COM_AngerLevel_1_Annoyed)
	COM_AngerLevel_EnumGlobals.Add(COM_AngerLevel_2_Angry)
	COM_AngerLevel_EnumGlobals.Add(COM_AngerLevel_3_Furious)

	Trace(self, "_Init_COM_AngerLevel_EnumGlobals() COM_AngerLevel_EnumGlobals: " + COM_AngerLevel_EnumGlobals)
EndFunction

Function _Init_COM_AffinityLevel_EnumGlobals()
	Trace(self, "_Init_COM_AffinityLevel_EnumGlobals() ")
	COM_AffinityLevel_EnumGlobals = New GlobalVariable[0]
	COM_AffinityLevel_EnumGlobals.Add(COM_AffinityLevel_0_Neutral)
	COM_AffinityLevel_EnumGlobals.Add(COM_AffinityLevel_1_Friendship)
	COM_AffinityLevel_EnumGlobals.Add(COM_AffinityLevel_2_Affection)
	COM_AffinityLevel_EnumGlobals.Add(COM_AffinityLevel_3_Commitment)

	Trace(self, "_Init_COM_AffinityLevel_EnumGlobals() COM_AffinityLevel_EnumGlobals: " + COM_AffinityLevel_EnumGlobals)
EndFunction




;************************************************************************************
;****************************       ROLE FUNCTIONS	 	*****************************
;************************************************************************************


;overriden parent function
Function _CustomSetRoleAvaliable(Actor ActorToUpdate)
	Trace(self, "_CustomSetRoleAvaliable() calling RecruitedCompanionOrEliteCrew() on Achievements_CompanionsAndEliteCrew.")
	Achievements_Quest.RecruitedCompanionOrEliteCrew(ActorToUpdate)
	ActorToUpdate.AddtoFaction(PotentialCrewFaction)
	SQ_Crew.SetRoleAvailable(ActorToUpdate, DisplayMessageIfChanged = true)
EndFunction
	
;overriden parent function
Function _CustomSetRoleUnavailable(Actor ActorToUpdate)
	SQ_Crew.SetRoleUnavailable(ActorToUpdate, DisplayMessageIfChanged = true)
EndFunction

;overriden parent script
;If ActiveAlias is a ReferenceAlias PriorActiveActor is the actor ActorToUpdateReplaced. Otherwise it will be None.
Function _CustomSetRoleActive(Actor ActorToUpdate, Actor PriorActiveActor)
	;dismiss any prior active companion
	if PriorActiveActor && PriorActiveActor != ActorToUpdate
		SetRoleInactive(PriorActiveActor)
	endif

	;also make Elite Crew stop following the player
	SQ_Crew.SetEliteCrewInactive(ActiveEliteCrew.GetActorReference(), sayUnassignedLine = true)

	;also make them Active Followers while Active Companions - but don't show messages for followerness
    SQ_Followers.SetRoleActive(ActorToUpdate, DisplayMessageIfChanged = false, AlsoSetAvailable = true)

	;also make them available for Crew Assignments:
	SQ_Crew.SetRoleAvailable(ActorToUpdate, DisplayMessageIfChanged = true)

	;if this represents a change, send the event
	if PriorActiveActor != ActorToUpdate
		_SendActiveCompanionChanged(ActorToUpdate, PriorActiveActor)
	endif

EndFunction

;overriden parent script
Function _CustomSetRoleInactive(Actor ActorToUpdate)
	;also make them Inactive Followers while Inactive Companions - but don't show messages for followerness
     SQ_Followers.SetRoleInactive(ActorToUpdate, DisplayMessageIfChanged = false, AlsoSetUnavailable = true, AlsoDisplayUnavailableMessage = false)

	;send an event to alert other scripts to this fact
	_SendActiveCompanionChanged(None, ActorToUpdate)

	;in case they are autodismissing because of combat
	ActorToUpdate.StopCombatAlarm()
	ActorToUpdate.StopCombat()

	;if they aren't actively a crew member, pretend they were by setting them to be crew and then unassigning them  - this is to gain the functionality that dismissed crew get to disembark, etc.
	;first check they are allowed to be crew (which the MQ turns off when we don't want them moved around, etc.)
	if SQ_Crew.IsRoleActive(ActorToUpdate) == false && SQ_Crew.IsRoleAvailable(ActorToUpdate)
		SpaceshipReference playerShipRef = SQ_Crew.HomeShip.GetReference() as SpaceshipReference
		SQ_Crew.AssignCrew(ActorToUpdate, playerShipRef)
		playerShipRef.UnassignCrew(ActorToUpdate)
	endif

EndFunction


;Returns true if the Actor is in ActiveCompanion refalias or (optionally) the AvailableCompanions refcollection
;NOTE: you can also check actorvalues for these as well:
;COM_ActiveCompanion
;COM_AvailableCompanion
bool Function IsCompanion(Actor ActorToCheck, Bool IncludeAvailableCompanions = true)
	return IsRole(ActorToCheck, IncludeAvailableCompanions)
EndFunction


;************************************************************************************
;**************************** OTHER EVENTS / FUNCTIONS  *****************************
;************************************************************************************

Event OnPlayerSleepStart(float afSleepStartTime, float afDesiredSleepEndTime, ObjectReference akBed)
	Trace(self, "OnPlayerSleepStart() afSleepStartTime: " + afSleepStartTime + ", afDesiredSleepEndTime: " + afDesiredSleepEndTime + ", akBed: " + akBed)
	HandlePlayerSleepStart(akBed)
EndEvent

Event OnPlayerSleepStop(bool abInterrupted, ObjectReference akBed)
	Trace(self, "OnPlayerSleepStop() abInterrupted: " + abInterrupted + ", akBed: " + akBed)
	HandlePlayerSleepStop()
EndEvent

;this is called by CompanionAffinityScript, defined in this script because we need an alias to use for text replacement
Function ShowAffinityLevelMessage(Actor Companion)
	Trace(self, "ShowAffinityLevelMessage()")

	GlobalVariable affinityEnumGlobal = Companion.GetValueEnumGlobal(COM_AffinityLevel, COM_AffinityLevel_EnumGlobals)
	
	if affinityEnumGlobal
		AffinityLevelDatum foundDatum = GetAffinityLevelDatum(affinityEnumGlobal)
		if foundDatum
			Message msg = foundDatum.MessageToDisplay
			if msg
				ShowTextReplacedMessage(Companion, msg)
			endif
		endif
	EndIf
EndFunction

AffinityLevelDatum Function GetAffinityLevelDatum(GlobalVariable AffinityLevel)
	int iFound = AffinityLevelData.FindStruct("AffinityLevel", AffinityLevel)
	if iFound > -1
		return AffinityLevelData[iFound]
	else
		Warning(self, "GetAffinityLevelDatum() COULD NOT FIND A MATCHING STRUCT!!!!  AffinityLevel: " + AffinityLevel)
	endif
EndFunction

;called by COM_CompanionQuestScript in "final" Story Gate Scenes to do the actual increasing of AffinityLevel
;AffinityLevel is a global like "COM_Affinity_<N>_<Level>"
Function SetAffinityLevel(Actor Companion, GlobalVariable AffinityLevel)
	Trace(self, "SetAffinityLevel()	Companion: " + Companion + ", AffinityLevel: " + AffinityLevel)
	Companion.SetValue(COM_AffinityLevel, AffinityLevel.GetValue())
	ShowAffinityLevelMessage(Companion)

	Trace(self, "SetAffinityLevel()	calling AffinityLevelReached() on Achievements_CompanionsAndEliteCrew")
	Achievements_Quest.AffinityLevelReached(Companion)

	if AffinityLevel == SQ_Companions.COM_AffinityLevel_1_Friendship
		Trace(self, "SetAffinityLevel(), now at Friendship, will call AwardSecondChance()")
		(Companion as CompanionActorScript).COM_CompanionQuest.AwardSecondChance()
	endif
EndFunction

;returns a sorted array with HIGHER affinity in earlier indices
;sorted first by affinity level, then by affinity - per HasGreaterAffinityThanTestedCompanion() function
Function SortCompanionArrayByAffinity(CompanionActorScript[] CompanionArray, bool ExcludeLockedInCompanion = false)
	Trace(self, "SortCompanionArrayByAffinity() CompanionArray: " + CompanionArray + ", ExcludeLockedInCompanion: " + ExcludeLockedInCompanion)

	if ExcludeLockedInCompanion
		int i = CompanionArray.length - 1 
		While (i > -1)
			if IsCompanionLockedIn(CompanionArray[i])
				CompanionArray.remove(i)
			endif

			i -= 1
		EndWhile
	endif

	Trace(self, "SortCompanionArrayByAffinity() pre-sorted CompanionArray: " + CompanionArray)

	;this is a bubble sort, which easy to implement but slow, however we only ever expect to have a small number of companions
	int i = 0
	While (i < CompanionArray.length - 1)
		int j = 0
		While (j < CompanionArray.length - i - 1)
			CompanionActorScript companionA = CompanionArray[j]
			CompanionActorScript companionB = CompanionArray[j + 1]

			if companionB.HasGreaterAffinityThanTestedCompanion(CompanionA)
				;B is greater, swap it with A
				CompanionArray[j] = companionB
				CompanionArray[j + 1] = companionA
			endif

			j += 1

		EndWhile

		i += 1
	EndWhile

	Trace(self, "SortCompanionArrayByAffinity() sorted CompanionArray: " + CompanionArray)
EndFunction


;Sets anger actorvalue, anger reason actor value, and displays a message
;*** IMPORTANT ****
;*** You probably want to call this on the COM_COmpanionQuestScript to get the wants to talk, etc. handling)
Function SetAngerLevel(CompanionActorScript Companion, GlobalVariable AngerLevel, GlobalVariable AngerReason)
	Trace(self, "SetAngerLevel() Companion: " + Companion + ", AngerLevel: " + AngerLevel + ", AngerReason: " + AngerReason)


	;********** Set Anger Reason
	if AngerReason != COM_AngerReason_Common_0_NotAngry
		Trace(self, "SetAngerLevel() calling _GetPrioritizedAngerReason()")
		AngerReason = _GetPrioritizedAngerReason(Companion, AngerReason, Companion.COM_CompanionQuest.PrioritizedAngerReasons)
		Trace(self, "SetAngerLevel() COM_AngerReason is now: " + COM_AngerReason)
	endif

	;if the anger level is not angry, force the AngerReason to be not angry as well (for dialogue conditions, etc.)
	if AngerLevel == COM_AngerLevel_0_NotAngry
		Trace(self, "SetAngerLevel() AngerLevel == COM_AngerLevel_0_NotAngry, forcing AngerReason to COM_AngerReason_Common_0_NotAngry")
		AngerReason = COM_AngerReason_Common_0_NotAngry
	endif

	Trace(self, "SetAngerLevel() setting COM_AngerReason to: " + AngerReason.GetValue())
	Companion.SetValue(COM_AngerReason, AngerReason.GetValue())

	
	AngerLevelDatum foundDatum = GetAngerLevelDatum(AngerLevel)
	
	if foundDatum
		Companion.SetValue(COM_AngerLevel, foundDatum.AngerLevel.GetValue())
		 
		if foundDatum.MessageToDisplay
			Trace(self, "SetAngerLevel() showing message: " + foundDatum.MessageToDisplay)
			ShowTextReplacedMessage(Companion, foundDatum.MessageToDisplay)
		endif

		if foundDatum.AutoDismiss
			
			if SQ_Companions.IsCompanionLockedIn(Companion)
				Trace(self, "SetAngerLevel() is *NOT* AUTO DISMISSING because companion is Locked In")
			else
				Trace(self, "SetAngerLevel() is AUTO DISMISSING! Calling SetRoleInactive()")
				SetRoleInactive(Companion, DisplayMessageIfChanged = true)
			endif

			if AngerReason == COM_AngerReason_Common_3_BreakCommitment
				;we don't have a scene for being angry for breaking up, so we don't set COM_AngerSceneCompleted to 0
			else
				Trace(self, "SetAngerLevel() setting COM_AngerSceneCompleted to 0")
				Companion.SetValue(COM_AngerSceneCompleted, 0) ;also set by COM_CompanionQuestScript
			endif
		endif

	else
		Warning(self, "SetAngerLevel() DID NOT FIND A STRUCT FOR AngerLevel: " + AngerLevel)
	endif
EndFunction

;if currently angry, get whichever is the higher priority anger reason
GlobalVariable Function _GetPrioritizedAngerReason(Actor Companion, GlobalVariable NewReason, GlobalVariable[] PrioritizedAngerReasons)
	GlobalVariable returnVal = NewReason
	GlobalVariable currentReason = Companion.GetValueEnumGlobal(COM_AngerReason, COM_AngerReason_EnumGlobals)

	Trace(self, "GetPrioritizedAngerReason() Companion: " + Companion + ", NewReason: " + NewReason + "currentReason: " + currentReason + ", PrioritizedAngerReasons: " + PrioritizedAngerReasons)

	;get whichever is lower in the priority list
	if currentReason != None
		int iCurrentReason = PrioritizedAngerReasons.Find(currentReason)
		int iNewReason = PrioritizedAngerReasons.Find(NewReason)
		
		Trace(self, "GetPrioritizedAngerReason() iCurrentReason: " + iCurrentReason + ", iNewReason: " + iNewReason)

		if iCurrentReason > -1 && iNewReason > -1
			;we have both. So we want whichever is in the lower index (which means higher priority)
			if iCurrentReason < iNewReason
				returnVal = currentReason
			else
				returnVal = NewReason
			endif
		else
			;only one or none is in the prioritized list. We want ever one is in there (if any)
			if iCurrentReason > -1
				returnVal = currentReason
			elseif iNewReason > -1
				returnVal = NewReason
			EndIf
		endif
	endif

	Trace(self, "GetPrioritizedAngerReason() returnVal: " + returnVal)
	return returnVal
EndFunction

GlobalVariable Function GetAngerLevel(Actor Companion)
	Trace(self, "GetAngerLevel() Companion: " + Companion)
	GlobalVariable returnVar = Companion.GetValueEnumGlobal(COM_AngerLevel, COM_AngerLevel_EnumGlobals)
	
	Trace(self, "GetAngerLevel() returnVar: " + returnVar)
	return returnVar
EndFunction

;Returns a cool down duration based on the actor's current anger level
;return value of -1 means "don't start a timer"
float Function GetAngerCoolDownTimerDuration(Actor Companion)
	Trace(self, "GetAngerCoolDownTimerDuration() Companion: " + Companion)

	float returnVal = -1

	AngerLevelDatum foundDatum = GetAngerLevelDatum(Companion.GetValueEnumGlobal(COM_AngerLevel, COM_AngerLevel_EnumGlobals))
	
	if foundDatum
		returnVal = foundDatum.CoolDownTimerDuration
	endif

	Trace(self, "GetAngerCoolDownTimerDuration() returnVal: " + returnVal)
	return returnVal
EndFunction

AngerLevelDatum Function GetAngerLevelDatum(GlobalVariable AngerLevel)
	int iFound = AngerLevelData.FindStruct("AngerLevel", AngerLevel)
	if iFound > -1
		return AngerLevelData[iFound]
	else
		Warning(self, "GetAngerLevelDatum() COULD NOT FIND A MATCHING STRUCT!!!!  AngerLevel: " + AngerLevel)
	endif
EndFunction

Function IncrementFlirtCount(CompanionActorScript Companion)
	Trace(self, "IncrementFlirtCount()")
	Companion.SetValue(COM_FlirtCount, Companion.GetValue(COM_FlirtCount) + 1)
	Trace(self, "IncrementFlirtCount() new value: " + Companion.GetValue(COM_FlirtCount))
EndFunction

Function HandlePlayerSleepStart(ObjectReference PlayerBedRef) Private
	Trace(self, "HandlePlayerSleepStart() PlayerBedRef: " + PlayerBedRef)

	if PlayerBedRef.GetCurrentLocation().HasKeyword(COM_NoSleepTeleportLocation) == 1
		Trace (self, "HandlePlayerSleepStart() location has COM_NoSleepTeleportLocation! BAILING!")
		Return
	endif

	;make sure non-romantic companions don't pick the player bed
	PlayerBedNoReuse.ForceRefTo(PlayerBedRef)

	;is there an active companion?
	CompanionActorScript companionRef = GetActiveActor() as CompanionActorScript

	if companionRef
		;use the active companion
		SleepCompanion.ForceRefTo(CompanionRef)
	else
		;get a nearby romantic companion
		SleepCompanionRomantic.RefillAlias() ;the alias fill is set to force into SleepCompanion alias when it fills
	endif

	;if we don't have a current companion or a nearby romantic one, get a random nearby companions
	if SleepCompanion.GetReference() == None
		;get a nearby companion (See COM_CND_SleepCompanion form for details)
		SleepCompanion.RefillAlias() ;this alias has package to make them get into the furniture
	endif

	;get the companion in the sleepcompanion alias
	companionRef = SleepCompanion.GetReference() as CompanionActorScript

	;if we have a sleep companion, pick the bed
	if companionRef
		if IsCompanionRomantic(companionRef)
			;use the player bed
			SleepCompanionFurniture.ForceRefTo(PlayerBedRef)
		Else
			;if not romantic, find nearby appropriate furniture (see COM_CND_SleepCompanionFurniture form for details)
			SleepCompanionFurniture.RefillAlias() 
		EndIf

		ObjectReference sleepCompanionFurnitureRef = SleepCompanionFurniture.GetReference()

		;GEN-500356: Preventing NPCs from get moved if they're in a scene, as they'll likely have packages
		if !companionRef.IsInScene()
			if sleepCompanionFurnitureRef && sleepCompanionFurnitureRef.GetActorOwner() == None && sleepCompanionFurnitureRef.GetFactionOwner() == None && (PlayerRef.HasDetectionLOS(sleepCompanionFurnitureRef) || SleepCompanionFurniture.GetRef() == PlayerBedRef)
				bool snappedIntoFurnitureSuccess = companionRef.MoveToFurniture(sleepCompanionFurnitureRef)
				Trace(self, "HandlePlayerSleepStart() snappedIntoFurnitureSuccess: " + snappedIntoFurnitureSuccess)
			else
				;there is no appropriate nearby furniture, so move to player instead
				Trace(self, "HandlePlayerSleepStart() sleepCompanionFurnitureRef == NONE, will moveto player instead ")
				companionRef.MoveTo(Game.GetPlayer())
			endif
		endif

		Trace(self, "HandlePlayerSleepStart() SleepCompanion.GetReference(): " + SleepCompanion.GetReference())
		Trace(self, "HandlePlayerSleepStart() sleepCompanionFurnitureRef: " + sleepCompanionFurnitureRef)
	EndIf

EndFunction


Function HandlePlayerSleepStop() Private
	Trace(self, "HandlePlayerSleepStop()")

	CompanionActorScript sleepCompanionRef = SleepCompanion.GetReference() as CompanionActorScript

	if sleepCompanionRef

		ObjectReference sleepCompanionFurnitureRef = SleepCompanionFurniture.GetReference()
		;say a line based on where they are`
		if sleepCompanionFurnitureRef == PlayerBedNoReuse.GetReference()
				Trace(self, "HandlePlayerSleepStop() sleep companion in the player's bed, calling SayCustom(COM_SleepTopic_WakeUpInPlayersBed)")
				sleepCompanionRef.SayCustom(COM_SleepTopic_WakeUpInPlayersBed)
		else
			Trace(self, "HandlePlayerSleepStop() sleep companion isn't in player's bed (could be a bed or chair or sandboxing), calling SayCustom(COM_SleepTopic_PlayerWakesUp)")
			sleepCompanionRef.SayCustom(COM_SleepTopic_PlayerWakesUp)
		endif
	endif

	StartTimer_SleepWake()
EndFunction

;give them a moment for player to see them sitting/sleeping before they start getting up.
Function HandleTimer_SleepWake() Private
	Actor sleepCompanionRef = SleepCompanion.GetActorReference()
	PlayerBedNoReuse.Clear()
	SleepCompanionRomantic.Clear()
	SleepCompanion.Clear()
	SleepCompanionFurniture.Clear()
	sleepCompanionRef.EvaluatePackage()
EndFunction


;MaxDistance (optional): if > 0, do not include romantic companiosn greater than this distance
CompanionActorScript[] Function GetRomanticCompanions(float MaxDistance = 0.0, bool GetFirstOnly = false)
	Trace(self, "GetRomanticCompanions() MaxDistance: " + MaxDistance + "GetFirstOnly: " + GetFirstOnly)
	CompanionActorScript[] availableCompanions = GetAvailableActors() as CompanionActorScript[]
	CompanionActorScript[] romanticCompanions = new CompanionActorScript[0]

	int i = 0
	While (i < availableCompanions.length)
		CompanionActorScript currentCompanionRef = availableCompanions[i]
		
		if currentCompanionRef.IsRomantic() && (MaxDistance <= 0 || currentCompanionRef.GetDistance(Game.GetPlayer()) <= MaxDistance)
			romanticCompanions.Add(currentCompanionRef)
			if GetFirstOnly
				i = availableCompanions.length ;bail early
			endif
		endif

		i += 1
	EndWhile

	Trace(self, "GetRomanticCompanions() returning romanticCompanions: " + romanticCompanions)
	return romanticCompanions
EndFunction

bool Function IsCompanionRomantic(CompanionActorScript Companion)
	Trace(self, "IsCompanionRomantic()")

	bool returnVal =  Companion.GetValue(SQ_Companions.COM_IsRomantic) >= 1

	Trace(self, "IsCompanionRomantic() returning returnVal: " + returnVal)

	return returnVal
EndFunction

bool Function IsCompanionLockedIn(CompanionActorScript SpecificCompanionToTest = None)
	LockGuard LockedinCompanionGuard	
		Trace(self, "IsCompanionLockedIn() SpecificCompanionToTest: " + SpecificCompanionToTest)

		bool returnVal

		if SpecificCompanionToTest != None
			returnVal = SpecificCompanionToTest == PQ_LockedInActor
		else
			returnVal = COM_PQ_LockedInCompanion.GetValue() > -1
		endif

		Trace(self, "IsCompanionLockedIn() returnVal: " + returnVal)

		return returnVal

	EndLockGuard
EndFunction

Function LockInCompanion(CompanionActorScript Companion, bool LockedIn = true, Message CustomMessage = None, Activator TextReplaceActivator = None)

	LockGuard LockedinCompanionGuard
		Trace(self, "LockInCompanion() Companion: " + Companion + ", LockedIn: " + LockedIn)
		
		Txt_Replace_QuestName = TextReplaceActivator
		ObjectReference QuestNameRef = Companion.PlaceAtMe(Txt_Replace_QuestName, abInitiallyDisabled = true)
		Alias_MessageTextReplaceRef.ForceRefTo(QuestNameRef)

		Message messageToShow = CustomMessage

		if LockedIn
			;warn if there's already a locked in companion, we are not expecting this - but also try to handle it
			if COM_PQ_LockedInCompanion.GetValue() > -1
				Warning(self, "LockInCompanion() there is already a locked in companion. Setting COM_PQ_LockedIn to 0 for PQ_LockedInActor: " + PQ_LockedInActor)
				PQ_LockedInActor.SetValue(COM_PQ_LockedIn, 0)
				
				if CustomMessage == None
					messageToShow = COM_PQ_LockedInReleasedMsg
				endif

				ShowTextReplacedMessage(PQ_LockedInActor, messageToShow, ShowAsHelpMessage = true, MessageTextReplaceRef = QuestNameRef)
			endif

			if CustomMessage == None
				messageToShow = COM_PQ_LockedInMsg
			endif

			ShowTextReplacedMessage(Companion, messageToShow, ShowAsHelpMessage = true, MessageTextReplaceRef = QuestNameRef)
			
			;if companion isn't the current companion and folowing make sure they are
			Trace(self, "LockInCompanion() IsCompanion(): " + IsCompanion(Companion, IncludeAvailableCompanions = false))
			if IsCompanion(Companion, IncludeAvailableCompanions = false) == false
				;also make sure we CAN be a companion first
				if IsRoleAvailable(companion)
					SetRoleActive(companion)
				endif
			endif

			Trace(self, "LockInCompanion() post SetRoleActive() IsCompanion(): " + IsCompanion(Companion, IncludeAvailableCompanions = false))

			Companion.SetValue(COM_PQ_LockedIn, 1)
			COM_PQ_LockedInCompanion.SetValue(Companion.GetCompanionIDValue())
			PQ_LockedInActor = Companion

			CompanionActorScript[] availableCompanions = GetAvailableActors() as CompanionActorScript[]
			int i = 0
			While (i < availableCompanions.length)
				CompanionActorScript currentCompanion = availableCompanions[i]
				Trace(self, "LockInCompanion() calling CheckAndSetWantsToTalk() on all availableCompanion's COM_CompanionQuestScript")
				currentCompanion.COM_CompanionQuest.CheckAndSetWantsToTalk()
				i += 1
			EndWhile

		else ;LockedIn == false
			Companion.SetValue(COM_PQ_LockedIn, 0)
			COM_PQ_LockedInCompanion.SetValue(-1)

			if CustomMessage == false 
				messageToShow = COM_PQ_LockedInReleasedMsg
			endif
		
			ShowTextReplacedMessage(Companion, messageToShow, ShowAsHelpMessage = true, MessageTextReplaceRef = QuestNameRef)

			PQ_LockedInActor = None
		endif

	EndLockGuard
EndFunction


Function PersonalQuestReminder()
	Trace(self, "PersonalQuestReminder()")

	ObjectReference QuestNameRef = PQ_LockedInActor.PlaceAtMe(Txt_Replace_QuestName, abInitiallyDisabled = True)
	ShowTextReplacedMessage(PQ_LockedInActor, COM_PQ_LockedInReminder, ShowAsHelpMessage = true, MessageTextReplaceRef = QuestNameRef)
EndFunction

;************************************************************************************
;****************************	   DEBUG FUNCTIONS 		*****************************
;************************************************************************************
Function DebugCompanion(Actor Companion)
	Trace(self, "DebugMakeCompanion() Companion: " + Companion)
	SetRoleActive(Companion)
	Companion.MoveTo(PlayerRef)
EndFunction


Function DebugModAffinity(Actor Companion, float Amount)
	Trace(self, "DebugModAffinity() Companion: " + Companion + ", Amount: " + Amount)
	Companion.AddPassiveAffinity(Amount)
	Trace(self, "DebugModAffinity() GetValue(COM_Affinity) is now: " + Companion.GetValue(COM_Affinity))
EndFunction



;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
;*** lives on parent SQ_ActorRolesScript ****