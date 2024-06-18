Scriptname MissionParentScript extends Quest
{parent script for Mission handling}

Keyword property LocTypeStarSystem auto const Mandatory
Keyword property LocTypeMajorOrbital auto const Mandatory
{ used to check if something is a planet or moon }

Keyword property LocTypeSettlement auto const Mandatory
{ used to check if something is a settlement - try to start new missions }

Keyword property LocTypeMissionSource auto const Mandatory
{ used to check if something is a mission source - try to start new missions }

Keyword property SpaceshipKeyword auto const Mandatory
{ used to check if a location is a spaceship }

Keyword property OutpostCargoLinkFueledKeyword auto const mandatory
{ keyword to find fueled cargo links }

ActorValue property CarryWeight auto const mandatory
{ used to check cargo space }

ActorValue property CarryWeightShielded auto const mandatory
{ used to check shielded cargo space }

float property resetTimeInterval = 1.0 auto const
{ time in game time days before mission board will reset even if player hasn't changed location }

struct MissionType
	Keyword missionTypeKeyword
	{ story manager keyword to try to start }

	Message MissionCompleteMessage
	{OPTIONAL: Extra notification to the player that the mission is complete}

	Message MissionFailMessage
	{OPTIONAL: Extra notification to the player that the mission has failed}

	GlobalVariable MissionCompletedCount
	{global to track how many of this type of mission the player has completed}

	bool RandomStoryEventOrder = false
	{ mission types with RandomStoryEventOrder = true are sent in a random order since there is a limited number allowed to start }
EndStruct

struct MissionLocRefType
	LocationRefType cargoSource
	LocationRefType cargoDestination
	Form cargoSourceBase
	Form cargoDestinationBase
EndStruct

struct MissionSupplyType
	ActorValue supplyAV
EndStruct

struct MissionEnemyType
	Faction enemyFaction
	Form enemyName
endStruct

struct MissionBoardSurveyTraitData
	int minTraitValue = 0  ; min total "trait value" to get this reward - array will be ordered from highest to lowest
	GlobalVariable RewardXP ; how much XP to award
endStruct

group MissionData
	MissionType[] property MissionTypes auto const
	{ array of mission types }

	int property NoMissionIndex = 0 auto const
	{ index of the entry to use if there are no missions available }

	MissionQuestScript[] property missionQuests const auto
	{ array of all mission quests }

	MissionCargoParentScript[] property cargoQuests const auto
	{ cargo quests - needed to update before displaying and after cargo space changes }

	MissionPassengerQuestScript[] property passengerQuests const auto
	{ passenger quests - needed to update before displaying and after passenger space changes }

	MissionSurveyQuestScript[] property surveyQuests const auto
	{ survey mission quests - needed to check if planet is a survey target }

	MissionLocRefType[] property cargoTypes const auto
	{ array of cargo type data {}

	MissionLocRefType[] property passengerTypes const auto 
	{ array of cargo type data }

	MissionSupplyType[] property resourceAVs const auto 
	{ array of resourceAVs }

	ActorValue[] property supplyNeedAVs const auto 
	{ array of supply need resource AVs }

	MissionEnemyType[] property enemyTypes const Auto
	{ array of enemy types to match faction with name marker (for text replacement) }

	ActorValue property MissionRewardMultiplier auto const Mandatory
	{ if on appropriate mission refs, acts as a multiplier on mission rewards }

	Message property MissionBoardAcceptMessage auto const Mandatory
	{ confirmation message box for accepting a mission }

	GlobalVariable property MB_MissionsLastSurveyTrait auto const mandatory
	{ tracks the trait index of last completed survey trait mission }

	GlobalVariable property MB_MissionsLastSurveyTraitTimestamp auto const mandatory
	{ timestamp of last completed survey trait mission }

	GlobalVariable property MissionBoardSurveyTraitRewardOverlayMult auto const mandatory
	{ multiplier based on total number of overlays needed to be explored for this trait }

	GlobalVariable property MissionBoardSurveyTraitSystemValueMult auto const mandatory
	{ multiplier based on total trait value of the target system }

	MissionBoardSurveyTraitData[] property MissionBoardSurveyTraitXPRewards const Auto
	{ array of xp rewards for completing survey trait missions }

	GlobalVariable property MissionBoardSurveyXPRewardBase auto const mandatory
	{ base XP reward for survey planet missions }
endGroup

Group MissionBoardAliases
	LocationAlias Property TargetSystemLocation Auto Const
	LocationAlias Property TargetPlanetLocation Auto Const
	LocationAlias Property TargetLocation Auto Const
	ReferenceAlias Property PrimaryRef Auto Const Mandatory
	ReferenceAlias Property PlayerShip Auto Const Mandatory
EndGroup

Group RQ_Hellos 
	ActorValue property RQ_AV_Hello auto const mandatory
	{ used to condition for RQ hellos }

	GlobalVariable property RQ_Hello_AboardShipValue Mandatory Const Auto
	GlobalVariable property RQ_Hello_DepartingShipValue Mandatory Const Auto
endGroup


CustomEvent MissionAccepted

CustomEvent MissionCompleted

; last location that triggered a reset
Location lastResetLocation
; last time reset was called
float lastResetTimestamp
int resetTimerID = 1 Const

Event OnQuestInit()
	Trace(Self, " OnQuestInit")
	Actor PlayerREF = Game.GetPlayer()

    ; register for player change location events - use to update mission quests
	RegisterForRemoteEvent(PlayerREF, "OnLocationChange")
	RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
	; when player ship changes locations, check for reset
	CheckLocationChange(akOldLoc, akNewLoc)
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	; when player changes locations, check for reset
	CheckLocationChange(akOldLoc, akNewLoc)
EndEvent

Function CheckLocationChange(Location akOldLoc, Location akNewLoc)
	Trace(Self, " CheckLocationChange akOldLoc=" + akOldLoc + ", akNewLoc=" + akNewLoc)
	
	if akOldLoc && akNewLoc
		if akOldLoc.HasKeyword(SpaceshipKeyword) || akNewLoc.HasKeyword(SpaceshipKeyword)
			; don't check when player is entering or leaving a spaceship:
			;    leaving: we've already checked for ship location change
			;    entering: ship interior location has no parent location so no way to know where it is
			Trace(Self, "  player exiting or entering ship - ignoring this location change")
		else

			LockGuard resetMissionGuard
				Location[] newLocParentSettlements = akNewLoc.GetParentLocations(LocTypeSettlement)
				Location newLocParentSettlement = None
				if newLocParentSettlements.Length > 0
					newLocParentSettlement = newLocParentSettlements[0]
				EndIf
				bool enteringSettlement = (newLocParentSettlement || akNewLoc.HasKeyword(LocTypeSettlement))
				Trace(Self, "  enteringSettlement=" + enteringSettlement + " newLocParentSettlement=" + newLocParentSettlement)
				
				if akOldLoc.IsSameLocation(akNewLoc, LocTypeStarSystem) == false
					Trace(Self, "  player has entered new star system - reset missions")
					; reset missions
					ResetMissions(true, bShutDownAll=false, resetLocation = akNewLoc)
				elseif (enteringSettlement && akOldLoc.IsSameLocation(akNewLoc, LocTypeSettlement) == false) || akNewLoc.HasKeyword(LocTypeMissionSource)
					Trace(Self, "  player has entered new settlement - try to start new missions")
					; start new missions for this location
					ResetMissions(false, bShutDownAll=false,  resetLocation = akNewLoc)
				endif
			EndLockGuard
		endif
	Else
		Trace(Self, " ignoring this location change")
	endif
endFunction

; shut down missions that the player hasn't started, and try to restart them
Guard resetMissionGuard ProtectsFunctionLogic
function ResetMissions(bool bShutDownUnstarted, bool bShutDownAll, Location resetLocation, bool resetLocationOverride = false)
	; we don't want this to run more than once simultaneously
	LockGuard resetMissionGuard
		; don't do anything if resetLocation hasn't changed
		Trace(Self, " ResetMissions: resetLocation=" + resetLocation + " lastResetLocation=" + lastResetLocation)
		if resetLocation != lastResetLocation || resetLocationOverride
			lastResetLocation = resetLocation
			lastResetTimestamp = Utility.GetCurrentGameTime()
			StartTimerGameTime(resetTimeInterval*24.0, resetTimerID)

			StopMissions(bShutDownUnstarted, bShutDownAll)
			; try to start new ones
			int i = 0
			int missionCount = 0
			Keyword[] randomMissionEvents = new Keyword[0]

			Trace(Self, " ResetMissions - trying to start priority mission types")
			while i < MissionTypes.Length
				MissionType theMissionType = MissionTypes[i]
				if theMissionType.RandomStoryEventOrder
					randomMissionEvents.Add(theMissionType.missionTypeKeyword)
				Else
					Trace(Self, "   sending priority story event " + theMissionType)
					theMissionType.missionTypeKeyword.SendStoryEvent(akLoc=resetLocation)
				endif
				i += 1
			endWhile
			Trace(Self, " ResetMissions - trying to start " + randomMissionEvents.Length + " random mission types")
			while randomMissionEvents.Length > 0
				; pick a random event to start
				int randomIndex = Utility.RandomInt(0, randomMissionEvents.Length - 1)
				Trace(Self, "   sending random story event " + randomIndex + ": " + randomMissionEvents[randomIndex])
				randomMissionEvents[randomIndex].SendStoryEvent(akLoc=resetLocation)
				randomMissionEvents.Remove(randomIndex)
			EndWhile
		endif
	EndLockGuard
endFunction

event OnTimerGameTime(int aiTimerID)
	if aiTimerID == resetTimerID
		float currentTimestamp = Utility.GetCurrentGameTime()
		float timeSinceReset = currentTimestamp - lastResetTimestamp

		Trace(Self, " reset timer expired - lastResetTimestamp=" + lastResetTimestamp + " currentTimestamp=" + currentTimestamp + " timeSinceReset=" + timeSinceReset)

		; if last reset time is more than the time interval from current time, reset
		if timeSinceReset > resetTimeInterval
			Trace(Self, " time to reset missions")
			; send on resetLocation so we always reset
			ResetMissions(bShutDownUnstarted=false, bShutDownAll=false, resetLocation = Game.GetPlayer().GetCurrentLocation(), resetLocationOverride=true)
		Else
			Trace(Self, " don't reset missions - restart timer")
			; rerun timer
			StartTimerGameTime(resetTimeInterval*24.0, resetTimerID)
		endif
	endif
endEvent

function StopMissions(bool bShutDownUnstarted, bool bShutDownAll = false) RequiresGuard(resetMissionGuard)
		Trace(Self, " StopMissions bShutDownUnstarted=" + bShutDownUnstarted + " bShutDownAll=" + bShutDownAll)
		if bShutDownUnstarted || bShutDownAll
			; run through all mission quests, stop any that player hasn't started
			int i = 0
			while i < missionQuests.Length
				MissionQuestScript theMission = missionQuests[i]
				Trace(Self, "     " + theMission + ": running? " + theMission.IsRunning() + "; player accepted? " + theMission.PlayerAcceptedQuest)
				if theMission.IsRunning() && (theMission.PlayerAcceptedQuest == false || bShutDownAll)
					theMission.Stop()
				endif
				i += 1
			endWhile
		endif
EndFunction

; call this before opening the menu, for any missions that need data updated
function UpdateMissions()
	; run through all mission quests that need updating before display
	int i = 0
	while i < cargoQuests.Length
		MissionCargoParentScript theMission = cargoQuests[i]
		Trace(Self, "     " + theMission + ": running? " + theMission.IsRunning() + "; player accepted? " + theMission.PlayerAcceptedQuest)
		if theMission.IsRunning() && (theMission.PlayerAcceptedQuest == false)
			theMission.UpdatePlayerCargoSpace()
		endif
		i += 1
	endWhile

	i = 0
	while i < passengerQuests.Length
		MissionPassengerQuestScript theMission = passengerQuests[i]
		Trace(Self, "     " + theMission + ": running? " + theMission.IsRunning() + "; player accepted? " + theMission.PlayerAcceptedQuest)
		if theMission.IsRunning() && (theMission.PlayerAcceptedQuest == false) 
			theMission.UpdatePlayerPassengerSpace()
		endif
		i += 1
	endWhile
EndFunction

bool function IsPlanetSurveyTarget(ObjectReference refToCheck)
	bool isTarget = false
	Planet planetToCheck = refToCheck.GetCurrentPlanet()
	if planetToCheck
		; run through survey missions - see if this planet is target of any active survey mission
		int i = 0
		while i < surveyQuests.Length && isTarget == false
			MissionSurveyQuestScript theSurveyQuest = surveyQuests[i]
			if theSurveyQuest.IsRunning() && theSurveyQuest.PlayerAcceptedQuest
				if theSurveyQuest.TargetPlanetLocation.GetLocation().GetCurrentPlanet() == planetToCheck
					Trace(Self, " IsPlanetSurveyTarget: " + planetToCheck + " is survey target")
					isTarget = true
				EndIf
			endif
			i += 1
		endWhile
	endif
	return isTarget
EndFunction

Guard MissionCompletedFailedGuard ProtectsFunctionLogic
function HandleMissionCompleted(MissionQuestScript theMission)
	Trace(Self, " HandleMissionCompleted " + theMission)
	LockGuard MissionCompletedFailedGuard
		int missionTypeIndex = theMission.missionType
		MissionType theMissionType = MissionTypes[missionTypeIndex]
		Trace(Self, "missionTypeIndex=" + missionTypeIndex + " theMissionType " + theMissionType)
		if theMissionType.MissionCompleteMessage
			; set aliases from this mission
			TargetSystemLocation.ForceLocationTo(theMission.TargetSystemLocation.GetLocation())
			TargetPlanetLocation.ForceLocationTo(theMission.TargetPlanetLocation.GetLocation())
			TargetLocation.ForceLocationTo(theMission.TargetLocation.GetLocation())
			PrimaryRef.ForceRefTo(theMission.PrimaryRef.GetRef())
			; send completed message
			theMissionType.MissionCompleteMessage.Show(theMission.RewardAmountGlobalActual.GetValueInt())
		endif
		if theMissionType.MissionCompletedCount
			; increment global
			theMissionType.MissionCompletedCount.Mod(1.0)
		endif
		; any other special handling
		if theMission is MissionSurveyTraitScript
			MissionSurveyTraitScript theSurveyMission = theMission as MissionSurveyTraitScript
			; set global for which trait
			int traitIndex = theSurveyMission.SQ_Parent.PlanetTraits.FindStruct("PlanetTrait", theSurveyMission.PlanetTrait)
			if traitIndex > -1
				MB_MissionsLastSurveyTrait.SetValueInt(traitIndex)
				MB_MissionsLastSurveyTraitTimestamp.SetValue(Utility.GetCurrentGameTime())
			endif
		endif

		; sent completed event
		SendMissionCompletedEvent(theMission)
	endLockGuard
EndFunction

function HandleMissionFailed(MissionQuestScript theMission)
	Trace(Self, " HandleMissionFailed " + theMission)
	LockGuard MissionCompletedFailedGuard
		int missionTypeIndex = theMission.missionType
		MissionType theMissionType = MissionTypes[missionTypeIndex]
		if theMissionType.MissionFailMessage
			; set aliases from this mission
			TargetSystemLocation.ForceLocationTo(theMission.TargetSystemLocation.GetLocation())
			TargetPlanetLocation.ForceLocationTo(theMission.TargetPlanetLocation.GetLocation())
			TargetLocation.ForceLocationTo(theMission.TargetLocation.GetLocation())
			PrimaryRef.ForceRefTo(theMission.PrimaryRef.GetRef())
			; send completed message
			theMissionType.MissionFailMessage.Show()
		endif
		SendMissionCompletedEvent(theMission, true)
	endLockGuard
EndFunction

function SendMissionAcceptedEvent(MissionQuestScript theQuest)
	; Send the mission accepted event
	Var[] kargs = new Var[1]
	kargs[0] = theQuest
	SendCustomEvent("MissionAccepted", kargs)
endFunction

function SendMissionCompletedEvent(MissionQuestScript theQuest, bool missionFailed = false)
	; Send the mission completed/failed event
	Var[] kargs = new Var[2]
	kargs[0] = theQuest
	kargs[1] = missionFailed
	SendCustomEvent("MissionCompleted", kargs)
endFunction

function TestGetMatchingLocations(Location parentLocation, LocationRefType wantedrefType)
	LocationRefType[] targetRefTypes = New LocationRefType[1]
	targetRefTypes[0] = wantedrefType
	Trace(self, " GetMatchingLocations=" + Game.GetMatchingLocations(ParentLocation=parentLocation, WantedRefTypes=targetRefTypes))
endFunction

; stop and restart all missions
function DebugResetMissions()
	ResetMissions(bShutDownUnstarted = true, bShutDownAll = true, resetLocation=None, resetLocationOverride=true)
endFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Missions",  string SubLogName = "ParentScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Missions",  string SubLogName = "ParentScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction
