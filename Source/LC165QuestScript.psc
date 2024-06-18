Scriptname LC165QuestScript extends Quest Conditional
{One of the quest script for LC165, Buried Temple. Handles most of the quest logic.}

Struct StarbornDatum
	String StarbornName
	ReferenceAlias StarbornAlias
	Actor starbornActorRef
	RefCollectionAlias StarbornDuplicatesCollection
	String StarbornBattleStartFunctionName
	String StarbornUpdateFunctionName
	String StarbornHitFunctionName
	String StarbornDyingFunctionName
	String StarbornSpellCastFunctionName
	String StarbornSwapCombatStyleFunctionName
	String StarbornOnDistanceLessThanName
	
	float StarbornTimerDelay = 1.0
	Keyword StarbornMovementHoldPositionKeyword
	float StarbornMovementUpdate_NotAtTargetTime = 20.0
	float StarbornMovementUpdate_AtTargetTime = 0.0
	float StarbornMovementUpdate_HealthLossPercentage = 0.0
	int StarbornBattleStartStage = -1
	int StarbornBattleDeathStage = -1
	int StarbornBattleEndStage = -1
EndStruct

Struct AdversaryBattleStageDatum
	String Name
	bool MustExecute
	float StageHealthThreshold = 0.0
	float BackstopHealthThreshold = 0.0
	int StageToSetOnEnterBeforeShifting = -1
	int StageToSetOnEnterAfterShifting = -1
	Spell SpellToAddOnEnter
	String FunctionToCallDuringShift
	String ShiftToTrigger
	bool ShouldUseHoldPreferred
	Keyword HoldPositionKeyword
	RefCollectionAlias HoldPositionMarkers
	bool AllowDemonStage = False
	bool AllowGravWellStage = False
	bool AddTraumaPackStage = False
	bool IsAdversaryFleeStage = False
	bool IsAdversaryEndStage = False
EndStruct


Group QuestProperties
	StarbornDatum[] property StarbornData Auto Mandatory ;NOT Const
	{Data for each of the Starborn minibosses.}

	AdversaryBattleStageDatum[] property AdversaryBattleStageData Auto Mandatory
	{Array of data used for the BOTH battle. This array gets overwritten by the Hunter or Emissary-specific arrays, if appropriate.}

	AdversaryBattleStageDatum[] property AdversaryBattleStageData_Hunter Auto Const Mandatory
	{Array of data used for the HUNTER ONLY battle.}

	AdversaryBattleStageDatum[] property AdversaryBattleStageData_Emissary Auto Const Mandatory
	{Array of data used for the EMISSARY ONLY battle.}
EndGroup


Group AutofillProperties
	SQ_ParentScript property SQ_Parent Auto Const Mandatory
	SQ_FollowersScript property SQ_Followers Auto Const Mandatory
	StarbornTempleQuestScript property StarbornTempleQuest Auto Const Mandatory

	Location property LC165BuriedTempleLocation Auto Const Mandatory
	ReferenceAlias property Companion Auto Const Mandatory
	RefCollectionAlias property Followers Auto Const Mandatory
	ReferenceAlias property Ally Auto Const Mandatory
	ReferenceAlias property Adversary01 Auto Const Mandatory
	ReferenceAlias property Adversary02 Auto Const Mandatory

	Scene property MQ302_191_Entrance_EmissaryJoin Auto Const Mandatory
	Scene property MQ302_191_Entrance_HunterJoin Auto Const Mandatory

	Scene property MQ302_Battle_01_Bridge_BattleStart Auto Const Mandatory
	ReferenceAlias property StarbornBridge_BridgeBoundsTrigger Auto Const Mandatory
	RefCollectionAlias property StarbornBridge_HoldPositionTrigger Auto Const Mandatory
	RefCollectionAlias property StarbornBridge_InitialDuplicateSpawnPoints Auto Const Mandatory
	RefCollectionAlias property StarbornBridge_ChargerTeleportPoints Auto Const Mandatory
	RefCollectionAlias property StarbornBridge_AssaultTeleportPoints Auto Const Mandatory
	RefCollectionAlias property StarbornBridge_SniperTeleportPoints Auto Const Mandatory
	FormList property LC165_Starborn_Bridge_TeleportPointMarkerList Auto Const Mandatory
	Spell property LC165_Starborn_Bridge_ScriptedParallelSelfInitialSpell Auto Const Mandatory
	Spell property LC165_Starborn_Bridge_ScriptedParallelSelfSpell Auto Const Mandatory
	ActorValue property LC165_Starborn_Bridge_CombatStyleValue Auto Const Mandatory
	ActorValue property LC165_Starborn_Bridge_HasPerformedInitialTeleportValue Auto Const Mandatory
	Keyword property LC165_Starborn_Bridge_DuplicationLines Auto Const Mandatory
	ObjectReference property LC165ExteriorHoldingPenMarkerRef Auto Const Mandatory

	Scene property MQ302_Battle_02_Courtyard_MassReanimate01 Auto Const Mandatory
	Scene property MQ302_Battle_02_Courtyard_MassReanimate02 Auto Const Mandatory
	Scene property MQ302_Battle_02_Courtyard_MassReanimate03 Auto Const Mandatory
	RefCollectionAlias property StarbornCourtyard_ReanimateTargets Auto Const Mandatory
	RefCollectionAlias property StarbornCourtyard_ReanimateTargets_Wave01 Auto Const Mandatory
	RefCollectionAlias property StarbornCourtyard_ReanimateTargets_Wave02 Auto Const Mandatory
	RefCollectionAlias property StarbornCourtyard_ReanimateTargets_Wave03 Auto Const Mandatory
	RefCollectionAlias property StarbornCourtyard_HoldPositionTargets Auto Const Mandatory
	RefCollectionAlias property StarbornCourtyard_Navcut Auto Const Mandatory

	Scene property MQ302_Battle_03_Engineering_BattleStart Auto Const Mandatory
	ReferenceAlias property StarbornFire Auto Const Mandatory
	ReferenceAlias property StarbornIce Auto Const Mandatory
	ReferenceAlias property StarbornEngineering_HoldPositionTargetInitial Auto Const Mandatory
	ReferenceAlias property StarbornEngineering_GravityWellSourceMarkerInitial Auto Const Mandatory
	RefCollectionAlias property StarbornEngineering_HoldPositionTargets Auto Const Mandatory
	RefCollectionAlias property StarbornEngineering_GravityWellSourceMarkers Auto Const Mandatory
	RefCollectionAlias property StarbornEngineering_RobotsActive Auto Const Mandatory
	RefCollectionAlias property StarbornEngineering_RobotsInactive Auto Const Mandatory
	RefCollectionAlias property StarbornEngineering_TurretsAll Auto Const Mandatory
	Spell property LC165_Starborn_Ice_ScriptedGravityWellSpell Auto Const Mandatory
	Spell property LC165_Starborn_Fire_ScriptedSupernovaSpell Auto Const Mandatory
	Static property LC165_Engineering_GravityWellSourceMarker Auto Const Mandatory

	Scene property MQ302_Battle_05_Ruins_BattleStart Auto Const Mandatory
	Scene property MQ302_Battle_05_Ruins_TeleportReaction Auto Const Mandatory
	ReferenceAlias property StarbornRuins_InitialInnerDemonSpawnPointChainHead Auto Const Mandatory
	ReferenceAlias property StarbornRuins_HoldPositionTrigger Auto Const Mandatory
	RefCollectionAlias property StarbornRuins_ObservingHoldPositionTargets Auto Const Mandatory
	Spell property LC165_Starborn_Adversary_ScriptedInnerDemonSpell Auto Const Mandatory
	Spell property ArtifactPowerSenseStarStuff_Spell Auto Const Mandatory
	Perk property LC165_Starborn_Ruins_InnerDemonPerk Auto Const Mandatory

	Scene property MQ302_Battle_06_Adversary_Museum_Arrival Auto Const Mandatory
	Scene property MQ302_Battle_06_Adversary_EmissaryDeath Auto Const Mandatory
	Scene property MQ302_Battle_06_Adversary_HunterDeath Auto Const Mandatory
	ReferenceAlias property StarbornAdversary_Primary Auto Const Mandatory
	ReferenceAlias property StarbornAdversary_Hunter Auto Const Mandatory
	ReferenceAlias property StarbornAdversary_Emissary Auto Const Mandatory
	ReferenceAlias property StarbornAdversary_ActiveDistortion Auto Const Mandatory
	ReferenceAlias property StarbornAdversary_DeathMarker01 Auto Const Mandatory
	ReferenceAlias property StarbornAdversary_DeathMarker02 Auto Const Mandatory
	ReferenceAlias property StarbornAdversary_InitialDuplicateSpawnPointChainHead Auto Const Mandatory
	ReferenceAlias property StarbornAdversary_Nishina_TeleportMarkerChainHead Auto Const Mandatory
	RefCollectionAlias property StarbornAdversary_Demons Auto Const Mandatory
	RefCollectionAlias property StarbornAdversary_ZeroGImpulseObjects Auto Const Mandatory
	RefCollectionAlias property StarbornAdversary_ZeroGDisableObjects Auto Const Mandatory
	RefCollectionAlias property StarbornAdversary_GravityWellSourceMarkers Auto Const Mandatory
	RefCollectionAlias property StarbornAdversary_Astral_Dancers Auto Const Mandatory
	RefCollectionAlias property StarbornAdversary_NASAMuseum_InitialDemonSpawnPoints Auto Const Mandatory
	ObjectReference property LC165AdversarySoloSceneMarkerRef Auto Const Mandatory
	ObjectReference property LC165Adversary01SceneMarkerRef Auto Const Mandatory
	ObjectReference property LC165Adversary02SceneMarkerRef Auto Const Mandatory
	ObjectReference property LC165AdversarySoloCombatStartMarkerRef Auto Const Mandatory
	ObjectReference property LC165Adversary01CombatStartMarkerRef Auto Const Mandatory
	ObjectReference property LC165Adversary02CombatStartMarkerRef Auto Const Mandatory
	MusicType property MUSGenesisCombatBoss_MQ302B_A_Battles Auto Const Mandatory
	MusicType property MUSGenesisCombatBoss_MQ302B_B_BattleFinal Auto Const Mandatory
	Explosion property ArtifactPower_AntiGravityField Auto Const Mandatory
	Keyword property MQHunterKeyword Auto Const Mandatory
	Keyword property MQEmissaryKeyword Auto Const Mandatory
	Keyword property LC165_StarbornAdversaryInaccessibleKeyword Auto Const Mandatory
	Keyword property LC165_BossHoldPosition_PreferredKeyword Auto Const Mandatory
	Cell property LC165BuriedTemple03 Auto Const Mandatory
	Static property LC165_Adversary_GravityWellSourceMarker Auto Const Mandatory
	Armor property Spacesuit_Starborn_Companion_PlayerOrFollower Auto Const Mandatory

	ReferenceAlias property AllyArrivalMarker Auto Const Mandatory
	Static property LC165_AllyArrivalMarker Auto Const Mandatory
	ReferenceAlias property ExteriorIDCard Auto Const Mandatory
	ReferenceAlias property ExteriorIDCardFallback Auto Const Mandatory
	ReferenceAlias property ExteriorIDCardFallbackSpawnPoint Auto Const Mandatory
	ReferenceAlias property ExteriorIDCardReader Auto Const Mandatory
	ReferenceAlias property ExteriorLoadDoor Auto Const Mandatory

	ReferenceAlias property EngineeringKey Auto Const Mandatory
	ReferenceAlias property EngineeringKeyFallback Auto Const Mandatory
	ReferenceAlias property EngineeringKeyFallbackSpawnPoint Auto Const Mandatory

	ReferenceAlias property MQ302BPetrov Auto Const Mandatory
	ReferenceAlias property PetrovsDoor Auto Const Mandatory

	ReferenceAlias property ElevatorTopActivator Auto Const Mandatory
	ReferenceAlias property ElevatorTopDoor Auto Const Mandatory
	ReferenceAlias property ElevatorBottomActivator Auto Const Mandatory
	ReferenceAlias property ElevatorBottomDoor Auto Const Mandatory
	ReferenceAlias property Elevator01EnableMarker Auto Const Mandatory
	ReferenceAlias property Elevator02EnableMarker Auto Const Mandatory
	ReferenceAlias property Elevator02Gate Auto Const Mandatory
	ReferenceAlias property ElevatorStaticEnableMarker Auto Const Mandatory
	Keyword property LC165LinkElevatorPlatformHelperKeyword Auto Const Mandatory
	Keyword property LC165LinkElevatorDoorKeyword Auto Const Mandatory
	Keyword property LC165LinkElevatorTopCollisionKeyword Auto Const Mandatory
	Keyword property LC165LinkElevatorSoundMarkerKeyword Auto Const Mandatory
	WwiseEvent property WwiseEvent_OBJElevatorLoadStart  Auto Const Mandatory
	WwiseEvent property OBJ_Elevator_Mine_Transit_LP Auto Const Mandatory

	ReferenceAlias property TempleExteriorDoorBars Auto Const Mandatory
	ReferenceAlias property TempleExteriorDoor Auto Const Mandatory
	ReferenceAlias property TempleInteriorDoor Auto Const Mandatory

	ReferenceAlias property ArtifactActivator Auto Const Mandatory
	ReferenceAlias property ArtifactRings Auto Const Mandatory
	ReferenceAlias property ArtifactRingsAudioMarker Auto Const Mandatory
	ReferenceAlias property ArtifactPlatform Auto Const Mandatory
	RefCollectionAlias property ArtifactCollision Auto Const Mandatory
	ReferenceAlias Property SBPowerCollectionActivator Auto Const Mandatory
	Spell property ArtifactPower_GrantSpell_Phased_Time Auto Const Mandatory
	WwiseEvent property WwiseEvent_AMBArtifactVisionX Auto Const Mandatory

	ObjectReference property LC165HoldingPenMarkerRef Auto Const Mandatory
	ObjectReference property LC165AllyHoldingPenMarkerRef Auto Const Mandatory
	Faction property PlayerFriendFaction Auto Const Mandatory
	Faction property LC165StarbornEnemyFaction Auto Const Mandatory
	ActorValue property LC165_StarbornStateValue Auto Const Mandatory
	ActorValue property LC165_StarbornMovementUpdateTimestampValue Auto Const Mandatory
	ActorValue property LC165_StarbornMovementReachedTargetTimestampValue Auto Const Mandatory
	ActorValue property LC165_StarbornMovementHealthPercentStampValue Auto Const Mandatory
	ActorValue property LC165_BossHoldPositionValue Auto Const Mandatory
	ActorValue property LC165_AdversaryFleeValue Auto Const Mandatory
	ActorValue property Health Auto Const Mandatory
	ActorValue property Aggression Auto Const Mandatory
	ActorValue property Confidence Auto Const Mandatory
	ActorValue property Experience Auto Const Mandatory
	ActorValue Property QuantumEssence Auto Const Mandatory
	Keyword[] property StarbornMovementHoldPositionKeywords Auto Const Mandatory
	Keyword property LC165_StarbornEventActorLinkKeyword Auto Const Mandatory
	Keyword property LC165_StarbornDuplicateLinkKeyword Auto Const Mandatory
	Keyword property LinkCustom01 Auto Const Mandatory
	Keyword property LinkCustom02 Auto Const Mandatory
	Message Property QuantumEssenceAddMSG Auto Const Mandatory
	Static property XMarker Auto Const Mandatory
	Spell property LC165_Scripted_VoidFormAb Auto Const Mandatory
	Spell Property AbStarbornDeath Auto Const Mandatory
	Spell property LC165_AbParallelSelfDeath Auto Const Mandatory
	Spell property LC165_AbReanimate Auto Const Mandatory
	Spell property LC165_AbInnerDemonDeath Auto Const Mandatory
	Spell property AIPower_VoidForm Auto Const Mandatory
	Spell property LC165_Scripted_VoidFormSpell Auto Const Mandatory
	Spell Property FortifyQuantumEssenceSpell Mandatory Const Auto
	Hazard property LC165_ScriptedGravWellHazard Auto Const Mandatory
	Explosion property LC165_ScriptedGravWellExplosion Auto Const Mandatory
	Explosion property LC165_ScriptedSupernovaExplosion Auto Const Mandatory
	Explosion property LC165_StarbornReanimateExplosion Auto Const Mandatory
	Explosion Property LC165_StarbornTeleportInExplosion Auto Const Mandatory
	Explosion Property LC165_StarbornTeleportOutExplosion Auto Const Mandatory
	Explosion property LC165_StarbornTeleportSwapExplosion Auto Const Mandatory
	Explosion property LC165_StarbornParallelSelfSpawnExplosion Auto Const Mandatory
	Explosion property LC165_StarbornInnerDemonSpawnExplosion Auto Const Mandatory
	Explosion property LC165_AnomalyTeleportExplosion Auto Const Mandatory
	CombatStyle property LC165_csStarbornChargerBridge Auto Const Mandatory
	CombatStyle property LC165_csStarbornChargerBridge_CastCombatSpell Auto Const Mandatory
	CombatStyle property csStarborn_Sniper Auto Const Mandatory
	CombatStyle property LC165_csStarborn_Sniper_CastCombatSpell Auto Const Mandatory
	CombatStyle property csStarborn_Assault Auto Const Mandatory
	CombatStyle property LC165_csStarborn_Assault_CastCombatSpell Auto Const Mandatory
	CombatStyle property csStarborn_MQHunter Auto Const Mandatory
	CombatStyle property LC165_csStarborn_MQHunter_CastCombatSpell Auto Const Mandatory
	CombatStyle property csStarborn_MQEmissary Auto Const Mandatory
	CombatStyle property LC165_csStarborn_MQEmissary_CastCombatSpell Auto Const Mandatory
	WwiseEvent property WwiseEvent_ShakeController_p75_p75_03 Auto Const Mandatory
	MiscObject Property Artifact_MU Mandatory Const Auto
	RefCollectionAlias Property MQ00_ArtifactsHolder Mandatory Const Auto
	Potion property Aid_MedPack Auto Const Mandatory
	Potion property Aid_TraumaPack Auto Const Mandatory
EndGroup

;Local Variables
Actor player
bool initialized

LC165SpaceQuestScript selfAsSpaceQuestScript			;This script, recast to LC165SpaceQuestScript.
LC165ShiftingQuestScript selfAsShiftingScript			;This script, recast to LC165ShiftingQuestScript.

;General Consts
int CONST_Stage_Quickstart_Space = 0 Const
int CONST_Stage_PlayerTakesArtifactActivator = 1290 Const
int CONST_QuickstartLevel = 50 Const

int CONST_Stage_Startup_HunterEnemy = 20 Const
int CONST_Stage_Startup_EmissaryEnemy = 21 Const
int CONST_Stage_Startup_BothEnemies = 22 Const
int CONST_Stage_SetupAdversaryFaction = 25 Const

int CONST_AILevelMod_Hard = 2 Const
int CONST_Aggression_VeryAggressive = 2 Const
int CONST_Confidence_Foolhardy = 4 Const
int CONST_StarbornShouldCastCombatSpellValue = 5 Const


;General Spellcasting
ObjectReference scriptedGravWellHazard
ObjectReference scriptedExplosionHazard
float scriptedGravWellTimestamp
int demonDuplicateID

float CONST_ParallelSelfOffsetMin = 0.5 Const
float CONST_ParallelSelfOffsetMax = 3.0 Const
int CONST_StarbornAtTargetDistance = 16 Const
float CONST_DissolveVFXDelay = 2.0 Const
float CONST_Gravity_MasadaIII = 1.12 Const


;Ally Arrival
bool property usedSurfaceQuickstart Auto Hidden
int allyArrivalAttempts
ObjectReference[] allyArrivalMarkerChain
int CONST_AllyArrivalTimerDelay = 1 Const
int CONST_AllyArrivalTimerID = 11 Const
int CONST_AllyArrivalAttemptsMax = 10 Const
int CONST_AllyRejoinDistance = 2 Const
int CONST_AllyJoinedStage = 230 Const

;Bridge Event
Actor starbornBridgePrimary
int property bridgeBattleState = 0 Auto Hidden Conditional
bool bridge_WaitingForParallelSelfCast
int bridge_DuplicationLineCountdown = -1
int bridge_DeathCount
int bridge_NextCombatStyle
ObjectReference bridgeBoundsTriggerRef
ObjectReference bridgeHoldPositionTriggerRef
Actor bridgeCharger
Actor bridgeLastHit

int CONST_StarbornBattleState_Bridge_Initial = 0 Const
int CONST_StarbornBattleState_Bridge_Start = 1 Const
int CONST_StarbornBattleState_Bridge_Parallelized_1 = 2 Const
int CONST_StarbornBattleState_Bridge_Parallelized_2 = 3 Const
int CONST_StarbornBattleState_Bridge_Parallelized_3 = 4 Const
int CONST_StarbornBattleState_Bridge_RealEnemyExposed = 5 Const
int CONST_StarbornBattleState_Bridge_Complete = 100 Const

int CONST_StarbornStateValue_Bridge_WaitingForPlayer = 0 Const
int CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfPackage = 1 Const
int CONST_StarbornStateValue_Bridge_Normal = 2 Const
int CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat = 3 Const

int CONST_Bridge_DataIndex = 0 Const

int CONST_Stage_BridgeStarbornParallelSelfReactStage = 310 Const

int CONST_Bridge_DeathCountParallelize_2 = 1 Const
int CONST_Bridge_DeathCountParallelize_3 = 3 Const

int CONST_Bridge_CombatStyle_Sniper = 0 Const
int CONST_Bridge_CombatStyle_Charger = 1 Const
int CONST_Bridge_CombatStyle_Assault = 2 Const

int CONST_Bridge_BridgeCatchupTeleportDistance = 18 Const
int CONST_StarbornBridge_TeleportMarkerSearchRadius = 50 Const

int CONST_BridgeDuplicationLineCountdown_StartValue = 2 Const



;Courtyard Event
int CourtyardBattleState = 0 RequiresGuard(CourtyardBattleStateGuard)
Guard CourtyardBattleStateGuard
Actor[] CourtyardReanimateTargetsAll
Actor[] CourtyardReanimateTargetsRandomized
ObjectReference courtyardLastSwapMarker1
ObjectReference courtyardLastSwapMarker2

int CONST_StarbornBattleState_Courtyard_Initial = 0 Const
int CONST_StarbornBattleState_Courtyard_FirstReanimateReady = 0 Const
int CONST_StarbornBattleState_Courtyard_FirstReanimateActive = 1 Const
int CONST_StarbornBattleState_Courtyard_SecondReanimateReady = 2 Const
int CONST_StarbornBattleState_Courtyard_SecondReanimateActive = 3 Const
int CONST_StarbornBattleState_Courtyard_ThirdReanimateReady = 4 Const
int CONST_StarbornBattleState_Courtyard_ThirdReanimateActive = 5 Const
int CONST_StarbornBattleState_Courtyard_Normal = 6 Const
int CONST_StarbornBattleState_Courtyard_Complete = 100 Const

int CONST_StarbornStateValue_Courtyard_WaitInTower = 0 Const
int CONST_StarbornStateValue_Courtyard_ShouldCastMassReanimate = 1 Const
int CONST_StarbornStateValue_Courtyard_Normal = 2 Const

int CONST_Courtyard_DataIndex = 1 Const
int CONST_Courtyard_MassReanimateDelay = 2 Const
float CONST_Courtyard_PerReanimateDelay = 0.2 Const

int CONST_Courtyard_FirstReanimateActiveStage = 410 Const
int CONST_Courtyard_ThirdReanimateActiveStage = 411 Const

int CONST_Courtyard_FirstReanimateTargetsCount = 6 Const
int CONST_Courtyard_SecondReanimateTargetsCount = 4 Const
int CONST_Courtyard_ThirdReanimateTargetsCount = 5 Const
int CONST_Courtyard_SecondReanimateZombieThreshold = 3 Const
int CONST_Courtyard_ThirdReanimateZombieThreshold = 3 Const


;Exterior ID Card Reader
IDCardReader exteriorIDCardReaderRef
int CONST_Stage_ExteriorIDCardReaderUsedStage = 495 Const


;Engineering Event
int EngineeringBattleState = 0
Actor starbornFireActorRef
Actor starbornIceActorRef
bool starbornFireHasKey
bool starbornFireDead
bool starbornIceDead
bool starbornEngineering_RobotsDisabled

int CONST_StarbornBattleState_Engineering_Initial = 0 Const
int CONST_StarbornBattleState_Engineering_Normal = 1 Const
int CONST_StarbornBattleState_Engineering_Complete = 100 Const

int CONST_StarbornStateValue_Engineering_Normal = 1 Const

int CONST_Fire_DataIndex = 2 Const
int CONST_Ice_DataIndex = 3 Const

int CONST_Stage_EngineeringRobotReactStage = 605 Const
int CONST_Stage_EngineeringHackedStage = 606 Const

int CONST_StarbornEngineering_InitialAppearanceDelay = 3 Const
int CONST_StarbornEngineering_ActiveRobotCountMax = 2 Const

ObjectReference starbornEngineering_GravWellTargetPoint RequiresGuard(EngineeringGravWellGuard)
float CONST_StarbornEngineering_GravWellCastDelay = 10.0 Const
float CONST_StarbornEngineering_GravWellDetonateDelay = 4.0 Const
float CONST_StarbornEngineering_GravWellCastDistance = 10.0 Const

int starbornEngineeringGravWellState RequiresGuard(EngineeringGravWellGuard)
int CONST_StarbornEngineering_GravWellState_WaitToCreate = 0 Const
int CONST_StarbornEngineering_GravWellState_TryToCreate = 1 Const
int CONST_StarbornEngineering_GravWellState_WaitToDetonate = 2 Const
int CONST_StarbornEngineering_GravWellState_TryToDetonate = 3 Const


;Elevator System
InputEnableLayer LC165EnableLayer
int elevatorSFXID
float CONST_Elevator01Speed = 0.07 ;FUDGED. 0.1 would be consistent with CONST_Elevator02Speed (1.0/10, Platform Helper Height=1.5)
float CONST_Elevator02Speed = 0.043 Const ;23s - 1.0/23.33, Platform Helper Height=3.5
int CONST_OpenState_Open = 1 Const
int CONST_ElevatorGateOpenFailsafeCount = 50 Const

bool property Elevator02FinishedAnimation = False Auto Hidden Conditional


;Ruins Event
int RuinsBattleState = 0 ;NOT RequiresGuard(RuinsBattleStateGuard) due to a check that has to be made outside the guard.
int Ruins_HitCountWhileObserving
ObjectReference starbornRuinsTriggerRef
float[] starbornRuinsDemonsRespawnTimes
bool DEBUG_StarbornRuinsBlockDemonSpawning

int CONST_StarbornBattleState_Ruins_Initial = 0 Const
int CONST_StarbornBattleState_Ruins_Observing = 1 Const
int CONST_StarbornBattleState_Ruins_Attacking = 2 Const
int CONST_StarbornBattleState_Ruins_Complete = 100 Const

int CONST_StarbornStateValue_Ruins_Observing = 1 Const
int CONST_StarbornStateValue_Ruins_Attacking = 2 Const

int CONST_Ruins_DataIndex = 4 Const


int CONST_RuinsTargetSelectionAttemptsMax = 4 Const
int CONST_RuinsTeleportDistanceMax = 50 Const

int CONST_RuinsDemonsMax = 6 Const
float CONST_RuinsDemonsRespawnDelay = 15.0 Const

float CONST_RuinsSpawnNearPlayerDistance_Min = 4.0 Const
float CONST_RuinsSpawnNearPlayerDistance_Max = 12.0 Const

int CONST_Stage_Ruins_BattleStartSceneEndedStage = 1001 Const
float CONST_RuinsInitialSpawnDelay = 0.5 Const
int CONST_Ruins_HitCountWhileObserving_Max = 1 Const

float CONST_RuinsTeleportNearPlayerDistance_Min = 8.0 Const
float CONST_RuinsTeleportNearPlayerDistance_Max = 12.0 Const


;Temple Door
DefaultMultiStateActivator templeExteriorDoorRef
DefaultMultiStateActivator templeExteriorDoorBarsRef
DefaultMultiStateActivator templeInteriorDoorRef


;Adversary Boss Battle
int adversaryBattleStageDataIndex
int adversaryLastShiftIndex = -1
bool DEBUG_AdversaryDebugMode
bool templeInteriorInitialized
bool hasDispelledAdversaryVoidForm
bool adversaryCompletedZeroGPhase
bool adversaryHasShiftedAwayFromTemple
bool adversaryBattleComplete

Actor adversary01Ref
Actor adversary02Ref
Actor adversary01DuplicateRef
Actor adversary02DuplicateRef
Actor starbornAdversaryPrimary
Actor starbornAdversaryCurrentPrimary
Actor starbornAdversaryHunter
Actor starbornAdversaryEmissary

int stageToSetOnNextShift = -1
float adversaryHealthBaseTotal
RefCollectionAlias currentAdversaryHoldPositionTargetCollection
bool safeToForceAdversaryShift

int CONST_Adversary_InitAdversaryFailsafeTimeout = 120 Const

int CONST_StarbornBattleState_Adversary_Waiting = 0 Const
int CONST_StarbornBattleState_Adversary_Normal = 1 Const

int CONST_StarbornStateValue_Adversary_Waiting = 0 Const
int CONST_StarbornStateValue_Adversary_Normal = 1 Const
int CONST_StarbornStateValue_Adversary_ShouldCastInitialParallelSelf = 2 Const

int CONST_Adversary_DataIndex = 5 Const
int CONST_Adversary_EmissaryDuplicateCount = 3 Const

int CONST_StarbornAdversary_CheckForStateChangeTimerID = 10 Const
float CONST_StarbornAdversary_CheckForStateChangeTimerDelay = 1.0 Const

int CONST_StarbornAdversary_ShiftsToLoad = 2 Const

int CONST_StarbornAdversary_State_TempleInitial = 0 Const

ObjectReference artifactActivatorRef
ObjectReference artifactRingsRef
ObjectReference artifactPlatformRef
ObjectReference artifactZeroGExplosion
int CONST_StarbornAdversary_ArtifactSurgeDelay = 2 Const

int CONST_ForceAdversaryShiftFailsafe = 200 Const

int starbornAdversaryGravWellState RequiresGuard(AdversaryGravWellGuard)
ObjectReference starbornAdversary_GravWellTargetPoint RequiresGuard(AdversaryGravWellGuard)
float CONST_StarbornAdversary_GravWellCastDelay = 12.0 Const
float CONST_StarbornAdversary_GravWellDetonateDelay = 4.0 Const
float CONST_StarbornAdversary_GravWellCastDistance = 10.0 Const
int CONST_StarbornAdversary_GravWellState_WaitToCreate = 0 Const
int CONST_StarbornAdversary_GravWellState_TryToCreate = 1 Const
int CONST_StarbornAdversary_GravWellState_WaitToDetonate = 2 Const
int CONST_StarbornAdversary_GravWellState_TryToDetonate = 3 Const

int starbornAdversaryDemonState RequiresGuard(AdversaryDemonGuard)
bool starbornAdversaryHasSpawnedInitialDemons
float starbornAdversaryScriptedDemonTimestamp
int CONST_StarbornAdversary_DemonsToSpawnTotal = 5 Const
int CONST_StarbornAdversary_DemonsToSpawnPerCastMax = 3 Const
int CONST_StarbornAdversary_DemonCastDelay = 8 Const
int CONST_StarbornAdversary_DemonState_Waiting = 0 Const
int CONST_StarbornAdversary_DemonState_ReadyToCast = 1 Const

int CONST_AdversaryFleeValue_ShouldNotFlee = 0 Const
int CONST_AdversaryFleeValue_ShouldFleeWithRun = 1 Const
int CONST_AdversaryFleeValue_ShouldFleeWithHoldPosition = 2 Const

int CONST_Adversary_DeathSceneCompletedStage = 1199 Const
int CONST_Adversary_DeathSceneFailsafeTimeout = 300 Const

int CONST_StarbornAdversarySurrenderSceneFailsafe = 100 Const

int CONST_StarbornAdversaryRescueDistance = 50 Const


;Final Artifact
bool waitingForLoadOutOfTemple
int CONST_MQ302BArtifactID = 23 Const
float CONST_AwardFinalArtifactPowerDelay = 3.0 Const
int CONST_Stage_Complete = 2000 Const
float CONST_ArtifactRingSpeed_BeforeBattle = 0.25 Const
float CONST_ArtifactRingSpeed_DuringBattle = 0.50 Const
float CONST_ArtifactRingSpeed_AfterBattle = 0.25 Const


;Guards
Guard ChangeLocationGuard ProtectsFunctionLogic
Guard BridgeParallelSelfGuard ProtectsFunctionLogic
Guard EngineeringGravWellGuard
Guard RuinsBattleStateGuard ProtectsFunctionLogic
Guard AdversaryBattleStageDataGuard ProtectsFunctionLogic
Guard AdversaryShiftingGuard ProtectsFunctionLogic
Guard AdversaryZeroGGuard ProtectsFunctionLogic
Guard AdversaryGravWellGuard
Guard AdversaryDemonGuard



;--------------------------------
;Initialization, Quickstarts
;---------------------------

Event OnQuestInit()
	;Set up local variables.
	player = Game.GetPlayer()
	selfAsSpaceQuestScript = (Self as Quest) as LC165SpaceQuestScript
	selfAsShiftingScript = (Self as Quest) as LC165ShiftingQuestScript
	bridgeBoundsTriggerRef = StarbornBridge_BridgeBoundsTrigger.GetRef()
	bridgeHoldPositionTriggerRef = StarbornBridge_HoldPositionTrigger.GetAt(0)
	templeExteriorDoorBarsRef = TempleExteriorDoorBars.GetRef() as DefaultMultiStateActivator
	templeExteriorDoorRef = TempleExteriorDoor.GetRef() as DefaultMultiStateActivator
	templeInteriorDoorRef = TempleInteriorDoor.GetRef() as DefaultMultiStateActivator

	;Reset actors.
	int i = 0
	While (i < StarbornData.Length)
		StarbornData[i].StarbornAlias.TryToReset()
		StarbornData[i].StarbornDuplicatesCollection.ResetAll()
		i = i + 1
	EndWhile
	StarbornAdversary_Hunter.TryToReset()
	StarbornAdversary_Emissary.TryToReset()
	StarbornCourtyard_ReanimateTargets.ResetAll()
	StarbornEngineering_RobotsActive.ResetAll()
	StarbornEngineering_RobotsInactive.ResetAll()
	StarbornEngineering_TurretsAll.ResetAll()

	;Register for OnLocationChange on the player, so we can stop or restart the battle update timers if the player leaves and comes back.
	RegisterForRemoteEvent(player, "OnLocationChange")

	;General setup for up all of the Starborn minibosses.
	i = 0
	While (i < StarbornData.Length)
		Actor current = StarbornData[i].StarbornAlias.GetActorRef()
		if (current != None)
			StarbornData[i].starbornActorRef = current
			current.AddToFaction(PlayerFriendFaction)
			current.Disable()
			RegisterForStarbornEvents(current, i)
			current.RemoveItem(Aid_MedPack, 100)
		EndIf
		i = i + 1
	EndWhile

	;Additional setup for the individual Starborn encounters.
	StarbornBridgeInit(CONST_Bridge_DataIndex)

	CourtyardReanimateTargetsAll = StarbornCourtyard_ReanimateTargets.GetArray() as Actor[]
	CourtyardReanimateTargetsRandomized = CommonArrayFunctions.CopyAndRandomizeObjArray(StarbornCourtyard_ReanimateTargets.GetArray()) as Actor[]
	
	starbornFireActorRef = StarbornFire.GetActorRef()
	starbornIceActorRef = StarbornIce.GetActorRef()
	ObjectReference[] randomizedRobots = CommonArrayFunctions.CopyAndRandomizeObjArray(StarbornEngineering_RobotsActive.GetArray())
	StarbornEngineering_RobotsActive.RemoveAll()
	StarbornEngineering_RobotsActive.AddArray(randomizedRobots)
	RegisterForCustomEvent(SQ_Parent, "SQ_NativeTerminalActor_Unconscious")
	RegisterForCustomEvent(SQ_Parent, "SQ_NativeTerminalActor_Frenzy")
	RegisterForCustomEvent(SQ_Parent, "SQ_NativeTerminalActor_Ally")
	
	starbornRuinsTriggerRef = StarbornRuins_HoldPositionTrigger.GetRef()
	starbornRuinsDemonsRespawnTimes = new float[0]

	;Set up the exterior ID Card Reader.
	exteriorIDCardReaderRef = ExteriorIDCardReader.GetRef() as IDCardReader
	RegisterForCustomEvent(exteriorIDCardReaderRef, "IDReaderActivatedSuccess")

	;Unlock the exterior load door, which is initially Inaccessible-locked to block clipping exploits.
	ExteriorLoadDoor.GetRef().Unlock()

	;Block activation on the temple doors, exterior and interior.
	SetTempleDoorState(True, True)

	;Block activation on the Artifact.
	artifactActivatorRef = ArtifactActivator.GetRef()
	artifactRingsRef = ArtifactRings.GetRef()
	artifactPlatformRef = ArtifactPlatform.GetRef()
	artifactActivatorRef.BlockActivation(True, True)
	RegisterForRemoteEvent(artifactActivatorRef, "OnActivate")
EndEvent

;Quickstart helper function.
Function QuickstartTo(ObjectReference quickstartMarker)
	;If the user didn't manually set one of the startup stages, we need to set something, so go with HunterEnemy as a default.
	if (!GetStageDone(CONST_Stage_Startup_HunterEnemy) && !GetStageDone(CONST_Stage_Startup_EmissaryEnemy) && !GetStageDone(CONST_Stage_Startup_BothEnemies))
		SetStage(CONST_Stage_Startup_HunterEnemy)
	EndIf
	;If we're quickstarting to space, let the space quest handle this.
	if (GetStageDone(CONST_Stage_Quickstart_Space) && (quickstartMarker == None))
		selfAsSpaceQuestScript.QuickstartToSpace()
	Else
		usedSurfaceQuickstart = True

		;Set up your ally, if appropriate.
		Actor allyRef = Ally.GetActorRef()
		if (allyRef != None)
			SQ_Followers.SetRoleActive(allyRef)
			allyRef.IgnoreFriendlyHits(True)
		EndIf

		;Set the adversary faction stage.
		SetStage(CONST_Stage_SetupAdversaryFaction)

		;Then move.
		player.MoveTo(quickstartMarker)
		Companion.TryToMoveTo(quickstartMarker)
		Followers.MoveAllTo(quickstartMarker)
	EndIf
EndFunction



;------------------------------------------------------------
;Common Functions for Scripted Spellcasting
;-------------------------------------------

Function EnterVoidForm(Actor target)
	if (target != None)
		LC165_Scripted_VoidFormSpell.Cast(target, target)
	EndIf
EndFunction

Function ExitVoidForm(Actor target)
	if (target != None)
		target.RemoveSpell(LC165_Scripted_VoidFormSpell)
		target.DispelSpell(LC165_Scripted_VoidFormSpell)
	EndIf
EndFunction


Function TeleportIn(ObjectReference target, Spell teleportInSpell=None, Explosion teleportInExplosion=None)
	if (target != None)
		if ((teleportInSpell == None) && (teleportInExplosion == None))
			teleportInExplosion = LC165_StarbornTeleportInExplosion
		EndIf
		Actor targetActor = target as Actor
		if (targetActor)
			if (teleportInSpell != None)
				targetActor.AddSpell(teleportInSpell)
			EndIf
		EndIf
		if (teleportInExplosion != None)
			target.PlaceAtMe(teleportInExplosion)
			Debug.Trace("Placed " + teleportInExplosion + " at " + target)
		EndIf
	EndIf
EndFunction

Function TeleportOut(Actor target, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutDelay=-1.0, bool shouldDisable=False)
	if (target != None)
		if ((teleportOutSpell == None) && (teleportOutExplosion == None))
			teleportOutExplosion = LC165_StarbornTeleportOutExplosion
		EndIf
		if (teleportOutSpell != None)
			target.AddSpell(teleportOutSpell)
			Utility.Wait(CONST_DissolveVFXDelay)
		EndIf
		if (teleportOutExplosion != None)
			target.PlaceAtMe(teleportOutExplosion)
		EndIf
		Utility.Wait(teleportOutDelay)
		if (shouldDisable)
			target.Disable()
		EndIf
	EndIf
EndFunction

Function TeleportOutNoWait(Actor target, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutDelay=-1.0, bool shouldDisable=False)
	Var[] akArgs = new Var[5]
	akArgs[0] = target
	akArgs[1] = teleportOutSpell
	akArgs[2] = teleportOutExplosion
	akArgs[3] = teleportOutDelay
	akArgs[4] = shouldDisable
	CallFunctionNoWait("TeleportOut", akArgs)
EndFunction


Function CombatTeleportNearPlayerNoWait(Actor actorToTeleport, float minDistance=0.0, float maxDistance=0.0, bool allowZOffset=True, bool alwaysInFront=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	CombatTeleportNearRefNoWait(actorToTeleport, player, minDistance, maxDistance, allowZOffset, alwaysInFront, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
EndFunction

Function CombatTeleportNearPlayer(Actor actorToTeleport, float minDistance=0.0, float maxDistance=0.0, bool allowZOffset=True, bool alwaysInFront=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	CombatTeleportNearRef(actorToTeleport, player, minDistance, maxDistance, allowZOffset, alwaysInFront, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
EndFunction

Function CombatTeleportNearRefNoWait(Actor actorToTeleport, ObjectReference sourceRef, float minDistance=0.0, float maxDistance=0.0, bool allowZOffset=True, bool alwaysInFront=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	Var[] akArgs = new Var[11]
	akArgs[0] = actorToTeleport
	akArgs[1] = sourceRef
	akArgs[2] = minDistance
	akArgs[3] = maxDistance
	akArgs[4] = allowZOffset
	akArgs[5] = alwaysInFront
	akArgs[6] = teleportInSpell
	akArgs[7] = teleportInExplosion
	akArgs[8] = teleportOutSpell
	akArgs[9] = teleportOutExplosion
	akArgs[10] = teleportOutSpellDelay
	CallFunctionNoWait("CombatTeleportNearRef", akArgs)
EndFunction

Function CombatTeleportNearRef(Actor actorToTeleport, ObjectReference sourceRef, float minDistance=0.0, float maxDistance=0.0, bool allowZOffset=True, bool alwaysInFront=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	if (!actorToTeleport.IsDead())
		float[] akOffsets = new float[3]
		if (maxDistance > 0)
			akOffsets[0] = Utility.RandomFloat(minDistance, maxDistance)
			akOffsets[1] = Utility.RandomFloat(minDistance, maxDistance)
			akOffsets[2] = Utility.RandomFloat(minDistance, maxDistance)
			if (Utility.RandomInt(0, 1) == 0)
				akOffsets[0] = akOffsets[0] * -1
			EndIf
			if (!alwaysInFront && (Utility.RandomInt(0, 1) == 0))
				akOffsets[1] = akOffsets[1] * -1
			EndIf
			if (!allowZOffset)
				akOffsets[2] = 0
			ElseIf (Utility.RandomInt(0, 1) == 0)
				akOffsets[2] = akOffsets[2] * -1
			EndIf
		EndIf
		ObjectReference target = sourceRef.PlaceAtMe(XMarker, akOffsetValues=akOffsets)
		if ((minDistance > 0) || (maxDistance > 0))
			target.MoveToNearestNavmeshLocation()
		EndIf
		CombatTeleport(actorToTeleport, target, False, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
		target.Delete()
	EndIf
EndFunction

Function CombatTeleportNoWait(Actor actorToTeleport, ObjectReference target, bool shouldBeInvisibleAfterTeleport=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	Var[] akArgs = new Var[8]
	akArgs[0] = actorToTeleport
	akArgs[1] = target
	akArgs[2] = shouldBeInvisibleAfterTeleport
	akArgs[3] = teleportInSpell
	akArgs[4] = teleportInExplosion
	akArgs[5] = teleportOutSpell
	akArgs[6] = teleportOutExplosion
	akArgs[7] = teleportOutSpellDelay
	CallFunctionNoWait("CombatTeleport", akArgs)
EndFunction

Function CombatTeleport(Actor actorToTeleport, ObjectReference target, bool shouldBeInvisibleAfterTeleport=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	if (actorToTeleport.IsEnabled() && actorToTeleport.Is3DLoaded())
		TeleportOut(actorToTeleport, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
	EndIf
	if (shouldBeInvisibleAfterTeleport)
		EnterVoidForm(actorToTeleport)
		actorToTeleport.DispelSpell(ArtifactPowerSenseStarStuff_Spell)
	EndIf
	if (!shouldBeInvisibleAfterTeleport)
		TeleportIn(target, teleportInSpell, teleportInExplosion)
	EndIf
	actorToTeleport.MoveTo(target)
	if (actorToTeleport.IsDisabled())
		actorToTeleport.Enable()
	EndIf
	if (!shouldBeInvisibleAfterTeleport)
		ExitVoidForm(actorToTeleport)
	EndIf
	if (!actorToTeleport.IsDead())
		actorToTeleport.StartCombat(player)
	EndIf
EndFunction

Function NoncombatTeleportNoWait(Actor actorToTeleport, ObjectReference target, bool shouldBeInvisibleAfterTeleport=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	Var[] akArgs = new Var[8]
	akArgs[0] = actorToTeleport
	akArgs[1] = target
	akArgs[2] = shouldBeInvisibleAfterTeleport
	akArgs[3] = teleportInSpell
	akArgs[4] = teleportInExplosion
	akArgs[5] = teleportOutSpell
	akArgs[6] = teleportOutExplosion
	akArgs[7] = teleportOutSpellDelay
	CallFunctionNoWait("NoncombatTeleport", akArgs)
EndFunction

Function NoncombatTeleport(Actor actorToTeleport, ObjectReference target, bool shouldBeInvisibleAfterTeleport=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	if (actorToTeleport.IsEnabled() && actorToTeleport.Is3DLoaded())
		TeleportOut(actorToTeleport, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
	EndIf
	if (shouldBeInvisibleAfterTeleport)
		EnterVoidForm(actorToTeleport)
	EndIf
	actorToTeleport.MoveTo(target)
	if (actorToTeleport.IsDisabled())
		actorToTeleport.Enable()
	EndIf
	if (!shouldBeInvisibleAfterTeleport)
		TeleportIn(actorToTeleport, teleportInSpell, teleportInExplosion)
		ExitVoidForm(actorToTeleport)
	EndIf
EndFunction

Actor Function CreateRuinsDemon(int starbornDataIndex, RefCollectionAlias demonRefCollection)
	Actor actorToDuplicate
	if ((demonDuplicateID == 1) && (actorToDuplicate == None))
		if (Companion.GetActorRef() != None)
			actorToDuplicate = Companion.GetActorRef()
			demonDuplicateID = demonDuplicateID + 1
		Else
			demonDuplicateID = demonDuplicateID + 1
		EndIf
	EndIf
	if ((demonDuplicateID == 2) && (actorToDuplicate == None))
		if (Ally.GetActorRef() != None)
			actorToDuplicate = Ally.GetActorRef()
			demonDuplicateID = demonDuplicateID + 1
		Else
			demonDuplicateID = demonDuplicateID + 1
		EndIf
	EndIf
	if (demonDuplicateID == 3)
		demonDuplicateID = 0
	EndIf
	if ((demonDuplicateID == 0) && (actorToDuplicate == None))
		actorToDuplicate = player
		demonDuplicateID = demonDuplicateID + 1
	EndIf

	Actor createdDemon = CreateDuplicate(LC165HoldingPenMarkerRef, actorToDuplicate, StarbornData[starbornDataIndex].starbornActorRef, demonRefCollection, starbornDataIndex, False)
	createdDemon.Enable()
	return createdDemon
EndFunction

Actor Function CreateDuplicate(ObjectReference spawnPoint, Actor actorToDuplicate, Actor creatingActor, RefCollectionAlias duplicateCollection, int starbornDataIndex, bool shouldRegisterForEvents)
	Actor duplicate = spawnPoint.PlaceDuplicateActorAtMe(actorToDuplicate, abInitiallyDisabled=True)
	duplicate.RemoveFromAllFactions()
	duplicate.SetGroupFaction(None)
	duplicate.AddToFaction(LC165StarbornEnemyFaction)
	duplicate.SetValue(Aggression, CONST_Aggression_VeryAggressive)
	duplicate.SetValue(Confidence, CONST_Confidence_Foolhardy)
	duplicate.SetLinkedRef(actorToDuplicate, LC165_StarbornDuplicateLinkKeyword)
	if (creatingActor != None)
		duplicate.SetLinkedRef(creatingActor, LC165_StarbornEventActorLinkKeyword)
	EndIf
	if (duplicateCollection != None)
		 duplicateCollection.AddRef(duplicate)
	EndIf
	if (shouldRegisterForEvents)
		RegisterForStarbornEvents(duplicate, starbornDataIndex)
	EndIf
	return duplicate
EndFunction

Actor Function CreateParallelSelf(Actor actorToDuplicate, Actor creatingActor, RefCollectionAlias duplicateCollection, int starbornDataIndex, bool shouldRegisterForEvents)
	ObjectReference spawnPoint = GetParallelSelfSpawnPoint(actorToDuplicate)
	Actor duplicate = CreateDuplicate(spawnPoint, actorToDuplicate, creatingActor, duplicateCollection, starbornDataIndex, shouldRegisterForEvents)
	spawnPoint.Delete()
	return duplicate
EndFunction

ObjectReference Function GetParallelSelfSpawnPoint(ObjectReference source)
	float[] offsets = new float[3]
	offsets[0] = Utility.RandomFloat(CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax)
	offsets[1] = Utility.RandomFloat(CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax)
	ObjectReference spawnPoint = source.PlaceAtMe(XMarker, akOffsetValues=offsets)
	spawnPoint.MoveToNearestNavmeshLocation()
	return spawnPoint
EndFunction

Function CreateScriptedGraityWell(ObjectReference source)
	DestroyScriptedGravityWell()
	scriptedExplosionHazard = source.PlaceAtMe(LC165_ScriptedGravWellExplosion)
	scriptedGravWellHazard = source.PlaceAtMe(LC165_ScriptedGravWellHazard)
EndFunction

Function DestroyScriptedGravityWell(Explosion explosionToSpawn=None, bool shouldUpdateTimestamp=False)
	if (scriptedGravWellHazard != None)
		if (explosionToSpawn == None)
			if (scriptedExplosionHazard != None)
				scriptedExplosionHazard.Delete()
				scriptedExplosionHazard = None
			EndIf
			if (scriptedGravWellHazard != None)
				scriptedGravWellHazard.Delete()
				scriptedGravWellHazard = None
			EndIf
		Else
			ObjectReference myXMarker = scriptedGravWellHazard.PlaceAtMe(XMarker)
			scriptedExplosionHazard.Delete()
			scriptedExplosionHazard = None
			scriptedGravWellHazard.Delete()
			scriptedGravWellHazard = None
			myXMarker.PlaceAtMe(explosionToSpawn)
			myXMarker.Delete()
		EndIf
		if (shouldUpdateTimestamp)
			scriptedGravWellTimestamp = Utility.GetCurrentRealTime()
		EndIf
	EndIf
EndFunction

Function StartScriptedReanimate(Actor caster, Actor[] reanimateTargets, float reanimateDelay=0.0)
	int i = 0
	While ((i < reanimateTargets.Length) && (!caster.IsDead()))
		reanimateTargets[i].PlaceAtMe(LC165_StarbornReanimateExplosion)
		Debug.Trace("Placed " + LC165_StarbornReanimateExplosion + " at " + reanimateTargets[i])
		reanimateTargets[i].Resurrect()
		reanimateTargets[i].AddSpell(LC165_AbReanimate)
		i = i + 1
		if ((i < reanimateTargets.Length) && (reanimateDelay > 0))
			Utility.Wait(reanimateDelay)
		EndIf
	EndWhile
EndFunction

int Function CountScriptedReanimate(Actor[] reanimateTargets)
	int activeActorCount = 0
	int i = 0
	While (i < reanimateTargets.Length)
		if (!reanimateTargets[i].IsDead())
			activeActorCount = activeActorCount + 1
		EndIf
		i = i + 1
	EndWhile
	return activeActorCount
EndFunction

Function CleanupScriptedActors(Actor[] targets, int numToCleanup=-1, bool shouldDisable=False, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	int cleanedUpCount = 0
	int i = 0
	While ((i < targets.Length) && ((cleanedUpCount < numToCleanup) || (numToCleanup < 0)))
		if (!targets[i].IsDead() && !targets[i].IsDisabled())
			cleanedUpCount = cleanedUpCount + 1
			if (shouldDisable)
				TeleportOutNoWait(targets[i], teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay, True)
			Else
				targets[i].Kill()
			EndIf
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function DissolveStarborn(Actor starbornToDissolve)
	starbornToDissolve.BlockActivation(True, True)
	starbornToDissolve.AddSpell(AbStarbornDeath)
	Utility.Wait(CONST_DissolveVFXDelay)
  	FortifyQuantumEssenceSpell.Cast(starbornToDissolve, player)
   	QuantumEssenceAddMSG.Show()
	starbornToDissolve.DisableNoWait()
EndFunction

Function DropStarbornItem(Actor starbornToDropItem, ObjectReference itemToDrop)
	ObjectReference itemMarker = starbornToDropItem.PlaceAtMe(XMarker)
	itemMarker.MoveToNearestNavmeshLocation()
	itemToDrop.MoveTo(itemMarker)
	itemToDrop.SetMotionType(2)
	itemMarker.Delete()
EndFunction


;--------------------------------------------------------
;Starborn Battle Event Handlers & Common Functions
;--------------------------------------------------

Function RegisterForStarbornEvents(Actor currentStarborn, int starbornDataIndex)
	currentStarborn.SetValue(LC165_StarbornMovementHealthPercentStampValue, currentStarborn.GetValuePercentage(Health))
	if (StarbornData[starbornDataIndex].StarbornMovementUpdate_AtTargetTime >= 0)
		currentStarborn.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, 0)
	EndIf
	if (StarbornData[starbornDataIndex].StarbornSpellCastFunctionName != "")
		RegisterForRemoteEvent(currentStarborn, "OnSpellCast")
	EndIf
	if (StarbornData[starbornDataIndex].StarbornHitFunctionName != "")
		RegisterForHitEvent(currentStarborn)
	EndIf
	if (StarbornData[starbornDataIndex].StarbornDyingFunctionName != "")
		RegisterForRemoteEvent(currentStarborn, "OnDying")
	EndIf
EndFunction

;Begin a battle with one of the Starborn.
Function StartStarbornBattle(Actor currentStarborn)
	int starbornDataIndex = StarbornData.FindStruct("starbornActorRef", currentStarborn)
	Var[] akArgs = new Var[2]
	akArgs[0] = currentStarborn
	akArgs[1] = starbornDataIndex
	CallFunction(StarbornData[starbornDataIndex].StarbornBattleStartFunctionName, akArgs)
	if (StarbornData[starbornDataIndex].StarbornUpdateFunctionName != "")
		StartTimer(StarbornData[starbornDataIndex].StarbornTimerDelay, starbornDataIndex)
	EndIf
	MUSGenesisCombatBoss_MQ302B_A_Battles.Add()
EndFunction

;Forward timer events to the corresponding Starborn's Update function.
Event OnTimer(int timerID)
	if (timerID < StarbornData.Length)
		Var[] akArgs = new Var[1]
		akArgs[0] = timerID
		CallFunction(StarbornData[timerID].StarbornUpdateFunctionName, akArgs)
		if (GetStageDone(StarbornData[timerID].StarbornBattleEndStage))
			MUSGenesisCombatBoss_MQ302B_A_Battles.Remove()
		Else
			StartTimer(StarbornData[timerID].StarbornTimerDelay, timerID)
		EndIf
	ElseIf (timerID == CONST_StarbornAdversary_CheckForStateChangeTimerID)
		StarbornAdversaryCheckForStateChange()
		if (!adversaryBattleComplete)
			StartTimer(CONST_StarbornAdversary_CheckForStateChangeTimerDelay, CONST_StarbornAdversary_CheckForStateChangeTimerID)
		EndIf
	ElseIf (timerID == CONST_AllyArrivalTimerID)
		TryToTeleportAllyForArrival()
	EndIf
EndEvent

;Forward OnHit events to the corresponding Starborn's Hit function.
Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	Var[] akArgs = GetEventHandlerParameterData(akTarget as Actor)
	int index = akArgs[3] as int
	if (index >= 0)
		akArgs[0] = akAggressor as Actor
		bool shouldReregister = CallFunction(StarbornData[index].StarbornHitFunctionName, akArgs)
		if (shouldReregister)
			RegisterForHitEvent(akTarget)
		EndIf
	EndIf
EndEvent

;Forward OnDying events to the corresponding Starborn's Dying function.
Event Actor.OnDying(Actor akSource, ObjectReference akKiller)
	Var[] akArgs = GetEventHandlerParameterData(akSource as Actor)
	int index = akArgs[3] as int
	if (index >= 0)
		akArgs[0] = akKiller
		CallFunction(StarbornData[index].StarbornDyingFunctionName, akArgs)
	EndIf
EndEvent

;Forward OnSpellCast events to the corresponding Starborn's Hit function.
Event ObjectReference.OnSpellCast(ObjectReference akSource, Form akSpell)
	Var[] akArgs = GetEventHandlerParameterData(akSource as Actor)
	int index = akArgs[3] as int
	if (index >= 0)
		akArgs[0] = akSpell
		CallFunction(StarbornData[index].StarbornSpellCastFunctionName, akArgs)
	EndIf
	if (templeInteriorInitialized && !adversaryHasShiftedAwayFromTemple)
		;Once the Boss Battle has started, the use of any power by anyone causes the Artifact to react.
		Debug.Trace("Pulse.")
		artifactRingsRef.PlayAnimation("FXPlay01")
	EndIf
EndEvent

;Assemble standard parameters for the Starborn functions.
Var[] Function GetEventHandlerParameterData(Actor akSource)
	Var[] akArgs = new Var[4]
	akArgs[1] = akSource
	Actor akEventLink = akSource.GetLinkedRef(LC165_StarbornEventActorLinkKeyword) as Actor
	if (akEventLink == None)
		akArgs[2] = akSource
	Else
		akArgs[2] = akEventLink
	EndIf
	akArgs[3] = StarbornData.FindStruct("starbornActorRef", akArgs[2] as Actor)
	return akArgs
EndFunction

;Shut down the timer loops if the player leaves LC165; restart them if they come back.
Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
	LockGuard(ChangeLocationGuard)
		if ((akOldLoc == LC165BuriedTempleLocation) && (akNewLoc != LC165BuriedTempleLocation) && (player.GetCurrentLocation() != LC165BuriedTempleLocation))
			;Cancel all active Starborn Battle timers.
			int i = 0
			While (i < StarbornData.Length)
				CancelTimer(i)
				i = i + 1
			EndWhile
			;Remove the music override, if it was active.
			MUSGenesisCombatBoss_MQ302B_A_Battles.Remove()
			;And dismiss your ally temporarily.
			ObjectReference test = Ally.GetActorRef()
			Actor allyRef = Ally.GetActorRef()
			if ((allyRef != None) && GetStageDone(CONST_AllyJoinedStage) && (allyRef.IsEnabled()))
				Debug.Trace("MQ302B Ally Leaves")
				SQ_Followers.SetRoleInactive(allyRef)
				TeleportOut(allyRef, shouldDisable=True)
			EndIf
		ElseIf (akNewLoc == LC165BuriedTempleLocation)
			;Restart all appropriate Starborn Battle timers.
			int i = 0
			While (i < StarbornData.Length)
				if (GetStageDone(StarbornData[i].StarbornBattleStartStage) && !GetStageDone(StarbornData[i].StarbornBattleEndStage) && (StarbornData[i].StarbornUpdateFunctionName != ""))
					StartTimer(0, i)
					;And restore the music override.
					MUSGenesisCombatBoss_MQ302B_A_Battles.Add()
				EndIf
				i = i + 1
			EndWhile
			;And have your ally rejoin.
			ObjectReference test = Ally.GetActorRef()
			Actor allyRef = Ally.GetActorRef()
			if ((allyRef != None) && GetStageDone(CONST_AllyJoinedStage) && (allyRef.IsDisabled()))
				Debug.Trace("MQ302B Ally Rejoins")
				float[] akOffsets = new float[3]
				akOffsets[1] = CONST_AllyRejoinDistance
				ObjectReference target = player.PlaceAtMe(XMarker, akOffsetValues=akOffsets)
				target.MoveToNearestNavmeshLocation()
				allyRef.MoveTo(target)
				TeleportIn(allyRef)
				allyRef.EnableNoWait()
				SQ_Followers.SetRoleActive(allyRef)
			EndIf
		EndIf
	EndLockGuard
EndEvent


;Engineering: If the player hacks the Engineering event's robots, don't activate any more of them.
Event SQ_ParentScript.SQ_NativeTerminalActor_Unconscious(SQ_ParentScript source, Var[] akArgs)
	Actor targetActor = akArgs[1] as Actor
	if ((StarbornEngineering_RobotsActive.Find(targetActor) >= 0) || (StarbornEngineering_RobotsInactive.Find(targetActor) >= 0))
		StarbornEngineeringDisableRobots()
	EndIf
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Ally(SQ_ParentScript source, Var[] akArgs)
	Actor targetActor = akArgs[1] as Actor
	if ((StarbornEngineering_RobotsActive.Find(targetActor) >= 0) || (StarbornEngineering_RobotsInactive.Find(targetActor) >= 0))
		StarbornEngineeringDisableRobots()
	EndIf
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Frenzy(SQ_ParentScript source, Var[] akArgs)
	Actor targetActor = akArgs[1] as Actor
	if ((StarbornEngineering_RobotsActive.Find(targetActor) >= 0) || (StarbornEngineering_RobotsInactive.Find(targetActor) >= 0))
		StarbornEngineeringDisableRobots()
	EndIf
EndEvent

;Handle activation events from the scripted objects we manage.
Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
	if ((akSource == artifactActivatorRef) && (akActivator == player))
		artifactActivatorRef.DisableNoWait()
		player.AddAliasedItem(Artifact_MU, MQ00_ArtifactsHolder)
		SetStage(CONST_Stage_PlayerTakesArtifactActivator)
	EndIf
EndEvent

;Handle Distance Less Than events as Starborn reach their hold positon targets.
Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	if (akObj1 is Actor)
		akObj1.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, Utility.GetCurrentRealTime())
	Else
		akObj2.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, Utility.GetCurrentRealTime())
	EndIf
EndEvent

;Handle Loading Menu Close event when the player is teleported out of the temple at the end of the quest.
Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	if (waitingForLoadOutOfTemple)
		waitingForLoadOutOfTemple = False
		AwardFinalArtifactPower()
	EndIf
EndEvent


;Convenience function to add or remove spells, change the Starborn State Value (which controls package behaviors) and add or remove from PlayerFriendFaction.
;UpdateAndEVPIndex does this for the primary and duplicate actors for a given index.
Function UpdateAndEVPIndex(int starbornDataIndex, Spell spellToUpdate=None, bool shouldAddSpell=False, int starbornStateValue=-1, bool shouldRemoveFromPlayerFriendFaction=False, bool shouldStartCombat=False)
	StarbornDatum current = StarbornData[starbornDataIndex]
	UpdateAndEVPActor(current.starbornActorRef, starbornDataIndex, spellToUpdate, shouldAddSpell, starbornStateValue, shouldRemoveFromPlayerFriendFaction)
	if (current.StarbornDuplicatesCollection != None)
		Actor[] currentDuplicates = current.StarbornDuplicatesCollection.GetArray() as Actor[]
		if (currentDuplicates != None)
			int i = 0
			While (i < currentDuplicates.Length)
				if (currentDuplicates[i] != current.StarbornActorRef)
					UpdateAndEVPActor(currentDuplicates[i], starbornDataIndex, spellToUpdate, shouldAddSpell, starbornStateValue, shouldRemoveFromPlayerFriendFaction, shouldStartCombat)
				EndIf
				i = i + 1
			EndWhile
		EndIf
	EndIf
EndFunction

;UpdateAndEVPActor does this only for a single passed actor.
Function UpdateAndEVPActor(Actor actorToUpdate, int starbornDataIndex, Spell spellToUpdate=None, bool shouldAddSpell=False, int starbornStateValue=-1, bool shouldRemoveFromPlayerFriendFaction=False, bool shouldStartCombat=False)
	if (spellToUpdate != None)
		if (shouldAddSpell)
			actorToUpdate.AddSpell(spellToUpdate)
		Else
			actorToUpdate.RemoveSpell(spellToUpdate)
		EndIf
		Var[] akArgs = new Var[3]
		akArgs[0] = actorToUpdate
		akArgs[1] = starbornDataIndex
		akArgs[2] = shouldAddSpell
		CallFunction(StarbornData[starbornDataIndex].StarbornSwapCombatStyleFunctionName, akArgs)
	EndIf
	if (starbornStateValue != -1)
		actorToUpdate.SetValue(LC165_StarbornStateValue, starbornStateValue)
	EndIf
	if (shouldRemoveFromPlayerFriendFaction)
		actorToUpdate.RemoveFromFaction(PlayerFriendFaction)
	EndIf
	if ((shouldRemoveFromPlayerFriendFaction || shouldStartCombat) && !actorToUpdate.IsDead() && !actorToUpdate.IsDisabled())
		actorToUpdate.StartCombat(player)
	EndIf
	actorToUpdate.EvaluatePackage()
EndFunction

;Should we update our movement based on health loss or time?
bool Function ShouldUpdateMovement(Actor actorToUpdate, int starbornDataIndex, float healthLossPercentage=-1.0)
	bool healthUpdate = ShouldUpdateMovementDueToHealthLoss(actorToUpdate, starbornDataIndex, healthLossPercentage)
	if (healthUpdate)
		Debug.Trace("ShouldUpdateMovement: " + actorToUpdate + " updating due to health loss.")
		return True
	Else
		bool timeUpdate = ShouldUpdateMovementDueToTime(actorToUpdate, starbornDataIndex)
		if (timeUpdate)
			Debug.Trace("ShouldUpdateMovement: " + actorToUpdate + " updating due to time.")
			return True
		EndIf
	EndIf
	Return False
EndFunction

;Should we update our movement based on health loss?
bool Function ShouldUpdateMovementDueToHealthLoss(Actor actorToUpdate, int starbornDataIndex, float healthLossPercentage=-1.0)
	if (healthLossPercentage == -1)
		healthLossPercentage = StarbornData[starbornDataIndex].StarbornMovementUpdate_HealthLossPercentage
	EndIf
	if (healthLossPercentage > 0)
		float currentHealthPercentage = actorToUpdate.GetValuePercentage(Health)
		float lastHealthPercentage = actorToUpdate.GetValue(LC165_StarbornMovementHealthPercentStampValue)
		if (currentHealthPercentage < lastHealthPercentage - healthLossPercentage)
			return True
		EndIf
	EndIf
	return False
EndFunction

;Should we update our movement based on time?
bool Function ShouldUpdateMovementDueToTime(Actor actorToUpdate, int starbornDataIndex)
	float currentTime = Utility.GetCurrentRealTime()
	float timeForNextMovementUpdate
	if (StarbornData[starbornDataIndex].StarbornMovementUpdate_AtTargetTime > 0)
		float reachedTargetTime = actorToUpdate.GetValue(LC165_StarbornMovementReachedTargetTimestampValue)
		if (reachedTargetTime > 0)
			;Check for timestamp failure.
			if (currentTime < reachedTargetTime)
				Debug.Trace("TimerReset: ShouldUpdateMovementDueToTime currentTime < reachedTargetTime. Forcing immediate reset.")
				actorToUpdate.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, currentTime)
				reachedTargetTime = currentTime
			EndIf
			timeForNextMovementUpdate = reachedTargetTime + StarbornData[starbornDataIndex].StarbornMovementUpdate_AtTargetTime
		EndIf
	EndIf
	if (timeForNextMovementUpdate == 0)
		float lastMovementUpdateTime = actorToUpdate.GetValue(LC165_StarbornMovementUpdateTimestampValue)
		;Check for timestamp failure.
		if (currentTime < lastMovementUpdateTime)
			Debug.Trace("TimerReset: ShouldUpdateMovementDueToTime currentTime < lastMovementUpdateTime. Forcing immediate reset.")
			actorToUpdate.SetValue(LC165_StarbornMovementUpdateTimestampValue, currentTime)
			lastMovementUpdateTime = currentTime
		EndIf
		timeForNextMovementUpdate = lastMovementUpdateTime + StarbornData[starbornDataIndex].StarbornMovementUpdate_NotAtTargetTime
	EndIf
	return currentTime >= timeForNextMovementUpdate
EndFunction

;Set a new hold position target, selecting randomly from the RefCollectionAlias. (Although always trying to choose a new target if possible.)
ObjectReference Function SetNewHoldPositionTargetRandom(Actor actorToUpdate, Keyword holdPositionKeyword, RefCollectionAlias potentialHoldPositionTargetsCol, bool shouldTeleport=False, bool shouldBeInvisibleAfterTeleport=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	if ((potentialHoldPositionTargetsCol == None) || (potentialHoldPositionTargetsCol.GetCount() == 0))
		return None
	Else
		ObjectReference[] potentialHoldPositionTargets = potentialHoldPositionTargetsCol.GetArray()
		if (potentialHoldPositionTargets.Length == 1)
			return SetNewHoldPositionTarget(actorToUpdate, holdPositionKeyword, potentialHoldPositionTargets[0], shouldTeleport, shouldBeInvisibleAfterTeleport)
		Else
			ObjectReference currentHoldPositionTarget = actorToUpdate.GetLinkedRef(holdPositionKeyword)
			if (currentHoldPositionTarget != None)
				int currentHoldPositionTargetIndex = potentialHoldPositionTargets.Find(currentHoldPositionTarget)
				if (currentHoldPositionTargetIndex >= 0)
					potentialHoldPositionTargets.Remove(currentHoldPositionTargetIndex)
				EndIf
			EndIf
			int newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length-1)
			ObjectReference newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex]
			return SetNewHoldPositionTarget(actorToUpdate, holdPositionKeyword, newHoldPositionTarget, shouldTeleport, shouldBeInvisibleAfterTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
		EndIf
	EndIf
EndFunction

;Set a new hold position target
ObjectReference Function SetNewHoldPositionTarget(Actor actorToUpdate, Keyword holdPositionKeyword, ObjectReference newHoldPositionTarget, bool shouldTeleport=False, bool shouldBeInvisibleAfterTeleport=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	if ((actorToUpdate.GetLinkedRef(holdPositionKeyword) != None) && (actorToUpdate.GetValue(LC165_StarbornMovementReachedTargetTimestampValue) >= 0))
		UnregisterForDistanceEvents(actorToUpdate, actorToUpdate.GetLinkedRef(holdPositionKeyword))
	EndIf
	actorToUpdate.SetLinkedRef(newHoldPositionTarget, holdPositionKeyword)
	if (actorToUpdate.GetValue(LC165_BossHoldPositionValue) != CONST_StarbornShouldCastCombatSpellValue)
		actorToUpdate.SetValue(LC165_BossHoldPositionValue, 1-actorToUpdate.GetValue(LC165_BossHoldPositionValue))
	EndIf
	actorToUpdate.SetValue(LC165_StarbornMovementUpdateTimestampValue, Utility.GetCurrentRealTime())
	actorToUpdate.SetValue(LC165_StarbornMovementHealthPercentStampValue, actorToUpdate.GetValuePercentage(Health))
	actorToUpdate.SetValue(LC165_StarbornMovementReachedTargetTimestampValue, 0)
	if (newHoldPositionTarget != None)
		RegisterForDistanceLessThanEvent(actorToUpdate, newHoldPositionTarget, CONST_StarbornAtTargetDistance)
	EndIf
	actorToUpdate.EvaluatePackage()
	if (shouldTeleport && !actorToUpdate.IsDead())
		CombatTeleportNoWait(actorToUpdate, newHoldPositionTarget, shouldBeInvisibleAfterTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
	EndIf
	return newHoldPositionTarget
EndFunction



;ALLY ARRIVAL --------------

Function StartAllyArrivalTimer()
	ObjectReference allyArrivalMarkerChainHeadRef = AllyArrivalMarker.GetRef()
	allyArrivalMarkerChain = allyArrivalMarkerChainHeadRef.GetLinkedRefChain()
	allyArrivalMarkerChain.Insert(allyArrivalMarkerChainHeadRef, 0)
	StartTimer(0, CONST_AllyArrivalTimerID)
EndFunction

Function TryToTeleportAllyForArrival()
	ObjectReference allyArrivalTargetRef
	int i = 0
	While ((allyArrivalTargetRef == None) && (i < allyArrivalMarkerChain.Length))
		if (player.HasDetectionLOS(allyArrivalMarkerChain[i]))
			allyArrivalTargetRef = allyArrivalMarkerChain[i]
		EndIf
		i = i + 1
	EndWhile
	if ((allyArrivalTargetRef == None) && (allyArrivalAttempts < CONST_AllyArrivalAttemptsMax))
		allyArrivalAttempts = allyArrivalAttempts + 1
		StartTimer(CONST_AllyArrivalTimerDelay, CONST_AllyArrivalTimerID)
	Else
		if (allyArrivalTargetRef == None)
			allyArrivalTargetRef = Game.FindClosestReferenceOfTypeFromRef(LC165_AllyArrivalMarker, player, 1000)
		EndIf
		if (allyArrivalTargetRef == None)
			allyArrivalTargetRef = allyArrivalMarkerChain[0]
		EndIf
		NoncombatTeleport(Ally.GetActorRef(), allyArrivalTargetRef)
		if (GetStageDone(CONST_Stage_Startup_HunterEnemy))
			MQ302_191_Entrance_EmissaryJoin.Start()
		Else
			MQ302_191_Entrance_HunterJoin.Start()
		EndIf
	EndIf
EndFunction


;BRIDGE --------------------

Function StarbornBridgeInit(int starbornDataIndex)
	Actor starbornBridgeRef = StarbornData[starbornDataIndex].starbornActorRef
	starbornBridgeRef.SetValue(LC165_Starborn_Bridge_CombatStyleValue, CONST_Bridge_CombatStyle_Assault)
	starbornBridgePrimary = StarbornBridgeSpawnParallelSelf(starbornBridgeRef, starbornBridgeRef, starbornDataIndex, False)
	StarbornBridgeSpawnParallelSelf(starbornBridgeRef, starbornBridgeRef, starbornDataIndex, False)
	StarbornBridgeSpawnParallelSelf(starbornBridgeRef, starbornBridgeRef, starbornDataIndex, False)
	int i = 0
	Actor[] duplicates = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
	While (i < duplicates.Length)
		duplicates[i].MoveTo(LC165ExteriorHoldingPenMarkerRef)
		duplicates[i].AddToFaction(PlayerFriendFaction)
		duplicates[i].EnableNoWait()
		i = i + 1
	EndWhile
EndFunction

Function StarbornBridgeStart(Actor starbornBridgeRef, int starbornDataIndex)
	bridgeBattleState = CONST_StarbornBattleState_Bridge_Start
	bridge_WaitingForParallelSelfCast = True
	starbornBridgePrimary.SetGhost(True)
	starbornBridgePrimary.RemoveFromFaction(PlayerFriendFaction)
	NoncombatTeleport(starbornBridgePrimary, starbornBridgeRef, teleportOutSpellDelay=0)
	MQ302_Battle_01_Bridge_BattleStart.Start()
	ObjectReference[] spawnPoints = StarbornBridge_InitialDuplicateSpawnPoints.GetArray()
	Actor[] duplicates = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
	int i = 1
	While (i < duplicates.Length)
		duplicates[i].RemoveFromFaction(PlayerFriendFaction)
		CombatTeleport(duplicates[i], spawnPoints[i-1], teleportInExplosion=LC165_StarbornParallelSelfSpawnExplosion, teleportOutSpellDelay=0)
		i = i + 1
	EndWhile
	starbornBridgePrimary.SetGhost(False)
	starbornBridgePrimary.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 1)
	UpdateAndEVPIndex(starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, False, CONST_StarbornStateValue_Bridge_Normal, True)
	bridgeBattleState = CONST_StarbornBattleState_Bridge_Parallelized_1
	bridge_DuplicationLineCountdown = 1
	bridge_WaitingForParallelSelfCast = False
EndFunction

Function StarbornBridgeUpdate(int starbornDataIndex)
	if ((bridgeBattleState == CONST_StarbornBattleState_Bridge_RealEnemyExposed) && (StarbornData[starbornDataIndex].starbornActorRef.IsDead()))
		;If the real Starborn has been exposed, and he's dead, we're done. Stop and clean up the event.
		bridgeBattleState = CONST_StarbornBattleState_Bridge_Complete
		if (StarbornData[starbornDataIndex].StarbornBattleDeathStage >= 0)
			SetStage(StarbornData[starbornDataIndex].StarbornBattleDeathStage)
		EndIf
		SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage)
	ElseIf (bridgeBattleState < CONST_StarbornBattleState_Bridge_RealEnemyExposed)
		;Assemble an array with all of the active duplicates.
		Actor[] bridgeRefs = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
		if (bridgeRefs == None)
			bridgeRefs = new Actor[0]
		EndIf

		;Remove any dead refs.
		Actor lastFoundDead
		int i = bridgeRefs.Length-1
		While (i >= 0)
			if (bridgeRefs[i].IsDead())
				lastFoundDead = bridgeRefs[i]
				bridge_DeathCount = bridge_DeathCount + 1
				TeleportOutNoWait(bridgeRefs[i], LC165_AbParallelSelfDeath, shouldDisable=True)
				StarbornData[starbornDataIndex].StarbornDuplicatesCollection.RemoveRef(bridgeRefs[i])
				bridgeRefs.Remove(i)
			EndIf
			i = i - 1
		EndWhile

		;Update our state.
		if (bridgeRefs.Length == 0)
			;Whoops, the player killed all of the duplicates before we had a chance to expose the real one. Teleport him in dead. Better than nothing.
			StarbornBridgeSwapInRealStarborn(lastFoundDead, starbornDataIndex)
		ElseIf ((bridgeRefs.Length == 1) && (bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_3))
			;We're down to the final duplicate, so teleport him out, and swap in the real one in his place.
			StarbornBridgeSwapInRealStarborn(bridgeRefs[0], starbornDataIndex)
		Else
			;The fight continues.
			;Say a duplication line, if we need to.
			if (bridge_DuplicationLineCountdown >= 0)
				bridge_DuplicationLineCountdown = bridge_DuplicationLineCountdown - 1
				if (bridge_DuplicationLineCountdown == 0)
					bridge_DuplicationLineCountdown = -1
					i = 0
					While (i < bridgeRefs.Length)
						bridgeRefs[i].SayCustom(LC165_Starborn_Bridge_DuplicationLines)
						i = i + 1
					EndWhile
				EndIf
			Else
				;Cast Parallel Self, if we need to.
				if (!bridge_WaitingForParallelSelfCast)
					if ((bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_1) && (bridge_DeathCount >= CONST_Bridge_DeathCountParallelize_2))
						bridge_WaitingForParallelSelfCast = True
						UpdateAndEVPIndex(starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, True, CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat)
					ElseIf ((bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_2) && (bridge_DeathCount >= CONST_Bridge_DeathCountParallelize_3))
						bridge_WaitingForParallelSelfCast = True
						UpdateAndEVPIndex(starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, True, CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat)
					EndIf
				EndIf

				;Teleport, if we need to.
				if (bridgeBattleState >= CONST_StarbornBattleState_Bridge_Parallelized_1)
					i = 0
					While (i < bridgeRefs.Length)
						Actor currentRef = bridgeRefs[i]
						int currentRefCombatStyle = currentRef.GetValue(LC165_Starborn_Bridge_CombatStyleValue) as int
						bool shouldTeleport
						if ((!bridgeBoundsTriggerRef.IsInTrigger(currentRef)) && (!currentRef.GetParentCell() != LC165BuriedTemple03))
							shouldTeleport = True
							Debug.Trace("Teleporting " + bridgeRefs[i] + "; out of bounds.")
						ElseIf ((!bridgeHoldPositionTriggerRef.IsInTrigger(currentRef)) && (bridgeHoldPositionTriggerRef.IsInTrigger(player)) && (currentRef.GetDistance(player) > CONST_Bridge_BridgeCatchupTeleportDistance))
							shouldTeleport = True
							Debug.Trace("Teleporting " + bridgeRefs[i] + "; warping back onto bridge.")
						ElseIf (currentRef.GetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue) == 0)
							shouldTeleport = True
							currentRef.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 1)
							Debug.Trace("Teleporting " + bridgeRefs[i] + "; initial teleport.")
						ElseIf ShouldUpdateMovementDueToHealthLoss(bridgeRefs[i], starbornDataIndex) ;&& (currentRefCombatStyle != CONST_Bridge_CombatStyle_Charger))
							shouldTeleport = True
							currentRef.SetValue(LC165_StarbornMovementHealthPercentStampValue, currentRef.GetValuePercentage(Health))
							Debug.Trace("Teleporting " + bridgeRefs[i] + " due to health loss.")
						EndIf
						if (shouldTeleport)
							if (currentRefCombatStyle == CONST_Bridge_CombatStyle_Charger)
								ObjectReference teleportPoint = Game.FindClosestReferenceOfAnyTypeInListFromRef(LC165_Starborn_Bridge_TeleportPointMarkerList, player, CONST_StarbornBridge_TeleportMarkerSearchRadius)
								if (teleportPoint == None)
									teleportPoint = StarbornBridge_ChargerTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_ChargerTeleportPoints.GetCount()-1))
								EndIf
								Debug.Trace("Teleporting Charger " + currentRef + " to " + teleportPoint)
								CombatTeleportNoWait(currentRef, teleportPoint)
							ElseIf (currentRefCombatStyle == CONST_Bridge_CombatStyle_Assault)
								ObjectReference teleportPoint = StarbornBridge_AssaultTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_AssaultTeleportPoints.GetCount()-1))
								Debug.Trace("Teleporting Assault " + currentRef + " to " + teleportPoint)
								CombatTeleportNoWait(currentRef, teleportPoint)
							Else ;Sniper
								ObjectReference teleportPoint = StarbornBridge_SniperTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_SniperTeleportPoints.GetCount()-1))
								Debug.Trace("Teleporting Sniper " + currentRef + " to " + teleportPoint)
								CombatTeleportNoWait(currentRef, teleportPoint)
							EndIf
						EndIf
						i = i + 1
					EndWhile
					if (!GetStageDone(CONST_Stage_BridgeStarbornParallelSelfReactStage))
						SetStage(CONST_Stage_BridgeStarbornParallelSelfReactStage)
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

Function StarbornBridgeSpellCast(Form spellCast, Actor caster, Actor starbornBridgeRef, int starbornDataIndex)
	if (spellCast == LC165_Starborn_Bridge_ScriptedParallelSelfSpell)
		LockGuard(BridgeParallelSelfGuard)
			if (caster.GetValue(LC165_StarbornStateValue) == CONST_StarbornStateValue_Bridge_ShouldCastParallelSelfCombat)
				UpdateAndEVPActor(caster, starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, False, CONST_StarbornStateValue_Bridge_Normal, True)
				Actor duplicate = StarbornBridgeSpawnParallelSelf(caster, starbornBridgeRef, starbornDataIndex, True)
				UpdateAndEVPActor(duplicate, starbornDataIndex, LC165_Starborn_Bridge_ScriptedParallelSelfSpell, False, CONST_StarbornStateValue_Bridge_Normal, True)
				if (bridge_WaitingForParallelSelfCast)
					if (bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_1)
						bridgeBattleState = CONST_StarbornBattleState_Bridge_Parallelized_2
					ElseIf (bridgeBattleState == CONST_StarbornBattleState_Bridge_Parallelized_2)
						bridgeBattleState = CONST_StarbornBattleState_Bridge_Parallelized_3
					EndIf
					bridge_DuplicationLineCountdown = CONST_BridgeDuplicationLineCountdown_StartValue
					bridge_WaitingForParallelSelfCast = False
				EndIf
			EndIf
		EndLockGuard
	EndIf
EndFunction

Function StarbornBridgeDying(ObjectReference akKiller, Actor target, Actor starbornBridgeRef, int starbornDataIndex)
	if (target == starbornBridgeRef)
		DissolveStarborn(starbornBridgeRef)
	EndIf
EndFunction

Function StarbornBridgeSwapCombatStyle(Actor starbornBridgeRef, int starbornDataIndex, bool shouldCastSpell)
	StarbornBridgeSetCombatStyle(starbornBridgeRef, shouldCastSpell)
EndFunction

Actor Function StarbornBridgeSpawnParallelSelf(Actor source, Actor starbornBridgeRef, int starbornDataIndex, bool shouldTeleportAfterCreation)
	Actor duplicate = CreateDuplicate(LC165HoldingPenMarkerRef, source, starbornBridgeRef, StarbornData[starbornDataIndex].StarbornDuplicatesCollection, starbornDataIndex, True)
	StarbornBridgeSelectCombatStyle(duplicate)
	SetNewHoldPositionTargetRandom(duplicate, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornBridge_HoldPositionTrigger)
	if (shouldTeleportAfterCreation)
		CombatTeleportNearRef(duplicate, source, CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax, teleportInExplosion=LC165_StarbornParallelSelfSpawnExplosion)
	Else
		duplicate.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 1)
	EndIf
	return duplicate
EndFunction

Function StarbornBridgeSelectCombatStyle(Actor actorToUpdate)
	actorToUpdate.SetValue(LC165_Starborn_Bridge_CombatStyleValue, bridge_NextCombatStyle)
	bridge_NextCombatStyle = (bridge_NextCombatStyle + 1) % 3
	StarbornBridgeSetCombatStyle(actorToUpdate, False)
EndFunction

Function StarbornBridgeSetCombatStyle(Actor actorToUpdate, bool shouldCastSpell)
	int combatStyleValue = actorToUpdate.GetValue(LC165_Starborn_Bridge_CombatStyleValue) as int
	if (shouldCastSpell)
		if (combatStyleValue == CONST_Bridge_CombatStyle_Charger)
			actorToUpdate.SetCombatStyle(LC165_csStarbornChargerBridge_CastCombatSpell)
		ElseIf (combatStyleValue == CONST_Bridge_CombatStyle_Assault)
			actorToUpdate.SetCombatStyle(LC165_csStarborn_Assault_CastCombatSpell)
		ElseIf (combatStyleValue == CONST_Bridge_CombatStyle_Sniper)
			actorToUpdate.SetCombatStyle(LC165_csStarborn_Sniper_CastCombatSpell)
		EndIf
	Else
		if (combatStyleValue == CONST_Bridge_CombatStyle_Charger)
			actorToUpdate.SetCombatStyle(LC165_csStarbornChargerBridge)
		ElseIf (combatStyleValue == CONST_Bridge_CombatStyle_Assault)
			actorToUpdate.SetCombatStyle(csStarborn_Assault)
		ElseIf (combatStyleValue == CONST_Bridge_CombatStyle_Sniper)
			actorToUpdate.SetCombatStyle(csStarborn_Sniper)
		EndIf
	EndIf
EndFunction

Function StarbornBridgeSwapInRealStarborn(Actor oldActor, int starbornDataIndex)
	bridgeBattleState = CONST_StarbornBattleState_Bridge_RealEnemyExposed

	TeleportOut(oldActor)
	Actor starbornBridgeRef = StarbornData[starbornDataIndex].starbornActorRef
	if (oldActor.IsDead())
		oldActor.DisableNoWait()
		TeleportIn(oldActor)
		starbornBridgeRef.MoveTo(oldActor)
		starbornBridgeRef.EnableNoWait()
		starbornBridgeRef.EnableNoWait()
		starbornBridgeRef.Kill()
		oldActor.Delete()
	Else
		float healthLost = oldActor.GetBaseValue(Health) - oldActor.GetValue(Health)
		oldActor.DisableNoWait()
		ObjectReference teleportPoint = StarbornBridge_AssaultTeleportPoints.GetAt(Utility.RandomInt(0, StarbornBridge_AssaultTeleportPoints.GetCount()-1))
		TeleportIn(teleportPoint)
		starbornBridgeRef.MoveTo(teleportPoint)
		starbornBridgeRef.EnableNoWait()
		starbornBridgeRef.DamageValue(Health, healthLost)
		starbornBridgeRef.SetCombatStyle(csStarborn_Assault)
		UpdateAndEVPActor(starbornBridgeRef, starbornDataIndex, starbornStateValue=CONST_StarbornStateValue_Bridge_Normal, shouldRemoveFromPlayerFriendFaction=True)
		starbornBridgeRef.StartCombat(player)
		oldActor.Delete()
	EndIf
EndFunction

Function StarbornBridgeForceRescueTeleport(Actor rescueTriggerActor)
	if (StarbornData[CONST_Bridge_DataIndex].StarbornDuplicatesCollection.GetArray().Find(rescueTriggerActor) >= 0)
		Debug.Trace("StarbornBridgeForceRescueTeleport: Forcing rescue teleport of " + rescueTriggerActor)
		rescueTriggerActor.SetValue(LC165_Starborn_Bridge_HasPerformedInitialTeleportValue, 0)
	EndIf
EndFunction



;COURTYARD -------------------- 
;
;Courtyard:
;-The fight begins with three waves of Mass Reanimate. When the third wave starts, the Courtyard Starborn joins the battle.
;-On timer, or when her health falls below thresholds, she swaps places with an active zombie.

Function StarbornCourtyardStart(Actor starbornCourtyardRef, int starbornDataIndex)
	LockGuard CourtyardBattleStateGuard
		CourtyardBattleState = CONST_StarbornBattleState_Courtyard_FirstReanimateReady
	EndLockGuard
	MQ302_Battle_02_Courtyard_MassReanimate01.Start()
EndFunction

Function StarbornCourtyardUpdate(int starbornDataIndex)
	LockGuard CourtyardBattleStateGuard
		Actor starbornCourtyardRef = StarbornData[starbornDataIndex].starbornActorRef

		;If the Starborn is dead, we're done. 
		if (starbornCourtyardRef.IsDead())
			DropStarbornItem(starbornCourtyardRef, ExteriorIDCard.GetRef())
			ExteriorIDCardFallback.GetRef().Moveto(ExteriorIDCardFallbackSpawnPoint.GetRef())
			CourtyardBattleState = CONST_StarbornBattleState_Courtyard_Complete
			StarbornCourtyard_Navcut.DisableAll()
			if (StarbornData[starbornDataIndex].StarbornBattleDeathStage >= 0)
				SetStage(StarbornData[starbornDataIndex].StarbornBattleDeathStage)
			EndIf
			SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage)
			CleanupScriptedActors(CourtyardReanimateTargetsAll)
			return
		EndIf

		if (CourtyardBattleState < CONST_StarbornBattleState_Courtyard_Normal)
			Debug.Trace("Start processing update "+ CourtyardBattleState + " " + GetCourtyardZombiesCount())
			if ((CourtyardBattleState == CONST_StarbornBattleState_Courtyard_FirstReanimateActive) && (GetCourtyardZombiesCount() < CONST_Courtyard_SecondReanimateZombieThreshold))
				CourtyardBattleState = CONST_StarbornBattleState_Courtyard_SecondReanimateReady
				MQ302_Battle_02_Courtyard_MassReanimate02.Start()
			ElseIf ((CourtyardBattleState == CONST_StarbornBattleState_Courtyard_SecondReanimateActive) && (GetCourtyardZombiesCount() < CONST_Courtyard_ThirdReanimateZombieThreshold))
				CourtyardBattleState = CONST_StarbornBattleState_Courtyard_ThirdReanimateReady
				MQ302_Battle_02_Courtyard_MassReanimate03.Start()
			ElseIf (CourtyardBattleState == CONST_StarbornBattleState_Courtyard_ThirdReanimateActive)
				CourtyardBattleState = CONST_StarbornBattleState_Courtyard_Normal
				SetNewHoldPositionTargetRandom(starbornCourtyardRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornCourtyard_HoldPositionTargets, True)
			EndIf
			Debug.Trace("Done processing update "+ CourtyardBattleState + " " + GetCourtyardZombiesCount())
		Else ;>= CONST_StarbornBattleState_Courtyard_Normal
			;Check for movement updates.
			if (ShouldUpdateMovement(starbornCourtyardRef, starbornDataIndex))
				StarbornCourtyardTryToTeleportSwapWithZombie(starbornDataIndex)
			EndIf
		EndIf
	EndLockGuard
EndFunction

Function StarbornCourtyardDying(ObjectReference akKiller, Actor target, Actor starbornCourtyardRef, int starbornDataIndex)
	if (target == starbornCourtyardRef)
		DissolveStarborn(starbornCourtyardRef)
	EndIf
EndFunction

Function PerformCourtyardScriptedMassReanimateNoWait()
	CallFunctionNoWait("PerformCourtyardScriptedMassReanimate", None)
EndFunction

Function PerformCourtyardScriptedMassReanimate()
	LockGuard CourtyardBattleStateGuard
		Actor starbornCourtyardRef = StarbornData[CONST_Courtyard_DataIndex].starbornActorRef
		Actor[] actorsToReanimate
		if (CourtyardBattleState == CONST_StarbornBattleState_Courtyard_Initial)
			CourtyardBattleState = CONST_StarbornBattleState_Courtyard_FirstReanimateActive
			actorsToReanimate = StarbornCourtyard_ReanimateTargets_Wave01.GetArray() as Actor[]
			SetStage(CONST_Courtyard_FirstReanimateActiveStage)
		ElseIf (CourtyardBattleState == CONST_StarbornBattleState_Courtyard_SecondReanimateReady)
			CourtyardBattleState = CONST_StarbornBattleState_Courtyard_SecondReanimateActive
			actorsToReanimate = StarbornCourtyard_ReanimateTargets_Wave02.GetArray() as Actor[]
		ElseIf (CourtyardBattleState == CONST_StarbornBattleState_Courtyard_ThirdReanimateReady)
			CourtyardBattleState = CONST_StarbornBattleState_Courtyard_ThirdReanimateActive
			actorsToReanimate = StarbornCourtyard_ReanimateTargets_Wave03.GetArray() as Actor[]
			SetStage(CONST_Courtyard_ThirdReanimateActiveStage)
			UpdateAndEVPActor(starbornCourtyardRef, CONST_Courtyard_DataIndex, starbornStateValue=CONST_StarbornStateValue_Courtyard_Normal, shouldRemoveFromPlayerFriendFaction=True)
		EndIf

		StartScriptedReanimate(starbornCourtyardRef, actorsToReanimate, CONST_Courtyard_PerReanimateDelay)

		;Wait for actors to reanimate before returning.
		Utility.Wait(CONST_Courtyard_MassReanimateDelay)
	EndLockGuard
EndFunction

Function StarbornCourtyardTryToTeleportSwapWithZombie(int starbornDataIndex)
	Actor starbornCourtyardRef = StarbornData[starbornDataIndex].starbornActorRef
	SetNewHoldPositionTargetRandom(starbornCourtyardRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornCourtyard_HoldPositionTargets, False)
	Actor firstLivingCourtyardZombie
	Actor[] allCourtyardZombies = CommonArrayFunctions.CopyAndRandomizeActorArray(CourtyardReanimateTargetsAll)
	int i = 0
	While ((i < allCourtyardZombies.Length) && (firstLivingCourtyardZombie == None))
		if (!allCourtyardZombies[i].IsDead())
			firstLivingCourtyardZombie = allCourtyardZombies[i]
		EndIf
		i = i + 1
	EndWhile
	if (firstLivingCourtyardZombie != None)
		if (!starbornCourtyardRef.IsDead() && !firstLivingCourtyardZombie.IsDead())
			courtyardLastSwapMarker2 = firstLivingCourtyardZombie.PlaceAtMe(XMarker)
			courtyardLastSwapMarker2.MoveToNearestNavmeshLocation()
			courtyardLastSwapMarker1 = starbornCourtyardRef.PlaceAtMe(XMarker)
			TeleportIn(starbornCourtyardRef, teleportInExplosion=LC165_StarbornTeleportSwapExplosion)
			TeleportIn(firstLivingCourtyardZombie, teleportInExplosion=LC165_StarbornTeleportSwapExplosion)
			starbornCourtyardRef.MoveTo(courtyardLastSwapMarker2)
			firstLivingCourtyardZombie.MoveTo(courtyardLastSwapMarker1)
			courtyardLastSwapMarker1.Delete()
			courtyardLastSwapMarker2.Delete()
		EndIf
	EndIf
EndFunction

int Function GetCourtyardZombiesCount()
	int count = CountScriptedReanimate(CourtyardReanimateTargetsAll)
	Debug.Trace("Courtyard ZOMBIES ACTIVE: " + count)
	return count
EndFunction

Function DEBUG_KillCourtyardZombies(int numToKill)
	CleanupScriptedActors(CourtyardReanimateTargetsAll, numToKill)
EndFunction



;EXTERIOR ID CARD READER --------------------

Event IDCardReader.IDReaderActivatedSuccess(IDCardReader akSource, Var[] akArgs)
	if (akSource == exteriorIDCardReaderRef)
		SetStage(CONST_Stage_ExteriorIDCardReaderUsedStage)
	EndIf
EndEvent



;ENGINEERING --------------------
;
;Engineering:
;- The Engineering battle includes robots and turrets, which the player can disable or take control of.
;- Ice can create a scripted gravity well. Fire can detonate Ice's gravity wells with a scripted Supernova explosion.

Function StarbornEngineeringStart(Actor starbornFireRef, int starbornDataIndex)
	;Set up initial hold positions.
	SetNewHoldPositionTarget(starbornFireActorRef, StarbornData[CONST_Fire_DataIndex].StarbornMovementHoldPositionKeyword, StarbornEngineering_HoldPositionTargetInitial.GetRef())
	SetNewHoldPositionTarget(starbornIceActorRef, StarbornData[CONST_Ice_DataIndex].StarbornMovementHoldPositionKeyword, StarbornEngineering_HoldPositionTargetInitial.GetRef().GetLinkedRef())

	;Create the initial gravity well, then destroy it after a short delay. 
	ObjectReference EngineeringGravityWellSourceMarkerInitial = StarbornEngineering_GravityWellSourceMarkerInitial.GetRef()
	CreateScriptedGraityWell(EngineeringGravityWellSourceMarkerInitial)
	scriptedGravWellTimestamp = Utility.GetCurrentRealTime()
	Utility.Wait(CONST_StarbornEngineering_InitialAppearanceDelay)
	DestroyScriptedGravityWell(LC165_ScriptedSupernovaExplosion, True)

	;Enable Ice and Fire.
	NoncombatTeleport(starbornIceActorRef, starbornIceActorRef, teleportInExplosion=LC165_StarbornTeleportInExplosion)
	UpdateAndEVPActor(starbornIceActorRef, CONST_Ice_DataIndex, starbornStateValue=CONST_StarbornStateValue_Engineering_Normal, shouldRemoveFromPlayerFriendFaction=True)
	
	float[] fireMarkerOffsetValues = new float[3]
	fireMarkerOffsetValues[2] = 2
	ObjectReference fireMarker = EngineeringGravityWellSourceMarkerInitial.PlaceAtMe(XMarker, akOffsetValues=fireMarkerOffsetValues)
	NoncombatTeleport(starbornFireActorRef, fireMarker, teleportInExplosion=LC165_StarbornTeleportInExplosion)
	UpdateAndEVPActor(starbornFireActorRef, CONST_Fire_DataIndex, starbornStateValue=CONST_StarbornStateValue_Engineering_Normal, shouldRemoveFromPlayerFriendFaction=True)
	fireMarker.Delete()

	MQ302_Battle_03_Engineering_BattleStart.Start()
	StarbornEngineering_GravityWellSourceMarkers.RemoveRef(EngineeringGravityWellSourceMarkerInitial)
	EngineeringGravityWellSourceMarkerInitial.MoveTo(LC165HoldingPenMarkerRef)

	;Activate Robots & Turrets
	Actor[] EngineeringTurrets = StarbornEngineering_TurretsAll.GetArray() as Actor[]
	int i = 0
	While (i < EngineeringTurrets.Length)
		EngineeringTurrets[i].SetUnconscious(False)
		i = i + 1
	EndWhile
	RobotPodScript[] EngineeringRobotsInitial = StarbornEngineering_RobotsActive.GetArray() as RobotPodScript[]
	i = 0
	While (i < EngineeringRobotsInitial.Length)
		EngineeringRobotsInitial[i].WakeRobotFromPod()
		EngineeringRobotsInitial[i].StartCombat(player)
		i = i + 1
	EndWhile

	EngineeringBattleState = CONST_StarbornBattleState_Engineering_Normal
EndFunction

Function StarbornEngineeringUpdate(int starbornDataIndex)
	;Check for death.
	if (!starbornFireDead && (starbornFireActorRef.IsDead()))
		starbornFireDead = True
		if (!starbornIceDead)
			starbornFireHasKey = False
		EndIf
		SetStage(StarbornData[CONST_Fire_DataIndex].StarbornBattleDeathStage)
	EndIf
	if (!starbornIceDead && (starbornIceActorRef.IsDead())) 
		starbornIceDead = True
		if (!starbornFireDead)
			starbornFireHasKey = True
		EndIf
		DestroyScriptedGravityWell()
		SetStage(StarbornData[CONST_Ice_DataIndex].StarbornBattleDeathStage)
	EndIf
	if (starbornFireDead && starbornIceDead)
		if (starbornFireHasKey)
			DropStarbornItem(starbornFireActorRef, EngineeringKey.GetRef())
		Else
			DropStarbornItem(starbornIceActorRef, EngineeringKey.GetRef())
		EndIf
		EngineeringKeyFallback.GetRef().Moveto(EngineeringKeyFallbackSpawnPoint.GetRef())
		SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage)
		EngineeringBattleState = CONST_StarbornBattleState_Engineering_Complete
	EndIf

	;Check for movement updates.
	bool shouldUpdateFireMovement = !starbornFireDead && ShouldUpdateMovement(starbornFireActorRef, CONST_Fire_DataIndex)
	bool shouldUpdateIceMovement = !starbornIceDead && ShouldUpdateMovement(starbornIceActorRef, CONST_Ice_DataIndex)
	if (shouldUpdateFireMovement || shouldUpdateIceMovement)
		ObjectReference fireHoldPositionTarget = SetNewHoldPositionTargetRandom(starbornFireActorRef, StarbornData[CONST_Fire_DataIndex].StarbornMovementHoldPositionKeyword, StarbornEngineering_HoldPositionTargets)
		if (!starbornIceDead)
			SetNewHoldPositionTarget(starbornIceActorRef, StarbornData[CONST_Ice_DataIndex].StarbornMovementHoldPositionKeyword, fireHoldPositionTarget.GetLinkedRef())
		EndIf
	EndIf

	;Check for Grav Well casting.
	float currentTime = Utility.GetCurrentRealTime()
	;Check for timestamp failures.
	if (currentTime < scriptedGravWellTimestamp)
		Debug.Trace("--TimerReset: Resetting scriptedGravWellTimestamp.")
		scriptedGravWellTimestamp = currentTime
	EndIf
	LockGuard(EngineeringGravWellGuard)
		if (starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_WaitToCreate)
			float nextGravWellTime = scriptedGravWellTimestamp + CONST_StarbornEngineering_GravWellCastDelay
			;Check for timestamp failures.
			if (currentTime < nextGravWellTime)
				nextGravWellTime = currentTime
			EndIf
			if (currentTime >= nextGravWellTime)
				starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_TryToCreate
				UpdateAndEVPActor(starbornIceActorRef, CONST_Ice_DataIndex, LC165_Starborn_Ice_ScriptedGravityWellSpell, True)
			EndIf
		ElseIf (starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_WaitToDetonate)
			float detonateTime = scriptedGravWellTimestamp + CONST_StarbornEngineering_GravWellDetonateDelay
			;Check for timestamp failures.
			if (currentTime < detonateTime)
				detonateTime = currentTime
			EndIf
			if (currentTime >= detonateTime)
				if (!starbornFireDead)
					starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_TryToDetonate
					UpdateAndEVPActor(starbornFireActorRef, CONST_Fire_DataIndex, LC165_Starborn_Fire_ScriptedSupernovaSpell, True)
				Else
					starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate
					DestroyScriptedGravityWell(None, True)
				EndIf
			EndIf
		ElseIf (starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_TryToDetonate)
			float cleanupTime = scriptedGravWellTimestamp + (CONST_StarbornEngineering_GravWellDetonateDelay * 1.5)
			;Check for timestamp failures.
			if (currentTime < cleanupTime)
				cleanupTime = currentTime
			EndIf
			if (currentTime >= cleanupTime)
				starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate
				DestroyScriptedGravityWell(None, True)
			EndIf
		EndIf
	EndLockGuard

	;Check for robot activation.
	if (!starbornEngineering_RobotsDisabled)
		RobotPodScript[] EngineeringRobotsActive = StarbornEngineering_RobotsActive.GetArray() as RobotPodScript[]
		int i = 0
		While (i < EngineeringRobotsActive.Length)
			if (EngineeringRobotsActive[i].IsDead())
				StarbornEngineering_RobotsActive.RemoveRef(EngineeringRobotsActive[i])
			EndIf
			i = i + 1
		EndWhile
		int robotsToActivate = CONST_StarbornEngineering_ActiveRobotCountMax - StarbornEngineering_RobotsActive.GetCount()
		if ((robotsToActivate > 0) && (!GetStageDone(CONST_Stage_EngineeringRobotReactStage)))
			SetStage(CONST_Stage_EngineeringRobotReactStage)
		EndIf
		While ((robotsToActivate > 0) && (StarbornEngineering_RobotsInactive.GetCount() > 0))
			RobotPodScript nextRobot = StarbornEngineering_RobotsInactive.GetAt(0) as RobotPodScript
			StarbornEngineering_RobotsInactive.RemoveRef(nextRobot)
			StarbornEngineering_RobotsActive.AddRef(nextRobot)
			nextRobot.WakeRobotFromPod()
			nextRobot.StartCombat(player)
			robotsToActivate = robotsToActivate - 1
		EndWhile
	EndIf
EndFunction

Function StarbornEngineeringDying(ObjectReference akKiller, Actor target, Actor starbornEngineeringRef, int starbornDataIndex)
	if (target == starbornEngineeringRef)
		DissolveStarborn(starbornEngineeringRef)
	EndIf
EndFunction 

Function StarbornEngineeringDisableRobots()
	SetStage(CONST_Stage_EngineeringHackedStage)
	StarbornEngineering_RobotsInactive.RemoveAll()
	StarbornEngineering_RobotsActive.RemoveAll()
	starbornEngineering_RobotsDisabled = True
EndFunction

Function StarbornFireSpellCast(Form spellCast, Actor caster, Actor starbornFireRef, int starbornDataIndex)
	LockGuard(EngineeringGravWellGuard)
		if (spellCast == LC165_Starborn_Fire_ScriptedSupernovaSpell)
			UpdateAndEVPActor(starbornFireRef, starbornDataIndex, LC165_Starborn_Fire_ScriptedSupernovaSpell, False)
			if (starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_TryToDetonate)
				starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate
				DestroyScriptedGravityWell(LC165_ScriptedSupernovaExplosion, True)
			EndIf
		EndIf
	EndLockGuard
EndFunction

Function StarbornIceSpellCast(Form spellCast, Actor caster, Actor starbornIceRef, int starbornDataIndex)
	LockGuard(EngineeringGravWellGuard)
		if (spellCast == LC165_Starborn_Ice_ScriptedGravityWellSpell)
			UpdateAndEVPActor(starbornIceRef, starbornDataIndex, LC165_Starborn_Ice_ScriptedGravityWellSpell, False)
			if (starbornEngineeringGravWellState == CONST_StarbornEngineering_GravWellState_TryToCreate)
				starbornEngineering_GravWellTargetPoint = Game.FindClosestReferenceOfType(LC165_Engineering_GravityWellSourceMarker, player.GetPositionX(), player.GetPositionY(), player.GetPositionZ(), CONST_StarbornEngineering_GravWellCastDistance)
				scriptedGravWellTimestamp = Utility.GetCurrentRealTime()
				if (starbornEngineering_GravWellTargetPoint == None)
					starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToCreate
				Else
					starbornEngineeringGravWellState = CONST_StarbornEngineering_GravWellState_WaitToDetonate
					CreateScriptedGraityWell(starbornEngineering_GravWellTargetPoint)
					StarbornEngineering_GravityWellSourceMarkers.RemoveRef(starbornEngineering_GravWellTargetPoint)
					starbornEngineering_GravWellTargetPoint.MoveTo(LC165HoldingPenMarkerRef)
				EndIf
			EndIf
		EndIf
	EndLockGuard
EndFunction

Function StarbornFireSwapCombatStyle(Actor starbornFireRef, int starbornDataIndex, bool shouldCastSpell)
	if (shouldCastSpell)
		starbornFireRef.SetCombatStyle(LC165_csStarborn_Assault_CastCombatSpell)
	Else
		starbornFireRef.SetCombatStyle(csStarborn_Assault)
	EndIf
EndFunction

Function StarbornIceSwapCombatStyle(Actor starbornIceRef, int starbornDataIndex, bool shouldCastSpell)
	if (shouldCastSpell)
		starbornIceRef.SetCombatStyle(LC165_csStarborn_Sniper_CastCombatSpell)
	Else
		starbornIceRef.SetCombatStyle(csStarborn_Sniper)
	EndIf
EndFunction


;SCOW ANOMALY ----------------
;
;As a failsafe, if the player enters the Scow Anomaly, and Petrov is dead, unlock the door behind him in
;case something happened with his corpse and his key has become inaccessible.

Function CheckPetrovFailsafe()
	if (MQ302BPetrov.GetActorRef().IsDead())
		PetrovsDoor.GetRef().Unlock()
	EndIf
EndFunction


;ELEVATOR --------------------
;
;The elevator ride involves three seperate elevators objects:
;- 01 (which descends from the load into the distortion),
;- 02 (from the distortion to the ground),
;- Static (the static one on the ground thereafter.

Function PlayInitialElevatorLeverSFX()
	WwiseEvent_OBJElevatorLoadStart.Play(ElevatorTopActivator.GetRef())
EndFunction

Function SetupElevators()
	ObjectReference elevator01PlatformHelperRef = Elevator01EnableMarker.GetRef().GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword)
	elevator01PlatformHelperRef.SetAnimationVariableFloat("CurrentPosition", 1)
	elevator01PlatformHelperRef.SetAnimationVariableFloat("Position", 0)
	elevator01PlatformHelperRef.SetAnimationVariableFloat("Speed", CONST_Elevator01Speed)

	ObjectReference elevator02PlatformHelperRef = Elevator02EnableMarker.GetRef().GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword)
	elevator02PlatformHelperRef.SetAnimationVariableFloat("CurrentPosition", 1)
	elevator02PlatformHelperRef.SetAnimationVariableFloat("Position", 0)
	elevator02PlatformHelperRef.SetAnimationVariableFloat("Speed", CONST_Elevator02Speed)
EndFunction

Function PlayElevator01NoWait()
	ObjectReference elevator01EnableMarkerRef = Elevator01EnableMarker.GetRef()
	elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).Disable()
	elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorSoundMarkerKeyword).Enable()
	elevatorSFXID = OBJ_Elevator_Mine_Transit_LP.Play(Game.GetPlayer())
	elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword).PlayAnimation("Play01")
EndFunction

Function DisableElevator01()
	ObjectReference elevator01EnableMarkerRef = Elevator01EnableMarker.GetRef()
	elevator01EnableMarkerRef.DisableNoWait()
	elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).DisableNoWait()
	elevator01EnableMarkerRef.GetLinkedRef(LC165LinkElevatorSoundMarkerKeyword).DisableNoWait()
	WwiseEvent.StopInstance(elevatorSFXID)
EndFunction

Function PlayElevator02NoWait()
	CallFunctionNoWait("PlayElevator02", None)
EndFunction

Function PlayElevator02()
	ObjectReference elevator02EnableMarkerRef = Elevator02EnableMarker.GetRef()
	elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).Disable()
	elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorSoundMarkerKeyword).Enable()
	elevatorSFXID = OBJ_Elevator_Mine_Transit_LP.Play(Game.GetPlayer())
	elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword).PlayAnimationAndWait("Play01", "Done")
	WwiseEvent.StopInstance(elevatorSFXID)

	ObjectReference elevator02GateRef = Elevator02Gate.GetRef()
	elevator02GateRef.SetOpen(True)
	int failsafe = 0
	While ((elevator02GateRef.GetOpenState() != CONST_OpenState_Open) && (failsafe < CONST_ElevatorGateOpenFailsafeCount))
		failsafe = failsafe + 1
		Utility.Wait(0.1)
	EndWhile

	ElevatorTopDoor.TryToEnable()
	ElevatorTopActivator.TryToDisable()
	ElevatorBottomDoor.TryToEnable()
	ElevatorBottomActivator.TryToDisable()

	Elevator02FinishedAnimation = True
EndFunction

Function QuickstartElevator02()
	ObjectReference elevator02EnableMarkerRef = Elevator02EnableMarker.GetRef()
	elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorTopCollisionKeyword).Disable()
	ObjectReference elevator02PlatformHelperRef = elevator02EnableMarkerRef.GetLinkedRef(LC165LinkElevatorPlatformHelperKeyword)
	elevator02PlatformHelperRef.SetAnimationVariableFloat("Speed", 1.0)
	elevator02PlatformHelperRef.PlayAnimationAndWait("Play01", "Done")

	ObjectReference elevator02GateRef = Elevator02Gate.GetRef()
	elevator02GateRef.SetOpen(True)
	ElevatorTopDoor.TryToEnable()
	ElevatorTopActivator.TryToDisable()
	ElevatorBottomDoor.TryToEnable()
	ElevatorBottomActivator.TryToDisable()

	Elevator02FinishedAnimation = True
EndFunction


;RUINS --------------------
;
;Ruins:
;- Maintains CONST_RuinsDemonsMax Inner Demon duplicates of the player and their allies.
;- Flips between Observing Mode, where he remains stationary and in Void Form until time expires or you manage to find and hit him, and
;  Attacking Mode, where he manifests and rushes in to fight until time expires or his health drops to the next threshold.

Function StarbornRuinsStart(Actor starbornRuinsRef, int starbornDataIndex)
	;Play initial scene.
	MQ302_Battle_05_Ruins_BattleStart.Start()

	;Spawn the initial wave of demons, all initially unresponsive.
	Actor[] initialDemons
	if (!DEBUG_StarbornRuinsBlockDemonSpawning)
		ObjectReference initialSpawnPointHead = StarbornRuins_InitialInnerDemonSpawnPointChainHead.GetRef()
		ObjectReference[] initialSpawnPoints = StarbornRuins_InitialInnerDemonSpawnPointChainHead.GetRef().GetLinkedRefChain()
		initialSpawnPoints.Insert(initialSpawnPointHead, 0)
		initialDemons = new Actor[0]
		int i = 0
		While (i < initialSpawnPoints.Length)
			Actor currentDemon = StarbornRuinsSpawnDemon(starbornRuinsRef, starbornDataIndex, initialSpawnPoints[i], False)
			initialDemons.Add(currentDemon)
			Utility.Wait(CONST_RuinsInitialSpawnDelay)
			i = i + 1
		EndWhile
	EndIf

	;Wait for the initial scene to end.
	While (!GetStageDone(CONST_Stage_Ruins_BattleStartSceneEndedStage))
		Utility.Wait(0.1)
	EndWhile

	;Start combat on the initial wave of demons.
	int i = 0
	While ((initialDemons != None) && (i < initialDemons.Length))
		StarbornRuinsStartCombatDemon(initialDemons[i], starbornDataIndex)
		i = i + 1
	EndWhile

	;The Ruins Starborn starts in Observing mode. 
	starbornRuinsRef.Enable()
	starbornRuinsRef.SetValue(LC165_StarbornStateValue, CONST_StarbornStateValue_Ruins_Observing)
	SetRuinsObservingStateHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornRuins_ObservingHoldPositionTargets, True, True)
	starbornRuinsRef.EvaluatePackage()
	starbornRuinsRef.RemoveFromFaction(PlayerFriendFaction)
	LockGuard(RuinsBattleStateGuard)
		RuinsBattleState = CONST_StarbornBattleState_Ruins_Observing
	EndLockGuard
EndFunction

Function StarbornRuinsUpdate(int starbornDataIndex)
	LockGuard(RuinsBattleStateGuard)
		Actor starbornRuinsRef = StarbornData[starbornDataIndex].starbornActorRef

		;Check for death.
		if (starbornRuinsRef.IsDead())
			if (RuinsBattleState < CONST_StarbornBattleState_Ruins_Complete)
				RuinsBattleState = CONST_StarbornBattleState_Ruins_Complete
				CleanupScriptedActors(StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[], -1, True)
				if (StarbornData[starbornDataIndex].StarbornBattleDeathStage >= 0)
					SetStage(StarbornData[starbornDataIndex].StarbornBattleDeathStage)
				EndIf
				SetStage(StarbornData[starbornDataIndex].StarbornBattleEndStage)
			EndIf
		Else
			bool playerIsInTrigger = starbornRuinsTriggerRef.IsInTrigger(player)
			if (!playerIsInTrigger || ShouldUpdateMovement(starbornRuinsRef, starbornDataIndex))
				if (playerIsInTrigger && (RuinsBattleState == CONST_StarbornBattleState_Ruins_Observing))
					Ruins_HitCountWhileObserving = 0
					UpdateAndEVPActor(starbornRuinsRef, starbornDataIndex, starbornStateValue=CONST_StarbornStateValue_Ruins_Attacking)
					SetNewHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, None)
					ExitVoidForm(starbornRuinsRef)
					RuinsBattleState = CONST_StarbornBattleState_Ruins_Attacking
					Debug.Trace("Ruins is Attacking (Time)")
				ElseIf (RuinsBattleState == CONST_StarbornBattleState_Ruins_Attacking)
					starbornRuinsRef.SetValue(LC165_StarbornStateValue, CONST_StarbornStateValue_Ruins_Observing)
					SetRuinsObservingStateHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, StarbornRuins_ObservingHoldPositionTargets, True, True)
					starbornRuinsRef.EvaluatePackage()
					RuinsBattleState = CONST_StarbornBattleState_Ruins_Observing
					MQ302_Battle_05_Ruins_TeleportReaction.Start()
					Debug.Trace("Ruins is Observing (Normal)")
				EndIf
			EndIf

			;Update the Demons.
			if (!DEBUG_StarbornRuinsBlockDemonSpawning)
				float currentTime = Utility.GetCurrentRealTime()
				RefCollectionAlias starbornRuinsDemonCollection = StarbornData[starbornDataIndex].StarbornDuplicatesCollection
				Actor[] starbornRuinsDemons = starbornRuinsDemonCollection.GetArray() as Actor[]
				if (starbornRuinsDemons == None)
					starbornRuinsDemons = new Actor[0]
				EndIf
				int i = 0
				While (i < starbornRuinsDemons.Length)
					Actor current = starbornRuinsDemons[i]
					if (current.IsDead())
						TeleportOutNoWait(current, teleportOutSpell=LC165_AbInnerDemonDeath, shouldDisable=True)
						starbornRuinsDemonCollection.RemoveRef(current)
						starbornRuinsDemonsRespawnTimes.Add(currentTime)
						Debug.Trace("DEMON: " + i + ": Removed " + current)
					EndIf
					i = i + 1
				EndWhile
				Debug.Trace("Demons Active: " + starbornRuinsDemonCollection.GetCount())
				;We want to:
				;-Ensure at least one Demon is always active.
				;-Spawn at most on Demon per update.
				if ((starbornRuinsDemonsRespawnTimes.Length > 0) && ((starbornRuinsDemonsRespawnTimes[0] < currentTime) || (currentTime > starbornRuinsDemonsRespawnTimes[0] + CONST_RuinsDemonsRespawnDelay) || (starbornRuinsDemonCollection.GetCount() == 0)))
					Debug.Trace("Respawning")
					starbornRuinsDemonsRespawnTimes.Remove(0)
					StarbornRuinsSpawnDemon(starbornRuinsRef, starbornDataIndex)
				EndIf
			EndIf
		EndIf
	EndLockGuard
EndFunction

Function StarbornRuinsDying(ObjectReference akKiller, Actor target, Actor starbornRuinsRef, int starbornDataIndex)
	if (target == starbornRuinsRef)
		Var[] akArgs = new Var[1]
		akArgs[0] = CONST_Ruins_DataIndex
		CallFunctionNoWait("StarbornRuinsUpdate", akArgs)
		DissolveStarborn(starbornRuinsRef)
	EndIf
EndFunction 

;If hit while in Observing Mode, increment our counter so we can drop out of Observing Mode and not look stupid.
bool Function StarbornRuinsHit(Actor aggressor, Actor target, Actor starbornRuinsRef, int starbornDataIndex)
		if (RuinsBattleState == CONST_StarbornBattleState_Ruins_Observing)
			LockGuard(RuinsBattleStateGuard)
				if (RuinsBattleState == CONST_StarbornBattleState_Ruins_Observing)
					Ruins_HitCountWhileObserving = Ruins_HitCountWhileObserving + 1
					if (Ruins_HitCountWhileObserving >= CONST_Ruins_HitCountWhileObserving_Max)
						Ruins_HitCountWhileObserving = 0
						starbornRuinsRef.SetValue(LC165_StarbornMovementUpdateTimestampValue, Utility.GetCurrentRealTime())
						UpdateAndEVPActor(starbornRuinsRef, starbornDataIndex, starbornStateValue=CONST_StarbornStateValue_Ruins_Attacking)
						SetNewHoldPositionTarget(starbornRuinsRef, StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, None)
						ExitVoidForm(starbornRuinsRef)
						RuinsBattleState = CONST_StarbornBattleState_Ruins_Attacking
						Debug.Trace("Ruins is Attacking (Hit)")
					EndIf
				EndIf
			EndLockGuard
		EndIf
	return True
EndFunction

Function StarbornRuinsSwapCombatStyle(Actor starbornRuinsRef, int starbornDataIndex, bool shouldCastSpell)
	Debug.Trace("Ruins was told to swap combat styles. This is unexpected and a bug.")
EndFunction


;When the Ruins Starborn selects a new hold position target to teleport to, try to find something reasonably close to the player.
;We make CONST_RuinsTargetSelectionAttemptsMax attempts to find a good position before just taking what we can get.
ObjectReference Function SetRuinsObservingStateHoldPositionTarget(Actor actorToUpdate, Keyword holdPositionKeyword, RefCollectionAlias potentialHoldPositionTargetsCol, bool shouldTeleport=False, bool shouldBeInvisibleAfterTeleport=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	int attempts = 0
	ObjectReference[] potentialHoldPositionTargets = potentialHoldPositionTargetsCol.GetArray()
	int newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length-1)
	ObjectReference newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex]
	While ((attempts < CONST_RuinsTargetSelectionAttemptsMax) && (newHoldPositionTarget.GetDistance(player) > CONST_RuinsTeleportDistanceMax))
		attempts = attempts + 1
		newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length-1)
		newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex]
	EndWhile
	Debug.Trace("Ruins switches to Observing. Attempts=" + attempts + " Distance=" + newHoldPositionTarget.GetDistance(player))
	return SetNewHoldPositionTarget(actorToUpdate, holdPositionKeyword, newHoldPositionTarget, shouldTeleport, shouldBeInvisibleAfterTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
EndFunction



Actor Function StarbornRuinsSpawnDemon(Actor starbornRuinsRef, int starbornDataIndex, ObjectReference spawnPoint=None, bool shouldStartCombatOnSpawn=True)
	Actor newDemon = CreateRuinsDemon(starbornDataIndex, StarbornData[starbornDataIndex].StarbornDuplicatesCollection)
	if (!shouldStartCombatOnSpawn)
		newDemon.AddToFaction(PlayerFriendFaction)
	EndIf
	if (spawnPoint != None)
		CombatTeleportNoWait(newDemon, spawnPoint, teleportInExplosion=LC165_StarbornInnerDemonSpawnExplosion)
	Else
		CombatTeleportNearPlayerNoWait(newDemon, CONST_RuinsSpawnNearPlayerDistance_Min, CONST_RuinsSpawnNearPlayerDistance_Max, teleportInExplosion=LC165_StarbornInnerDemonSpawnExplosion)
	EndIf
	if (shouldStartCombatOnSpawn)
		StarbornRuinsStartCombatDemon(newDemon, starbornDataIndex)
	Else
		newDemon.EvaluatePackage()
	EndIf
	Debug.Trace("Spawned demon " + newDemon)
	return newDemon
EndFunction

Function StarbornRuinsStartCombatDemon(Actor demon, int starbornDataIndex)
	UpdateAndEVPActor(demon, starbornDataIndex, starbornStateValue=CONST_StarbornStateValue_Ruins_Attacking, shouldRemoveFromPlayerFriendFaction=True)
EndFunction



;TEMPLE DOORS --------------------

;Set the temple door activation block and vfx states.
Function SetTempleDoorState(bool exteriorShouldBeBlocked, bool interiorShouldBeBlocked)
	if (exteriorShouldBeBlocked)
		templeExteriorDoorRef.SetAnimationState("Off")
		templeExteriorDoorBarsRef.SetAnimationState("Off")
		((templeExteriorDoorBarsRef as ObjectReference) as StarbornTempleDoorBarsScript).SetShouldRegisterForOpenEvent(False)
	Else
		templeExteriorDoorRef.SetAnimationState("On")
		templeExteriorDoorBarsRef.SetAnimationState("On")
		((templeExteriorDoorBarsRef as ObjectReference) as StarbornTempleDoorBarsScript).SetShouldRegisterForOpenEvent(True)
	EndIf
	if (interiorShouldBeBlocked)
		templeInteriorDoorRef.SetAnimationState("Off")
	Else
		templeInteriorDoorRef.SetAnimationState("On")
	EndIf
EndFunction



;-----------------------------------------------------------------------------------
;Final Boss Battle
;------------------
;
;PRE-BATTLE-------------------------------------------------------------------------

;AdversaryBattleStageData's array controls the array of stages the battle progresses through.
;Once an adversary has been selected, push the correct array into that property.
Function SetupAdversaryBattleStageData()
	if (GetStageDone(CONST_Stage_Startup_HunterEnemy) && (AdversaryBattleStageData_Hunter != None))
		AdversaryBattleStageData = AdversaryBattleStageData_Hunter
	ElseIf (GetStageDone(CONST_Stage_Startup_EmissaryEnemy) && (AdversaryBattleStageData_Emissary != None))
		AdversaryBattleStageData = AdversaryBattleStageData_Emissary
	Else
		;The BothEnemy state's array is the default, so nothing to do.
	EndIf
EndFunction

;Initialize the adversaries for the battle.
;Note that the 'real' Hunter and Emissary don't participate in the battle (all of the combatants are duplicates) to avoid premature looting of their bodies when killed.
;The real Hunter and Emissary are held in the holding pen until the end of the battle, then moved into the temple and killed, usually during the death scene.
Function InitAdversary()
	;To address a timing issue with quickstarts, make sure OnQuestInit has finished before proceeding.
	int failsafe
	While ((artifactActivatorRef == None) && (failsafe < CONST_Adversary_InitAdversaryFailsafeTimeout))
		failsafe = failsafe + 1
		Utility.Wait(0.1)
	EndWhile
	if (failsafe >= CONST_Adversary_InitAdversaryFailsafeTimeout)
		Debug.Trace("ERROR: InitAdversary timed out.", 2)
	EndIf

	adversary01Ref = Adversary01.GetActorRef()
	adversary02Ref = Adversary02.GetActorRef()

	RefCollectionAlias adversaryDuplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection

	adversary01DuplicateRef = CreateDuplicate(LC165HoldingPenMarkerRef, adversary01Ref, None, adversaryDuplicates, CONST_Adversary_DataIndex, True)
	StarbornData[CONST_Adversary_DataIndex].starbornActorRef = adversary01DuplicateRef
	InitAdversaryHelper(adversary01DuplicateRef)
	adversary01DuplicateRef.EnableNoWait()
	StarbornAdversary_Primary.ForceRefTo(adversary01DuplicateRef)
	if (GetStageDone(CONST_Stage_Startup_HunterEnemy) || GetStageDone(CONST_Stage_Startup_BothEnemies))
		starbornAdversaryHunter = adversary01DuplicateRef
		StarbornAdversary_Hunter.ForceRefTo(adversary01DuplicateRef)
	Else
		starbornAdversaryEmissary = adversary01DuplicateRef
		StarbornAdversary_Emissary.ForceRefTo(adversary01DuplicateRef)
	EndIf

	if (adversary02Ref != None)
		adversary02DuplicateRef = CreateDuplicate(LC165HoldingPenMarkerRef, adversary02Ref, adversary01DuplicateRef, adversaryDuplicates, CONST_Adversary_DataIndex, True)
		adversary02DuplicateRef.SetLinkedRef(adversary01DuplicateRef, LC165_StarbornEventActorLinkKeyword)
		InitAdversaryHelper(adversary02DuplicateRef)
		adversary02DuplicateRef.EnableNoWait()
		starbornAdversaryEmissary = adversary02DuplicateRef
		StarbornAdversary_Emissary.ForceRefTo(adversary02DuplicateRef)
	EndIf


	;Create additional duplicates for the Hunter and/or Emissary as appropriate.
	if (GetStageDone(CONST_Stage_Startup_HunterEnemy))
		;Hunter gets one.
		Actor duplicate = CreateDuplicate(LC165HoldingPenMarkerRef, adversary01Ref, adversary01DuplicateRef, adversaryDuplicates, CONST_Adversary_DataIndex, True)
		duplicate.SetEssential(True)
	Else
		;Emissary gets CONST_Adversary_EmissaryDuplicateCount.
		Actor emissaryRef
		if (adversary02Ref == None)
			emissaryRef = adversary01Ref
		Else
			emissaryRef = adversary02Ref
		EndIf
		int i = 0
		While (i < CONST_Adversary_EmissaryDuplicateCount)
			Actor duplicate = CreateDuplicate(LC165HoldingPenMarkerRef, emissaryRef, adversary01DuplicateRef, adversaryDuplicates, CONST_Adversary_DataIndex, True)
			duplicate.SetEssential(True)
			i = i + 1
		EndWhile
	EndIf

	;Calculate our base health on setup. Also set No Bleedout Recovery at this time.
	Actor[] allDuplicates = adversaryDuplicates.GetArray() as Actor[]
	int i = 0
	While (i < allDuplicates.Length)
		adversaryHealthBaseTotal = adversaryHealthBaseTotal + allDuplicates[i].GetBaseValue(Health)
		allDuplicates[i].SetNoBleedoutRecovery(True)
		i = i + 1
	EndWhile

	;Enable the first <CONST_StarbornAdversary_ShiftsToLoad> areas.
	StarbornAdversaryPreloadShiftsNoWait(-1, 0)
EndFunction

Function InitAdversaryHelper(Actor adversaryRef)
	adversaryRef.Disable()
	adversaryRef.SetGhost(True)
	adversaryRef.SetEssential(True)
	adversaryRef.AddToFaction(PlayerFriendFaction)
	adversaryRef.MoveTo(LC165HoldingPenMarkerRef)
EndFunction


;Initialize the temple interior when the player loads in.
Function InitTempleInterior()
	templeInteriorInitialized = True
	Debug.Trace("Temple Interior Initialized")

	;Register for the player, companion, or ally using a Starborn Power so the Artifact can react to it.
	RegisterForRemoteEvent(player, "OnSpellCast")
	Actor companionRef = Companion.GetActorRef()
	if (companionRef != None)
		RegisterForRemoteEvent(companionRef, "OnSpellCast")
	EndIf
	Actor[] followerRefs = Followers.GetArray() as Actor[]
	int i = 0
	While ((followerRefs != None) && (i < followerRefs.Length))
		RegisterForRemoteEvent(followerRefs[i], "OnSpellCast")
		i = i + 1
	EndWhile
EndFunction

;Convenience function to dispel Void Form on the Adversary during the Confrontation Scene.
Function StarbornAdversaryTeleportInForConfrontation(bool DEBUG_forceDispel=False)
	if (!hasDispelledAdversaryVoidForm)
		hasDispelledAdversaryVoidForm = True

		;The Hunter/Emissary teleport in for the confrontation scene.
		ObjectReference adversary01StartPoint
		ObjectReference adversary02StartPoint
		if (adversary02Ref == None)
			adversary01StartPoint = LC165AdversarySoloSceneMarkerRef
		Else
			adversary01StartPoint = LC165Adversary01SceneMarkerRef
			adversary02StartPoint = LC165Adversary02SceneMarkerRef
		EndIf

		TeleportIn(adversary01StartPoint)
		adversary01DuplicateRef.MoveTo(adversary01StartPoint)

		if (adversary02StartPoint != None)
			Utility.Wait(1)
			TeleportIn(adversary02StartPoint)
			adversary02DuplicateRef.MoveTo(adversary02StartPoint)
		EndIf
	EndIf
EndFunction



;BOSS BATTLE------------------------------------------------------------------------------------

;Start the battle.
Function StarbornAdversaryStart(Actor starbornAdversaryRef, int starbornDataIndex)
	;Delay a moment to let the camera settle.
	Utility.Wait(1.5)
	;Start the boss battle music.
	MUSGenesisCombatBoss_MQ302B_B_BattleFinal.Add()
	;Start combat with the Hunter and Emissary that are currently visible.
	if (adversary02Ref == None)
		NoncombatTeleport(adversary01DuplicateRef, LC165AdversarySoloCombatStartMarkerRef)
	Else
		NoncombatTeleport(adversary01DuplicateRef, LC165Adversary01CombatStartMarkerRef)
		NoncombatTeleport(adversary02DuplicateRef, LC165Adversary02CombatStartMarkerRef)
	EndIf
	if (starbornAdversaryHunter != None)
		starbornAdversaryHunter.SetGhost(False)
		UpdateAndEVPActor(starbornAdversaryHunter, starbornDataIndex, starbornStateValue=CONST_StarbornStateValue_Adversary_Normal, shouldRemoveFromPlayerFriendFaction=True)
	EndIf
	if (starbornAdversaryEmissary != None)
		starbornAdversaryEmissary.SetGhost(False)
		UpdateAndEVPActor(starbornAdversaryEmissary, starbornDataIndex, starbornStateValue=CONST_StarbornStateValue_Adversary_Normal, shouldRemoveFromPlayerFriendFaction=True)
	EndIf
	;Speed up the rings.
	artifactRingsRef.SetAnimationVariableFloat("fRingSpeed", CONST_ArtifactRingSpeed_DuringBattle)
	;Have your ally start combat with the Adversary to get them to draw their weapon.
	Ally.GetActorRef().StartCombat(adversary01DuplicateRef)
	Actor[] followerRefs = Followers.GetArray() as Actor[]
	int i = 0
	While (i < followerRefs.Length)
		followerRefs[i].StartCombat(adversary01DuplicateRef)
		i = i + 1
	EndWhile
	;Enable the duplicates.
	Actor[] allDuplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
	ObjectReference duplicateSpawnPoint = StarbornAdversary_InitialDuplicateSpawnPointChainHead.GetRef()
	i = 0
	While (i < allDuplicates.Length)
		if ((allDuplicates[i] != starbornAdversaryHunter) && (allDuplicates[i] != starbornAdversaryEmissary))
			TeleportIn(duplicateSpawnPoint, teleportInExplosion=LC165_StarbornParallelSelfSpawnExplosion)
			allDuplicates[i].Enable()
			allDuplicates[i].MoveTo(duplicateSpawnPoint)
			UpdateAndEVPActor(allDuplicates[i], starbornDataIndex, starbornStateValue=CONST_StarbornStateValue_Adversary_Normal, shouldRemoveFromPlayerFriendFaction=True)
			duplicateSpawnPoint = duplicateSpawnPoint.GetLinkedRef()
		EndIf
		i = i + 1
	EndWhile
	;Perform the first state change to select their initial hold position targets.
	LockGuard(AdversaryBattleStageDataGuard)
		StarbornAdversaryPerformStateChange(CONST_StarbornAdversary_State_TempleInitial)
	EndLockGuard
	;And start the supplemental CheckForStateChange timer.
	StartTimer(CONST_StarbornAdversary_CheckForStateChangeTimerDelay, CONST_StarbornAdversary_CheckForStateChangeTimerID)
EndFunction


;Timer Loop: Updates related to movement and scripted spellcasting.
;Runs in parallel with StarbornAdversaryCheckForStateChange, since both loops have long, time-sensitive operations.
Function StarbornAdversaryUpdate(int starbornDataIndex)
	if (!adversaryBattleComplete)
		;Get an array with the Adversaries & Duplicates.
		Actor[] adversaryRefs = StarbornData[starbornDataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]

		;If the Adversary array is now empty, we're done, just bail out.
		if (adversaryRefs == None)
			return
		EndIf

		;Check for movement updates.
		if (currentAdversaryHoldPositionTargetCollection != None)
			int i = 0
			While (i < adversaryRefs.Length)
				bool shouldUpdateMovementHealth = ShouldUpdateMovementDueToHealthLoss(adversaryRefs[i], starbornDataIndex)
				bool shouldUpdateMovementTime = ShouldUpdateMovementDueToTime(adversaryRefs[i], starbornDataIndex)
				bool shouldUpdateTeleport
				if (ShouldUpdateMovementHealth && adversaryRefs[i].HasKeyword(MQEmissaryKeyword) && (adversaryRefs[i].GetValue(Health) > 0))
					shouldUpdateTeleport = True
				EndIf
				if (shouldUpdateMovementHealth || shouldUpdateMovementTime)
					LockGuard(AdversaryShiftingGuard)
						SetNewHoldPositionTargetRandom(adversaryRefs[i], StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword, currentAdversaryHoldPositionTargetCollection, shouldUpdateTeleport)
						Debug.Trace("Updated movement for " + adversaryRefs[i] + " to " + adversaryRefs[i].GetLinkedRef(StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword) + " with keyword " + StarbornData[starbornDataIndex].StarbornMovementHoldPositionKeyword)
					EndLockGuard
				EndIf
				i = i + 1
			EndWhile
		EndIf

		;Update spells and special abilities for the current stage, if any.
		float currentTime = Utility.GetCurrentRealTime()
		Actor primeAdversary = adversaryRefs[0]
		if ((primeAdversary != None) && (primeAdversary.GetValue(LC165_AdversaryFleeValue) == CONST_AdversaryFleeValue_ShouldNotFlee) && ((AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowGravWellStage) || (AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowDemonStage)))
			LockGuard(AdversaryBattleStageDataGuard)
				if (AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowGravWellStage)
					LockGuard(AdversaryGravWellGuard)
						if (primeAdversary != starbornAdversaryCurrentPrimary)
							starbornAdversaryCurrentPrimary = primeAdversary
							starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate
							DestroyScriptedGravityWell(None, True)
						EndIf
						if (starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_WaitToCreate)
							float nextGravWellTime = scriptedGravWellTimestamp + CONST_StarbornAdversary_GravWellCastDelay
							;Check for timestamp failures.
							if (currentTime < nextGravWellTime)
								Debug.Trace("--TimerReset: currentTime < nextGravWellTime")
								nextGravWellTime = currentTime
							EndIf
							if (currentTime >= nextGravWellTime)
								starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_TryToCreate
								UpdateAndEVPActor(primeAdversary, starbornDataIndex, spellToUpdate=LC165_Starborn_Ice_ScriptedGravityWellSpell, shouldAddSpell=True)
							EndIf
						ElseIf (starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_WaitToDetonate)
							float detonateTime = scriptedGravWellTimestamp + CONST_StarbornAdversary_GravWellDetonateDelay
							;Check for timestamp failures.
							if (currentTime < detonateTime)
								Debug.Trace("--TimerReset: currentTime < detonateTime")
								detonateTime = currentTime
							EndIf
							if (currentTime >= detonateTime)
								if (primeAdversary.HasKeyword(MQHunterKeyword))
									starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_TryToDetonate
									UpdateAndEVPActor(primeAdversary, starbornDataIndex, spellToUpdate=LC165_Starborn_Fire_ScriptedSupernovaSpell, shouldAddSpell=True)
								Else
									starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate
									DestroyScriptedGravityWell(None, True)
								EndIf
							EndIf
						ElseIf (starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_TryToDetonate)
							float cleanupTime = scriptedGravWellTimestamp + (CONST_StarbornAdversary_GravWellDetonateDelay * 1.5)
							;Check for timestamp failures.
							if (currentTime < cleanupTime)
								Debug.Trace("--TimerReset: currentTime < cleanupTime")
								cleanupTime = currentTime
							EndIf
							if (currentTime >= cleanupTime)
								starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate
								DestroyScriptedGravityWell(None, True)
							EndIf
						EndIf
					EndLockGuard
				EndIf
				if (AdversaryBattleStageData[adversaryBattleStageDataIndex].AllowDemonStage)
					LockGuard(AdversaryDemonGuard)
						if (primeAdversary != starbornAdversaryCurrentPrimary)
							starbornAdversaryCurrentPrimary = primeAdversary
							starbornAdversaryDemonState = CONST_StarbornAdversary_DemonState_Waiting
						EndIf
						Actor[] adversaryDemons = StarbornAdversary_Demons.GetArray() as Actor[]
						int i = 0
						While (i < adversaryDemons.Length)
							if (adversaryDemons[i].IsDead())
								TeleportOutNoWait(adversaryDemons[i], teleportOutSpell=LC165_AbInnerDemonDeath, shouldDisable=True)
								StarbornAdversary_Demons.RemoveRef(adversaryDemons[i])
							EndIf
							i = i + 1
						EndWhile
						int remainingDemons = StarbornAdversary_Demons.GetCount()
						if (remainingDemons < CONST_StarbornAdversary_DemonsToSpawnTotal)
							if ((currentTime < starbornAdversaryScriptedDemonTimestamp) || (currentTime >= starbornAdversaryScriptedDemonTimestamp + CONST_StarbornAdversary_DemonCastDelay))
								starbornAdversaryScriptedDemonTimestamp = currentTime
								starbornAdversaryDemonState = CONST_StarbornAdversary_DemonState_ReadyToCast
								UpdateAndEVPActor(primeAdversary, starbornDataIndex, spellToUpdate=LC165_Starborn_Adversary_ScriptedInnerDemonSpell, shouldAddSpell=True)
							EndIf
						EndIf
					EndLockGuard
				EndIf
				if (AdversaryBattleStageData[adversaryBattleStageDataIndex].AddTraumaPackStage)
					AdversaryBattleStageData[adversaryBattleStageDataIndex].AddTraumaPackStage = False
					if (primeAdversary != starbornAdversaryCurrentPrimary)
						starbornAdversaryCurrentPrimary = primeAdversary
					EndIf
					primeAdversary.AddItem(Aid_TraumaPack)
				EndIf
			EndLockGuard
		EndIf
	EndIf
EndFunction

;Timer Loop: Monitor the Adversaries' health and change states when necessary.
;Runs in parallel with StarbornAdversaryUpdate, since both loops have long, time-sensitive operations.
Function StarbornAdversaryCheckForStateChange()
	if (!adversaryBattleComplete)
		float adversaryHealthCurrentTotal = 0
		Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
		float[] adversaryRefsCurrentHealth = new float[adversaryRefs.Length]
		bool potentialAdversaryRemoval
		Actor currentAdversaryRef
		int i = 0
		While (i < adversaryRefs.Length)
			currentAdversaryRef = adversaryRefs[i]
			adversaryRefsCurrentHealth[i] = currentAdversaryRef.GetValue(Health)
			adversaryHealthCurrentTotal = adversaryHealthCurrentTotal + Math.Max(adversaryRefsCurrentHealth[i], 0)
			if (!potentialAdversaryRemoval && adversaryRefsCurrentHealth[i] <= 0)
				potentialAdversaryRemoval = True
			EndIf
			i = i + 1
		EndWhile
		float adversaryHealthCurrentPercent = adversaryHealthCurrentTotal / adversaryHealthBaseTotal
		Debug.Trace("Adversary Health: " + adversaryHealthCurrentTotal + "/" + adversaryHealthBaseTotal + "; " + adversaryHealthCurrentPercent)

		LockGuard(AdversaryBattleStageDataGuard)
			if (!DEBUG_AdversaryDebugMode && (adversaryHealthCurrentPercent <= AdversaryBattleStageData[adversaryBattleStageDataIndex+1].StageHealthThreshold))
				StarbornAdversaryPerformStateChange(-1, adversaryHealthCurrentPercent, adversaryHealthCurrentTotal)
			ElseIf (potentialAdversaryRemoval)
				i = 0
				While (i < adversaryRefs.Length)
					if (adversaryRefsCurrentHealth[i] <= 0)
						if (adversaryRefs.Length >= 2)
							Actor adversaryToRemove = adversaryRefs[i]
							Debug.Trace("Removing adversary " + adversaryToRemove)
							adversaryToRemove.KillEssential()
							TeleportOutNoWait(adversaryToRemove, teleportOutSpell=LC165_AbParallelSelfDeath, shouldDisable=True)
							StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.RemoveRef(adversaryToRemove)
							adversaryRefs.Remove(i)
							adversaryRefsCurrentHealth.Remove(i)
							i = i - 1
						EndIf
					EndIf
					i = i + 1
				EndWhile
			EndIf
		EndLockGuard
	EndIf
EndFunction

;Perform state changes and area shifting.
Function StarbornAdversaryPerformStateChange(int forcedState=-1, float adversaryHealthCurrentPercent=-1.0, float adversaryHealthCurrentTotal=-1.0, ObjectReference distortion=None) RequiresGuard(AdversaryBattleStageDataGuard)
	Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
	int adversaryBattlePreviousStageDataIndex = adversaryBattleStageDataIndex
	safeToForceAdversaryShift = False

	;Determine which state we're changing into.
	if (forcedState >= 0)
		adversaryBattleStageDataIndex = forcedState
	ElseIf (adversaryHealthCurrentPercent >= 0)
		bool shouldStopAndExecute
		While ((!shouldStopAndExecute) && (adversaryBattleStageDataIndex < AdversaryBattleStageData.Length-1) && (adversaryHealthCurrentPercent <= AdversaryBattleStageData[adversaryBattleStageDataIndex+1].StageHealthThreshold))
			adversaryBattleStageDataIndex = adversaryBattleStageDataIndex + 1
			if (AdversaryBattleStageData[adversaryBattleStageDataIndex].MustExecute || (AdversaryBattleStageData[adversaryBattleStageDataIndex].BackstopHealthThreshold > 0))
				shouldStopAndExecute = True
			EndIf
		EndWhile
	Else
		Debug.Trace("ERROR: StarbornAdversaryPerformStateChange was called, but neither forcedState nor adversaryHealthCurrentPercent were set. Aborting.")
		return
	EndIf
	Debug.Trace("StarbornAdversaryPerformStateChange: Changing to " + adversaryBattleStageDataIndex + ": " + AdversaryBattleStageData[adversaryBattleStageDataIndex].Name)

	;Remove spells for the old state.
	Actor primeAdversary = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetAt(0) as Actor
	if (AdversaryBattleStageData[adversaryBattlePreviousStageDataIndex].AllowGravWellStage)
		primeAdversary.RemoveSpell(LC165_Starborn_Fire_ScriptedSupernovaSpell)
		primeAdversary.RemoveSpell(LC165_Starborn_Ice_ScriptedGravityWellSpell)
		StarbornAdversarySwapCombatStyle(primeAdversary, CONST_Adversary_DataIndex, False)
		DestroyScriptedGravityWell(None, True)
	EndIf
	if (AdversaryBattleStageData[adversaryBattlePreviousStageDataIndex].AllowDemonStage)
		primeAdversary.RemoveSpell(LC165_Starborn_Adversary_ScriptedInnerDemonSpell)
		StarbornAdversaryKillDemons()
		StarbornAdversarySwapCombatStyle(primeAdversary, CONST_Adversary_DataIndex, False)
	EndIf

	;If this is the end of the Adversary battle, clean up and play the death scene.
	if (AdversaryBattleStageData[adversaryBattleStageDataIndex].IsAdversaryEndStage)
		StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.RemoveRef(primeAdversary)
		DestroyScriptedGravityWell(None, True)
		StarbornAdversaryKillDemons()
		StarbornAdversaryPlayDeathSceneAndWait(primeAdversary)
	EndIf	

	;Set the before-shifting stage.
	int stageToSetOnEnterBeforeShifting = AdversaryBattleStageData[adversaryBattleStageDataIndex].StageToSetOnEnterBeforeShifting
	if (stageToSetOnEnterBeforeShifting >= 0)
		SetStage(stageToSetOnEnterBeforeShifting)
	EndIf

	LockGuard(AdversaryShiftingGuard)
		;Trigger the shift.
		String shiftToTrigger = AdversaryBattleStageData[adversaryBattleStageDataIndex].ShiftToTrigger
		String functionToCallDuringShift = AdversaryBattleStageData[adversaryBattleStageDataIndex].FunctionToCallDuringShift
		if (ShiftToTrigger != "")
			selfAsShiftingScript.ShiftTo(shiftToTrigger, functionToCallDuringShift, distortion)
			StarbornAdversary_ActiveDistortion.Clear()
			StarbornAdversaryPreloadShiftsNoWait(adversaryBattlePreviousStageDataIndex, adversaryBattleStageDataIndex)
			stageToSetOnNextShift = -1
		EndIf

		;Backstop Health
		if (AdversaryBattleStageData[adversaryBattleStageDataIndex].BackstopHealthThreshold > 0)
			float backstopHealthTotal = AdversaryBattleStageData[adversaryBattleStageDataIndex].BackstopHealthThreshold * adversaryHealthBaseTotal
			float backstopHealthAdd = Math.Max(backstopHealthTotal - adversaryHealthCurrentTotal, 0)
			float backstopHealthAddPerRef = backstopHealthAdd / adversaryRefs.Length
			if (backstopHealthAdd == 0)
				;Debug.Trace("Skipping health backstop. Current: " + adversaryHealthCurrentTotal + ">=" + backstopHealthTotal)
			Else
				;Sort and reverse the array, so the adversary with the most health is first, etc..
				;This simplifies the spillover process in case one Adversary happens to have full health and another has lost a lot.
				adversaryRefs = CommonArrayFunctions.SortRefsByValue(adversaryRefs as ObjectReference[], Health) as Actor[]
				int arrayLength = adversaryRefs.Length
				Actor[] reversedAdversaries = new Actor[arrayLength]
				float[] reversedHealth = new float[arrayLength]
				int i = 0
				While (i < arrayLength)
					reversedAdversaries[arrayLength - i - 1] = adversaryRefs[i]
					reversedHealth[arrayLength - i - 1] = adversaryRefs[i].GetValue(Health)
					i = i + 1
				EndWhile
				adversaryRefs = reversedAdversaries
				float[] adversaryRefsCurrentHealth = reversedHealth

				;Debug.Trace("---------------------------------------")
				;Debug.Trace("BACKSTOP:")
				;Debug.Trace("Backstopping To:" + AdversaryBattleStageData[adversaryBattleStageDataIndex].BackstopHealthThreshold + " " + backstopHealthTotal)
				;Debug.Trace("---------------------------------------")
				;Debug.Trace("BEFORE BACKSTOP:")
				adversaryHealthCurrentTotal = 0
				i = 0
				While (i < adversaryRefsCurrentHealth.Length)
					;Debug.Trace("Adversary " + i + ": " + adversaryRefsCurrentHealth[i])
					adversaryHealthCurrentTotal = adversaryHealthCurrentTotal + Math.Max(adversaryRefsCurrentHealth[i], 0)
					i = i + 1
				EndWhile
				;Debug.Trace("TOTAL: " + adversaryHealthCurrentTotal)
				;Debug.Trace("---------------------------------------")

				i = 0
				While (i < adversaryRefs.Length)
					float currentHealthBase = adversaryRefs[i].GetBaseValue(Health)
					float currentHealthLoss
					float healthRestoreRequiredToZero
					if (adversaryRefsCurrentHealth[i] >= 0)
						currentHealthLoss = currentHealthBase - adversaryRefsCurrentHealth[i]
					Else
						currentHealthLoss = currentHealthBase
						healthRestoreRequiredToZero = Math.Abs(adversaryRefsCurrentHealth[i])
					EndIf
					if (currentHealthLoss >= backstopHealthAddPerRef)
						;Debug.Trace("::Adversary " + i + ", before calling RestoreValue, had actual health " + adversaryRefs[i].GetValue(Health) + " and calculated health " + (currentHealthBase-currentHealthLoss) + ". Both of these values should be the same and match the value listed (unless the first is less than 0, in which case, the second should be 0.)")
						;Debug.Trace("::We're restoring " + (healthRestoreRequiredToZero + backstopHealthAddPerRef) + " to them.")
						adversaryRefs[i].RestoreValue(Health, healthRestoreRequiredToZero + backstopHealthAddPerRef)
						;Debug.Trace("::They now have " + adversaryRefs[i].GetValue(Health))
						backstopHealthAdd = backstopHealthAdd - backstopHealthAddPerRef
						;Debug.Trace("Adversary " + i + " adding standard restore of " + backstopHealthAddPerRef)
					Else
						adversaryRefs[i].RestoreValue(Health, currentHealthLoss)
						backstopHealthAdd = backstopHealthAdd - currentHealthLoss
						;Debug.Trace("Adversary " + i + " restores to full, with overflow " + (backstopHealthAddPerRef - currentHealthLoss))
						int adversariesRemaining = adversaryRefs.Length - i - 1
						if (adversariesRemaining > 0)
							backstopHealthAddPerRef = backstopHealthAdd / adversariesRemaining
						;Else
							;Debug.Trace("Backstop has run out of adversaries and failed to restore " + backstopHealthAdd + " health.")
						EndIf
					EndIf
					i = i + 1
				EndWhile
				;Debug.Trace("---------------------------------------")
				float adversaryHealthNewTotal = 0
				;Debug.Trace("AFTER BACKSTOP:")
				i = 0
				While (i < adversaryRefsCurrentHealth.Length)
					float newCurrentHealth = adversaryRefs[i].GetValue(Health)
					adversaryHealthNewTotal = adversaryHealthNewTotal + newCurrentHealth
					;Debug.Trace("Adversary " + i + ": " + newCurrentHealth)
					i = i + 1
				EndWhile
				;Debug.Trace("Backstopping To:" + AdversaryBattleStageData[adversaryBattleStageDataIndex].BackstopHealthThreshold + " " + backstopHealthTotal)
				;Debug.Trace("We're Now At:" + (adversaryHealthNewTotal/adversaryHealthBaseTotal) + " " + adversaryHealthNewTotal)
				;Debug.Trace("---------------------------------------")
			EndIf
		EndIf

		;Shift the Adversary after the requisite delay.
		if (ShiftToTrigger != "")
			selfAsShiftingScript.ShiftAdversary(ShiftToTrigger)
			adversaryLastShiftIndex = adversaryBattleStageDataIndex
			safeToForceAdversaryShift = True
		EndIf

		;Set the after-shifting stage.
		int stageToSetOnEnterAfterShifting = AdversaryBattleStageData[adversaryBattleStageDataIndex].StageToSetOnEnterAfterShifting
		if (stageToSetOnEnterAfterShifting >= 0)
			SetStageNoWait(stageToSetOnEnterAfterShifting)
		EndIf

		;If the battle has ended, set the complete flag.
		if (adversaryBattleStageDataIndex == AdversaryBattleStageData.Length-1)
			adversaryBattleComplete = True
		Else
			;Update our Hold Position data.
			RefCollectionAlias holdPositionCollection = AdversaryBattleStageData[adversaryBattleStageDataIndex].HoldPositionMarkers
			if (holdPositionCollection != None)
				Debug.Trace("Hold Position Collection updated to: " + holdPositionCollection)
				currentAdversaryHoldPositionTargetCollection = AdversaryBattleStageData[adversaryBattleStageDataIndex].HoldPositionMarkers
			EndIf

			;If we have a new Hold Position keyword, update it.
			Keyword newHoldPositionKeyword = AdversaryBattleStageData[adversaryBattleStageDataIndex].HoldPositionKeyword
			if (newHoldPositionKeyword != None)
				Debug.Trace("Hold Position Keyword updated to: " + newHoldPositionKeyword)
				StarbornData[CONST_Adversary_DataIndex].StarbornMovementHoldPositionKeyword = newHoldPositionKeyword
			EndIf

			;If this is a Flee stage, add the keyword and register for hit events. Otherwise, unregister.
			bool currentlyHasKeyword = AdversaryBattleStageData[adversaryBattlePreviousStageDataIndex].IsAdversaryFleeStage
			bool shouldHaveKeyword = AdversaryBattleStageData[adversaryBattleStageDataIndex].IsAdversaryFleeStage
			if (currentlyHasKeyword != shouldHaveKeyword)
				int i = 0
				While (i < adversaryRefs.Length)
					Actor currentAdversaryRef = adversaryRefs[i]
					if (shouldHaveKeyword)
						currentAdversaryRef.SetValue(LC165_AdversaryFleeValue, CONST_AdversaryFleeValue_ShouldFleeWithRun)
						RegisterForHitEvent(currentAdversaryRef)
					Else
						currentAdversaryRef.SetValue(LC165_AdversaryFleeValue, CONST_AdversaryFleeValue_ShouldNotFlee)
						UnregisterForHitEvent(currentAdversaryRef)
					EndIf
					i = i + 1
				EndWhile
			EndIf

			;Update Hold Position targets for the new stage.
			StarbornAdversaryUpdateAllHoldPositionLinks(AdversaryBattleStageData[adversaryBattleStageDataIndex].ShouldUseHoldPreferred)

			;Add spells related to the new stage.
			Spell spellToAddOnEnter = AdversaryBattleStageData[adversaryBattleStageDataIndex].SpellToAddOnEnter
			if (spellToAddOnEnter != None)
				primeAdversary.AddSpell(spellToAddOnEnter)
			EndIf
		EndIf

		;Wait for the Adversary to finish shifting before allowing the function to return and our other timer updates to proceed.
		selfAsShiftingScript.WaitForAdversaryUpdateToFinish()
		safeToForceAdversaryShift = False
	EndLockGuard
EndFunction

Function StarbornAdversaryPreloadShiftsNoWait(int previousStage, int currentStage)
	if (previousStage >= 0)
		String priorShiftName = AdversaryBattleStageData[previousStage].ShiftToTrigger
		String currentShiftName = AdversaryBattleStageData[currentStage].ShiftToTrigger
		if ((priorShiftName != "") && (priorShiftName != currentShiftName))
			ObjectReference previousStageEnableMarker = selfAsShiftingScript.GetShiftEnableParentMarker(priorShiftName)
			if (previousStageEnableMarker != None)
				Debug.Trace("StarbornAdversaryPreloadShiftsNoWait: Unloading " + priorShiftName)
				previousStageEnableMarker.DisableNoWait()
			EndIf
		EndIf
	EndIf
	int i = currentStage
	int shiftsPreloaded = 0
	ObjectReference lastShiftPreloadedMarker
	While ((i < AdversaryBattleStageData.Length) && (shiftsPreloaded < CONST_StarbornAdversary_ShiftsToLoad))
		String potentialShift = AdversaryBattleStageData[i].ShiftToTrigger
		if (potentialShift != "")
			ObjectReference potentialEnableParentMarker = selfAsShiftingScript.GetShiftEnableParentMarker(potentialShift)
			if ((potentialEnableParentMarker != None) && (potentialEnableParentMarker != lastShiftPreloadedMarker))
				if (i == currentStage)
					lastShiftPreloadedMarker = potentialEnableParentMarker
				Else
					Debug.Trace("StarbornAdversaryPreloadShiftsNoWait: Preloading " + potentialShift)
					potentialEnableParentMarker.EnableNoWait()
					lastShiftPreloadedMarker = potentialEnableParentMarker
					shiftsPreloaded = shiftsPreloaded + 1
				EndIf
			EndIf
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function StarbornAdversarySwapCombatStyle(Actor starbornAdversaryRef, int starbornDataIndex, bool shouldCastSpell)
	if (shouldCastSpell)
		if (starbornAdversaryRef.HasKeyword(MQHunterKeyword))
			starbornAdversaryRef.SetCombatStyle(LC165_csStarborn_MQHunter_CastCombatSpell)
		Else
			starbornAdversaryRef.SetCombatStyle(LC165_csStarborn_MQEmissary_CastCombatSpell)
		EndIf		
	Else
		if (starbornAdversaryRef.HasKeyword(MQHunterKeyword))
			starbornAdversaryRef.SetCombatStyle(csStarborn_MQHunter)
		Else
			starbornAdversaryRef.SetCombatStyle(csStarborn_MQEmissary)
		EndIf
	EndIf
EndFunction

;Force a specific stage by index.
Function StarbornAdversaryForceState(int newState, ObjectReference distortion=None)
	LockGuard(AdversaryBattleStageDataGuard)
		if (adversaryBattleStageDataIndex > newState)
			Debug.Trace("ERROR: StarbornAdversaryForceState: We were told to transition to " + newState + ", but are already in " + adversaryBattleStageDataIndex, 2)
		ElseIf (adversaryBattleStageDataIndex == newState)
			Debug.Trace("WARN: StarbornAdversaryForceState: We were told to transition to " + newState + ", but are already in that state.", 1)
		Else
			StarbornAdversaryPerformStateChange(newState, distortion=distortion)
		EndIf
	EndLockGuard
EndFunction

;Force the stage to advance by one.
Function StarbornAdversaryForceStateAdvance()
	LockGuard(AdversaryBattleStageDataGuard)
		StarbornAdversaryPerformStateChange(adversaryBattleStageDataIndex + 1)
	EndLockGuard
EndFunction

;Force an Adversary update as soon as it's safe to do so.
Function ForceAdversaryShift(String shiftName)
	int failsafe = 0
	While (!safeToForceAdversaryShift && (failsafe < CONST_ForceAdversaryShiftFailsafe))
		Utility.Wait(0.25)
		failsafe = failsafe + 1
	EndWhile
	if (safeToForceAdversaryShift)
		selfAsShiftingScript.UpdateAdversary(shiftName, 0.0)
	Else
		Debug.Trace("ERROR: ForceAdversaryShift timed out for shift " + shiftName, 2)
	EndIf
EndFunction

;Handle actors entering one of the distortions during the battle.
Function StarbornAdversaryShiftingTriggerEntered(LC165AdversaryShiftingTriggerScript sourceTrigger, Actor triggerActor, ObjectReference distortion=None)
	if (triggerActor != None)
		LockGuard(AdversaryShiftingGuard)
			if (triggerActor == player)
				if (sourceTrigger.ShouldShiftPlayer)
					;When the player enters a trigger, shift to whatever state comes next.
					int lastShiftIndex = AdversaryBattleStageData.RFindStruct("ShiftToTrigger", sourceTrigger.ShiftName)
					if (lastShiftIndex < 0)
						Debug.Trace("ERROR: Shifting Trigger " + sourceTrigger + " shift name was not found. " + sourceTrigger.ShiftName)
					Else
						StarbornAdversaryForceState(lastShiftIndex+1, distortion)
					EndIf
				EndIf
			ElseIf ((triggerActor == Companion.GetActorRef()) || (triggerActor == Ally.GetActorRef()))
				if (sourceTrigger.ShouldShiftPlayer)
					;When a companion or ally enters a trigger, move them to the holding pen.
					triggerActor.PlaceAtMe(LC165_AnomalyTeleportExplosion)
					triggerActor.MoveTo(LC165AllyHoldingPenMarkerRef)
				EndIf
			ElseIf (StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.Find(triggerActor) >= 0)
				if (sourceTrigger.ShouldShiftAdversary)
					;Check to see if the actor was already shifted out of this stage while waiting on the LockGuard
					int lastShiftIndex = AdversaryBattleStageData.RFindStruct("ShiftToTrigger", sourceTrigger.ShiftName)
					if (lastShiftIndex < 0)
						Debug.Trace("ERROR: Shifting Trigger " + sourceTrigger + " shift name was not found. " + sourceTrigger.ShiftName)
					ElseIf (adversaryLastShiftIndex <= lastShiftIndex)
						;When the adversary enters the trigger:
						;Move them to the holding pen.
						triggerActor.PlaceAtMe(LC165_AnomalyTeleportExplosion)
						triggerActor.AddKeyword(LC165_StarbornAdversaryInaccessibleKeyword)
						triggerActor.MoveTo(LC165HoldingPenMarkerRef)

						;And if all adversaries have now left the area, shift the quest target to the distortion.
						Actor[] allDuplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
						bool allInaccessible = True
						int i = 0
						While ((i < allDuplicates.Length) && allInaccessible)
							allInaccessible = allDuplicates[i].HasKeyword(LC165_StarbornAdversaryInaccessibleKeyword)
							i = i + 1
						EndWhile
						if (allInaccessible)
							StarbornAdversary_ActiveDistortion.ForceRefTo(sourceTrigger.GetLinkedRef())
						EndIf
					Else
						Debug.Trace("Skipped shifting actor to holding pen due to adversaryLastShiftIndex " + adversaryLastShiftIndex + " > lastShiftIndex " + lastShiftIndex)
					EndIf
				EndIf
			ElseIf (sourceTrigger.ShouldShiftOtherActors)
				;If any other actor enters the trigger, just disable them, optionally with vfx.
				;(For example, the Astral Lounge exit elevator disables actors without VFX, as if they'd loaded out.)
				if (sourceTrigger.ShouldPlayVFXForOtherActors)
					triggerActor.PlaceAtMe(LC165_AnomalyTeleportExplosion)
				EndIf
				triggerActor.DisableNoWait()
				Debug.Trace("WARN: StarbornAdversaryShiftingTriggerEntered: Trigger disabled " + triggerActor)
			EndIf
		EndLockGuard
	EndIf
EndFunction

;Helper for StarbornAdversaryPerformStateChange. Update the Hold Position links for all adversaries.
Function StarbornAdversaryUpdateAllHoldPositionLinks(bool shouldUseHoldPreferred) RequiresGuard(AdversaryShiftingGuard)
	Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
	int i = 0
	While (i < adversaryRefs.Length)
		Actor current = adversaryRefs[i]
		int j = 0
		While (j < StarbornMovementHoldPositionKeywords.Length)
			current.SetLinkedRef(None, StarbornMovementHoldPositionKeywords[j])
			j = j + 1
		EndWhile
		if (shouldUseHoldPreferred)
			current.AddKeyword(LC165_BossHoldPosition_PreferredKeyword)
		Else
			current.RemoveKeyword(LC165_BossHoldPosition_PreferredKeyword)
		EndIf
		Keyword holdPositionKeyword = StarbornData[CONST_Adversary_DataIndex].StarbornMovementHoldPositionKeyword
		SetNewHoldPositionTargetRandom(current, holdPositionKeyword, currentAdversaryHoldPositionTargetCollection, False)
		Debug.Trace("Updated movement for " + adversaryRefs[i] + " to " + adversaryRefs[i].GetLinkedRef(holdPositionKeyword) + " with keyword " + holdPositionKeyword)
		i = i + 1
	EndWhile
EndFunction


;Handle scripted spellcasting.
Function StarbornAdversarySpellCast(Form spellCast, Actor caster, Actor starbornAdversaryRef, int starbornDataIndex)
	if (spellCast == LC165_Starborn_Ice_ScriptedGravityWellSpell)
		caster.RemoveSpell(LC165_Starborn_Ice_ScriptedGravityWellSpell)
		StarbornAdversarySwapCombatStyle(caster, CONST_Adversary_DataIndex, False)
		LockGuard(AdversaryGravWellGuard)
			if (starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_TryToCreate)
				scriptedGravWellTimestamp = Utility.GetCurrentRealTime()
				starbornAdversary_GravWellTargetPoint = Game.FindClosestReferenceOfType(LC165_Adversary_GravityWellSourceMarker, player.GetPositionX(), player.GetPositionY(), player.GetPositionZ(), CONST_StarbornAdversary_GravWellCastDistance)
				if (starbornAdversary_GravWellTargetPoint == None)
					starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate
				Else
					starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToDetonate
					CreateScriptedGraityWell(starbornAdversary_GravWellTargetPoint)
					StarbornAdversary_GravityWellSourceMarkers.RemoveRef(starbornAdversary_GravWellTargetPoint)
					starbornAdversary_GravWellTargetPoint.MoveTo(LC165HoldingPenMarkerRef)
				EndIf
			EndIf
		EndLockGuard
	ElseIf (spellCast == LC165_Starborn_Fire_ScriptedSupernovaSpell)
		caster.RemoveSpell(LC165_Starborn_Fire_ScriptedSupernovaSpell)
		StarbornAdversarySwapCombatStyle(caster, CONST_Adversary_DataIndex, False)
		LockGuard(AdversaryGravWellGuard)
			if (starbornAdversaryGravWellState == CONST_StarbornAdversary_GravWellState_TryToDetonate)
				starbornAdversaryGravWellState = CONST_StarbornAdversary_GravWellState_WaitToCreate
				DestroyScriptedGravityWell(LC165_ScriptedSupernovaExplosion, True)
			EndIf
		EndLockGuard
	ElseIf (spellCast == LC165_Starborn_Adversary_ScriptedInnerDemonSpell)
		caster.RemoveSpell(LC165_Starborn_Adversary_ScriptedInnerDemonSpell)
		StarbornAdversarySwapCombatStyle(caster, CONST_Adversary_DataIndex, False)
		LockGuard(AdversaryDemonGuard)
			if (starbornAdversaryDemonState == CONST_StarbornAdversary_DemonState_ReadyToCast)
				starbornAdversaryDemonState = CONST_StarbornAdversary_DemonState_Waiting
				if (!starbornAdversaryHasSpawnedInitialDemons)
					starbornAdversaryHasSpawnedInitialDemons = True
					ObjectReference[] starbornAdversaryInitialDemonSpawnPoints = StarbornAdversary_NASAMuseum_InitialDemonSpawnPoints.GetArray()
					int i = 0
					While (i < CONST_StarbornAdversary_DemonsToSpawnTotal)
						StarbornAdversarySpawnDemon(caster, starbornAdversaryInitialDemonSpawnPoints[i])
						i = i + 1
					EndWhile
				Else
					int i = 0
					While ((i < CONST_StarbornAdversary_DemonsToSpawnPerCastMax) && (StarbornAdversary_Demons.GetCount() < CONST_StarbornAdversary_DemonsToSpawnTotal))
						StarbornAdversarySpawnDemon(caster)
						i = i + 1
					EndWhile
				EndIf
			EndIf
		EndLockGuard	
	EndIf
EndFunction

;If the Adversary is hit while fleeing, remove the Flee keyword.
;This causes the Adversary to revert to the normal Hold Position (in which he still runs, but will fight back).
bool Function StarbornAdversaryHit(Actor aggressor, Actor target, Actor starbornAdversaryRef, int starbornDataIndex)
	target.SetValue(LC165_AdversaryFleeValue, CONST_AdversaryFleeValue_ShouldFleeWithHoldPosition)
	target.EvaluatePackage()
EndFunction


;Temple: Start Zero-G.
Function StarbornAdversarySetZeroGActive()
	LockGuard(AdversaryZeroGGuard)
		Debug.Trace("SetZeroGActive")
		if (!adversaryCompletedZeroGPhase)
			;float currentTime = Utility.GetCurrentRealTime()
			artifactZeroGExplosion = artifactActivatorRef.PlaceAtMe(ArtifactPower_AntiGravityField)
			SetVascoZeroGInactive(True)
			LC165BuriedTemple03.SetGravityScale(0)
			;Debug.Trace("SetGravityScale TO ZeroG took " + (Utility.GetCurrentRealTime() - currentTime))
			ObjectReference[] zeroGDisableObjects = StarbornAdversary_ZeroGDisableObjects.GetArray()
			int i = 0
			While (i < zeroGDisableObjects.Length)
				zeroGDisableObjects[i].DisableNoWait()
				i = i + 1
			EndWhile
		EndIf
	EndLockGuard
	ObjectReference[] zeroGImpulseObjects = StarbornAdversary_ZeroGImpulseObjects.GetArray()
	int i = 0
	While (i < zeroGImpulseObjects.Length)
		zeroGImpulseObjects[i].ApplyHavokImpulse(Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), zeroGImpulseObjects[i].GetMass()*Utility.RandomInt(1, 2)*0.25)
		i = i + 1
	EndWhile
EndFunction

;Temple: Stop Zero-G.
Function StarbornAdversarySetZeroGInactive()
	bool adversaryCompletedZeroGPhaseThisCall
	LockGuard(AdversaryZeroGGuard)
		if (!adversaryCompletedZeroGPhase)
			Debug.Trace("SetZeroGInctive")
			LC165BuriedTemple03.SetGravityScale(CONST_Gravity_MasadaIII)
			SetVascoZeroGInactive(False)
			adversaryCompletedZeroGPhase = True
			adversaryCompletedZeroGPhaseThisCall = True
		EndIf
	EndLockGuard
	if (adversaryCompletedZeroGPhaseThisCall)
		CallFunctionNoWait("StarbornAdversarySetZeroGInactiveNoWait", None)
	EndIf
EndFunction

;Temple: Toggle Vasco Inactive because of ZeroG.
Function SetVascoZeroGInactive(bool shouldBeInactive)
	;Shut down Vasco if necessary.
	Actor[] followerRefs = Followers.GetArray() as Actor[]
	if (followerRefs != None)
		int i = 0
		While (i < followerRefs.Length)
			VascoShutDownZeroGScript VascoRef = followerRefs[i] as VascoShutDownZeroGScript
			if (VascoRef != None)
				if (shouldBeInactive)
					VascoRef.ShutDown()
				Else
					VascoRef.StartUp()
				EndIf
			EndIf
			i = i + 1
		EndWhile
	EndIf
EndFunction



Function StarbornAdversarySetZeroGInactiveNoWait()
	;Unregister for all further power uses from the Player, Companion, and followers, since the Artifact no longer needs to react to them.
	UnregisterForRemoteEvent(player, "OnSpellCast")
	Actor companionRef = Companion.GetActorRef()
	if (companionRef != None)
		UnregisterForRemoteEvent(companionRef, "OnSpellCast")
	EndIf
	Actor[] followerRefs = Followers.GetArray() as Actor[]
	int i = 0
	While ((followerRefs != None) && (i < followerRefs.Length))
		UnregisterForRemoteEvent(followerRefs[i], "OnSpellCast")
		i = i + 1
	EndWhile
	;Re-enable the Zero-G objects.
	ObjectReference[] zeroGDisableObjects = StarbornAdversary_ZeroGDisableObjects.GetArray()
	i = 0
	While (i < zeroGDisableObjects.Length)
		zeroGDisableObjects[i].EnableNoWait()
		i = i + 1
	EndWhile
EndFunction

;Temple: Clean up when shifting away from the temple.
Function StarbornAdversaryShiftAwayFromTemple()
	;Disable ZeroG.
	StarbornAdversarySetZeroGInactive()
	;Reset the Artifact.
	SetArtifactStage(4)
	;Flag that we've shifted away from the Temple. The Artifact no longer needs to react to spellcasting.
	adversaryHasShiftedAwayFromTemple = True
	;As a special case, if we're going to be seeing the Astral Lounge Dancers in this combat, enable them now.
	if (GetStageDone(CONST_Stage_Startup_HunterEnemy) || GetStageDone(CONST_Stage_Startup_BothEnemies))
		StarbornAdversary_Astral_Dancers.EnableAll()
	EndIf
EndFunction

;Nishina: Teleport all of the adversaries out of the control room.
Function StarbornAdversaryTeleportInNishina()
	Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
	if (adversaryRefs != None)
		LockGuard(AdversaryShiftingGuard)
			ObjectReference nextTeleportPoint = StarbornAdversary_Nishina_TeleportMarkerChainHead.GetRef()
			int i = 0
			While (i < adversaryRefs.Length)
				SetNewHoldPositionTarget(adversaryRefs[i], StarbornData[CONST_Adversary_DataIndex].StarbornMovementHoldPositionKeyword, nextTeleportPoint, True)
				nextTeleportPoint = nextTeleportPoint.GetLinkedRef()
				i = i + 1
			EndWhile
		EndLockGuard
	EndIf
EndFunction

;Museum: Spawn a Ruins Demon for the Adversary.
Actor Function StarbornAdversarySpawnDemon(Actor caster, ObjectReference spawnPoint=None)
	Actor demon = CreateRuinsDemon(CONST_Adversary_DataIndex, StarbornAdversary_Demons)
	if (spawnPoint == None)
		CombatTeleportNearRefNoWait(demon, caster, CONST_ParallelSelfOffsetMin, CONST_ParallelSelfOffsetMax, teleportInExplosion=LC165_StarbornInnerDemonSpawnExplosion)
	Else
		CombatTeleportNearRefNoWait(demon, spawnPoint, 0, 0, teleportInExplosion=LC165_StarbornInnerDemonSpawnExplosion)
	EndIf
EndFunction

;Museum: Kill all of the Adversary's Ruins Demons.
Function StarbornAdversaryKillDemons()
	CleanupScriptedActors(StarbornAdversary_Demons.GetArray() as Actor[], -1, True)
EndFunction


;Update the StarbornAdversary_Hunter & Emissary aliases to the first available duplicates, so those actors can be used in scenes.
Function StarbornAdversaryUpdateAdversaryActors()
	Actor[] adversaryRefs = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
	if ((adversaryRefs != None) && (adversaryRefs.Length >= 1))
		if (GetStageDone(CONST_Stage_Startup_HunterEnemy))
			StarbornAdversary_Hunter.ForceRefTo(adversaryRefs[0])
		ElseIf (GetStageDone(CONST_Stage_Startup_EmissaryEnemy))
			StarbornAdversary_Emissary.ForceRefTo(adversaryRefs[0])
		Else
			if (adversaryRefs[0].HasKeyword(MQHunterKeyword))
				StarbornAdversary_Hunter.ForceRefTo(adversaryRefs[0])
				if (adversaryRefs.Length >= 2)
					StarbornAdversary_Emissary.ForceRefTo(adversaryRefs[1])
				Else
					StarbornAdversary_Emissary.Clear()
				EndIf
			Else
				StarbornAdversary_Hunter.Clear()
				StarbornAdversary_Emissary.ForceRefTo(adversaryRefs[0])
			EndIf
		EndIf
	EndIf
EndFunction

;Play the Adversary's death scene.
Function StarbornAdversaryPlayDeathSceneAndWait(Actor deathSceneActor)
	;Stop the Museum scene, if it was playing.
	MQ302_Battle_06_Adversary_Museum_Arrival.Stop()
	;Force the adversary out of Void Form.
	deathSceneActor.DispelSpell(AIPower_VoidForm)
	deathSceneActor.DispelSpell(LC165_Scripted_VoidFormAb)
	;Start the death scene.
	if (deathSceneActor.HasKeyword(MQHunterKeyword))
		StarbornAdversary_Hunter.ForceRefTo(deathSceneActor)
		MQ302_Battle_06_Adversary_HunterDeath.Start()
	Else
		StarbornAdversary_Emissary.ForceRefTo(deathSceneActor)
		MQ302_Battle_06_Adversary_EmissaryDeath.Start()
	EndIf
	;Meanwhile, move the real adversary actors into position.
	StarbornAdversaryMoveAndKillAdversary()
	;Block this thread and wait for the death scene to finish before continuing.
	int failsafe = 0
	While (!GetStageDone(CONST_Adversary_DeathSceneCompletedStage) && (failsafe < CONST_Adversary_DeathSceneFailsafeTimeout))
		Utility.Wait(0.1)
		failsafe = failsafe + 1
	EndWhile
	;Kill the Adversary in the Museum. Wait a moment for them to die.
	deathSceneActor.BlockActivation(True, True)
	deathSceneActor.KillEssential()
	Utility.Wait(2)
	;Controller Shake for effect.
	WwiseEvent_ShakeController_p75_p75_03.Play(player)
EndFunction

;Move the real Adversary into their death position and kill them.
Function StarbornAdversaryMoveAndKillAdversary()
	adversary01Ref.MoveTo(StarbornAdversary_DeathMarker01.GetRef())
	adversary01Ref.Enable()
	adversary01Ref.KillEssential(player)
	if (adversary02Ref != None)
		adversary02Ref.MoveTo(StarbornAdversary_DeathMarker02.GetRef())
		adversary02Ref.Enable()
		adversary02Ref.KillEssential(player)
	EndIf
	;Slow the rings.
	artifactRingsRef.SetAnimationVariableFloat("fRingSpeed", CONST_ArtifactRingSpeed_AfterBattle)
EndFunction


;POST-BATTLE------------------------------------------------------------------------------------

Function StarbornAdversaryEnd(bool adversarySurrendered)
	;Stop the boss battle music.
	MUSGenesisCombatBoss_MQ302B_B_BattleFinal.Remove()

	if (!adversarySurrendered)
		;If the Adversary didn't surrender, and they haven't already been moved into their death position
		;and killed by StarbornAdversaryPlayDeathSceneAndWait, do that now.
		StarbornAdversaryMoveAndKillAdversary()
	EndIf
EndFunction


Function StarbornAdversarySurrenderTeleport(Scene starbornAdversarySurrenderScene)
	Var[] akArgs = new Var[1]
	akArgs[0] = starbornAdversarySurrenderScene
	CallFunctionNoWait("StarbornAdversarySurrenderTeleportRef", akArgs)
EndFunction

Function StarbornAdversarySurrenderTeleportRef(Scene starbornAdversarySurrenderScene)
	Debug.Trace("Trying to teleport out.")
	if (adversary01DuplicateRef != None)
		adversary01DuplicateRef.SetGhost(True)
		TeleportOutNoWait(adversary01DuplicateRef)
	EndIf
	if (adversary02DuplicateRef != None)
		adversary02DuplicateRef.SetGhost(True)
		TeleportOutNoWait(adversary02DuplicateRef)
	EndIf
	int failsafe = 0
	While ((starbornAdversarySurrenderScene.IsPlaying()) && (failsafe < CONST_StarbornAdversarySurrenderSceneFailsafe))
		Utility.Wait(0.1)
		failsafe = failsafe + 1
	EndWhile
	Debug.Trace("Scene ended; disabling.")
	if (adversary01DuplicateRef != None)
		adversary01DuplicateRef.DisableNoWait()
	EndIf
	if (adversary02DuplicateRef != None)
		adversary02DuplicateRef.DisableNoWait()
	EndIf
EndFunction

Function StarbornAdversaryRescueCheck()
	if (adversary01Ref.GetDistance(artifactActivatorRef) > CONST_StarbornAdversaryRescueDistance)
		Debug.Trace("WARN: Performing emergency rescue of " + adversary01Ref + ", " + adversary01Ref.GetDistance(artifactActivatorRef), 1)
		adversary01Ref.RemoveItem(Spacesuit_Starborn_Companion_PlayerOrFollower, 100)
		adversary01Ref.RemoveAllItems(Game.GetPlayer())
	EndIf
	if ((adversary02Ref != None) && (adversary02Ref.GetDistance(artifactActivatorRef) > CONST_StarbornAdversaryRescueDistance))
		Debug.Trace("WARN: Performing emergency rescue of " + adversary02Ref + ", " + adversary02Ref.GetDistance(artifactActivatorRef), 1)
		adversary02Ref.RemoveItem(Spacesuit_Starborn_Companion_PlayerOrFollower, 100)
		adversary02Ref.RemoveAllItems(Game.GetPlayer())
	EndIf
EndFunction



;-------------------------------------
;Final Artifact Activator
;-------------------------

Function SetArtifactStageNoWait(int stage)
	Var[] akArgs = new Var[1]
	akArgs[0] = stage
	CallFunctionNoWait("SetArtifactStage", akArgs)
EndFunction

Function SetArtifactStage(int stage)
	if (stage == 0)
		artifactRingsRef.PlayAnimation("Reset")
	ElseIf (stage == 1)
		;Do nothing.
	ElseIf (stage == 2)
		artifactRingsRef.PlayAnimation("Play01")
	ElseIf (stage == 3)
		artifactRingsRef.PlayAnimation("Play03")
	ElseIf (stage == 4)
		artifactRingsRef.PlayAnimation("Play04")
	ElseIf (stage == 5)
		;CallFunctionNoWait("ExposeArtifact", None)
		Debug.Trace("Disabling Artifact Collision.")
		ArtifactCollision.DisableAll()
		ArtifactRingsAudioMarker.TryToDisable()
		artifactRingsRef.PlayAnimationAndWait("Close", "AnimationComplete")
		Debug.Trace("Complete")
		artifactPlatformRef.PlayAnimation("Play01")
		artifactActivatorRef.BlockActivation(False, False)
	EndIf
EndFunction

Function TakeFinalArtifact()
	waitingForLoadOutOfTemple = True
	RegisterForMenuOpenCloseEvent("LoadingMenu")
	Game.FadeOutGame(True, True, 0.0, 0.5, True)
	Utility.Wait(0.5)
	WwiseEvent_AMBArtifactVisionX.Play(player)
	Game.PlayBinkNoWait("PowerVision_PhasedTime.bk2", abMuteAudio=False, aPlayDuringLoadingScreen=true)
	selfAsShiftingScript.ShiftTo("TeleportOut")
EndFunction

Function AwardFinalArtifactPower()
	Utility.Wait(CONST_AwardFinalArtifactPowerDelay)
	ArtifactPower_GrantSpell_Phased_Time.Cast(player, player)
	(SBPowerCollectionActivator.GetRef() as SBPowerCollectionActivatorScript).PlayerReceivePower()
	SetStage(CONST_Stage_Complete)
EndFunction



;-------------------------------------
;Cleanup & Shutdown
;-------------------

Function Cleanup()
	player = None
	selfAsSpaceQuestScript = None
	selfAsShiftingScript = None
	scriptedGravWellHazard = None
	scriptedExplosionHazard = None
	bridgeBoundsTriggerRef = None
	bridgeHoldPositionTriggerRef = None
	bridgeCharger = None
	bridgeLastHit = None
	CourtyardReanimateTargetsAll = None
	CourtyardReanimateTargetsRandomized = None
	courtyardLastSwapMarker1 = None
	courtyardLastSwapMarker2 = None
	exteriorIDCardReaderRef = None
	starbornFireActorRef = None
	starbornIceActorRef = None
	LockGuard(EngineeringGravWellGuard)
		starbornEngineering_GravWellTargetPoint = None
	EndLockGuard
	if (LC165EnableLayer != None)
		LC165EnableLayer.Delete()
	EndIf
	starbornRuinsTriggerRef = None
	templeExteriorDoorRef = None
	templeExteriorDoorBarsRef = None
	templeInteriorDoorRef = None
	adversary01Ref = None
	adversary02Ref = None
	adversary01DuplicateRef = None
	adversary02DuplicateRef = None
	starbornAdversaryPrimary = None
	starbornAdversaryCurrentPrimary = None
	starbornAdversaryHunter = None
	starbornAdversaryEmissary = None
	currentAdversaryHoldPositionTargetCollection = None
	artifactZeroGExplosion = None
	artifactActivatorRef = None
	artifactRingsRef = None
	artifactPlatformRef = None
	LockGuard(AdversaryGravWellGuard)
		starbornAdversary_GravWellTargetPoint
	EndLockGuard
EndFunction



;-------------------------------------
;Utility Functions
;------------------

;Enable or disable the Movement, Fighting, and Sneaking controls, for the Elevator and Temple Entry scenes.
Function SetPlayerControlsEnabled(bool enableControls)
	if (LC165EnableLayer == None)
		LC165EnableLayer = InputEnableLayer.Create()
	EndIf
	LC165EnableLayer.EnableMovement(enableControls)
	LC165EnableLayer.EnableFighting(enableControls)
	LC165EnableLayer.EnableSneaking(enableControls)
	LC165EnableLayer.EnableFarTravel(enableControls)
	LC165EnableLayer.EnableFastTravel(enableControls)
	LC165EnableLayer.EnableGravJump(enableControls)
EndFunction



;---------------------------
;DEBUG Functions
;----------------

;Start the Adversary fight, then jump to a specific shift index.
Function DEBUG_TestAdversary(int index, bool shouldAllowFurtherShifting=False)
	DEBUG_AdversaryDebugMode = !shouldAllowFurtherShifting
	if (!GetStageDone(20) && !GetStageDone(21))
		SetStage(22)
	EndIf
	SetStage(9)
	StarbornAdversaryTeleportInForConfrontation()
	SetStage(1120)
	StarbornAdversaryForceState(index)
EndFunction

;Kill all of the Adversaries.
Function DEBUG_KillAdversaries()
	adversary01Ref.DamageValue(Health, 1000000)
	Actor[] duplicates = StarbornData[CONST_Adversary_DataIndex].StarbornDuplicatesCollection.GetArray() as Actor[]
	int i = 0
	While (i < duplicates.Length)
		duplicates[i].DamageValue(Health, 1000000)
		i = i + 1
	EndWhile
EndFunction

;Stop the Ruins Starborn demon spawning.
Function DEBUG_StarbornRuinsBlockSpawning()
	DEBUG_StarbornRuinsBlockDemonSpawning = True
EndFunction

;Move a ref to the player.
Function DEBUG_MoveToPlayer(ObjectReference ref)
	ref.MoveTo(player)
EndFunction

Function DebugCamera(Actor ID)
	Game.SetCameraTarget(ID)
EndFunction