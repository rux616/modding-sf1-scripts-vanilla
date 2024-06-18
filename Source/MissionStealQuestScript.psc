Scriptname MissionStealQuestScript extends MissionQuestScript conditional

group StealMissionData
	ReferenceAlias property TargetContainer auto const Mandatory
	{ alias where cargo items will be placed }
	
    RefCollectionAlias property StealItemCollection auto const Mandatory
	{ alias holding cargo items }

    LocationAlias property ReturnLocation auto const Mandatory
    { location where items need to be delivered to }

    int property StealItemsStage = 50 auto Const
    { stage set when player steals the target items }

	int property CargoItemCountMin = 1 auto Const
	{ cargo items will be randomized between min and max }

	int property CargoItemCountMax = 10 auto Const
	{ cargo items will be randomized between min and max }

	int property CargoItems = 5 auto hidden
	{ Number of cargo items created for this mission - set in GetActualReward() }

    Keyword property LocTypeStarStation auto const mandatory
    { for checking for docking }

	Keyword property LocTypeStarstationExterior auto const mandatory
	{ keyword to check if you've docked with a starstation }

	GlobalVariable property MissionBoardCargoValueMult auto const mandatory
	{ multiplier on cargo value reward }
EndGroup

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

; OVERRIDE parent function
int Function GetActualReward()
	MissionBoardCargoContainerScript cargoContainerRef = PrimaryRef.GetRef() as MissionBoardCargoContainerScript

	float rewardBase = RewardAmountGlobal.GetValue()
	debug.trace(self + "GetActualReward: rewardBase=" + rewardBase)

	; get real weight
	float cargoWeightBase = cargoContainerRef.CargoMiscObject.GetWeight()
	float cargoWeight = cargoWeightBase * cargoItems
	debug.trace(self + "GetActualReward: CargoItems=" + CargoItems + " total cargoWeight=" + cargoWeight)

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


; move this out of OnQuestStarted so it doesn't block quest from starting up
Function InitializeCargo()
	debug.trace(self + "InitializeCargo")
	MissionBoardCargoContainerScript cargoContainerRef = PrimaryRef.GetRef() as MissionBoardCargoContainerScript
    ObjectReference targetContainerRef = TargetContainer.GetRef()

    ; if so, create cargo
    debug.trace(self + " InitializeCargo: cargo type marker=" + cargoContainerRef + " ")
    if cargoContainerRef && targetContainerRef
        ; randomize cargo amount
        CargoItems = Utility.RandomInt(CargoItemCountMin, CargoItemCountMax)
        debug.trace(self + "InitializeCargo: CargoItems=" + CargoItems + " CargoMiscObject=" + cargoContainerRef.CargoMiscObject)
        targetContainerRef.AddAliasedItem(cargoContainerRef.CargoMiscObject, StealItemCollection, CargoItems)
        Parent.OnQuestStarted()
    else
        ; something went wrong
        debug.trace(self + " InitializeCargo: FAILED - invalid data - cargoContainerRef=" + cargoContainerRef + " targetContainerRef=" + targetContainerRef)
        Stop()
    endif
endFunction

; override parent function
Function HandlePlayerShipLanding()
    debug.trace(self + "HandlePlayerShipLanding")
	CheckForCargoUnloading()
endFunction

Function HandlePlayerShipDocking(SpaceshipReference akParent)
    debug.trace(self + "HandlePlayerShipDocking")
	CheckForCargoUnloading()
endFunction

Function CheckForCargoUnloading()
    if GetStageDone(StealItemsStage)
        ; get current ship location
        Location currentShipLocation = PlayerShip.GetShipRef().GetCurrentLocation()

        debug.trace(self + "CheckForCargoUnloading currentShipLocation=" + currentShipLocation + " ReturnLocation=" + ReturnLocation.GetLocation())
        ; if you land in the return location, we consider the cargo delivered
	    if PlayerAcceptedQuest && PlayerFailedQuest == False && ( currentShipLocation.IsSameLocation(ReturnLocation.GetLocation()) || currentShipLocation.IsSameLocation(ReturnLocation.GetLocation(), LocTypeStarStation)  || currentShipLocation.IsSameLocation(ReturnLocation.GetLocation(), LocTypeStarstationExterior) )
            MissionComplete()
        endif
    endif
EndFunction

Function MissionComplete()
	ObjectReference PlayerShipRef = PlayerShip.GetRef()
    Actor playerRef = Game.GetPlayer()
	; unload cargo
	int i = StealItemCollection.GetCount() - 1
	while i > -1
		ObjectReference cargoRef = StealItemCollection.GetAt(i)
		debug.trace(self + " MissionComplete: removing cargo " + cargoRef + " from player ship " + PlayerShipRef)
		StealItemCollection.RemoveRef(cargoRef)
        ; try to remove from both possible places
		PlayerShipRef.RemoveItem(cargoRef)
        playerRef.RemoveItem(cargoRef)
		i += -1
	EndWhile
	Parent.MissionComplete()
endFunction

Function MissionFailed()
	RemoveCargo()
	Parent.MissionFailed()
EndFunction

Function RemoveCargo()
	; clear cargo from player ship and/or target ship
	int i = StealItemCollection.GetCount() - 1
	while i > -1
		ObjectReference cargoRef = StealItemCollection.GetAt(i)
		ObjectReference cargoContainerRef = cargoRef.GetContainer()
		debug.trace(self + " RemoveCargo: removing cargo " + cargoRef + " from " + cargoContainerRef)
		StealItemCollection.RemoveRef(cargoRef)
		cargoContainerRef.RemoveItem(cargoRef)
		i += -1
	EndWhile
EndFunction
