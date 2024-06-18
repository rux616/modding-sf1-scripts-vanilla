Scriptname LC082_VigilanceQuestScript extends Quest
{Quest script for LC082. Manages the Vigilance's movement.}


Struct VigilanceLocationDatum
	String LocationName
	LocationAlias SpaceLocation
	Location ReserveOrbitLocation
	Cell SpaceCell
	ReferenceAlias EnableMarker
	ReferenceAlias MapMarker
	ReferenceAlias MoveToMarker
	ReferenceAlias TrafficManagerMarker
	int StageToSet
EndStruct


Group AutofillProperties
	SQ_PlayerShipScript property SQ_PlayerShip Auto Const Mandatory
	SQ_CrewScript property SQ_Crew Auto Const Mandatory
	LocationAlias property VigilanceInteriorLocation Auto Const Mandatory
	LocationAlias property VigilanceReservedOrbitLocation Auto Const Mandatory
	ReferenceAlias property PlayerShip Auto Const Mandatory
	ReferenceAlias property PlayerShipPilotSeat Auto Const Mandatory
	ReferenceAlias property VigilanceShip Auto Const Mandatory
	ReferenceAlias property PilotSeat Auto Const Mandatory
	RefCollectionAlias property VigilanceMainActors Auto Const Mandatory
	RefCollectionAlias property VigilanceMainActors_Protected Auto Const Mandatory
	RefCollectionAlias property VigilanceMainTurrets Auto Const Mandatory
	SpaceshipBase property DEBUG_PlayerShipCF Auto Const Mandatory
	Keyword property LC082_VigilanceTravelTargetKeyword Auto Const Mandatory
	Keyword property DisallowAsCombatTargetKeyword Auto Const Mandatory
	GlobalVariable property CF_SysDefShutdown Auto Const Mandatory
	ActorValue property DockingPermission Auto Const Mandatory
	ActorValue property ShieldHealth Auto Const Mandatory
	ActorValue property ShipSystemShieldsHealth Auto Const Mandatory
	FormList property LC088_Space_QuickstartCrewList Auto Const Mandatory
	ObjectReference property VigilanceMarkerRef Auto Const Mandatory
	ObjectReference property scDebugStartOriginMarker Auto Const Mandatory
	Message property LC082_PilotSeatNotAuthorizedMessage Auto Const Mandatory
	Quest property LC088_Space Auto Const Mandatory
	Perk property LC088_Space_VigilanceDamageImmunityPerk Auto Const Mandatory
	Potion property ShipRepairKit Auto Const Mandatory
EndGroup

VigilanceLocationDatum[] property VigilanceLocationData Auto Const Mandatory RequiresGuard(LocationDataGuard)
{List of locations the Vigilance will be, ordered from the first to the last.}

int CONST_Brig_ReleasedPrisonerStageToSet = 210 Const


;Local Variables
SpaceshipReference VigilanceShipRef
Location vigilanceInteriorLoc
ObjectReference pilotSeatRef
bool waitingForPlayerToSit

;Vigilance Location Variables
int newLocationIndex = -1
String currentLocationName
Location currentSpaceLoc
Cell currentSpaceCell
ObjectReference currentEnableMarkerRef
ObjectReference currentMoveToMarkerRef
ObjectReference currentTrafficManagerMarker
int currentStageToSet


;Local Consts
int CONST_LC082_SysDefFail = 250 Const
int CONST_LC082_SysDefFail_StartKickoutScene = 251 Const
int CONST_LC088_CFMainBattleStart = 160 Const
int CONST_LC088_SDMainBattleStart = 260 Const
int CONST_Global_SysDefShutdownTriggered = 1 Const
int CONST_DockingPermission_Neutral = 0
int CONST_DockingPermission_Never = 4 Const
int CONST_AILevelMod_Hard = 2 Const

;Guards
Guard LocationDataGuard


;----------------------------
;Initialization and Setup
;-------------------------

Event OnQuestInit()
	;Store off local variables.
	vigilanceShipRef = VigilanceShip.GetShipRef()
	vigilanceInteriorLoc = VigilanceInteriorLocation.GetLocation()
	pilotSeatRef = PilotSeat.GetRef()
	pilotSeatRef.BlockActivation(True, False)
	RegisterForRemoteEvent(pilotSeatRef, "OnActivate")
EndEvent

Function UpdateVigilanceLocation(String proposedLocationName)
	Start()
	LockGuard(LocationDataGuard)
		if (currentLocationName == proposedLocationName)
			Debug.Trace("UpdateVigilanceLocation: We were asked to update to " + proposedLocationName + " but it was already the active location. Aborting.")
		ElseIf (currentLocationName == "Shutdown")
			Debug.Trace("UpdateVigilanceLocation: We were asked to update to " + proposedLocationName + " but we've already shut down. Aborting.")
		Else
			if (newLocationIndex >= 0)
				Debug.Trace("UpdateVigilanceLocation: WARNING: We were asked to update to " + proposedLocationName + " but newLocationIndex was >= 0. A move may not have completed correctly.", 1)
			EndIf
			newLocationIndex = VigilanceLocationData.FindStruct("LocationName", proposedLocationName)
			if (newLocationIndex < 0)
				Debug.Trace("UpdateVigilanceLocation: Could not find location " + proposedLocationName + " in the VigilanceLocationData struct. Aborting.", 2)
			Else
				Private_UpdateVigilanceLocation()
			EndIf
		EndIf
	EndLockGuard
EndFunction

Function DEBUG_ForceUpdateVigilanceLocation(String proposedLocationName)
	Start()
	LockGuard(LocationDataGuard)
		newLocationIndex = VigilanceLocationData.FindStruct("LocationName", proposedLocationName)
		Private_UpdateVigilanceLocation()
	EndLockGuard
EndFunction


;------------------------------
;Vigilance Movement
;-------------------

;On request from any quest, try to move the Vigilance.
Function Private_UpdateVigilanceLocation() RequiresGuard(LocationDataGuard)
	if ((Game.GetPlayer().GetCurrentLocation() == VigilanceInteriorLoc) || ((PlayerShip.GetShipRef() != None) && (PlayerShip.GetShipRef().GetCurrentLocation() == currentSpaceLoc)))
		Debug.Trace("Private_UpdateVigilanceLocation: Delaying update because the Vigilance is loaded. The Vigilance will be moved when the player has left its location.")
		RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	ElseIf (VigilanceLocationData[newLocationIndex].LocationName == "Shutdown")
		if (LC088_Space.GetStageDone(CONST_LC088_CFMainBattleStart) || LC088_Space.GetStageDone(CONST_LC088_SDMainBattleStart))
			Debug.Trace("Private_UpdateVigilanceLocation: Shutdown Failsafe. Ignoring calls to shut down the Vigilance during and after the CF08 Main Battle.")
		Else
			Debug.Trace("Private_UpdateVigilanceLocation: Shutdown. Disabling the Vigilance and its Escorts and ignoring future calls.")
			currentLocationName = "Shutdown"
			currentSpaceLoc = None
			currentSpaceCell = None
			currentEnableMarkerRef.DisableNoWait()
			currentTrafficManagerMarker.DisableNoWait()
			currentEnableMarkerRef = None
			currentMoveToMarkerRef = None
			currentTrafficManagerMarker = None
			VigilanceShipRef.DisableNoWait()
			VigilanceReservedOrbitLocation.Clear()
		EndIf
		UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	Elseif (newLocationIndex == -1)
		Debug.Trace("Private_UpdateVigilanceLocation: Aborting move because newLocationIndex was -1. This should never occur.", -1)
	Else
		VigilanceLocationDatum newDatum = VigilanceLocationData[newLocationIndex]
		newLocationIndex = -1
		Location newLoc = newDatum.SpaceLocation.GetLocation()
		Debug.Trace("Private_UpdateVigilanceLocation: Moving Vigilance from " + currentSpaceLoc + " to " + newLoc)
		;Clean up the old location.
		if (currentSpaceLoc != None)
			currentEnableMarkerRef.Disable()
			currentTrafficManagerMarker.Disable()
		EndIf
		;Update variables to point to the new location.
		currentLocationName = newDatum.LocationName
		currentSpaceLoc = newLoc
		currentSpaceCell = newDatum.SpaceCell
		currentEnableMarkerRef = newDatum.EnableMarker.GetRef()
		currentMoveToMarkerRef = newDatum.MoveToMarker.GetRef()
		currentTrafficManagerMarker = newDatum.TrafficManagerMarker.GetRef()
		currentStageToSet = newDatum.StageToSet
		;Move the Vigilance.
		VigilanceShipRef.Disable()
		VigilanceShipRef.SetLinkedRef(currentMoveToMarkerRef, LC082_VigilanceTravelTargetKeyword)
		VigilanceShipRef.MoveTo(currentMoveToMarkerRef)
		VigilanceShipRef.EvaluatePackage(true) ;true to reset the AI and make the package aware of the new destination
		VigilanceShipRef.Enable()
		;Move the Vigilance Marker, used for testing, to the map marker heading ref.
		ObjectReference mapMarkerHeadingRef = newDatum.MapMarker.GetRef().GetLinkedRef()
		if (mapMarkerHeadingRef != None)
			VigilanceMarkerRef.MoveTo(mapMarkerHeadingRef)
		EndIf
		;Enable its escorts.
		currentEnableMarkerRef.EnableNoWait()
		;Enable its traffic manager.
		currentTrafficManagerMarker.EnableNoWait()
		;Reserve the new orbit location to prevent other quests from trying to use it.
		VigilanceReservedOrbitLocation.ForceLocationTo(newDatum.ReserveOrbitLocation)
		;Set our stage, if any.
		if (currentStageToSet)
			SetStage(currentStageToSet)
		EndIf
		;Unregister, since we've finished the move.
		UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	EndIf
EndFunction

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
	if ((akSource == Game.GetPlayer()) && (akNewLoc != vigilanceInteriorLoc) && (akNewLoc != currentSpaceLoc))
		LockGuard(LocationDataGuard)
			Private_UpdateVigilanceLocation()
		EndLockGuard
	EndIf
EndEvent


;------------------------------
;Escort Ships Toggle
;--------------------

Function SetEscortShipsEnabled(bool shouldBeEnabled)
	if (currentEnableMarkerRef != None)
		if (shouldBeEnabled)
			currentEnableMarkerRef.EnableNoWait()
		Else
			currentEnableMarkerRef.DisableNoWait()
		EndIf
	EndIf
EndFunction


;------------------------------
;SysDef Kickout
;---------------

Function ActivateTurrets()
	Actor[] vigilanceTurrets = VigilanceMainTurrets.GetArray() as Actor[]
	int i = 0
	While (i < vigilanceTurrets.Length)
		vigilanceTurrets[i].SetUnconscious(False)
		i = i + 1
	EndWhile 
EndFunction

Function SetAllowDockingWithVigilance(bool shouldAllowDocking)
	if (shouldAllowDocking)
		vigilanceShipRef.SetValue(DockingPermission, CONST_DockingPermission_Neutral)
	Else
		vigilanceShipRef.SetValue(DockingPermission, CONST_DockingPermission_Never)
	EndIf
EndFunction

Function TryToStartKickoutScene()
	SetAllowDockingWithVigilance(False)
	if ((Game.GetPlayer().GetCurrentLocation() == VigilanceInteriorLoc) || (PlayerShip.GetShipRef().IsDocked()))
		RegisterForRemoteEvent(PlayerShip, "OnShipUndock")
	ElseIf (PlayerShip.GetShipRef().GetCurrentLocation() == currentSpaceLoc)
		SetStage(CONST_LC082_SysDefFail_StartKickoutScene)
	;Else
		;We don't need to do anything; the Vigilance will be disabled offscreen without playing the scene.
	EndIf
EndFunction

Event ReferenceAlias.OnShipUndock(ReferenceAlias akShip, bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)
	if (abComplete && (akShip == PlayerShip) && GetStageDone(CONST_LC082_SysDefFail))
		UnregisterForRemoteEvent(PlayerShip, "OnShipUndock")
		SetStage(CONST_LC082_SysDefFail_StartKickoutScene)
	EndIf
EndEvent


;------------------------------
;Pilot Seat Activation
;----------------------

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
	if ((akSource == pilotSeatRef) && (akActivator == Game.GetPlayer()))
		LC082_PilotSeatNotAuthorizedMessage.Show()
	EndIf
EndEvent


;------------------------------
;CF08 Protections
;-----------------

Function ProtectVigilanceMainActors(bool shouldBeProtected)
	if (shouldBeProtected)
		VigilanceMainActors_Protected.AddRefCollection(VigilanceMainActors)
		int i = 0
		int count = VigilanceMainActors_Protected.GetCount()
		While (i < count)
			VigilanceMainActors_Protected.GetAt(i).IgnoreFriendlyHits(True)
			i = i + 1
		EndWhile
	Else
		int i = 0
		int count = VigilanceMainActors_Protected.GetCount()
		While (i < count)
			VigilanceMainActors_Protected.GetAt(i).IgnoreFriendlyHits(False)
			i = i + 1
		EndWhile
		VigilanceMainActors_Protected.RemoveAll()
	EndIf
EndFunction


;-------------------------------------
;DEBUG - Vigilance Combat Demo
;------------------------------

Function DEBUG_SetupVigilanceCombatDemo()
	;Put the player on a ship and load them into space.
	DEBUG_GoToSpaceAndWait()

	;Enable the Vigilance at the CF01 location.
	UpdateVigilanceLocation("DEBUG_CombatDemo")

	;Remove the Vigilance's invulnerability.
	VigilanceShipRef.RemovePerk(LC088_Space_VigilanceDamageImmunityPerk)
	VigilanceShipRef.RemoveKeyword(DisallowAsCombatTargetKeyword)
	VigilanceShipRef.DamageValue(ShieldHealth, 100000)
	VigilanceShipRef.DamageValue(ShipSystemShieldsHealth, 100000)
	VigilanceShipRef.SetValue(Game.GetAggressionAV(), 1)
	VigilanceShipRef.RemoveFromAllFactions()

	;Block kickout.
	SetStage(210)

	;Move the player to the Vigilance.
	PlayerShip.GetShipRef().MoveTo(VigilanceMarkerRef)
EndFunction

Function DEBUG_SetupBatteryCombatDemo()
	;Put the player on a ship and load them into space.
	DEBUG_GoToSpaceAndWait()

	;Move the player to the Vigilance's cell.
	PlayerShip.GetShipRef().MoveTo(VigilanceMarkerRef)
EndFunction

;For quickstarts, give the player a ship and crew appropriate to this battle and put them on it. Derived from GoToSpace.
Function DEBUG_GoToSpaceAndWait()
	InputEnableLayer myEnableLayer = InputEnableLayer.Create()
	myEnableLayer.DisablePlayerControls(abCamSwitch=True)
	SpaceshipReference testShip = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShipCF, aiLevelMod=CONST_AILevelMod_Hard)
	SQ_PlayerShip.ResetPlayerShip(testShip)
	SQ_PlayerShip.ResetHomeShip(testShip)
	testShip.AddItem(ShipRepairKit, 20)
	Game.GetPlayer().MoveTo(testShip)
	SQ_PlayerShip.HandleShipTakeOff()
	PlayerShipPilotSeat.GetRef().Activate(Game.GetPlayer())
	myEnableLayer.Delete()
	waitingForPlayerToSit = True
	RegisterForRemoteEvent(Game.GetPlayer(), "OnSit")
	While(waitingForPlayerToSit)
		Utility.Wait(0.5)
	EndWhile
	SQ_Crew.DebugCreateCrewFromFormlist(LC088_Space_QuickstartCrewList, True, testShip)
EndFunction

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
	waitingForPlayerToSit = False
EndEvent