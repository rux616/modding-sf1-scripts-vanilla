Scriptname LC107QuestScript extends Quest
{Quest script for LC107, The Legacy.}

;Data for the Escape Sequence Explosion System.
Struct AmbientExplosionDatum
	int ExplosionSizeMin
	{Min index into HullBreachExplosions.}
	int ExplosionSizeMax
	{Max index into HullBreachExplosions.}
	float ExplosionDelayMin
	{Min delay between explosions.}
	float ExplosionDelayMax
	{Max delay between explosions.}
EndStruct

Group QuestData
	AmbientExplosionDatum[] property AmbientExplosionData Auto Mandatory ;NOT Const
	{Array of ambient explosion data to use during the escape sequence.}

	SQ_ParentScript:ActorValueDatum[] property ErebosActorValuesToDamage Auto Const Mandatory
	{Array of actor values to damage on the Erebos.}

	Explosion[] property HullBreachExplosions Auto Const Mandatory
	{Explosions to use during the escape sequence.}

	SpaceshipBase property DEBUG_PlayerShip Auto Const Mandatory
	{For quickstarts, the ship to place the player in.}
EndGroup

Group AutofillProperties
	SQ_ParentScript property SQ_Parent Auto Const Mandatory
	SQ_CrewScript property SQ_Crew Auto Const Mandatory
	SQ_PlayerShipScript property SQ_PlayerShip Auto Const Mandatory

	LocationAlias property LC107LegacyShipLocation Auto Const Mandatory

	ReferenceAlias property PlayerShip Auto Const Mandatory
	ReferenceAlias property PlayerShipPilotSeat Auto Const Mandatory

	ReferenceAlias property LegacyShip Auto Const Mandatory
	ReferenceAlias property ErebosShip Auto Const Mandatory
	RefCollectionAlias property SpaceCellShips Auto Const Mandatory

	ReferenceAlias property Companion Auto Const Mandatory
	ReferenceAlias property CrimsonFleetAliasContainer Auto Const Mandatory
	ReferenceAlias property CaptainTransferModule Auto Const Mandatory
	ReferenceAlias property JasperKryxTransferModule Auto Const Mandatory
	ReferenceAlias property DataCoreEmpty Auto Const Mandatory
	ReferenceAlias property DataCoreFull Auto Const Mandatory

	ReferenceAlias property VaultEntranceControl Auto Const Mandatory

	ReferenceAlias property VaultPowerSwitch01 Auto Const Mandatory
	ReferenceAlias property VaultPowerSwitch02 Auto Const Mandatory
	ReferenceAlias property VaultPowerSwitch01Light Auto Const Mandatory
	ReferenceAlias property VaultPowerSwitch02Light Auto Const Mandatory
	ReferenceAlias property VaultControlsStatusIndicator Auto Const Mandatory
	ReferenceAlias property VaultControlsTransferModuleSlot01 Auto Const Mandatory
	ReferenceAlias property VaultControlsTransferModuleSlot02 Auto Const Mandatory
	ReferenceAlias property VaultControlsDataCoreSlot Auto Const Mandatory
	ReferenceAlias property VaultControlsDownloadControl Auto Const Mandatory

	ReferenceAlias property VaultCredTankManager Auto Const Mandatory

	RefCollectionAlias property StandardCredTanks Auto Const Mandatory

	RefCollectionAlias property HullBreachesAll Auto Const Mandatory
	RefCollectionAlias property HullBreachesInstantBreak Auto Const Mandatory
	RefCollectionAlias property HullBreachesInstantBreakVault Auto Const Mandatory
	RefCollectionAlias property HullBreachTriggers Auto Const Mandatory
	RefCollectionAlias property DestructibleTraps Auto Const Mandatory

	Message property LC107_GalbankControlConsoleNeedsPowerMessage Auto Const Mandatory
	Message property LC107_GalbankTransferModuleLockedMessage Auto Const Mandatory
	Message property LC107_GalbankTransferModuleNeededMessage Auto Const Mandatory
	Message property LC107_GalbankDataCorePortNeedsTransferModulesMessage Auto Const Mandatory
	Message property LC107_GalbankDownloadControlNeedsDataCoreMessage Auto Const Mandatory
	Message property LC107_DataCoreLockedMessage Auto Const Mandatory

	GlobalVariable property LC107CredTankShelvesCurrentGlobal Auto Const Mandatory
	GlobalVariable property LC107CredTankShelvesTotalGlobal Auto Const Mandatory
	GlobalVariable property LC107VaultInstantBreachesCurrentGlobal Auto Const Mandatory

	Scene Property CF07_zLegacy001_Callout_NoTransferModule Mandatory Const Auto
	Scene Property CF07_zLegacy003_Callout_ConsoleLowPower Mandatory Const Auto
	Scene Property CF07_zLegacy007_Evacuate_HullBreach Auto Const Mandatory

	ImageSpaceModifier property HoldAtBlackImod Auto Const Mandatory
	Key property CF_GalbankTransferModule Auto Const Mandatory
	Cell Property LC107Legacy01 Auto Const Mandatory
	Keyword property ENV_Loc_NotSealedEnvironment Auto Const Mandatory
	Static property XMarkerHeading Auto Const Mandatory
	ActorValue property Health Auto Const Mandatory
	ActorValue property CF05_ComSpike_AV Auto Const Mandatory
	ActorValue property CF06_ConductionGrid_AV Auto Const Mandatory
	Perk property Skill_Piloting Auto Const Mandatory
	Potion property ShipRepairKit Auto Const Mandatory
	Formlist property LC088_Space_QuickstartCrewList Auto Const Mandatory
	ObjectReference property scDebugStartOriginMarker Auto Const Mandatory

	WWiseEvent property QST_CF07_Power_Half Auto Const Mandatory
	WWiseEvent property QST_CF07_Power_Full Auto Const Mandatory
	WWiseEvent property QST_CF07_ServerRoom_Activate Auto Const Mandatory
	WWiseEvent property QST_CF07_ServerRoom_Deactivate Auto Const Mandatory
	WWiseEvent property QST_CF07_Data_Transfer_LP_Start Auto Const Mandatory
	WWiseEvent property QST_CF07_Data_Transfer_LP_Stop Auto Const Mandatory
	WWiseEvent property WwiseEvent_QST_CF07_TakeModule Auto Const Mandatory
EndGroup


;Local hidden properties.
int property CONST_ReactorState_Active = 0 Auto Hidden Const
int property CONST_ReactorState_Inactive = 1 Auto Hidden Const
int property CONST_ReactorState_Destroyed = 2 Auto Hidden Const

int property CONST_VaultControlsPowerStatus_Reset = 0 Auto Hidden Const
int property CONST_VaultControlsPowerStatus_HalfPower = 1 Auto Hidden Const
int property CONST_VaultControlsPowerStatus_Powered = 2 Auto Hidden Const
int property CONST_VaultControlsPowerStatus_ReadyForDataCoreInsert = 3 Auto Hidden Const
int property CONST_VaultControlsPowerStatus_DownloadFinished = 4 Auto Hidden Const
int property CONST_VaultControlsPowerStatus_ReadyForDataCoreRemoval = 5 Auto Hidden Const
int property CONST_VaultControlsPowerStatus_Shutdown = 6 Auto Hidden Const


;Local Consts - Stages
int CONST_LegacyShipAccessibleStage = 20 Const
int CONST_LegacyShipArrivalStage = 100 Const
int CONST_LegacyShipMidwayStage = 150 Const
int CONST_LegacyShipDiscoveryStage = 170 Const
int CONST_LegacyShipMapMarkerRevealStage = 172 Const
int CONST_LegacyShipDockedStage = 190 Const

int CONST_OpenVaultEntranceDoorStage = 240 Const

int CONST_VaultPowerSwitch01ReroutedStage = 331 Const
int CONST_VaultPowerSwitch02ReroutedStage = 332 Const
int CONST_VaultPowerReroutedStage = 333 Const

int CONST_VaultTransferModule01InsertedStage = 340 Const
int CONST_VaultTransferModule02InsertedStage = 341 Const
int CONST_VaultTransferModulesInsertedStage = 342 Const
int CONST_VaultDataCoreInsertedStage = 343 Const
int CONST_VaultDownloadControlActivatedStage = 345 Const

int CONST_VaultDataTransferCompleteStage = 360 Const

int CONST_VaultTransferModule01RemovedStage = 370 Const
int CONST_VaultTransferModule02RemovedStage = 371 Const
int CONST_VaultDataCoreReadyForRemovalStage = 373 Const
int CONST_VaultDataCoreRemovedStage = 374 Const

int CONST_LegacyEscapeCompleteStage = 1000 Const


;Local Consts - Space
int CONST_AILevelMod_Hard = 2 Const
int CONST_LegacyShipMidwayDistance = 3250 Const
int CONST_LegacyShipDiscoveryDistance = 1500 Const


;Local Consts - Animation Data
float CONST_DataCorePopupDelay = 2.0 Const
float CONST_CredTankDrainPercentMax = 0.94 Const


;Local Consts - Ambient Explosions & Evacuation Scene
int CONST_BreachSequenceExplosionTimerID = 1 Const
float CONST_BreachSequenceRumblePowerMin = 0.5 Const
float CONST_BreachSequenceRumblePowerMax = 1.0 Const
float CONST_BreachSequenceRumbleTimeMin = 0.75 Const
float CONST_BreachSequenceRumbleTimeMax = 1.5 Const
float CONST_BreachSequenceRumbleDelayMin = 1.0 Const
float CONST_BreachSequenceRumbleDelayMax = 2.0 Const

int CONST_AmbientExplosionTimerID = 2 Const

int CONST_AmbientExplosionOffsetMinX = 0 Const
int CONST_AmbientExplosionOffsetMaxX = 8 Const
int CONST_AmbientExplosionOffsetMinY = 8 Const
int CONST_AmbientExplosionOffsetMaxY = 16 Const
int CONST_AmbientExplosionOffsetMinZ = 2 Const
int CONST_AmbientExplosionOffsetMaxZ = 8 Const

int CONST_EvacuationSceneRepeatDelay = 90 Const


;Local Consts - Failsafes
int CONST_CredTankInitFailsafe = 90 Const
int CONST_CredTankOperationFailsafe = 90 Const


;Local Variables
InputEnableLayer LC107EnableLayer
bool waitingForPlayerToSit

ObjectReference vaultEntranceControlRef
ObjectReference vaultPowerSwitch01Ref
ObjectReference vaultPowerSwitch02Ref
GenericSwitchScript vaultPowerSwitch01LightRef
GenericSwitchScript vaultPowerSwitch02LightRef
ObjectReference vaultControlsTransferModuleSlot01Ref
ObjectReference vaultControlsTransferModuleSlot02Ref
ObjectReference vaultControlsDataCoreSlotRef
ObjectReference vaultControlsDownloadControlRef
ObjectReference vaultControlsStatusIndicatorRef
ObjectReference crimsonFleetAliasContainerRef

;CredTanks
bool initializedPackins
float credTankDrainPercent
bool waitingForCredTanksDrain
bool waitingForCredTanksShutdown
bool waitingForVaultInstantBreaches
LC107CredTankSystemRefScript vaultCredTankManagerRef

;Hull Breaches
bool breachSequenceExplosionsActive
bool debugBlockAmbientExplosions
int ambientExplosionLevel
float evacuationSceneLastPlayedTime

;Guards
Guard AmbientExplosionDataGuard ProtectsFunctionLogic
Guard TransferModuleSlot01ActivationGuard ProtectsFunctionLogic
Guard TransferModuleSlot02ActivationGuard ProtectsFunctionLogic



;-------------------------------------
;Initialization & Quickstarts
;-----------------------------

Event OnQuestInit()
	;Dock the Erebos.
	SpaceshipReference erebosShipRef = ErebosShip.GetShipRef()
	RegisterForRemoteEvent(erebosShipRef, "OnShipDock")

	;Set up the Space Cell Ships array.
	SpaceCellShips.AddRef(LegacyShip.GetRef())
	SpaceCellShips.AddRef(ErebosShip.GetRef())

	;Store off the Vault CredTank Manager object.
	vaultCredTankManagerRef = VaultCredTankManager.GetRef() as LC107CredTankSystemRefScript

	;Set up the Vault Control Console.
	vaultEntranceControlRef = VaultEntranceControl.GetRef()
	vaultPowerSwitch01Ref = VaultPowerSwitch01.GetRef()
	vaultPowerSwitch02Ref = VaultPowerSwitch02.GetRef()
	vaultPowerSwitch01LightRef = VaultPowerSwitch01Light.GetRef() as GenericSwitchScript
	vaultPowerSwitch02LightRef = VaultPowerSwitch02Light.GetRef() as GenericSwitchScript
	vaultControlsTransferModuleSlot01Ref = VaultControlsTransferModuleSlot01.GetRef()
	vaultControlsTransferModuleSlot02Ref = VaultControlsTransferModuleSlot02.GetRef()
	vaultControlsDataCoreSlotRef = VaultControlsDataCoreSlot.GetRef()
	vaultControlsDownloadControlRef = VaultControlsDownloadControl.GetRef()
	vaultControlsStatusIndicatorRef = VaultControlsStatusIndicator.GetRef()
	crimsonFleetAliasContainerRef = CrimsonFleetAliasContainer.GetRef()

	vaultEntranceControlRef.BlockActivation(True, False)
	vaultPowerSwitch01Ref.BlockActivation(True, True)
	vaultPowerSwitch02Ref.BlockActivation(True, True)
	vaultControlsTransferModuleSlot01Ref.BlockActivation(True, False)
	vaultControlsTransferModuleSlot02Ref.BlockActivation(True, False)
	vaultControlsDataCoreSlotRef.BlockActivation(True, False)
	vaultControlsDownloadControlRef.BlockActivation(True, False)

	RegisterForRemoteEvent(PlayerShip.GetShipRef(), "OnShipDock")
	RegisterForRemoteEvent(LegacyShip.GetShipRef(), "OnCellLoad")
	RegisterForRemoteEvent(vaultEntranceControlRef, "OnCellLoad")
	RegisterForRemoteEvent(vaultEntranceControlRef, "OnActivate")
	RegisterForRemoteEvent(vaultPowerSwitch01Ref, "OnActivate")
	RegisterForRemoteEvent(vaultPowerSwitch02Ref, "OnActivate")
	RegisterForRemoteEvent(vaultControlsTransferModuleSlot01Ref, "OnActivate")
	RegisterForRemoteEvent(vaultControlsTransferModuleSlot02Ref, "OnActivate")
	RegisterForRemoteEvent(vaultControlsDataCoreSlotRef, "OnActivate")
	RegisterForRemoteEvent(vaultControlsDownloadControlRef, "OnActivate")
EndEvent


;For quickstarts, give the player a ship and crew and put them on it. Derived from GoToSpace.
Function DEBUG_GoToSpaceAndWait(bool shouldAddCF07Modules)
	InputEnableLayer myEnableLayer = InputEnableLayer.Create()
	myEnableLayer.DisablePlayerControls(abCamSwitch=True)
	Actor playerRef = Game.GetPlayer()
	playerRef.AddPerk(Skill_Piloting)
	playerRef.AddPerk(Skill_Piloting)
	playerRef.AddPerk(Skill_Piloting)
	playerRef.AddPerk(Skill_Piloting)
	SpaceshipReference playerShipRef = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShip, aiLevelMod=CONST_AILevelMod_Hard)
	SQ_PlayerShip.ResetPlayerShip(playerShipRef)
	SQ_PlayerShip.ResetHomeShip(playerShipRef)
	playerShipRef.AddItem(ShipRepairKit, 20)
	playerRef.MoveTo(playerShipRef)
	SQ_PlayerShip.HandleShipTakeOff()
	PlayerShipPilotSeat.GetRef().Activate(playerRef)
	myEnableLayer.Delete()
	waitingForPlayerToSit = True
	RegisterForRemoteEvent(Game.GetPlayer(), "OnSit")
	While(waitingForPlayerToSit)
		Utility.Wait(0.5)
	EndWhile
	if (shouldAddCF07Modules)
		DEBUG_ChangeCF07ModuleData(True, True)
	EndIf
	SQ_Crew.DebugCreateCrewFromFormlist(LC088_Space_QuickstartCrewList, True, playerShipRef)

	Debug.Trace("DEBUG_GoToSpaceAndWait done.")
EndFunction

;Part of the quickstart setup; wait for the player to sit in the spawned ship's pilot seat.
Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
	waitingForPlayerToSit = False
EndEvent

;Part of the quickstart setup; add or remove the CF07 Comspike and Conduction Grid data from the player's current ship.
Function DEBUG_ChangeCF07ModuleData(bool shouldHaveComspike, bool shouldHaveCondictionGrid)
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	if (shouldHaveComspike)
		playerShipRef.SetValue(CF05_ComSpike_AV, 1)
	Else
		playerShipRef.SetValue(CF05_ComSpike_AV, 0)
	EndIf
	if (shouldHaveCondictionGrid)
		playerShipRef.SetValue(CF06_ConductionGrid_AV, 1)
	Else
		playerShipRef.SetValue(CF06_ConductionGrid_AV, 0)
	EndIf
EndFunction


;------------------------------------
;Space Functions
;----------------

Event ObjectReference.OnCellLoad(ObjectReference akSource)
	if ((akSource == LegacyShip.GetShipRef()) && GetStageDone(CONST_LegacyShipAccessibleStage) && (!GetStageDone(CONST_LegacyShipDockedStage)))
		UpdateArrivalProcess()
	ElseIf ((akSource == vaultEntranceControlRef) && (!initializedPackins))
		;Initialize CredTanks
		CallFunctionNoWait("CredTanksInit", None)
		;Initialize Hull Breaches
		CallFunctionNoWait("HullBreachesInit", None)
	EndIf
EndEvent

Function UpdateArrivalProcess()
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	SpaceshipReference legacyShipRef = LegacyShip.GetShipRef()
	bool hasConductionGrid = playerShipRef.GetValue(CF06_ConductionGrid_AV) > 0
	float distanceFromLegacy = playerShipRef.GetDistance(legacyShipRef)
	Debug.Trace(Companion.GetRef())
	if (hasConductionGrid && (Companion.GetRef() != None))
		if (!GetStageDone(CONST_LegacyShipArrivalStage))
			SetStage(CONST_LegacyShipArrivalStage)
		ElseIf (!GetStageDone(CONST_LegacyShipMidwayStage))
			if (distanceFromLegacy > CONST_LegacyShipMidwayDistance)
				RegisterForDistanceLessThanEvent(playerShipRef, legacyShipRef, CONST_LegacyShipMidwayDistance)
			Else
				SetStage(CONST_LegacyShipMidwayStage)
			EndIf
		ElseIf (!GetStageDone(CONST_LegacyShipDiscoveryStage))
			if (distanceFromLegacy > CONST_LegacyShipDiscoveryDistance)
				RegisterForDistanceLessThanEvent(playerShipRef, legacyShipRef, CONST_LegacyShipDiscoveryDistance)
			Else
				SetStage(CONST_LegacyShipDiscoveryStage)
			EndIf
		EndIf
	Else
		if (distanceFromLegacy > CONST_LegacyShipDiscoveryDistance)
			RegisterForDistanceLessThanEvent(playerShipRef, legacyShipRef, CONST_LegacyShipDiscoveryDistance)
		Else
			SetStage(CONST_LegacyShipMapMarkerRevealStage)
		EndIf
	EndIf
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	UpdateArrivalProcess()    
EndEvent

Event SpaceshipReference.OnShipDock(SpaceshipReference akSource, bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
	if ((akSource == PlayerShip.GetShipRef()) && (akParent == LegacyShip.GetShipRef()))
		UnregisterForRemoteEvent(playerShip, "OnShipDock")
		SetStage(190)
	ElseIf ((akSource == ErebosShip.GetShipRef()) && (akParent == LegacyShip.GetShipRef()))
		SQ_Parent.SetupDamagedShip(ErebosShip.GetShipRef(), False, True, False, False, True, True, ErebosActorValuesToDamage)
	EndIf
EndEvent


;-------------------------
;Vault Control System
;---------------------

Auto State Waiting
	Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActionRef)
		GoToState("ProcessingActivation")
		ProcessOnActivate(akSource, akActionRef)
		GoToState("Waiting")
	EndEvent
EndState

State ProcessingActivation
EndState


Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActionRef)
	;Do nothing.
EndEvent

Function SetVaultControlsPowerStatus(int status)
	if (status == CONST_VaultControlsPowerStatus_HalfPower)
		QST_CF07_Power_Half.Play(vaultControlsDataCoreSlotRef)
		Debug.Trace("Playing Sound: " + QST_CF07_Power_Half)
	ElseIf (status == CONST_VaultControlsPowerStatus_Powered)
		QST_CF07_Power_Full.Play(vaultControlsDataCoreSlotRef)
		Debug.Trace("Playing Sound: " + QST_CF07_Power_Full)
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage01_Start")
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Start")
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Start")
		Utility.Wait(0.1)
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Loop")
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Loop")
		vaultControlsTransferModuleSlot01Ref.PlayAnimation("TurnOnFull")
		vaultControlsTransferModuleSlot02Ref.PlayAnimation("TurnOnFull")
	ElseIf (status == CONST_VaultControlsPowerStatus_ReadyForDataCoreInsert)
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Start")
		Utility.Wait(0.1)
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Loop")
	ElseIf (status == CONST_VaultControlsPowerStatus_DownloadFinished)
		vaultControlsDownloadControlRef.PlayAnimation("Play02")
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Stop")
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Loop")
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Loop")
	ElseIf (status == CONST_VaultControlsPowerStatus_ReadyForDataCoreRemoval)
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Loop")
	ElseIf (status == CONST_VaultControlsPowerStatus_Shutdown)
		vaultControlsStatusIndicatorRef.PlayAnimation("Stage01_Stop")
		vaultPowerSwitch01LightRef.SetState("Off")
		vaultPowerSwitch02LightRef.SetState("Off")
	EndIf
EndFunction

Function UnblockVaultPowerSwitches()
	vaultPowerSwitch01Ref.BlockActivation(False, False)
	vaultPowerSwitch02Ref.BlockActivation(False, False)
EndFunction

Function ProcessOnActivate(ObjectReference akSource, ObjectReference akActionRef)
	if (akSource == vaultEntranceControlRef)
		if (!GetStageDone(CONST_OpenVaultEntranceDoorStage))
			if (Game.GetPlayer().GetItemCount(CF_GalbankTransferModule) == 0)
				LC107_GalbankTransferModuleNeededMessage.Show()
				CF07_zLegacy001_Callout_NoTransferModule.Start()
			Else
				vaultEntranceControlRef.BlockActivation(True, True)
				vaultEntranceControlRef.PlayAnimationAndWait("Play01", "Done")
				SetStageNoWait(CONST_OpenVaultEntranceDoorStage)
				vaultEntranceControlRef.PlayAnimation("Play02")
			EndIf
		EndIf
	ElseIf (akSource == vaultPowerSwitch01Ref)
		vaultPowerSwitch01Ref.BlockActivation(True, True)
		vaultPowerSwitch01LightRef.SetColor("White")
		SetStage(CONST_VaultPowerSwitch01ReroutedStage)
	ElseIf (akSource == vaultPowerSwitch02Ref)
		vaultPowerSwitch02Ref.BlockActivation(True, True)
		vaultPowerSwitch02LightRef.SetColor("White")
		SetStage(CONST_VaultPowerSwitch02ReroutedStage)
	ElseIf (akSource == vaultControlsTransferModuleSlot01Ref)
		LockGuard(TransferModuleSlot01ActivationGuard)
			if (!GetStageDone(CONST_VaultPowerReroutedStage))
				LC107_GalbankControlConsoleNeedsPowerMessage.Show()
				CF07_zLegacy003_Callout_ConsoleLowPower.Start()
			ElseIf (!GetStageDone(CONST_VaultTransferModule01InsertedStage) && (Game.GetPlayer().GetItemCount(CF_GalbankTransferModule) == 0))
				LC107_GalbankTransferModuleNeededMessage.Show()
			ElseIf (!GetStageDone(CONST_VaultTransferModule01InsertedStage) && (Game.GetPlayer().GetItemCount(CF_GalbankTransferModule) > 0))
				Game.GetPlayer().RemoveItem(CF_GalbankTransferModule, akOtherContainer=crimsonFleetAliasContainerRef)
				GoToState("Waiting")
				vaultControlsTransferModuleSlot01Ref.PlayAnimationAndWait("Play01", "Done")
				vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Start")
				SetStage(CONST_VaultTransferModule01InsertedStage)
			ElseIf (!GetStageDone(CONST_VaultDataTransferCompleteStage))
				LC107_GalbankTransferModuleLockedMessage.Show()
			ElseIf (!GetStageDone(CONST_VaultTransferModule01RemovedStage))
				vaultControlsTransferModuleSlot01Ref.BlockActivation(True, True)
				GoToState("Waiting")
				vaultControlsTransferModuleSlot01Ref.PlayAnimationAndWait("Play02", "Done")
				vaultControlsStatusIndicatorRef.PlayAnimation("Stage02_Stop")
				Game.GetPlayer().AddItem(CaptainTransferModule.GetRef())
				SetStage(CONST_VaultTransferModule01RemovedStage)
			EndIf
		EndLockGuard
	ElseIf (akSource == vaultControlsTransferModuleSlot02Ref)
		LockGuard(TransferModuleSlot02ActivationGuard)
			if (!GetStageDone(CONST_VaultPowerReroutedStage))
				LC107_GalbankControlConsoleNeedsPowerMessage.Show()
				CF07_zLegacy003_Callout_ConsoleLowPower.Start()
			ElseIf (!GetStageDone(CONST_VaultTransferModule02InsertedStage) && (Game.GetPlayer().GetItemCount(CF_GalbankTransferModule) == 0))
				LC107_GalbankTransferModuleNeededMessage.Show()
			ElseIf (!GetStageDone(CONST_VaultTransferModule02InsertedStage) && (Game.GetPlayer().GetItemCount(CF_GalbankTransferModule) > 0))
				Game.GetPlayer().RemoveItem(CF_GalbankTransferModule, akOtherContainer=crimsonFleetAliasContainerRef)
				GoToState("Waiting")
				vaultControlsTransferModuleSlot02Ref.PlayAnimationAndWait("Play01", "Done")
				vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Start")
				SetStage(CONST_VaultTransferModule02InsertedStage)
			ElseIf (!GetStageDone(CONST_VaultDataTransferCompleteStage))
				LC107_GalbankTransferModuleLockedMessage.Show()
			ElseIf (!GetStageDone(CONST_VaultTransferModule02RemovedStage))
				vaultControlsTransferModuleSlot02Ref.BlockActivation(True, True)
				GoToState("Waiting")
				vaultControlsTransferModuleSlot02Ref.PlayAnimationAndWait("Play02", "Done")
				vaultControlsStatusIndicatorRef.PlayAnimation("Stage03_Stop")
				Game.GetPlayer().AddItem(JasperKryxTransferModule.GetRef())
				SetStage(CONST_VaultTransferModule02RemovedStage)
			EndIf
		EndLockGuard
	ElseIf (akSource == vaultControlsDataCoreSlotRef)
		if (!GetStageDone(CONST_VaultPowerReroutedStage))
			LC107_GalbankControlConsoleNeedsPowerMessage.Show()
			CF07_zLegacy003_Callout_ConsoleLowPower.Start()
		ElseIf (!GetStageDone(CONST_VaultTransferModulesInsertedStage))
			LC107_GalbankDataCorePortNeedsTransferModulesMessage.Show()
		ElseIf (!GetStageDone(CONST_VaultDataCoreInsertedStage))
			Game.GetPlayer().RemoveItem(DataCoreEmpty.GetRef())
			vaultControlsDataCoreSlotRef.PlayAnimationAndWait("Play01", "Done")
			vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Start")
			vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Start")
			Utility.Wait(0.1)
			vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Loop")
			SetStage(CONST_VaultDataCoreInsertedStage)
		ElseIf (!GetStageDone(CONST_VaultDataCoreReadyForRemovalStage))
			LC107_DataCoreLockedMessage.Show()
			DisableFastTravelOnLegacy()
		ElseIf (!GetStageDone(CONST_VaultDataCoreRemovedStage))
			vaultControlsDataCoreSlotRef.BlockActivation(True, True)
			WwiseEvent_QST_CF07_TakeModule.Play(vaultControlsDataCoreSlotRef)
			vaultControlsDataCoreSlotRef.PlayAnimationAndWait("Play02", "Done")
			vaultControlsStatusIndicatorRef.PlayAnimation("Stage04_Stop")
			LockPlayerForEscape()
			Game.GetPlayer().AddItem(DataCoreFull.GetRef())
			SetStage(CONST_VaultDataCoreRemovedStage)
		EndIf
	ElseIf (akSource == vaultControlsDownloadControlRef)
		if (!GetStageDone(CONST_VaultPowerReroutedStage))
			LC107_GalbankControlConsoleNeedsPowerMessage.Show()
			CF07_zLegacy003_Callout_ConsoleLowPower.Start()
		ElseIf (!GetStageDone(CONST_VaultDataCoreInsertedStage))
			LC107_GalbankDownloadControlNeedsDataCoreMessage.Show()
		ElseIf (!GetStageDone(CONST_VaultDownloadControlActivatedStage))
			vaultControlsDownloadControlRef.BlockActivation(True, True)
			vaultControlsDownloadControlRef.PlayAnimationAndWait("Play01", "Done")
			vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Stop")
			Utility.Wait(0.1)
			vaultControlsStatusIndicatorRef.PlayAnimation("Stage05_Start")
			SetStage(CONST_VaultDownloadControlActivatedStage)
		EndIf
	EndIf
EndFunction


;---------------------------
;CredTank Animation System
;--------------------------

Function CredTanksInit()
	float startTime = Utility.GetCurrentRealTime()
	StartCredTankOperation()
	vaultCredTankManagerRef.PerformInitialRegistration(None)
	vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Initialize)
	WaitForCredTankOperation()
	Debug.Trace("CredTanksInit DONE: " + (Utility.GetCurrentRealTime()-startTime))
	initializedPackins = True
EndFunction

Function CredTanksBoot()
	float startTime = Utility.GetCurrentRealTime()
	;WaitForCredTankInitialization()
	StartCredTankOperation()
	vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Boot)
	WaitForCredTankOperation()
	Debug.Trace("CredTanksBoot DONE: " + (Utility.GetCurrentRealTime()-startTime))
EndFunction

Function CredTanksDrain()
	float startTime = Utility.GetCurrentRealTime()
	;WaitForCredTankInitialization()
	StartCredTankOperation()
	Var[] akArgs = new Var[1]
	akArgs[0] = startTime
	CallFunctionNoWait("CredTanksDrain02", akArgs)
EndFunction

Function CredTanksDrain02(float startTime)
	vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Drain)
	WaitForCredTankOperation()
	waitingForCredTanksDrain = False
	Debug.Trace("CredTanksDrain DONE: " + (Utility.GetCurrentRealTime()-startTime))
EndFunction

Function CredTanksShutdown()
	waitingForCredTanksShutdown = True
	float startTime = Utility.GetCurrentRealTime()
	;WaitForCredTankInitialization()
	StartCredTankOperation()
	vaultCredTankManagerRef.PerformOperation(vaultCredTankManagerRef.CONST_Operation_Shutdown)
	WaitForCredTankOperation()
	Debug.Trace("CredTanksShutdown DONE: " + (Utility.GetCurrentRealTime()-startTime))
	waitingForCredTanksShutdown = False
EndFunction


Function StartCredTankOperation()
	LC107CredTankShelvesCurrentGlobal.SetValue(0)
EndFunction

Function WaitForCredTankOperation()
	int current = LC107CredTankShelvesCurrentGlobal.GetValueInt()
	int total = LC107CredTankShelvesTotalGlobal.GetValueInt()
	int failsafe = 0
	While ((current < total) && (failsafe < CONST_CredTankOperationFailsafe))
		Utility.Wait(0.25)
		failsafe = failsafe + 1
		current = LC107CredTankShelvesCurrentGlobal.GetValueInt()
		Debug.Trace("Waiting for CredTank operation... Failsafe=" + failsafe + "/" + CONST_CredTankOperationFailsafe)
	EndWhile
	if (failsafe == CONST_CredTankOperationFailsafe)
		Debug.Trace("ERROR: LC107QuestScript: WaitForCredTankOperation timed out.", 2)
	EndIf
EndFunction


Function WaitForCredTankInitialization()
	int failsafe = 0
	While ((!initializedPackins) && (failsafe < (CONST_CredTankInitFailsafe)))
		Utility.Wait(0.5)
		failsafe = failsafe + 1
		Debug.Trace("Waiting for CredTank Init... Failsafe=" + failsafe + "/" + CONST_CredTankInitFailsafe)
	EndWhile
	if (failsafe == CONST_CredTankInitFailsafe)
		Debug.Trace("ERROR: LC107QuestScript: WaitForCredTankInitialization timed out.", 2)
		initializedPackins = True
	EndIf
EndFunction


Function DEBUG_ForceDataTransfer()
	vaultControlsDataCoreSlotRef.BlockActivation(True, True)
	vaultControlsDataCoreSlotRef.PlayAnimationAndWait("Play01", "Done")
	vaultControlsDataCoreSlotRef.PlayAnimation("Stage04_Stop")
	vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Position", 0)
	vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Speed", 10)
	PerformCredTankDataTransfer()
EndFunction

Function PerformCredTankDataTransfer()
	QST_CF07_ServerRoom_Activate.Play(vaultControlsDataCoreSlotRef)
	CredTanksBoot()
	Utility.Wait(3)
	waitingForCredTanksDrain = True
	CredTanksDrain()
	QST_CF07_ServerRoom_Deactivate.Play(vaultControlsDataCoreSlotRef)
	vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Speed", 0.1)
	float current = LC107CredTankShelvesCurrentGlobal.GetValueInt()
	float total = LC107CredTankShelvesTotalGlobal.GetValueInt()
	float currentPercent = current / total
	QST_CF07_Data_Transfer_LP_Start.Play(vaultControlsDataCoreSlotRef)
	While (waitingForCredTanksDrain && (currentPercent < CONST_CredTankDrainPercentMax))
		vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Position", currentPercent)
		Utility.Wait(0.2)
		current = LC107CredTankShelvesCurrentGlobal.GetValueInt()
		currentPercent = current / total
	EndWhile
	vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Position", CONST_CredTankDrainPercentMax)
	QST_CF07_Data_Transfer_LP_Stop.Play(vaultControlsDataCoreSlotRef)
	Utility.Wait(2)
EndFunction

Function PopupDataCore()
	vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Speed", 0.1)
	vaultControlsDataCoreSlotRef.SetAnimationVariableFloat("Position", 1.0)
	Utility.Wait(CONST_DataCorePopupDelay)
EndFunction


;------------------------
;Escape Sequence
;----------------

Function PlayBreachSequenceStartVFX()
	;Disable saving during the breach sequence.
	Game.SetInChargen(True, True, False)
EndFunction

Function PlayBreachSequenceEndVFX()
	;Re-enable saving.
	Game.SetInChargen(False, False, False)
	;Also stop the Breach Sequence Explosions here.
	breachSequenceExplosionsActive = False
EndFunction

;When the hull is breached, flag the environment as not sealed; it's decompressed.
Function SetNotSealedEnvironment()
	LC107LegacyShipLocation.GetLocation().AddKeyword(ENV_Loc_NotSealedEnvironment)
EndFunction

;Wait for the CredTanks to shut down and the Vault Breaches to break.
Function WaitForBreachesAndCredTanks()
	While (waitingForCredTanksShutdown)
		Utility.Wait(0.25)
		Debug.Trace("Waiting: Waiting on CredTanks...")
	EndWhile
	While (waitingForVaultInstantBreaches)
		Utility.Wait(0.25)
		Debug.Trace("Waiting: Waiting on Vault Instant Breaches...")
	EndWhile
EndFunction



;------------------------
;Hull Breaches
;---------------

Function HullBreachesInit()
	;Init Hull Breaches.
	LC107HullBreachScript[] hullBreaches = HullBreachesAll.GetArray() as LC107HullBreachScript[]
	int i = 0
	While (i < hullBreaches.Length)
		if (hullBreaches[i] != None)
			hullBreaches[i].InitHullBreach()
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function BreakVaultInstantBreaches()
	waitingForVaultInstantBreaches = True
	LC107HullBreachScript[] hullBreachesVault = HullBreachesInstantBreakVault.GetArray() as LC107HullBreachScript[]
	int totalInstantBreaches = hullBreachesVault.Length
	Var[] akArgs = new Var[1]
	akArgs[0] = True
	int i = 0
	While (i < totalInstantBreaches)
		LC107HullBreachScript currentBreach = hullBreachesVault[i]
		if (currentBreach != None)
			currentBreach.CallFunctionNoWait("TriggerBreach", akArgs)
		EndIf
		i = i + 1
	EndWhile
	int currentInstantBreaches = LC107VaultInstantBreachesCurrentGlobal.GetValueInt()
	While (currentInstantBreaches < totalInstantBreaches)
		Utility.Wait(0.25)
		currentInstantBreaches = LC107VaultInstantBreachesCurrentGlobal.GetValueInt()
		Debug.Trace("Waiting for Vault Instant Breaches...")
	EndWhile
	waitingForVaultInstantBreaches = False
EndFunction

Function BreakOtherInstantBreaches()
	int i = 0
	LC107HullBreachScript[] hullBreachesOther = HullBreachesInstantBreak.GetArray() as LC107HullBreachScript[]
	Var[] akArgs = new Var[1]
	akArgs[0] = False
	While (i < hullBreachesOther.Length)
		LC107HullBreachScript currentBreach = hullBreachesOther[i]
		if (currentBreach != None)
			currentBreach.CallFunctionNoWait("TriggerBreach", akArgs)
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function DamageDestructibleTraps()
	Utility.Wait(15)
	Debug.Trace("------------Damaging destructibles.")
	ObjectReference[] destructibleTrapRefs = DestructibleTraps.GetArray()
	int i = 0
	While (i < destructibleTrapRefs.Length)
		ObjectReference currentTrap = destructibleTrapRefs[i]
		currentTrap.DamageObject(currentTrap.GetValue(Health)-3)
		i = i + 1
	EndWhile
EndFunction




;-------------------------------------
;Hull Breach Explosion System
;-----------------------------

;Start the Breach Sequence explosions.
Function StartBreachSequenceExplosions()
	Debug.Trace("Starting Breach Sequence Explosions")
	breachSequenceExplosionsActive = True
	StartTimer(0, CONST_BreachSequenceExplosionTimerID)
EndFunction

;Start the Ambient Explosions on the Legacy.
Function StartAmbientExplosions(int newAmbientExplosionLevel)
	LockGuard(AmbientExplosionDataGuard)
		ambientExplosionLevel = newAmbientExplosionLevel
		StartTimer(0, CONST_AmbientExplosionTimerID)
	EndLockGuard
EndFunction

Function StartAmbientExplosionTimer()
	LockGuard(AmbientExplosionDataGuard)
		StartTimer(Utility.RandomFloat(AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMin, AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMax), CONST_AmbientExplosionTimerID)
	EndLockGuard
EndFunction

Event OnTimer(int timerID)
	if (timerID == CONST_BreachSequenceExplosionTimerID)
		CancelTimer(CONST_BreachSequenceExplosionTimerID)
		float rumbleTime = Utility.RandomFloat(CONST_BreachSequenceRumbleTimeMin, CONST_BreachSequenceRumbleTimeMax)
		Game.GetPlayer().RampRumble(Utility.RandomFloat(CONST_BreachSequenceRumblePowerMin, CONST_BreachSequenceRumblePowerMax), rumbleTime)
		Utility.Wait(rumbleTime)
		if (breachSequenceExplosionsActive)
			StartTimer(Utility.RandomFloat(CONST_BreachSequenceRumbleDelayMin, CONST_BreachSequenceRumbleDelayMax), CONST_BreachSequenceExplosionTimerID)
		Else
			Debug.Trace("Ending Breach Sequence Explosions")
		EndIf
	ElseIf ((timerID == CONST_AmbientExplosionTimerID) && (!debugBlockAmbientExplosions))
		LockGuard(AmbientExplosionDataGuard)
			if (Game.GetPlayer().GetParentCell() == LC107Legacy01)
				TriggerExplosion(AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMin, AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMax)
				float currentTime = Utility.GetCurrentRealTime()
				if ((evacuationSceneLastPlayedTime == 0) || (currentTime < evacuationSceneLastPlayedTime))
					Debug.Trace("--Initial or TimerReset: Resetting evacuation timer.")
					evacuationSceneLastPlayedTime = currentTime
				ElseIf (currentTime > (evacuationSceneLastPlayedTime + CONST_EvacuationSceneRepeatDelay))
					evacuationSceneLastPlayedTime = currentTime
					CF07_zLegacy007_Evacuate_HullBreach.Start()
				EndIf
			EndIf
			if (!GetStageDone(CONST_LegacyEscapeCompleteStage))
				StartAmbientExplosionTimer()
			EndIf
		EndLockGuard
	EndIf
EndEvent

Function TriggerExplosion(int ExplosionSizeMin, int ExplosionSizeMax, ObjectReference explosionSource = None)
	bool isSpawnedExplosionSource
	if (explosionSource == None)
		isSpawnedExplosionSource = True
		float[] offsets = new float[3]
		offsets[0] = Utility.RandomFloat(CONST_AmbientExplosionOffsetMinX, CONST_AmbientExplosionOffsetMaxX)
		offsets[1] = Utility.RandomFloat(CONST_AmbientExplosionOffsetMinY, CONST_AmbientExplosionOffsetMaxY)
		offsets[2] = Utility.RandomFloat(CONST_AmbientExplosionOffsetMinZ, CONST_AmbientExplosionOffsetMaxZ)
		if (Utility.RandomInt(0, 1) == 0)
			offsets[0] = offsets[0] * -1
		EndIf
		explosionSource = Game.GetPlayer().PlaceAtMe(XMarkerHeading, akOffsetValues=offsets)
	EndIf

	Explosion explosionToSpawn
	if (ExplosionSizeMin == ExplosionSizeMax)
		explosionToSpawn = HullBreachExplosions[ExplosionSizeMin]
	Else
		explosionToSpawn = HullBreachExplosions[Utility.RandomInt(ExplosionSizeMin, ExplosionSizeMax)]
	EndIf

	ObjectReference spawnedExplosion = explosionSource.PlaceAtMe(explosionToSpawn)

	if (isSpawnedExplosionSource)
		explosionSource.Delete()
	EndIf
EndFunction

Function DEBUG_BlockAmbientExplosions()
	debugBlockAmbientExplosions = True
EndFunction 

Function DEBUG_SetAmbientExplosionValues(int sizeMin, int sizeMax, int delayMin, int delayMax)
	AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMin = sizeMin
	AmbientExplosionData[ambientExplosionLevel].ExplosionSizeMax = sizeMax
	AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMin = delayMin
	AmbientExplosionData[ambientExplosionLevel].ExplosionDelayMax = delayMax
EndFunction



;------------------------------
;Other Interactive Objects
;--------------------------

Function ResetStandardCredTanks()
	CFCredTankScript[] standardTanks = StandardCredTanks.GetArray() as CFCredTankScript[]
	int i = 0
	While (i < standardTanks.Length)
		standardTanks[i].ResetCredTank()
		i = i + 1
	EndWhile
EndFunction

Function SetReactorState(RefCollectionAlias reactorCol, int newState)
	ReactorFloorMidA01Script[] reactors = reactorCol.GetArray() as ReactorFloorMidA01Script[]
	int i = 0
	While (i < reactors.Length)
		reactors[i].SetReactorState(newState)
		i = i + 1
	EndWhile
EndFunction



;-------------------------------------
;Input Enable Layer Management
;------------------------------

Function DisableFastTravelOnLegacy()
	if (LC107EnableLayer == None)
		LC107EnableLayer = InputEnableLayer.Create()
	EndIf
	LC107EnableLayer.EnableFastTravel(False)
EndFunction

Function LockPlayerForEscape()
	DisableFastTravelOnLegacy()
	LC107EnableLayer.DisablePlayerControls()
	Game.SetInChargen(abDisableSaving=True, abDisableWaiting=True, abShowControlsDisabledMessage=False)
EndFunction

Function UnlockPlayerMovement()
	LC107EnableLayer.EnablePlayerControls()
	Game.SetInChargen(abDisableSaving=False, abDisableWaiting=False, abShowControlsDisabledMessage=False)
EndFunction

Function UnlockFastTravel()
	if (LC107EnableLayer != None)
		LC107EnableLayer.EnableFastTravel(True)
		LC107EnableLayer.Delete()
	EndIf
EndFunction



;---------------
;Cleanup
;--------

Function Cleanup()
	vaultEntranceControlRef = None
	vaultPowerSwitch01Ref = None
	vaultPowerSwitch02Ref = None
	vaultPowerSwitch01LightRef = None
	vaultPowerSwitch02LightRef = None
	vaultControlsTransferModuleSlot01Ref = None
	vaultControlsTransferModuleSlot02Ref = None
	vaultControlsDataCoreSlotRef = None
	vaultControlsDownloadControlRef = None
	vaultControlsStatusIndicatorRef = None
	crimsonFleetAliasContainerRef = None
	vaultCredTankManagerRef = None
EndFunction