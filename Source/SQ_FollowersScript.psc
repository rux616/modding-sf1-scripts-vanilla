Scriptname SQ_FollowersScript extends SQ_ActorRolesScript Conditional
{Quest script attached to SQ_Followers. Handles various system level follower functionality}

Group Autofill
ActorValue Property IdleChatterTimeMax Mandatory Const Auto
ActorValue Property IdleChatterTimeMin Mandatory Const Auto
GlobalVariable Property FOL_IdleChatterTimeMax Mandatory Const Auto
GlobalVariable Property FOL_IdleChatterTimeMin Mandatory Const Auto
ActorValue Property FOL_PreviousIdleChatterTimeMax Mandatory Const Auto
ActorValue Property FOL_PreviousIdleChatterTimeMin Mandatory Const Auto

ActorValue Property FollowerState Mandatory Const Auto
GlobalVariable Property iFollower_Com_Follow const auto Mandatory
GlobalVariable Property iFollower_Com_Wait const auto Mandatory
GlobalVariable Property iFollower_Com_GoHome const auto Mandatory

Keyword Property SQ_Followers_Link_WaitAtRef Mandatory Const Auto
Keyword Property SQ_Followers_IdleChatterAllowed Mandatory Const Auto

Faction Property SQ_Followers_GroupFormation_Faction  Mandatory Const Auto


GlobalVariable Property PlayerFollowers_HasFollower Mandatory Const Auto
GlobalVariable Property PlayerFollowers_HasFollowerFollowing Mandatory Const Auto
GlobalVariable Property PlayerFollowers_HasFollowerWaiting Mandatory Const Auto

GlobalVariable Property PlayerFollowers_HasCompanion Mandatory Const Auto
GlobalVariable Property PlayerFollowers_HasCompanionFollowing Mandatory Const Auto
GlobalVariable Property PlayerFollowers_HasCompanionWaiting Mandatory Const Auto

GlobalVariable Property PlayerFollowers_Count Mandatory Const Auto
GlobalVariable Property PlayerFollowers_CountFollowing Mandatory Const Auto
GlobalVariable Property PlayerFollowers_CountWaiting Mandatory Const Auto

Keyword Property SQ_Followers_TeleportToShipWithPlayerWhenWaiting Mandatory Const Auto

Keyword Property SQ_Followers_DisallowTeleportWaitingFollowersToShip Mandatory Const Auto

Package Property SQ_Followers_Wait Mandatory Const Auto

ActorValue Property Cached_PreFollowerAggression Mandatory Const Auto

EndGroup

Group Properties
ReferenceAlias Property PlayerShipCrewMarker Mandatory Const Auto
{PlayerShipCrewMarker alias in SQ_PlayerShip}

int Property ObjectiveRetrieveWaitingFollowers = 100 Const Auto
{objective to turn on if you have any followers waiting for you to return}
EndGroup

Actor PlayerRef ;convenience, holds the player - set in OnInit()

float Property AllFollowerState = 1.0 Auto Hidden Conditional
;see "enum" globals, used by FollowPlayer package template
;iFollower_Com_Follow
;iFollower_Com_Wait
;iFollower_Com_GoHome

int TimerID_UpdateTrackingGlobalsAndObjectives = 1 const
float TimerDur_UpdateTrackingData = 1.0 const
int CountUpdateTrackingRequests
int SkipNextWaitingFollowersObjective 

Event OnInit()
    PlayerRef = Game.GetPlayer()
	RegisterForRemoteEvent((Alias_Active as RefCollectionAlias), "OnAliasChanged")
	RegisterForRemoteEvent(PlayerRef, "OnLocationChange")
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == TimerID_UpdateTrackingGlobalsAndObjectives
		CountUpdateTrackingRequests -= 1
		UpdateTrackingGlobalsAndObjectives()

		if CountUpdateTrackingRequests > 0
			CountUpdateTrackingRequests = 1
			StartTimer(TimerDur_UpdateTrackingData, TimerID_UpdateTrackingGlobalsAndObjectives)
		endif
	endif
EndEvent

Function TriggerTrackingGlobalsAndObjectivesUpdate()
	CountUpdateTrackingRequests += 1
	StartTimer(TimerDur_UpdateTrackingData, TimerID_UpdateTrackingGlobalsAndObjectives)
EndFunction

 Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, bool abRemove)
	Trace(self, "OnAliasChange() akSender: " + akSender + ", akObject: " + akObject + ", abRemove: " + abRemove)
	
	if akSender == Alias_Active as RefCollectionAlias
		TriggerTrackingGlobalsAndObjectivesUpdate()
	endif
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	Trace(self, "OnLocationChange() akSender: " + akSender + ", akOldLoc: " + akOldLoc + ", akNewLoc: " + akNewLoc)
	if akSender == PlayerRef
		TeleportWaitingFollowersToShip(akNewLoc)
	endif
EndEvent

;this is also called by SQ_PlayerShipScript in cases where the player fast travels directly to the surface of a planet, skipping the entering of the ship location
Function TeleportWaitingFollowersToShip(Location akNewLoc = None)
		if playerRef.GetCurrentShipRef() != None
			if akNewLoc && akNewLoc.HasKeyword(SQ_Followers_DisallowTeleportWaitingFollowersToShip)
				Trace(self, "TeleportFollowersToShip() player is in a ship with keyword SQ_Followers_DisallowTeleportWaitingFollowersToShip. ***NOT Moving followers to ship***")

			else
				Trace(self, "TeleportFollowersToShip() player is in a ship. Move followers who are waiting to the ship if they have the SQ_Followers_TeleportToShipWithPlayerWhenWaiting ")
				TeleportFollowers(PlayerRef, IncludeFollowingFollowers = false, IncludeWaitingFollowers = true, StartFollowingAfterTeleport = true)
			endif
		endif
EndFunction

;************************************************************************************
;****************************       ROLE FUNCTIONS      *****************************
;************************************************************************************

;overriden parent function
Function _CustomSetRoleAvaliable(Actor ActorToUpdate)
	;nothing special yet
EndFunction

;overriden parent function
Function _CustomSetRoleUnavailable(Actor ActorToUpdate)
	;nothing special yet
EndFunction

;overriden parent script
;If ActiveAlias is a ReferenceAlias PriorActiveActor is the actor ActorToUpdateReplaced. Otherwise it will be None.
Function _CustomSetRoleActive(Actor ActorToUpdate, Actor PriorActiveActor)
	Trace(self, "_CustomSetRoleActive() ActorToUpdate: " + ActorToUpdate + ", PriorActiveActor: " + PriorActiveActor)
	
	Trace(self, "_CustomSetRoleActive() calling SetGroupFormationFactionData()")
	SetGroupFormationFactionData(ActorToUpdate)

	Trace(self, "_CustomSetRoleActive() calling SetPlayerTeammate(), SetIdleChatterTimes(), and SetNotShowOnStealthMeter()")
	ActorToUpdate.SetPlayerTeammate(true, abCanDoFavor = false)
	SetIdleChatterTimes(ActorToUpdate, IsFollower = true)
	ActorToUpdate.SetNotShowOnStealthMeter(true)

	;cache existing aggression value to return it to when not a follower
	ActorValue aggressionAV = Game.GetAggressionAV()
	float aggression = ActorToUpdate.GetValue(aggressionAV)
	ActorToUpdate.SetValue(Cached_PreFollowerAggression, aggression)
	Trace(self, "_CustomSetRoleActive() starting aggression to cache: " + aggression)
	;make them unaggressive
	ActorToUpdate.SetValue(aggressionAV, 0)

	;make them initially follow
	CommandFollow(ActorToUpdate)
EndFunction

;overriden parent script
Function _CustomSetRoleInactive(Actor ActorToUpdate)
	Trace(self, "_CustomSetRoleInactive() ActorToUpdate: " + ActorToUpdate + ", calling UnsetGroupFormationFactionData(), SetPlayerTeammate(), SetIdleChatterTimes(), and SetNotShowOnStealthMeter()")
	
	UnsetGroupFormationFactionData(ActorToUpdate)
	ActorToUpdate.SetPlayerTeammate(false, abCanDoFavor = false)
	SetIdleChatterTimes(ActorToUpdate, IsFollower = false)
	ActorToUpdate.SetNotShowOnStealthMeter(false)

	;restored cached aggression value
	ActorValue aggressionAV = Game.GetAggressionAV()
	float aggression = ActorToUpdate.GetValue(Cached_PreFollowerAggression)
	Trace(self, "_CustomSetRoleActive() restoring aggression to: " + aggression)
	
	;restore their aggression
	ActorToUpdate.SetValue(aggressionAV, aggression)
EndFunction

Function SetGroupFormationFactionData(Actor ActorToSet)
	int rank = 0
	if  SQ_Companions.IsCompanion(ActorToSet) || SQ_Crew.IsEliteCrew(ActorToSet)
		rank = 2
	endif

	Trace(self, "SetGroupFormationFactionData() ActorToSet: " + ActorToSet)
	ActorToSet.SetFactionRank(SQ_Followers_GroupFormation_Faction, rank)
	ActorToSet.SetGroupFaction(SQ_Followers_GroupFormation_Faction)

	Trace(self, "SetGroupFormationFactionData() after setting SQ_Followers_GroupFormation_Faction... Group Faction: " + ActorToSet.GetGroupFaction() + ", FactionRank: " + ActorToSet.GetFactionRank(SQ_Followers_GroupFormation_Faction))
EndFunction

Function UnsetGroupFormationFactionData(Actor ActorToSet)
	Trace(self, "UnsetGroupFormationFactionData() ActorToSet: " + ActorToSet)
	ActorToSet.RemoveFromFaction(SQ_Followers_GroupFormation_Faction)
	ActorToSet.SetGroupFaction(None)
EndFunction

;************************************************************************************
;****************************   IDLE CHATTER FUNCTIONS  *****************************
;************************************************************************************

Function SetIdleChatterTimes(Actor ActorToSet, bool IsFollower)
	Trace(self, "SetIdleChatterTimes() ActorToSet: " + ActorToSet + ", IsFollower: " + IsFollower)

	if ActorToSet.HasKeyword(SQ_Followers_IdleChatterAllowed)
		;Maintain default idle chatter timer settings
	elseif IsFollower
		_SetIdleChatterTimeAV(ActorToSet, IdleChatterTimeMax, FOL_PreviousIdleChatterTimeMax, FOL_IdleChatterTimeMax)
		_SetIdleChatterTimeAV(ActorToSet, IdleChatterTimeMin, FOL_PreviousIdleChatterTimeMin, FOL_IdleChatterTimeMin)
	else
		_RestoreIdleChatterTimeAV(ActorToSet, IdleChatterTimeMax, FOL_PreviousIdleChatterTimeMax)
		_RestoreIdleChatterTimeAV(ActorToSet, IdleChatterTimeMin, FOL_PreviousIdleChatterTimeMin)
	endif
EndFunction

Function _SetIdleChatterTimeAV(Actor ActorToSet, ActorValue IdleChatterTimeAV, ActorValue PreviousIdleChatterTimeAV, GlobalVariable TargetIdleChatterTime)
	Trace(self, "_SetIdleChatterTimeAV() ActorToSet: " + ActorToSet + ", IdleChatterTimeAV: " + IdleChatterTimeAV + ", PreviousIdleChatterTimeAV: " + PreviousIdleChatterTimeAV + ", TargetIdleChatterTime: " + TargetIdleChatterTime)
	float currentVal = ActorToSet.GetValue(IdleChatterTimeAV)
	float targetVal = TargetIdleChatterTime.GetValue()
	Trace(self, "SetIdleChatterTimes() currentVal: " + currentVal + ", targetVal: " + targetVal)
	;just in case we set them to be a follower multuiple times, only set if current value isn't already what we want
	if currentVal != targetVal
		Trace(self, "SetIdleChatterTime() setting " + PreviousIdleChatterTimeAV + " to " + currentVal)
		ActorToSet.SetValue(PreviousIdleChatterTimeAV, currentVal)
		Trace(self, "SetIdleChatterTime() setting " + IdleChatterTimeAV + " to " + targetVal)
		ActorToSet.SetValue(IdleChatterTimeAV, targetVal)
	endif
EndFunction

Function _RestoreIdleChatterTimeAV(Actor ActorToSet, ActorValue IdleChatterTimeAV, ActorValue PreviousIdleChatterTimeAV)
	Trace(self, "_SetIdleChatterTimeAV() ActorToSet: " + ActorToSet + ", IdleChatterTimeAV: " + IdleChatterTimeAV + ", PreviousIdleChatterTimeAV: " + PreviousIdleChatterTimeAV)
	float targetVal = ActorToSet.GetValue(PreviousIdleChatterTimeAV)
	
	Trace(self, "SetIdleChatterTime() setting " + IdleChatterTimeAV + " to " + targetVal)
	ActorToSet.SetValue(IdleChatterTimeAV, targetVal)
EndFunction





;************************************************************************************
;****************************	  COMMAND FUNCTIONS 	*****************************
;************************************************************************************
Function CommandFollow(Actor Follower)
	Trace(self, "CommandFollow() Follower: " + Follower)

	;clear any SQ_Followers_Link_WaitAtRef link
	Follower.SetLinkedRef(none, SQ_Followers_Link_WaitAtRef)	

	Follower.SetValue(FollowerState, iFollower_Com_Follow.GetValue())
	Follower.EvaluatePackage()
	TriggerTrackingGlobalsAndObjectivesUpdate()
EndFunction

Function CommandWait(Actor Follower, ObjectReference WaitAtRef = None)
	Trace(self, "CommandWait() Follower: " + Follower + ", WaitAtRef: " + WaitAtRef)

	;set any SQ_Followers_Link_WaitAtRef link
	if WaitAtRef
		Follower.SetLinkedRef(WaitAtRef, SQ_Followers_Link_WaitAtRef)
	endif

	Follower.SetValue(FollowerState, iFollower_Com_Wait.GetValue())
	Follower.EvaluatePackage()

	if Follower.IsInScene() == false && Follower.IsInCombat() == false
		;wait to return until they are actually in that package (this prevents issues where we need to make sure followers are in wait packages before moving the player so we don't also code teleport the follower along with the player)
		float waitTime = 0.5
		float timeWaiting
		float maxWaitTimeBeforeBailout = 10
		while Follower.GetCurrentPackage() != SQ_Followers_Wait && timeWaiting <= maxWaitTimeBeforeBailout
			Utility.Wait(waitTime)
			timeWaiting += waitTime
		endwhile
	endif

	TriggerTrackingGlobalsAndObjectivesUpdate()
EndFunction

bool Function IsFollowing(Actor FollowerToTest)
	return FollowerToTest.GetValue(FollowerState) == iFollower_Com_Follow.GetValue()
EndFunction

bool Function IsWaiting(Actor FollowerToTest)
	return FollowerToTest.GetValue(FollowerState) == iFollower_Com_Wait.GetValue()
EndFunction


Function UpdateRetrieveWaitingFollowersObjective(Actor[] ActiveFollowersArray = None)
	Trace(self, "UpdateRetrieveWaitingFollowersObjective() ActiveFollowersArray: " + ActiveFollowersArray)

	if ActiveFollowersArray == None
		ActiveFollowersArray = GetFollowers()
		Trace(self, "UpdateRetrieveWaitingFollowersObjective() now using ActiveFollowersArray: " + ActiveFollowersArray)
	endif

	bool turnOnObjective

	int i = 0
	While (turnOnObjective == false && i < activeFollowersArray.length)
		turnOnObjective = activeFollowersArray[i].GetValue(FollowerState) == iFollower_Com_Wait.GetValue()
		i += 1
	EndWhile

	Trace(self, "UpdateRetrieveWaitingFollowersObjective() turnOnObjective: " + turnOnObjective)

	if turnOnObjective

		if SkipNextWaitingFollowersObjective > 0 ;This is a crude toggle, but until it's not sufficient, we'll go with this since it's much simpler than the alternative.
			SkipNextWaitingFollowersObjective -= 1
		else
			SetObjectiveActive(ObjectiveRetrieveWaitingFollowers)
		endif
	else
		SetObjectiveDisplayed(ObjectiveRetrieveWaitingFollowers, false, false)
	endif

EndFunction


Actor[] Function GetFollowers(bool IncludeFollowingFollowers = true, bool IncludeWaitingFollowers = true)
;NOTE: this will not reflect up to date followers after you store it.
;Consider using instead a linked reference alias to SQ_Followers quest's ActiveFollowers RefCollectionAlias
	Trace(self, "GetFollowers() IncludeFollowingFollowers: " + IncludeFollowingFollowers + ", IncludeWaitingFollowers: " + IncludeWaitingFollowers)


	Actor[] activeFollowersArray = (Alias_Active as RefCollectionAlias).GetArray() as Actor[]
	Trace(self, "GetFollowers() activeFollowersArray: " + activeFollowersArray)

	Actor[] followersToReturn = new Actor[0]

	int i = 0
	While (i < activeFollowersArray.length)
		Actor currentFollower = activeFollowersArray[i]
				
		if (IncludeFollowingFollowers && IsFollowing(currentFollower)) || (IncludeWaitingFollowers && IsWaiting(currentFollower))
			followersToReturn.add(currentFollower)
		endif

		i += 1
	EndWhile

	Trace(self, "GetFollowers() followersToReturn: " + followersToReturn)
	return followersToReturn
EndFunction


Actor[] Function AllFollowersWait(ObjectReference WaitAtRef = None, bool IgnoreCurrentlyWaitingFollowers = true, bool SkipWaitingFollowersObjective = false)
;IgnoreCurrentlyWaitingFollowers = true, by default we don't want to change where  followers are waiting if they are already doing so
	Trace(self, "AllFollowersWait() WaitAtRef: " + WaitAtRef + ", IgnoreCurrentlyWaitingFollowers: " + IgnoreCurrentlyWaitingFollowers)

	if SkipWaitingFollowersObjective
		SkipNextWaitingFollowersObjective += 1
	endif	

	Actor[] activeFollowersArray = (Alias_Active as RefCollectionAlias).GetArray() as Actor[]
	Trace(self, "AllFollowersWait() activeFollowersArray: " + activeFollowersArray)

	Actor[] commandedFollowers = new Actor[0]

	int i = 0
	While (i < activeFollowersArray.length)
		
		Actor currentActor = activeFollowersArray[i]

		if IgnoreCurrentlyWaitingFollowers == false || IsWaiting(currentActor) == false
			CommandWait(currentActor, WaitAtRef = WaitAtRef)
			commandedFollowers.add(currentActor)
		endif
		i += 1
	EndWhile

	Trace(self, "AllFollowersWait() returning commandedFollowers: " + commandedFollowers)
	return commandedFollowers
EndFunction

Function AllFollowersFollow(Actor[] SpecificFollowersToCommand = None)
;SpecificFollowers = which followers you want to issue the Follow command to. If none, it will send to all active followers
;Often this will be an array that was returned by AllFollowersWait() when that function is called with IgnoreCurrentlyWaitingFollowers param being true (default)
	Trace(self, "AllFollowersFollow() SpecificFollowersToCommand: " + SpecificFollowersToCommand)

	;even if we've defined SpecificFollowersToCommand, I still want to trace all the followers for debugging purposes
	Actor[] activeFollowersArray = (Alias_Active as RefCollectionAlias).GetArray() as Actor[]
	Trace(self, "AllFollowersFollow() activeFollowersArray: " + activeFollowersArray)

	if SpecificFollowersToCommand == None
		SpecificFollowersToCommand = activeFollowersArray
	endif

	int i = 0
	While (i < SpecificFollowersToCommand.length)
		CommandFollow(SpecificFollowersToCommand[i])
		i += 1
	EndWhile

	TriggerTrackingGlobalsAndObjectivesUpdate()
EndFunction


;This function sets various globals we use to log player's followers' states
;The globals in here should only be set inside this function
;we use the TriggerTrackingGlobalsAndObjectivesUpdate() function and related timer to ensure an orderly and "filtered" call to this function
;***The TriggerTrackingGlobalsAndObjectivesUpdate() should be the only function calling this***
Function UpdateTrackingGlobalsAndObjectives() private
	Trace(self, "UpdateTrackingGlobalsAndObjectives()")

	Actor[] activeFollowersArray = GetFollowers()

	Trace(self, "SetTrackingGlobal() activeFollowersArray: " + activeFollowersArray)

	UpdateRetrieveWaitingFollowersObjective(activeFollowersArray)
	

	int followerCount = activeFollowersArray.Length
	PlayerFollowers_Count.SetValueInt(followerCount)

	if followerCount > 0
		PlayerFollowers_HasFollower.SetValueInt(1)
	else
		PlayerFollowers_HasFollower.SetValueInt(0)
	endif

	int followerCountFollowing = 0 ;includes companions
	int followerCountWaiting = 0 ;includes companions

	bool hasCompanion
	int companionCountFollowing = 0 ;only companions
	int companionCountWaiting = 0 ;onlu companions

	int iWait = iFollower_Com_Wait.GetValue() as int

	int i = 0
	While (i < activeFollowersArray.length)
		Actor currentFollower = activeFollowersArray[i]

		If currentFollower.GetValue(FollowerState) == iWait
			followerCountWaiting += 1

			if currentFollower is CompanionActorScript
				companionCountWaiting += 1
				hasCompanion = true
			endif

		Else
			followerCountFollowing += 1

			if currentFollower is CompanionActorScript
				companionCountFollowing += 1
				hasCompanion = true
			endif

		EndIf

		i += 1
	EndWhile


	;FOLLOWERS (including companions)
	if followerCountFollowing > 0
		PlayerFollowers_HasFollowerFollowing.SetValueInt(1)
	else
		PlayerFollowers_HasFollowerFollowing.SetValueInt(0)
	endif

	if followerCountWaiting > 0
		PlayerFollowers_HasFollowerWaiting.SetValueInt(1)
	else
		PlayerFollowers_HasFollowerWaiting.SetValueInt(0)
	endif

	PlayerFollowers_CountFollowing.SetValueInt(followerCountFollowing)
	PlayerFollowers_CountWaiting.SetValueInt(followerCountWaiting)


	;COMPANION FOLLOWERS (only)
	if hasCompanion
		PlayerFollowers_HasCompanion.SetValue(1)
	else
		PlayerFollowers_HasCompanion.SetValue(0)
	endif

	if companionCountFollowing > 0
		PlayerFollowers_HasCompanionFollowing.SetValueInt(1)
	else
		PlayerFollowers_HasCompanionFollowing.SetValueInt(0)
	endif

	if companionCountWaiting > 0
		PlayerFollowers_HasCompanionWaiting.SetValueInt(1)
	else
		PlayerFollowers_HasCompanionWaiting.SetValueInt(0)
	endif

EndFunction

Actor[] Function TeleportFollowers(ObjectReference DestinationRef, Actor[] SpecificFollowersToTeleport = None, bool IncludeFollowingFollowers = true, bool IncludeWaitingFollowers = true, bool StartFollowingAfterTeleport = false, bool StartWaitingAfterTeleport = false, bool SkipWaitingFollowersObjective = false)
;DestinationRef = where to teleport, if none (default) will be the player
;SpecificFollowersToTeleport = subset of followers to teleport, if none (default) will be all active followers
	Trace(self, "TeleportFollowers() ")

	if SpecificFollowersToTeleport == None
		SpecificFollowersToTeleport = (Alias_Active as RefCollectionAlias).GetActorArray()
	endif

	if DestinationRef == None
		DestinationRef = PlayerRef
	endif

	Actor[] teleportedActors = new Actor[0]

	int i = 0
	While (i < SpecificFollowersToTeleport.length)
		Actor currentActor = SpecificFollowersToTeleport[i]

		Trace(self, "TeleportFollowers() currentActor: " + currentActor)

		bool shouldTeleport = (IncludeFollowingFollowers && IsFollowing(currentActor)) || (IncludeWaitingFollowers && IsWaiting(currentActor))

		if shouldTeleport
			if StartFollowingAfterTeleport
				Trace(self, "TeleportFollowers() calling CommandFollow()")
				CommandFollow(currentActor)
			elseif StartWaitingAfterTeleport
				Trace(self, "TeleportFollowers() calling CommandWait()")
				if SkipWaitingFollowersObjective
					SkipNextWaitingFollowersObjective += 1
				endif

				if DestinationRef != PlayerRef
					CommandWait(currentActor, WaitAtRef = DestinationRef)
				else 
					CommandWait(currentActor)
				endif
			endif 

			Trace(self, "TeleportFollowers() moving currentActor: " +  currentActor + " to DestinationRef: " + DestinationRef)
			currentActor.MoveTo(DestinationRef)
			teleportedActors.add(currentActor)
		endif

		i += 1
	EndWhile

	Trace(self, "TeleportFollowers() returning teleportedActors: " + teleportedActors)
	return teleportedActors
EndFunction


;************************************************************************************
;****************************	   DEBUG FUNCTIONS 		*****************************
;************************************************************************************
Function DebugFollower(Actor Follower)
	Trace(self, "DebugMakeFollower() Follower: " + Follower)
	SetRoleActive(Follower)
	Follower.MoveTo(PlayerRef)
EndFunction

;************************************************************************************
;****************************	   GLOBAL FUNCTIONS 	*****************************
;************************************************************************************
SQ_FollowersScript Function GetScript() global ;used for making functions global
	return (Game.GetFormFromFile(0x0000D773, "Starfield.esm") as Quest) as SQ_FollowersScript ;this script attached to Followers quest
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
;*** lives on parent SQ_ActorRolesScript ****