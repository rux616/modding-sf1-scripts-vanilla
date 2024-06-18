Scriptname GuardShipQuestScript extends Quest conditional
{script for quests that handle guard ships in settled systems}

Struct PlanetData
	Location PlanetOrbitLocation
	ObjectReference MapMarker01
	ObjectReference MapMarker02
	ObjectReference MapMarker03
	ObjectReference MapMarker04
	ObjectReference MapMarker05
	; etc. as needed - if we have multiple map markers to handle on a single planet
EndStruct

PlanetData[] property SettledPlanets auto const
{ array of planets that have map markers that need to be managed by guard quests }

LocationAlias property PlanetOrbitLocation auto const mandatory
{ location alias of this planet's orbit location }

LocationAlias property PlanetLocation auto const mandatory
{ location alias of where the planet }

LocationAlias property OldLocation auto const mandatory
{ location alias of where the ship is changing location from }

Keyword property LocTypeMajorOrbital auto const mandatory

Keyword property LocTypeSettlement auto const mandatory

Keyword property LocTypeOrbit auto const mandatory

Keyword property LocTypeStarSystem auto const mandatory

LocationRefType property GuardShipRefType auto const mandatory

ReferenceAlias property Playership auto const mandatory
{ player ship alias }

ReferenceAlias property Ship01 auto const mandatory
{ guard ship alias }

ReferenceAlias property Ship02 auto const mandatory
{ guard ship 2 alias }

SQ_ParentScript property SQ_Parent auto const mandatory
{ holds smuggling minigame }

GlobalVariable property SQ_GuardShipsScanStatus auto const mandatory
; -1 = not yet scanned
; 0 = failed
; 1 = passed

Scene property SQ_GuardShipsScene auto const mandatory
{ contraband scanning scene - need to stop it if contraband alarm is sent }

int property ContrabandDetectedStage = 25 auto Const
{ stage to set if contraband is found }

Keyword property Contraband auto const mandatory
{ keyword to watch for dropped contraband }

Keyword property SpaceJettisonContainer auto const mandatory
{ keyword to check for space jettison container }

Struct GuardshipType
	Faction crimeFaction
	SpaceshipBase GuardShipBase
EndStruct

group ReinforcementGroup
	GuardshipType[] property GuardShipReinforcements auto const mandatory
	{ used to create guard ship reinforcements during combat }

	ReferenceAlias[] property ReinforcementSpawnPoints auto Const mandatory
	{ spawn points for reinforcements }

	RefCollectionAlias property Reinforcements auto const mandatory
	{ collection to put reinforcement ships into }

	int property minReinforcements = 1 auto const
	int property maxReinforcements = 3 auto Const

	float property reinforcementDelayMin = 3.0 auto const
	float property reinforcementDelayMax = 15.0 auto const

EndGroup

int reinforcementTimerID = 1
int reinforcementTotal = 0
int reinforcementCurrent = 0

bool droppedContraband = false

bool leftOrbit = false ; set to true if player ship starts far travel or grav jump

bool showingContrabandWarning = false ; set to true when starting to show UI, so quest knows if it needs to clear it on shutdown

Group VSTemp
	Quest property MQ101 auto const
	int property MQ101AllowLandingStage = 1310 auto const
EndGroup

event OnQuestStarted()
	ClearScanStatus()
	StartContrabandDropCheck(true)

	; reset guard ships
	
	; testing if we can reset the cell/ships
	SpaceshipReference ship01Ref = Ship01.GetShipRef()
	if ship01Ref
		debug.trace(self + " ship01Ref=" + ship01Ref)
		if ship01Ref.IsDead()
			debug.trace(self + "    -- dead - resetting")
			ship01Ref.Reset()
		EndIf
		Cell spaceCell = Ship01.GetRef().GetParentCell()
		debug.trace(self + " spaceCell=" + spaceCell)
		; try resetting
		if spaceCell
			spaceCell.Reset()
		endif
	EndIf

	SpaceshipReference ship02Ref = Ship02.GetShipRef()
	debug.trace(self + " ship02Ref=" + ship02Ref)
	if ship02Ref && ship02Ref.IsDead()
		debug.trace(self + "    -- dead - resetting")
		ship02Ref.Reset()
	EndIf

	; verify that OldLocation is not a child of PlanetLocation
	Location thePlanetLocation = PlanetLocation.GetLocation()
	Planet thePlanet = thePlanetLocation.GetCurrentPlanet()
	Location theOldLocation = OldLocation.GetLocation()
	Location thePlanetOrbitLocation = PlanetOrbitLocation.GetLocation()
	Planet theOldLocationPlanet
	if theOldLocation
		theOldLocationPlanet = theOldLocation.GetCurrentPlanet()
	endif

	debug.trace(self + " OnQuestInit: thePlanetLocation=" + thePlanetLocation + " theOldLocation=" + theOldLocation + " thePlanetOrbitLocation=" + thePlanetOrbitLocation)
	debug.trace(self + "    OnQuestInit: " + thePlanetOrbitLocation + ".IsSameLocation(" + theOldLocation + ")=" + thePlanetOrbitLocation.IsSameLocation(theOldLocation, LocTypeOrbit))
	debug.trace(self + "    OnQuestInit: " + theOldLocation + ".HasRefType(GuardShipRefType)=" + theOldLocation.HasRefType(GuardShipRefType))
	debug.trace(self + "    OnQuestInit: thePlanet=" + thePlanet + " theOldLocationPlanet=" + theOldLocationPlanet)

	bool stopQuest = false
	if theOldLocation && thePlanetOrbitLocation.IsSameLocation(theOldLocation, LocTypeOrbit) && theOldLocation.HasRefType(GuardShipRefType)
		; we traveled from a child of the orbit location - see if previous location had guard ships (if so, no need to do this again)
		debug.trace(self + " OnQuestInit: player is moving from another location in the same orbit that also has guard ships - stop quest")
		stopQuest = true	
	elseif theOldLocation && thePlanetLocation && thePlanet == theOldLocationPlanet
		debug.trace(self + " OnQuestInit: player is taking off from surface - stop quest")
		; since we're leaving the quest running now when the player lands, we can always shut down when taking off from surface
		stopQuest = true
	endif

	If ship01Ref.IsDisabled()
		;GEN-530413 - if ship01 has been disabled, then SQ_GuardShipsScene cannot run, so we need to shut down
		stopQuest = true
	EndIf

	if stopQuest
		Stop()
	else
		; check if player is still at this planet
		CheckForShutdown(false)

		Actor playerRef = Game.GetPlayer()
		; register for events
		RegisterForRemoteEvent(playerRef, "OnLocationChange")
		RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
		RegisterForRemoteEvent(PlayerShip, "OnShipFarTravel")
		RegisterForRemoteEvent(PlayerShip, "OnShipGravJump")

		AllowLanding(false)
		ShowContrabandScanWarning(false)
	endif

	RegisterForRemoteEvent(Ship01, "OnDeath")
endEvent

Event OnQuestShutdown()
	debug.trace(self + " OnQuestShutdown")
	ClearScanStatus()
	; hide this if it is still being shown
	HideContrabandScanWarning(abSkipCompletionAnim = true)
EndEvent

bool function IsInAnySettlement(Location locationToCheck, PlanetData thePlanetData)
	bool bInAnySettlement
	if thePlanetData
		bInAnySettlement = IsInSettlement(thePlanetData.MapMarker01, locationToCheck) || IsInSettlement(thePlanetData.MapMarker02, locationToCheck) || IsInSettlement(thePlanetData.MapMarker03, locationToCheck) || IsInSettlement(thePlanetData.MapMarker04, locationToCheck) || IsInSettlement(thePlanetData.MapMarker05, locationToCheck)
	endif
	return bInAnySettlement
EndFunction

bool function IsInSettlement(ObjectReference settlementRef, Location locationToCheck)
	bool returnVal = false
	if settlementRef && locationToCheck
		Location settlementLocation = settlementRef.GetCurrentLocation()
		returnVal = locationToCheck.IsSameLocation(settlementLocation, LocTypeSettlement)
		debug.trace(self + " IsInSettlement: " + locationToCheck + ".IsSameLocation(" + settlementLocation + ")=" + returnVal)
	endif
	return returnVal
EndFunction

PlanetData function GetPlanetData()
	debug.trace(self + "GetPlanetData:")
	PlanetData thePlanetData = NONE
	Location myPlanetOrbitLocation = PlanetOrbitLocation.GetLocation()
	debug.trace(self + "  myPlanetOrbitLocation=" + myPlanetOrbitLocation)
	if myPlanetOrbitLocation
		int myPlanetIndex = SettledPlanets.FindStruct("PlanetOrbitLocation", myPlanetOrbitLocation)
		debug.trace(self + "  myPlanetIndex=" + myPlanetIndex)
		if myPlanetIndex > -1
			thePlanetData = SettledPlanets[myPlanetIndex]
		EndIf
	endif
	return thePlanetData
endFunction

function AllowLanding(bool bAllowLanding = true)
	debug.trace(self + " AllowLanding " + bAllowLanding)
	PlanetData thePlanetData = GetPlanetData()
	if thePlanetData
		debug.trace(self + "  found planet data " + thePlanetData)
		; set map markers for landing
		AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker01)
		AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker02)
		AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker03)
		AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker04)
		AllowLandingAtMarker(bAllowLanding, thePlanetData.MapMarker05)
	endif
EndFunction

function AllowLandingAtMarker(bool bAllowLanding, ObjectReference markerRef)
	if markerRef
		markerRef.EnableFastTravel(bAllowLanding)
		debug.trace(self + "  map marker " + markerRef + " CanFastTravelToMarker=" + markerRef.CanFastTravelToMarker())
	endif
EndFunction

function ScanForContraband()
	SpaceshipReference guardShipRef = Ship01.GetShipRef()

	debug.trace(self + "ScanForContraband scanstatus=" + SQ_GuardShipsScanStatus.GetValue() + " guardship=" + guardShipRef)

	; if guard ship is no longer loaded, don't do anything
	; if ship has no contraband, don't do anything
	; if ship has unshielded contraband, automatically caught
	; otherwise, trigger smuggling minigame
	SpaceshipReference playerShipRef = Playership.GetShipRef()
	if playerShipRef
		if guardShipRef == NONE || leftOrbit || ( guardShipRef.Is3DLoaded() == false && playerShipRef.IsInSpace() == false )
			debug.trace(self + " no guard ship OR player left orbit OR guard ship not loaded - do nothing, turn off contrband scan UI")
			SQ_GuardShipsScene.Stop()
			; transition out of contraband warning
			HideContrabandScanWarning(abSkipCompletionAnim = true)
		else
			int contrabandStatus = playerShipRef.CheckContrabandStatus(true)
			debug.trace(self + "CheckContrabandStatus=" + contrabandStatus + " droppedContraband=" + droppedContraband)
			if contrabandStatus < 0 && droppedContraband == false
				; no contraband
				debug.trace(self + " no contraband")
				; transition out of contraband warning
				HideContrabandScanWarning(abSkipCompletionAnim = false, abWasDetectionEvaded = true)
				SQ_GuardShipsScanStatus.SetValueInt(1)
			elseif contrabandStatus > 0 || droppedContraband
				debug.trace(self + " contraband over limit or dropped contraband - trigger smuggling alarm")
				SQ_GuardShipsScanStatus.SetValueInt(0)
				; transition out of contraband warning
				HideContrabandScanWarning(abSkipCompletionAnim = false, abWasDetectionEvaded = false)
				SendSmugglingAlarm()
			Else
				debug.trace(self + " shielded contraband - smuggling minigame")
				bool scanStatus = SQ_Parent.SmugglingMinigame(playerShipRef, Ship01.GetShipRef())
				SQ_GuardShipsScanStatus.SetValueInt(scanStatus as int)

				; transition out of contraband warning
				HideContrabandScanWarning(abSkipCompletionAnim = false, abWasDetectionEvaded = scanStatus)

				if scanStatus
					; player won, nothing happens
				Else
					SendSmugglingAlarm()
				endif
			endif
		endif
	endif
	debug.trace(self + " scanStatus=" + SQ_GuardShipsScanStatus.GetValueInt())

	; no need to continue to watch for dropping contraband
	StartContrabandDropCheck(false)
endFunction

function SendSmugglingAlarm()
	debug.trace(self + " SendSmugglingAlarm from guard ship " + Ship01.GetShipRef())
	Ship01.TryToSendSmugglingAlarm()
	SQ_GuardShipsScene.Stop()
	SetStage(ContrabandDetectedStage)
EndFunction

Function ClearScanStatus()
	debug.trace(self + " ClearScanStatus ")
	SQ_GuardShipsScanStatus.SetValue(-1)
EndFunction

Guard scanWarningGuard ProtectsFunctionLogic

function ShowContrabandScanWarning(bool abScanInProgress)
	debug.trace(self + " ShowContrabandScanWarning START: abScanInProgress=" + abScanInProgress)
	LockGuard scanWarningGuard
		showingContrabandWarning = true
		SpaceshipReference playerShipRef = Playership.GetShipRef()
		SpaceshipReference guardShipRef = Ship01.GetShipRef()
		if playerShipRef && guardShipRef
			float evasionChance = SQ_Parent.GetSmugglingChance(playerShipRef, guardShipRef)
			if droppedContraband
				evasionChance = 0.0
			EndIf
			debug.trace(self + " ShowContrabandScanWarning evasionChance=" + evasionChance + ", abScanInProgress=" + abScanInProgress + " droppedContraband=" + droppedContraband)
			Game.ShowContrabandScanWarning(evasionChance as int, abScanInProgress)
		endif
		if abScanInProgress == false
			leftOrbit = false ; reset if we're starting the scene
			debug.trace(self + " ShowContrabandScanWarning: starting SQ_GuardShipsScene")
			SQ_GuardShipsScene.Start()
		endif
	EndLockGuard
endFunction

function HideContrabandScanWarning(bool abSkipCompletionAnim = false, bool abWasDetectionEvaded = false)
	LockGuard scanWarningGuard
		; only hide if this quest is showing it
		if showingContrabandWarning
			showingContrabandWarning = false
			Game.HideContrabandScanWarning(abSkipCompletionAnim, abWasDetectionEvaded)
		endif
	EndLockGuard
EndFunction

Event ReferenceAlias.OnDeath(ReferenceAlias akSource, ObjectReference akKiller)
	debug.trace(self + " guard ship killed - calling reinforcements")
	StartReinforcementTimer()
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == reinforcementTimerID
		SpawnReinforcements()
	EndIf
EndEvent

function StartReinforcementTimer()
	StartTimer(Utility.RandomFloat(reinforcementDelayMin, reinforcementDelayMax), reinforcementTimerID)
EndFunction

function SpawnReinforcements()
	if reinforcementTotal == 0
		; first time called - initialize
		reinforcementTotal = utility.RandomInt(minReinforcements, maxReinforcements)
	endif

	debug.trace(self + " SpawnReinforcements: reinforcementTotal=" + reinforcementTotal + ", reinforcementCurrent=" + reinforcementCurrent)
	if reinforcementCurrent < reinforcementTotal
		reinforcementCurrent += 1
		; get matching guardshiptype
		SpaceshipReference guardshipRef = Ship01.GetShipRef()
		if guardshipRef
			Faction crimeFaction = guardshipRef.GetCrimeFaction()
			if crimeFaction
				int i = 0
				SpaceshipBase reinforcementToSpawn
				while i < GuardShipReinforcements.Length && reinforcementToSpawn == NONE
					GuardshipType theType = GuardShipReinforcements[i]
					if theType.crimeFaction == crimeFaction
						reinforcementToSpawn = theType.GuardShipBase
					endif
					i += 1
				EndWhile
				if reinforcementToSpawn
					debug.trace(self + " found matching guard ship reinforcement " + reinforcementToSpawn)
					; spawn one at a random spawn point
					i = Utility.RandomInt(0, ReinforcementSpawnPoints.Length-1)
					debug.trace(self + " picked spawn point index=" + i + ": " + ReinforcementSpawnPoints[i])
					ObjectReference spawnPoint = ReinforcementSpawnPoints[i].GetRef()
					debug.trace(self + " picked spawnPoint=" + spawnPoint)
					if spawnPoint
						SpaceshipReference newShipRef = spawnPoint.PlaceShipAtMe(reinforcementToSpawn, akAliasToFill=Reinforcements)
						debug.trace(self + " reinforcement ship=" + newShipRef)
					endif
					if reinforcementCurrent < reinforcementTotal
						StartReinforcementTimer()
					Else
						; no more reinforcements
						AllowLanding(true)
					endif
				endif
			endif
		endif
	endif
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    debug.trace(self + " Actor.OnLocationChange " + akSender + " akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
	if akSender == Game.GetPlayer()
		debug.trace(self + " player changed location - check for shutdown")
		CheckForShutdown()
	endif
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
    debug.trace(self + " ReferenceAlias.OnLocationChange " + akSender + " akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
	; watch for player ship to change location
	if akSender == PlayerShip && akOldLoc != akNewLoc
		debug.trace(self + " player ship changed location - check for shutdown")
		CheckForShutdown()
	Else
		debug.trace(self + " old and new locations are the same - do nothing")
	endif
EndEvent

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSender, Location aDepartureLocation, Location aArrivalLocation, int aState)
    debug.trace(self + " ReferenceAlias.OnShipFarTravel " + akSender + " aDepartureLocation=" + aDepartureLocation + " aArrivalLocation=" + aArrivalLocation)
	; watch for player ship to far travel
	if akSender == PlayerShip && aState == 0 && aArrivalLocation != aDepartureLocation
		debug.trace(self + " player ship has initiated far travel: aDepartureLocation=" + aDepartureLocation + " aArrivalLocation=" + aArrivalLocation + " playerShip current location=" + PlayerShip.GetRef().GetCurrentLocation())
		leftOrbit = true
	endif
endEvent 

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSender, Location aDestination, int aState)
    debug.trace(self + " ReferenceAlias.OnShipGravJump " + akSender + " aDestination=" + aDestination + " aState=" + aState)
	; watch for player ship to grav jump
	if akSender == PlayerShip && aState == 1 ; anim started - now can't be cancelled
		debug.trace(self + " player ship has initiated grav jump: aDestination=" + aDestination + " playerShip current location=" + PlayerShip.GetRef().GetCurrentLocation())
		leftOrbit = true
	endif
EndEvent

function CheckForShutdown(bool allowRestartContrabandScene = true)
	debug.trace(self + " CheckForShutdown START: allowRestartContrabandScene=" + allowRestartContrabandScene)
	LockGuard scanWarningGuard
		; if player or ship is in a different system, allow landing and shut down
		Location guardShipLocation = PlanetLocation.GetLocation()

		ObjectReference playerShipRef = PlayerShip.GetRef()
		Location currentLocation = playerShipRef.GetCurrentLocation()
		Location guardShipCurrentLocation = Ship01.GetShipRef().GetCurrentLocation()

		if currentLocation == None
			; if we can't get ship location, get player location
			currentLocation = Game.GetPlayer().GetCurrentLocation()
		endif
		
		debug.trace(self + " CheckForShutdown: guardShipLocation=" + guardShipLocation + " currentLocation=" + currentLocation + " guardShipCurrentLocation=" + guardShipCurrentLocation)

		if currentLocation
			bool moonCheck = false
			if currentLocation != guardShipCurrentLocation && currentLocation.IsSameLocation(guardShipLocation, LocTypeMajorOrbital)
				; same location - check for moons
				; get major orbital parent locations of my current location
				Location[] currentLocationParentPlanets = currentLocation.GetParentLocations(LocTypeMajorOrbital)
				Location[] guardShipLocationParentPlanets = guardShipLocation.GetParentLocations(LocTypeMajorOrbital)
				debug.trace(self + " currentLocationParentPlanets=" + currentLocationParentPlanets)
				debug.trace(self + " guardShipLocationParentPlanets=" + guardShipLocationParentPlanets)
				if currentLocationParentPlanets.Length > 1 ; moon
					debug.trace(self + " Am I on a moon of guardShipLocation?")
					; I'm on a moon - see if guardship parent (or guardship location itself) is in my array
					if currentLocationParentPlanets.Find(guardShipLocation) > -1 || (guardShipLocationParentPlanets.Length > 0 && currentLocationParentPlanets.Find(guardShipLocationParentPlanets[0]) > -1)
						; if either of these is true, I'm on a moon of the guardship location
						debug.trace(self + " Yes - player is on moon of guard ship location")
						moonCheck = true
					endif
				elseif guardShipLocationParentPlanets.Length > 0 && currentLocationParentPlanets.Length > 0
					debug.trace(self + " Am I on a parent planet of guardShipLocation?")
					; maybe guard ships are on a moon and I'm on the parent
					if guardShipLocationParentPlanets.Find(currentLocationParentPlanets[0])
						debug.trace(self + " Yes - player is on parent planet of guard ship location, which is on a moon")
						moonCheck = true
					endif
				EndIf
			endif

			if moonCheck || currentLocation.IsSameLocation(guardShipLocation, LocTypeMajorOrbital) == false
				debug.trace(self + " Player or player ship no longer at same planet - allow landing and shut down")
				AllowLanding(true)
				Stop()
			Elseif playerShipRef.IsInSpace() && SQ_GuardShipsScanStatus.GetValueInt() < 1 && SQ_GuardShipsScene.IsPlaying() == false
				if allowRestartContrabandScene
					debug.trace(self + " Player ship back in orbit, not yet cleared - restart scene")
					; player is back in orbit of our planet - restart contraband scan warning
					ShowContrabandScanWarning(false)	
				endif
			endif
		endif
	EndLockGuard
	debug.trace(self + " CheckForShutdown DONE")
endFunction

function StartContrabandDropCheck(bool bStart)
    debug.trace(self + "StartContrabandDropCheck " + bStart)
    if bStart
        AddInventoryEventFilter(Contraband)
        RegisterForRemoteEvent(PlayerShip, "OnItemRemoved")
    Else
        UnregisterForRemoteEvent(PlayerShip, "OnItemRemoved")
    endif
EndFunction

Event ReferenceAlias.OnItemRemoved(ReferenceAlias akSource, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
	debug.trace(self + " OnItemRemoved akBaseItem=" + akBaseItem + " akDestContainer=" + akDestContainer + " aiTransferReason=" + aiTransferReason)
	if aiTransferReason == 3 || ( akDestContainer && akDestContainer.HasKeyword(SpaceJettisonContainer) )
		debug.trace(self + " droppedContraband=true")
		; by definition, player ship has dropped contraband
		droppedContraband = true
	endif
endEvent

function debugAlarmStatus()
	debug.trace(self + " Guard ship alarmed? " + Ship01.GetShipRef().IsAlarmed())
endFunction