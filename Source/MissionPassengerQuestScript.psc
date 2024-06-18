Scriptname MissionPassengerQuestScript extends MissionQuestScript Conditional
{passenger delivery quest script}

group MissionTypeData
	RefCollectionAlias property SourceCollection auto const mandatory
	{ collection holding all valid source refs }

	RefCollectionAlias property Passengers auto const Mandatory
	{ collection holding passengers }

	ReferenceAlias property PassengerMarker auto const Mandatory
	{ alias holding marker in player's ship where passengers will be created }

	ReferenceAlias property DestinationMarker auto const Mandatory
	{ alias holding marker where passengers will path to when disembarking }

	ReferenceAlias property DisembarkMarker auto const Mandatory
	{ alias for finding nearby disembark marker when player lands (for failed missions) }

	LocationAlias Property SourceLocation Auto Const Mandatory
	{ alias with source location }

	ActorValue property MissionBoardDisembark auto const Mandatory
	{ flags passengers to run disembark package }

	Message property MissionBoardPassengerNoSpaceMessage auto const Mandatory
	{ if you don't have space on your ship for these passengers }

	SQ_PlayerShipScript property SQ_PlayerShip auto const Mandatory
	{ holds player home ship }

	Keyword property MissionStoryKeywordPassengerDestination auto const mandatory
	{ keyword to use to start this quest's passenger destination finder quest }	

    Keyword property LocTypeStarStation auto const mandatory
    { for checking for docking }

	Keyword property LocTypeStarstationExterior auto const mandatory
	{ keyword to check if you've docked with a starstation }

	float property DestinationCheckDistance = 50000.0 auto Const
	{ if UseDistanceCheckForDestinationCheck = true, count as "at destination" if destination marker is within this distance }

	GlobalVariable Property PlayerPassengerSpaceCurrent Auto Const Mandatory
	{used for text replacement - needs to be updated when player ship passengers changes }

	GlobalVariable Property PlayerPassengerSpaceTotal Auto Const Mandatory
	{used for text replacement }

    bool property hasPassengerSpace = false auto hidden
    { updated by UpdatePlayerPassengerSpace }
endGroup

int startupTimerID = 1 Const

Event OnQuestStarted()
	debug.trace(self + " OnQuestStarted")
	StartTimer(0.5, startupTimerID)
EndEvent

; move this out of OnQuestStarted so it doesn't block quest from starting up
Function InitializePassengers()
	debug.trace(self + "InitializePassengers")

	bool foundValidDestination = false

	if DestinationMarker.GetRef()
		foundValidDestination = true
	else
		MissionParentScript:MissionLocRefType[] passengerTypes = new MissionParentScript:MissionLocRefType[MissionParent.passengerTypes.Length]
		; copy the array
		int i = 0
		while i < MissionParent.passengerTypes.Length
			passengerTypes[i] = MissionParent.passengerTypes[i]
			i += 1
		EndWhile

		MissionDestinationFinderScript finderQuest
		debug.trace(self + " starting finderQuest with akLoc=" + SourceLocation.GetLocation() + " akRef1=" + SourceCollection.GetAt(0))
		MissionDestinationFinderScript[] startedQuests = MissionStoryKeywordPassengerDestination.SendStoryEventAndWait(akLoc = SourceLocation.GetLocation(), akRef1 = SourceCollection.GetAt(0)) as MissionDestinationFinderScript[]
		debug.trace(self + " tried to start finderQuest: startedQuests = " + startedQuests)
		if startedQuests.Length > 0
			debug.trace(self + " passenger finder quest started...")
			finderQuest = startedQuests[0]
			while finderQuest.IsStarting()
				debug.trace(self + " ... " + finderQuest + " still starting...")
			endWhile
			foundValidDestination = finderQuest.FindMatchingDestination(passengerTypes, SourceCollection, PrimaryRef, DestinationMarker, targetLocation)
			; now fill other aliases
			TargetSystemLocation.RefillAlias()
			TargetPlanetLocation.RefillAlias()
			DisembarkMarker.ClearAndRefillAlias()
			finderQuest.Stop()
		EndIf
	EndIf
	
	if foundValidDestination
		; set number of passengers based on data on ref
		MissionBoardPassengerSourceScript passengerTypeRef = PrimaryRef.GetRef() as MissionBoardPassengerSourceScript
		; don't create mission with more slots than player can handle if possible
		int passengerCountMax = passengerTypeRef.PassengerCountMax
		ObjectReference PlayerShipRef = SQ_PlayerShip.PlayerShip.GetRef()
		if PlayerShipRef
			int currentPassengerSlots = SQ_PlayerShip.GetPassengerSlots()
			debug.trace(self + " currentPassengerSlots=" + currentPassengerSlots + " passengerCountMax=" + passengerCountMax)

			if currentPassengerSlots < passengerCountMax && currentPassengerSlots >= passengerTypeRef.PassengerCountMin
				passengerCountMax = currentPassengerSlots
			endif
		EndIf
		
		int passengerCount = Utility.RandomInt(passengerTypeRef.PassengerCountMin, passengerCountMax)
		MissionIntValue01.SetValue(passengerCount)
		UpdateCurrentInstanceGlobal(MissionIntValue01)

		debug.trace(self + " passengerCountMax=" + passengerCountMax + ", passengerCount=" + passengerCount)

    	Parent.OnQuestStarted()
	Else
		; no valid destination
		debug.trace(self + " no valid destination found")
		
		Stop()
	endif
EndFunction

Function HandlePlayerShipLanding()
	CheckForPassengerUnloading()
endFunction

Function HandlePlayerShipDocking(SpaceshipReference akParent)
    debug.trace(self + "HandlePlayerShipDocking akParent=" + akParent + " akParent.GetCurrentLocation()")
	CheckForPassengerUnloading()
endFunction

Function HandlePlayerLocationChange(Location akOldLoc, Location akNewLoc)
	debug.trace(self + " HandlePlayerLocationChange akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
	; if this is the target location, check for completion
	if IsInTargetLocation(akNewLoc)
		CheckForPassengerUnloading()
	endif
EndFunction

Guard passengerChangeGuard ProtectsFunctionLogic

function CheckForPassengerUnloading()
	LockGuard passengerChangeGuard
		if PlayerCompletedQuest == false
			; get current ship location
			SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
			Location currentShipLocation = playerShipRef.GetCurrentLocation()
			debug.trace(self + " CheckForPassengerUnloading currentShipLocation=" + currentShipLocation)

			if PlayerFailedQuest
				debug.trace(self + " CheckForPassengerUnloading: mission failed, checking if passengers can disembark here")
				; watch for player to land on a settled planet
				; see if this planet has an exit marker
				TargetLocation.ForceLocationTo(currentShipLocation)
				DisembarkMarker.ClearAndRefillAlias()
				ObjectReference disembarkRef = DisembarkMarker.GetRef()

				debug.trace(self + " CheckForPassengerUnloading: DisembarkMarker=" + disembarkRef)
				if disembarkRef
					DestinationMarker.ForceRefTo(disembarkRef)
					HandlePassengersDisembark()
				endif
			elseif PlayerAcceptedQuest
				; if you land in the target location, tell passengers to disembark
				if IsInTargetLocation(currentShipLocation)
					debug.trace(self + " CheckForPassengerUnloading: at target location - disembark passengers")
					; disembark passengers
					HandlePassengersDisembark()
				else
					debug.trace(self + " CheckForPassengerUnloading: use distance check")
					; use distance check
					ObjectReference destinationMarkerRef = DestinationMarker.GetRef()
					if playerShipRef.GetDistance(destinationMarkerRef) < DestinationCheckDistance
						debug.trace(self + " CheckForPassengerUnloading: within distance of destination marker - disembark passengers")
						; disembark passengers
						HandlePassengersDisembark()
					endif
				endif
			endif
		Else
			debug.trace(self + " CheckForPassengerUnloading: quest already completed - do nothing")
		endif
	EndLockGuard
endFunction

bool function IsInTargetLocation(Location locationToCheck)
	Location theTargetLocation = targetLocation.GetLocation()
	bool returnVal = (locationToCheck.IsSameLocation(theTargetLocation) || locationToCheck.IsSameLocation(theTargetLocation, LocTypeStarStation)  || locationToCheck.IsSameLocation(theTargetLocation, LocTypeStarstationExterior))
	debug.trace(self + " IsInTargetLocation locationToCheck=" + locationToCheck + " theTargetLocation=" + theTargetLocation + " return: " + returnVal)
	return returnVal
endFunction

function HandlePlayerShipTakeOff()
	debug.trace(self + " HandlePlayerShipTakeOff")
	; we're not landed - clear disembark flag
	Passengers.SetValue(MissionBoardDisembark, 0)
	; set aboard ship hello AV
	Passengers.SetValue(MissionParent.RQ_AV_Hello, MissionParent.RQ_Hello_AboardShipValue.GetValueInt())
	; always check for shutdown after taking off
	CheckForShutdown()
endFunction


function HandleOnQuestRejected()
	debug.trace(self + " HandleOnQuestRejected")
	CheckForPassengerUnloading() ; in case ship is landed or docked currently

	Parent.HandleOnQuestRejected()
endFunction

Function UpdatePlayerPassengerSpace()
	SpaceshipReference PlayerShipRef = PlayerShip.GetShipRef()
	if PlayerShipRef
		; check if it has passenger space
		int totalPassengerSlots = SQ_PlayerShip.GetPassengerSlots(true)
		int availablePassengerSlots = SQ_PlayerShip.GetPassengerSlots(false) ; current passenger space on player home ship
		int usedPassengerSlots = totalPassengerSlots - availablePassengerSlots
		int newPassengers = MissionIntValue01.GetValueInt()
		hasPassengerSpace = (newPassengers <= availablePassengerSlots)

		debug.trace(self + " UpdatePlayerPassengerSpace: newPassengers=" + newPassengers + " availablePassengerSlots=" + availablePassengerSlots + " totalPassengerSlots=" + totalPassengerSlots + " usedPassengerSlots=" + usedPassengerSlots)

		PlayerPassengerSpaceCurrent.SetValue(usedPassengerSlots)
		PlayerPassengerSpaceTotal.SetValue(totalPassengerSlots)
		UpdateCurrentInstanceGlobal(PlayerPassengerSpaceCurrent)
		UpdateCurrentInstanceGlobal(PlayerPassengerSpaceTotal)
	endif
EndFunction

; OVERRIDE parent function
Function HandleOnMissionAccepted()
	; get player ship right now
	ObjectReference PlayerShipRef = SQ_PlayerShip.PlayerShip.GetRef()
	debug.trace(self + "HandleOnMissionAccepted PlayerShipRef=" + PlayerShipRef)

	if PlayerShipRef
		; check if it has passenger space
		UpdatePlayerPassengerSpace()
		if hasPassengerSpace
			Parent.HandleOnMissionAccepted()
		else
			; not enough space
			MissionBoardPassengerNoSpaceMessage.Show()
		endif
	; otherwise, give "no space" message
	else
		MissionBoardPassengerNoSpaceMessage.Show()
	endif
endFunction

; OVERRIDE parent function
Function MissionAccepted(bool bAccepted)
	if bAccepted
		; create passengers and accept mission
		MissionBoardPassengerSourceScript passengerSourceRef = PrimaryRef.GetRef() as MissionBoardPassengerSourceScript
		debug.trace(self + " HandleOnMissionAccepted: passenger source marker=" + passengerSourceRef)
		if passengerSourceRef
			int newPassengers = MissionIntValue01.GetValueInt()
			passengerSourceRef.CreatePassengers(Passengers, PassengerMarker.GetRef(), newPassengers)
			RegisterForRemoteEvent(Passengers, "OnExitShipInterior")
			RegisterForRemoteEvent(Passengers, "OnUnload")
			RegisterForRemoteEvent(Passengers, "OnDeath")
			if MissionTimeHoursActual && MissionTimeHoursActual.GetValue() > 0
				StartQuestTimer(MissionTimeHoursActual.GetValue())
			endif
			; add passengers to player home ship
			SQ_PlayerShip.AddPassengers(Passengers)
			; set hello AV
			Passengers.SetValue(MissionParent.RQ_AV_Hello, MissionParent.RQ_Hello_AboardShipValue.GetValueInt())
		else
			; something went wrong
			debug.trace(self + " HandleOnMissionAccepted: FAILED - invalid PrimaryRef marker")
		endif
	EndIf
	Parent.MissionAccepted(bAccepted)
endFunction

; override parent function
Function MissionShutdown()
	debug.trace(self + " MissionShutdown")
	CheckForShutdown()
EndFunction

; OVERRIDE parent function
int Function GetActualReward()
	; RewardAmountGlobal is the base reward, add in an additional amount per passenger from data on the source ref
	MissionBoardPassengerSourceScript passengerSourceRef = PrimaryRef.GetRef() as MissionBoardPassengerSourceScript
	debug.trace(self + " GetActualReward: passengerSourceRef=" + passengerSourceRef)
	ActorValue rewardMultAV = MissionParent.MissionRewardMultiplier
	float reward = ( RewardAmountGlobal.GetValue() + MissionIntValue01.GetValue() * passengerSourceRef.ExtraRewardPerPassenger ) * (1.0 + PrimaryRef.GetRef().GetValue(rewardMultAV))
	debug.trace(self + "GetActualReward=" + reward)
	return reward as int
endFunction

; OVERRIDE parent function
Function SetActualMissionTime()
	MissionBoardPassengerSourceScript passengerSourceRef = PrimaryRef.GetRef() as MissionBoardPassengerSourceScript
	if passengerSourceRef
		if MissionTimeHours && MissionTimeHoursActual && MissionTimeHours.GetValue() > 0
			MissionTimeHoursActual.SetValue(MissionTimeHours.GetValue() * passengerSourceRef.MissionTimeMult)
			debug.trace(self + " SetActualMissionTime: MissionTimeHoursActual=" + MissionTimeHoursActual.GetValue())
		endif
	endif
EndFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == startupTimerID
		InitializePassengers()
	endif
EndEvent

;Event received when the quest timer has ended
Event OnQuestTimerEnd(int aiReason)
	debug.trace(self + " OnQuestTimerEnd aiReason=" + aiReason)
	if aiReason == 0 ; timer expired
   		MissionFailed()
	endif
EndEvent

Event OnQuestTimerStart(int aiReason)
	debug.trace(self + " OnQuestTimerStart aiReason=" + aiReason + " time remaining=" + GetQuestTimeRemaining())
EndEvent

Function debugQuestTimeRemaining()
	debug.trace(self + " QuestTimeRemaining=" + GetQuestTimeRemaining())
endFunction

function debugStartQuestTimer(float questtime)
	if questtime <= 0
		StartQuestTimer()
	Else
		StartQuestTimer(questtime)
	endif
	debug.trace(self + " starting quest timer: time remaining=" + GetQuestTimeRemaining())
endFunction

Function HandlePassengersDisembark()
	debug.trace(self + " HandlePassengersDisembark")
	Passengers.SetValue(MissionBoardDisembark, 1)
	Passengers.SetValue(MissionParent.RQ_AV_Hello, MissionParent.RQ_Hello_DepartingShipValue.GetValueInt())

	Passengers.EvaluateAll()
	; check for completion/shutdown
	debug.trace(self + " HandlePassengersDisembark: calling CheckForCompletion")
	CheckForCompletion()
endFunction

Event RefCollectionAlias.OnUnload(RefCollectionAlias akSender, ObjectReference akSenderRef)
	debug.trace(self + " OnUnload " + akSenderRef)
	; if passenger is not in the ship, disable
	if CheckForPassengerDisembark(akSenderRef as Actor)
		akSenderRef.Disable()
		debug.trace(self + " RefCollectionAlias.OnUnload: calling CheckForCompletion")
		CheckForCompletion()
	endif
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akKiller)
	; if a passenger dies before the quest is completed, fail mission
	MissionFailed()
	CheckForShutdown()
EndEvent

Event RefCollectionAlias.OnExitShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
	debug.trace(self + " OnExitShipInterior " + akSenderRef)
	; if passenger exits the ship, remove as passenger
	if CheckForPassengerDisembark(akSenderRef as Actor)
		debug.trace(self + " RefCollectionAlias.OnExitShipInterior: calling CheckForCompletion")
		CheckForCompletion()
	endif
EndEvent

; return true if passenger is not on player ship
bool Function CheckForPassengerDisembark(Actor passengerRef)
	bool disembark = false
	SpaceshipReference playerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef()
	SpaceshipReference passengerShipRef = passengerRef.GetCurrentShipRef()
	debug.trace(self + " CheckForPassengerDisembark " + passengerRef + " playerShipRef=" + playerShipRef + " passengerShipRef=" + passengerShipRef)
	if passengerShipRef != playerShipRef
		debug.trace(self + "     " + passengerRef + " is not on " + playerShipRef + " - count as disembarked")
		; restore the passenger value to release a passenger slot
		SQ_PlayerShip.RemovePassenger(passengerRef)
		disembark = true
	endif
	return disembark
EndFunction

Function CheckForCompletion()
	debug.trace(self + " CheckForCompletion")

	SpaceshipReference playerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef()
	debug.trace(self + "     playerShipRef=" + playerShipRef)

	bool disablePassengersOnShip = false
	; if player is not in the ship, disable all passenger still on ship and count quest complete
	if Game.GetPlayer().GetCurrentShipRef() != playerShipRef
		disablePassengersOnShip = true
	EndIf

	int passengerCount = Passengers.GetCount()
	int disembarkedCount = 0
	int i = 0
	while i < passengerCount
		Actor passengerRef = Passengers.GetActorAt(i)
		if passengerRef.GetCurrentShipRef() != playerShipRef 
			disembarkedCount += 1
		Elseif disablePassengersOnShip
			passengerRef.Disable()
			; restore the passenger value to release a passenger slot
			SQ_PlayerShip.RemovePassenger(passengerRef)
			disembarkedCount += 1
		endif
		i += 1
	EndWhile

	if disembarkedCount >= passengerCount
		MissionComplete()
	endif

	CheckForShutdown()
EndFunction

Function CheckForShutdown()
	int passengerCount = Passengers.GetCount()

	int disabledCount = Passengers.GetCountDisabled()
	debug.trace(self + " CheckForShutdown disabledCount=" + disabledCount + " passengerCount=" + passengerCount)
	if disabledCount >= passengerCount
		Stop()
	else
		; check if all dead
		int deadCount = Passengers.GetCountDead()
		debug.trace(self + " CheckForShutdown deadCount=" + deadCount)
		if deadCount >= passengerCount
			Stop()
		endif
	endif
endFunction

Function MissionFailed()
	debug.trace(self + " MissionFailed")
	Parent.MissionFailed()
	if PlayerFailedQuest
		; clear RQ hello value
		Passengers.SetValue(MissionParent.RQ_AV_Hello, 0)
	endif
endFunction
