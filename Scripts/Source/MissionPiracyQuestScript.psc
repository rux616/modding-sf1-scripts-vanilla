Scriptname MissionPiracyQuestScript extends MissionCargoParentScript conditional

group PiracyMissionData
	SQ_ParentScript property SQ_Parent auto const Mandatory

	ReferenceAlias property CargoTargetRef auto const Mandatory
	{ alias holding cargo marker ref - used for text replacement and getting cargo data }

	RefCollectionAlias property CargoCollection auto const Mandatory
	{ alias holding cargo items }

	int property CargoWeightMultMin = 3 auto Const
	{ cargo items will be randomized between min and max }

	int property CargoWeightMultMax = 20 auto Const
	{ cargo items will be randomized between min and max }

	int property CargoItems = 5 auto hidden
	{ Number of cargo items created for this mission - set in GetActualReward() }

	Message property MissionBoardPiracyWarningAcceptMessage auto const Mandatory
	{ if you don't have space on your ship for this cargo }

	int property PlayerHasPiratedStage = 35 auto
	{ if this stage is done, the player has pirated/attacked the target ship }

	int property PlayerHasCargoStage = 40 auto
	{ if this stage is done, the player has the cargo }

	Keyword property ObjectTypeMissionCargo auto const mandatory
	{ keyword for what to watch for being removed from target ship }

	GlobalVariable property MissionBoardPiracy_EscortChance auto const mandatory
	{ percent chance that escorts appear on this mission }

    RefCollectionAlias property Escorts auto const
    { optional - holds escorts to randomly enable }

	GlobalVariable property MissionBoardCargoValueMult auto const mandatory
	{ multiplier on cargo value reward }
EndGroup

; OVERRIDE parent function
Function HandleOnMissionAccepted()
	debug.trace(self + " HandleOnMissionAccepted")

	SpaceshipReference PlayerShipRef = PlayerShip.GetShipRef()
	if PlayerShipRef
		; check if it has cargo space
		MissionBoardCargoContainerScript cargoContainerRef = GetCargoContainer()

		; if so, load cargo and accept mission
		debug.trace(self + " HandleOnMissionAccepted: cargo type marker=" + CargoTargetRef.GetRef() + " ")
		if cargoContainerRef
			UpdatePlayerCargoSpace()
			if hasCargoSpace == false
				; use "contraband warning" accept message
				if MissionBoardPiracyWarningAcceptMessage.Show() == 0
					MissionAccepted(true)
				else
					MissionAccepted(false)
				endif
			else
				; use standard accept message
				Parent.HandleOnMissionAccepted()
			endif
		else
			; something went wrong
			debug.trace(self + " MissionAccepted: FAILED - invalid cargo ref marker")
		endif
	Else
		debug.trace(self + " MissionAccepted: FAILED - no player ship")
	EndIf
endFunction

Function MissionAccepted(bool bAccepted)
	debug.trace(self + " MissionAccepted")
    Parent.MissionAccepted(bAccepted)

    if bAccepted
        ; move cargo to target ship
        SpaceshipReference cargoShipRef = PrimaryRef.GetShipRef()

        int i = 0
        while i < CargoCollection.GetCount()
            ObjectReference cargoRef = CargoCollection.GetAt(i)
            cargoShipRef.AddItem(cargoRef)
            i += 1
        EndWhile
		cargoShipRef.RemoveItem(GetCargoContainer())
		; register for item removed events
    	RegisterForRemoteEvent(PrimaryRef, "OnItemRemoved")
		AddInventoryEventFilter(ObjectTypeMissionCargo)

        ; register for piracy events
        RegisterForCustomEvent(SQ_Parent, "SQ_PiracyEvent")

		; register for home ship changing (in case player steals target ship)
		Actor PlayerREF = Game.GetPlayer()
		RegisterForRemoteEvent(PlayerREF, "OnHomeShipSet")

        ; enable escorts randomly, if any
		if Game.GetDieRollSuccess(MissionBoardPiracy_EscortChance.GetValueInt())
			if Escorts && Escorts.GetCount() > 0
				debug.trace(self + " rolling for number of escorts: 1 to " + Escorts.GetCount())
				int numToEnable = Utility.RandomInt(1, Escorts.GetCount())
				debug.trace(self + " enabling " + numToEnable + " escorts")
				if numToEnable > 0
					i = 0
					while i < numToEnable
						SpaceshipReference escortRef = Escorts.GetShipAt(i)
						if escortRef
							escortRef.Enable()
						endif
						i += 1
					EndWhile
				EndIf
			endif
		endif
    endif
endFunction

; override parent function
Function HandlePlayerShipLanding()
	debug.trace(self + " HandlePlayerShipLanding")
	CheckForCargoUnloading()
endFunction

Function HandlePlayerShipDocking(SpaceshipReference akParent)
	debug.trace(self + " HandlePlayerShipDocking")
	CheckForCargoUnloading()
endFunction

Function CheckForCargoUnloading()
	; get current ship location
	Location currentShipLocation = PlayerShip.GetShipRef().GetCurrentLocation()

	debug.trace(self + "CheckForCargoUnloading currentShipLocation=" + currentShipLocation + " targetLocation=" + TargetPlanetLocation.GetLocation())
	; if you land in the target location, we consider the cargo delivered
	if PlayerAcceptedQuest && PlayerFailedQuest == False && GetStageDone(PlayerHasCargoStage) && ( currentShipLocation.IsSameLocation(targetLocation.GetLocation()) || currentShipLocation.IsSameLocation(targetLocation.GetLocation(), LocTypeStarStation)  || currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), LocTypeStarstationExterior) )
		MissionComplete()
	endif
EndFunction

Function MissionComplete()
	ObjectReference PlayerShipRef = PlayerShip.GetRef()
	; unload cargo
	RemoveCargo()
	Parent.MissionComplete()
endFunction

Function MissionFailed()
	RemoveCargo()
	Parent.MissionFailed()
EndFunction

Function RemoveCargo()
	; clear cargo from player ship and/or target ship
	int i = CargoCollection.GetCount() - 1
	while i > -1
		ObjectReference cargoRef = CargoCollection.GetAt(i)
		ObjectReference cargoContainerRef = cargoRef.GetContainer()
		debug.trace(self + " RemoveCargo: removing cargo " + cargoRef + " from " + cargoContainerRef)
		CargoCollection.RemoveRef(cargoRef)
		cargoContainerRef.RemoveItem(cargoRef)
		i += -1
	EndWhile
EndFunction

; OVERRIDE function from MissionCargoParentScript - used for UpdatePlayerCargoSpace()
MissionBoardCargoContainerScript Function GetCargoContainer()
	return CargoTargetRef.GetRef() as MissionBoardCargoContainerScript
endFunction

; OVERRIDE parent function
int Function GetActualReward()
	MissionBoardCargoContainerScript cargoContainerRef = GetCargoContainer()
    SpaceshipReference cargoShipRef = PrimaryRef.GetShipRef()

	float rewardBase = RewardAmountGlobal.GetValue()
	debug.trace(self + "GetActualReward: rewardBase=" + rewardBase)

	; get real weight
	float cargoWeightBase = cargoContainerRef.CargoMiscObject.GetWeight()
	; randomize cargo amount
	CargoItems = Utility.RandomInt(CargoWeightMultMin, CargoWeightMultMax)
	float cargoWeight = cargoWeightBase * cargoItems
	debug.trace(self + "GetActualReward: cargoWeightBase=" + cargoWeightBase + ", CargoItems=" + CargoItems + ", total cargo weight=" + cargoWeight)

	; if player's ship can't hold max amount, try to randomize within player's capacity
	SpaceshipReference PlayerShipRef = PlayerShip.GetShipRef()
	if PlayerShipRef
		float cargoSpaceMax = PlayerShipRef.GetValue(MissionParent.CarryWeight) - PlayerShipRef.GetWeightInContainer()
		debug.trace(self + "GetActualReward: player's max cargo space=" + cargoSpaceMax)
		if cargoSpaceMax < cargoWeight
			int minWeight = CargoWeightMultMin*cargoWeightBase as int
			debug.trace(self + "GetActualReward: minWeight=" + minWeight)
			; reroll within player cargo limits (or min count)
			int maxCount = (cargoSpaceMax/cargoWeightBase) as int
			maxCount = Math.Max(maxCount, CargoWeightMultMin) as int
			debug.trace(self + "GetActualReward: rerolling cargo count from " + CargoWeightMultMin + " to " + maxCount)
			CargoItems = Utility.Randomint(CargoWeightMultMin, maxCount)
		EndIf
	endif

	cargoWeight = cargoWeightBase*CargoItems
	debug.trace(self + "GetActualReward: CargoItems=" + CargoItems + " total cargoWeight=" + cargoWeight)

	; create the cargo items in the target ship
	InitializeCargo()

	MissionIntValue01.SetValue(cargoWeight as int)

	; set real reward
	float cargoValue = cargoContainerRef.CargoMiscObject.GetGoldValue()*CargoItems
	float valueMult = MissionBoardCargoValueMult.GetValue()
	float cargoValueReward = cargoValue*valueMult
	debug.trace(self + "GetActualReward: cargoValue=" + cargoValue + ", valueMult=" + valueMult + " cargoValueReward=" + cargoValueReward)

	float reward = rewardBase + cargoValueReward
	debug.trace(self + "GetActualReward=" + reward)
	UpdateCurrentInstanceGlobal(MissionIntValue01)
	return reward as int
endFunction

; create cargo in the target ship
Function InitializeCargo()
	debug.trace(self + "InitializeCargo")
	MissionBoardCargoContainerScript cargoContainerRef = GetCargoContainer()
    SpaceshipReference cargoShipRef = PrimaryRef.GetShipRef()

    ; if so, create cargo
    debug.trace(self + " InitializeCargo: cargo type marker=" + cargoContainerRef + " ")
    if cargoContainerRef && cargoShipRef
        debug.trace(self + "InitializeCargo: CargoItems=" + CargoItems + " CargoMiscObject=" + cargoContainerRef.CargoMiscObject)
        cargoShipRef.AddAliasedItem(cargoContainerRef.CargoMiscObject, CargoCollection, CargoItems)
    else
        ; something went wrong
        debug.trace(self + " InitializeCargo: FAILED - invalid data - cargoContainerRef=" + cargoContainerRef + " cargoShipRef=" + cargoShipRef)
        Stop()
    endif
endFunction

Event ReferenceAlias.OnItemRemoved(ReferenceAlias akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
	; if nothing is left, set the stage
	if akSender == PrimaryRef
	    SpaceshipReference cargoShipRef = PrimaryRef.GetShipRef()
		if cargoShipRef.GetItemCount(ObjectTypeMissionCargo) == 0
			SetStage(PlayerHasCargoStage)
	        RemoveAllInventoryEventFilters()
		endif
	endif
EndEvent

Event SQ_ParentScript.SQ_PiracyEvent(SQ_ParentScript akSource, Var[] akArgs)
    SpaceshipReference piratedShip = akArgs[0] as SpaceshipReference
    SpaceshipReference targetShip = PrimaryRef.GetShipRef()

    debug.trace(self + " SQ_PiracyEvent boardedShip=" + piratedShip)
    if piratedShip == targetShip && PlayerFailedQuest == False
		; this is target ship - set "pirated/attacke" stage
		SetStage(PlayerHasPiratedStage)
    endif
EndEvent

Event Actor.OnHomeShipSet(Actor akSource, SpaceshipReference akShip, SpaceshipReference akPrevious)
	debug.trace(self + " OnHomeShipSet akShip=" + akShip + " akprevious=" + akPrevious)
    SpaceshipReference targetShip = PrimaryRef.GetShipRef()
	if akShip == targetShip
		; player has taken over target ship, this counts as getting all the cargo
		SetStage(PlayerHasCargoStage)
		RemoveAllInventoryEventFilters()
	endif
endEvent
