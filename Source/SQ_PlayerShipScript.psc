Scriptname SQ_PlayerShipScript extends Quest

ReferenceAlias Property Vasco Auto Mandatory Const
LocationAlias Property VascoWaitLocation Mandatory Const Auto
{autofill; used to get Vasco to wait for player outside hatch at space stations, etc.}
ReferenceAlias Property VascoWaitMarker Mandatory Const Auto
{autofill; used to get Vasco to wait for player outside hatch at space stations, etc.}
LocationRefType Property Crew_VascoWaitRefType Mandatory Const Auto
{autofill; used to get Vasco to wait for player outside hatch at space stations, etc.}

Faction Property CurrentFollowerFaction Mandatory Const Auto
{autofill}

Faction Property CurrentCrewFaction Mandatory Const Auto
{autofill}

Faction Property PlayerFaction Auto Const Mandatory

SQ_ParentScript property SQ_Parent auto mandatory Const
SQ_FollowersScript Property SQ_Followers Mandatory Const Auto


ReferenceAlias Property HomeShip Auto Mandatory Const
{ alias holding player home ship - usually this is the same as PlayerShip but not always }

LocationAlias Property HomeShipExteriorLocation Mandatory Const Auto
{ locAlias holding the player home ship exterior }

LocationAlias Property HomeShipInteriorLocation Mandatory Const Auto
{ locAlias holding the player home ship interior }

ReferenceAlias Property HomeShipArmillary Mandatory Const Auto
{ alias holding potential armillary object on the player's home ship exterior }

ReferenceAlias Property HomeShipArmillaryScreen Mandatory Const Auto
{ alias holding armillary screen activator on the player's home ship interior }

ReferenceAlias Property HomeShipArmillaryScreenTrigger Mandatory Const Auto
{ alias holding armillary screen activator trigger that the player will actually activate }

GlobalVariable Property MQAlllowArmillaryGravDrive Mandatory Const Auto

ReferenceAlias Property PreviousHomeShip Auto Mandatory Const
{ alias holding previous home ship - used for text replacement in home ship message }

RefCollectionAlias Property PlayerShips Auto Mandatory Const
{ collection of all player ships }

ReferenceAlias Property HomeShipMarker Auto Mandatory Const
{ TEMP - for now, link all home ships to this marker so they know how to "go home"
  this needs to move into UI at some point and/or we need a way to "stack" ships in a single location
  `TTP-29740: Ships: figure out how multiple player ships can exist at a single location`
   }

RefCollectionAlias Property BoardingCrew Auto Mandatory Const
{ put crew in this collection to pick up "defensive" packages }

RefCollectionAlias Property PlayerShipDockingPortDoors Auto Mandatory Const
{ put docking port doors in this collection }

Group DismissedCrewData
	RefCollectionAlias Property DismissedCrew Auto Mandatory Const
	{ collection of dismissed crew who are on board - crew is removed from this alias when they manage to leave the ship }

	RefCollectionAlias Property DisembarkingCrew Auto Mandatory Const
	{ collection of crew trying to disembark - gives a package to a landing exit marker }

	LocationAlias property LandingLocation auto mandatory Const
	{ filled by script to test for a valid exit marker (for dismissed crew) }

	ReferenceAlias Property LandingLocationExitMarker Auto Mandatory Const
	{ used for dismissed crew to exit }

	Keyword Property SQ_LinkCompanionEliteCrewHomeMarker Mandatory Const Auto
	{ used for dismissed elite crew to go home if it's somewhere other than their editor location}
EndGroup

Group PlayerShipAliases
	ReferenceAlias Property PlayerShip Auto Mandatory
	{ alias holding current player ship - for other quests to access }

	LocationAlias Property playerShipExteriorLocation auto mandatory Const
	LocationAlias Property playerShipInteriorLocation auto mandatory Const
	ReferenceAlias Property PlayerShipCockpitModule Auto Mandatory
	ReferenceAlias Property InteriorRobotBay Auto Mandatory Const
	ReferenceAlias Property LandingDeckNearRampMarker Auto Mandatory Const
	ReferenceAlias Property LandingDeckNearRobotBay Auto Mandatory Const
	ReferenceAlias Property PlayerShipPilotSeat Auto Mandatory Const
	ReferenceAlias Property HomeShipCrewMarker Auto Mandatory
	ReferenceAlias Property HomeShipPassengerMarker Auto Mandatory
	ReferenceAlias Property PlayerShipSpaceshipInventory Auto Const Mandatory
	ReferenceAlias Property PlayerShipWorkshop auto const mandatory
	ReferenceAlias Property PlayerShipLandingMarker Auto Mandatory
	
EndGroup

Group keywords
	Keyword Property LandingMarkerKeyword Auto Mandatory Const
	{ used to find landing marker }

	Keyword Property LandingZoneTriggerKeyword Auto Mandatory Const
	{ used to find landing zone trigger }

	Keyword Property SQ_LinkPlayerShipGoHome Auto mandatory const
	{ link player ships so they know where to go when sent "home" }

	Keyword Property SpaceshipStoredLink Auto mandatory const
	{ link non-home ships to landing marker }

	Keyword property BEEncounterTypeDocking Auto Const Mandatory
	{ Keyword used to start Boarding Encounters when the player's ship docks with any other ship. }

	Keyword property SQ_PlayerShipDialogueEvent auto const mandatory
	{ keyword used to start random conversations on the player's ship }

	Keyword property SQ_PlayerShipTakeoffEvent auto const mandatory
	{ keyword sent to story manager when player's ship takes off }

	Keyword property CannotBeHomeShip auto const mandatory
	{ keyword to check before making home ship }

	Keyword Property LinkShipLandingOverlayMapMarker Auto Mandatory Const
	{ used to find map marker in ship landing overlay }

    Keyword property SpaceshipLinkedInterior Auto Const Mandatory
	{ used to get ship interior cell }

	Keyword property SpaceshipPreventRampOpenOnLanding auto const mandatory
	{ keyword that prevents landing ramp from opening on landing - need to remove in case ship was previously tagged with this }

	Keyword property IsStarstation auto const mandatory
	{ keyword to check before making home ship }

	Keyword property SpaceshipImmobile auto const mandatory
	{ keyword to check before making home ship }


EndGroup

Group DebugUseOnly
	ActorValue Property SpaceshipLandedValue Mandatory Const Auto
	{ DO NOT SET THIS IN NON DEBUG SITUATIONS...
Used by UI to know that a ship has landed. This needs to be set before you can assign crew to ship. BUt currently the player has to be in the laoded area of the ship to get that set. }

	Keyword Property CurrentInteractionLinkedRefKeyword Mandatory Const Auto
	{ keyword used to move player's ship when debugging a forced move}

	ObjectReference Property Frontier_ModularREF Mandatory Const Auto
	{autofill}

	ObjectReference Property NewGameShipMarkerREF Mandatory Const Auto
	{autofill}

	ObjectReference Property NewAtlantisShipLandingMarker Mandatory Const Auto
	{autofill}

	ActorBase Property MissionBoardPassenger_Type06 Mandatory Const Auto
	{autofill}

EndGroup

Int Property Tutorial_NewHomeShip_Stage=10 Const Auto
{ tutorial stage for when you get a new home ship}

Message Property SQ_PlayerShip_NewHomeShipMessage Mandatory Const Auto
{ message when player switches home ship }

Message Property SQ_PlayerShip_NewHomeShipMessageNoReturn Mandatory Const Auto
{ message when player switches home ship, but previous home ship is still player ship }

LocationRefType Property Ship_PilotSeat_RefType auto mandatory Const
{ used to check if player sits in a pilot seat }

ActorValue Property SpaceshipDockingPermission auto mandatory const
{ used to check the ship docking with me }

SQ_CrewScript Property SQ_Crew auto mandatory Const

REParentScript Property RE_Parent auto mandatory Const
{ send RE cleanup events }

GlobalVariable Property MQ101VascoQuestFollower Mandatory Const Auto
{ Special MQ101 handling for Vasco}

ReferenceAlias Property MQ00_Armillary Mandatory Const Auto
{ Special MQ Alias to hold the Armillary }

GlobalVariable Property MQArmillaryLocation Mandatory Const Auto
{ special Global to check where the Armillary is. 1 = on HomeShip, 0 = on player, 2 = at Outpost}

ActorValue Property FOL_ActiveFollower Mandatory Const Auto
{ track if crew member has been dismissed }

ActorValue Property COM_PQ_LockedIn Mandatory Const Auto
{ track if crew member is Locked In }

Group PassengerData
	ActorValue property SpaceshipPassengerSlots auto const Mandatory
	{ tracks how mamy passengers allowed on player ship }

	RefCollectionAlias property Passengers auto const Mandatory
	{ collection holding passengers }
endGroup

Group SerpentsEmbraceProperties
	perk Property TRAIT_SerpentsEmbrace Mandatory Const Auto
	{autofill}

	Spell Property Trait_SerpentsEmbrace_Buff Mandatory Const Auto
	{autofill}
EndGroup

Group AchivementsData
	int property ModifyShipAchievement = 26 auto Const
	{ achievement for collecting ships }

	int property CollectShipsAchievement = 41 auto Const
	{ achievement for collecting ships }

	int property CollectShipsAchievementCount = 10 auto Const
	{ number of ships to own to get achievement}
endGroup

int iDialogueEventTimerID = 1 Const
float property fDialogueEventTimeSecondsMin = 120.0 auto const
{ how often is the scripted "dialogue event" sent while the player is on the ship }
float property fDialogueEventTimeSecondsMax = 240.0 auto const
{ how often is the scripted "dialogue event" sent while the player is on the ship }

; custom events
CustomEvent SQ_PlayerShipChanged  ; this event is sent whenever the player ship changes
CustomEvent SQ_PlayerSellShip  ; this event is sent whenever the player sells one of their ships

function SendPlayerShipChangedEvent(SpaceshipReference newPlayerShip)
	Trace(self, "SendPlayerShipChangedEvent " + newPlayerShip)
	; Send the player ship changed event
	Var[] kargs = new Var[1]
	kargs[0] = newPlayerShip
	SendCustomEvent("SQ_PlayerShipChanged", kargs)
endFunction

function SendPlayerSellShipEvent(SpaceshipReference akShip)
	Trace(self, "SendPlayerSellShipEvent " + akShip)
	; Send the player sell ship event
	Var[] kargs = new Var[1]
	kargs[0] = akShip
	SendCustomEvent("SQ_PlayerSellShip", kargs)
endFunction

; GUARDS:
Guard playerShipsChangeLock ProtectsFunctionLogic   ; guards changes to player ships and/or home ship
Guard CrewAssignmentLock ProtectsFunctionLogic   

Function LoadCrewInterior()
	; get crew list, make sure everyone's on board
	SpaceshipReference homeShipRef = HomeShip.GetShipRef()
	ObjectReference crewMarker = HomeShipCrewMarker.GetRef()
	ObjectReference passengerMarker = HomeShipPassengerMarker.GetRef()
	Actor VascoREF = Vasco.GetActorRef()
	Trace(self, "LoadCrewInterior homeship=" + homeShipRef + " crewmarker=" + crewMarker + " passengerMarker=" + passengerMarker)

	; special handling for Vasco
	LoadVascoInterior()

	if homeShipRef
		if crewMarker

			Actor[] crewList = homeShipRef.GetAllCrewMembers()
			Trace(self, "crewList with GetAllCrewMembers() " + crewList)
			
			if crewList == None
				crewList = new Actor[0]
			endif

			;include any dismissed crew that aren't disembarking yet (this can happen when Elite Crew and Companions are unassigned outside the ship)
			Actor[] dismissedCrewList = DismissedCrew.GetActorArray()
			Trace(self, "dismissedCrewList: " + dismissedCrewList)
			int i = 0
			While (i < dismissedCrewList.length)
				Actor currentDismissedActor = dismissedCrewList[i]

				bool notDisembarking = DisembarkingCrew.Find(currentDismissedActor) < 0

				if notDisembarking
					Trace(self, "currentDismissedActor adding to crewList because notDisembarking: " + notDisembarking)
					crewList.add(currentDismissedActor)
				endif
				i += 1
			EndWhile

			Trace(self, "crewList after adding dismissedCrewList: " + crewList)

			i = 0
			while i < crewList.Length
				Actor crew = crewList[i]
				if crew != VascoREF ; special handling for Vasco earlier
					Trace(self, "CheckingShouldMove Actor=" + crew + " IsInLocation=" + crew.IsInLocation(playerShipInteriorLocation.GetLocation()))
					
					; if crew is locked in but dismissed for special scene, do not teleport
					if crew.GetValue(COM_PQ_LockedIn) == 1 && crew.GetValue(FOL_ActiveFollower) == 0
					
					; if crew isn't on board, move them
					elseif crew.IsInLocation(playerShipInteriorLocation.GetLocation()) == false 
						
						;fix for GEN-537187 Companions: Crew: Followers assigned to the ship will warp away after fast traveling - ignore active followers
						if crew.GetValue(FOL_ActiveFollower) ;assume code correctly updates actively following actors regardless of fast traveling or not
							;crew member is following the player, so code will move them to the player and we don't want them back on the ship if the player isn't there
							Trace(self, " NOT moving " + crew + " because they are actively following the player.")
						else
							Trace(self, " moving " + crew + " to " + homeShipRef)
							crew.MoveTo(crewMarker)
						endif
					endif
				endif
				i += 1
			EndWhile
		EndIf

		if passengerMarker
			; make sure passengers are on board
			int i = 0
			while i < Passengers.GetCount()
				ObjectReference theRef = Passengers.GetAt(i)
				
				;fix for GEN-537187 Companions: Crew: Followers assigned to the ship will warp away after fast traveling - ignore active followers
				;we discovered a case of quest follower who was a passenger and actively following the player while testing the fix above for crew
				if theRef.GetValue(FOL_ActiveFollower) ;assume code correctly updates actively following actors
					;crew member is following the player, so code will move them to the player and we don't want them back on the ship if the player isn't there
					Trace(self, " NOT moving " + theRef + " because they are actively following the player.")

				; don't move disabled passengers or passengers already onboard
				elseif theRef.IsDisabled() || theRef.IsInLocation(playerShipInteriorLocation.GetLocation())

				Else
					Trace(self, " moving " + theRef + " to " + homeShipRef)
					theRef.MoveTo(passengerMarker)
				endif
				i += 1
			endWhile
		endif
	endif
EndFunction

Function LoadVascoExterior()
	Trace(self, "LoadVascoExterior")

	Actor VascoREF = Vasco.GetActorRef()
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()

	if VascoRef.IsInFaction(CurrentFollowerFaction) || playerShipRef.IsCrew(VascoRef) || (MQ101VascoQuestFollower.GetValueInt() == 1)
		;if player is in a location we want to move vasco do that
		ObjectReference movetoRef
		Actor playerRef = Game.GetPlayer()
		Location currentLoc = playerRef.GetCurrentLocation()
		if currentLoc.HasRefType(Crew_VascoWaitRefType)
			VascoWaitLocation.ForceLocationTo(currentLoc)
			VascoWaitMarker.RefillAlias()
			movetoRef = VascoWaitMarker.GetReference()
		else
			;move Vasco to the xmarker near the landing ramp but not if the marker is in space
			moveToRef = LandingDeckNearRobotBay.GetRef()
			if (moveToRef.IsInSpace())
     			moveToRef = None
			endif

			;if there is no marker to move vasco to and he is the active companion, move him to the player instead if the player is not in space
			if !moveToRef && !playerRef.IsInSpace() && (VascoRef.IsInFaction(CurrentFollowerFaction) || MQ101VascoQuestFollower.GetValueInt() == 1)
				moveToRef = playerRef
			endif
		endif

		if movetoRef
			Trace(self, "LoadVascoExterior() movetoRef: " + movetoRef)
			VascoREF.moveto(movetoRef)
			Trace(self, "LoadVascoExterior() Vasco location after move: " + VascoRef.GetCurrentLocation())
			VascoREF.EvaluatePackage()
			Trace(self, "LoadVascoExterior() Vasco location after EVP: " + VascoRef.GetCurrentLocation())
		Else
			Warning(self, "LoadVascoExterior() didn't move Vasco: movetoRef: " + moveToRef + " moveToRef.IsInSpace()=" + movetoRef.IsInSpace())
		endif

	endif
EndFunction

Function LoadVascoInterior()
	Trace(self, "LoadVascoInterior")
	; only if Vasco is crew OR active companion OR Special MQ101 Handling state
	Actor VascoREF = Vasco.GetActorRef()
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	Trace(self, "LoadVascoInterior playerShipRef.IsCrew(VascoRef)=" + playerShipRef.IsCrew(VascoRef) + " SQ_Crew.IsActiveEliteCrew(VascoRef)="+SQ_Crew.IsActiveEliteCrew(VascoRef))
	if playerShipRef.IsCrew(VascoRef) || SQ_Crew.IsActiveEliteCrew(VascoRef) || (MQ101VascoQuestFollower.GetValueInt() == 1)
		ObjectReference RobotBayREF = InteriorRobotBay.GetRef()
		Trace(self, "LoadVascoInterior: RobotBayRef=" + RobotBayREF + " Location=" + playerShipInteriorLocation)
		if RobotBayREF && playerShipInteriorLocation != None
			; if Vasco isn't on board, move him
			Trace(self, "LoadVascoInterior: IsInLocation=" + VascoREF.IsInLocation(playerShipInteriorLocation.GetLocation()))
			if Game.GetPlayer().IsInLocation(playerShipInteriorLocation.GetLocation()) && (VascoREF.IsInLocation(playerShipInteriorLocation.GetLocation()) == false || !VascoREF.IsDisabled())
				;shove Vasco into the interior robot bay furniture
				Trace(self, "LoadVascoInterior() BEFORE MoveToFurniture VascoRef GetCurrentPackage(): " + VascoRef.GetCurrentPackage())
				VascoREF.MoveToFurniture(RobotBayREF)
				Trace(self, "LoadVascoInterior() BEFORE EVP VascoRef GetCurrentPackage(): " + VascoRef.GetCurrentPackage())
				VascoREF.EvaluatePackage()
				Trace(self, "LoadVascoInterior() AFTER EVP VascoRef GetCurrentPackage(): " + VascoRef.GetCurrentPackage())
			endif
		endif
	endif
EndFunction

; call this whenever player ship changes
Function ResetPlayerShip(SpaceshipReference newPlayerShip)
	LockGuard playerShipsChangeLock

		Trace(self, "ResetPlayerShip " + newPlayerShip)
		PlayerShip.ForceRefTo(newPlayerShip)
		;Make sure the exterior load door is accessible.
		newPlayerShip.SetExteriorLoadDoorInaccessible(False)

		playerShipExteriorLocation.ClearAndRefillAlias()
		playerShipInteriorLocation.ClearAndRefillAlias()
		playerShipExteriorLocation.RefillDependentAliases()
		playerShipInteriorLocation.RefillDependentAliases()
		PlayerShipSpaceshipInventory.GetRef().Unlock()

		;update Armillary references if Homeship was modified
		If newPlayerShip == HomeShip.GetShipRef()
			; refill home ship aliases
			RefillHomeShipAliases()
		EndIf

		; Place Vasco inside the new player ship and make sure he remains unseen
		LoadVascoInterior()

		; send player ship changed event
		SendPlayerShipChangedEvent(newPlayerShip)

		; if ship is in space, and we are still holding onto a landing marker, enable it and clear
		if PlayerShipLandingMarker.GetRef() && newPlayerShip.IsInSpace()
			HandleShipTakeOff(bResetHomeShip = false)
		endif
	EndLockGuard
EndFunction

Function RefillHomeShipAliases() RequiresGuard(playerShipsChangeLock) 
	; refill home ship aliases
	HomeShipPassengerMarker.Clear() ; special case since it is filled by other aliases, code doesn't count it as a dependent alias
									; remove when this is fixed: GEN-503070
	;refill homeship aliases
	HomeShipExteriorLocation.ClearAndRefillAlias()
	HomeShipInteriorLocation.ClearAndRefillAlias()
	HomeShipExteriorLocation.RefillDependentAliases()
	HomeShipInteriorLocation.RefillDependentAliases()
	ResetHomeShipArmillary()
EndFunction

Function ResetHomeShip(SpaceshipReference newHomeShip)
	Trace(self, "ResetHomeShip newHomeShip=" + newHomeShip)
	; if no player ship, call that first
	if PlayerShip.GetRef() == None
		ResetPlayerShip(newHomeShip)
	endif
	SpaceshipReference oldHomeShip = HomeShip.GetShipRef()
	if newHomeShip != oldHomeShip && newHomeShip.HasKeyword(CannotBeHomeShip) == false && newHomeShip.HasKeyword(IsStarstation) == false && newHomeShip.HasKeyword(SpaceshipImmobile) == false
		Game.TrySetPlayerHomeSpaceShip(newHomeShip)
		; NOTE: event handles everything else
	endif

	;check if the Armillary screen needs to be enabled
	EnableHomeShipArmillaryScreen()
endFunction

Function EnableHomeShipArmillaryScreen()
	;enable the Armillary Screen if at that point in the MQ
	ObjectReference ArmillaryScreenTriggerREF = HomeShipArmillaryScreenTrigger.GetRef()
	If (MQAlllowArmillaryGravDrive.GetValueInt() >= 1) && (ArmillaryScreenTriggerREF.IsDisabled())
		ArmillaryScreenTriggerREF.Enable()
	EndIf

	;turn on the Armillary screen if the armillary is on the ship
	If MQArmillaryLocation.GetValueInt() == 1
		HomeShipArmillaryScreen.GetRef().PlayAnimation("Play01")
	EndIf
EndFunction

Function ResetHomeShipArmillary()
	;Armillary handling, check if the Armillary was on our previous ship or on a ship whose refs have changed because it was modified

	ObjectReference ArmillaryREF = MQ00_Armillary.GetRef()
	ObjectReference HomeShipArmillaryREF = HomeShipArmillary.GetRef()
	Actor PlayerREF = Game.GetPlayer()
	Bool bArmillaryOnHomeShip = False

	If (MQArmillaryLocation.GetValueInt() == 1) && (HomeShipArmillaryREF != ArmillaryREF)	;armillary is on the Home Ship AND the Armillary Ref has changed
		(ArmillaryREF as ArmillaryScript).PackupArmillary(PlayerREF) ;remove the old Armillary from the previous ship
		(HomeShipArmillaryREF as ArmillaryScript).BuildArmillary(PlayerREF, HomeShipArmillaryScreenTrigger.GetRef()) ;build the new armillary with the new ship refs
	EndIf
EndFunction

Event OnQuestInit()
	Trace(self, "OnQuestInit")
	Actor PlayerREF = Game.GetPlayer()
	RegisterForRemoteEvent(PlayerREF, "OnHomeShipSet")
	RegisterForRemoteEvent(PlayerREF, "OnPlayerModifiedShip")
	RegisterForRemoteEvent(PlayerREF, "OnExitShipInterior")
	RegisterForRemoteEvent(PlayerREF, "OnEnterShipInterior")
	RegisterForRemoteEvent(PlayerREF, "OnSit")
	RegisterForRemoteEvent(PlayerREF, "OnPlayerBuyShip")
	RegisterForRemoteEvent(PlayerREF, "OnPlayerSellShip")

	RegisterForRemoteEvent(PlayerShip, "OnShipLanding")
	RegisterForRemoteEvent(PlayerShip, "OnShipTakeOff")
	RegisterForRemoteEvent(PlayerShip, "OnShipDock")
	RegisterForRemoteEvent(PlayerShip, "OnShipUndock")
	RegisterForRemoteEvent(PlayerShip, "OnShipGravJump")
	RegisterForRemoteEvent(PlayerShip, "OnShipFarTravel")
	RegisterForRemoteEvent(PlayerShip, "OnShipScan")
	RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
	RegisterForRemoteEvent(PlayerShips, "OnCrewDismissed")
	RegisterForRemoteEvent(PlayerShips, "OnCrewAssigned")
	RegisterForRemoteEvent(PlayerShips, "OnDeath")

	; watch for non-home ship events
	RegisterForRemoteEvent(PlayerShips, "OnLocationChange")

	;Make sure our SpaceshipInventory is unlocked.
	ObjectReference playerShipInventoryRef = PlayerShipSpaceshipInventory.GetRef()
	if (playerShipInventoryRef != None)
		playerShipInventoryRef.Unlock()
	EndIf
EndEvent

Event Actor.OnPlayerBuyShip(Actor akSender, SpaceshipReference akShip)
	Trace(self, "OnPlayerBuyShip akShip=" + akShip)
	; add new ship to ref collection
	LockGuard playerShipsChangeLock
		Playerships.AddRef(akShip)
		CheckForShipAchievements()		
	endLockGuard
EndEvent

Event Actor.OnPlayerSellShip(Actor akSenderRef, SpaceshipReference akShip)
	Trace(self, "OnPlayerSellShip akSenderRef=" + akSenderRef + " akShip=" + akShip)
	; remove from player ship list
	RemovePlayerShip(akShip)
	SendPlayerSellShipEvent(akShip)
endEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akKiller)
	SpaceshipReference akShip = akSenderRef as SpaceshipReference
	if akShip
		Trace(self, "OnDeath akSenderRef=" + akSenderRef + " akShip=" + akShip)
		; remove from player ship list
		RemovePlayerShip(akShip)
	endif
endEvent

function RemovePlayerShip(SpaceshipReference akShip)
	; remove from player ship list
	LockGuard playerShipsChangeLock
		if PlayerShips.Find(akShip) > -1
			; don't do this if this is the player's home ship
			if HomeShip.GetRef() != akShip
				Playerships.RemoveRef(akShip)
				Game.RemovePlayerOwnedShip(akShip)
			else
				Warning(self, "RemovePlayerShip akShip=" + akShip + " - trying to remove player's home ship. Ship will NOT be removed from PlayerShips collection.")
			endif
		endif
	endLockGuard
EndFunction

; Replace with event when GEN-527399 is done
function AddPlayerOwnedShip(SpaceshipReference akShip)
	LockGuard playerShipsChangeLock
		Game.AddPlayerOwnedShip(akShip)
		Playerships.AddRef(akShip)
	EndLockGuard
EndFunction

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
	Trace(self, "OnSit " + akSender + " in " + akFurniture)
	;whenever the player sits in the pilot seat, set this ship to be the current ship
	If akFurniture.HasRefType(Ship_PilotSeat_RefType)
		SpaceshipReference newShip = Game.GetPlayer().GetCurrentShipRef()
		if HomeShip.GetRef() == None
			; if I don't have a home ship, make this the home ship
			ResetHomeShip(newShip)
		else
			ResetPlayerShip(newShip)
		endif
	EndIf
EndEvent

Event Actor.OnEnterShipInterior(Actor akSender, ObjectReference akShip)
	Trace(self, "OnEnterShipInterior " + akShip)
	
	if akShip == Game.GetPlayerHomeSpaceShip()
		; set this as the current player ship (in case player boarded a different ship in the meantime)
		ResetPlayerShip(Game.GetPlayer().GetCurrentShipRef())
		; make sure crew is on board
		LoadCrewInterior()
		; start random dialogue timer
		StartDialogueTimer()
		;check if the Armillary screen needs to be enabled
		EnableHomeShipArmillaryScreen()
	endif
EndEvent

Event Actor.OnExitShipInterior(Actor akSender, ObjectReference akShip)
	Trace(self, "OnExitShipInterior " + akShip)
	LoadVascoExterior()
EndEvent

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSender, bool abComplete)
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	Trace(self, "OnShipLanding " + akSender + " playerShipRef=" + playerShipRef + " abComplete=" + abComplete)
	
	if !abComplete
		;We need the landing marker Alias for Camera animation reasons.
		If playerShipRef != None ;only fire the camera scene if the player is piloting the ship
			; if this landing marker has a landing zone trigger, tell it we're coming in
			ClearLandingZone(playerShipRef)
		EndIf
	Else
		; NOTE: we are only guaranteed to get abComplete=true event (the "false" event can be skipped)
		ObjectReference landingMarker = playerShipRef.GetLinkedRef(LandingMarkerKeyword)
		; do we have an "old" landing marker? If so, means player fast traveled and we didn't get OnShipTakeoff event
		ObjectReference oldLandingMarker = PlayerShipLandingMarker.GetRef()
		if oldLandingMarker && oldLandingMarker != landingMarker
			;this means the player fast traveled and skipped OnShipTakeoff event
			Trace(self, "  found oldLandingMarker=" + oldLandingMarker + ": player fast traveled and skipped OnShipTakeoff")
			SQ_Followers.TeleportWaitingFollowersToShip() ;make sure we collect any waiting followers since that script is only watching for changing location into the ship
			HandleShipTakeOff(bFastTraveledToSurface = true) ; since this never happened
		endif
		; now replace with the new landing marker
		PlayerShipLandingMarker.ForceRefTo(landingMarker)

		; set this to the player home ship
		ResetHomeShip(playerShipRef)

		; can dismissed crew disembark?
		CheckForDismissedCrew()

		; check for planet survey update
		SQ_Parent.CheckCompletePlanetSurvey(playerShipRef.GetCurrentPlanet())
	endif
EndEvent

Event ReferenceAlias.OnShipTakeoff(ReferenceAlias akSender, bool abComplete)
	Trace(self, "OnShipTakeoff() akSender: " + akSender + ", abComplete: " + abComplete)
	
	if !abComplete
    	HandleShipTakeOff()
  	endIf
EndEvent


;The Boarding Encounter script event expects:
; - akRef1: Player's ship (for docking events only).
; - akRef2: Enemy ship.
; - aiValue1: CrewSizePercent multiplier. For docking events, this is always 100%.

Event ReferenceAlias.OnShipDock(ReferenceAlias akSource, bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
	Trace(self, "OnShipDock akdocking=" + akDocking + " akparent=" + akParent + " abcomplete=" + abComplete)
	if abComplete
		;Gets Spaceship Ref of Player's current ship
		;Checks if ship player is docking to is a starstation, if yes reset homeship
		SpaceshipReference currentShipRef = Game.GetPlayer().GetCurrentShipRef()
		SpaceshipReference otherShipRef = akParent
		if otherShipRef.HasKeyword(IsStarstation)
			ResetHomeShip(currentShipRef)
		endIf
	Else
		; is player's ship the docking ship (initiating docking) or parent ship (ship being docked with)?
		SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
		SpaceshipReference otherShipRef
		if playerShipRef == akDocking
			; player initiated docking
			othershipRef = akParent
		else
			; player is being boarded
			othershipRef = akDocking
		endif
		
		; send boarding encounter event
		BEEncounterTypeDocking.SendStoryEvent(akRef1=akSource.GetRef(), akRef2=othershipRef, aiValue1=100)
		Actor player = Game.GetPlayer()
		; if hostile ship, prepare crew
		Trace(self, "otherShipRef=" + otherShipRef + " factionreaction=" + otherShipRef.GetActorFactionReaction(player))
		if otherShipRef && otherShipRef.GetActorFactionReaction(player) == 1
			; set hostile flag on crew
			Actor[] myCrew = playerShipRef.GetAllCrewMembers()
			BoardingCrew.AddArray(myCrew as ObjectReference[])
		endif
	endif
EndEvent

Event ReferenceAlias.OnShipUndock(ReferenceAlias akSource, bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)
	debug.trace(akUndocking + " OnShipUndock " + akParent)
	if abComplete
		; clear hostile docking flag on crew
		BoardingCrew.RemoveAll()
	endif
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSender, Location aDestination, int aState)
	Trace(self, "OnShipGravJump akSender=" + akSender + ", aDestination=" + aDestination + ", aState=" + aState)
	
	if aState==1
		; set this to the player home ship if the player is on it
		SpaceshipReference currentPlayerShip = Game.GetPlayer().GetCurrentShipRef()
		if currentPlayerShip == akSender.GetShipRef()
			ResetHomeShip(currentPlayerShip)
		endif
	endif

	;debugging...
	Trace(self, "OnShipGravJump() TRAIT_SerpentsEmbrace: " + TRAIT_SerpentsEmbrace + ", Trait_SerpentsEmbrace_Buff: " + Trait_SerpentsEmbrace_Buff)

	Actor playerRef = Game.GetPlayer()
	if aState == 2 && playerRef.HasPerk(TRAIT_SerpentsEmbrace)
		playerRef.DispelSpell(Trait_SerpentsEmbrace_Buff)
		Trait_SerpentsEmbrace_Buff.Cast(playerRef, playerRef)
	endif

	; send RE cleanup event
	RE_Parent.SendCleanupEvent()
endEvent

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSender, Location aDepartureLocation, Location aArrivalLocation, int aState)
	Trace(self, "OnShipFarTravel akSender=" + akSender + ", aDepartureLocation=" + aDepartureLocation + " aArrivalLocation=" + aArrivalLocation)
EndEvent

; Event that is triggered when the player scans a planet with this spaceship
Event ReferenceAlias.OnShipScan(ReferenceAlias akSender, Location aPlanet, ObjectReference[] aMarkersArray)
	Planet planetToCheck = aPlanet.GetCurrentPlanet()
	Trace(self, "OnShipScan aPlanet=" + planetToCheck + " aMarkersArray=" + aMarkersArray)
	SQ_Parent.OnPlayerScanPlanet(planetToCheck)
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
	Trace(self, "OnLocationChange akoldloc=" + akOldLoc + " aknewloc=" + akNewLoc)
	; when player ship changes locations, send cleanup event
	UpdateDismissedCrew()
	
	;make sure the crew that is supposed to be there is there
	LoadCrewInterior()

	RE_Parent.SendCleanupEvent()
endEvent

Event RefCollectionAlias.OnLocationChange(RefCollectionAlias akSource, ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
	Trace(self, "OnLocationChange from " + akSenderRef + " akoldloc=" + akOldLoc + " aknewloc=" + akNewLoc)

	if akSource == PlayerShips && akSenderRef != HomeShip.GetRef()
		; watch for player ships to "go home"
		ObjectReference homeMarkerRef = akSenderRef.GetLinkedRef(SpaceshipStoredLink)
		if homeMarkerRef && homeMarkerRef.GetCurrentLocation() == akNewLoc
			debug.trace(self + " non-home ship " + akSenderRef + " arriving at home marker location " + akNewLoc + " - disable")
			akSenderRef.DisableNoWait()
		endif
	endif
endEvent

Event RefCollectionAlias.OnCrewDismissed(RefCollectionAlias akSource, ObjectReference akSenderRef, Actor akCrew, ObjectReference akPreviousAssignmentRef)
	Trace(self, "OnCrewDismissed akSenderRef=" + akSenderRef + " akCrew=" + akCrew)
	LockGuard CrewAssignmentLock
		if SQ_Crew.HandleOnCrewDismissed(akCrew, akPreviousAssignmentRef)
			DismissedCrew.AddRef(akCrew)
			CheckForDismissedCrew()
		endif
	EndLockGuard
EndEvent

Event RefCollectionAlias.OnCrewAssigned(RefCollectionAlias akSource, ObjectReference akSenderRef, Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
	Trace(self, "OnCrewAssigned akSenderRef=" + akSenderRef + " akCrew=" + akCrew)
	LockGuard CrewAssignmentLock
		SQ_Crew.HandleOnCrewAssigned(akCrew, akSenderRef)
		DismissedCrew.RemoveRef(akCrew) ;in case they were previously dismissed
		DisembarkingCrew.RemoveRef(akCrew) ;in case they were previously disembarking
	EndLockGuard
EndEvent

Event Actor.OnHomeShipSet(Actor akSource, SpaceshipReference akShip, SpaceshipReference akPrevious)
	debug.trace(self + " OnHomeShipSet akShip=" + akShip + " akprevious=" + akPrevious + " akprevious.IsDisabled()=" + akPrevious.IsDisabled())
	LockGuard playerShipsChangeLock

		; no need to do anything unless ships are different
		if akShip != akPrevious
			HomeShip.ForceRefTo(akShip)

			RefillHomeShipAliases()

			; clear forced landing marker on current home ship
			akShip.SetLinkedRef(NONE, SpaceshipStoredLink)

			; add new home ship to ref collection
			Playerships.AddRef(akShip)
			CheckForShipAchievements()
			LoadCrewInterior()

			; clear landing ramp keyword (failsafe)
			akShip.RemoveKeyword(SpaceshipPreventRampOpenOnLanding)

			; if an old home ship existed (and is different from new home ship)
			if akPrevious
				; make ship interior owned by player
	            Cell shipInterior = akShip.GetLinkedCell(SpaceshipLinkedInterior)
                shipInterior.SetFactionOwner(PlayerFaction)
                shipInterior.SetPublic(true) ; anything that is player-accessible should not trigger trespassing

				ObjectReference homeShipMarkerRef = HomeShipMarker.GetRef()
				; link old home ship to "home marker"
				akPrevious.SetLinkedRef(homeShipMarkerRef, SQ_LinkPlayerShipGoHome)
				; link using default keyword to "store" ship at the landing marker if it doesn't already have one
				ObjectReference previousStoredLinkedRef = akPrevious.GetLinkedRef(SpaceshipStoredLink)
				debug.trace(self + " previous home ship stored linked ref: " + previousStoredLinkedRef)
				if previousStoredLinkedRef == NONE
					debug.trace(self + " no stored link for previous home ship - set to " + homeShipMarkerRef)
					akPrevious.SetLinkedRef(homeShipMarkerRef, SpaceshipStoredLink)
				endif
				; add old home ship to alias for text replacement
				PreviousHomeShip.ForceRefTo(akPrevious)
				; if previous ship is player ship, AND player is not on it, make new home ship the player ship
				if akPrevious == PlayerShip.GetRef() && Game.GetPlayer().GetCurrentShipRef() != akPrevious
					debug.trace(self + " player not on previous home ship - set new home ship as the player ship")
					ResetPlayerShip(akShip)
				endif
				; give message for new home ship if previous ship isn't disabled or in space(meaning already on home landing pad)
				debug.trace(self + " akPrevious.IsDisabled() == " + akPrevious.IsDisabled())
				if akPrevious.IsDisabled() == false
					debug.trace(self + " " + akPrevious + " enabled - check for new home ship message")
					if akPrevious == PlayerShip.GetRef()
						; special case - player is still on board previous home ship, so it can't return to home base yet
						debug.trace(self + " player still on board previous home ship - not returning")
						SQ_PlayerShip_NewHomeShipMessageNoReturn.Show()
					elseif akPrevious.IsInSpace() == false
						; previous home ship is not in space (so it will stay put)
						debug.trace(self + " previous home ship not in space - not returning")
						SQ_PlayerShip_NewHomeShipMessageNoReturn.Show()
					else
						debug.trace(self + " previous home ship returning to base")
						SQ_PlayerShip_NewHomeShipMessage.Show()
					endif
				endif

				; move passengers to new home ship
				int i = 0
				while i < Passengers.GetCount()
					ObjectReference theRef = Passengers.GetAt(i)
					; don't move disabled passengers - they've disembarked already
					if theRef.IsDisabled() == false
						theRef.MoveTo(akShip)
						akShip.DamageValue(SpaceshipPassengerSlots, 1)
						akPrevious.RestoreValue(SpaceshipPassengerSlots, 1)
					endif
					i += 1
				endWhile

				;pop tutorial message box (but only once)
				If GetStageDone(Tutorial_NewHomeShip_Stage) == False
					SetStage(Tutorial_NewHomeShip_Stage)
				EndIf
			endif
			; get current list of player owned ships
			SpaceshipReference[] playerOwnedShips = Game.GetPlayerOwnedShips()
			; as failsafe, make sure all are in the ref collection
			int i = 0
			while i < playerOwnedShips.Length
				Trace(self, "playerOwnedShip " + i + ": " + playerOwnedShips[i])
				Playerships.AddRef(playerOwnedShips[i])
				i += 1
			endWhile
			CheckForShipAchievements()
		endif
	EndLockGuard
	debug.trace(self + " OnHomeShipSet akShip=" + akShip + " akprevious=" + akPrevious + " DONE")
EndEvent

Event Actor.OnPlayerModifiedShip(Actor akSource, SpaceshipReference akShip)
	Trace(self, " OnPlayerModifiedShip akShip=" + akShip + " PlayerShip=" + PlayerShip.GetRef() + " HomeShip=" + HomeShip.GetRef())
	; award achievement
	Game.AddAchievement(ModifyShipAchievement)

	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	if (akShip == playerShipRef)
		ResetPlayerShip(akShip)
	else
		; Make sure the exterior load door is accessible.
		akShip.SetExteriorLoadDoorInaccessible(False)
	endif
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == iDialogueEventTimerID
		; only do this if player is still on the ship
		if Game.GetPlayer().GetCurrentShipRef() == HomeShip.GetRef()
			; send dialogue event
			SQ_PlayerShipDialogueEvent.SendStoryEvent()
			; restart timer
			StartDialogueTimer()
		endif
	endif
EndEvent

function StartDialogueTimer()
	; randomize timer
	float fTimerSeconds = Utility.RandomFloat(fDialogueEventTimeSecondsMin, fDialogueEventTimeSecondsMax)
	Trace(self, " StartDialogueTimer " + fTimerSeconds)
	StartTimer(fTimerSeconds, iDialogueEventTimerID)
EndFunction

Function ClearLandingZone(SpaceshipReference landingShip)
	if landingShip
		ObjectReference landingMarker = landingShip.GetLinkedRef(LandingMarkerKeyword)
		Trace(self, "ClearLandingZone: landingShip=" + landingShip + " landingMarker=" + landingMarker)

		if landingMarker
			; if this landing marker has a landing zone trigger, tell it we're coming in
			LandingZoneTriggerScript landingZoneTrigger = landingMarker.GetLinkedRef(LandingZoneTriggerKeyword) as LandingZoneTriggerScript
			Trace(self, "ClearLandingZone: landingZoneTrigger=" + landingZoneTrigger)
			if landingZoneTrigger
				landingZoneTrigger.BeginLanding(landingShip, landingMarker)
			endif
		endif
	endif
EndFunction

Function HandleShipTakeOff(bool bResetHomeShip = true, bool bFastTraveledToSurface = false)
	Trace(self, "HandleShipTakeOff() bResetHomeShip: " + bResetHomeShip + ", bFastTraveledToSurface: " + bFastTraveledToSurface)
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	ObjectReference landingMarker = PlayerShipLandingMarker.GetRef()
	SpaceshipReference currentPlayerShipRef = Game.GetPlayer().GetCurrentShipRef() ; in case different from what we think is the current player ship
	SpaceshipReference playerHomeShip = HomeShip.GetShipRef()

	Trace(self, " HandleShipTakeOff playerShipRef=" + playerShipRef + " landingMarker=" + landingMarker)
	; is the player on board?
	if currentPlayerShipRef == playerShipRef
		; send story event
		SQ_PlayerShipTakeoffEvent.SendStoryEvent(akRef1=playerShipRef, akRef2=landingMarker)
		if bResetHomeShip
			; set this to the player home ship
			ResetHomeShip(playerShipRef)
		endif
		; enable landing overlay map marker if there is one
		EnableLandingMapMarker(landingMarker)
		; clear landing marker alias
		PlayerShipLandingMarker.Clear()
	elseif playerHomeShip != playerShipRef
		Trace(self, " HandleShipTakeOff: player is not on board, and not home ship")
		ResetPlayerShip(NONE)
	endif
EndFunction

Function EnableLandingMapMarker(ObjectReference landingMarkerRef, bool bEnable=true)
	if landingMarkerRef
		ObjectReference landingMapMarkerRef = landingMarkerRef.GetLinkedRef(LinkShipLandingOverlayMapMarker)
		debug.trace(self + " EnableLandingMapMarker: landingMarkerRef=" + landingMarkerRef + " " + bEnable + " landingMapMarkerRef=" + landingMapMarkerRef)
		if landingMapMarkerRef
			if bEnable
				debug.trace(self + " enabling " + landingMapMarkerRef)
				landingMapMarkerRef.Enable()
			Else
				debug.trace(self + " disabling " + landingMapMarkerRef)
				landingMapMarkerRef.Disable()
			EndIf
		endif
	EndIf
EndFunction

; call this function to add a passenger to the player's home ship
Function AddPassenger(Actor newPassenger)
	LockGuard playerShipsChangeLock
		; don't add if already in Passengers collection
		int found = Passengers.Find(newPassenger)
		if found < 0 && newPassenger.IsDead() == false
			Passengers.AddRef(newPassenger)
			ObjectReference HomeShipRef = HomeShip.GetRef()
			HomeShipRef.DamageValue(SpaceshipPassengerSlots, 1)
		endif
	endLockGuard
EndFunction

; convenience function to add a collection of passengers
Function AddPassengers(RefCollectionAlias newPassengers)
	int i = 0
	while i < newPassengers.GetCount()
		AddPassenger(newPassengers.GetActorAt(i))
		i += 1
	endWhile
EndFunction

Function RemovePassenger(Actor removedPassenger)
	LockGuard playerShipsChangeLock
		; make sure actually in Passengers collection
		int found = Passengers.Find(removedPassenger)
		if found > -1
			ObjectReference HomeShipRef = HomeShip.GetRef()
			HomeShipRef.RestoreValue(SpaceshipPassengerSlots, 1)
			Passengers.RemoveRef(removedPassenger)
		endif
	endLockGuard
EndFunction

; convenience function to remove a collection of passengers
Function RemovePassengers(RefCollectionAlias removedPassengers)
	int i = 0
	while i < removedPassengers.GetCount()
		RemovePassenger(removedPassengers.GetActorAt(i))
		i += 1
	endWhile
EndFunction

int Function GetPassengerSlots(bool returnBaseValue = false)
	int slots = 0
	ObjectReference homeShipRef = HomeShip.GetRef()
	if homeShipRef
		if returnBaseValue
			slots = homeShipRef.GetBaseValue(SpaceshipPassengerSlots) as int
		else
			slots = homeShipRef.GetValue(SpaceshipPassengerSlots) as int
		endif
	EndIf
	return slots
EndFunction

; FROM MissionPassengerQuestScript:ActorValue
Function CheckForDismissedCrew()
	; get current ship location
	Location currentShipLocation = PlayerShip.GetShipRef().GetCurrentLocation()
	Trace(self, "CheckForDismissedCrew currentShipLocation=" + currentShipLocation)

	if DismissedCrew.GetCount() > 0

		Trace(self, "CheckForDismissedCrew: dismissed crew still on board, check if they can disembark")
		; see if this planet has an exit marker
		LandingLocation.ForceLocationTo(currentShipLocation)
		LandingLocationExitMarker.RefillAlias()
		Trace(self, "CheckForDismissedCrew: LandingLocationExitMarker=" + LandingLocationExitMarker.GetRef())
		if LandingLocationExitMarker.GetRef()
			DisembarkingCrew.AddRefCollection(DismissedCrew)
		endif
	endif
endFunction

function UpdateDismissedCrew()
	Trace(self, "UpdateDismissedCrew")

	int i = DismissedCrew.GetCount() - 1
	while i > -1
		Actor currentCrewMember = DismissedCrew.GetAt(i) as Actor
		if currentCrewMember
			; if any dismissed crew is not on board, remove from collection
			if currentCrewMember.IsInLocation(playerShipInteriorLocation.GetLocation()) == false
				DismissedCrew.RemoveRef(currentCrewMember)

				;collect generic crew for further processing below
				if currentCrewMember.HasKeyword(SQ_Crew.Crew_CrewTypeGeneric)
					Trace(self, "UpdateDismissedCrew() calling SetRoleUnavailable() for: " + currentCrewMember)
					SQ_Crew.SetRoleUnavailable(currentCrewMember)
				endif

				MoveCrewToHome(currentCrewMember)

				;clean up any generic crew - make sure there aren't aliases or script pointers keeping them persitant, etc.
				SQ_Crew.TestAndHandleUnloadedUnassignedGenericCrew(currentCrewMember)
			endif
		endif
		i -= 1 ; count down
	endWhile

	DisembarkingCrew.RemoveAll()

	;clear the landing exit marker alias so we can check for that being none to handle some packages
	LandingLocationExitMarker.Clear()

endFunction

Function MoveCrewToHome(Actor CrewActor)
	;ignore active followers
	if CrewActor.IsInFaction(CurrentFollowerFaction)
			Trace(self, "MoveCrewToHome() CrewActor: " + CrewActor + " is in CurrentFollowerFaction. BAILING.")
			return
	endif


	ObjectReference homeMarkerRef = CrewActor.GetLinkedRef(SQ_LinkCompanionEliteCrewHomeMarker)

	if homeMarkerRef
		Trace(self, "MoveCrewToHome() CrewActor: " + CrewActor + ", moving to homeMarkerRef: " + homeMarkerRef)
		CrewActor.MoveTo(homeMarkerRef)
	else
		Trace(self, "MoveCrewToHome() CrewActor: " + CrewActor + ", moving to editor location.")
		CrewActor.MoveToMyEditorLocation()
	endif
EndFunction

function CheckForShipAchievements() RequiresGuard(playerShipsChangeLock) 
	; how many player ships?
	int playerShipCount = Playerships.GetCount()
	if playerShipCount >= CollectShipsAchievementCount
		Game.AddAchievement(CollectShipsAchievement)
	endif
EndFunction

; returns true if shipToCheck is either current player ship OR a player-owned ship
bool function IsPlayerShip(SpaceshipReference shipToCheck)
	bool returnVal = false
	if shipToCheck
		SpaceshipReference currentPlayerShip = PlayerShip.GetShipRef()
		if shipToCheck == currentPlayerShip
			returnVal = true
		else
			int findShip = PlayerShips.Find(shipToCheck)
			returnVal = (findShip > -1)
		endif
	endif
	Trace(self, "IsPlayerShip() shipToCheck: " + shipToCheck + "=: " + returnVal)

	return returnVal
endFunction

function TestGetCurrentPlanet(ObjectReference testRef)
	debug.trace(self + " GetCurrentPlanet=" + testRef.GetCurrentPlanet())
EndFunction

function TestDismissedCrew(Actor crew)
	DismissedCrew.AddRef(crew)
endFunction

InputEnableLayer myTestLayer
function TestDisableTakeoff(bool bEnable)
	if myTestLayer == None
		myTestLayer = InputEnableLayer.Create()
	EndIf
	myTestLayer.EnableTakeoff(bEnable)
endFunction

function debugMoveToPlayerShip()
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	if playerShipRef
		Game.GetPlayer().MoveTo(playerShipRef)
	endif
EndFunction

SpaceshipReference Function DebugGetHomeShip()

	SpaceshipReference homeshipRef = HomeShip.GetShipRef()

	;it might be takeing a while for the script to finish setting up the homeship as that happens in OnHomeShipSet
	;so we will spin for a little while waiting for that to have a chance before bailing out
	int waitingFor
	int maxWait = 10
	while homeshipRef == none && waitingFor <= maxWait
		Utility.Wait(1)
		homeshipRef = HomeShip.GetShipRef()
		waitingFor += 1
	endwhile

	if homeshipRef == None
		string warnstring = "HomeShip alias not filled. Make sure player home ship exists before calling this function. (try calling: BAT \"Crew\\Homeship\" first."

		Trace(self, "DebugGetHomeShip() " + warnstring)
		Debug.MessageBox(warnstring)
		return none
	endif

	return homeshipRef
EndFunction

;this appears to break the exit hatch somehow. Causes it to be "inaccessible". Will bug in jira.
Function debugMoveToPlayerShipPilotSeat(bool CallHandleTakeOff = false)
	SpaceshipReference ShipRef = DebugGetHomeShip()
	if shipRef == None
		return
	endif

	Trace(self, "debugMoveToPlayerShipPilotSeat() shipRef: " + shipRef)

	Actor player = Game.GetPlayer()

	InputEnableLayer myEnableLayer = InputEnableLayer.Create()
	myEnableLayer.DisablePlayerControls(abCamSwitch=True)
	player.MoveTo(shipRef)
	if CallHandleTakeOff
		HandleShipTakeOff()
	endif
	PlayerShipPilotSeat.GetRef().Activate(player)
	myEnableLayer.Delete()
EndFunction

SpaceshipReference Function DebugCreateHomeShipInSpace(ObjectReference ReferenceToPutShipAt = None)
	ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

	if ReferenceToPutShipAt == None
		ReferenceToPutShipAt = NewGameShipMarkerREF
	endif

	SpaceshipReference homeshipRef = DebugGetHomeShip()

	homeshipRef.MoveTo(ReferenceToPutShipAt)

	return homeshipRef
EndFunction

SpaceshipReference Function DebugCreateHomeShipLanded(ObjectReference ReferenceToPutShipAt = None)
	ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

	if ReferenceToPutShipAt == None
		ReferenceToPutShipAt = NewAtlantisShipLandingMarker
	endif

	SpaceshipReference homeshipRef = DebugGetHomeShip()

	Trace(self, "DebugCreateHomeShipLanded() homeshipRef: " + homeshipRef)

	debugMovePlayerShip(homeshipRef, ReferenceToPutShipAt)

	return homeshipRef
EndFunction


; initialize player ship if there isn't one yet
function debugInitializeHomeShip(SpaceshipReference frontierRef)
	SpaceshipReference homeShipRef = HomeShip.GetShipRef()
	if homeShipRef == None
		ResetHomeShip(frontierRef)
	endif
endFunction

function debugUpdatePlayerShips()
	SpaceshipReference[] ownedShips = Game.GetPlayerOwnedShips()
	int i = 0
	while i < ownedships.Length
		Playerships.AddRef(ownedShips[i])
		i += 1
	EndWhile
	debug.trace(self + "debugUpdatePlayerShips: PlayerShips=" + PlayerShips)
endFunction

function debugMovePlayerShip(SpaceshipReference frontierRef, ObjectReference ShipLandingMarker)
	SpaceshipReference shipRef = frontierRef
	shipRef.moveto(ShipLandingMarker)
	shipRef.setlinkedref(ShipLandingMarker, CurrentInteractionLinkedRefKeyword )
	shipRef.Enable()
endfunction


Function DebugAddPassengers(int count = 1)
	ObjectReference passengerMarker = HomeShipPassengerMarker.GetRef()
 	int i = 0
	While (i < count)
		Actor passengerRef = passengerMarker.PlaceActorAtMe(MissionBoardPassenger_Type06)
		AddPassenger(passengerRef)
		i += 1
	EndWhile	
EndFunction

;************************************************************************************
;****************************	   		Crew Logging		    *****************************
;************************************************************************************
bool bShowNormalTrace = true
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Crew",  string SubLogName = "SQ_PlayerShipScript", bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Crew",  string SubLogName = "SQ_PlayerShipScript", bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction