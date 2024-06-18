Scriptname COM_CompanionQuestScript extends Quest
{Script attached to COM_Companion_<CompanionName> quest}

Struct StoryGateDatum
int GateNumber
GlobalVariable TimerDuration
{in seconds, how long does the companion need to be following player to unlock the gate?
filter for: COM_StoryGate_TimerDuration}
EndStruct

Group Autofill
SQ_FollowersScript Property SQ_Followers Mandatory Const Auto

SQ_CompanionsScript Property SQ_Companions Mandatory Const Auto

ActorValue Property COM_StoryGatesCompleted Mandatory Const Auto

ActorValue Property COM_CurrentStoryGateTimerExpired Mandatory Const Auto

ActorValue Property COM_PersonalQuest_Started Mandatory Const Auto
ActorValue Property COM_PersonalQuest_Finished Mandatory Const Auto

ActorValue Property COM_CommitmentQuest_Started Mandatory Const Auto

ActorValue Property COM_AngerCoolDownTimerExpired Mandatory Const Auto
{0 = not expired (timer currently running)
1 = expired (timer not currently running)}

ActorValue Property COM_AngerSceneCompleted Mandatory Const Auto
{0 = not completed yet
1 = completed}

ActorValue Property COM_AngerSecondChances Mandatory Const Auto

GlobalVariable Property COM_AffinityLevel_1_Friendship Mandatory Const Auto
GlobalVariable Property COM_AffinityLevel_2_Affection Mandatory Const Auto
GlobalVariable Property COM_AffinityLevel_3_Commitment Mandatory Const Auto

ActorValue Property COM_IsRomantic Mandatory Const Auto

ActorValue Property COM_HasBeenRomantic Mandatory Const Auto

ActorValue Property COM_CommitmentPossible Mandatory Const Auto
ActorValue Property COM_CommitmentDesired Mandatory Const Auto

ActorValue Property COM_IsCommitted Mandatory Const Auto

ActorValue Property COM_CommitmentRefusedPermanently Mandatory Const Auto

ActorBase Property Companion_Andreja Mandatory Const Auto
AffinityEvent Property COM_Event_PlayerBecomesRomantic_AndrejaJealous Mandatory Const Auto

EndGroup

Group Aliases
ReferenceAlias Property Alias_Companion Mandatory Const Auto
{The companion who this COM_Companion quest belongs to}

ReferenceAlias Property Alias_PlayerShipCrewMarker Mandatory Const Auto

LocationAlias Property Alias_PlayerShipInteriorLocation Mandatory Const Auto
EndGroup

Group StoryGates
	StoryGateDatum[] Property StoryGateData Mandatory Const Auto

	ActorValue Property COM_StarbornSaveActorValue_MaxStoryGate Mandatory Const Auto 
	{The av used to store the maximum story gate reach in any play through
	IMPORTANT: this also needs to be in the formlist: StarbornSaveActorValues
	filter for: COM_StarbornSaveActorValue_MaxStoryGate_* }
EndGroup

Group Quests
Quest Property PersonalQuest Mandatory Const Auto
{The quest that takes player from friendship to affection}

Quest Property CommitmentQuest Mandatory Const Auto
{The quest that implements the "commitment ceremony"}

EndGroup

Group AdditionalData
Perk Property CompanionCheckPerk Mandatory Const Auto
{The perk used to pick companion speak for player lines in dialogue
filter for: CompanionCheck}

EndGroup

Group WantsToTalk
Scene Property WantsToTalkAnnouncementScene Mandatory Const Auto
{where the companion blurts out they want to talk - this is likely just a one line scene
NOTE: conditions on the scene dialogue should cover cool downs, etc. as various things will trigger this scene to start}

ConditionForm Property WantsToTalkConditionForm Mandatory Const Auto
{condition form that will be test against to turn on "wants to talk" functionality, will need to be true in all cases, such as affinity gates, anger, important quest response scenes, etc.
Filter for: COM_CND_WantsToTalk_*}

int Property WantsToTalkObjective = 10 Const Auto
EndGroup

Group Anger
	GlobalVariable[] Property PrioritizedAngerReasons Mandatory Const Auto
	{Lower indexes = higher priority.
Filter for: COM_AngerReason_*
New anger reasons are ignored if current anger reason is in this list, and has lower index than the new reason.
This should normally only include things like murder that wouldn't be superceded by other, even more recent reasons to be angry.
There might only be one thing in this list (ex: murder).}
EndGroup

Group Flirting
	GlobalVariable Property COM_FlirtCooldownDays Mandatory Const Auto
	{autofill}
	ActorValue Property COM_FlirtCount Mandatory Const Auto
	{autofill}
	ActorValue Property COM_FlirtCooldownExpiry Mandatory Const Auto
	{autofill}

	ActorValue Property COM_FlirtChoice Mandatory Const Auto
	{autofill; 0 to FlirtChoiceMax - used to conditionalize scene phases of variations of flirt dialogue choices for the player}

	int Property FlirtChoiceMax = 2 Const Auto
	{COM_FlirtChoice will be 0 to FlirtChoiceMax - represents which sets choices player will get each flirt scene play through
Example: three sets of flirt phases, set FlirtChoiceMax to 2}
EndGroup

int TimerID_StoryGate = 1 ;Reminder, durations for this are in StoryGateData
int GameTimerID_AngerCoolDown = 2; Reminder, durations for this are retrieved in SetAngerLevel()

bool StartedStoryGateTimerOnce ;used to make sure we set the timer the first time the companion starts traveling with the player

;values that will be stored in COM_AngrerCoolDownTimerRunning
int iAngerTimerNotRunning = 0
int iAngerTimerRunning = 1


CompanionActorScript CompanionRef

Event OnQuestInit()
	CompanionRef = Alias_Companion.GetActorRef() as CompanionActorScript

	RegisterForRemoteEvent(CompanionRef, "OnAffinityEvent")
	RegisterForRemoteEvent(CompanionRef, "OnLocationChange")
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	RegisterForCustomEvent(SQ_Companions, "ActiveCompanionChanged")
EndEvent

;started in StoryGateCompleted()
Event OnTimer(int aiTimerID)
	Trace(self, "OnTimer() aiTimerID: " + aiTimerID)

	if aiTimerID == TimerID_StoryGate
		Trace(self, "OnTimer() TimerID_StoryGate, setting COM_CurrentStoryGateTimerExpired to 1 for CompanionRef: " + CompanionRef)
		CompanionRef.setValue(COM_CurrentStoryGateTimerExpired, 1)
		CheckAndSetWantsToTalk()
	endif

EndEvent

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == GameTimerID_AngerCoolDown
		Trace(self, "OnTimerGameTime() GameTimerID_AngerCoolDown")
		
		Trace(self, "OnTimerGameTime() GameTimerID_AngerCoolDown. Setting COM_AngerCoolDownTimerExpired to 1 and calling CheckAngerAndSetNotAngry()")
		CompanionRef.SetValue(COM_AngerCoolDownTimerExpired, 1)
		CheckAngerAndSetNotAngry()
	endif
EndEvent

Event SQ_CompanionsScript.ActiveCompanionChanged(SQ_CompanionsScript akSender, var[] akArgs)
	Trace(self, "ActiveCompanionChanged() akSender: " + akSender + ", akArgs: " + akArgs)

	if CompanionRef == SQ_Companions.GetActiveCompanionChangedArgsStruct(akArgs).NewActiveCompanion
		PickedUpAsCompanion()
	else
		DismissedAsCompanion()
	endif
EndEvent

Event Actor.OnAffinityEvent(Actor akSender, AffinityEvent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
	Trace(self, "OnAffinityEvent() akSender: " + akSender + ", akAffinityEvent: " + akAffinityEvent + ", akActorValue: " + akActorValue + ", akReactionValue: " + akReactionValue)

	Trace(self, "OnAffinityEvent() calling CheckAndSetWantsToTalk()")
	CheckAndSetWantsToTalk()
EndEvent

event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	Trace(self, "OnLocationChange() akSender: " + akSender + ", akOldLoc: " + akOldLoc + ", akNewLoc: " + akNewLoc)
	
	if akSender == CompanionRef
		Trace(self, "OnLocationChange() calling CheckAndSetWantsToTalk(SayDialogue = false)")
		CheckAndSetWantsToTalk(SayDialogue = false)
	endif

EndEvent

Function CheckAngerAndSetNotAngry()
	bool angerSceneCompelted = CompanionRef.GetValue(COM_AngerSceneCompleted) == 1
	bool angerCoolDownExpired = CompanionRef.GetValue(COM_AngerCoolDownTimerExpired) == 1
	GlobalVariable angerLevelGlobal = SQ_Companions.GetAngerLevel(CompanionRef)

	Trace(self, "CheckAngerAndSetNotAngry() angerSceneCompelted: " + angerSceneCompelted)
	Trace(self, "CheckAngerAndSetNotAngry() angerCoolDownExpired: " + angerCoolDownExpired)
	Trace(self, "CheckAngerAndSetNotAngry() angerLevelGlobal: " + angerLevelGlobal)
	if angerSceneCompelted && angerCoolDownExpired && angerLevelGlobal == SQ_Companions.COM_AngerLevel_2_Angry
		Trace(self, "CheckAngerAndSetNotAngry() calling MakeNotAngry()")
		MakeNotAngry()
	endif
EndFunction

;called by the scene that picks up this companion
function PickupSceneEnded()
	Game.StopDialogueCamera()
	Trace(self, "PickupSceneEnded()")
	if SQ_Companions.IsCompanionLockedIn() == false
		SQ_Companions.SetRoleActive(CompanionRef)
	endif
EndFunction

;called by the scene tha dismisses this companion - indirect dismissal like in another companions pickup scene, etc. is handled elsewhere
Function DismissSceneEnded()
	Trace(self, "DismissSceneEnded()")
	if SQ_Companions.IsCompanionLockedIn(CompanionRef) == false
		SQ_Companions.SetRoleInactive(CompanionRef)
	endif
EndFunction

Function WaitSceneEnded()
	Trace(self, "WaitSceneEnded()... calling SQ_Followers.CommandWait() CompanionRef: " + CompanionRef)
	SQ_Followers.CommandWait(CompanionRef)
EndFunction

Function FollowSceneEnded()
	Trace(self, "FollowSceneEnded()... calling SQ_Followers.CommandFollow() CompanionRef: " + CompanionRef)
	SQ_Followers.CommandFollow(CompanionRef)
EndFunction

Function TalkAboutQuestEventSceneEnded(ActorValue AssociatedActorValue)
	Trace(self, "TalkAboutQuestEventSceneEnded() clearing AssociatedActorValue: " + AssociatedActorValue)
	Trace(self, "TalkAboutQuestEventSceneEnded() value before clear: " + CompanionRef.GetValue(AssociatedActorValue))
	CompanionRef.SetValue(AssociatedActorValue, 0)
	Trace(self, "TalkAboutQuestEventSceneEnded() value is now: " + CompanionRef.GetValue(AssociatedActorValue))
	CheckAndSetWantsToTalk()
EndFunction

Function GiveItemSceneEnded()
	(Alias_Companion.GetReference() as COM_CREW_GiveItemActorScript).GiveItems()
EndFunction

Function FlirtSceneEnded()

	;set expiry day to allow flirt top level
	float flirtExpiryDay = Utility.ExpiryDay(COM_FlirtCooldownDays.GetValue())
	Trace(self, "FlirtSceneEnded() setting COM_FlirtCooldownExpiry to flirtExpiryDay: " + flirtExpiryDay)
	CompanionRef.SetValue(COM_FlirtCooldownExpiry, flirtExpiryDay)

	;increment flirt count
	float newFlirtCount = CompanionRef.GetValue(COM_FlirtCount) + 1
	Trace(self, "FlirtSceneEnded() setting COM_FlirtCount to newFlirtCount: " + newFlirtCount)
	CompanionRef.SetValue(COM_FlirtCount, newFlirtCount)

	;set flirt choice av to determine which set of flirt options the player will receive on the next play through of the scen
	int nextFlirtChoice = CompanionRef.IncrementLoopingValue(COM_FlirtChoice, FlirtChoiceMax)
	Trace(self, "FlirtSceneEnded() set COM_FlirtChoice to nextFlirtChoice: " + nextFlirtChoice)


EndFunction

;called by: SQ_CompanionsScript.ActiveCompanionChanged above
Function PickedUpAsCompanion()
	Trace(self, "PickedUpAsCompanion() will add to player: CompanionCheckPerk: " + CompanionCheckPerk)
	Game.GetPlayer().AddPerk(CompanionCheckPerk)
	
	Trace(self, "PickedUpAsCompanion() will RESUME timer")
	if StartedStoryGateTimerOnce == false
		Trace(self, "PickedUpAsCompanion() StartedStoryGateTimerOnce == false. Calling StoryGateCompelted() to trigger the timer, set story gate av to 1, etc.")
		StartedStoryGateTimerOnce = true
		StoryGateSceneCompleted(IncrementAV = false) ;we call this once to start timer, set the current gate to 1, etc.
	Else
		PauseTimer(TimerID_StoryGate, false)
	endif
EndFunction


;note: this functionality lives outside the PickupSceneEnded() because this could happen outside those scenes
Function DismissedAsCompanion()
	Trace(self, "DismissedAsCompanion() will remove from player: CompanionCheckPerk: " + CompanionCheckPerk)
	Game.GetPlayer().RemovePerk(CompanionCheckPerk)

	Trace(self, "DismissedAsCompanion() will PAUSE timer")
	PauseTimer(TimerID_StoryGate, true)
EndFunction


;TEMP until we have a real solution for player ship stuff
bool Function OnPlayerShip(Actor ActorToCheck, Location LocationToCheck)
	return ActorToCheck.GetCurrentLocation() == Alias_PlayerShipInteriorLocation.GetLocation()
EndFunction

Function CheckAndSetWantsToTalk(bool SayDialogue = true)
	Trace(self, "CheckAndSetWantsToTalk() SayDialogue: " + SayDialogue)

	bool WantsToTalk = WantsToTalkConditionForm.IsTrue(CompanionRef, Game.GetPlayer())
	Trace(self, "CheckAndSetWantsToTalk() WantsToTalk: " + WantsToTalk)

	if WantsToTalk
		
		if SayDialogue
			Trace(self, "CheckAndSetWantsToTalk() starting WantsToTalkAnnouncementScene: " + WantsToTalkAnnouncementScene)
			WantsToTalkAnnouncementScene.Start()
		endif

		Trace(self, "CheckAndSetWantsToTalk() setting turning on WantsToTalkObjective : " + WantsToTalkObjective)
		SetObjectiveCompleted(WantsToTalkObjective, false)
		SetObjectiveDisplayed(WantsToTalkObjective)

	else
		Trace(self, "CheckAndSetWantsToTalk() completing WantsToTalkObjective : " + WantsToTalkObjective)
		SetObjectiveCompleted(WantsToTalkObjective, true)
	endif

EndFunction


;Called in scene phase fragments, at end of Story Gate Scenes
;also called the first time the companion becomes active
;also called the first time the companion becomes romantic
Function StoryGateSceneCompleted(bool IncrementAV = true)
	Trace(self, "StoryGateCompleted() IncrementAV: " + IncrementAV)

	float currentAV = CompanionRef.GetValue(COM_StoryGatesCompleted)
	float newAV = currentAV

	if IncrementAV
		newAV = newAV + 1
	endif

	;set the value (ON THE COMPANION) of the story gates completed (this play through)
	Trace(self, "StoryGateSceneCompleted() newAV: " + newAV)
	CompanionRef.SetValue(COM_StoryGatesCompleted, newAV)

	;set the value (ON THE PLAYER) to carry into post Unity play throughs (it'll be the highest ever reached)
	Actor PlayerRef = Game.GetPlayer()
	float maxStoryGate = Math.Max(newAV, PlayerRef.GetValue(COM_StarbornSaveActorValue_MaxStoryGate))
	PlayerRef.SetValue(COM_StarbornSaveActorValue_MaxStoryGate, maxStoryGate)
	Trace(self, "StoryGateSceneCompleted() set COM_StarbornSaveActorValue_MaxStoryGate: " + COM_StarbornSaveActorValue_MaxStoryGate + ", to maxStoryGate: " + maxStoryGate)

	int nextGateNumber = (newAV + 1) as int
	StartStoryGateTimer(nextGateNumber)

	Trace(self, "StoryGateCompleted() calling CheckAndSetWantsToTalk()")
	CheckAndSetWantsToTalk()
EndFunction

Function StartStoryGateTimer(int NextGateNumber)
	StoryGateDatum nextStoryGateDatum = GetStoryGateDatum(nextGateNumber)
	Trace(self, "StartStoryGateTimer() nextStoryGateDatum: " + nextStoryGateDatum)

	if nextStoryGateDatum
		;reset the timer expired value
		Trace(self, "StartStoryGateTimer() setting COM_CurrentStoryGateTimerExpired to 0 for CompanionRef: " + CompanionRef)
		CompanionRef.setValue(COM_CurrentStoryGateTimerExpired, 0)

		float nextGateTimerDuration = nextStoryGateDatum.TimerDuration.GetValue()
		Trace(self, "StartStoryGateTimer() calling StartTimer() nextGateTimerDuration: " + nextGateTimerDuration)
		StartTimer(nextGateTimerDuration, TimerID_StoryGate)
	else
		Trace(self, "StartStoryGateTimer() can't start timer, could not find a matching nextStoryGateDatum with gateNumber: " + nextGateNumber)
	endif
EndFunction

StoryGateDatum Function GetStoryGateDatum(int GateNumber)
	int iFound = StoryGateData.FindStruct("GateNumber", GateNumber)
	StoryGateDatum foundStoryGateDatum
	if iFound > -1
		foundStoryGateDatum = StoryGateData[iFound]
	else
		Warning(self, "GetStoryGateDatum() could not find a matching datum for GateNumber: " + GateNumber)
	endIf

	return foundStoryGateDatum
EndFunction


;Sets anger level
Function SetAngerLevel(GlobalVariable AngerLevelToSet, GlobalVariable AngerReason)
	Trace(self, "SetAngerLevel() AngerLevel: " + AngerLevelToSet)

	SQ_Companions.SetAngerLevel(CompanionRef, AngerLevelToSet, AngerReason)

	Trace(self, "SetAngerLevel() calling CheckAndSetWantsToTalk()")
	CheckAndSetWantsToTalk()
EndFunction

Function MakeNotAngry()
	Trace(self, "MakeNotAngry()")
	SetAngerLevel(SQ_Companions.COM_AngerLevel_0_NotAngry, SQ_Companions.COM_AngerReason_Common_0_NotAngry)
EndFunction

Function StartAngerCoolDownTimer()
	Trace(self, "StartAngerCoolDownTimer()")

	float coolDownTimerDur = SQ_Companions.GetAngerCoolDownTimerDuration(CompanionRef)

	if coolDownTimerDur > -1
		Trace(self, "StartAngerCoolDownTimer() starting timer, coolDownTimerDur: " + coolDownTimerDur)
		StartTimerGameTime(coolDownTimerDur, GameTimerID_AngerCoolDown)

		Trace(self, "StartAngerCoolDownTimer() GameTimerID_AngerCoolDown. Setting COM_AngerCoolDownTimerExpired to 0")
		CompanionRef.SetValue(COM_AngerCoolDownTimerExpired, 0)
	else
		Trace(self, "StartAngerCoolDownTimer() coolDownTimerDur < 0, canceling timer")
		CancelTimerGameTime(GameTimerID_AngerCoolDown)
	endif

	Trace(self, "StartAngerCoolDownTimer() calling CheckAndSetWantsToTalk()")
	CheckAndSetWantsToTalk()
EndFunction

;fake the timer expiring naturally
Function ExpireAngerCoolDownTimer()
	CancelTimerGameTime(GameTimerID_AngerCoolDown)
	OnTimerGameTime(aiTimerID = GameTimerID_AngerCoolDown)
EndFunction

;called in "final" Story Gate Scenes to do the actual increasing of AffinityLevel
;AffinityLevel is a global like "COM_Affinity_<N>_<Level>"
Function SetAffinityLevel(GlobalVariable AffinityLevel)
	Trace(self, "SetAffinityLevel(), AffinityLevel: " + AffinityLevel)
	SQ_Companions.SetAffinityLevel(CompanionRef, AffinityLevel)
EndFunction

Function StartPersonalQuest()
	Trace(self, "StartPersonalQuest()")
	StoryGateSceneCompleted()
	SetAffinityLevel(COM_AffinityLevel_1_Friendship)
	PersonalQuest.Start()
	CompanionRef.SetValue(COM_PersonalQuest_Started, 1)
	Activator QuestName = CompanionRef.COM_PQ_TxtReplace_QuestName
	ObjectReference QuestNameRef = CompanionRef.PlaceAtMe(QuestName, abInitiallyDisabled = true)
	SQ_Companions.ShowTextReplacedMessage(CompanionRef, SQ_Companions.COM_PQ_AdvancingQuestWarning, ShowAsHelpMessage = true, MessageTextReplaceRef = QuestNameRef)
EndFunction

Function FinishedPersonalQuest()
	Trace(self, "FinishedPersonalQuest()")
	SetAffinityLevel(COM_AffinityLevel_2_Affection)
	CompanionRef.SetValue(COM_PersonalQuest_Finished, 1)
EndFunction

Function PersonalQuestReminder()
	Trace(self, "PersonalQuestReminder()")
	
	;pop reminder objective
	SQ_Companions.PersonalQuestReminder()
EndFunction

Function StartCommitmentQuest()
	Trace(self, "StartCommitmentQuest()")
	StoryGateSceneCompleted()
	CompanionRef.SetValue(COM_CommitmentQuest_Started, 1)
	CommitmentQuest.Start()
EndFunction


Function RomanceSceneEndedRomantic()
	Trace(self, "RomanceSceneEndedRomantic()")
	CompanionRef.SetValue(COM_HasBeenRomantic, 1)
	PossiblyMakeAndrejaJealous()
EndFunction

Function MakeRomantic()
	Trace(self, "MakeRomantic()")
	CompanionRef.SetValue(COM_IsRomantic, 1)

	if CompanionRef.GetValue(COM_HasBeenRomantic) < 1
		CompanionRef.SetValue(COM_HasBeenRomantic, 1)
	endif
	
	PossiblyMakeAndrejaJealous()
EndFunction

Function PossiblyMakeAndrejaJealous()
	Actor romanticCompanion = Alias_Companion.GetActorRef()
	CompanionActorScript andrejaRef = Companion_Andreja.GetUniqueActor() as CompanionActorScript
	 if romanticCompanion != andrejaRef && andrejaRef.IsRomantic()

		Trace(self, "PossiblyMakeAndrejaJealous() will make Andreja Jealous")
		COM_Event_PlayerBecomesRomantic_AndrejaJealous.Send(romanticCompanion)
	 endif
EndFunction

Function MakeNotRomantic()
	Trace(self, "MakeNotRomantic()")
	CompanionRef.SetValue(COM_IsRomantic, 0)
	;also if they broke up after starting down the commitment path, make sure we turn that off
	CommitmentDesired(false)
EndFunction

Function CommitmentDesired(bool Desired = true)
	;NOTE: the way Top Level Romance scenes dove tail into story gate scenes where commitment is first offered,
	;it is possible that when coming from a Top Level Romance scene, this function is called twice,
	;so don't do anything in here that would be a problem if called multiple times
	Trace(self, "CommitmentDesired() Desired: " + Desired)
	if Desired
		CompanionRef.setValue(COM_CommitmentDesired, 1)

		if CompanionRef.GetValue(COM_CurrentStoryGateTimerExpired) == 1
			;start a story gate timer, if it's already expired.
			;some companions say "I need some time" after you tell them you want to be committed and when the commitment intro scene starts
			Trace(self, "CommitmentDesired() calling StartTimer() with a short duration")
			CompanionRef.SetValue(COM_CurrentStoryGateTimerExpired, 0)
			StartTimer(600, TimerID_StoryGate)
		endif

	else
		CompanionRef.setValue(COM_CommitmentDesired, 0)
	endif

	;regardless of the choice, we set this because it's used in conditionforms to mean "player was given an option"
	CompanionRef.SetValue(COM_CommitmentPossible, 1)
EndFunction

Function MakeCommitted()
	Trace(self, "MakeCommited()")
	SetAffinityLevel(COM_AffinityLevel_3_Commitment)
	CompanionRef.SetValue(COM_IsCommitted, 1)
EndFunction

Function MakeNotCommitted(bool Permanent = false)
	Trace(self, "MakeCommited() Permanent: " + Permanent + ", ")
	SetAffinityLevel(COM_AffinityLevel_2_Affection)
	CompanionRef.SetValue(COM_IsCommitted, 0)

	if Permanent
		CompanionRef.SetValue(COM_CommitmentRefusedPermanently, 1)
	endif
EndFunction

Function BreakCommitment()
	Trace(self, "BreakCommitment()")
	MakeNotCommitted(Permanent = true)
	MakeNotRomantic()
	SetAngerLevel(SQ_Companions.COM_AngerLevel_2_Angry, SQ_Companions.COM_AngerReason_Common_3_BreakCommitment)

	;GEN-517044: Adding an explicit call to set the Anger Cooldown here, since commitment breaking doesn't have a post-anger scene
	StartAngerCoolDownTimer()
EndFunction

Function AwardSecondChance()
	float newVal = CompanionRef.GetValue(COM_AngerSecondChances) + 1
	CompanionRef.SetValue(COM_AngerSecondChances, newVal)
	Trace(self, "AwardSecondChance() newVal: " + newVal)
EndFunction

;called by COM_RedeemSecondChanceInfoScript
Function ReedemSecondChance()
	float newVal = CompanionRef.GetValue(COM_AngerSecondChances) -1
	CompanionRef.SetValue(COM_AngerSecondChances, newVal)
	Trace(self, "AwardSecondChance() newVal: " + newVal)

	Trace(self, "ReedemSecondChance() _AngerSceneCancelAnger()")
	_AngerSceneCancelAnger()
EndFunction

;called by COM_AngerSpeechChallengeSuccessScript
Function AngerSpeechChallengeSuccess()
	Trace(self, "AngerSpeechChallengeSuccess() _AngerSceneCancelAnger()")
	_AngerSceneCancelAnger()
EndFunction

Function _AngerSceneCancelAnger()
	Trace(self, "_AngerSceneCancelAnger() canceling timer.")
	CancelTimerGameTime(GameTimerID_AngerCoolDown)

	Trace(self, "_AngerSceneCancelAnger() calling: MakeNotAngry()")
	MakeNotAngry()
EndFunction

;called in last phase in the Anger scene
Function AngerSceneCompleted()
	Trace(self, "AngerSceneCompleted() setting COM_AngerSceneCompleted to 1, and calling StartAngerCoolDownTimer()")
	CompanionRef.SetValue(COM_AngerSceneCompleted, 1) ;also set by SQ_CompanionsScript
	StartAngerCoolDownTimer()
EndFunction

Function DebugSetStoryGateTimerComplete()
	Trace(self, "DebugSetStoryGateTimerComplete()")

	if CompanionRef.GetValue(COM_CurrentStoryGateTimerExpired) == 0
		CancelTimer()
		OnTimer(TimerID_StoryGate)
	else
		Debug.MessageBox("Can't Set Timer Complete, COM_CurrentStoryGateTimerExpired is already 0... timer not running")
	endif
EndFunction




;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "CompanionQuest", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "CompanionQuest", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction