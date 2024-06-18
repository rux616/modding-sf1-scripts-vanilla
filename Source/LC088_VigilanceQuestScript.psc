Scriptname LC088_VigilanceQuestScript extends Quest
{Quest script for LC088_Vigilance, the Vigilance portion of the Crimson Fleet Final Battle.}

Struct PrisonerOutfitDatum
	ActorBase PrisonerActorBase
	Outfit PrisonerPostReleaseOutfit
EndStruct

Group QuestProperties
	PrisonerOutfitDatum[] property PrisonerOutfitData Auto Const Mandatory
EndGroup

Group AutofillProperties
	LC082_BrigQuestScript property LC082 Auto Const Mandatory
	SQ_ParentScript property SQ_Parent Auto Const Mandatory
	Quest property LC088_Space Auto Const Mandatory
	Quest property CF_Post Auto Const Mandatory

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
	ReferenceAlias property Kibwe Auto Const Mandatory
	ReferenceAlias property Ops_KibweStartMarker Auto Const Mandatory
	ReferenceAlias property Toft Auto Const Mandatory
	ReferenceAlias property Ops_ToftStartMarker Auto Const Mandatory

	ReferenceAlias property Brig_Terminal Auto Const Mandatory
	RefCollectionAlias property Brig_GenericPrisoners Auto Const Mandatory
	RefCollectionAlias property Brig_ReleasedPrisoners Auto Const Mandatory
	RefCollectionAlias property Brig_Enemies Auto Const Mandatory
	RefCollectionAlias property Brig_PrisonerFindWeaponTriggers Auto Const Mandatory
	ReferenceAlias property Brig_LarryDumbrosky Auto Const Mandatory
	ReferenceAlias property Brig_AyumiKomiko Auto Const Mandatory
	ReferenceAlias property Brig_AustinRake Auto Const Mandatory	
	ReferenceAlias property Cargo_Terminal Auto Const Mandatory
	RefCollectionAlias property Rokov_RoomEnemies Auto Const Mandatory
	ReferenceAlias property Robotics_EventManager Auto Const Mandatory
	RefCollectionAlias property Robotics_RoboticsRoomDoors Auto Const Mandatory
	ReferenceAlias property Naeva_EngineRoom3Terminal Auto Const Mandatory
	RefCollectionAlias property Naeva_EngineRoom3Enemies Auto Const Mandatory
	RefCollectionAlias property Naeva_Allies Auto Const Mandatory
	ReferenceAlias property Weapons_Terminal Auto Const Mandatory
	ReferenceAlias property Weapons_WeaponsBayDoor Auto Const Mandatory
	RefCollectionAlias property Weapons_AmbushDoors Auto Const Mandatory
	RefCollectionAlias property Weapons_EnemiesAll Auto Const Mandatory
	RefCollectionAlias property Weapons_EnemiesInWeaponBays Auto Const Mandatory
	RefCollectionAlias property Weapons_EnemiesRobotsAndTurrets Auto Const Mandatory
	RefCollectionAlias property Mess_AmbushDoors Auto Const Mandatory
	RefCollectionAlias property Mess_AmbushEnemies Auto Const Mandatory
	ReferenceAlias property Estelle_EndMarker Auto Const Mandatory
	ReferenceAlias property Estelle_Level1_StartMarker Auto Const Mandatory
	ReferenceAlias property Estelle_Level2_StartMarker Auto Const Mandatory
	ReferenceAlias property Estelle_Level1_EnableMarker Auto Const Mandatory
	ReferenceAlias property Estelle_Level2_EnableMarker Auto Const Mandatory
	ReferenceAlias property Estelle_Level3_EnableMarker Auto Const Mandatory
	RefCollectionAlias property Estelle_Level1_QuartersEnemies Auto Const Mandatory
	RefCollectionAlias property Estelle_Level2_QuartersEnemies Auto Const Mandatory
	RefCollectionAlias property Estelle_Level2_QuartersAllies Auto Const Mandatory
	RefCollectionAlias property Estelle_Level3_QuartersAllies Auto Const Mandatory
	ReferenceAlias property Flee_DockingPort05 Auto Const Mandatory
	ReferenceAlias property Flee_HoldingCellMarker Auto Const Mandatory
	RefCollectionAlias property Flee_EnemiesFleeing Auto Const Mandatory
	RefCollectionAlias property Flee_EnemiesFleeingToGenericDockingPort Auto Const Mandatory
	RefCollectionAlias property Flee_NonBossBattleEnemies Auto Const Mandatory
	RefCollectionAlias property Flee_FleeAreaDoors Auto Const Mandatory
	RefCollectionAlias property Ops_RobotsAndTurrets Auto Const Mandatory
	RefCollectionAlias property Ops_Robots Auto Const Mandatory
	RefCollectionAlias property Ops_Robots_Initial Auto Const Mandatory
	RefCollectionAlias property Ops_Turrets Auto Const Mandatory
	RefCollectionAlias property Ops_BossHoldPositionTargets Auto Const Mandatory
	RefCollectionAlias property Ops_Elevators_FloorMarkers Auto Const Mandatory
	RefCollectionAlias property Ops_Doors_ElevatorAccessDoors Auto Const Mandatory
	RefCollectionAlias property Ops_Doors_OperationsCenterDoors Auto Const Mandatory
	ReferenceAlias property CF08BattleAlarm Auto Const Mandatory

	Scene property LC088_810_Estelle_Start Auto Const Mandatory
	Scene property LC088_810_Estelle_Start_2 Auto Const Mandatory

	GlobalVariable property CrimsonFleetCaptainState_Rokov Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Mathis Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Naeva Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Adler Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Huan Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Estelle Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainStateDifficulty_Estelle Auto Const Mandatory

	Cell property LC082Vigilance01 Auto Const Mandatory
	Cell property ssLC082Vigilance02 Auto Const Mandatory
	Location property LC082VigilanceLocation Auto Const Mandatory
	MusicType property MUSGenesisCombatBoss_CF08VigilanceAndKey Auto Const Mandatory
	MusicType property MUSGenesisCombatBoss_Vigilance Auto Const Mandatory
	ActorValue property Health Auto Const Mandatory
	ActorValue property Aggression Auto Const Mandatory
	Faction property PlayerFriendFaction Auto Const Mandatory
	Faction property CrimeFactionCrimsonFleet Auto Const Mandatory
	Faction property UCSysDefFaction Auto Const Mandatory
	Faction property CrimeFactionAdlerKemp Auto Const Mandatory
	Keyword property LinkCustom01 Auto Const Mandatory
	Keyword property LinkCustom02 Auto Const Mandatory
	Keyword property ActorTypeRobot Auto Const Mandatory
	Keyword property DMP_LinkRobotPod Auto Const Mandatory
	Keyword property LC088_LinkCaptainStartMarker Auto Const Mandatory
	Keyword property LC088_LinkRoboticsRobot Auto Const Mandatory
	Keyword property LC088_Ops_BossHoldPositionLink Auto Const Mandatory
	Keyword property LC088_Ops_BossHoldPositionInitialMarkerKeyword Auto Const Mandatory
	Keyword property LC088_Vigilance_Brig_CurrentPrisonerKeyword Auto Const Mandatory
	ActorValue property LC088_Vigilance_Brig_PrisonerFoundWeaponValue Auto Const Mandatory
	ActorValue property LC088_Vigilance_CaptainEventCompletedValue Auto Const Mandatory
	ActorValue property LC088_Ops_BossHoldPositionValue Auto Const Mandatory
	ActorValue property LC088_Ops_MovementUpdateHealthPercentStampValue Auto Const Mandatory
	ActorValue property LC088_Ops_MovementUpdateTimestampValue Auto Const Mandatory
	Armor property Clothes_UC_Prisoner Auto Const Mandatory
	LeveledItem property LLI_Role_UC Auto Const Mandatory
EndGroup

;Local Variables
Actor player
Actor kibweRef
Actor toftRef
ObjectReference brigTerminal
ObjectReference[] brigFindWeaponsTriggers
ObjectReference cargoBayTerminal
ObjectReference engineRoomTerminal
ObjectReference weaponsTerminal
ObjectReference dockingPort05Ref
ObjectReference holdingCellMarkerRef
InputEnableLayer vigilanceInputLayer


;Event Variables
bool updatingTerminal
RobotPodScript[] Robotics_RoboticsEnemies RequiresGuard(RoboticsEnemiesGuard)
bool Weapons_WeaponsAndTurretsLockedDown
int estelleLevel
bool enabledEstelle
bool Flee_HasFinishedFleeEventSetup
bool Flee_HasFinishedFirstFleeTimer


;Local Consts
;Standard values for the CF Captain State globals.
int CONST_CaptainState_Active = 0 Const
int CONST_CaptainState_Inactive = 1 Const
int CONST_CaptainState_Dead = 2 Const
int CONST_CaptainState_Imprisoned = 3 Const
int CONST_CaptainState_Freed = 4 Const

;Standard system consts.
int CONST_LockLevel_RequiresTerminal = 253 Const
int CONST_Aggression_Aggressive = 1 Const

;Door state consts.
int CONST_DoorState_Open = 0 Const
int CONST_DoorState_Sealed = 1 Const
int CONST_DoorState_ActivationBlocked = 2 Const

;Flag stages that indicate whether a given captain's event is active.
int CONST_CaptainActiveStage_Rokov = 13 Const
int CONST_CaptainActiveStage_Mathis = 14 Const
int CONST_CaptainActiveStage_Naeva = 15 Const
int CONST_CaptainActiveStage_Adler = 16 Const
int CONST_CaptainActiveStage_Huan = 17 Const
int CONST_CaptainActiveStage_Estelle = 18 Const

;Event Consts
int CONST_Brig_GenericPrisonersToSpawn = 2 Const
int CONST_Brig_ReleasedPrisonerStageToSet = 210 Const
int CONST_Robotics_MaxSimultaneousActiveRobots = 3 Const
int CONST_Robotics_RoboticsBattleDeactivatedStage = 470 Const
int CONST_Robotics_RoboticsBattleCompletedStage = 480 Const
int CONST_WeaponsBattleCompletedStage = 680 Const
int CONST_Estelle_StartStage = 810 Const
int CONST_Quarters_ClearedStage = 880 Const
int CONST_Flee_FleeRemovalDistance = 20 Const
int CONST_Flee_DockingPortRemovalRadiusDistance = 4 Const
int CONST_Ops_TurretActivationDelay = 5 Const
int CONST_Ops_RobotActivationDelay = 7 Const
float CONST_Ops_MovementUpdateHealthLossPercent = 0.3 Const
int CONST_Ops_MovementUpdateTime = 15 Const
int CONST_Surrender_Stage = 1019 Const
int CONST_Complete_Stage = 1100 Const
int CONST_Complete_StartNaevaScene_Stage = 1094 Const
int CONST_Complete_Space_VigilanceCompleted_Stage = 193 Const
int CONST_Complete_Postquest_StartPostquest_Stage = 100 Const

;Timer Consts
int CONST_UpdateRoboticsBattleTimerDelay = 2 Const
int CONST_UpdateRoboticsBattleTimerID = 1 Const
float CONST_FleeTimerDelay = 0.25 Const
int CONST_FleeTimerID = 2 Const
int CONST_Ops_TurretActivationTimerDelay = 5 Const
int CONST_Ops_TurretActivationTimerID = 3 Const
int CONST_Ops_RobotActivationTimerDelay = 9 Const
int CONST_Ops_RobotActivationTimerID = 4 Const
int CONST_Ops_BattleMonitorTimerID = 5 Const
int CONST_Ops_BattleMonitorTimerDelay = 1 Const

;Guards
Guard BrigPrisonerFindWeaponGuard ProtectsFunctionLogic
Guard RoboticsEnemiesGuard
Guard OpsActorCollectionsGuard ProtectsFunctionLogic


;------------------------------------
;Initialization
;---------------

Event OnQuestInit()
	;Store off local variables.
	player = Game.GetPlayer()
	kibweRef = Kibwe.GetActorRef()
	toftRef = Toft.GetActorRef()
	brigTerminal = Brig_Terminal.GetRef()
	brigFindWeaponsTriggers = Brig_PrisonerFindWeaponTriggers.GetArray()
	cargoBayTerminal = Cargo_Terminal.GetRef()
	engineRoomTerminal = Naeva_EngineRoom3Terminal.GetRef()
	weaponsTerminal = Weapons_Terminal.GetRef()
	dockingPort05Ref = Flee_DockingPort05.GetRef()
	holdingCellMarkerRef = Flee_HoldingCellMarker.GetRef()
	vigilanceInputLayer = InputEnableLayer.Create()

	;Reset actors.
	kibweRef.Reset()
	toftRef.Reset()
	Flee_NonBossBattleEnemies.ResetAll()
	Ops_RobotsAndTurrets.ResetAll()
	LC082.ResetAllPrisoners()

	;Clear ownership on the Vigilance, so taking items is no longer theft.
	LC082Vigilance01.SetFactionOwner(None)
	ssLC082Vigilance02.SetFactionOwner(None)

	;Register for events.
	int i = 0
	While (i < brigFindWeaponsTriggers.Length)
		RegisterForRemoteEvent(brigFindWeaponsTriggers[i], "OnTriggerEnter")
		i = i + 1
	EndWhile
	RegisterForRemoteEvent(player, "OnLocationChange")
	RegisterForCustomEvent(SQ_Parent, "SQ_NativeTerminalActor_Unconscious")
	RegisterForCustomEvent(SQ_Parent, "SQ_NativeTerminalActor_Ally")
EndEvent


;------------------------------------
;Captain Events
;---------------

;Set up the Captain events.
;- If the Captain is Active, set their flag stage, disable them (wherever they happen to be), and enable their event enable marker.
;- If the Captain is not Active, enable their event disable marker.
;- Additionally, set Estelle's support level for the battle.
Function SetupAllCaptainEvents()
	SetupCaptainEvent(CrimsonFleetCaptainState_Rokov, CONST_CaptainActiveStage_Rokov, Rokov.GetActorRef(), Rokov_EnableMarker.GetRef(), Rokov_DisableMarker.GetRef())
	SetupCaptainEvent(CrimsonFleetCaptainState_Mathis, CONST_CaptainActiveStage_Mathis, Mathis.GetActorRef(), Mathis_EnableMarker.GetRef(), Mathis_DisableMarker.GetRef())
	SetupCaptainEvent(CrimsonFleetCaptainState_Naeva, CONST_CaptainActiveStage_Naeva, Naeva.GetActorRef(), Naeva_EnableMarker.GetRef(), Naeva_DisableMarker.GetRef())
	SetupCaptainEvent(CrimsonFleetCaptainState_Adler, CONST_CaptainActiveStage_Adler, Adler.GetActorRef(), Adler_EnableMarker.GetRef(), Adler_DisableMarker.GetRef())
	SetupCaptainEvent(CrimsonFleetCaptainState_Huan, CONST_CaptainActiveStage_Huan, Huan.GetActorRef(), Huan_EnableMarker.GetRef(), Huan_DisableMarker.GetRef())
	SetupCaptainEvent(CrimsonFleetCaptainState_Estelle, CONST_CaptainActiveStage_Estelle, Estelle.GetActorRef(), Estelle_EnableMarker.GetRef(), Estelle_DisableMarker.GetRef())
	if (CrimsonFleetCaptainState_Estelle.GetValue() == CONST_CaptainState_Active)
		estelleLevel = CrimsonFleetCaptainStateDifficulty_Estelle.GetValueInt()
	EndIf

	;As a special case, remove Adler from his unique crime faction.
	int adlerState = CrimsonFleetCaptainState_Adler.GetValueInt()
	if ((adlerState == CONST_CaptainState_Active) || (adlerState == CONST_CaptainState_Imprisoned))
		Adler.GetActorRef().RemoveFromFaction(CrimeFactionAdlerKemp)
	EndIf
EndFunction

Function SetupCaptainEvent(GlobalVariable captainStateGlobal, int captainActiveStage, Actor captain, ObjectReference enableMarker, ObjectReference disableMarker)
	int captainState = captainStateGlobal.GetValueInt()
	if (captainState == CONST_CaptainState_Active)
		captain.Disable()
		captain.Reset()
		captain.IgnoreFriendlyHits(True)
		captain.AddToFaction(CrimeFactionCrimsonFleet)
		enableMarker.Enable()
		disableMarker.Disable()
		SetStage(captainActiveStage)
	Else
		enableMarker.Disable()
		disableMarker.Enable()
		if (captainState == CONST_CaptainState_Imprisoned)
			captain.IgnoreFriendlyHits(True)
			captain.AddToFaction(CrimeFactionCrimsonFleet)
			if (!captain.HasKeyword(LC088_Vigilance_Brig_CurrentPrisonerKeyword))
				LC082.AddPrisoner(captain)
			EndIf
		EndIf
	EndIf
EndFunction


;Set a Captain's event as complete.
;The actor value switches them into an Ignore Combat package. They're often detecting enemies in some other part of the ship,
;but all of the enemies are on tight Hold Position packages, so they can safely ignore them.
Function SetCaptainComplete(Actor captainActor)
	if (captainActor.IsEnabled())
		captainActor.SetValue(LC088_Vigilance_CaptainEventCompletedValue, 1)
		captainActor.EvaluatePackage()
		captainActor.StopCombat()
	EndIf
EndFunction

Function SetCaptainAlliesComplete(RefCollectionAlias captainAllyCollection)
	int i = 0
	Actor[] captainAllies = captainAllyCollection.GetArray() As Actor[]
	While (i < captainAllies.Length)
		SetCaptainComplete(captainAllies[i])
		i = i + 1
	EndWhile
EndFunction


;Shut down the Captain events.
;- Any Captain that was still Imprisoned is now Freed.
;- All Captains are moved back to their package locations, presumably off the Vigilance.
Function ShutdownAllCaptainEvents(bool excludeNaevaIfSurrenderActive=False)
	ShutdownCaptainEvent(CrimsonFleetCaptainState_Rokov, Rokov)
	ShutdownCaptainEvent(CrimsonFleetCaptainState_Mathis, Mathis)
	ShutdownCaptainEvent(CrimsonFleetCaptainState_Naeva, Naeva, True)
	ShutdownCaptainEvent(CrimsonFleetCaptainState_Adler, Adler)
	ShutdownCaptainEvent(CrimsonFleetCaptainState_Huan, Huan)
	ShutdownCaptainEvent(CrimsonFleetCaptainState_Estelle, Estelle)
EndFunction

Function ShutdownCaptainEvent(GlobalVariable captainStateGlobal, ReferenceAlias captainAlias, bool shouldSkipClearingAlias=False)
	int captainState = captainStateGlobal.GetValueInt()
	if (captainState != CONST_CaptainState_Dead)
		if (captainState == CONST_CaptainState_Imprisoned)
			captainStateGlobal.SetValue(CONST_CaptainState_Freed)
			;CleanupAllPrisonersAndWait handles everything else.
		Else
			Actor captain = captainAlias.GetActorRef()
			captain.IgnoreFriendlyHits(False)
			captain.EvaluatePackage()
			captain.MoveToPackageLocation()
			captain.EnableNoWait()
		EndIf
		if (!shouldSkipClearingAlias)
			captainAlias.Clear()
		EndIf
	EndIf
EndFunction


;Enable a Captain at their start marker.
Function EnableCaptain(ReferenceAlias captainAlias, ReferenceAlias captainStartMarker)
	Actor captainRef = captainAlias.GetActorRef()
	ObjectReference captainStartMarkerRef = captainStartMarker.GetRef()
	if (captainRef != None)
		captainRef.Enable()
		captainRef.MoveTo(captainStartMarkerRef)
		captainRef.EvaluatePackage()
	EndIf
EndFunction

;Enable a Captain Ally at their editor location.
Function EnableCaptainAlly(ReferenceAlias allyAlias)
	EnableCaptainAllyRef(allyAlias.GetActorRef())
EndFunction

Function EnableCaptainAllyRef(Actor allyRef)
	if (allyRef != None)
		allyRef.Reset()
		allyRef.IgnoreFriendlyHits(True)
		allyRef.Enable()
		allyRef.MoveToMyEditorLocation()
		allyRef.EvaluatePackage()
	EndIf
EndFunction


;------------------------------------
;Native Terminal Functions
;--------------------------

;When a native terminal neutralizes a robot or turret, count it as 'dead' for the purposes of clearing the associated room or event.
Event SQ_ParentScript.SQ_NativeTerminalActor_Unconscious(SQ_ParentScript akSource, Var[] akArgs)
	ObjectReference nativeTerminal = akArgs[0] as ObjectReference
	Actor nativeTerminalActor = akArgs[1] as Actor
	bool isUnconscuous = akArgs[2] as bool
	if ((nativeTerminal != None) && (nativeTerminalActor != None) && isUnconscuous && (nativeTerminal.GetParentCell() == LC082Vigilance01))
		RemoveNativeTerminalEnemy(nativeTerminalActor)
	EndIf
EndEvent

;When a native terminal neutralizes a robot or turret, count it as 'dead' for the purposes of clearing the associated room or event.
;Additionally, converted actors need to have their factions swapped so they stop attacking allied pirates.
Event SQ_ParentScript.SQ_NativeTerminalActor_Ally(SQ_ParentScript akSource, Var[] akArgs)
	ObjectReference nativeTerminal = akArgs[0] as ObjectReference
	Actor nativeTerminalActor = akArgs[1] as Actor
	if ((nativeTerminal != None) && (nativeTerminalActor != None) && (nativeTerminal.GetParentCell() == LC082Vigilance01))
		RemoveNativeTerminalEnemy(nativeTerminalActor)
		nativeTerminalActor.RemoveFromFaction(UCSysDefFaction)
		nativeTerminalActor.AddToFaction(CrimeFactionCrimsonFleet)
	EndIf
EndEvent

Function RemoveNativeTerminalEnemy(Actor enemy)
	RefCollectionAlias enemyCol
	if (Brig_Enemies.Find(enemy) >= 0)
		enemyCol = Brig_Enemies
	ElseIf (Rokov_RoomEnemies.Find(enemy) >= 0)
		enemyCol = Rokov_RoomEnemies
	ElseIf (Naeva_EngineRoom3Enemies.Find(enemy) >= 0)
		enemyCol = Naeva_EngineRoom3Enemies
	ElseIf (Weapons_EnemiesAll.Find(enemy) >= 0)
		enemyCol = Weapons_EnemiesAll
	EndIf
	if (enemyCol != None)
		Debug.Trace("RemoveNativeTerminalEnemy: " + enemy + " has been neutralized; removing from " + enemyCol)
		(enemyCol as LC088_VigilanceEnemyRefColScript).RemoveEnemyRef(enemy)
	Else
		Debug.Trace("WARN: RemoveNativeTerminalEnemy: " + enemy + ": Could not be found in any RefCollection.", 1)
	EndIf
EndFunction


;------------------------------------
;Event: Brig
;--------------------------

Function SetupBrigPrisoners()
	;Disable Larry and Ayumi, if they're in the Brig. We don't want them participating in the battle.
	LC082.DisablePrisoner(Brig_LarryDumbrosky.GetActorRef())
	LC082.DisablePrisoner(Brig_AyumiKomiko.GetActorRef())
	LC082.DisablePrisoner(Brig_AustinRake.GetActorRef())
	;Set up additional generic prisoners, if necessary, to make sure there's always someone for the player to rescue.
	int i = 0
	While (i < CONST_Brig_GenericPrisonersToSpawn)
		Brig_GenericPrisoners.AddRef(LC082.AddPrisoner())
		i = i + 1
	EndWhile
EndFunction

;Release all of the prisoners in the Brig.
Function ReleaseAllPrisoners()
	int i = 1
	int brigDataLength = LC082.GetBrigDataLength()
	While (i < brigDataLength)
		ReleasePrisoner(i)
		i = i + 1
	EndWhile
EndFunction

Function ReleaseAllPrisonersAndWait()
	int i = 1
	int brigDataLength = LC082.GetBrigDataLength()
	While (i < brigDataLength)
		ReleasePrisonerAndWait(i)
		i = i + 1
	EndWhile
EndFunction

;Open a specific cell and release its prisoner.
Function ReleasePrisoner(int cellID)
	Var[] akArgs = new Var[1]
	akArgs[0] = cellID
	CallFunctionNoWait("ReleasePrisonerAndWait", akArgs)
EndFunction

Function ReleasePrisonerAndWait(int cellID)
	Actor releasedPrisoner = LC082.ReleasePrisoner(cellID)
	if (releasedPrisoner != None)
		Brig_ReleasedPrisoners.AddRef(releasedPrisoner)
		SetStage(CONST_Brig_ReleasedPrisonerStageToSet)
	EndIf
EndFunction

;Released prisoners move to a locker, where they arm themselves.
Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
	Actor prisoner = akActionRef as Actor
	LockGuard(BrigPrisonerFindWeaponGuard)
		if (prisoner.GetValue(LC088_Vigilance_Brig_PrisonerFoundWeaponValue) == 0)
			prisoner.SetValue(LC088_Vigilance_Brig_PrisonerFoundWeaponValue, 1)
			prisoner.AddItem(LLI_Role_UC)
			prisoner.EvaluatePackage()
		EndIf
    EndLockGuard
EndEvent

Function CleanupAllPrisoners()
	CallFunctionNoWait("CleanupAllPrisonersAndWait", None)
EndFunction

Function CleanupAllPrisonersAndWait()
	ReleaseAllPrisonersAndWait()
	int count = Brig_ReleasedPrisoners.GetCount()
	int i = 0
	While (i < count)
		Actor current = Brig_ReleasedPrisoners.GetAt(i) as Actor
		ActorBase currentBase = current.GetLeveledActorBase()
		int currentOutfitDataIndex = PrisonerOutfitData.FindStruct("PrisonerActorBase", currentBase)
		if (currentOutfitDataIndex >= 0)
			current.Disable()
			current.RemoveItem(Clothes_UC_Prisoner)
			current.SetOutfit(PrisonerOutfitData[currentOutfitDataIndex].PrisonerPostReleaseOutfit)
			current.IgnoreFriendlyHits(False)
			current.EvaluatePackage()
			current.MoveToPackageLocation()
			current.EnableNoWait()
		Else
			current.DisableNoWait()
		EndIf
		i = i + 1
	EndWhile
EndFunction


;------------------------------------
;Event: Robotics
;--------------------------

;Initialize the Robotics_RoboticsEnemies array. If Mathis is active, different robots are present, and the first three start damaged.
Function Robotics_SetupRoboticsEnemiesArray()
	LockGuard RoboticsEnemiesGuard
		Robotics_InitRoboticsEnemiesArray()
	EndLockGuard
EndFunction

Function Robotics_InitRoboticsEnemiesArray() RequiresGuard(RoboticsEnemiesGuard)
	if (Robotics_RoboticsEnemies == None)
		if (GetStageDone(CONST_CaptainActiveStage_Mathis))
			Robotics_RoboticsEnemies = Robotics_EventManager.GetRef().GetLinkedRef(LinkCustom01).GetLinkedRefChain(LC088_LinkRoboticsRobot) as RobotPodScript[]
			Robotics_RoboticsEnemies[0].DamageValue(Health, Robotics_RoboticsEnemies[0].GetValue(Health) * 0.8)
			Robotics_RoboticsEnemies[1].DamageValue(Health, Robotics_RoboticsEnemies[1].GetValue(Health) * 0.6)
			Robotics_RoboticsEnemies[2].DamageValue(Health, Robotics_RoboticsEnemies[2].GetValue(Health) * 0.2)
		Else
			Robotics_RoboticsEnemies = Robotics_EventManager.GetRef().GetLinkedRef(LinkCustom02).GetLinkedRefChain(LC088_LinkRoboticsRobot) as RobotPodScript[]
		EndIf
	EndIf
EndFunction

;Start the Robotics Bay battle.
Function Robotics_StartRoboticsBayBattle()
	LockGuard RoboticsEnemiesGuard
		if (!GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage))
			Robotics_InitRoboticsEnemiesArray()
			StartTimer(0, CONST_UpdateRoboticsBattleTimerID)
		EndIf
	EndLockGuard
EndFunction

;OnTimer, update the robotics battle.
Function Robotics_UpdateRoboticsBattle()
	LockGuard RoboticsEnemiesGuard
		if (!GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage))
			;In the Robotics event, we want to keep CONST_Robotics_MaxSimultaneousActiveRobots robots active simultaneously, and
			;set a stage once all robots have been defeated (by killing or hacking them).
			int activeRobots = 0
			int i = 0
			While ((i < Robotics_RoboticsEnemies.Length) && (activeRobots < CONST_Robotics_MaxSimultaneousActiveRobots))
				if (Robotics_RoboticsEnemies[i].IsDead())
					Robotics_RoboticsEnemies.Remove(i)
				ElseIf (Robotics_RoboticsEnemies[i].IsUnconscious())
					;Debug.Trace("LC088 Robotics Bay Battle: Activating " + Robotics_RoboticsEnemies[i], 0)
					Robotics_RoboticsEnemies[i].WakeRobotFromPod()
					Robotics_RoboticsEnemies[i].SetUnconscious(False)
					activeRobots = activeRobots + 1
					i = i + 1
				Else
					activeRobots = activeRobots + 1
					i = i + 1
				EndIf
			EndWhile
			if (activeRobots == 0)
				;Debug.Trace("LC088 Robotics Bay Battle: Completed.", 0)
				SetStage(CONST_Robotics_RoboticsBattleCompletedStage)
			Else
				;Debug.Trace("LC088 Robotics Bay Battle: Found " + activeRobots + " active robots; restarting timer.", 0)
				StartTimer(CONST_UpdateRoboticsBattleTimerDelay, CONST_UpdateRoboticsBattleTimerID)
			EndIf
		EndIf
	EndLockGuard
EndFunction

;Players can use a terminal to shut down all of the robots.
Function Robotics_DeactivateRobots()
	LockGuard RoboticsEnemiesGuard
		if (!GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage))
			CancelTimer(CONST_UpdateRoboticsBattleTimerID)
			Robotics_InitRoboticsEnemiesArray()
			int i = 0
			While (i < Robotics_RoboticsEnemies.Length)
				if (Robotics_RoboticsEnemies[i].GetLinkedRef(DMP_LinkRobotPod) != None)
					Robotics_RoboticsEnemies[i].SendRobotToPod()
				Else
					Robotics_RoboticsEnemies[i].SetUnconscious(True)
				EndIf
				i = i + 1
			EndWhile
			SetStage(CONST_Robotics_RoboticsBattleDeactivatedStage)
			SetStage(CONST_Robotics_RoboticsBattleCompletedStage)
		EndIf
	EndLockGuard
EndFunction

;Seal the doors to the Robotics Bay.
Function Robotics_SealRoboticsBayDoors()
	int i = 0
	int count = Robotics_RoboticsRoomDoors.GetCount()
	While ((i < count) && (!GetStageDone(CONST_Robotics_RoboticsBattleCompletedStage)))
		Robotics_RoboticsRoomDoors.GetAt(i).SetOpen(False)
		i = i + 1
	EndWhile
EndFunction

;Unceal the doors to the Robotics Bay.
Function Robotics_UnsealRoboticsBayDoors()
	int i = 0
	int count = Robotics_RoboticsRoomDoors.GetCount()
	While (i < count)
		Robotics_RoboticsRoomDoors.GetAt(i).SetOpen(True)
		i = i + 1
	EndWhile
EndFunction


;------------------------------------
;Event: Engineering
;--------------------------
;
Function EVPNaevaAndAllies()
	Naeva.TryToEvaluatePackage()
	Naeva_Allies.EvaluateAll()
EndFunction


;------------------------------------
;Event: Weapons
;--------------------------

;Convert all of the robots and turrets.
Function Weapons_ConvertRobotsAndTurrets()
	Actor[] robotsAndTurrets = Weapons_EnemiesRobotsAndTurrets.GetArray() as Actor[]
	int i = 0
	While (i < robotsAndTurrets.Length)
		robotsAndTurrets[i].RemoveFromAllFactions()
		robotsAndTurrets[i].AddToFaction(PlayerFriendFaction)
		robotsAndTurrets[i].AddToFaction(CrimeFactionCrimsonFleet)
		robotsAndTurrets[i].SetValue(Aggression, CONST_Aggression_Aggressive)
		robotsAndTurrets[i].SetPlayerTeammate(abTeammate=true, abCanDoFavor=false, abGivePlayerXP=false)
		RobotPodScript robotActor = robotsAndTurrets[i] as RobotPodScript
		if (robotActor != None)
			robotActor.WakeRobotFromPod()
		Else
			robotsAndTurrets[i].SetUnconscious(False)
		EndIf
		(Weapons_EnemiesAll as LC088_VigilanceEnemyRefColScript).RemoveEnemyRef(robotsAndTurrets[i])
		i = i + 1
	EndWhile
EndFunction

;Seal the Weapon Bays. The enemies in them are neutralized for the purposes of this event.
Function Weapons_SealWeaponBays()
	;Seal the door.
	ObjectReference wbDoor = Weapons_WeaponsBayDoor.GetRef()
	wbDoor.SetOpen(False)
	wbDoor.Lock()
	wbDoor.SetLockLevel(CONST_LockLevel_RequiresTerminal)
	;And neutralize the enemies.
	Actor[] enemiesInWeaponBays = Weapons_EnemiesInWeaponBays.GetArray() as Actor[]
	int i = 0
	While (i < enemiesInWeaponBays.Length)
		(Weapons_EnemiesAll as LC088_VigilanceEnemyRefColScript).RemoveEnemyRef(enemiesInWeaponBays[i])
		i = i + 1
	EndWhile
EndFunction

;Trigger the Weapons Area ambush.
; - Open the Weapons Bay Doors (if not locked down).
; - Activate the Robots and Turrets.
; - Delay briefly to give the doors time to finish opening.
; - Have all of the remaining enemies start combat with the player.
Function Weapons_StartAmbush()
	ObjectReference[] ambushDoors = Weapons_AmbushDoors.GetArray()
	int i = 0
	While (i < ambushDoors.Length)
		if (!ambushDoors[i].IsLocked())
			ambushDoors[i].SetOpen(True)
		EndIf
		i = i + 1
	EndWhile
	Actor[] robotsAndTurrets = Weapons_EnemiesRobotsAndTurrets.GetArray() as Actor[]
	i = 0
	While (i < robotsAndTurrets.Length)
		Actor current = robotsAndTurrets[i] as Actor
		RobotPodScript currentAsRobot = current as RobotPodScript
		if (currentAsRobot != None)
			currentAsRobot.WakeRobotFromPod()
		Else
			current.SetUnconscious(False)
		EndIf
		i = i + 1
	EndWhile
	Utility.Wait(1)
	Actor[] allEnemies = Weapons_EnemiesAll.GetArray() as Actor[]
	i = 0
	While (i < allEnemies.Length)
		allEnemies[i].StartCombat(player)
		i = i + 1
	EndWhile
EndFunction


;------------------------------------
;Event: Mess Hall
;--------------------------

;Trigger the Mess Hall ambush.
Function Mess_StartAmbush()
	int i = 0
	int count = Mess_AmbushDoors.GetCount()
	While (i < count)
		Mess_AmbushDoors.GetAt(i).SetOpen(True)
		i = i + 1
	EndWhile
	i = 0
	count = Mess_AmbushEnemies.GetCount()
	While (i < count)
		Actor current = Mess_AmbushEnemies.GetAt(i) as Actor
		current.StartCombat(player)
		i = i + 1
	EndWhile
EndFunction


;------------------------------------
;Event: Quarters
;--------------------------

;Set up Estelle's event.
Function SetupEstelle()
	if (estelleLevel == 0)
		Estelle_Level1_EnableMarker.TryToEnable()
		Estelle_Level1_QuartersEnemies.EnableAll()
		Estelle_Level2_QuartersEnemies.DisableAll()
		;Estelle is inactive.
	ElseIf (estelleLevel == 1)
		Estelle.GetActorRef().SetLinkedRef(Estelle_Level1_StartMarker.GetRef(), LC088_LinkCaptainStartMarker)
		Estelle_Level1_EnableMarker.TryToEnable()
		Estelle_Level1_QuartersEnemies.EnableAll()
		Estelle_Level2_QuartersEnemies.DisableAll()
		;Estelle enables during the Start stage.
	ElseIf (estelleLevel == 2)
		Estelle.GetActorRef().SetLinkedRef(Estelle_Level2_StartMarker.GetRef(), LC088_LinkCaptainStartMarker)
		Estelle_Level2_EnableMarker.TryToEnable()
		Estelle_Level1_QuartersEnemies.DisableAll()
		Estelle_Level2_QuartersEnemies.EnableAll()
		;Estelle and her crew enable during the Start stage.
	Else
		Estelle_Level3_EnableMarker.TryToEnable()
		Estelle_Level1_QuartersEnemies.DisableAll()
		Estelle_Level2_QuartersEnemies.DisableAll()
		;Estelle, her crew, and the dead bodies need to enable now.
		EnableEstelle()
	EndIf
EndFunction

;Enable Estelle and her allies, if appropriate.
Function EnableEstelle()
	if (!enabledEstelle && (estelleLevel > 0) && GetStageDone(CONST_CaptainActiveStage_Estelle))
		enabledEstelle = True
		;Enable Estelle
		if (estelleLevel == 1)
			EnableCaptain(Estelle, Estelle_Level1_StartMarker)
			LC088_810_Estelle_Start.Start()
		ElseIf (estelleLevel == 2)
			EnableCaptain(Estelle, Estelle_Level2_StartMarker)
			LC088_810_Estelle_Start.Start()
		Else ;3
			Actor estelleRef = Estelle.GetActorRef()
			ObjectReference estelleEndMarkerRef = Estelle_EndMarker.GetRef()
			estelleRef.Enable()
			estelleRef.MoveTo(estelleEndMarkerRef)
			LC088_810_Estelle_Start_2.Start()
			;For Estelle Level 3, also set the area cleared.
			SetStage(CONST_Quarters_ClearedStage)
		EndIf
		;Enable Estelle's Allies
		if (estelleLevel > 1)
			Actor[] allies1 = Estelle_Level2_QuartersAllies.GetArray() as Actor[]
			int i = 0
			While (i < allies1.Length)
				EnableCaptainAllyRef(allies1[i])
				i = i + 1
			EndWhile
			if (estelleLevel > 2)
				Actor[] allies2 = Estelle_Level3_QuartersAllies.GetArray() as Actor[]
				i = 0
				While (i < allies2.Length)
					EnableCaptainAllyRef(allies2[i])
					i = i + 1
				EndWhile
			EndIf
		EndIf
	EndIf
EndFunction


;------------------------------------
;Event: Flee
;--------------------------
;
;In the 'Flee' event, the enemies are ordered to abandon ship.
; - Enemies in the Flee area run toward their assigned docking ports and are removed when they reach them.
; - If the player gets too close, the 'shuttle' 'launches' without them, and the enemies redirect and run toward a generic docking port.
; - All other human enemies on the ship are just removed when they're out of sight and sufficiently far from the player.

Function Flee_StartFleeing()
	;Debug.Trace("LC088 Flee: Fleeing start.", 0)
	;Open all of the flee area doors.
	int i = 0
	int count = Flee_FleeAreaDoors.GetCount()
	While (i < count)
		Flee_FleeAreaDoors.GetAt(i).SetOpen(True)
		i = i + 1
	EndWhile
	;Start the flee timer.
	StartTimer(CONST_FleeTimerDelay, CONST_FleeTimerID)
	;EVP the enemies in the Flee area.
	Flee_EnemiesFleeing.EvaluateAll()
	;Process all of the prior enemies in the level.
	i = 0
	count = Flee_NonBossBattleEnemies.GetCount()
	While (i < count)
		Actor current = Flee_NonBossBattleEnemies.GetAt(i) as Actor
		if ((current == None) || (current.IsDead()) || (Flee_EnemiesFleeing.Find(current) >= 0))
			;Ignore.
		ElseIf ((current.HasKeyword(ActorTypeRobot)) && (!player.HasDetectionLOS(current)))
			;Try to kill robots and turrets that are offscreen, to reduce background noise in the boss battle later.
			current.Kill()
		Else
			;Try to remove them, if they're far enough away and out of sight.
			bool removed = Flee_TryToRemoveFleeingActor(current)
			if (!removed)
				;If we couldn't remove them, make them flee to the generic docking port.
				Flee_EnemiesFleeing.AddRef(current)
				Flee_EnemiesFleeingToGenericDockingPort.AddRef(current)
			EndIf
		EndIf
		i = i + 1
	EndWhile
	Flee_HasFinishedFleeEventSetup = True
EndFunction

;OnTimer, update the state of the Flee event.
Function Flee_UpdateFleeEvent()
	int i = 0
	While (i < Flee_EnemiesFleeing.GetCount())
		Actor currentEnemy = Flee_EnemiesFleeing.GetAt(i) as Actor
		ObjectReference currentEnemyEscapePoint = currentEnemy.GetLinkedRef(LinkCustom01)
		if (currentEnemy == None)
			;Do nothing, although we shouldn't have a None in the array.
		ElseIf (currentEnemy.IsDead())
			;Debug.Trace("--LC088 Flee: " + currentEnemy + " died.", 0)
			Flee_EnemiesFleeing.RemoveRef(currentEnemy)
			if (Flee_EnemiesFleeingToGenericDockingPort.Find(currentEnemy) >= 0)
				Flee_EnemiesFleeingToGenericDockingPort.RemoveRef(currentEnemy)
			EndIf
		ElseIf (Flee_EnemiesFleeingToGenericDockingPort.Find(currentEnemy) >= 0)
			if (Flee_TryToRemoveFleeingActor(currentEnemy))
				;Debug.Trace("--LC088 Flee: " + currentEnemy + " got far enough from the player to be removed.", 0)
				Flee_EnemiesFleeing.RemoveRef(currentEnemy)
				Flee_EnemiesFleeingToGenericDockingPort.RemoveRef(currentEnemy)
			ElseIf (currentEnemy.GetDistance(dockingPort05Ref) < CONST_Flee_DockingPortRemovalRadiusDistance)
				;Debug.Trace("--LC088 Flee: " + currentEnemy + " reached the generic docking port and was removed.", 0)
				currentEnemy.MoveTo(holdingCellMarkerRef)
				currentEnemy.Kill()
				Flee_EnemiesFleeing.RemoveRef(currentEnemy)
				Flee_EnemiesFleeingToGenericDockingPort.RemoveRef(currentEnemy)
			Else
				;Debug.Trace("--LC088 Flee: " + currentEnemy + " is fleeing.", 0)
				if (!Flee_HasFinishedFirstFleeTimer)
					currentEnemy.EvaluatePackage()
				EndIf
				i = i + 1
			EndIf
		ElseIf ((currentEnemyEscapePoint == None) || (currentEnemyEscapePoint.IsDisabled()))
			;Debug.Trace("--LC088 Flee: " + currentEnemy + " had its escape cut off. Redirected to generic docking port.", 0)
			Flee_EnemiesFleeingToGenericDockingPort.AddRef(currentEnemy)
			currentEnemy.EvaluatePackage()
		ElseIf (currentEnemy.GetDistance(currentEnemyEscapePoint) < CONST_Flee_DockingPortRemovalRadiusDistance)
			;Debug.Trace("--LC088 Flee: " + currentEnemy + " reached " + currentEnemyEscapePoint + " and was removed.", 0)
			Flee_EnemiesFleeing.RemoveRef(currentEnemy)
			currentEnemy.MoveTo(holdingCellMarkerRef)
			currentEnemy.Kill()
		Else
			;Enemy is still fleeing; do nothing.
			;Debug.Trace("--LC088 Flee: " + currentEnemy + " is fleeing.", 0)
			i = i + 1
		EndIf
	EndWhile
	Flee_HasFinishedFirstFleeTimer = True
	if (Flee_HasFinishedFleeEventSetup && (Flee_EnemiesFleeing.GetCount() == 0))
		;Debug.Trace("LC088 Flee: Fleeing complete.", 0)
	Else
		;Debug.Trace("LC088 Flee: Fleeing continues.", 0)
		StartTimer(CONST_FleeTimerDelay, CONST_FleeTimerID)
	EndIf
EndFunction

;Remove actors if they're far enough from the player and the player can't see them.
bool Function Flee_TryToRemoveFleeingActor(Actor fleeingActor)
	if ((fleeingActor.GetDistance(player) >= CONST_Flee_FleeRemovalDistance) && (!player.HasDetectionLOS(fleeingActor)))
		;Debug.Trace("--LC088 Flee: " + fleeingActor + " distance disable.", 0)
		fleeingActor.MoveTo(holdingCellMarkerRef)
		fleeingActor.Kill()
		return True
	Else
		return False
	EndIf
EndFunction


;------------------------------------
;Event: Operations Boss Battle
;--------------------------

;Set up Kibwe and Toft for their pre-boss battle scene.
Function Ops_SetupOps()
	kibweRef.SetGhost(True)
	kibweRef.SetEssential(False)
	kibweRef.MoveTo(Ops_KibweStartMarker.GetRef())
	kibweRef.EvaluatePackage()

	toftRef.SetGhost(True)
	toftRef.SetEssential(False)
	toftRef.MoveTo(Ops_ToftStartMarker.GetRef())
	toftRef.EvaluatePackage()
EndFunction

;Start the boss battle.
Function Ops_StartBattleNoWait()
	CallFunctionNoWait("Ops_StartBattle", None)
EndFunction

Function Ops_StartBattle()
	;Start the boss battle music.
	MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
	MUSGenesisCombatBoss_Vigilance.Add()
	;Kick off the combat.
	SetNewHoldPositionTarget(kibweRef, kibweRef.GetLinkedRef(LC088_Ops_BossHoldPositionInitialMarkerKeyword))
	kibweRef.SetGhost(False)
	kibweRef.StartCombat(player)
	SetNewHoldPositionTarget(toftRef, toftRef.GetLinkedRef(LC088_Ops_BossHoldPositionInitialMarkerKeyword))
	toftRef.SetGhost(False)
	toftRef.StartCombat(player)
	;Start the battle monitor timer.
	StartTimer(CONST_Ops_BattleMonitorTimerDelay, CONST_Ops_BattleMonitorTimerID)
	;Start timers to activate the turrets.
	StartTimer(CONST_Ops_RobotActivationTimerDelay, CONST_Ops_RobotActivationTimerID)
	StartTimer(CONST_Ops_TurretActivationTimerDelay, CONST_Ops_TurretActivationTimerID)
EndFunction

;After a delay, or when Toft or Kibwe die, activate all of the turrets.
Function Ops_ActivateAllTurrets()
	ToggleOpsActorCollection(Ops_Turrets, True)
EndFunction

Function Ops_ActivateInitialRobots()
	ToggleOpsActorCollection(Ops_Robots_Initial, True)
EndFunction

;When Kibwe or Toft die, activate the remaining robots.
Function Ops_ActivateAllRobots()
	ToggleOpsActorCollection(Ops_Robots, True)
EndFunction

Function Ops_UpdateBattleMonitor()
	bool eitherSysDefLeaderAlive
	if (!kibweRef.IsDead())
		eitherSysDefLeaderAlive = True
		if (ShouldUpdateMovement(kibweRef))
			SetNewHoldPositionTargetRandom(kibweRef)
		EndIf
	EndIf
	if (!toftRef.IsDead())
		eitherSysDefLeaderAlive = True
		if (ShouldUpdateMovement(toftRef))
			SetNewHoldPositionTargetRandom(toftRef)
		EndIf
	EndIf
	if (eitherSysDefLeaderAlive)
		StartTimer(CONST_Ops_BattleMonitorTimerDelay, CONST_Ops_BattleMonitorTimerID)
	EndIf
EndFunction


;Should we update our movement based on health loss or time?
bool Function ShouldUpdateMovement(Actor actorToUpdate)
	bool healthUpdate = ShouldUpdateMovementDueToHealthLoss(actorToUpdate)
	if (healthUpdate)
		Debug.Trace("ShouldUpdateMovement: " + actorToUpdate + " updating due to health loss.")
		return True
	Else
		bool timeUpdate = ShouldUpdateMovementDueToTime(actorToUpdate)
		if (timeUpdate)
			Debug.Trace("ShouldUpdateMovement: " + actorToUpdate + " updating due to time.")
			return True
		EndIf
	EndIf
	Return False
EndFunction

;Should we update our movement based on health loss?
bool Function ShouldUpdateMovementDueToHealthLoss(Actor actorToUpdate)
	float currentHealthPercentage = actorToUpdate.GetValuePercentage(Health)
	float lastHealthPercentage = actorToUpdate.GetValue(LC088_Ops_MovementUpdateHealthPercentStampValue)
	if (currentHealthPercentage < lastHealthPercentage - CONST_Ops_MovementUpdateHealthLossPercent)
		return True
	EndIf
	return False
EndFunction

;Should we update our movement based on time?
bool Function ShouldUpdateMovementDueToTime(Actor actorToUpdate)
	float currentTime = Utility.GetCurrentRealTime()
	float lastMovementUpdateTime = actorToUpdate.GetValue(LC088_Ops_MovementUpdateTimestampValue)
	float timeForNextMovementUpdate = lastMovementUpdateTime + CONST_Ops_MovementUpdateTime
	return (lastMovementUpdateTime < currentTime) || (currentTime >= timeForNextMovementUpdate)
EndFunction

;Set a new hold position target, randomly selected from 
ObjectReference Function SetNewHoldPositionTargetRandom(Actor actorToUpdate)
	ObjectReference currentHoldPositionTarget = actorToUpdate.GetLinkedRef(LC088_Ops_BossHoldPositionLink)
	ObjectReference[] potentialHoldPositionTargets = Ops_BossHoldPositionTargets.GetArray()
	int currentHoldPositionTargetIndex = potentialHoldPositionTargets.Find(currentHoldPositionTarget)
	if (currentHoldPositionTargetIndex >= 0)
		potentialHoldPositionTargets.Remove(currentHoldPositionTargetIndex)
	EndIf
	int newHoldPositionTargetIndex = Utility.RandomInt(0, potentialHoldPositionTargets.Length-1)
	ObjectReference newHoldPositionTarget = potentialHoldPositionTargets[newHoldPositionTargetIndex]
	SetNewHoldPositionTarget(actorToUpdate, newHoldPositionTarget)
EndFunction

ObjectReference Function SetNewHoldPositionTarget(Actor actorToUpdate, ObjectReference newHoldPositionTarget)
	actorToUpdate.SetLinkedRef(newHoldPositionTarget, LC088_Ops_BossHoldPositionLink)
	actorToUpdate.SetValue(LC088_Ops_BossHoldPositionValue, 1-actorToUpdate.GetValue(LC088_Ops_BossHoldPositionValue))
	actorToUpdate.SetValue(LC088_Ops_MovementUpdateTimestampValue, Utility.GetCurrentRealTime())
	actorToUpdate.SetValue(LC088_Ops_MovementUpdateHealthPercentStampValue, actorToUpdate.GetValuePercentage(Health))
	actorToUpdate.EvaluatePackage()
	return newHoldPositionTarget
EndFunction


;Shut down after the boss battle.
Function Ops_EndBattleNoWait()
	CallFunctionNoWait("Ops_EndBattle", None)
EndFunction

Function Ops_EndBattle()
	;Cancel the battle monitor timer.
	CancelTimer(CONST_Ops_BattleMonitorTimerID)
	;Stop the boss battle music.
	MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
	MUSGenesisCombatBoss_Vigilance.Remove()
	;Stop the battle alarm.
	CF08BattleAlarm.TryToDisable()
	;Stop the Captains' events.
	ShutdownAllCaptainEvents(True)
	;Deactivate all robots and turrets in Ops.
	ToggleOpsActorCollection(Ops_RobotsAndTurrets, False)
	;Deactivate any remaining robots or turrets on the ship. Delete any remaining enemies.
	Actor[] allNonbossEnemies = Flee_NonBossBattleEnemies.GetArray() as Actor[]
	int i = 0
	While (i < allNonbossEnemies.Length)
		Actor currentEnemy = allNonbossEnemies[i]
		if ((currentEnemy == None) && (!currentEnemy.IsDead()) && (!currentEnemy.IsDisabled()))
			if (currentEnemy.HasKeyword(ActorTypeRobot))
				currentEnemy.SetUnconscious(True)
			Else
				currentEnemy.MoveTo(holdingCellMarkerRef)
				currentEnemy.Kill()
			EndIf
		EndIf
		i = i + 1
	EndWhile
	;Clean up all of the prisoners.
	;Captains and named NPCs get their outfits reset and return to their normal packages. Generic actors are disabled.
	CleanupAllPrisoners()
	;Unseal the security doors.
	Ops_UnsealSecurityDoors()
	;Enable Naeva and her guards.
	SetStageNoWait(CONST_Complete_StartNaevaScene_Stage)
	;Release the lockdown on the elevators.
	Ops_SetElevatorLockedDown(False)
	;Enable Fast Travel.
	Ops_SetFastTravelEnabled(True)
	;Update LC088_Space.
	LC088_Space.SetStage(CONST_Complete_Space_VigilanceCompleted_Stage)
	;Start the CF postquest.
	CF_Post.SetStage(CONST_Complete_Postquest_StartPostquest_Stage)
EndFunction


Function ToggleOpsActorCollection(RefCollectionAlias actorCollection, bool shouldActivate)
	LockGuard OpsActorCollectionsGuard
		Actor[] myActors = actorCollection.GetArray() as Actor[]
		int i = 0
		While (i < myActors.Length)
			if (myActors[i] != None)
				if (shouldActivate && (!GetStageDone(CONST_Complete_Stage)))
					RobotPodScript robotActor = myActors[i] as RobotPodScript
					if (robotActor != None)
						robotActor.WakeRobotFromPod()
					Else
						myActors[i].SetUnconscious(False)
						myActors[i].StartCombat(player)
					EndIf
				Else
					myActors[i].SetUnconscious(True)
				EndIf
			EndIf
			i = i + 1
		EndWhile
	EndLockGuard
EndFunction


;Enable or disable fast travel from the Vigilance.
Function Ops_SetFastTravelEnabled(bool isEnabled)
	LC082Vigilance01.EnableFastTravel(isEnabled)
EndFunction

;Close the Elevator Access doors; close and seal the Operations Center doors.
Function Ops_InitSecurityDoors()
	Ops_SetDoorState(Ops_Doors_ElevatorAccessDoors, CONST_DoorState_Sealed)
	Ops_SetDoorState(Ops_Doors_OperationsCenterDoors, CONST_DoorState_ActivationBlocked)
EndFunction

;Seal the Elevator and Operations Center security doors.
Function Ops_SealSecurityDoors()
	Ops_SetDoorState(Ops_Doors_ElevatorAccessDoors, CONST_DoorState_Sealed)
	Ops_SetDoorState(Ops_Doors_OperationsCenterDoors, CONST_DoorState_Sealed)
EndFunction

;Unseal the Elevator and Operations Center security doors.
Function Ops_UnsealSecurityDoors()
	Ops_SetDoorState(Ops_Doors_ElevatorAccessDoors, CONST_DoorState_Open)
	Ops_SetDoorState(Ops_Doors_OperationsCenterDoors, CONST_DoorState_Open)
EndFunction

;Lock or unlock player controls.
Function Ops_LockPlayerControls(bool shouldLock)
	if (shouldLock)
		vigilanceInputLayer.DisablePlayerControls()
	Else
		vigilanceInputLayer.EnablePlayerControls()
	EndIf
EndFunction

;Open or close a collection of doors.
Function Ops_SetDoorState(RefCollectionAlias doorCollection, int doorState)
	int i = 0
	int count = doorCollection.GetCount()
	While (i < count)
		ObjectReference currentDoor = doorCollection.GetAt(i)
		if (doorState == CONST_DoorState_Open)
			currentDoor.Unlock()
			currentDoor.SetOpen(True)
			currentDoor.BlockActivation(False, False)
		ElseIf (doorState == CONST_DoorState_Sealed)
			currentDoor.SetOpen(False)
			currentDoor.Lock()
			currentDoor.SetLockLevel(CONST_LockLevel_RequiresTerminal) ;Requires Terminal
			currentDoor.BlockActivation(False, False)
		ElseIf (doorState == CONST_DoorState_ActivationBlocked)
			currentDoor.SetOpen(False)
			currentDoor.Unlock()
			currentDoor.BlockActivation(True, False)
		EndIf
		i = i + 1
	EndWhile
EndFunction

;Set or clear the Accessible flag on the Vigilance's elevators.
Function Ops_SetElevatorLockedDown(bool shouldBeLockedDown)
	int i = 0
	int count = Ops_Elevators_FloorMarkers.GetCount()
	While (i < count)
		(Ops_Elevators_FloorMarkers.GetAt(i) as LoadElevatorFloorScript).SetAccessible(!shouldBeLockedDown)
		i = i + 1
	EndWhile
EndFunction


;------------------------------------
;Cleanup & Shutdown
;----------------------------

Event Actor.OnLocationChange(Actor source, Location akOldLoc, Location akNewLoc)
	if ((akNewLoc == LC082VigilanceLocation) && (!GetStageDone(CONST_Complete_Stage)))
		MUSGenesisCombatBoss_CF08VigilanceAndKey.Add()
	ElseIf (akOldLoc == LC082VigilanceLocation)
		MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
		MUSGenesisCombatBoss_Vigilance.Remove()
	EndIf
EndEvent

Function Cleanup()
	;Make sure the music override was removed.
	MUSGenesisCombatBoss_CF08VigilanceAndKey.Remove()
	MUSGenesisCombatBoss_Vigilance.Remove()

	;Cleanup local variables.
	player = None
	kibweRef = None
	toftRef = None
	brigTerminal = None
	brigFindWeaponsTriggers = None
	cargoBayTerminal = None
	engineRoomTerminal = None
	weaponsTerminal = None
	dockingPort05Ref = None
	holdingCellMarkerRef = None
	vigilanceInputLayer.Delete()
	LockGuard(RoboticsEnemiesGuard)
		Robotics_RoboticsEnemies = None
	EndLockGuard
EndFunction


;------------------------------------
;Timer and Utility Functions
;----------------------------

Event OnTimer(int timerID)
	if (timerID == CONST_UpdateRoboticsBattleTimerID)
		Robotics_UpdateRoboticsBattle()
	ElseIf (timerID == CONST_FleeTimerID)
		Flee_UpdateFleeEvent()
	ElseIf (timerID == CONST_Ops_TurretActivationTimerID)
		Ops_ActivateAllTurrets()
	ElseIf (timerID == CONST_Ops_RobotActivationTimerID)
		Ops_ActivateInitialRobots()
	ElseIf (timerID == CONST_Ops_BattleMonitorTimerID)
		Ops_UpdateBattleMonitor()
	EndIf
EndEvent