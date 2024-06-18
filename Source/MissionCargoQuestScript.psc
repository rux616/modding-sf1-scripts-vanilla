Scriptname MissionCargoQuestScript extends MissionCargoParentScript conditional
{cargo delivery quest script}

group CargoMissionData
	SQ_ParentScript property SQ_Parent auto const
	{ optional - to get contraband confiscated events }

	RefCollectionAlias property SourceCollection auto const mandatory
	{ collection holding all valid source refs }

	ReferenceAlias property DestinationCargo auto const Mandatory
	{ alias holding cargo destination ref - counterpart to what is in PrimaryRef alias }

	RefCollectionAlias property CargoCollection auto const Mandatory
	{ alias holding cargo items }

	LocationAlias Property CargoSourceLocation Auto Const Mandatory
	{ alias with source location }

	Message property MissionBoardCargoNoSpaceMessage auto const Mandatory
	{ if you don't have space on your ship for this cargo }

	Message property MissionBoardContrabandWarningAcceptMessage auto const Mandatory
	{ accept message to use if you don't have enough shielded space on your ship for this contraband cargo }

	SQ_PlayerShipScript property SQ_PlayerShip auto const Mandatory
	{ for now holds player ship }

	Keyword property MissionStoryKeywordCargoDestination auto const mandatory
	{ keyword to use to start this quest's cargo destination finder quest }	

	GlobalVariable property MissionBoardCargoValueMult auto const mandatory
	{ multiplier on cargo value reward }

	bool property Contraband = false auto const
	{ set to TRUE if this mission involves contraband - if TRUE, accept will warn player if their ship doesn't have enough shielded cargo space for this cargo }

	int property CargoItems = 5 auto hidden
	{ Number of cargo items created for this mission - set in GetActualReward() }

	bool property PickOnlyCargoThatWillFit = false auto Const
	{ by default, will pick randomly from all cargo - some of which may be too heavy for player's current ship 
	  set this to TRUE to pick only form cargo that can fit in the player's current ship
	}

	float property DestinationCheckDistance = 50000.0 auto Const
	{ if UseDistanceCheckForDestinationCheck = true, count as "at destination" if destination marker is within this distance }
endGroup

int startupTimerID = 1 Const

Event OnQuestStarted()
	debug.trace(self + " OnQuestStarted")
	StartTimer(0.5, startupTimerID)
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == startupTimerID
		InitializeCargo()
	endif
EndEvent

; moved this out of OnQuestStarted so it doesn't block quest from starting up
Function InitializeCargo()
	debug.trace(self + "InitializeCargo")
	bool foundValidDestination = false
	SpaceshipReference PlayerShipRef = PlayerShip.GetShipRef()
	
    MissionParentScript:MissionLocRefType[] cargoTypes = new MissionParentScript:MissionLocRefType[0]
	if PlayerShipRef
		float cargoSpaceTotal = PlayerShipRef.GetShipMaxCargoWeight()
		; copy from the source collection
		int i = 0
		while i < SourceCollection.GetCount()
			MissionBoardCargoContainerScript sourceRef = SourceCollection.GetAt(i) as MissionBoardCargoContainerScript
			if sourceRef
				MiscObject theCargoMiscObject = sourceRef.CargoMiscObject
				; get real weight
				float cargoWeightBase = theCargoMiscObject.GetWeight()
				float minCargoWeight = cargoWeightBase * sourceRef.CargoWeightMultMin
				debug.trace(self + " checking " + theCargoMiscObject + " with min weight " + minCargoWeight + " vs. player ship capacity " + cargoSpaceTotal)
				if PickOnlyCargoThatWillFit == false || ( minCargoWeight <= cargoSpaceTotal )
					; find matching cargo type
					int cargoTypeIndex = MissionParent.cargoTypes.FindStruct("CargoSourceBase", sourceRef.GetBaseObject())
					if cargoTypeIndex > -1
						MissionParentScript:MissionLocRefType theCargoType = MissionParent.cargoTypes[cargoTypeIndex]
						debug.trace(self + " Adding cargo type " + cargoTypeIndex + " for " + theCargoMiscObject )
						cargoTypes.Add(theCargoType)
					endif
				endif
			endif
			i += 1
		EndWhile
	EndIf

	if cargoTypes.Length > 0
		MissionDestinationFinderScript finderQuest
		MissionDestinationFinderScript[] startedQuests = MissionStoryKeywordCargoDestination.SendStoryEventAndWait(akLoc = CargoSourceLocation.GetLocation(), akRef1 = SourceCollection.GetAt(0)) as MissionDestinationFinderScript[]
		debug.trace(self + " tried to start finderQuest - startedQuests=" + startedQuests)
		if startedQuests.Length > 0
			debug.trace(self + " cargo finder quest started...")
			finderQuest = startedQuests[0]
			while finderQuest.IsStarting()
				debug.trace(self + " ... " + finderQuest + " still starting...")
			endWhile

			foundValidDestination = finderQuest.FindMatchingDestination(cargoTypes, SourceCollection, PrimaryRef, DestinationCargo, targetLocation)
			; now fill other aliases
			TargetSystemLocation.RefillAlias()
			TargetPlanetLocation.RefillAlias()
			finderQuest.Stop()
		EndIf

		; TODO - use data on locations to modify cargo amount and value

		if foundValidDestination
			Parent.OnQuestStarted()
		Else
			; no valid cargo destination
			debug.trace(self + " no valid cargo destination found")
			Stop()
		endif
	else
		; no valid cargo types - most likely no player ship
		debug.trace(self + " no valid cargo types found - most likely player has no ship: playerShipRef=" + playerShipRef)
		Stop()
	endif
endFunction
	
; override parent function
Function HandlePlayerShipLanding()
	CheckForCargoUnloading()
endFunction

Function HandlePlayerShipDocking(SpaceshipReference akParent)
	CheckForCargoUnloading()
endFunction

Function CheckForCargoUnloading()
	; get current ship location
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	Location currentShipLocation = playerShipRef.GetCurrentLocation()

	debug.trace(self + "CheckForCargoUnloading currentShipLocation=" + currentShipLocation + " targetLocation=" + TargetPlanetLocation.GetLocation())
	; if you land in the target location, we consider the cargo delivered
	if PlayerAcceptedQuest && PlayerFailedQuest == False
		if currentShipLocation.IsSameLocation(targetLocation.GetLocation()) || currentShipLocation.IsSameLocation(targetLocation.GetLocation(), LocTypeStarStation)  || currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), LocTypeStarstationExterior)
			MissionComplete()
		else
			; distance check
			debug.trace(self + " CheckForCargoUnloading: use distance check")
			; use distance check
			ObjectReference destinationMarkerRef = DestinationCargo.GetRef()
			if playerShipRef.GetDistance(destinationMarkerRef) < DestinationCheckDistance
				debug.trace(self + " CheckForCargoUnloading: within distance of destination marker - mission complete")
				; mission complete
				MissionComplete()
			endif

		endif
	endif
EndFunction

; OVERRIDE function from MissionCargoParentScript - used for UpdatePlayerCargoSpace()
MissionBoardCargoContainerScript Function GetCargoContainer()
	return PrimaryRef.GetRef() as MissionBoardCargoContainerScript
endFunction

; OVERRIDE parent function
Function HandleOnMissionAccepted()
	debug.trace(self + " HandleOnMissionAccepted")

	SpaceshipReference PlayerShipRef = PlayerShip.GetShipRef()
	if PlayerShipRef
		; check if it has cargo space
		MissionBoardCargoContainerScript cargoContainerRef = PrimaryRef.GetRef() as MissionBoardCargoContainerScript

		; if so, load cargo and accept mission
		debug.trace(self + " HandleOnMissionAccepted: cargo type marker=" + PrimaryRef.GetRef() + " ")
		if cargoContainerRef
			UpdatePlayerCargoSpace()
			if hasCargoSpace
				if Contraband && hasShieldedCargoSpace == false
					; use "contraband warning" accept message
					if MissionBoardContrabandWarningAcceptMessage.Show() == 0
						MissionAccepted(true)
					else
						MissionAccepted(false)
					endif
				else
					; use standard accept message
					debug.trace(self + " HandleOnMissionAccepted")
					if MissionParent.MissionBoardAcceptMessage.Show() == 0
						MissionAccepted(true)
					else
						MissionAccepted(false)
					endif
				endif
			endif
		else
			; something went wrong
			debug.trace(self + " MissionAccepted: FAILED - invalid found primary ref marker")
		endif
	Else
		debug.trace(self + " MissionAccepted: FAILED - no player ship")
	EndIf

	if hasCargoSpace == false
		; give "no cargo space" message
		MissionBoardCargoNoSpaceMessage.Show()
	endif
endFunction

; OVERRIDE parent function
Function MissionAccepted(bool bAccepted)
	Parent.MissionAccepted(bAccepted)
	if bAccepted
		SpaceshipReference PlayerShipRef = PlayerShip.GetShipRef()
		if PlayerShipRef
			MissionBoardCargoContainerScript cargoContainerRef = PrimaryRef.GetRef() as MissionBoardCargoContainerScript
			if cargoContainerRef
				debug.trace(self + " adding aliased item " + cargoContainerRef.CargoMiscObject + " x " + CargoItems)
				PlayerShipRef.AddAliasedItem(cargoContainerRef.CargoMiscObject, CargoCollection, CargoItems)
				debug.trace(self + " CargoCollection after adding items: " + CargoCollection.GetCount() + " items; array=" + CargoCollection.GetArray())
			endif
			; register for arrest/jail events if a contraband mission
			if Contraband && SQ_Parent
				RegisterForCustomEvent(SQ_Parent, "SQ_ContrabandConfiscated")
			EndIf
		EndIf

		MissionParent.UpdateMissions()
	EndIf
EndFunction

Function MissionComplete()
	UnloadCargo()
	Parent.MissionComplete()
endFunction

; OVERRIDE parent function
int Function GetActualReward()
	MissionBoardCargoContainerScript cargoContainerRef = GetCargoContainer()
	float rewardBase = RewardAmountGlobal.GetValue()
	debug.trace(self + "GetActualReward: rewardBase=" + rewardBase)

	; get real weight
	float cargoWeightBase = cargoContainerRef.CargoMiscObject.GetWeight()
	; randomize cargo amount
	CargoItems = Utility.RandomInt(cargoContainerRef.CargoWeightMultMin, cargoContainerRef.CargoWeightMultMax)
	float cargoWeight = cargoWeightBase * cargoItems
	debug.trace(self + "GetActualReward: cargoWeightBase=" + cargoWeightBase + ", CargoItems=" + CargoItems + ", total cargo weight=" + cargoWeight)

	; if player's ship can't hold max amount, try to randomize within player's capacity
	SpaceshipReference PlayerShipRef = PlayerShip.GetShipRef()
	if PlayerShipRef
		float cargoSpaceMax = PlayerShipRef.GetShipMaxCargoWeight() - PlayerShipRef.GetWeightInContainer()
		debug.trace(self + "GetActualReward: player's max cargo space=" + cargoSpaceMax)
		if cargoSpaceMax < cargoWeight
			int minWeight = cargoContainerRef.CargoWeightMultMin*cargoWeightBase as int
			debug.trace(self + "GetActualReward: minWeight=" + minWeight)
			if minWeight < cargoSpaceMax
				; reroll within player cargo limits
				int maxCount = (cargoSpaceMax/cargoWeightBase) as int
				CargoItems = Utility.Randomint(cargoContainerRef.CargoWeightMultMin, maxCount)
			endif
		EndIf
	endif

	cargoWeight = cargoWeightBase*CargoItems
	debug.trace(self + "GetActualReward: CargoItems=" + CargoItems + " total cargoWeight=" + cargoWeight)

	MissionIntValue01.SetValue(cargoWeight as int)

	; set real reward
	float cargoValue = cargoContainerRef.CargoMiscObject.GetGoldValue()*CargoItems
	debug.trace(self + "GetActualReward: cargoValue=" + cargoValue)

	ActorValue rewardMultAV = MissionParent.MissionRewardMultiplier

	float valueMult = MissionBoardCargoValueMult.GetValue()
	float sourceMult = 1.0 + PrimaryRef.GetRef().GetValue(rewardMultAV)
	float destMult = 1.0 + DestinationCargo.GetRef().GetValue(rewardMultAV)
	debug.trace(self + "    valueMult=" + valueMult)
	debug.trace(self + "    sourceMult=" + sourceMult)
	debug.trace(self + "    destMult=" + destMult)

	float reward = rewardBase + cargoValue*valueMult*sourceMult*destMult
	debug.trace(self + "GetActualReward=" + reward)
	UpdateCurrentInstanceGlobal(MissionIntValue01)
	return reward as int
endFunction

; OVERRIDE parent function
Function MissionFailed()
	debug.trace(self + " MissionFailed PlayerCompletedQuest=" + PlayerCompletedQuest)
	if PlayerCompletedQuest == false
		; remove cargo
		UnloadCargo()
		Parent.MissionFailed()
	EndIf
endFunction

Function UnloadCargo()
	debug.trace(self + "UnloadCargo START:")
	; unregister for OnContainerChanged - doesn't matter when unloading cargo
	UnregisterForRemoteEvent(CargoCollection, "OnContainerChanged")

	ObjectReference PlayerShipRef = PlayerShip.GetRef()
	MissionBoardCargoContainerScript cargoContainerRef = GetCargoContainer()
	debug.trace(self + " CargoCollection.GetCount()=" + CargoCollection.GetCount())
	debug.trace(self + " PlayerShip.GetItemCount(" + cargoContainerRef.CargoMiscObject + ")=" + PlayerShipRef.GetItemCount(cargoContainerRef.CargoMiscObject))
	; unload cargo
	int i = CargoCollection.GetCount() - 1
	while i > -1
		ObjectReference cargoRef = CargoCollection.GetAt(i)
		debug.trace(self + "   UnloadCargo: i=" + i + ": removing cargo " + cargoRef + " from player ship " + PlayerShipRef)
		PlayerShipRef.RemoveItem(cargoRef)
		debug.trace(self + "      PlayerShipRef.GetItemCount()=" + PlayerShipRef.GetItemCount(cargoContainerRef.CargoMiscObject))
		i += -1
	EndWhile
	debug.trace(self + " After unloading cargo:")
	debug.trace(self + "   CargoCollection.GetCount()=" + CargoCollection.GetCount())
	debug.trace(self + "   PlayerShip.GetItemCount(" + cargoContainerRef.CargoMiscObject + ")=" + PlayerShipRef.GetItemCount(cargoContainerRef.CargoMiscObject))
	debug.trace(self + "UnloadCargo END")
EndFunction

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

Event SQ_ParentScript.SQ_ContrabandConfiscated(SQ_ParentScript akSource, Var[] akArgs)
    debug.trace(self + " SQ_ContrabandConfiscated")
	MissionFailed()
EndEvent

function testShipCargoSpace()
	ObjectReference PlayerShipRef = PlayerShip.GetRef()
	TestWeightInContainer(PlayerShipRef)
endFunction

function TestWeightInContainer(ObjectReference testRef)
	SpaceshipReference ShipRef = testRef as SpaceshipReference
	if ShipRef
		float shipcarryweight = ShipRef.GetWeightInContainer()
		float shipweight = testRef.GetWeightInContainer()
		debug.trace(self + " CarryWeight=" + shipcarryweight + " GetWeightInContainer=" + shipweight)
	else
		debug.trace(self + " TestWeightInContainer: Player ship reference not valid.")
	endIf
endFunction

