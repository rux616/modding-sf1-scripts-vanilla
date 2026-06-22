Scriptname LC088_KeyQuestScript extends Quest
{Quest script for LC088_Key, the Key portion of the Crimson Fleet Final Battle.}

Group QuestProperties
	ReferenceAlias[] property OtherKeyActors Auto Const Mandatory
	WWiseEvent[] property ReactorSoundEvents Auto Const Mandatory
EndGroup

Group AutofillProperties
	Quest property LC082 Auto Const Mandatory

	LocationAlias property LC088KeyInteriorLocation Auto Const Mandatory

	ReferenceAlias property Rokov Auto Const Mandatory
	ReferenceAlias property Rokov_EnableMarker Auto Const Mandatory
	ReferenceAlias property Rokov_DisableMarker Auto Const Mandatory
	ReferenceAlias property Mathis Auto Const Mandatory
	ReferenceAlias property Mathis_EnableMarker Auto Const Mandatory
	ReferenceAlias property Mathis_DisableMarker Auto Const Mandatory
	ReferenceAlias property Naeva Auto Const Mandatory
	ReferenceAlias property Naeva_EnableMarker Auto Const Mandatory
	ReferenceAlias property Naeva_DisableMarker Auto Const Mandatory
	ReferenceAlias property Adler Auto Const Mandatory
	ReferenceAlias property Adler_EnableMarker Auto Const Mandatory
	ReferenceAlias property Adler_DisableMarker Auto Const Mandatory
	ReferenceAlias property Huan Auto Const Mandatory
	ReferenceAlias property Huan_EnableMarker Auto Const Mandatory
	ReferenceAlias property Huan_DisableMarker Auto Const Mandatory
	ReferenceAlias property Estelle Auto Const Mandatory
	ReferenceAlias property Estelle_EnableMarker Auto Const Mandatory
	ReferenceAlias property Estelle_DisableMarker Auto Const Mandatory

	ReferenceAlias property Delgado Auto Const Mandatory
	ReferenceAlias property Jasmine Auto Const Mandatory
	ReferenceAlias property Voss Auto Const Mandatory
	ReferenceAlias property Reactor01ShutdownControl Auto Const Mandatory
	ReferenceAlias property Reactor02ShutdownControl Auto Const Mandatory
	ReferenceAlias property Reactor03ShutdownControl Auto Const Mandatory
	ReferenceAlias property ReactorSoundMarkerChainHead Auto Const Mandatory
	RefCollectionAlias property Reactor01Activators Auto Const Mandatory
	RefCollectionAlias property Reactor02Activators Auto Const Mandatory
	RefCollectionAlias property Reactor03Activators Auto Const Mandatory

	RefCollectionAlias property GenericEnemiesGroup1 Auto Const Mandatory
	RefCollectionAlias property GenericEnemiesGroup2 Auto Const Mandatory
	RefCollectionAlias property GenericEnemiesGroup3 Auto Const Mandatory
	RefCollectionAlias property LoadElevators Auto Const Mandatory

	ReferenceAlias property Ops_EntryDoor Auto Const Mandatory

	Keyword property LC082_Brig_CurrentPrisonerKeyword Auto Const Mandatory
	Keyword property LC088_Key_LinkStartMarkerKeyword Auto Const Mandatory
	Keyword property LC088_Key_LinkRestraintKeyword Auto Const Mandatory
	Keyword property ActorTypeRobot Auto Const Mandatory
	Keyword property LinkCombatTravel Auto Const Mandatory
	Keyword property LinkCustom01 Auto Const Mandatory
	Keyword property LinkCustom02 Auto Const Mandatory
	Keyword property LocTypeSettlement Auto Const Mandatory

	GlobalVariable property CrimsonFleetCaptainState_Rokov Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Mathis Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Naeva Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Adler Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Huan Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Estelle Auto Const Mandatory

	Cell property StationTheKeyShipInterior Auto Const Mandatory
	Cell property StationTheKeyInterior Auto Const Mandatory
	ActorValue property Aggression Auto Const Mandatory
	ActorValue property Confidence Auto Const Mandatory
	Explosion property ChestBombExplosion Auto Const Mandatory
	MusicType property MUSGenesisCombatBoss_CF08VigilanceAndKey Auto Const Mandatory
	MusicType property MUSGenesisCombatBoss_Key Auto Const Mandatory
	Location property TheKeyInteriorLocation Auto Const Mandatory
	Faction property PlayerFaction Auto Const Mandatory
	Faction property PlayerFriendFaction Auto Const Mandatory
	Faction property CrimeFactionCrimsonFleet Auto Const Mandatory
	Faction property UCSysDefFaction Auto Const Mandatory
	Faction property CrimeFactionAdlerKemp Auto Const Mandatory
	Message property LC088_Key_EmergencyShutdownNotRespondingMessage Auto Const Mandatory

	WwiseEvent property QST_CF08_Reactor_01_Overload Auto Const Mandatory
	WwiseEvent property QST_CF08_Reactor_01_Normal Auto Const Mandatory
	WwiseEvent property QST_CF08_Reactor_02_Overload Auto Const Mandatory
	WwiseEvent property QST_CF08_Reactor_02_Normal Auto Const Mandatory
	WwiseEvent property QST_CF08_Reactor_03_Overload Auto Const Mandatory
	WwiseEvent property QST_CF08_Reactor_03_Normal Auto Const Mandatory
	WWiseEvent property QST_CF08_Reactor_OverloadAlarm Auto Const Mandatory

	WwiseEvent property QST_CF08_Voss_Bomb_Tick_Normal Auto Const Mandatory
	WwiseEvent property QST_CF08_Voss_Bomb_Tick_Urgent Auto Const Mandatory
	WwiseEvent property QST_CF08_Voss_Bomb_Detonate Auto Const Mandatory
EndGroup

;Events
CustomEvent LC088ReactorStateChangeEvent


;Local Variables
Actor player
Actor vossRef
int vossBombTickNormalID
int vossBombTickUrgentID
bool vossBombExploded
int reactorOverloadID
ObjectReference Reactor01ShutdownControlRef
ObjectReference Reactor02ShutdownControlRef
ObjectReference Reactor03ShutdownControlRef
ObjectReference[] ReactorSoundMarkerRefs
InputEnableLayer keyInputLayer


;Local Consts
;Standard values for the CF Captain State globals.
int CONST_CaptainState_Active = 0 Const
int CONST_CaptainState_Inactive = 1 Const
int CONST_CaptainState_Dead = 2 Const
int CONST_CaptainState_Imprisoned = 3 Const
int CONST_CaptainState_Freed = 4 Const

;Flag stages that indicate whether a given captain's event is active.
int CONST_CaptainActiveStage_Rokov = 13 Const
int CONST_CaptainActiveStage_Mathis = 14 Const
int CONST_CaptainActiveStage_Naeva = 15 Const
int CONST_CaptainActiveStage_Adler = 16 Const
int CONST_CaptainActiveStage_Huan = 17 Const
int CONST_CaptainActiveStage_Estelle = 18 Const

int CONST_Aggression_Unaggressive = 0 Const
int CONST_Aggression_Aggressive = 1 Const
int CONST_Confidence_Cowardly = 0 Const
int CONST_Confidence_Foolhardy = 4 Const
int CONST_LockLevelTerminalOnly = 253 Const

int property CONST_ReactorState_Active = 0 Auto Const Hidden
int property CONST_ReactorState_Inactive = 1 Auto Const Hidden
int property CONST_ReactorState_Destroyed = 2 Auto Const Hidden

int CONST_ReactorBattleStartStage = 700 Const
int CONST_ReactorOverride01Stage = 790 Const
int CONST_ReactorOverride02Stage = 890 Const
int CONST_ReactorOverride03Stage = 990 Const
int CONST_CompleteStage = 1100 Const

int CONST_DoorToVossOpenedStage = 390 Const
int CONST_VossBombArmedStage = 420 Const
int CONST_VossBombExplodedStage = 480 Const
int CONST_VossOpensDoorsStage = 490 Const
int CONST_VossBombExplodedDelay = 4 Const
int CONST_VossBombDisarmedStage = 19 Const


;------------------------------------
;Initialization & Setup
;-----------------------

Event OnQuestInit()
	;Store off local variables.
	player = Game.GetPlayer()
	vossRef = Voss.GetActorRef()
	keyInputLayer = InputEnableLayer.Create()
	Reactor01ShutdownControlRef = Reactor01ShutdownControl.GetRef()
	Reactor02ShutdownControlRef = Reactor02ShutdownControl.GetRef()
	Reactor03ShutdownControlRef = Reactor03ShutdownControl.GetRef()
	ObjectReference ReactorSoundMarkerChainHeadRef = ReactorSoundMarkerChainHead.GetRef()
	ReactorSoundMarkerRefs = ReactorSoundMarkerChainHeadRef.GetLinkedRefChain()
	ReactorSoundMarkerRefs.Insert(ReactorSoundMarkerChainHeadRef, 0)
	;Clear ownership on The Key. Looting items here is no longer theft.
	StationTheKeyShipInterior.SetFactionOwner(PlayerFaction)
	StationTheKeyInterior.SetFactionOwner(PlayerFaction)
	;Remove the settlement keyword to prevent Companions from opposing combat here.
	LC088KeyInteriorLocation.GetLocation().RemoveKeyword(LocTypeSettlement)

	;Register for events.
	RegisterForRemoteEvent(player, "OnLocationChange")
	RegisterForRemoteEvent(vossRef, "OnLoad")
	RegisterForRemoteEvent(vossRef, "OnDying")
	RegisterForRemoteEvent(Reactor01ShutdownControlRef, "OnActivate")
	RegisterForRemoteEvent(Reactor02ShutdownControlRef, "OnActivate")
	RegisterForRemoteEvent(Reactor03ShutdownControlRef, "OnActivate")
EndEvent


;Set up the Captain events.
Function SetupAllCaptainEvents()
	SetupCaptainEvent(CrimsonFleetCaptainState_Rokov.GetValueInt(), CONST_CaptainActiveStage_Rokov, Rokov)
	SetupCaptainEvent(CrimsonFleetCaptainState_Mathis.GetValueInt(), CONST_CaptainActiveStage_Mathis, Mathis)
	SetupCaptainEvent(CrimsonFleetCaptainState_Adler.GetValueInt(), CONST_CaptainActiveStage_Adler, Adler)
	SetupCaptainEvent(CrimsonFleetCaptainState_Huan.GetValueInt(), CONST_CaptainActiveStage_Huan, Huan)
	SetupCaptainEvent(CrimsonFleetCaptainState_Estelle.GetValueInt(), CONST_CaptainActiveStage_Estelle, Estelle)

	;As a special case, remove Adler from his unique crime faction.
	int adlerState = CrimsonFleetCaptainState_Adler.GetValueInt()
	if (adlerState == CONST_CaptainState_Active)
		Adler.GetActorRef().RemoveFromFaction(CrimeFactionAdlerKemp)
	EndIf
	;As a special case, Naeva is always absent. She 'survives' and shows up in a postquest SE.
	Naeva.TryToDisable()
	SetupCaptainEvent(CONST_CaptainState_Inactive, CONST_CaptainActiveStage_Naeva, Naeva)
EndFunction

Function SetupCaptainEvent(int captainState, int captainActiveStage, ReferenceAlias captainAlias)
	Actor captainRef = captainAlias.GetActorRef()
	if (captainState == CONST_CaptainState_Active)
		SetupKeyActor(captainRef)
		SetStage(captainActiveStage)
	Else
		captainAlias.Clear()
		if (!captainRef.IsDead())
			captainRef.EvaluatePackage()
			captainRef.MoveToPackageLocation()
		EndIf
	EndIf
EndFunction


;Set up other named actors on the Key.
Function SetupOtherActors()
	int i = 0
	While (i < OtherKeyActors.Length)
		SetUpKeyActor(OtherKeyActors[i].GetActorRef())
		i = i + 1
	EndWhile
	;Delgado starts non-hostile.
	Delgado.GetActorRef().AddToFaction(PlayerFriendFaction)
EndFunction


;Set up generic enemies on the Key, organized into groups based on placement (Pre-Voss, Post-Voss, Reactor Area).
Function SetupAllEnemyGroups()
	SetupEnemyGroup(GenericEnemiesGroup1)
	SetupEnemyGroup(GenericEnemiesGroup2)
	SetupEnemyGroup(GenericEnemiesGroup3)
EndFunction

Function SetupEnemyGroup(RefCollectionAlias enemyGroup)
	int i = 0
	int count = enemyGroup.GetCount()
	While (i < count)
		SetupKeyActor(enemyGroup.GetAt(i) as Actor)
		i = i + 1
	EndWhile
EndFunction


;Set up the actor.
Function SetupKeyActor(Actor keyActor)
	if (keyActor != None)
		keyActor.Reset()
		keyActor.SetProtected(False)
		keyActor.SetEssential(False)
		keyActor.SetGhost(False)
		keyActor.SetValue(Game.GetInvulnerableAV(), 0)
		keyActor.IgnoreFriendlyHits(False)
		keyActor.RemoveFromAllFactions()
		keyActor.AddToFaction(CrimeFactionCrimsonFleet)
		if (keyActor.GetValue(Aggression) < CONST_Aggression_Aggressive)
			keyActor.SetValue(Aggression, CONST_Aggression_Aggressive)
		EndIf
		keyActor.SetValue(Confidence, CONST_Confidence_Foolhardy)
		;Move the actor to their LC088 Start Marker (LC088_Key_LinkStartMarkerKeyword), if any.
		ObjectReference startMarker = keyActor.GetLinkedRef(LC088_Key_LinkStartMarkerKeyword)
		if (startMarker == None)
			keyActor.MoveToMyEditorLocation()
		Else
			keyActor.MoveTo(startMarker)
		EndIf
		keyActor.DisableNoWait()
	EndIf
EndFunction


;Set up the Key's reactors.
Function SetupReactors(RefCollectionAlias reactorCollection, int reactorID)
	LC088_KeyReactorScript[] reactors = reactorCollection.GetArray() as LC088_KeyReactorScript[]
	int i = 0
	While (i < reactors.Length)
		if (reactors[i] != None)
			reactors[i].RegisterForReactorEvent(reactorID)
		EndIf
		i = i + 1
	EndWhile
EndFunction



;------------------------------------
;Enabling, Disabling, & Surrendering
;------------------------------------

;Enable a group of generic enemies, and the Captains or Named NPCs in their section.
Function EnableEnemyGroup(int enemyGroup)
	if (enemyGroup == 1)
		GenericEnemiesGroup1.EnableAll()
		TryToEnableCaptain(Mathis, Mathis_EnableMarker, Mathis_DisableMarker)
		Jasmine.TryToEnableNoWait()
		if (!vossBombExploded)
			Voss.TryToEnableNoWait()
		EndIf
	ElseIf (enemyGroup == 2)
		GenericEnemiesGroup2.EnableAll()
		TryToEnableCaptain(Rokov, Rokov_EnableMarker, Rokov_DisableMarker)
		TryToEnableCaptain(Adler, Adler_EnableMarker, Adler_DisableMarker)
	ElseIf (enemyGroup == 3)
		GenericEnemiesGroup3.EnableAll()
		TryToEnableCaptain(Huan, Huan_EnableMarker, Huan_DisableMarker)
		TryToEnableCaptain(Estelle, Estelle_EnableMarker, Estelle_DisableMarker)
	EndIf
EndFunction

;Disable a group of generic enemies, and the Captains or Named NPCs in their section.
Function DisableEnemyGroup(int enemyGroup)
	if (enemyGroup == 1)
		GenericEnemiesGroup1.DisableAll()
		TryToDisableCaptain(Mathis, Mathis_EnableMarker, Mathis_DisableMarker)
		Jasmine.TryToDisableNoWait()
		Voss.TryToDisableNoWait()
	ElseIf (enemyGroup == 2)
		GenericEnemiesGroup2.DisableAll()
		TryToDisableCaptain(Rokov, Rokov_EnableMarker, Rokov_DisableMarker)
		TryToDisableCaptain(Adler, Adler_EnableMarker, Adler_DisableMarker)
	ElseIf (enemyGroup == 3)
		GenericEnemiesGroup3.DisableAll()
		TryToDisableCaptain(Huan, Huan_EnableMarker, Huan_DisableMarker)
		TryToDisableCaptain(Estelle, Estelle_EnableMarker, Estelle_DisableMarker)
	EndIf
EndFunction

;Enable a Captain and the associated markers.
Function TryToEnableCaptain(ReferenceAlias captainAlias, ReferenceAlias captainEnableMarkerAlias, ReferenceAlias captainDisableMarkerAlias)
	Actor captainRef = captainAlias.GetActorRef()
	if (captainRef != None)
		captainRef.EnableNoWait()
		captainEnableMarkerAlias.TryToEnableNoWait()
		captainDisableMarkerAlias.TryToDisableNoWait()
	Else
		captainEnableMarkerAlias.TryToDisableNoWait()
		captainDisableMarkerAlias.TryToEnableNoWait()
	EndIf
EndFunction

;Disable a Captain and the associated markers.
Function TryToDisableCaptain(ReferenceAlias captainAlias, ReferenceAlias captainEnableMarkerAlias, ReferenceAlias captainDisableMarkerAlias)
	captainAlias.TryToDisableNoWait()
	captainEnableMarkerAlias.TryToDisableNoWait()
	captainDisableMarkerAlias.TryToDisableNoWait()
EndFunction


;------------------------------------
;Quest Functions & Events
;-------------------------

;Enable or disable the elevators on the Key.
Function SetElevatorsLockedDown(bool shouldBeLockedDown)
	int i = 0
	int count = LoadElevators.GetCount()
	While (i < count)
		(LoadElevators.GetAt(i) as LoadElevatorFloorScript).SetAccessible(!shouldBeLockedDown)
		i = i + 1
	EndWhile
EndFunction

;Open a RefCollection of doors.
Function OpenDoorCollection(RefCollectionAlias doorCollection)
	int i = 0
	int count = doorCollection.GetCount()
	While (i < count)
		doorCollection.GetAt(i).SetOpen(True)
		i = i + 1
	EndWhile
EndFunction

Function SetupOpsEntryDoor()
	ObjectReference opsEntryDoorRef = Ops_EntryDoor.GetRef()
	opsEntryDoorRef.BlockActivation(True, False)
EndFunction

Function SealOpsEntryDoor()
	ObjectReference opsEntryDoorRef = Ops_EntryDoor.GetRef()
	opsEntryDoorRef.BlockActivation(False, False)
	opsEntryDoorRef.Lock()
	opsEntryDoorRef.SetLockLevel(CONST_LockLevelTerminalOnly)
EndFunction

Function OpenOpsEntryDoor()
	ObjectReference opsEntryDoorRef = Ops_EntryDoor.GetRef()
	opsEntryDoorRef.BlockActivation(False, False)
	opsEntryDoorRef.Unlock()
	opsEntryDoorRef.SetOpen(True)
EndFunction

Function LockPlayerControls(bool shouldLock)
	if (shouldLock)
		keyInputLayer.DisablePlayerControls()
	Else
		keyInputLayer.EnablePlayerControls()
	EndIf
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSource)
	if ((akSource == vossRef) && (vossBombTickNormalID == 0) && GetStageDone(CONST_DoorToVossOpenedStage) && !GetStageDone(CONST_VossBombExplodedStage) && !GetStageDone(CONST_VossBombDisarmedStage))
		vossBombTickNormalID = QST_CF08_Voss_Bomb_Tick_Normal.Play(vossRef)
	EndIf
EndEvent

Event Actor.OnDying(Actor akSource, ObjectReference akKiller)
	if ((akSource == vossRef) && !GetStageDone(CONST_VossBombDisarmedStage))
		VossBombDetonate()
	EndIf
EndEvent

Function VossBombDetonate()
	vossBombExploded = True
	QST_CF08_Voss_Bomb_Detonate.Play(vossRef)
	vossRef.PlaceAtMe(ChestBombExplosion)
	Utility.Wait(0.25)
	vossRef.DisableNoWait()
	Utility.Wait(CONST_VossBombExplodedDelay)
	SetStage(CONST_VossBombExplodedStage)
EndFunction

Function VossBombArmed()
	if (!vossBombExploded)
		vossBombTickUrgentID = QST_CF08_Voss_Bomb_Tick_Urgent.Play(vossRef)
	EndIf
EndFunction

Function VossBombTickStop()
	WWiseEvent.StopInstance(vossBombTickNormalID)
	WWiseEvent.StopInstance(vossBombTickUrgentID)
EndFunction

Function VossWaitForSit()
	RegisterForRemoteEvent(vossRef, "OnSit")
EndFunction

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
	SetStage(CONST_VossOpensDoorsStage)
EndEvent



;------------------------------------
;Reactor Room Boss Battle
;-------------------------

;Set up the Reactor Battle.
;Called during Delgado's scene. Enemies not in the Reactor area are disabled to prevent interferance.
Function SetupReactorBattleNoWait()
	;Set up enemy groups.
	Var[] akArgs = new Var[1]
	akArgs[0] = 1
	CallFunctionNoWait("DisableEnemyGroup", akArgs)
	akArgs[0] = 2
	CallFunctionNoWait("DisableEnemyGroup", akArgs)
	akArgs[0] = 3
	CallFunctionNoWait("EnableEnemyGroup", akArgs)
	;Set up the reactors.
	SetupReactors(Reactor01Activators, 1)
	SetupReactors(Reactor02Activators, 2)
	SetupReactors(Reactor03Activators, 3)
EndFunction

;Abort the reactor battle if the player convinces Delgado to stand down.
Function AbortReactorBattleNoWait()
	;Shut down the Reactor enemy group.
	Var[] akArgs = new Var[1]
	akArgs[0] = 3
	CallFunctionNoWait("DisableEnemyGroup", akArgs)
EndFunction

;Begin the Reactor Battle.
Function StartReactorBattle()
	;Block fast-travel out of the sealed boss area.
	StationTheKeyInterior.EnableFastTravel(False)
	;Switch the music.
	MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
	MUSGenesisCombatBoss_Key.Add()
	;Start the Reactor Overload alarm.
	reactorOverloadID = QST_CF08_Reactor_OverloadAlarm.Play(ReactorSoundMarkerRefs[2])
	;Set the reactors to red.
	SetReactorState(1, CONST_ReactorState_Inactive)
	SetReactorState(2, CONST_ReactorState_Inactive)
	SetReactorState(3, CONST_ReactorState_Inactive)
	;Set Delgado hostile and block activation on him.
	Actor delgadoRef = Delgado.GetActorRef()
	delgadoRef.RemoveFromFaction(PlayerFriendFaction)
	delgadoRef.BlockActivation(True, True)
EndFunction

;Clean up after the Reactor Battle.
Function EndReactorBattleNoWait()
	;Allow fast travel in the cell again.
	StationTheKeyInterior.EnableFastTravel(True)
	;End the boss music.
	MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
	MUSGenesisCombatBoss_Key.Remove()
	;Stop the Reactor Overload alarm.
	WWiseEvent.StopInstance(reactorOverloadID)
	;And re-enable the enemy groups disabled earlier.
	Var[] akArgs = new Var[1]
	akArgs[0] = 1
	CallFunctionNoWait("EnableEnemyGroup", akArgs)
	akArgs[0] = 2
	CallFunctionNoWait("EnableEnemyGroup", akArgs)
EndFunction

Function EndReactorBattleAndWait()
	;Allow fast travel in the cell again.
	StationTheKeyInterior.EnableFastTravel(True)
	;End the boss music.
	MUSGenesisCombatBoss_Key.Remove()
	;Stop the Reactor Overload alarm.
	WWiseEvent.StopInstance(reactorOverloadID)
	;And re-enable the enemy groups disabled earlier.
	Var[] akArgs = new Var[1]
	akArgs[0] = 1
	CallFunction("EnableEnemyGroup", akArgs)
	akArgs[0] = 2
	CallFunction("EnableEnemyGroup", akArgs)
EndFunction	

;Activation event handling.
Auto State Waiting
	Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
		GotoState("Busy")
		int currentStage = GetStage()
		if (akSource == Reactor01ShutdownControlRef)
			if ((currentStage >= CONST_ReactorBattleStartStage) && (currentStage < CONST_ReactorOverride01Stage))
				Reactor01ShutdownControlRef.BlockActivation(True, False)
				(Reactor01ShutdownControlRef as GenericSwitchScript).SetColor("Blue")
				SetStage(CONST_ReactorOverride01Stage)
			Else
				LC088_Key_EmergencyShutdownNotRespondingMessage.Show()
			EndIf
		ElseIf (akSource == Reactor02ShutdownControlRef)
			if ((currentStage >= CONST_ReactorBattleStartStage) && (currentStage < CONST_ReactorOverride02Stage))
				Reactor02ShutdownControlRef.BlockActivation(True, False)
				(Reactor02ShutdownControlRef as GenericSwitchScript).SetColor("Blue")
				SetStage(CONST_ReactorOverride02Stage)
			Else
				LC088_Key_EmergencyShutdownNotRespondingMessage.Show()
			EndIf
		ElseIf (akSource == Reactor03ShutdownControlRef)
			if ((currentStage >= CONST_ReactorBattleStartStage) && (currentStage < CONST_ReactorOverride03Stage))
				Reactor03ShutdownControlRef.BlockActivation(True, False)
				(Reactor03ShutdownControlRef as GenericSwitchScript).SetColor("Blue")
				SetStage(CONST_ReactorOverride03Stage)
				;Unblock activation on Delgado once all three reactors have been shut down and he emerges to fight.
				Delgado.GetActorRef().BlockActivation(False, False)
			Else
				LC088_Key_EmergencyShutdownNotRespondingMessage.Show()
			EndIf
		EndIf
		GotoState("Waiting")
	EndEvent
EndState

State Busy
	Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
	EndEvent
EndState

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
EndEvent


;Change the state of the specified reactor.
Function SetReactorState(int reactorID, int reactorState)
	;Set its animation state.
	Var[] akArgs = new Var[2]
	akArgs[0] = reactorID
	akArgs[1] = reactorState
	SendCustomEvent("LC088ReactorStateChangeEvent", akArgs)
	;And update its SFX.
	ObjectReference reactorSoundMarker = ReactorSoundMarkerRefs[reactorID]
	int reactorSoundIndex = ((reactorID-1) * 3) + reactorState
	WwiseEvent reactorSound = ReactorSoundEvents[reactorSoundIndex]
	reactorSound.Play(reactorSoundMarker)
	if ((reactorID == 3) && (reactorState == CONST_ReactorState_Active))
		;Stop the Reactor Overload alarm.
		WWiseEvent.StopInstance(reactorOverloadID)
	EndIf
EndFunction

;Just as an additional safety, when the player leaves the Key, and when the quest shuts down, make absolutely sure the
;boss battle music is removed.
Event Actor.OnLocationChange(Actor source, Location akOldLoc, Location akNewLoc)
	if ((akNewLoc == TheKeyInteriorLocation) && (!GetStageDone(CONST_CompleteStage)))
		MUSGenesisCombatBoss_CF08VigilanceAndKey.Add()
	ElseIf (akOldLoc == TheKeyInteriorLocation)
		MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
		MUSGenesisCombatBoss_Key.Remove()
	EndIf
EndEvent

Event OnQuestShutdown()
	MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
	MUSGenesisCombatBoss_Key.Remove()
EndEvent


;------------------------------------
;Cleanup
;-----------------------

Function Cleanup()
	;Clean up variables.
	player = None
	vossRef = None
	Reactor01ShutdownControlRef = None
	Reactor02ShutdownControlRef = None
	Reactor03ShutdownControlRef = None
	ReactorSoundMarkerRefs = None
	if (keyInputLayer != None)
		keyInputLayer.Delete()
	EndIf

	;Clean up the Captains.
	CleanupCaptain(CrimsonFleetCaptainState_Rokov, Rokov)
	CleanupCaptain(CrimsonFleetCaptainState_Mathis, Mathis)
	CleanupCaptain(CrimsonFleetCaptainState_Adler, Adler)
	CleanupCaptain(CrimsonFleetCaptainState_Huan, Huan)
	CleanupCaptain(CrimsonFleetCaptainState_Estelle, Estelle)
	Rokov_EnableMarker.TryToDisableNoWait()
	Rokov_DisableMarker.TryToDisableNoWait()
	Mathis_EnableMarker.TryToDisableNoWait()
	Mathis_DisableMarker.TryToDisableNoWait()
	Naeva_EnableMarker.TryToDisableNoWait()
	Naeva_DisableMarker.TryToDisableNoWait()
	Adler_EnableMarker.TryToDisableNoWait()
	Adler_DisableMarker.TryToDisableNoWait()
	Huan_EnableMarker.TryToDisableNoWait()
	Huan_DisableMarker.TryToDisableNoWait()
	Estelle_EnableMarker.TryToDisableNoWait()
	Estelle_DisableMarker.TryToDisableNoWait()

	;Imprison Delgado, if he survived.
	Actor delgadoRef = Delgado.GetActorRef()
	if (!delgadoRef.IsDead())
		(LC082 as LC082_BrigQuestScript).AddPrisoner(delgadoRef)
	EndIf

	;Disable Voss and Jazz, if they survived.
	Voss.TryToDisableNoWait()
	Jasmine.TryToDisableNoWait()

	;Then clean up everyone else.
	GenericEnemiesGroup1.DisableAll()
	GenericEnemiesGroup2.DisableAll()
	GenericEnemiesGroup3.DisableAll()
EndFunction

;Shut down the Captain events. All Captains who were active are now considered dead.
Function CleanupCaptain(GlobalVariable captainStateGlobal, ReferenceAlias captainAlias)
	Actor captainRef = captainAlias.GetActorRef()
	int captainState = captainStateGlobal.GetValueInt()
	if (captainState == CONST_CaptainState_Active)
		captainStateGlobal.SetValue(CONST_CaptainState_Dead)
		captainRef.DisableNoWait()
	EndIf
EndFunction