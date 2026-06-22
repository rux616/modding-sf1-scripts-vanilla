Scriptname MissionQuestScript extends Quest conditional

MissionParentScript Property MissionParent Auto Const Mandatory
{ mission parent quest }

Int Property AcceptStage = 10 Auto Const
{The stage to set when mission is accepted}

int property ReadyStage = 5 auto Const
{ the stage to set when the mission is ready to display on the mission board UI }

Int Property CompleteStage = 100 Auto Const
{The stage to set when mission is completed }

Int Property FailStage = 200 Auto Const
{ The stage to set when mission has failed (e.g. time expired) }

bool Property ShutdownOnFailure = true auto const
{ should the mission shutdown if it fails? (usually it won't - each mission type handles this differently)}

bool Property ShutdownOnCompletion = true auto const
{ should the mission shutdown on completion? (usually it will) }

int property MissionType = 0 auto const
{ 
 0 = Bounty
 1 = Cargo
 2 = Passenger
 3 = Survey Planet (Constellation)
 4 = Survey Trait (Constellation)
 5 = Supply
 6 = Smuggle
 7 = Piracy
 8 = Steal
 9 = Bounty in Space
 10 = Freestar Bounty (Smuggler)
 11 = Freestar Bounty in Space (Pirate)
 12 = Freestar Bounty (Outlaw)
 13 = Freestar Rescue
 14 = Ryujin Hack 
 15 = Ryujin Plant Evidence
 16 = Ryujin Sabotage
 17 = Survey Planet for Life (LIST)
 18 = Hunt creatures
}

GlobalVariable Property RewardAmountGlobal Auto Const Mandatory
{The base amount of Credits we're going to reward the player with}

GlobalVariable Property RewardAmountGlobalActual Auto Const Mandatory
{The actual amount of Credits we're going to reward the player with - possibly adjusted by specific mission factors }

GlobalVariable property MissionIntValue01 auto const
{ OPTIONAL - for mission types with integer values
	NOTE: need to make custom Globals for each quest
}

GlobalVariable property MissionIntValue02 auto const
{ OPTIONAL - for mission types with integer values
	NOTE: need to make custom Globals for each quest
}

GlobalVariable property MissionTimeHours auto const
{ base mission quest timer 
	0 = unlimited time
}

GlobalVariable property MissionTimeHoursActual auto const
{ modified base mission quest timer - time for this mission based on mission data
}

GlobalVariable property MissionTimeRemainingDays auto Const
{ only used if MissionTimeHoursActual is filled in - how long does player have in full days }

GlobalVariable property MissionTimeRemainingHours auto Const
{ only used if MissionTimeHoursActual is filled in - the "remainder" of MissionTimeHoursActual after MissionTimeRemainingDays is taken out }

LocationAlias Property PlayerStarSystemLocation Auto Const Mandatory
{The Star System the player is currently in when he sees the bounty}

ActorValue Property MissionBoardAvailableAV auto Const
{ optional - if supplied, will be incremented +1 when a quest is available at a location; -1 when quest shuts down or is accepted }

Location Property MissionSourceLocation auto hidden
{ location supplied by the script event, if any }

Group MissionBoardAliases
	LocationAlias Property TargetSystemLocation Auto Const
	LocationAlias Property TargetPlanetLocation Auto Const
	LocationAlias Property TargetLocation Auto Const
	ReferenceAlias Property PrimaryRef Auto Const Mandatory
	ReferenceAlias Property PlayerShip Auto Const Mandatory
EndGroup

Bool property PlayerAcceptedQuest conditional auto
Bool property PlayerCompletedQuest conditional auto
Bool property PlayerFailedQuest conditional auto

;function to handle all the StartUp handling we need
Event OnQuestStarted()
	debug.trace(self + " OnQuestStarted")
	Actor PlayerREF = Game.GetPlayer()

	;need to know if the player ever leaves the current star system
	RegisterForRemoteEvent(PlayerREF, "OnLocationChange")
	; get landing events for player ship
	RegisterForRemoteEvent(PlayerShip, "OnShipLanding")
	RegisterForRemoteEvent(PlayerShip, "OnShipTakeOff")

	; docking events
	RegisterForRemoteEvent(PlayerShip, "OnShipDock")
	RegisterForRemoteEvent(PlayerShip, "OnShipUndock")

	; get event for player's home ship changing
	RegisterForRemoteEvent(PlayerRef, "OnHomeShipSet")

	; set actual reward global
	RewardAmountGlobalActual.SetValue(GetActualReward())
	UpdateCurrentInstanceGlobal(RewardAmountGlobalActual)
	if RewardAmountGlobalActual.GetValue() == 0
		debug.trace(self + " WARNING ************************** REWARD IS 0 *****************************")
	endif

	; update mission timer variables
	SetActualMissionTime()
	SetMissionTimeVariables()

	; ready to start
	debug.trace(self + " Ready for mission board UI")
	SetStage(ReadyStage)
EndEvent

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
	MissionSourceLocation = akLocation
	if MissionSourceLocation && MissionBoardAvailableAV
		MissionSourceLocation.ModValue(MissionBoardAvailableAV, 1)
	endif
EndEvent

Event OnQuestRejected()
	debug.trace(self + " OnQuestRejected")
	HandleOnQuestRejected()
EndEvent

function HandleOnQuestRejected()
	debug.trace(self + " HandleOnQuestRejected")
	MissionFailed()
endFunction

Event OnMissionAccepted()
	debug.trace(self + " OnMissionAccepted")
	HandleOnMissionAccepted()
EndEvent

function HandleOnMissionAccepted()
	debug.trace(self + " HandleOnMissionAccepted")
	if MissionParent.MissionBoardAcceptMessage.Show() == 0
		MissionAccepted(true)
	else
		MissionAccepted(false)
	endif
endFunction

Function MissionAccepted(bool bAccepted)
	debug.trace(self + " MissionAccepted " + bAccepted)
	if bAccepted
		;function to handle the player accepting the quest
		PlayerAcceptedQuest = True

		; decrement AV if there is one
		if MissionBoardAvailableAV && MissionSourceLocation
			MissionSourceLocation.ModValue(MissionBoardAvailableAV, -1)
		EndIf

		;set accept stage
		SetStage(AcceptStage)

		; send accepted event
		MissionParent.SendMissionAcceptedEvent(self)

		; Play a sound for accepting the mission
		WwiseEvent.PlayMenuSound("UITerminalMissionBoardMissionAcceptYes")
	Else
		; Play a sound for not accepting the mission
		WwiseEvent.PlayMenuSound("UITerminalMissionBoardMissionAcceptNo")
	endif
EndFunction

Guard MissionStateChangeGuard protectsFunctionLogic

Function MissionComplete()
	debug.trace(self + " MissionComplete")
	LockGuard MissionStateChangeGuard
		if PlayerAcceptedQuest && PlayerFailedQuest == false && PlayerCompletedQuest == false
			Actor PlayerREF = Game.GetPlayer()
			;function to handle the player completing the quest and being rewarded
			PlayerCompletedQuest = True
			MissionParent.HandleMissionCompleted(self)
			if Utility.IsGameMenuPaused() == false
				Utility.Wait(1.0)
			endif
			CompleteAllObjectives()
			StopQuestTimer() ; for quests with timers
			;set completion stage (includes reward)
			SetStage(CompleteStage)
		endif
		; always shut down quest
		if ShutdownOnCompletion
			MissionShutdown()
		endif
	EndLockGuard
EndFunction

Function MissionFailed()
	debug.trace(self + " MissionFailed")
	LockGuard MissionStateChangeGuard
		if PlayerAcceptedQuest && PlayerCompletedQuest == false
			PlayerFailedQuest = true
			MissionParent.HandleMissionFailed(self)
			FailAllObjectives()
			SetStage(FailStage)
			StopQuestTimer() ; for quests with timers

			if ShutdownOnFailure
				MissionShutdown()
			endif
		endif
	EndLockGuard
endFunction

int Function GetActualReward()
	ObjectReference targetRef = PrimaryRef.GetRef()
	float reward = RewardAmountGlobal.GetValue()
	float mult = 1.0
	if targetRef
		mult = mult + targetRef.GetValue(MissionParent.MissionRewardMultiplier)
		if mult <= 0.0
			mult = 1.0
		endif
	endif
	reward = reward*mult
	debug.trace(self + "GetActualReward=" + reward + " (mult=" + mult + " from targetRef " + targetRef + ")")
	return reward as int
endFunction

; override this on extending scripts if appropriate
Function SetActualMissionTime()
	if MissionTimeHours && MissionTimeHoursActual
		MissionTimeHoursActual.SetValue(MissionTimeHours.GetValue())
	endif
EndFunction

; update mission time variables
Function SetMissionTimeVariables()
	if MissionTimeHoursActual && MissionTimeHoursActual.GetValue() > 0 && MissionTimeRemainingDays && MissionTimeRemainingHours
		; how many days?
		float missionHours = MissionTimeHoursActual.GetValue()

		int missionDays = Math.Floor(missionHours/24.0)
		float missionHoursRemainder = missionHours - (missionDays*24.0)
		MissionTimeRemainingDays.SetValue(missionDays)
		MissionTimeRemainingHours.SetValue(missionHoursRemainder)
		UpdateCurrentInstanceGlobal(MissionTimeRemainingDays)
		UpdateCurrentInstanceGlobal(MissionTimeRemainingHours)
	endif
EndFunction

Function MissionShutdown()
	debug.trace(self + " MissionShutdown")
	;Function to handle shutting down the quest
	if PlayerAcceptedQuest == false
		; decrement AV if there is one (only if player hasn't accepted quest - already decremented when accepted)
		if MissionBoardAvailableAV && MissionSourceLocation
			MissionSourceLocation.ModValue(MissionBoardAvailableAV, -1)
		EndIf
	endif
	Stop()
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	HandlePlayerLocationChange(akOldLoc, akNewLoc)
endEvent

Event Actor.OnHomeShipSet(Actor akSender, SpaceshipReference akShip, SpaceshipReference akPrevious)
	HandlePlayerHomeShipChange()
EndEvent

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSender, bool abComplete)
	debug.trace(self + "OnShipLanding akSender=" + akSender + " currentLocation=" + akSender.GetRef().GetCurrentLocation() + " abComplete=" + abComplete)
	if akSender == PlayerShip && abComplete == true
		HandlePlayerShipLanding()
	endif
endEvent

Event ReferenceAlias.OnShipTakeOff(ReferenceAlias akSender, bool abComplete)
	debug.trace(self + "OnShipTakeOff " + abComplete)
	if akSender == PlayerShip && abComplete == false
		HandlePlayerShipTakeOff()
	endif
endEvent

Event ReferenceAlias.OnShipDock(ReferenceAlias akSender, bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
	debug.trace(self + "OnShipDock akSender=" + akSender + " akDocking=" + akDocking + " akParent=" + akParent + " abComplete=" + abComplete)
	if akSender == PlayerShip && abComplete == true
		HandlePlayerShipDocking(akParent)
	endif
EndEvent

Event ReferenceAlias.OnShipUndock(ReferenceAlias akSender, bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)
	debug.trace(self + "OnShipUndock akSender=" + akSender + " akUndocking=" + akUndocking + " akParent=" + akParent + " abComplete=" + abComplete)
	if akSender == PlayerShip && abComplete == true
		HandlePlayerShipUndocking()
	endif
EndEvent

; override on extending scripts
Function HandlePlayerShipLanding()
endFunction

; override on extending scripts
Function HandlePlayerShipTakeOff()
endFunction

; override on extending scripts
Function HandlePlayerShipDocking(SpaceshipReference akParent)
endFunction

; override on extending scripts
Function HandlePlayerShipUndocking()
endFunction

; override on extending scripts
Function HandlePlayerHomeShipChange()
endFunction

Function HandlePlayerLocationChange(Location akOldLoc, Location akNewLoc)
	debug.trace(self + " HandlePlayerLocationChange akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
EndFunction

function TestGetQuestTimeRemaining()
	debug.trace(self + " Quest time remaining: " + GetQuestTimeRemaining() + " hours   ")
endFunction
