Scriptname LC088_SpaceQuestScript extends Quest
{Quest script for LC088_Space, the Space portion of the Crimson Fleet Final Battle.}

Group QuestProperties
	SpaceshipBase property DEBUG_PlayerShipCF Auto Const Mandatory
	SpaceshipBase property DEBUG_PlayerShipSD Auto Const Mandatory
EndGroup

Group AutofillProperties
	Quest property LC082 Auto Const Mandatory
	Quest property LC088_Vigilance Auto Const Mandatory
	Quest property LC088_Key Auto Const Mandatory
	SQ_CrewScript property SQ_Crew Auto Const Mandatory
	SQ_PlayerShipScript property SQ_PlayerShip Auto Const Mandatory

	LocationAlias property KeySpaceCellLocation Auto Const Mandatory
	LocationAlias property VigilanceSpaceCellLocation Auto Const Mandatory
	LocationAlias property DBAlphaSpaceCellLocation Auto Const Mandatory
	LocationAlias property DBBetaSpaceCellLocation Auto Const Mandatory
	LocationAlias property DBGammaSpaceCellLocation Auto Const Mandatory

	ReferenceAlias property KeyAlias Auto Const Mandatory
	ReferenceAlias property Vigilance Auto Const Mandatory
	ReferenceAlias property Player Auto Const Mandatory
	ReferenceAlias property PlayerShip Auto Const Mandatory

	ReferenceAlias property CF_Captain_RokovShip Auto Const Mandatory
	ReferenceAlias property CF_Captain_MathisShip Auto Const Mandatory
	ReferenceAlias property CF_Captain_NaevaShip Auto Const Mandatory
	ReferenceAlias property CF_Captain_AdlerShip Auto Const Mandatory
	ReferenceAlias property CF_Captain_HuanShip Auto Const Mandatory
	ReferenceAlias property CF_Captain_EstelleShip Auto Const Mandatory
	RefCollectionAlias property CF_Captains_All Auto Const Mandatory

	ReferenceAlias property SD_ToftShip Auto Const Mandatory
	ReferenceAlias property SD_ArchangelShip Auto Const Mandatory
	RefCollectionAlias property SD_Allies_Group Auto Const Mandatory

	ReferenceAlias property DefensiveBatteryAlpha Auto Const Mandatory
	ReferenceAlias property DefensiveBatteryBeta Auto Const Mandatory
	ReferenceAlias property DefensiveBatteryGamma Auto Const Mandatory

	ReferenceAlias property KeyMapMarker Auto Const Mandatory
	ReferenceAlias property VigilanceEnableMarkerCF07 Auto Const Mandatory
	ReferenceAlias property DefensiveBatteryAlphaMapMarker Auto Const Mandatory
	ReferenceAlias property DefensiveBatteryBetaMapMarker Auto Const Mandatory
	ReferenceAlias property DefensiveBatteryGammaMapMarker Auto Const Mandatory

	ReferenceAlias property DefensiveBatteryAlphaProjectileSourceMarker Auto Const Mandatory
	ReferenceAlias property DefensiveBatteryBetaProjectileSourceMarker Auto Const Mandatory
	ReferenceAlias property DefensiveBatteryGammaProjectileSourceMarker Auto Const Mandatory

	ReferenceAlias property VigilanceArrivalMarker Auto Const Mandatory
	ReferenceAlias property VigilanceTrafficMarker Auto Const Mandatory
	ReferenceAlias property KeyTrafficMarker Auto Const Mandatory
	ReferenceAlias property PlayerShipPilotSeat Auto Const Mandatory
	ReferenceAlias property StationTheKey_CFMainEnableMarker Auto Const Mandatory
	ReferenceAlias property KeyTurretsEnableMarker Auto Const Mandatory

	RefCollectionAlias property KeyTurrets Auto Const Mandatory
	RefCollectionAlias property IncidentalDialogueBlockedCollection Auto Const Mandatory

	RefCollectionAlias property CF_Allies_All Auto Const Mandatory
	RefCollectionAlias property CF_Allies_Skirmish Auto Const Mandatory
	RefCollectionAlias property CF_Allies_Alpha Auto Const Mandatory
	RefCollectionAlias property CF_Allies_Beta Auto Const Mandatory
	RefCollectionAlias property CF_Allies_Gamma Auto Const Mandatory
	RefCollectionAlias property CF_Allies_Main Auto Const Mandatory
	RefCollectionAlias property CF_Allies_Main_Reinforcements Auto Const Mandatory
	RefCollectionAlias property CF_Allies_Main_FallbackReinforcements Auto Const Mandatory
	RefCollectionAlias property CF_Enemies_All Auto Const Mandatory
	RefCollectionAlias property CF_Enemies_Skirmish Auto Const Mandatory
	RefCollectionAlias property CF_Enemies_Alpha Auto Const Mandatory
	RefCollectionAlias property CF_Enemies_Beta Auto Const Mandatory
	RefCollectionAlias property CF_Enemies_Gamma Auto Const Mandatory
	RefCollectionAlias property CF_Enemies_Main Auto Const Mandatory
	RefCollectionAlias property CF_Enemies_Main_Reinforcements_1 Auto Const Mandatory
	RefCollectionAlias property CF_Enemies_Main_Reinforcements_2 Auto Const Mandatory

	RefCollectionAlias property GenericShipsAll Auto Const Mandatory
	RefCollectionAlias property SD_Allies_All Auto Const Mandatory
	RefCollectionAlias property SD_Allies_Skirmish Auto Const Mandatory
	RefCollectionAlias property SD_Allies_Alpha Auto Const Mandatory
	RefCollectionAlias property SD_Allies_Beta Auto Const Mandatory
	RefCollectionAlias property SD_Allies_Gamma Auto Const Mandatory
	RefCollectionAlias property SD_Allies_Main_SysDefFleet Auto Const Mandatory
	RefCollectionAlias property SD_Enemies_All Auto Const Mandatory
	RefCollectionAlias property SD_Enemies_Skirmish Auto Const Mandatory
	RefCollectionAlias property SD_Enemies_Alpha Auto Const Mandatory
	RefCollectionAlias property SD_Enemies_Beta Auto Const Mandatory
	RefCollectionAlias property SD_Enemies_Gamma Auto Const Mandatory
	RefCollectionAlias property SD_Enemies_Main Auto Const Mandatory
	RefCollectionAlias property SD_Enemies_Main_Reinforcements_1 Auto Const Mandatory
	RefCollectionAlias property SD_Enemies_Main_Reinforcements_2 Auto Const Mandatory
	ReferenceAlias property SD_BatteryDestroyedSpeaker Auto Const Mandatory
	ReferenceAlias property SD_Alpha_ArrivalPointMarkerChainHead Auto Const Mandatory
	ReferenceAlias property SD_Beta_ArrivalPointMarkerChainHead Auto Const Mandatory
	ReferenceAlias property SD_Gamma_ArrivalPointMarkerChainHead Auto Const Mandatory
	ReferenceAlias property SD_Main_ArrivalPointMarkerChainHead Auto Const Mandatory

	RefCollectionAlias property GammaShipsAll Auto Const Mandatory

	GlobalVariable property CF_SysDefShutdown Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Rokov Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Mathis Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Naeva Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Adler Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Huan Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Estelle Auto Const Mandatory
	GlobalVariable property LC088SpaceMainEnemiesKilled Auto Const Mandatory

	Faction property PlayerFaction Auto Const Mandatory
	Faction property CrimeFactionCrimsonFleet Auto Const Mandatory
	Faction property UCSysDefFaction Auto Const Mandatory
	ActorValue property Health Auto Const Mandatory
	ActorValue property DockingPermission Auto Const Mandatory
	ActorValue property ShieldHealth Auto Const Mandatory
	ActorValue property ShipSystemEngineHealth Auto Const Mandatory
	ActorValue property ShipSystemShieldsHealth Auto Const Mandatory
	ActorValue property SpaceshipMainEnginePower Auto Const Mandatory
	ActorValue property SpaceshipShieldPower Auto Const Mandatory
	ActorValue property HideShipFromHUDValue Auto Const Mandatory
	Keyword property CF05_JadeSwanShipKeyword Auto Const Mandatory
	Keyword property LC088_Space_CF_LinkToFormationKeyword Auto Const Mandatory
	Keyword property LC088_Space_CF_CaptainsDockingLinkToVigilance Auto Const Mandatory
	Keyword property LC088_Space_SD_ReinforcementDockedWithKeyKeyword Auto Const Mandatory
	Keyword property DisallowAsCombatTargetKeyword Auto Const Mandatory
	Scene property LC088_Space_SD_225_BatteryDestroyed Auto Const Mandatory
	Scene property LC088_Space_SD_226_BatteryPhaseComplete Auto Const Mandatory
	Spell property LC088_DefensiveBatteryRegenSpell Auto Const Mandatory
	Spell property LC088_DefensiveBatteryFireProjectileSpell Auto Const Mandatory
	Perk property LC088_Space_VigilanceDamageImmunityPerk Auto Const Mandatory
	Perk property LC088_Space_VigilanceDamageReductionPerk Auto Const Mandatory
	Perk property Skill_Piloting Auto Const Mandatory
	Potion property ShipRepairKit Auto Const Mandatory
	Formlist property LC088_Space_QuickstartCrewList Auto Const Mandatory
	Message property LC088_Space_VigilanceShieldsImpenetrableMessage Auto Const Mandatory
	MusicType property MUSGenesisCombatBoss_CF08SpaceBattle Auto Const Mandatory
	Static property XMarkerHeading Auto Const Mandatory
	ObjectReference property scDebugStartOriginMarker Auto Const Mandatory

	ObjectReference property TheKey_DataCoreAnalyzer_EnableMarkerRef Auto Const Mandatory
	ObjectReference property TheKey_DataCoreAnalyzer_DisableMarkerRef Auto Const Mandatory
	ReferenceAlias property TheKey_DataCoreAnalyzer Auto Const Mandatory
	ObjectReference property LC082_DataCoreAnalyzer_DisableMarkerRef Auto Const Mandatory
	ObjectReference property LC082_DataCoreAnalyzer_EnableMarkerRef Auto Const Mandatory
	ReferenceAlias property LC082_DataCoreAnalyzer Auto Const Mandatory

	VisualEffect property LC088_Space_DefensiveBatteriesFireOnVigilance Auto Const Mandatory
	GlobalVariable property LC088_Space_UseNewDefensiveBatteryFireVFX Auto Const Mandatory
	GlobalVariable property LC088_Space_DefensiveBatteryFireToShieldDegenDelay Auto Const Mandatory
EndGroup


;Local Variables
Actor playerRef
SpaceshipReference keyRef
SpaceshipReference vigilanceRef
Location KeySpaceCellLoc
Location VigilanceSpaceCellLoc
Location DBAlphaSpaceCellLoc
Location DBBetaSpaceCellLoc
Location DBGammaSpaceCellLoc
InputEnableLayer LC088SpaceEnableLayer
Scene currentSpaceScene

bool waitingForPlayerToSit
bool questStartupFinished
bool Main_MusicOverrideActive
int SD_LastBatteryDestroyedID
int Main_ReinforcementWavesTriggered


;Local Consts
;Event Consts
int CONST_WaitForQuestStartupFailsafeMax = 120 Const
int CONST_ReinforcementMaxDistanceFromFallback = 10000 Const
float CONST_VigilanceInvulnerableSceneWaitDelay = 20.0 Const
float CONST_ReinforcementForwardVelocityPercent = 0.75 Const

float CONST_SDFleetEnableDelayMin = 0.2 Const
float CONST_SDFleetEnableDelayMax = 0.4 Const
float CONST_SDFleetEnableDelayVigilance = 1.0 Const

int CF_Main_ReinforcementTriggerCount_1 = 4
int CF_Main_ReinforcementTriggerCount_2 = 6
int CF_Main_ReinforcementTriggerCount_3 = 8
int CF_Main_AllEnemiesDefeatedCount_4 = 15

int SD_Main_ReinforcementTriggerCount_1 = 0 ;The SD Reinforcement counts are calculated by SD_CalculateMainBattleCounts.
int SD_Main_ReinforcementTriggerCount_2 = 0
int SD_Main_ReinforcementTriggerCount_3 = 0
int SD_Main_AllEnemiesDefeatedCount_4 = 0

int CONST_SDAlliesMax_Beta = 4 Const
int CONST_SDAlliesMax_Gamma = 5 Const
int CONST_SDAlliesMax_Main = 6 Const
int CONST_SDAlliesForwardShiftDistance_Batteries = 1000 Const
int CONST_SDAlliesForwardShiftDistance_Main = 0 Const
float CONST_SDEnemiesMainDelay_Min = 0.5 Const
float CONST_SDEnemiesMainDelay_Max = 2.0 Const
int CONST_SDBatteryMapMarkerHeadingOffsetDistance = 1000 Const


;Timer IDs
int CONST_VigilanceInvulnerableSceneTimerID = 1 Const
int CONST_VigilanceInvulnerableMessageTimerID = 2 Const
int CONST_VigilanceInvulnerableMessageTimerDelay = 10 Const

;LC082 Stage
int CONST_LC082_DisableCF07TrafficManagerStage = 40 Const

;LC088 Stages
int CONST_Stage_PlayerSetupDone = 32 Const
int CONST_Stage_CF_Quickstart = 11 Const
int CONST_Stage_SD_Quickstart = 12 Const
int CONST_Stage_CF_Skip = 40 Const
int CONST_Stage_SD_Skip = 45 Const

int CONST_Stage_CF_PlayerSidesWithCF = 100 Const
int CONST_Stage_CF_StartAlpha = 120 Const
int CONST_Stage_CF_StartBeta = 130 Const
int CONST_Stage_CF_StartGamma = 140 Const
int CONST_Stage_CF_MainReady = 150 Const
int CONST_Stage_CF_StartMain = 160 Const
int CONST_Stage_CF_StartMainDone = 161 Const
int CONST_Stage_CF_VigilanceInvulnerable = 163 Const
int CONST_Stage_CF_Reinforcements1 = 165 Const
int CONST_Stage_CF_Reinforcements2 = 169 Const
int CONST_Stage_CF_Reinforcements3 = 170 Const
int CONST_Stage_CF_DisplayQTsToRemaining = 173 Const
int CONST_Stage_CF_AllEscortsDefeated = 175 Const
int CONST_Stage_CF_DefensiveBatteriesFiredAtVigilance = 179 Const
int CONST_Stage_CF_DockedWithVigilance = 190 Const
int CONST_Stage_CF_UndockedWithVigilanceAfterCompleting = 195 Const

int CONST_Stage_SD_PlayerSidesWithSD = 200 Const
int CONST_Stage_SD_StartAlpha = 220 Const
int CONST_Stage_SD_CompletedAlpha = 228 Const
int CONST_Stage_SD_StartBeta = 230 Const
int CONST_Stage_SD_CompletedBeta = 238 Const
int CONST_Stage_SD_StartGamma = 240 Const
int CONST_Stage_SD_CompletedGamma = 248 Const
int CONST_Stage_SD_CompletedGammaSceneDone = 249 Const
int CONST_Stage_SD_StartMain = 260 Const
int CONST_Stage_SD_StartMainDone = 261 Const
int CONST_Stage_SD_Reinforcements3 = 265 Const
int CONST_Stage_SD_MainBattleCompleted = 270 Const
int CONST_Stage_SD_DockedWithKey = 290 Const
int CONST_Stage_SD_UndockedWithKeyAfterCompleting = 295 Const

int CONST_LC088VigilanceStage_Complete = 1100 Const
int CONST_LC088KeyStage_Complete = 1100 Const


;Standard values for the CF Captain State globals.
int CONST_CaptainState_Active = 0 Const
int CONST_CaptainState_Inactive = 1 Const
int CONST_CaptainState_Dead = 2 Const
int CONST_CaptainState_Imprisoned = 3 Const
int CONST_CaptainState_Freed = 4 Const

;Flag stages that indicate whether a captain's event is active.
int CONST_CaptainActiveStage_Rokov = 13 Const
int CONST_CaptainActiveStage_Mathis = 14 Const
int CONST_CaptainActiveStage_Naeva = 15 Const
int CONST_CaptainActiveStage_Adler = 16 Const
int CONST_CaptainActiveStage_Huan = 17 Const
int CONST_CaptainActiveStage_Estelle = 18 Const

;Encounter IDs.
int CONST_EncounterID_Skirmish = 0 Const
int CONST_EncounterID_Alpha = 1 Const
int CONST_EncounterID_Beta = 2 Const
int CONST_EncounterID_Gamma = 3 Const
int CONST_EncounterID_Main = 4 Const

;SD Failure Global
int CONST_SDState_Failed = 1 Const

;Docking Permissions
int CONST_DockingPermission_Any = 0 Const
int CONST_DockingPermission_Never = 4 Const

;Docking Ports on the Vigilance
int CONST_VigilanceDockingLimit = 3 Const

;Ship Consts
int CONST_AILevelMod_Hard = 2 Const
int CONST_NearPosition_DeadAhead  = -1 Const
int CONST_NearPosition_ForwardTight = 0 Const
int CONST_NearPosition_ForwardWide = 1 Const
int CONST_NearPosition_Behind = 2 Const
int CONST_NearPosition_Above = 3 Const
int CONST_NearPosition_Below = 4 Const
int CONST_NearPosition_Left = 5 Const
int CONST_NearPosition_Right = 6 Const

int CONST_NearDistance_Close = 0 Const
int CONST_NearDistance_Short = 1 Const
int CONST_NearDistance_Moderate = 2 Const
int CONST_NearDistance_Long = 3 Const

int CONST_NearFacing_Random = -2 Const
int CONST_NearFacing_TowardSmall = 0 Const
int CONST_NearFacing_TowardLarge = 1 Const
int CONST_NearFacing_AwaySmall = 2 Const
int CONST_NearFacing_AwayLarge = 3 Const


;Guards
Guard SpaceSceneGuard ProtectsFunctionLogic
Guard ReinforcementsGuard ProtectsFunctionLogic



;------------------------------------
;Initialization, Setup, Cleanup
;-------------------------------

Event OnQuestStarted()
	;Store off local variables.
	playerRef = Game.GetPlayer()
	keyRef = KeyAlias.GetShipRef()
	vigilanceRef = Vigilance.GetShipRef()
	KeySpaceCellLoc = KeySpaceCellLocation.GetLocation()
	VigilanceSpaceCellLoc = VigilanceSpaceCellLocation.GetLocation()
	DBAlphaSpaceCellLoc = DBAlphaSpaceCellLocation.GetLocation()
	DBBetaSpaceCellLoc = DBBetaSpaceCellLocation.GetLocation()
	DBGammaSpaceCellLoc = DBGammaSpaceCellLocation.GetLocation()

	;Set up the All RefCollections.
	CF_Allies_All.AddRefCollection(CF_Allies_Skirmish)
	CF_Allies_All.AddRefCollection(CF_Allies_Alpha)
	CF_Allies_All.AddRefCollection(CF_Allies_Beta)
	CF_Allies_All.AddRefCollection(CF_Allies_Gamma)
	CF_Allies_All.AddRefCollection(CF_Allies_Main)
	IncidentalDialogueBlockedCollection.AddRefCollection(CF_Allies_All)

	CF_Enemies_All.AddRefCollection(CF_Enemies_Skirmish)
	CF_Enemies_All.AddRefCollection(CF_Enemies_Alpha)
	CF_Enemies_All.AddRefCollection(CF_Enemies_Beta)
	CF_Enemies_All.AddRefCollection(CF_Enemies_Gamma)
	CF_Enemies_All.AddRefCollection(CF_Enemies_Main)
	IncidentalDialogueBlockedCollection.AddRefCollection(CF_Enemies_All)

	SD_Allies_All.AddRefCollection(SD_Allies_Alpha)
	SD_Allies_All.AddRefCollection(SD_Allies_Beta)
	SD_Allies_All.AddRefCollection(SD_Allies_Gamma)
	SD_Allies_All.AddRefCollection(SD_Allies_Main_SysDefFleet)
	IncidentalDialogueBlockedCollection.AddRefCollection(SD_Allies_All)

	SD_Enemies_All.AddRefCollection(SD_Enemies_Skirmish)
	SD_Enemies_All.AddRefCollection(SD_Enemies_Alpha)
	SD_Enemies_All.AddRefCollection(SD_Enemies_Beta)
	SD_Enemies_All.AddRefCollection(SD_Enemies_Gamma)
	SD_Enemies_All.AddRefCollection(SD_Enemies_Main)
	IncidentalDialogueBlockedCollection.AddRefCollection(SD_Enemies_All)

	GenericShipsAll.AddRefCollection(CF_Allies_All)
	GenericShipsAll.AddRefCollection(CF_Enemies_All)
	GenericShipsAll.AddRefCollection(SD_Allies_All)
	GenericShipsAll.AddRefCollection(SD_Enemies_All)

	;Register for player ship events.
	RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
	RegisterForRemoteEvent(PlayerShip, "OnShipDock")
	RegisterForRemoteEvent(PlayerShip, "OnShipUndock")
	RegisterForRemoteEvent(CF_Enemies_Main, "OnDeath")
	RegisterForRemoteEvent(SD_Enemies_Main, "OnDeath")

	;Disable docking with the Vigilance and the Key until the Skirmish encounter is complete.
	SetDockingEnabled(keyRef, False)
	SetDockingEnabled(vigilanceRef, False)

	;Disable standard ship traffic around the Vigilance and the Key. Also disable the standard turrets around the Key.
	VigilanceTrafficMarker.TryToDisable()
	StationTheKey_CFMainEnableMarker.TryToDisable()

	;Enable the LC088 turrets around the Key.
	KeyTurretsEnableMarker.TryToEnable()

	;Perform initial setup.
	;CF Skirmish is always available.
	CF_Allies_Skirmish.EnableAll()
	CF_Enemies_Skirmish.EnableAll()

	;SD Skirmish is available if the player has not already failed the SysDef path.
	if (CF_SysDefShutdown.GetValue() != CONST_SDState_Failed)
		SD_Allies_Skirmish.EnableAll()
		SD_Enemies_Skirmish.EnableAll()
		LC082.SetStage(CONST_LC082_DisableCF07TrafficManagerStage)
	EndIf

	;Perform initial setup for the Captains' events, all of which are locked in at this point.
	InitAllCaptainEvents()

	;Block boarding on all ships in the battle.
	int i = 0
	ObjectReference[] cfEnemyShips = CF_Enemies_All.GetArray()
	While (i < cfEnemyShips.Length)
		cfEnemyShips[i].SetValue(DockingPermission, CONST_DockingPermission_Never)
		i = i + 1
	EndWhile
	i = 0
	ObjectReference[] sdEnemyShips = SD_Enemies_All.GetArray()
	While (i < sdEnemyShips.Length)
		sdEnemyShips[i].SetValue(DockingPermission, CONST_DockingPermission_Never)
		i = i + 1
	EndWhile

	;We've finished setting up.
	questStartupFinished = True
EndEvent

Function WaitForQuestStartup()
	int failsafe
	While (!questStartupFinished && (failsafe < CONST_WaitForQuestStartupFailsafeMax))
		failsafe = failsafe + 1
		Utility.Wait(0.5)
	EndWhile
EndFunction


;Initialize the Captains OnQuestInit, before the player has committed to a side.
Function InitAllCaptainEvents()
	InitCaptainEvent(CrimsonFleetCaptainState_Rokov.GetValueInt(), CONST_CaptainActiveStage_Rokov, CF_Captain_RokovShip)
	InitCaptainEvent(CrimsonFleetCaptainState_Mathis.GetValueInt(), CONST_CaptainActiveStage_Mathis, CF_Captain_MathisShip)
	InitCaptainEvent(CrimsonFleetCaptainState_Adler.GetValueInt(), CONST_CaptainActiveStage_Adler, CF_Captain_AdlerShip)
	InitCaptainEvent(CrimsonFleetCaptainState_Huan.GetValueInt(), CONST_CaptainActiveStage_Huan, CF_Captain_HuanShip)
	InitCaptainEvent(CrimsonFleetCaptainState_Estelle.GetValueInt(), CONST_CaptainActiveStage_Estelle, CF_Captain_EstelleShip)
	InitCaptainEvent(CrimsonFleetCaptainState_Naeva.GetValueInt(), CONST_CaptainActiveStage_Naeva, CF_Captain_NaevaShip)
EndFunction

Function InitCaptainEvent(int captainState, int captainActiveStage, ReferenceAlias captainShip)
	SpaceshipReference captainShipRef = captainShip.GetShipRef()
	if (captainState == CONST_CaptainState_Active)
		SetStage(captainActiveStage)
		CF_Captains_All.AddRef(captainShipRef)
		captainShipRef.AddToFaction(CrimeFactionCrimsonFleet)
		captainShipRef.EnableNoWait()
		captainShipRef.InstantDock(keyRef)
	Else
		captainShipRef.DisableNoWait()
	EndIf
EndFunction


;Set up the Captains after the player has committed to a side.
Function SetupAllCaptainEvents()
	SetupCaptainEvent(CrimsonFleetCaptainState_Rokov.GetValueInt(), CONST_CaptainActiveStage_Rokov, CF_Captain_RokovShip)
	SetupCaptainEvent(CrimsonFleetCaptainState_Mathis.GetValueInt(), CONST_CaptainActiveStage_Mathis, CF_Captain_MathisShip, CF_Allies_Alpha)
	SetupCaptainEvent(CrimsonFleetCaptainState_Adler.GetValueInt(), CONST_CaptainActiveStage_Adler, CF_Captain_AdlerShip)
	SetupCaptainEvent(CrimsonFleetCaptainState_Huan.GetValueInt(), CONST_CaptainActiveStage_Huan, CF_Captain_HuanShip, CF_Allies_Gamma)
	SetupCaptainEvent(CrimsonFleetCaptainState_Estelle.GetValueInt(), CONST_CaptainActiveStage_Estelle, CF_Captain_EstelleShip, CF_Allies_Beta)

	;As a special case, Naeva's ship is always disabled on the SD side of the quest.
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		SetupCaptainEvent(CrimsonFleetCaptainState_Naeva.GetValueInt(), CONST_CaptainActiveStage_Naeva, CF_Captain_NaevaShip)
	Else
		SpaceshipReference naevaShip = CF_Captain_NaevaShip.GetShipRef()
		naevaShip.DisableNoWait()
		CF_Captains_All.RemoveRef(naevaShip)
	EndIf
EndFunction

Function SetupCaptainEvent(int captainState, int captainActiveStage, ReferenceAlias captainShip, RefCollectionAlias cfAlliesCollection=None)
	SpaceshipReference captainShipRef = captainShip.GetShipRef()
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		if (captainState == CONST_CaptainState_Active)
			CF_Allies_All.AddRef(captainShipRef)
			CF_Allies_Main.AddRef(captainShipRef)
			IncidentalDialogueBlockedCollection.AddRef(captainShipRef)
			;Debug.Trace("Ignoring friendly hits against " + captainShipRef)
			captainShipRef.IgnoreFriendlyHits()
			if (cfAlliesCollection != None)
				cfAlliesCollection.AddRef(captainShipRef)
				CF_Allies_Main_Reinforcements.AddRef(captainShipRef)
			EndIf
		Else
			if ((cfAlliesCollection != None) && (CF_Allies_Main_FallbackReinforcements.GetCount() > 0))
				SpaceshipReference nextFallback = CF_Allies_Main_FallbackReinforcements.GetAt(0) as SpaceshipReference
				CF_Allies_Main_FallbackReinforcements.RemoveRef(nextFallback)
				CF_Allies_All.AddRef(nextFallback)
				CF_Allies_Main.AddRef(nextFallback)
				CF_Allies_Main_Reinforcements.AddRef(nextFallback)
				IncidentalDialogueBlockedCollection.AddRef(nextFallback)
				;Debug.Trace("Ignoring friendly hits against " + nextFallback)
				nextFallback.IgnoreFriendlyHits()
			EndIf
		EndIf
	Else ;CONST_Stage_CF_PlayerSidesWithSD
		if (captainState == CONST_CaptainState_Active)
			captainShipRef.SetEssential(False)
			SD_Enemies_All.AddRef(captainShipRef)
			if (cfAlliesCollection == None)
				SD_Enemies_Main.AddRef(captainShipRef)
				captainShipRef.InstantUndock()
				captainShipRef.MoveTo(captainShipRef.GetLinkedRef(LC088_Space_CF_LinkToFormationKeyword))
			Else
				SD_Enemies_Main_Reinforcements_1.AddRef(captainShipRef)
			EndIf
		EndIf
		;Nothing to do if the Captains aren't active.
	EndIf
EndFunction

;For debug starts, disable all of the Captains' ships.
Function DisableAllCaptainShips()
	CF_Captain_RokovShip.TryToDisable()
	CF_Captain_MathisShip.TryToDisable()
	CF_Captain_AdlerShip.TryToDisable()
	CF_Captain_HuanShip.TryToDisable()
	CF_Captain_EstelleShip.TryToDisable()
	CF_Captain_NaevaShip.TryToDisable()
EndFunction


;Set up the Defensive Batteries.
Function SetupDefensiveBatteries()
	SetupDefensiveBattery(DefensiveBatteryAlpha.GetShipRef())
	SetupDefensiveBattery(DefensiveBatteryBeta.GetShipRef())
	SetupDefensiveBattery(DefensiveBatteryGamma.GetShipRef())

	;For the SD side of the questline, additionally shift the player's arrival point at the Defensive Batteries back,
	;since the batteries themselves will be firing on you.
	if (GetStageDone(CONST_Stage_SD_PlayerSidesWithSD))
		ObjectReference alphaHeadingRef = DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef()
		alphaHeadingRef.SetPosition(alphaHeadingRef.GetPositionX(), alphaHeadingRef.GetPositionY() - CONST_SDBatteryMapMarkerHeadingOffsetDistance, alphaHeadingRef.GetPositionZ())
		ObjectReference betaHeadingRef = DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef()
		betaHeadingRef.SetPosition(betaHeadingRef.GetPositionX(), betaHeadingRef.GetPositionY() - CONST_SDBatteryMapMarkerHeadingOffsetDistance, betaHeadingRef.GetPositionZ())
		ObjectReference gammaHeadingRef = DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef()
		gammaHeadingRef.SetPosition(gammaHeadingRef.GetPositionX(), gammaHeadingRef.GetPositionY() - CONST_SDBatteryMapMarkerHeadingOffsetDistance, gammaHeadingRef.GetPositionZ())
	EndIf
EndFunction

Function SetupDefensiveBattery(SpaceshipReference battery)
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		battery.SetEssential(True)
		battery.SetNoBleedoutRecovery(True)
		battery.EnablePartRepair(ShipSystemShieldsHealth, False)
		battery.EnablePartRepair(SpaceshipShieldPower, False)
		battery.DamageValue(ShieldHealth, 10000)
		;battery.DamageValue(ShipSystemShieldsHealth, 10000)
		battery.DamageValue(Health, 10000)
	Else
		battery.SetEssential(False)
	EndIf 
EndFunction


;Set up the Key's turrets, pushing them into the correct Main RefCollection.
Function SetupKeyTurrets()
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		CF_Allies_All.AddRefCollection(KeyTurrets)
		CF_Allies_Main.AddRefCollection(KeyTurrets)
	Else
		SD_Enemies_All.AddRefCollection(KeyTurrets)
		SD_Enemies_Main.AddRefCollection(KeyTurrets)
	EndIf
EndFunction


;Set Ignore Friendly Hits on all allied ships.
Function IgnoreAlliedFriendlyHits()
	RefCollectionAlias allyCollection
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		allyCollection = CF_Allies_All
	Else
		allyCollection = SD_Allies_All
	EndIf
	int i = 0
	int count = allyCollection.GetCount()
	While (i < count)
		;Debug.Trace("Ignoring friendly hits against " + (allyCollection.GetAt(i) as SpaceshipReference))
		(allyCollection.GetAt(i) as SpaceshipReference).IgnoreFriendlyHits()
		i = i + 1
	EndWhile
EndFunction

;Clean up the CF05 Jade Swan, in case it didn't get disabled by CF05 previously.
Function CleanupCF05JadeSwan()
	ObjectReference[] jadeSwanShips = PlayerShip.GetRef().FindAllReferencesWithKeyword(CF05_JadeSwanShipKeyword, 100000)
	int i = 0
	While (i < jadeSwanShips.Length)
		if (jadeSwanShips[i].IsCreated())
			Debug.Trace("WARN: Found CF05 Jade Swan. Disabling it.", 1)
			jadeSwanShips[i].DisableNoWait()
		EndIf
		i = i + 1
	EndWhile
EndFunction

;Register for LoadingMenu events, which we use to control scene timings.
Function RegisterForLoadScreenEvent()
	RegisterForMenuOpenCloseEvent("LoadingMenu")
EndFunction



;------------------------------------
;Event Handling
;---------------

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSource, Location akOldLocation, Location akNewLocation)
	if ((GetStageDone(CONST_Stage_CF_Skip)) || (GetStageDone(CONST_Stage_SD_Skip)))
		;Do nothing.
	ElseIf ((!GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)) && (!GetStageDone(CONST_Stage_SD_PlayerSidesWithSD)))
		if (akNewLocation == KeySpaceCellLoc)
			SetStage(CONST_Stage_CF_PlayerSidesWithCF)
		ElseIf (akNewLocation == VigilanceSpaceCellLoc) && CF_SysDefShutdown.GetValueInt() == 0
			SetStage(CONST_Stage_SD_PlayerSidesWithSD)
		EndIf
	EndIf
	if (akNewLocation == KeySpaceCellLoc)
		if (Main_MusicOverrideActive)
			MUSGenesisCombatBoss_CF08SpaceBattle.Add()
		ElseIf (((GetStageDone(CONST_Stage_CF_MainReady) && !GetStageDone(CONST_Stage_CF_StartMainDone))) || \
			((GetStageDone(CONST_Stage_SD_CompletedGammaSceneDone) && !GetStageDone(CONST_Stage_SD_StartMainDone))))
			Main_SetPlayerControlsEnabled(False)
		EndIf
	ElseIf (Main_MusicOverrideActive)
		MUSGenesisCombatBoss_CF08SpaceBattle.Remove()
	EndIf
EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	if (!abOpening)
		Location currentLocation = PlayerShip.GetRef().GetCurrentLocation()
		if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
			if (currentLocation == DBAlphaSpaceCellLoc)
				SetStage(CONST_Stage_CF_StartAlpha)
			ElseIf (currentLocation == DBBetaSpaceCellLoc)
				SetStage(CONST_Stage_CF_StartBeta)
			ElseIf (currentLocation == DBGammaSpaceCellLoc)
				SetStage(CONST_Stage_CF_StartGamma)
			ElseIf ((currentLocation == KeySpaceCellLoc) && (GetStageDone(CONST_Stage_CF_MainReady)))
				CleanupCF05JadeSwan()
				SetStage(CONST_Stage_CF_StartMain)
				UnregisterForMenuOpenCloseEvent("LoadingMenu")
			EndIf
		Else ;CONST_Stage_SD_PlayerSidesWithSD
			if (currentLocation == DBAlphaSpaceCellLoc)
				SetStage(CONST_Stage_SD_StartAlpha)
			ElseIf (currentLocation == DBBetaSpaceCellLoc)
				SetStage(CONST_Stage_SD_StartBeta)
			ElseIf (currentLocation == DBGammaSpaceCellLoc)
				SetStage(CONST_Stage_SD_StartGamma)
			ElseIf (currentLocation == KeySpaceCellLoc)
				CleanupCF05JadeSwan()
				SetStage(CONST_Stage_SD_StartMain)
				UnregisterForMenuOpenCloseEvent("LoadingMenu")
			EndIf
		EndIf
	EndIf
EndEvent

Event OnTimer(int timerID)
	if (timerID == CONST_VigilanceInvulnerableSceneTimerID)
		SetStage(CONST_Stage_CF_VigilanceInvulnerable)
	ElseIf (timerID == CONST_VigilanceInvulnerableMessageTimerID)
		if (!GetStageDone(CONST_Stage_CF_DefensiveBatteriesFiredAtVigilance))
			RegisterForHitEvent(vigilanceRef, playerRef)
		EndIf
	EndIf
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSource, ObjectReference akSenderRef, ObjectReference akKiller)
	Main_CheckForReinforcements(akSenderRef)
EndEvent

Event ReferenceAlias.OnShipDock(ReferenceAlias akSource, bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
	if ((akParent == vigilanceRef) && !abComplete && (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF)))
		SetStage(CONST_Stage_CF_DockedWithVigilance)
		UnregisterForRemoteEvent(akSource, "OnShipDock")
	ElseIf ((akParent == keyRef) && !abComplete && (GetStageDone(CONST_Stage_SD_PlayerSidesWithSD)))
		SetStage(CONST_Stage_SD_DockedWithKey)
		UnregisterForRemoteEvent(akSource, "OnShipDock")
	EndIf
EndEvent

Event ReferenceAlias.OnShipUndock(ReferenceAlias akSource, bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)
	if ((akParent == vigilanceRef) && abComplete && (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF) || GetStageDone(CONST_Stage_CF_Skip)) && (LC088_Vigilance.GetStageDone(CONST_LC088VigilanceStage_Complete)))
		SetStage(CONST_Stage_CF_UndockedWithVigilanceAfterCompleting)
		UnregisterForRemoteEvent(akSource, "OnShipUndock")
	ElseIf ((akParent == keyRef) && abComplete && (GetStageDone(CONST_Stage_SD_PlayerSidesWithSD) || GetStageDone(CONST_Stage_SD_Skip)) && (LC088_Key.GetStageDone(CONST_LC088KeyStage_Complete)))
		SetStage(CONST_Stage_SD_UndockedWithKeyAfterCompleting)
		UnregisterForRemoteEvent(akSource, "OnShipUndock")
	EndIf
EndEvent

;Part of the quickstart setup; wait for the player to sit in the spawned ship's pilot seat.
Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
	waitingForPlayerToSit = False
EndEvent



;------------------------------------
;General Quest Functions & Events
;---------------------------------

Function PlaySpaceScene(Scene sceneToPlay)
	LockGuard(SpaceSceneGuard)
		if (currentSpaceScene != None)
			currentSpaceScene.Stop()
		EndIf
		currentSpaceScene = sceneToPlay
		currentSpaceScene.Start()
	EndLockGuard
EndFunction

Function UnblockIncidentalDialogue(int encounterID)
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		if (encounterID == CONST_EncounterID_Skirmish)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Skirmish)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Skirmish)
		ElseIf (encounterID == CONST_EncounterID_Alpha)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Alpha)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Alpha)
		ElseIf (encounterID == CONST_EncounterID_Beta)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Beta)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Beta)
		ElseIf (encounterID == CONST_EncounterID_Gamma)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Gamma)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Gamma)
		ElseIf (encounterID == CONST_EncounterID_Main)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Allies_Main)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(CF_Enemies_Main)
		EndIf
	Else
		if (encounterID == CONST_EncounterID_Skirmish)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Skirmish)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Skirmish)
		ElseIf (encounterID == CONST_EncounterID_Alpha)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Alpha)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Alpha)
		ElseIf (encounterID == CONST_EncounterID_Beta)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Beta)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Beta)
		ElseIf (encounterID == CONST_EncounterID_Gamma)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Gamma)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Gamma)
		ElseIf (encounterID == CONST_EncounterID_Main)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Allies_Main_SysDefFleet)
			IncidentalDialogueBlockedCollection.RemoveRefCollection(SD_Enemies_Main)
		EndIf
	EndIf
EndFunction


Function Main_SetPlayerControlsEnabled(bool enableControls)
	if (LC088SpaceEnableLayer == None)
		LC088SpaceEnableLayer = InputEnableLayer.Create()
	EndIf
	LC088SpaceEnableLayer.EnableMovement(enableControls)
	LC088SpaceEnableLayer.EnableFighting(enableControls)
EndFunction

Function Main_EVPAllNoWait(bool shouldStopCombat=False)
	Var[] akArgs = new Var[1]
	akArgs[0] = shouldStopCombat
	CallFunctionNoWait("Main_EVPAll", akArgs)
EndFunction

Function Main_EVPAll(bool shouldStopCombat=False)
	Vigilance.TryToEvaluatePackage()
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		Main_EVPAllCollection(CF_Allies_Main, shouldStopCombat)
		Main_EVPAllCollection(CF_Enemies_Main, shouldStopCombat)
	Else
		Main_EVPAllCollection(SD_Allies_Group, shouldStopCombat)
		Main_EVPAllCollection(SD_Allies_Main_SysDefFleet, shouldStopCombat)
		Main_EVPAllCollection(SD_Enemies_Main, shouldStopCombat)
	EndIf
EndFunction

Function Main_EVPAllCollection(RefCollectionAlias refCol, bool shouldStopCombat)
	SpaceshipReference[] refColShips = refCol.GetArray() as SpaceshipReference[]
	int i = 0
	While (i < refColShips.Length)
		if (!refColShips[i].IsDisabled())
			if (shouldStopCombat)
				refColShips[i].StopCombat()
			EndIf
			refColShips[i].EvaluatePackage()
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function Main_SetMusicOverrideActive(bool shouldBeActive)
	Main_MusicOverrideActive = shouldBeActive
	if (Main_MusicOverrideActive)
		MUSGenesisCombatBoss_CF08SpaceBattle.Add()
	Else
		MUSGenesisCombatBoss_CF08SpaceBattle.Remove()
	EndIf
EndFunction


Function Main_FormCFBattleLine()
	SpaceshipReference[] mainShips
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		mainShips = CF_Allies_Main.GetArray() as SpaceshipReference[]
	Else
		mainShips = SD_Enemies_Main.GetArray() as SpaceshipReference[]
	EndIf
	int i = 0
	While (i < mainShips.Length)
		if (KeyTurrets.Find(mainShips[i]) < 0)
			ObjectReference battleLinePosition = mainShips[i].GetLinkedRef(LC088_Space_CF_LinkToFormationKeyword)
			if (battleLinePosition != None)
				mainShips[i].Enable()
				mainShips[i].InstantUndock()
				mainShips[i].MoveTo(battleLinePosition)
				mainShips[i].EvaluatePackage()
			EndIf
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function Main_EnableSDFleet(RefCollectionAlias SDFleetCollection)
	;Get the Vigilance in position while still disabled.
	vigilanceRef.Disable()
	vigilanceRef.MoveTo(VigilanceArrivalMarker.GetRef())
	;Enable the other ships.
	SpaceshipReference[] SDFleetRefs = SDFleetCollection.GetArray() as SpaceshipReference[]
	int i = 0
	While (i < SDFleetRefs.Length)
		SDFleetRefs[i].EnableWithGravJumpNoWait()
		Utility.Wait(Utility.RandomFloat(CONST_SDFleetEnableDelayMin, CONST_SDFleetEnableDelayMax))
		i = i + 1
	EndWhile
	;Then enable the Vigilance last.
	Utility.Wait(CONST_SDFleetEnableDelayVigilance)
	Main_EnableVigilance()
EndFunction

Function Main_EnableVigilance()
	vigilanceRef.MoveTo(VigilanceArrivalMarker.GetRef())
	vigilanceRef.EnableWithGravJump()
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		StartTimer(0, CONST_VigilanceInvulnerableMessageTimerID)
	EndIf
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
	bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	if (!GetStageDone(CONST_Stage_CF_DefensiveBatteriesFiredAtVigilance))
		LC088_Space_VigilanceShieldsImpenetrableMessage.Show()
		StartTimer(CONST_VigilanceInvulnerableMessageTimerDelay, CONST_VigilanceInvulnerableMessageTimerID)
	EndIf
EndEvent

Function Main_CheckForReinforcements(ObjectReference killedShip)
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		if (CF_Enemies_Main.Find(killedShip) >= 0)
			CF_Enemies_Main.RemoveRef(killedShip)
			LC088SpaceMainEnemiesKilled.Mod(1)
		EndIf
		LockGuard(ReinforcementsGuard)
			if ((Main_ReinforcementWavesTriggered == 0) && (LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_ReinforcementTriggerCount_1))
				Main_ReinforcementWavesTriggered = 1
				SetStage(CONST_Stage_CF_Reinforcements1)
			EndIf
			if ((Main_ReinforcementWavesTriggered == 1) && (LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_ReinforcementTriggerCount_2))
				Main_ReinforcementWavesTriggered = 2
				SetStage(CONST_Stage_CF_Reinforcements2)
			EndIf
			if ((Main_ReinforcementWavesTriggered == 2) && (LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_ReinforcementTriggerCount_3))
				Main_ReinforcementWavesTriggered = 3
				SetStage(CONST_Stage_CF_Reinforcements3)
			EndIf
			if ((Main_ReinforcementWavesTriggered == 3) && (LC088SpaceMainEnemiesKilled.GetValueInt() >= CF_Main_AllEnemiesDefeatedCount_4))
				Main_ReinforcementWavesTriggered = 4
				SetStage(CONST_Stage_CF_AllEscortsDefeated)
			EndIf			
		EndLockGuard
	Else ;GetStageDone(CONST_Stage_CF_PlayerSidesWithSD)
		if (SD_Enemies_Main.Find(killedShip) >= 0)
			SD_Enemies_Main.RemoveRef(killedShip)
			LC088SpaceMainEnemiesKilled.Mod(1)
		EndIf
		LockGuard(ReinforcementsGuard)
			if ((Main_ReinforcementWavesTriggered == 0) && (LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_ReinforcementTriggerCount_1))
				Main_ReinforcementWavesTriggered = 1
				Main_TriggerReinforcements(1)
			EndIf
			if ((Main_ReinforcementWavesTriggered == 1) && (LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_ReinforcementTriggerCount_2))
				Main_ReinforcementWavesTriggered = 2
				Main_TriggerReinforcements(2)
			EndIf
			if ((Main_ReinforcementWavesTriggered == 2) && (LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_ReinforcementTriggerCount_3))
				Main_ReinforcementWavesTriggered = 3
				SetStage(CONST_Stage_SD_Reinforcements3)
			EndIf
			if ((Main_ReinforcementWavesTriggered == 3) && (LC088SpaceMainEnemiesKilled.GetValueInt() >= SD_Main_AllEnemiesDefeatedCount_4))
				Main_ReinforcementWavesTriggered = 4
				SetStage(CONST_Stage_SD_MainBattleCompleted)
			EndIf	
		EndLockGuard
	EndIf
EndFunction

Function Main_TriggerReinforcements(int wave)
	Var[] akArgs = new Var[1]
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		if (wave == 1)
			CF_Enemies_Main.AddRefCollection(CF_Enemies_Main_Reinforcements_1)
			CF_EnableEnemyReinforcementsMain(CF_Enemies_Main_Reinforcements_1, vigilanceRef)
		ElseIf (wave == 2)
			CF_EnableAllyReinforcementsMain(CF_Allies_Main_Reinforcements, vigilanceRef)
		ElseIf (wave == 3)
			CF_Enemies_Main.AddRefCollection(CF_Enemies_Main_Reinforcements_2)
			CF_EnableEnemyReinforcementsMain(CF_Enemies_Main_Reinforcements_2, vigilanceRef)
		EndIf
	Else ;GetStageDone(CONST_Stage_CF_PlayerSidesWithSD)
		if (wave == 1)
			SD_Enemies_Main.AddRefCollection(SD_Enemies_Main_Reinforcements_1)
			SD_UndockReinforcements(SD_Enemies_Main_Reinforcements_1)
		ElseIf (wave == 2)
			SD_Enemies_Main.AddRefCollection(SD_Enemies_Main_Reinforcements_2)
			SD_UndockReinforcements(SD_Enemies_Main_Reinforcements_2)
		ElseIf (wave == 3)
			Main_EnableSDFleet(SD_Allies_Main_SysDefFleet)
		EndIf
	EndIf
EndFunction


;------------------------------------
;CF-Specific Functions
;---------------------------------

Function CF_EnableAllyReinforcementsBattery(RefCollectionAlias reinforcements, ObjectReference fallbackRef)
	SpaceshipReference[] reinforcementShips = reinforcements.GetArray() as SpaceshipReference[]
	SpaceshipReference captainShip = reinforcementShips[reinforcementShips.Length-1]
	;Enable the Captain first, and wait for their arrival.
	captainShip.Disable()
	CF_EnableReinforcement(captainShip, fallbackRef, True)
	;Then enable the other allies.
	int i = 0
	While (i < reinforcementShips.Length-1)
		CF_EnableReinforcement(reinforcementShips[i], fallbackRef, False)
		i = i + 1
	EndWhile
	Utility.Wait(1)
EndFunction

Function CF_EnableEnemyReinforcementsMain(RefCollectionAlias reinforcements, ObjectReference fallbackRef)
	SpaceshipReference[] reinforcementShips = reinforcements.GetArray() as SpaceshipReference[]
	int i = 0
	While (i < reinforcementShips.Length)
		CF_EnableReinforcement(reinforcementShips[i], fallbackRef, False)
		i = i + 1
	EndWhile
EndFunction

Function CF_EnableAllyReinforcementsMain(RefCollectionAlias reinforcements, ObjectReference fallbackRef)
	SpaceshipReference[] reinforcementShips = reinforcements.GetArray() as SpaceshipReference[]
	int i = 0
	While (i < reinforcementShips.Length)
		reinforcementShips[i].Disable()
		reinforcementShips[i].RestoreValue(Health, reinforcementShips[i].GetBaseValue(Health) / 2)
		CF_EnableReinforcement(reinforcementShips[i], fallbackRef, True)
		i = i + 1
	EndWhile
EndFunction

Function CF_EnableReinforcement(SpaceshipReference ship, ObjectReference fallbackRef, bool shouldWaitForJump)
	;Enable the specified ship.
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	if ((playerShipRef.GetCurrentLocation() == fallbackRef.GetCurrentLocation()) || (playerShipRef.GetDistance(fallbackRef) < CONST_ReinforcementMaxDistanceFromFallback))
		ship.MoveNear(playerShipRef, CONST_NearPosition_ForwardTight, CONST_NearDistance_Short, CONST_NearFacing_AwayLarge)
		Debug.Trace("CF_EnableReinforcements enabled: " + ship + " at " + playerShipRef)
	Else
		ship.MoveNear(fallbackRef, CONST_NearPosition_ForwardTight, CONST_NearDistance_Short, CONST_NearFacing_AwayLarge)
		Debug.Trace("CF_EnableReinforcements enabled: " + ship + " at fallback " + fallbackRef)
	EndIf
	if (shouldWaitForJump)
		ship.EnableWithGravJump()
	Else
		ship.EnableWithGravJumpNoWait()
	EndIf
	ship.SetForwardVelocity(CONST_ReinforcementForwardVelocityPercent)
EndFunction

;When the player secures a Defensive Battery, add the regen spell to begin healing it.
Function CF_RestoreDefensiveBattery(SpaceshipReference batteryToRestore)
	(batteryToRestore as LC088_DefensiveBatteryScript).RegenBattery()
EndFunction

;At the beginning of the main battle, wait a few seconds, then trigger "The Vigilance is Invulnerable" scene.
Function CF_Main_ReadyForVigilanceInvulnerableScene()
	StartTimer(CONST_VigilanceInvulnerableSceneWaitDelay, CONST_VigilanceInvulnerableSceneTimerID)
EndFunction

;Fire the Defensive Batteries at the Vigilance.
Function CF_Main_FireBatteriesAtVigilance()
	if (LC088_Space_UseNewDefensiveBatteryFireVFX.GetValue() > 0)
		LC088_Space_DefensiveBatteriesFireOnVigilance.Play(vigilanceRef)
	Else
		LC088_DefensiveBatteryFireProjectileSpell.Cast(DefensiveBatteryAlphaProjectileSourceMarker.GetRef(), vigilanceRef)
		LC088_DefensiveBatteryFireProjectileSpell.Cast(DefensiveBatteryBetaProjectileSourceMarker.GetRef(), vigilanceRef)
		LC088_DefensiveBatteryFireProjectileSpell.Cast(DefensiveBatteryGammaProjectileSourceMarker.GetRef(), vigilanceRef)
	EndIf
EndFunction

Function CF_Main_RemoveVigilanceInvulnerability()
	Utility.Wait(LC088_Space_DefensiveBatteryFireToShieldDegenDelay.GetValue())
	vigilanceRef.AddPerk(LC088_Space_VigilanceDamageReductionPerk)
	int i = 0
	While (i < CONST_VigilanceShieldDamageIncrements)
		vigilanceRef.DamageValue(ShieldHealth, CONST_VigilanceShieldDamagePerIncrement)
		Utility.Wait(CONST_VigilanceShieldDamageDelayPerIncrement)
		i = i + 1
	EndWhile
	vigilanceRef.DamageValue(ShipSystemShieldsHealth, CONST_VigilanceShieldSystemMaxDamage)
	vigilanceRef.RemovePerk(LC088_Space_VigilanceDamageImmunityPerk)
	vigilanceRef.RemoveKeyword(DisallowAsCombatTargetKeyword)
	Debug.Trace("VIGILANCE Shields Down")
EndFunction

int CONST_VigilanceShieldDamageIncrements = 60 Const
int CONST_VigilanceShieldDamagePerIncrement = 85 Const
int CONST_VigilanceShieldSystemMaxDamage = 10000 Const
float CONST_VigilanceShieldDamageDelayPerIncrement = 0.1 Const

;Push the Captains' ships to dock with the Vigilance.
Function CF_Main_StartDockingWithVigilance()
	;Naeva's ship always docks with the Vigilance, so one of our slots is used up.
	int vigilanceDockingCount = 1
	int i = 0
	While ((i < CF_Captains_All.GetCount()) && (vigilanceDockingCount < CONST_VigilanceDockingLimit))
		SpaceshipReference current = CF_Captains_All.GetAt(i) as SpaceshipReference
		if (current.GetLinkedRef(LC088_Space_CF_CaptainsDockingLinkToVigilance) == None)
			current.SetLinkedRef(vigilanceRef, LC088_Space_CF_CaptainsDockingLinkToVigilance)
			vigilanceDockingCount = vigilanceDockingCount + 1
		EndIf
		i = i + 1
	EndWhile
	CF_Captains_All.EvaluateAll()
EndFunction


;------------------------------------
;SD-Specific Functions
;---------------------------------

;Set up SysDef Enemy Reinforcements in the Main Battle to start docked with the Key.
Function SD_SetupMainEnemyReinforcements()
	SD_SetupMainEnemyReinforcementsCollection(SD_Enemies_Main_Reinforcements_1)
	SD_SetupMainEnemyReinforcementsCollection(SD_Enemies_Main_Reinforcements_2)
EndFunction

Function SD_SetupMainEnemyReinforcementsCollection(RefCollectionAlias reinforcementCol)
	SpaceshipReference[] reinforcementShipRefs = reinforcementCol.GetArray() as SpaceshipReference[]
	int i = 0
	While (i < reinforcementShipRefs.Length)
		SpaceshipReference currentShip = reinforcementShipRefs[i]
		currentShip.AddKeyword(LC088_Space_SD_ReinforcementDockedWithKeyKeyword)
		currentShip.SetValue(HideShipFromHUDValue, 1)
		currentShip.EvaluatePackage()
		currentShip.InstantDock(keyRef)
		Debug.Trace("SD_SetupMainEnemyReinforcementsCollection docked " + currentShip + " to the Key.")
		i = i + 1
	EndWhile
EndFunction

;Set up the SysDef Ally Group that moves from battle to battle with the player.
Function SD_SetupAllyGroup()
	;Setup Toft's Ship
	SpaceshipReference toftShipRef = SD_ToftShip.GetShipRef()
	toftShipRef.SetEssential(True)
	SD_Allies_All.AddRef(toftShipRef)
	SD_Allies_Group.AddRef(toftShipRef)
	;Set up Archangel's Ship
	SpaceshipReference archangelShipRef = SD_ArchangelShip.GetShipRef()
	archangelShipRef.SetEssential(True)
	SD_Allies_All.AddRef(archangelShipRef)
	SD_Allies_Group.AddRef(archangelShipRef)
	;Then add the generic allies for Alpha.
	SD_Allies_Group.AddRefCollection(SD_Allies_Alpha)
EndFunction

;Update and move the SysDef Ally Group to the next location.
Function SD_UpdateAndMoveAllyGroup(int encounterID)
	if (encounterID == CONST_EncounterID_Alpha)
		;No need to cleanup or update the ally group-- SD_SetupAllyGroup adds all of the allies for Alpha and Beta.
		SD_MoveAllyGroup(SD_Alpha_ArrivalPointMarkerChainHead.GetRef(), encounterID)
	ElseIf (encounterID == CONST_EncounterID_Beta)
		SD_CleanupAllyGroup()
		;No need to update the ally group, since we're only moving the allies from Alpha.
		SD_MoveAllyGroup(SD_Beta_ArrivalPointMarkerChainHead.GetRef(), encounterID)
	ElseIf (encounterID == CONST_EncounterID_Gamma)
		SD_CleanupAllyGroup()
		SD_UpdateAllyGroup(SD_Allies_Beta, CONST_SDAlliesMax_Gamma)
		SD_MoveAllyGroup(SD_Gamma_ArrivalPointMarkerChainHead.GetRef(), encounterID)
	ElseIf (encounterID == CONST_EncounterID_Main)
		SD_CleanupAllyGroup()
		SD_UpdateAllyGroup(SD_Allies_Gamma, CONST_SDAlliesMax_Main)
		SD_MoveAllyGroup(SD_Main_ArrivalPointMarkerChainHead.GetRef(), encounterID)
	Else
		Debug.Trace("ERROR: SD_UpdateAndMoveAllyGroup had invalid move location " + encounterID)
	EndIf
EndFunction

;Remove dead ships from the ally group. Disable any living ships to prepare to move them to the next location.
Function SD_CleanupAllyGroup()
	SpaceshipReference[] allyGroupRefs = SD_Allies_Group.GetArray() as SpaceshipReference[]
	int i = 0
	While (i < allyGroupRefs.Length)
		SpaceshipReference currentShip = allyGroupRefs[i]
		if (currentShip.IsDead())
			SD_Allies_Group.RemoveRef(currentShip)
			Debug.Trace("SD Allies: Removed dead ship " + currentShip)
		Else
			currentShip.DisableNoWait()
			if (currentShip.IsEssential())
				float currentHealth = currentShip.GetValue(Health)
				float minHealth = currentShip.GetBaseValue(Health) / 2
				if (currentHealth < minHealth)
					currentShip.RestoreValue(Health, minHealth - currentHealth)
				EndIf
			EndIf
		EndIf
		i = i + 1
	EndWhile
EndFunction

;Add additional ships, up to maxAllies, to the ally group.
;Disable any ships not added to the group.
;Add all ships in the group to the Incidental Dialogue Blocked collection.
Function SD_UpdateAllyGroup(RefCollectionAlias refCollectionToAdd, int maxAllies)
	SpaceshipReference[] newAllyRefs = refCollectionToAdd.GetArray() as SpaceshipReference[]
	int alliesInGroup = SD_Allies_Group.GetCount()
	int i = 0
	While ((alliesInGroup < maxAllies) && (i < newAllyRefs.Length))
		SpaceshipReference currentShip = newAllyRefs[i]
		if ((!currentShip.IsDead()) && (!currentShip.IsDisabled()))
			SD_Allies_Group.AddRef(currentShip)
			alliesInGroup = alliesInGroup + 1
			;Debug.Trace("SD Allies: Added new ally " + currentShip)
		EndIf
		i = i + 1
	EndWhile
	While (i < newAllyRefs.Length)
		newAllyRefs[i].DisableNoWait()
		;Debug.Trace("SD Allies: Bypassing excess ally " + newAllyRefs[i])
		i = i + 1
	EndWhile
	IncidentalDialogueBlockedCollection.AddRefCollection(SD_Allies_Group)
EndFunction

;Move ships in the ally group to a chain of marks at the new location, having them jump in as they arrive.
Function SD_MoveAllyGroup(ObjectReference allyMoveToMarker, int encounterID)
	int offsetForwardShift
	if (encounterID == CONST_EncounterID_Main) 
		offsetForwardShift = CONST_SDAlliesForwardShiftDistance_Main
	Else
		offsetForwardShift = CONST_SDAlliesForwardShiftDistance_Batteries
	EndIf
	SpaceshipReference toftShipRef = SD_ToftShip.GetShipRef()
	SpaceshipReference[] allyGroupRefs = SD_Allies_Group.GetArray() as SpaceshipReference[]
	ObjectReference nextAllyMoveToMarker = allyMoveToMarker.GetLinkedRef()
	float[] offsetValues = new float[3]
	ObjectReference playerMarker = PlayerShip.GetRef().PlaceAtMe(XMarkerHeading)
	int i = 0
	While ((i < allyGroupRefs.Length) && (nextAllyMoveToMarker != None))
		offsetValues[0] = nextAllyMoveToMarker.GetPositionX() - playerMarker.GetPositionX()
		offsetValues[1] = nextAllyMoveToMarker.GetPositionY() - playerMarker.GetPositionY() + offsetForwardShift
		offsetValues[2] = nextAllyMoveToMarker.GetPositionZ() - playerMarker.GetPositionZ()
		ObjectReference jumpMarker = playerMarker.PlaceAtMe(XMarkerHeading, akOffsetValues=offsetValues)
		SpaceshipReference currentShip = allyGroupRefs[i]
		currentShip.MoveTo(jumpMarker)
		if (currentShip != toftShipRef)
			currentShip.EnableWithGravJumpNoWait()
			currentShip.EvaluatePackage()
			;Debug.Trace("SD Allies: Now Arriving: " + i + " " + currentShip)
		EndIf
		nextAllyMoveToMarker = nextAllyMoveToMarker.GetLinkedRef()
		jumpMarker.Delete()
		i = i + 1
	EndWhile
	toftShipRef.EnableWithGravJump()
	toftShipRef.EvaluatePackage()
	playerMarker.Delete()
EndFunction

;When the player destroys a Defensive Battery, find a surviving enemy ship to play LC088_Space_SD_225_BatteryDestroyed.
Function SD_PlayBatteryDestroyedScene(int encounterID)
	SD_LastBatteryDestroyedID = encounterID
	SpaceshipReference[] speakerRefCol
	if (encounterID == CONST_EncounterID_Alpha)
		speakerRefCol = SD_Enemies_Alpha.GetArray() as SpaceshipReference[]
	ElseIf (encounterID == CONST_EncounterID_Beta)
		speakerRefCol = SD_Enemies_Beta.GetArray() as SpaceshipReference[]
	ElseIf (encounterID == CONST_EncounterID_Gamma)
		speakerRefCol = SD_Enemies_Gamma.GetArray() as SpaceshipReference[]
	EndIf
	bool foundBatteryDestroyedSpeaker
	int i = 0
	While (!foundBatteryDestroyedSpeaker && (i < speakerRefCol.Length))
		SpaceshipReference currentShip = speakerRefCol[i]
		if (!currentShip.IsDead())
			foundBatteryDestroyedSpeaker = True
			SD_BatteryDestroyedSpeaker.ForceRefTo(currentShip)
			PlaySpaceScene(LC088_Space_SD_225_BatteryDestroyed)
		EndIf
		i = i + 1
	EndWhile
	if (!foundBatteryDestroyedSpeaker)
		SD_PlayBatteryPhaseCompleteScene(encounterID)
	EndIf
EndFunction

;After playing LC088_Space_SD_225_BatteryDestroyed, or when the player destroys all of the enemies at a battery,
;play LC088_Space_SD_226_BatteryPhaseComplete to remind the player of their other objective.
Function SD_PlayBatteryPhaseCompleteScene(int encounterID = -1)
	if (encounterID == -1)
		encounterID = SD_LastBatteryDestroyedID
	EndIf
	LockGuard(SpaceSceneGuard)
		if (((encounterID == 1) && (!GetStageDone(CONST_Stage_SD_CompletedAlpha))) || \
			((encounterID == 2) && (!GetStageDone(CONST_Stage_SD_CompletedBeta))) || \
			((encounterID == 3) && (!GetStageDone(CONST_Stage_SD_CompletedGamma))))
			PlaySpaceScene(LC088_Space_SD_226_BatteryPhaseComplete)
		EndIf
	EndLockGuard
EndFunction

;Calculate the enemy counts to be used for the main battle. This varies depending on which and how many Captains are active.
Function SD_CalculateMainBattleCounts()
	int totalEnemyCount = SD_Enemies_Main.GetCount() + SD_Enemies_Main_Reinforcements_1.GetCount() + SD_Enemies_Main_Reinforcements_2.GetCount()
	SD_Main_ReinforcementTriggerCount_1 = SD_Enemies_Main.GetCount() / 3
	SD_Main_ReinforcementTriggerCount_2 = Math.Min(totalEnemyCount, SD_Main_ReinforcementTriggerCount_1 + (SD_Enemies_Main_Reinforcements_1.GetCount() / 2) + 1) as int
	SD_Main_ReinforcementTriggerCount_3 = Math.Min(totalEnemyCount, SD_Main_ReinforcementTriggerCount_2 + (SD_Enemies_Main_Reinforcements_2.GetCount() / 2) + 1) as int
	SD_Main_AllEnemiesDefeatedCount_4 = totalEnemyCount
	Debug.Trace("SD Main Battle Counts: " + SD_Main_ReinforcementTriggerCount_1 + " " + SD_Main_ReinforcementTriggerCount_2 + " " + SD_Main_ReinforcementTriggerCount_3 + " " + SD_Main_AllEnemiesDefeatedCount_4)
EndFunction

;On the SysDef side of the quest, the CF Reinforcements begin docked to the key. They undock to enter the battle.
Function SD_UndockReinforcements(RefCollectionAlias reinforcementShips)
	Debug.Trace("SD_UndockReinforcements: Called for " + reinforcementShips)
	SpaceshipReference[] reinforcementShipRefs = reinforcementShips.GetArray() as SpaceshipReference[]
	int i = 0
	While (i < reinforcementShipRefs.Length)
		SpaceshipReference currentShip = reinforcementShipRefs[i]
		currentShip.RemoveKeyword(LC088_Space_SD_ReinforcementDockedWithKeyKeyword)
		currentShip.SetValue(HideShipFromHUDValue, 0)
		currentShip.EvaluatePackage()
		Debug.Trace("SD_UndockReinforcements: " + currentShip + " enters as a reinforcement.")
		i = i + 1
		if (i < reinforcementShipRefs.Length)
			Utility.Wait(Utility.RandomFloat(CONST_SDEnemiesMainDelay_Min, CONST_SDEnemiesMainDelay_Max))
		EndIf 
	EndWhile
EndFunction

;Switch the Key to SD Docking.
Function SD_SwitchKeyToSDDocking()
	keyRef.RemoveFromFaction(CrimeFactionCrimsonFleet)
	keyRef.AddToFaction(UCSysDefFaction)
EndFunction

;Disable Toft and Archangel's ships after the player completes LC088_Key, since they return to the Vigilance.
Function SD_DisableAllyLeaderShips()
	SD_ToftShip.TryToDisable()
	SD_ArchangelShip.TryToDisable()
EndFunction


;------------------------------------
;Cleanup & Shutdown
;---------------------------

Function Cleanup()
	playerRef = None
	keyRef = None
	vigilanceRef = None
	KeySpaceCellLoc = None
	VigilanceSpaceCellLoc = None
	DBAlphaSpaceCellLoc = None
	DBBetaSpaceCellLoc = None
	DBGammaSpaceCellLoc = None
	if (LC088SpaceEnableLayer != None)
		LC088SpaceEnableLayer.Delete()
	EndIf
	LockGuard(SpaceSceneGuard)
		currentSpaceScene = None
	EndLockGuard
EndFunction


;------------------------------------
;Data Core Analyzer Support
;---------------------------

Function EnableDataCoreAnalyzer(bool sidedWithCF=False)
	if (sidedWithCF || GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		TheKey_DataCoreAnalyzer_DisableMarkerRef.DisableNoWait()
		TheKey_DataCoreAnalyzer_EnableMarkerRef.EnableNoWait()
	Else
		LC082_DataCoreAnalyzer_DisableMarkerRef.DisableNoWait()
		LC082_DataCoreAnalyzer_EnableMarkerRef.EnableNoWait()
	EndIf
EndFunction

Function InsertDataCore(bool sidedWithCF=False)
	if (sidedWithCF || GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		(TheKey_DataCoreAnalyzer.GetRef() as DefaultMultiStateActivator).SetAnimationState("Done")
	Else
		(LC082_DataCoreAnalyzer.GetRef() as DefaultMultiStateActivator).SetAnimationState("Done")
	EndIf
EndFunction


;------------------------------------
;Utility & Convenience Functions
;--------------------------------

;Enable or disable docking with a specified ship.
Function SetDockingEnabled(SpaceshipReference shipRef, bool SetDockingEnabled)
	if (SetDockingEnabled)
		shipRef.SetValue(DockingPermission, CONST_DockingPermission_Any)
	Else
		shipRef.SetValue(DockingPermission, CONST_DockingPermission_Never)
	EndIf
EndFunction

Function SetUpGammaShipsAll()
	GammaShipsAll.AddRefCollection(CF_Allies_Gamma)
	GammaShipsAll.AddRefCollection(CF_Enemies_Gamma)
	GammaShipsAll.AddRefCollection(SD_Allies_Gamma)
	GammaShipsAll.AddRefCollection(SD_Enemies_Gamma)
	GammaShipsAll.AddRefCollection(SD_Allies_Group)
EndFunction


;------------------------------------
;Debug Functions
;----------------

;For quickstarts, give the player a ship and crew appropriate to this battle and put them on it. Derived from GoToSpace.
Function DEBUG_GoToSpaceAndWait()
	InputEnableLayer myEnableLayer = InputEnableLayer.Create()
	myEnableLayer.DisablePlayerControls(abCamSwitch=True)
	bool shouldSpawnCFShip = GetStageDone(CONST_Stage_CF_Quickstart) || GetStageDone(CONST_Stage_CF_Skip)
	SpaceshipReference testShip = DEBUG_SpawnPlayerShip(shouldSpawnCFShip)
	testShip.AddItem(ShipRepairKit, 20)
	playerRef.MoveTo(testShip)
	SQ_PlayerShip.HandleShipTakeOff()
	PlayerShipPilotSeat.GetRef().Activate(playerRef)
	myEnableLayer.Delete()
	waitingForPlayerToSit = True
	RegisterForRemoteEvent(Game.GetPlayer(), "OnSit")
	While(waitingForPlayerToSit)
		Utility.Wait(0.5)
	EndWhile
	SQ_Crew.DebugCreateCrewFromFormlist(LC088_Space_QuickstartCrewList, True, testShip)
	Debug.Trace("DEBUG_GoToSpaceAndWait done.")
EndFunction

;For quickstarts, give the player a ship appropriate to this battle.
SpaceshipReference Function DEBUG_SpawnPlayerShip(bool spawnCFShip)
	;Make sure the player can pilot whatever ship we give them.
	playerRef = Game.GetPlayer()
	playerRef.AddPerk(Skill_Piloting)
	playerRef.AddPerk(Skill_Piloting)
	playerRef.AddPerk(Skill_Piloting)
	playerRef.AddPerk(Skill_Piloting)
	;Then spawn an appropriate ship.
	SpaceshipReference testShip
	if (spawnCFShip)
		testShip = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShipCF, aiLevelMod=CONST_AILevelMod_Hard)
	Else
		testShip = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShipSD, aiLevelMod=CONST_AILevelMod_Hard)
	EndIf
	SQ_PlayerShip.ResetPlayerShip(testShip)
	SQ_PlayerShip.ResetHomeShip(testShip)
	return testShip
EndFunction

;Force-kill a number of ships in the main battle.
Function DEBUG_KillMain(int numToKill)
	SpaceshipReference[] mainEnemyRefs
	if (GetStageDone(CONST_Stage_CF_PlayerSidesWithCF))
		mainEnemyRefs = CF_Enemies_Main.GetArray() as SpaceshipReference[]
	Else
		mainEnemyRefs = SD_Enemies_Main.GetArray() as SpaceshipReference[]
	EndIf

	int i = 0
	While ((i < numToKill) && (i < mainEnemyRefs.Length))
		if (mainEnemyRefs[i].IsEssential() || mainEnemyRefs[i].IsDead())
			Debug.Trace("DEBUG_KillMain skips " + mainEnemyRefs[i] + " " + mainEnemyRefs[i].IsEssential() + " " + mainEnemyRefs[i].IsDead())
			mainEnemyRefs.Remove(i)
		Else
			Debug.Trace("DEBUG_KillMain kills " + i + ": " + mainEnemyRefs[i])
			mainEnemyRefs[i].Kill()
			i = i + 1
		EndIf
	EndWhile
EndFunction

;Force-damage the Vigilance to allow boarding.
Function DEBUG_DamageVigilance()
	vigilanceRef.EnablePartRepair(ShipSystemEngineHealth, False)
	vigilanceRef.DamageValue(ShipSystemEngineHealth, vigilanceRef.GetValue(ShipSystemEngineHealth))
	vigilanceRef.DamageValue(ShieldHealth, 100000)
	vigilanceRef.DamageValue(ShipSystemShieldsHealth, 100000)
	vigilanceRef.DamageValue(Health, 100000)
EndFunction