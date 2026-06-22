Scriptname SQ_StationTrafficManagerQuestScript extends Quest
{Station Traffic Manager quest script.}

Group AutofillProperties
	LocationAlias property PlayerShipLocation Auto Const Mandatory
	ReferenceAlias property PlayerShip Auto Const Mandatory
	ReferenceAlias property SettingsMarker Auto Const Mandatory
	ReferenceAlias property Starstation Auto const Mandatory
	RefCollectionAlias property Ships Auto Const Mandatory
	RefCollectionAlias property StationShips Auto Const Mandatory
	RefCollectionAlias property TrafficShips Auto Const Mandatory
	ActorValue property SQ_TrafficManagerSCPackageValue Auto Const Mandatory
	ActorValue property SQ_TrafficManagerSCTimestampValue Auto Const Mandatory
	Keyword property LinkTrafficSystemStarstation Auto Const Mandatory
	Static property XMarker Auto Const Mandatory
EndGroup

;Values from the SettingsMarker
int minRefreshTime
int maxRefreshTime
int minSpawnDelay
float percentEasy
float percentMedium
float percentHard

Formlist trafficShipList
Faction[] trafficShipFactions
int maxShips
int initialShipsMin
int initialShipsMax

int maxShipsInteractingWithStation
int dockingDelayMin
int dockingDelayMax
int safeSpawnDistanceFromStation

GlobalVariable combatTimestampGlobal
float combatTimestampElapsedDelay


;Local Variables
SQ_StationTrafficManagerSettingsScr settingsMarkerRef
SpaceshipReference stationRef
int initialShips
float lastSpawnTimestamp
bool trafficManagerActive RequiresGuard(TrafficManagerGuard)

;Local Consts
int CONST_InitializationFailsafe = 20 Const
int CONST_SafeSpawnAttemptsMax = 5 Const
int CONST_SafeSpawnDistanceFromPlayerShip = 400 Const
int CONST_DockingEntryExitDistance = 100 Const
int CONST_GravJumpExitDistance = 100 Const
int CONST_SpawningShutdownStage = 20 Const

int CONST_PackageValue_Patrol = 0 Const
int CONST_PackageValue_Docking = 1 Const
int CONST_PackageValue_Docked = 2 Const
int CONST_PackageValue_Departing = 3 Const
int CONST_PackageValue_Arriving = 4 Const

;Guards
Guard TrafficManagerGuard

;MoveNear Consts (from ObjectReference.psc)
int CONST_NearPosition_Random = -2 Const
int CONST_NearPosition_DeadAhead = -1 Const
int CONST_NearPosition_ForwardTight = 0 Const
int CONST_NearPosition_ForwardWide = 1 Const
int CONST_NearPosition_Above = 3 Const
int CONST_NearPosition_Below = 4 Const
int CONST_NearDistance_RandomFar = -3 Const
int CONST_NearDistance_Close = 0 Const
int CONST_NearDistance_Moderate = 2 Const
int CONST_NearDistance_Long = 3 Const
int CONST_NearFacing_Random = -2 Const
int CONST_NearFacing_TowardSmall = 0 Const
int CONST_NearFacing_TowardLarge = 1 Const
int CONST_NearFacing_AwaySmall = 2 Const
int CONST_NearFacing_AwayLarge = 3 Const

int CONST_MinEntryExitZOffset = 500 Const
int CONST_MidEntryExitZOffset = 750 Const 
int CONST_MaxEntryExitZOffset = 1000 Const

;----------------------------------
;Initialization, Timer, Shutdown
;--------------------------------

Function InitOnStartupStage()
	LockGuard(TrafficManagerGuard)
		trafficManagerActive = True
	EndLockGuard

	RegisterForRemoteEvent(PlayerShip, "OnLocationChange")

    settingsMarkerRef = SettingsMarker.GetRef() as SQ_StationTrafficManagerSettingsScr
    stationRef = settingsMarkerRef.GetLinkedRef(LinkTrafficSystemStarstation) as SpaceshipReference
    Starstation.ForceRefTo(stationRef)

    maxRefreshTime = settingsMarkerRef.MaxRefreshTime
	minRefreshTime = Math.Max(1, Math.Min(settingsMarkerRef.MinRefreshTime, maxRefreshTime)) as int
	minSpawnDelay = settingsMarkerRef.MinSpawnDelay

	percentEasy = settingsMarkerRef.PercentEasy
	percentMedium = settingsMarkerRef.PercentMedium
	percentHard = settingsMarkerRef.PercentHard

	trafficShipList = settingsMarkerRef.TrafficShipList
	trafficShipFactions = settingsMarkerRef.TrafficShipFactions
	maxShips = settingsMarkerRef.MaxShips
	initialShipsMax = Math.Min(settingsMarkerRef.InitialShipsMax, maxShips) as int
	initialShipsMin = Math.Min(settingsMarkerRef.InitialShipsMin, initialShipsMax) as int
	initialShips = Utility.RandomInt(initialShipsMin, initialShipsMax)

	if (stationRef != None)
		maxShipsInteractingWithStation = Math.Min(settingsMarkerRef.MaxShipsInteractingWithStation, maxShips) as int
		dockingDelayMax = settingsMarkerRef.DockingDelayMax
		dockingDelayMin = Math.Min(settingsMarkerRef.dockingDelayMin, DockingDelayMax) as int
		safeSpawnDistanceFromStation = settingsMarkerRef.SafeSpawnDistanceFromStation
	EndIf

	combatTimestampGlobal = settingsMarkerRef.CombatTimestampGlobal
	combatTimestampElapsedDelay = settingsMarkerRef.CombatTimestampElapsedDelay

	if ((combatTimestampGlobal == None) || (combatTimestampGlobal.GetValue() <= 0) || \
		(combatTimestampGlobal.GetValue() + combatTimestampElapsedDelay < Utility.GetCurrentGameTime()))
		;Spawn the initial ships.
		int i = 0
		While (i < initialShips)
			SpawnShipTrafficNoWait(True)
			i = i + 1
		EndWhile
		;Then start the timer.
   		StartTimer(Utility.RandomFloat(minRefreshTime, maxRefreshTime))
   	Else
   		Debug.Trace("TrafficManagerSC aborted startup because of timestamp. " + combatTimestampGlobal.GetValue() + "+" + combatTimestampElapsedDelay + ">" + Utility.GetCurrentGameTime())
   	EndIf
EndFunction


Event OnTimer(int timerID)
	Debug.Trace("TrafficManagerSC OnTimer Check:")
	int currentStationShips = StationShips.GetCount()
	;Check whether any ships docked at the starstation are ready to depart. If so, undock one of them.
	if (currentStationShips > 0)
		bool hasUndockedShip
		float currentTime = Utility.GetCurrentRealTime()
		int i = 0
		While (!hasUndockedShip && (i < StationShips.GetCount()))
			SpaceshipReference currentShip = StationShips.GetAt(i) as SpaceshipReference
			int currentShipPackageValue = currentShip.GetValue(SQ_TrafficManagerSCPackageValue) as int
			if (currentShipPackageValue != CONST_PackageValue_Docked)
				Debug.Trace("--Skipping " + currentShip + " because package value was " + currentShipPackageValue)
			Else
				float currentShipDepartureTimeValue = currentShip.GetValue(SQ_TrafficManagerSCTimestampValue)
				if (currentTime < (currentShipDepartureTimeValue - dockingDelayMax))
					currentShip.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime() + dockingDelayMax)
					Debug.Trace("--TimerReset: Resetting " + currentShip + " to a new departure time following save/load.")
				ElseIf (currentShipDepartureTimeValue > currentTime)
					Debug.Trace("--Skipping " + currentShip + " because time left was " + (currentShipDepartureTimeValue - currentTime))
				Else
					MoveToDockingExitPoint(currentShip)
					hasUndockedShip = True
				EndIf
			EndIf
			i = i + 1
		EndWhile
	EndIf
	;Check whether we're below our max ship count. If so, spawn one.
	if (GetStageDone(CONST_SpawningShutdownStage))
		Debug.Trace("--Skipping spawn because our shutdown stage has been set.")
		if (combatTimestampGlobal != None)
			combatTimestampGlobal.SetValue(Utility.GetCurrentGameTime())
			Debug.Trace("TrafficManagerSC set combat timestamp to " + combatTimestampGlobal.GetValue())
		EndIf
	ElseIf (Ships.GetCount() < maxShips)
		float currentTime = Utility.GetCurrentRealTime()
		if (currentTime < lastSpawnTimestamp)
			Debug.Trace("--TimerReset: Resetting lastSpawnTimestamp to a new spawn time following save/load.")
			lastSpawnTimestamp = 0
		ElseIf ((lastSpawnTimestamp + MinSpawnDelay) > currentTime)
			Debug.Trace("--Skipping spawn because it's too soon. Waiting at least " + (lastSpawnTimestamp + MinSpawnDelay - currentTime))
		Else
			lastSpawnTimestamp = currentTime
			if (currentStationShips < maxShipsInteractingWithStation)
				SpawnShipStationNoWait()
			Else
				SpawnShipTrafficNoWait()
			EndIf
		EndIf
	EndIf
	Debug.Trace("TrafficManagerSC OnTimer DONE.")

	;Restart the timer.
	LockGuard(TrafficManagerGuard)
		if (trafficManagerActive)
			StartTimer(Utility.RandomFloat(minRefreshTime, maxRefreshTime))
		EndIf
	EndLockGuard
EndEvent


;Cleanup on location change.
Event ReferenceAlias.OnLocationChange(ReferenceAlias source, Location akOldLoc, Location akNewLoc)
    if (akNewLoc != PlayerShipLocation.GetLocation())
    	Debug.Trace("TrafficManagerSC starts cleanup.")
    	LockGuard(TrafficManagerGuard)
    		ObjectReference[] shipRefs = Ships.GetArray()
	    	int i = 0
	    	While (i < shipRefs.Length)
	    		shipRefs[i].DisableNoWait()
	    		shipRefs[i].Delete()
	    		i = i + 1
	    	EndWhile
	    	settingsMarkerRef = None
			stationRef = None
			trafficManagerActive = False
		EndLockGuard
		Debug.Trace("TrafficManagerSC ends cleanup.")
    	Stop()
    EndIf
EndEvent


;----------------------------------
;Ship Spawning
;-----------------------


Function SpawnShipStationNoWait()
	CallFunctionNoWait("SpawnShipStation", None)
EndFunction

Function SpawnShipStation()
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()

	;Find a good spawn point, a moderate distance from the stationRef, facing it, not too close to the player's ship.
	ObjectReference spawnMarker = settingsMarkerRef.PlaceAtMe(XMarker)
	bool safeSpawnLocationFound
	int i = 0
	While (!safeSpawnLocationFound && (i < CONST_SafeSpawnAttemptsMax))
		spawnMarker.MoveNear(stationRef, CONST_NearPosition_Random, CONST_NearDistance_Moderate, CONST_NearFacing_TowardLarge)
		safeSpawnLocationFound = spawnMarker.GetDistance(playerShipRef) > CONST_SafeSpawnDistanceFromPlayerShip
		i = i + 1
	EndWhile

	;Spawn the ship.
	SpaceshipReference ship = Private_SpawnShip(spawnMarker, True)

	if (ship != None)
		;Enable the ship.
		ship.EnableWithGravJumpNoWait()

		;Link it to the stationRef to support the docking package.
		ship.SetLinkedRef(stationRef, LinkTrafficSystemStarstation, False)

		MoveToDockingEntryPoint(ship)

		;Trace the ship that spawned.
		Debug.Trace("TrafficManagerSC: Spawned Docking Ship " + ship + " heading for " + stationRef + "; Distance=" + ship.GetDistance(stationRef))
	EndIf

	;Clean up the spawn marker.
	spawnMarker.Delete()
EndFunction


Function SpawnShipTrafficNoWait(bool isInitialShip=False)
	Var[] akArgs = new Var[1]
	akArgs[0] = isInitialShip
	CallFunctionNoWait("SpawnShipTraffic", akArgs)
EndFunction

Function SpawnShipTraffic(bool isInitialShip=False)
	;Spawn traffic ships far from the player's position.
	ObjectReference spawnMarker = settingsMarkerRef.PlaceAtMe(XMarker)
	spawnMarker.MoveNear(PlayerShip.GetRef(), CONST_NearPosition_Random, CONST_NearDistance_RandomFar, CONST_NearFacing_Random)
	if (stationRef != None)
		bool safeSpawnLocationFound = spawnMarker.GetDistance(stationRef) > safeSpawnDistanceFromStation
		int i = 0
		While (!safeSpawnLocationFound && (i < CONST_SafeSpawnAttemptsMax))
			spawnMarker.MoveNear(PlayerShip.GetRef(), CONST_NearPosition_Random, CONST_NearDistance_RandomFar, CONST_NearFacing_Random)
			safeSpawnLocationFound = spawnMarker.GetDistance(stationRef) > safeSpawnDistanceFromStation
			if (isInitialShip && safeSpawnLocationFound)
				safeSpawnLocationFound = !Game.GetPlayer().HasDetectionLOS(spawnMarker)
			EndIf
			i = i + 1
		EndWhile
	EndIf

	;Spawn the ship.
	SpaceshipReference ship = Private_SpawnShip(spawnMarker, False)

	if (ship != None)
		;Spawn two patrol markers, one at the ship, the other out ahead of it, linked together to create a patrol route. 
		ObjectReference patrolStartMarker = spawnMarker.PlaceAtMe(XMarker)
		ship.SetLinkedRef(patrolStartMarker, abPromoteParentRefr=False)
		ObjectReference patrolTargetMarker = patrolStartMarker.PlaceAtMe(XMarker)
		patrolTargetMarker.MoveNear(patrolStartMarker, CONST_NearPosition_ForwardWide, CONST_NearDistance_Long, CONST_NearFacing_AwaySmall)
		patrolStartMarker.SetLinkedRef(patrolTargetMarker, abPromoteParentRefr=False)

		;Register for the ship reaching the second marker. When it does, it will jump out.
		RegisterForDistanceLessThanEvent(ship, patrolTargetMarker, CONST_GravJumpExitDistance)

		;Record a timestamp, so we can track how long it takes a ship to transit.
		ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime())

		;Enable the ship.
		if (isInitialShip)
			ship.EnableNoWait()
		Else
			ship.EnableWithGravJumpNoWait()
		EndIf

		;Trace the ship that spawned.
		Debug.Trace("TrafficManagerSC: Spawned Traffic Ship " + ship + " travelling from " + patrolStartMarker + " to " + patrolTargetMarker + ". Distance=" + patrolStartMarker.GetDistance(patrolTargetMarker))
	EndIf

	;Clean up the spawn marker.
	spawnMarker.Delete()
EndFunction


SpaceshipReference Function Private_SpawnShip(ObjectReference spawnMarker, bool isStationShip=False)
	;Pick a difficulty mod.
	int aiMod
	float aiModRoll = Utility.RandomFloat(0, 1)
	if (aiModRoll < percentEasy)
		aiMod = 0
	ElseIf (aiModRoll < (percentEasy + percentMedium))
		aiMod = 1
	Else
		aiMod = 2
	EndIf

	;Pick the ship base.
	SpaceshipBase shipBase = trafficShiplist.GetAt(Utility.RandomInt(0,TrafficShiplist.GetSize()-1)) as SpaceshipBase

	if (shipBase == None)
		Debug.Trace("ERROR: TrafficManagerSC tried to spawn a ship, but its traffic ship list is empty or missing. Did you forget to set a list on the settings object?", 2)
		return None
	Else
		SpaceshipReference spawnedShip
		LockGuard(TrafficManagerGuard)
			if (trafficManagerActive)
				;Spawn the ship.
				spawnedShip = spawnMarker.PlaceShipAtMe(shipBase, aiMod, abPlayFX=False, abInitiallyDisabled=True)
				;Add it to the appropriate RefCollections.
				Ships.AddRef(spawnedShip)
				if (isStationShip)
					StationShips.AddRef(spawnedShip)
				Else
					TrafficShips.AddRef(spawnedShip)
				EndIf
			EndIf
		EndLockGuard
		if (spawnedShip != None)
			;Apply factions.
			if (trafficShipFactions != None)
				int i = 0
				While (i < trafficShipFactions.Length)
					spawnedShip.AddToFaction(trafficShipFactions[i])
					i = i + 1
				EndWhile
			EndIf
		EndIf
		return spawnedShip
	EndIf
EndFunction


; Gets the position of a given object relative to the current transform of the given target
float[] Function GetLocalPositionOfObjectToTarget(ObjectReference aObject, ObjectReference aTarget) private
	float [] objectPos = aObject.GetSpacePosition()
	float [] targetXF_CS = aTarget.GetSpaceTransform()
	float deltaX_CS = objectPos[0] - targetXF_CS[0]
	float deltaY_CS = objectPos[1] - targetXF_CS[1]
	float deltaZ_CS = objectPos[2] - targetXF_CS[2]
	objectPos[0] = deltaX_CS * targetXF_CS[3] + deltaY_CS * targetXF_CS[4] + deltaZ_CS * targetXF_CS[5]
	objectPos[1] = deltaX_CS * targetXF_CS[6] + deltaY_CS * targetXF_CS[7] + deltaZ_CS * targetXF_CS[8]
	objectPos[2] = deltaX_CS * targetXF_CS[9] + deltaY_CS * targetXF_CS[10] + deltaZ_CS * targetXF_CS[11]
	return objectPos
EndFunction

; Creates a marker at the nearest enter/exit point to the given ship at the given space station
ObjectReference Function CreateMarkerAtNearestEnterExitPoint(SpaceshipReference aShip, SpaceshipReference aStation) private
	float [] ship_LS = GetLocalPositionOfObjectToTarget(aShip,aStation)
	float distanceXY = Math.Sqrt(ship_LS[0]*ship_LS[0]+ship_LS[1]*ship_LS[1])
	float halfStationWidth = 0.5*aStation.GetWidth()
	float halfStationLength = 0.5*aStation.GetLength()
	float halfStationHeight = 0.5*aStation.GetHeight()
	float stationCircleRadius = Math.Sqrt(halfStationLength*halfStationLength+halfStationWidth*halfStationWidth)
	float clampedDistanceXY = Math.Min(distanceXY,stationCircleRadius)
	float[] offsets = new float[6]
	offsets[0] = clampedDistanceXY * ship_LS[0]/distanceXY
	offsets[1] = clampedDistanceXY * ship_LS[1]/distanceXY
	float minApproachZOffset = halfStationHeight+Utility.RandomFloat(CONST_MinEntryExitZOffset, CONST_MidEntryExitZOffset)
	float maxApproachZOffset = halfStationHeight+Utility.RandomFloat(CONST_MidEntryExitZOffset, CONST_MaxEntryExitZOffset)
	if (ship_LS[2]>=0.0)
		offsets[2] = Math.Clamp(ship_LS[2], minApproachZOffset, maxApproachZOffset)
	Else
		offsets[2] = Math.Clamp(ship_LS[2], -maxApproachZOffset, -minApproachZOffset)
	EndIF
	ObjectReference newMarker = stationRef.PlaceAtMe(XMarker, akOffsetValues=offsets)
	float [] newMarker_LS = GetLocalPositionOfObjectToTarget(newMarker,aStation)
	return newMarker
EndFunction

;----------------------------------
;Ship Events
;-----------------------

;When a stationRef ship docks, set it its timestamp, and set it to the docked state.
Event SpaceshipReference.OnShipDock(SpaceshipReference ship, bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
	if (abComplete && (akParent == stationRef))
		float dockingTime = Utility.RandomFloat(dockingDelayMin, dockingDelayMax)
		ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentGameTime() + dockingTime)
		ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Docked)
		ship.EvaluatePackage()
		Debug.Trace("TrafficManagerSC: Station Ship " + ship + " docking to " + stationRef + " for " + dockingTime + "s.")
	EndIf
EndEvent

Function MoveToDockingEntryPoint(SpaceshipReference ship)
	ObjectReference enterMarker = CreateMarkerAtNearestEnterExitPoint(ship,stationRef)
	ship.SetLinkedRef(enterMarker, abPromoteParentRefr=False)
	ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime())
	ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Arriving)
	ship.EvaluatePackage()
	RegisterForDistanceLessThanEvent(ship, ship.GetLinkedRef(), CONST_DockingEntryExitDistance)
EndFunction

;When requested by the OnTimer event, undock a ship from the stationRef.
;The ship already has an exit point, created when it spawned. When it reaches that point, it will jump away.
Function MoveToDockingExitPoint(SpaceshipReference ship)
	ObjectReference exitMarker = CreateMarkerAtNearestEnterExitPoint(ship,stationRef)
	; spawn the turnMarker at the exit marker to get its orientation but translate it so it is on top of the ship.
	float[] shipToExitMarker_LS = GetLocalPositionOfObjectToTarget(ship,exitMarker)
	float[] offsets = new float[6]
	offsets[0] = shipToExitMarker_LS[0]
	offsets[1] = shipToExitMarker_LS[1]
	offsets[2] = shipToExitMarker_LS[2]
	ObjectReference turnMarker = exitMarker.PlaceAtMe(XMarker,akOffsetValues=offsets)
	ObjectReference gravJumpMarker = exitMarker.PlaceAtMe(XMarker)
	float[] exitMarkerToStation_LS = GetLocalPositionOfObjectToTarget(exitMarker,stationRef)
	if(exitMarkerToStation_LS[2] < 0.0)
		gravJumpMarker.MoveNear(stationRef, CONST_NearPosition_Below, CONST_NearDistance_Long, CONST_NearFacing_AwayLarge)
	else
		gravJumpMarker.MoveNear(stationRef, CONST_NearPosition_Above, CONST_NearDistance_Long, CONST_NearFacing_AwayLarge)
	EndIf
	exitMarker.SetLinkedRef(gravJumpMarker, abPromoteParentRefr=False)
	turnMarker.SetLinkedRef(exitMarker, abPromoteParentRefr=False)
	ship.SetLinkedRef(turnMarker, abPromoteParentRefr=False)
	ship.SetValue(SQ_TrafficManagerSCTimestampValue, Utility.GetCurrentRealTime())
	ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Departing)
	ship.EvaluatePackage()
	RegisterForDistanceLessThanEvent(ship, gravJumpMarker, CONST_GravJumpExitDistance)	
EndFunction

; Docks the ship to the station
Function DockShipStation(SpaceshipReference ship)
	RegisterForRemoteEvent(ship, "OnShipDock")
	ship.SetValue(SQ_TrafficManagerSCPackageValue, CONST_PackageValue_Docking)
	ship.EvaluatePackage()
EndFunction

; Handles state change for the entry/exit states for all ships.
Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	SpaceshipReference ship 
	if (akObj1 is SpaceshipReference)
		ship = akObj1 as SpaceshipReference
	Else
		ship = akObj2 as SpaceshipReference
	EndIf

	;Trace out our transit time to make sure this is taking a reasonable amount of time.
	float transitTime = Utility.GetCurrentRealTime() - ship.GetValue(SQ_TrafficManagerSCTimestampValue)

	if(ship.GetValue(SQ_TrafficManagerSCPackageValue) == CONST_PackageValue_Arriving)
		; ship has reached the WP near the station's docking ports, start docking
		Debug.Trace("TrafficManagerSC: Traffic Ship Docking Start: " + ship + "; transit time=" + transitTime)
		DockShipStation(ship)
	Else
		; departing or traffic
		if (ship.GetValue(SQ_TrafficManagerSCPackageValue) == CONST_PackageValue_Patrol)
			Debug.Trace("TrafficManagerSC: Station Ship GravJump out: " + ship + "; transit time=" + transitTime)
		Else
			Debug.Trace("TrafficManagerSC: Traffic Ship GravJump out: " + ship + "; transit time=" + transitTime)
		Endif
		;The ship jumps out.
		ship.DisableWithGravJump()
		;Clean up our RefCollections.
		LockGuard(TrafficManagerGuard)
			if (trafficManagerActive)
				Ships.RemoveRef(ship)
				StationShips.RemoveRef(ship)
				TrafficShips.RemoveRef(ship)

				;Clean up our markers.
				ObjectReference[] shipLinkedRefs = ship.GetLinkedRefChain()
				int i = 0
				While (i < shipLinkedRefs.Length)
					if (shipLinkedRefs[i] != None)
						shipLinkedRefs[i].Delete()
					EndIf
					i = i + 1
				EndWhile

				;And delete the ship.
				ship.Delete()
			EndIf
		EndLockGuard
	EndIf
EndEvent



;----------------------------------
;Debug
;------

Function DEBUG_MoveNearPlayer(SpaceshipReference ship)
	ship.MoveNear(PlayerShip.GetRef(), CONST_NearPosition_DeadAhead, CONST_NearDistance_Close, CONST_NearFacing_AwayLarge)
	Debug.Trace("TrafficManagerSC: DEBUG: Warped: " + ship + " to player. Distance=" + ship.GetDistance(PlayerShip.GetRef()))
EndFunction