Scriptname DefaultPassengerQuestScript extends Quest Default
{Manages handling passengers getting on and off your ship at a destination, and setting quest stages dealing with passengers and delivery.

IMPORTANT: If you want to have you actors continue to walk to the destination marker after they leave the ship,
you need to put DefaultPassengerPackage on the alias you hook up to Alias_Passengers property.

Call these functions to make aliases into passengers (which also adds them to this script's Alias_Passengers RefCollectionAlias)
*AddPassenger(Alias_To_Make_A_Passenger)
*AddPassengers(RefCollectionAlias_To_Make_Passengers)

You shouldn't need to do this, but if you find a reason you need to manually remove an actor from being a passenger:
*RemovePassengerActor(Actor_To_Stop_Being_Passenger)

}

Guard PassengerGuard

Group AutofillProperties
	SQ_PlayerShipScript Property SQ_Playership Mandatory Const Auto
	Keyword Property LinkPassengerShipMarker Mandatory Const Auto ;link established via linked aliases in SQ_PlayerShip
	Keyword Property LinkPassengerDestinationMarker Mandatory Const Auto ;link established in this script
	ActorValue Property DefaultPassengerState Mandatory Const Auto
	GlobalVariable Property DefaultPassengerState_0_WalkToShipThenSandbox Mandatory Const Auto
	GlobalVariable Property DefaultPassengerState_1_RunToShipThenSandbox Mandatory Const Auto
	GlobalVariable Property DefaultPassengerState_2_WalkToDestination Mandatory Const Auto
	GlobalVariable Property DefaultPassengerState_3_RunToDestination Mandatory Const Auto

EndGroup

Group Aliases
	RefCollectionAlias Property Alias_Passengers Mandatory Const Auto RequiresGuard(PassengerGuard) 
	{The references in this alias should be managed by this script. Use AddPassenger() and AddPassengers() to add refs to this alias.}
	LocationAlias Property Alias_PassengerDestination Mandatory Const Auto
	{Location alias that represents the destination you are delivering the passenger to.}
	ReferenceAlias Property Alias_PassengerDestinationMarker Mandatory Const Auto
	{A marker for where you want the passengers to walk to when they disembark at the destination.}
EndGroup

Group Stages
	int Property StageToSetOnPlayerShipArrivesAtDestination Mandatory Const Auto
	{will set this stage when player's ship arrives at Alias_PassengerDestination }

	int Property StageToSetWhenAllPassengersDisembark Mandatory Const Auto
	{will set this stage when all the Passengers exit the ship after it arrives at Alias_PassengerDestination}

	float Property ArrivalDistance = 5.0 Const Auto
	{how close to the Arrival Marker do Passengers need to be to be considered to have arrived?}

EndGroup

Group Default_Passenger_Behavior_REMEMBER_Add_DefaultPassengerAlias_to_Passengers_Alias
{IMPORTANT: If you want to have you actors continue to walk to the destination marker after they leave the ship,
you need to put DefaultPassengerPackage on the alias you hook up to Alias_Passengers property.}
	bool Property RunToShip = true Const Auto
	{(Default: false) If true, passengers will run instead of walk to get to the player ship.}
	bool Property RunToDestination = false Const Auto
	{(Default: false) If true, passengers will run instead of walk to get to the destination upon arrival.}
EndGroup

Group Debug_Properties
    Bool Property ShowTraces = false Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}

	string Property CustomLog = "" Const Auto
	{*Default: "") If not empy, will trace to this log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup




Event OnQuestInit()
	RegisterForRemoteEvent(Alias_PassengerDestinationMarker, "OnAliasChanged")
	
	LockGuard PassengerGuard
		RegisterForRemoteEvent(Alias_Passengers, "OnAliasChanged")
		RegisterForRemoteEvent(Alias_Passengers, "OnDeath")
		RegisterForRemoteEvent(Alias_Passengers, "OnUnload")
		RegisterForRemoteEvent(Alias_Passengers, "OnExitShipInterior")
	EndLockGuard
	
	RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip, "OnShipLanding")
	RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip, "OnShipTakeoff")
	RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip, "OnShipDock")
	RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip, "OnShipUndock")
EndEvent


Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, bool abRemove)
	debug.trace(self + " OnAliasChanged " + akSender)
	;if the destination has changed, update links - this is to support objectives like "take passenger to nearest destination"
	;Note: the reason I'm not using aliases to create the links, is because I have no script way of enforcing that has been done without checking them manually anyway, so might as well just create/remove them (which is also simpler for end user)
	if akSender == Alias_PassengerDestinationMarker
		if abRemove
			DefaultScriptFunctions.Trace(self, "OnAliasChanged() Alias_PassengerDestinationMarker is cleared, calling _UpdatePassengerDestinationLinks()", ShowTraces, CustomLog)
			_UpdatePassengerDestinationLinks(None)
		else
			DefaultScriptFunctions.Trace(self, "OnAliasChanged() Alias_PassengerDestinationMarker changed, calling _UpdatePassengerDestinationLinks()", ShowTraces, CustomLog)
			_UpdatePassengerDestinationLinks(Alias_PassengerDestinationMarker.GetReference())
		endif
	endif
EndEvent

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, bool abRemove)
	LockGuard PassengerGuard
		;if an actor is removed or added, un/register for distance checks update the links.
		;Note: the reason I'm not using aliases to create the links, is because I have no script way of enforcing that has been done without checking them manually anyway, so might as well just create/remove them (which is also simpler for end user)
		if akSender == Alias_Passengers

			ObjectReference destinationMarkerRef = Alias_PassengerDestinationMarker.GetReference()

			if abRemove
				DefaultScriptFunctions.Trace(self, "OnAliasChanged() UnregisterForDistanceEvents() and unsetting LinkPassengerDestinationMarker for akObject: " + akObject + " linking to destinationMarkerRef: " + destinationMarkerRef, ShowTraces, CustomLog)
				UnregisterForDistanceEvents(akObject, destinationMarkerRef)
				akObject.SetLinkedRef(NONE, LinkPassengerDestinationMarker)
				
			else
				DefaultScriptFunctions.Trace(self, "OnAliasChanged() RegisterForDistanceLessThanEvent() and setting LinkPassengerDestinationMarker for akObject: " + akObject + " linking to destinationMarkerRef: " + destinationMarkerRef, ShowTraces, CustomLog)
				RegisterForDistanceLessThanEvent(akObject, destinationMarkerRef, ArrivalDistance)
				akObject.SetLinkedRef(destinationMarkerRef, LinkPassengerDestinationMarker)

			endif
		endif
	EndLockGuard
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akKiller)
	LockGuard PassengerGuard
		DefaultScriptFunctions.Trace(self, "OnDeath() akSender: " + akSender + ", akSenderRef: " + akSenderRef + ", akKiller: " + akKiller, ShowTraces, CustomLog)
		if akSender == Alias_Passengers
			RemovePassengerActor(akSenderRef as Actor)
		endif
	EndLockGuard
EndEvent

Event RefCollectionAlias.OnUnload(RefCollectionAlias akSender, ObjectReference akSenderRef)
	LockGuard PassengerGuard
		DefaultScriptFunctions.Trace(self, "OnUnload() akSender: " + akSender + ", akSenderRef: " + akSenderRef, ShowTraces, CustomLog)

		if akSender == Alias_Passengers && GetStageDone(StageToSetOnPlayerShipArrivesAtDestination)
			DefaultScriptFunctions.Trace(self, "OnUnload() StageToSetOnPlayerShipArrivesAtDestination done, calling _HandlePassengerArrival() akSenderRef: " + akSenderRef, ShowTraces, CustomLog)
			_HandlePassengerArrival(akSenderRef)
		endif
	EndLockGuard
EndEvent

Event RefCollectionAlias.OnExitShipInterior(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akShip)
	LockGuard PassengerGuard
		DefaultScriptFunctions.Trace(self, "OnExitShipInterior() akSender: " + akSender + ", akSenderRef: " + akSenderRef, ShowTraces, CustomLog)

		if akSender == Alias_Passengers && GetStageDone(StageToSetOnPlayerShipArrivesAtDestination)
			DefaultScriptFunctions.Trace(self, "OnExitShipInterior() StageToSetOnPlayerShipArrivesAtDestination done, calling _HandlePassengerArrival() akSenderRef: " + akSenderRef, ShowTraces, CustomLog)
			_HandlePassengerArrival(akSenderRef)
		endif
	EndLockGuard
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	LockGuard PassengerGuard
		ObjectReference passengerRef

		if Alias_Passengers.find(akObj1) > -1
			passengerRef = akObj1
		elseif Alias_Passengers.find(akObj2) > -1
			passengerRef = akObj2
		endif

		if passengerRef
			DefaultScriptFunctions.Trace(self, "OnDistanceLessThan() passenger arrived at marker. passengerRef: " + passengerRef, ShowTraces, CustomLog)
			_HandlePassengerArrival(passengerRef)
		else
			DefaultScriptFunctions.Warning(self, "OnDistanceLessThan() could not find a passenger in Alias_Passengers that matches akObj1: " + akObj1 + ", or akObj2: " + akObj2, CustomLog)
		endIf
	EndLockGuard
EndEvent

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSender, bool abComplete)
	DefaultScriptFunctions.Trace(self, "OnShipLanding() akSender: " + akSender + ", abComplete: " + abComplete, ShowTraces, CustomLog)
	ShipArriving(akSender, abComplete)
EndEvent

Event ReferenceAlias.OnShipTakeOff(ReferenceAlias akSender, bool abComplete)
	DefaultScriptFunctions.Trace(self, "OnShipTakeOff() akSender: " + akSender + ", abComplete: " + abComplete, ShowTraces, CustomLog)
	ShipDeparting(akSender, abComplete)
EndEvent

Event ReferenceAlias.OnShipDock(ReferenceAlias akSender, bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
	DefaultScriptFunctions.Trace(self, "OnShipDock() akSender: " + akSender +", abComplete: " + abComplete + "OnShipDock() akDocking: " + akDocking + ", akParent: " + akParent, ShowTraces, CustomLog)
	ShipArriving(akSender, abComplete)
EndEvent

Event ReferenceAlias.OnShipUndock(ReferenceAlias akSender, bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
	DefaultScriptFunctions.Trace(self, "OnShipUndock() akSender: " + akSender +", abComplete: " + abComplete + "OnShipDock() akDocking: " + akDocking + ", akParent: " + akParent, ShowTraces, CustomLog)
	ShipDeparting(akSender, abComplete)
EndEvent



Function ShipArriving(ReferenceAlias akSender, bool abComplete)
	DefaultScriptFunctions.Trace(self, "ShipArriving() akSender: " + akSender + ", abComplete: " + abComplete, ShowTraces, CustomLog)
	LockGuard PassengerGuard
		ObjectReference shipRef = akSender.GetShipReference()

		;DEBUGGING
		DefaultScriptFunctions.Trace(self, "OnShipLanding() shipRef.GetCurrentLocation(): " + shipRef.GetCurrentLocation(), ShowTraces, CustomLog)
		DefaultScriptFunctions.Trace(self, "OnShipLanding() Alias_PassengerDestination.GetLocation(): " + Alias_PassengerDestination.GetLocation(), ShowTraces, CustomLog)
		DefaultScriptFunctions.Trace(self, "OnShipLanding() shipRef.IsInLocation(Alias_PassengerDestination.GetLocation()): " + shipRef.IsInLocation(Alias_PassengerDestination.GetLocation()), ShowTraces, CustomLog)
		DefaultScriptFunctions.Trace(self, "OnShipLanding() HavePassengers(): " + HavePassengers(), ShowTraces, CustomLog)

		if abComplete && shipRef.IsInLocation(Alias_PassengerDestination.GetLocation()) && HavePassengers()
			if GetStageDone(StageToSetOnPlayerShipArrivesAtDestination) == false
				DefaultScriptFunctions.Trace(self, "OnShipLanding() Arrived at destination!", ShowTraces, CustomLog)
				SetStage(StageToSetOnPlayerShipArrivesAtDestination)

				SetAllPassengersGoToDestination()

				;remove from SQ_PlayerShip passengers alias (and restore the passengers actorvalue, etc.)
				SQ_Playership.RemovePassengers(Alias_Passengers)

				;NOTE: we don't remove from this quest's Alias_Passsengers yet - they need to keep running the package to go to destination marker
			endif
		endif
	EndLockGuard
EndFunction

Function ShipDeparting(ReferenceAlias akSender, bool abComplete)
	LockGuard PassengerGuard
		DefaultScriptFunctions.Trace(self, "ShipDeparting() akSender: " + akSender + ", abComplete: " + abComplete, ShowTraces, CustomLog)

		if GetStageDone(StageToSetOnPlayerShipArrivesAtDestination) && Alias_Passengers.GetCount() > 0
			;they've arrived at the destination, and are on the player's ship when it takes off
			;which means the player has to taken off while they are still aboard 
			;moveto them to the destination marker
			;rationale: then we don't have to handle "partial deliveries"
			MoveAllPassengersToLinkedRef(LinkPassengerDestinationMarker, ArrivalDistance)

		else ;make sure they are all on the ship
			float notOnShipDistance = 1000.0 ;effectively infinitely away since the marker is on the ship and actors are infinitely away from refs in different cells
			MoveAllPassengersToLinkedRef(LinkPassengerShipMarker, notOnShipDistance)
		EndIf
	EndLockGuard
EndFunction

bool Function HavePassengers()
	LockGuard PassengerGuard
		bool returnVal = Alias_Passengers && Alias_Passengers.GetCount() > 0

		DefaultScriptFunctions.Trace(self, "HavePassengers() returnVal: " + returnVal, ShowTraces, CustomLog)
		return returnVal
	EndLockGuard
EndFunction

Function MoveAllPassengersToLinkedRef(Keyword linkedRefKeyword, float MoveIfDistanceGreaterThan = 0.0)
	LockGuard PassengerGuard
		DefaultScriptFunctions.Trace(self, "MoveAllPassengersToLinkedRef() linkedRefKeyword: " + linkedRefKeyword + ", MoveIfDistanceGreaterThan: " + MoveIfDistanceGreaterThan, ShowTraces, CustomLog)
		
		Actor[] passengers = Alias_Passengers.GetActorArray()

		int i = 0
		While (i < passengers.length)
			Actor currentPassenger = passengers[i]
			ObjectReference linkedRef = currentPassenger.GetLinkedRef(linkedRefKeyword)
			if currentPassenger.GetDistance(linkedRef) > MoveIfDistanceGreaterThan
				currentPassenger.MoveTo(currentPassenger.GetLinkedRef(linkedRefKeyword))
			endif
			i += 1
		EndWhile
	EndLockGuard
EndFunction


Function _HandlePassengerArrival(ObjectReference arrivingPassenger)
	LockGuard PassengerGuard
		DefaultScriptFunctions.Trace(self, "_HandlePassengerArrival() arrivingPassenger: " + arrivingPassenger, ShowTraces, CustomLog)
		RemovePassengerActor(arrivingPassenger as Actor)

		;ihas everyone arrived?
		int passengerCount = Alias_Passengers.GetCount()
		if  passengerCount == 0
			DefaultScriptFunctions.Trace(self, "_HandlePassengerArrival() no more actors in Alias_Passengers collection. Setting StageToSetWhenAllPassengersDisembark: " + StageToSetWhenAllPassengersDisembark, ShowTraces, CustomLog)
			SetStage(StageToSetWhenAllPassengersDisembark)
		else
			DefaultScriptFunctions.Trace(self, "_HandlePassengerArrival() remaining actors in Alias_Passengers collection. passengerCount: " + passengerCount, ShowTraces, CustomLog)
		endif
	EndLockGuard
EndFunction

Function _UpdatePassengerDestinationLinks(ObjectReference DestinationMarker)
	LockGuard PassengerGuard
		DefaultScriptFunctions.Trace(self, "_UpdatePassengerDestinationLinks() DestinationMarker: " + DestinationMarker, ShowTraces, CustomLog)

		ObjectReference[]  passengerRefs = Alias_Passengers.GetArray()

		int i = 0
		While (i < passengerRefs.length)
			ObjectReference currentRef = passengerRefs[i]
			currentRef.SetLinkedRef(DestinationMarker, LinkPassengerDestinationMarker)		
			i += 1
		EndWhile
	EndLockGuard
EndFunction

Function AddPassenger(ReferenceAlias PassengerToAdd)
	DefaultScriptFunctions.Trace(self, "AddPassenger() PassengerToAdd: " + PassengerToAdd, ShowTraces, CustomLog)
	_AddPassengers(PassengerToAdd.GetReference().GetSingleRefArray() as Actor[])
EndFunction

Function AddPassengers(RefCollectionAlias PassengersToAdd)
	DefaultScriptFunctions.Trace(self, "AddPassengers() PassengersToAdd: " + PassengersToAdd, ShowTraces, CustomLog)
	_AddPassengers(PassengersToAdd.GetActorArray())
EndFunction

Function _AddPassengers(Actor[] passengersToAdd)
	LockGuard PassengerGuard
		int i = 0
		While (i < passengersToAdd.length)
			Actor currentActor = passengersToAdd[i]
			
			if currentActor.IsDead() == false
				SQ_Playership.AddPassenger(currentActor)
				Alias_Passengers.AddRef(currentActor)
			endif

			i += 1
		EndWhile

		SetAllPassengersGoToShip()
	EndLockGuard
EndFunction

Function RemovePassengerActor(Actor ActorToRemove)
	LockGuard PassengerGuard
		DefaultScriptFunctions.Trace(self, "RemovePassengerActor() ActorToRemove: " + ActorToRemove, ShowTraces, CustomLog)
		SQ_Playership.RemovePassenger(ActorToRemove)
		Alias_Passengers.RemoveRef(ActorToRemove)
	EndLockGuard
EndFunction


Function SetAllPassengersGoToShip()
	if RunToShip
		_SetAllPassengersAV(DefaultPassengerState_1_RunToShipThenSandbox)
	else
		_SetAllPassengersAV(DefaultPassengerState_0_WalkToShipThenSandbox)
	endif
EndFunction

Function SetAllPassengersGoToDestination()
	if RunToDestination
		_SetAllPassengersAV(DefaultPassengerState_3_RunToDestination)
	else
		_SetAllPassengersAV(DefaultPassengerState_2_WalkToDestination)
	endif
EndFunction

Function _SetAllPassengersAV(GlobalVariable GlobalWithValue)
	LockGuard PassengerGuard
		ActorValue AV = DefaultPassengerState
		DefaultScriptFunctions.Trace(self, "_SetAllPassengersAV() AV : " + AV + ", GlobalWithValue: " + GlobalWithValue + ".GetValue(): " + GlobalWithValue.GetValue(), ShowTraces, CustomLog)

		Actor[] passengers = Alias_Passengers.GetActorArray()
		DefaultScriptFunctions.Trace(self, "_SetAllPassengersAV() passengers : " + passengers, ShowTraces, CustomLog)

		int i = 0
		While (i < passengers.length)
			Actor currentActor = passengers[i]
			currentActor.SetValue(AV, GlobalWithValue.GetValue())
			currentActor.EvaluatePackage()
			i += 1
		EndWhile
	EndLockGuard
EndFunction
