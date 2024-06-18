Scriptname LC030_QuestScript extends Quest
{Quest script for LC030, The Lock.}

Group AutofillProperties
	Quest property CF03 Auto Const Mandatory
	BEScript property BE_CF03_Shuttle Auto Const Mandatory
	SQ_PlayerShipScript property SQ_PlayerShip Auto Const Mandatory
	SQ_FollowersScript property SQ_Followers Mandatory Const Auto
	LocationAlias property LC030LockLocation Auto Const Mandatory
	LocationAlias property ShuttleBayShuttleLocation Auto Const Mandatory
	ReferenceAlias property Mathis Auto Const Mandatory
	ReferenceAlias property Mathis_CollapsingCeilingMoveToMarker Auto Const Mandatory
	ReferenceAlias property Delgado Auto Const Mandatory
	ReferenceAlias property GenericAlly01 Auto Const Mandatory
	ReferenceAlias property GenericAlly02 Auto Const Mandatory
	ReferenceAlias property MapMarker Auto Const Mandatory
	RefCollectionAlias property ExteriorEnemiesBeyondTheLock Auto Const Mandatory
	RefCollectionAlias property ExteriorEnemiesWithinTheLock Auto Const Mandatory
	RefCollectionAlias property TransferChamberEnemies_All Auto Const Mandatory
	RefCollectionAlias property FissureEnemies_All Auto Const Mandatory
	RefCollectionAlias property BarracksCreatures_All Auto Const Mandatory
	RefCollectionAlias property ShuttleBayEnemies_All Auto Const Mandatory
	ReferenceAlias property TransferChamberFailsafeTrigger Auto Const Mandatory
	ReferenceAlias property CollapsingCeilingTrigger Auto Const Mandatory
	ReferenceAlias property CollapsingCeilingActivator Auto Const Mandatory
	ReferenceAlias property CollapsingCeilingCollisionPrim Auto Const Mandatory
	ReferenceAlias property CollapsingCeilingNavcutPrim Auto Const Mandatory
	ReferenceAlias property LoosePanelDoor Auto Const Mandatory
	ReferenceAlias property ShuttleBayGryllobaQueen Auto Const Mandatory
	ReferenceAlias property PlayerShip Auto Const Mandatory
	ReferenceAlias property ShuttleBayShuttle Auto Const Mandatory
	ReferenceAlias property StationTheKey Auto Const Mandatory
	ReferenceAlias property KeyPlayerDockingPort Auto Const Mandatory

	Cell property LC030Lock01 Auto Const Mandatory
	Armor property Spacesuit_CrimsonFleet_Backpack_1 Auto Const Mandatory
	Armor property Spacesuit_CrimsonFleet_Backpack_2 Auto Const Mandatory
	Armor property Spacesuit_CrimsonFleet_Backpack_1_NotPlayable Auto Const Mandatory
	Armor property Spacesuit_CrimsonFleet_Backpack_2_NotPlayable Auto Const Mandatory
	Keyword property LinkAmbushTrigger Auto Const Mandatory
	Keyword property SpaceshipStoredLink Auto Const Mandatory
	Location property SKryx_PSuvorov_Surface Auto Const Mandatory
	WWiseEvent property QST_CF03_CeilingCollapse_Collapse Auto Const Mandatory
	ActorValue property Health Auto Const Mandatory
	ActorValue property Confidence Auto Const Mandatory
	ActorValue property AmbushTriggered Auto Const Mandatory
	GlobalVariable property CF03ExteriorActorsHoldNearPlayerGlobal Auto Const Mandatory
	ObjectReference property CF03DelgadoInsideLockEntranceMarkerRef Auto Const Mandatory
	ObjectReference property CF03MathisInsideLockEntranceMarkerRef Auto Const Mandatory
	ObjectReference property CF03GenericAlly01InsideLockEntranceMarkerRef Auto Const Mandatory
	ObjectReference property CF03GenericAlly02InsideLockEntranceMarkerRef Auto Const Mandatory
EndGroup

;Custom Events
CustomEvent OpenShuttleBayDoors
CustomEvent CloseShuttleBayDoors

;Local Consts
String CONST_IDCardReaderUsedEventName = "CardSwiped" Const
int CONST_FissureEnemySafeRange = 4 Const

;Local variables.
Actor playerRef
Actor mathisRef
Actor delgadoRef
Actor genericAlly01Ref
Actor genericAlly02Ref
Actor[] allAllies
ObjectReference mathisMoveToMarkerRef

ObjectReference mapMarkerRef
ObjectReference collapsingCeilingTriggerRef
ObjectReference collapsingCeilingActivatorRef
ObjectReference loosePanelDoorRef
SpaceshipReference playerShipRef
SpaceshipReference shuttleBayShuttleRef

bool hasCompletedExterior
bool hasCollapsedCeiling

InputEnableLayer LC030InputLayer


;Local consts.
int CONST_ExteriorMonitorDelgadoNearPlayerDistance = 14 Const
int CONST_ExteriorMonitorDisableDistance = 30 Const
int CONST_CF03_ExteriorCompletedStage = 41 Const
int CONST_CF03_StageToSetWhenIDCardReaderUsed = 48 Const
int CONST_CF03_TransferChamberCompletedStage = 70 Const
int CONST_CF03_StageRequiredForCeilingCollapse = 80 Const
int CONST_StageToSetDuringCeilingCollapse = 250 Const
int CONST_StageToSetOnCollapsingWallActivated = 269 Const
int CONST_StageToSetWhenShuttleBayCleared = 650 Const
int CONST_StageToSetOnLeavingTheLock = 690 Const

int CONST_ExteriorMonitorTimerID = 1 Const
int CONST_ExteriorMonitorTimerDelay = 3 Const
int CONST_CollapsingCeilingTimerID = 2 Const
int CONST_CollapsingCeilingTimerDelay = 1 Const
int CONST_TransferChamberMonitorTimerID = 3 Const
int CONST_TransferChamberMonitorTimerDelay = 3 Const
int CONST_ShuttleBayMonitorTimerID = 4 Const
int CONST_ShuttleBayMonitorTimerDelay = 2 Const

int CONST_Confidence_Foolhardy = 4 Const
int CONST_ShuttleBayMaxZHeight = -20 Const


;-----------------------------------------
;Initialization, Setup, & Quickstarts
;-------------------------------------

Event OnQuestInit()
	;Save off local variables.
	playerRef = Game.GetPlayer()
	mathisRef = Mathis.GetActorRef()
	delgadoRef = Delgado.GetActorRef()
	genericAlly01Ref = GenericAlly01.GetActorRef()
	genericAlly02Ref = Generically02.GetActorRef()
	shuttleBayShuttleRef = ShuttleBayShuttle.GetShipRef()
	allAllies = new Actor[4]
	allAllies[0] = delgadoRef
	allAllies[1] = mathisRef
	allAllies[2] = genericAlly01Ref
	allAllies[3] = genericAlly02Ref
	mathisMoveToMarkerRef = Mathis_CollapsingCeilingMoveToMarker.GetRef()

	mapMarkerRef = MapMarker.GetRef()
	collapsingCeilingTriggerRef = CollapsingCeilingTrigger.GetRef()
	collapsingCeilingActivatorRef = CollapsingCeilingActivator.GetRef()
	loosePanelDoorRef = LoosePanelDoor.GetRef()

	GenericAlly01.TryToReset()
	GenericAlly01.TryToReset()
	ShuttleBayGryllobaQueen.TryToReset()
	ExteriorEnemiesBeyondTheLock.ResetAll()
	ExteriorEnemiesWithinTheLock.ResetAll()
	TransferChamberEnemies_All.ResetAll()
	BarracksCreatures_All.ResetAll()
	ShuttleBayEnemies_All.ResetAll()

	;Set Ignore Friendly Hits.
	SetIgnoreFriendlyHitsOnAllies(True)

	;Register for your allies first loading, to remove their boostpacks.
	RegisterForRemoteEvent(genericAlly01Ref, "OnLoad")
	if (genericAlly01Ref.Is3DLoaded())
		RemoveAllyBackpacks()
	EndIf

	;Register for the shuttle loading, to update its landing ramp.
	RegisterForRemoteEvent(shuttleBayShuttleRef, "OnLoad")

	;Register for events from the collapsing ceiling trigger.
	RegisterForRemoteEvent(collapsingCeilingTriggerRef, "OnTriggerEnter")

	;Register for events from the collapsing wall.
	RegisterForRemoteEvent(loosePanelDoorRef, "OnActivate")

	;Force enemies the player must kill to Foolhardy, to prevent fleeing.
	TransferChamberEnemies_All.SetValue(Confidence, CONST_Confidence_Foolhardy)
	BarracksCreatures_All.SetValue(Confidence, CONST_Confidence_Foolhardy)
	ShuttleBayEnemies_All.SetValue(Confidence, CONST_Confidence_Foolhardy)
EndEvent


;------------------------------
;Exterior
;---------------------------
;
;During the group travel to the exterior of the Lock, if left to its own devices, the AI gets hung up on
;incidental combats and fails to keep up with the player. To keep the quest moving, this script runs a
;timer loop to force more aggressive travel and hold position packages when necessary.

Event ObjectReference.OnLoad(ObjectReference akSource)
	if (akSource == genericAlly01Ref)
		RemoveAllyBackpacks()
	EndIf
	if ((akSource == shuttleBayShuttleRef) && (GetStageDone(CONST_StageToSetWhenShuttleBayCleared)))
		BE_CF03_Shuttle.SetEnemyShipLandingRampsOpenState(True)
	EndIf
EndEvent

Function RemoveAllyBackpacks()
	;Unregister for the OnLoad event.
	UnregisterForRemoteEvent(genericAlly01Ref, "OnLoad")
	;Remove all backpacks/boostpacks from allies.
	int i = 0
	While (i < allAllies.Length)
		allAllies[i].RemoveItem(Spacesuit_CrimsonFleet_Backpack_1)
		allAllies[i].RemoveItem(Spacesuit_CrimsonFleet_Backpack_2)
		allAllies[i].RemoveItem(Spacesuit_CrimsonFleet_Backpack_1_NotPlayable)
		allAllies[i].RemoveItem(Spacesuit_CrimsonFleet_Backpack_2_NotPlayable)
		i = i + 1
	EndWhile
EndFunction

Function StartExteriorMonitor()
	;Then start the monitor.
	StartTimer(CONST_ExteriorMonitorTimerDelay, CONST_ExteriorMonitorTimerID)
EndFunction

Function MonitorExterior()
	if (hasCompletedExterior)
		;If CF03 has advanced to the interior of the Lock, we can stop monitoring.
	ElseIf (CF03.GetStage() >= CONST_CF03_ExteriorCompletedStage)
		;If we've set or skipped CONST_CF03_ExteriorCompletedStage (for example, by using a later quickstart), end the monitor here.
		EndExteriorMonitor()
	ElseIf (playerRef.GetCurrentLocation() != LC030LockLocation.GetLocation())
		;If the player isn't in the Lock location anymore, resume monitoring OnLocationChange back into the exterior.
		RegisterForRemoteEvent(playerRef, "OnLocationChange")
		;Also, make sure no one follows the player out of the location.
		CF03ExteriorActorsHoldNearPlayerGlobal.SetValue(0)
		;If the player isn't even on Suvorov, push the allies to their package target, as a failsafe.
		if (!playerRef.GetCurrentLocation().IsChild(SKryx_PSuvorov_Surface))
			int i = 0
			While (i < allAllies.Length)
				allAllies[i].EvaluatePackage()
				allAllies[i].MoveToPackageLocation()
				i = i + 1
			EndWhile
		EndIf
	Else
		;;Debug.Trace("LC030 MonitorExterior:")

		;If the player is closer to the entrance to the Lock than Delgado, the allies hold position around the player (a very effective catchup that uses traversals).
		;If Delgado is closer, the allies hold position around him instead.
		bool actorsHoldingNearDelgado
		if (playerRef.GetDistance(mapMarkerRef) < delgadoRef.GetDistance(mapMarkerRef))
			;;Debug.Trace("--Hold near PLAYER.")
			CF03ExteriorActorsHoldNearPlayerGlobal.SetValue(1)
		Else
			;;Debug.Trace("--Hold near DELGADO.")
			actorsHoldingNearDelgado = True
			CF03ExteriorActorsHoldNearPlayerGlobal.SetValue(0)
		EndIf

		;If Delgado is closer to the entrance to the Lock, or he's already close to the player, clear out enemies that have fallen too far behind and are now just a distraction.
		;Otherwise, don't do this yet-- Combat Hold Position is much more effective at getting the allies to catch up than any other package procedure.
		if (actorsHoldingNearDelgado || (delgadoRef.GetDistance(playerRef) < CONST_ExteriorMonitorDelgadoNearPlayerDistance))
			;;Debug.Trace("--Cleaning up...")
			MonitorCleanupDistantEnemies(ExteriorEnemiesBeyondTheLock)
			;MonitorCleanupDistantEnemies(ExteriorEnemiesWithinTheLock)
		;;Else
			;;Debug.Trace("--No Cleanup: " + actorsHoldingNearDelgado + " " + (delgadoRef.GetDistance(playerRef) < CONST_ExteriorMonitorDelgadoNearPlayerDistance))
		EndIf

		;Check all of the player's allies.
		int i = 0
		While (i < allAllies.Length)
			;If they've fallen into bleedout, heal them to keep things moving.
			if (allAllies[i].GetValue(Health) < 0)
				allAllies[i].RestoreValue(Health, Math.Abs(allAllies[i].GetValue(Health) + 10))
				;;Debug.Trace("--HEALED: " + allAllies[i])
			EndIf
			i = i + 1
		EndWhile

		;EVP everyone to update packages.
		EVPAllies()

		;And restart the timer.
		StartTimer(CONST_ExteriorMonitorTimerDelay, CONST_ExteriorMonitorTimerID)
		;;Debug.Trace("...Done")
	EndIf
EndFunction

Function MonitorCleanupDistantEnemies(RefCollectionAlias enemyCollection, bool forceCleanup=False)
	Actor[] enemies = enemyCollection.GetArray() as Actor[]
	int i = 0
	While (i < enemies.Length)
		Actor current = enemies[i]
		;Has the actor's ambush triggered?
		if ((current != None) && (current.GetValue(AmbushTriggered) > 0))
			;Is the enemy dead?
			if (current.IsDead())
				Debug.Trace("--REMOVED DEAD: " + current)
				enemyCollection.RemoveRef(current)
			ElseIf (forceCleanup || ((delgadoRef.GetDistance(current) > CONST_ExteriorMonitorDisableDistance) && (playerRef.GetDistance(current) > CONST_ExteriorMonitorDisableDistance) && (!playerRef.HasDetectionLOS(current))))
				;Is the player far enough away? Is the enemy offscreen? Then remove it.
				Debug.Trace("--DISABLED: " + current)
				enemyCollection.RemoveRef(current)
				current.DisableNoWait()
				current.Delete()
			EndIf
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function EndExteriorMonitorNoWait()
	CallFunctionNoWait("EndExteriorMonitor", None)
EndFunction

Function EndExteriorMonitor()
	hasCompletedExterior = True
	UnregisterForRemoteEvent(playerRef, "OnLocationChange")
	MonitorCleanupDistantEnemies(ExteriorEnemiesBeyondTheLock, True)
	MonitorCleanupDistantEnemies(ExteriorEnemiesWithinTheLock, True)
EndFunction

;------------------------------
;Ally Utility Functions
;-----------------------

Function SetIgnoreFriendlyHitsOnAllies(bool shouldIgnore)
	int i = 0
	While (i < allAllies.Length)
		allAllies[i].IgnoreFriendlyHits(shouldIgnore)
		i = i + 1
	EndWhile
EndFunction

Function MoveAlliesToPackageLocations()
	int i = 0
	While (i < allAllies.Length)
		allAllies[i].EvaluatePackage()
		allAllies[i].MoveToPackageLocation()
		i = i + 1
	EndWhile
EndFunction

Function EVPAllies()
	int i = 0
	While (i < allAllies.Length)
		allAllies[i].EvaluatePackage()
		i = i + 1
	EndWhile
EndFunction

Function MoveAlliesIntoLock()
	if (delgadoRef.GetParentCell() != LC030Lock01)
		delgadoRef.MoveTo(CF03DelgadoInsideLockEntranceMarkerRef)
	EndIf
	if (mathisRef.GetParentCell() != LC030Lock01)
		mathisRef.MoveTo(CF03MathisInsideLockEntranceMarkerRef)
	EndIf
	if (genericAlly01Ref.GetParentCell() != LC030Lock01)
		genericAlly01Ref.MoveTo(CF03GenericAlly01InsideLockEntranceMarkerRef)
	EndIf
	if (genericAlly02Ref.GetParentCell() != LC030Lock01)
		genericAlly02Ref.MoveTo(CF03GenericAlly02InsideLockEntranceMarkerRef)
	EndIf
	EVPAllies()
EndFunction


;------------------------------
;ID Card Reader
;---------------

Function RegisterForDelgadoUsingIDCardReader()
	;Register for the ID Card Reader being used by Delgado.
	RegisterForAnimationEvent(delgadoRef, CONST_IDCardReaderUsedEventName)
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if ((akSource == delgadoRef) && (asEventName == CONST_IDCardReaderUsedEventName))
		UnregisterForAnimationEvent(delgadoRef, CONST_IDCardReaderUsedEventName)
		CF03.SetStage(CONST_CF03_StageToSetWhenIDCardReaderUsed)
	EndIf    
EndEvent


;------------------------------
;Transfer Chamber Monitor
;-------------------------

Function StartTransferChamberMonitor()
	StartTimer(CONST_TransferChamberMonitorTimerDelay, CONST_TransferChamberMonitorTimerID)
EndFunction

Function MonitorTransferChamber()
	ObjectReference transferChamberFailsafeTriggerRef = TransferChamberFailsafeTrigger.GetRef()
	Actor[] enemies = TransferChamberEnemies_All.GetArray() as Actor[]
	int i = 0
	While (i < enemies.Length)
		Actor current = enemies[i]
		if ((current != None) && (!current.IsDead()) && transferChamberFailsafeTriggerRef.IsInTrigger(current))
			current.Kill()
			Debug.Trace("LC030 Failsafe: Force-killed " + current)
		EndIf
		i = i + 1
	EndWhile
	if (!GetStageDone(CONST_CF03_TransferChamberCompletedStage))
		StartTimer(CONST_TransferChamberMonitorTimerDelay, CONST_TransferChamberMonitorTimerID)
	EndIf
EndFunction


;------------------------------
;Collapsing Ceiling
;-------------------

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
	if (!hasCollapsedCeiling && (akTriggerRef == playerRef))
		CheckCollapsingCeiling()
	EndIf
EndEvent

Function CheckCollapsingCeiling()
	if (collapsingCeilingTriggerRef.IsInTrigger(playerRef) && CF03.GetStageDone(CONST_CF03_StageRequiredForCeilingCollapse))
		bool shouldRestartTimer = True
		if (collapsingCeilingTriggerRef.IsInTrigger(mathisRef))
			shouldRestartTimer = !TryToCollapseCeiling()
		ElseIf (!playerRef.HasDetectionLOS(mathisMoveToMarkerRef) && (!playerRef.HasDetectionLOS(mathisRef)))
			mathisRef.MoveTo(mathisMoveToMarkerRef)
			shouldRestartTimer = !TryToCollapseCeiling()
		EndIf
		if (shouldRestartTimer)
			StartTimer(CONST_CollapsingCeilingTimerDelay, CONST_CollapsingCeilingTimerID)
		EndIf
	EndIf
EndFunction

bool Function TryToCollapseCeiling()
	CollapsingCeilingCollisionPrim.TryToEnable()
	if (!collapsingCeilingTriggerRef.IsInTrigger(playerRef))
		CollapsingCeilingCollisionPrim.TryToDisable()
		return False
	Else
		CollapseCeiling()
		return True
	EndIf
EndFunction

Function CollapseCeiling(bool isForcedByQuickstart=False)
	if (!hasCollapsedCeiling)
		hasCollapsedCeiling = True
		;Block fast travel out of the Lock from this point forward.
		LC030InputLayer = InputEnableLayer.Create()
		LC030InputLayer.EnableFastTravel(False)
		CollapsingCeilingNavcutPrim.TryToEnable()
		ObjectReference collapsingCeilingRef = CollapsingCeilingActivator.GetRef()
		collapsingCeilingRef.PlayAnimation("Play01")
		QST_CF03_CeilingCollapse_Collapse.Play(collapsingCeilingRef)
		;If we aren't quickstarting, play VFX, set the next stage, and proceed.
		if (!isForcedByQuickstart)
			SetStage(CONST_StageToSetDuringCeilingCollapse)
			Game.ShakeCamera(collapsingCeilingActivatorRef, 0.5, 2)
			Utility.Wait(2)
			CollapsingCeilingCollisionPrim.TryToDisable()
		EndIf
		;Register for the player leaving the Lock via the shuttle.
		;If they do, we'll move their ship to the Key as a convenience.
		playerShipRef = PlayerShip.GetShipRef()
		RegisterForRemoteEvent(ShuttleBayShuttle.GetShipRef(), "OnLocationChange")
		RegisterForRemoteEvent(playerRef, "OnLocationChange")
		;Give your allies their boostpacks back.
		int i = 0
		While (i < allAllies.Length)
			allAllies[i].EquipItem(Spacesuit_CrimsonFleet_Backpack_1_NotPlayable)
			i = i + 1
		EndWhile
	EndIf
EndFunction

Function UnblockCollapsingWallActivation()
	loosePanelDoorRef.BlockActivation(True, False)
EndFunction


;--------------
;Fissure Area
;-------------

Function TryToStopCombatInFissure()
	Actor[] fissureEnemyRefs = FissureEnemies_All.GetArray() as Actor[]
	int i = 0
	;Debug.Trace("Trying to stop combat...")
	While (i < fissureEnemyRefs.Length)
		Actor current = fissureEnemyRefs[i]
		if ((current == None) || (current.IsDead()) || (!current.IsInCombat()))
			;Debug.Trace("--Ignored " + current)
		ElseIf ((current.HasDetectionLOS(playerRef)) || (current.HasDetectionLOS(mathisRef)) || (current.GetDistance(playerRef) < CONST_FissureEnemySafeRange))
			;Debug.Trace("--Skipped " + current)
		Else
			;Debug.Trace("--STOPPED " + current)
			current.StopCombat()
		EndIf
		i = i + 1
	EndWhile
	;Debug.Trace("...done.")
EndFunction


;--------------------
;Shuttle Bay Area
;-----------------

Function StartShuttleBayMonitor()
	StartTimer(CONST_ShuttleBayMonitorTimerDelay, CONST_ShuttleBayMonitorTimerID)
EndFunction

Function MonitorShuttleBay()
	Actor[] shuttleBayEnemies = ShuttleBayEnemies_All.GetArray() as Actor[]
	if (shuttleBayEnemies != None)
		int i = 0
		While (i < shuttleBayEnemies.Length)
			Actor current = shuttleBayEnemies[i]
			if (current != None)
				if ((!current.IsDead()) && (current.GetPositionZ() > CONST_ShuttleBayMaxZHeight))
					Debug.Trace("MonitorShuttleBay kills " + current)
					current.Kill()
				EndIf
			EndIf
			i = i + 1
		EndWhile
	EndIf
	if (!GetStageDone(650))
		StartTimer(CONST_ShuttleBayMonitorTimerDelay, CONST_ShuttleBayMonitorTimerID)
	EndIf	
EndFunction


;--------------
;Events
;-------

Event OnTimer(int timerID)
	if (timerID == CONST_ExteriorMonitorTimerID)
		MonitorExterior()
	ElseIf (timerID == CONST_TransferChamberMonitorTimerID)
		MonitorTransferChamber()
	ElseIf (timerID == CONST_CollapsingCeilingTimerID)
		CheckCollapsingCeiling()
	ElseIf (timerID == CONST_ShuttleBayMonitorTimerID)
		MonitorShuttleBay()
	EndIf
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
	if (akSource == loosePanelDoorRef)
		SetStage(CONST_StageToSetOnCollapsingWallActivated)
	EndIf
EndEvent

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
	if (!hasCompletedExterior && (akNewLoc == LC030LockLocation.GetLocation()))
		StartExteriorMonitor()
		UnregisterForRemoteEvent(playerRef, "OnLocationChange")
	ElseIf (hasCollapsedCeiling)
		if (akNewLoc == ShuttleBayShuttleLocation.GetLocation())
			;The player has entered the shuttle bay shuttle, which is expected. Do nothing.
		ElseIf (akNewLoc != LC030LockLocation.GetLocation())
			;The player has left the Lock in some other way.
			ReenableFastTravel()
		EndIf
	EndIf
EndEvent

Event SpaceshipReference.OnLocationChange(SpaceshipReference akSource, Location akOldLoc, Location akNewLoc)
	if (hasCollapsedCeiling)
		if (akSource == ShuttleBayShuttle.GetShipRef())
			;Move the player's former ship to the Key, as a convenience.
			playerShipRef.InstantUndock()
			playerShipRef.SetLinkedRef(KeyPlayerDockingPort.GetRef(), SpaceshipStoredLink)
			playerShipRef.Disable()
			playerShipRef.MoveTo(StationTheKey.GetRef())
			;Unregister for the Shuttle load event.
			UnregisterForRemoteEvent(shuttleBayShuttleRef, "OnLoad")
			;Then re-enable fast travel.
			ReenableFastTravel()
		Else
			;The player has taken off in their own ship.
			ReenableFastTravel()
		EndIf
		;Either way, remove the follower teleport block on the shuttle.
		BE_CF03_Shuttle.SetStage(20)
	EndIf
EndEvent

Function SwapOutShuttle()
	;Do nothing.
EndFunction


;------------------------------
;Cleanup & Shutdown
;-------------------

Function ReenableFastTravel()
	if (LC030InputLayer != None)
		LC030InputLayer.EnableFastTravel(True)
		LC030InputLayer.Delete()
		LC030InputLayer = None
	EndIf
	SetStage(CONST_StageToSetOnLeavingTheLock)
	UnregisterForRemoteEvent(playerRef, "OnLocationChange")
EndFunction

Function Cleanup()
	playerRef = None
	mathisRef = None
	delgadoRef = None
	genericAlly01Ref = None
	genericAlly02Ref = None
	allAllies = None
	mathisMoveToMarkerRef = None
	mapMarkerRef = None
	collapsingCeilingTriggerRef = None
	collapsingCeilingActivatorRef = None
	playerShipRef = None
	shuttleBayShuttleRef = None
	ReenableFastTravel()
EndFunction