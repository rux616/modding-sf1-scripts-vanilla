Scriptname LC165SpaceQuestScript extends Quest
{One of the quest scripts for LC165, Buried Temple. Handles the space encounter at the beginning of the quest.}

Group QuestProperties
	SpaceshipBase property QuickstartShip Auto Const Mandatory
	{If the player is not in a ship when the space quickstart is run, spawn this ship and force them into it.}
EndGroup

Group AutofillProperties
	SQ_PlayerShipScript property SQ_PlayerShip Auto Const Mandatory

	ReferenceAlias property PlayerShip Auto Const Mandatory
	ReferenceAlias property PlayerShipPilotSeat Auto Const Mandatory
	ReferenceAlias property AllyShip Auto Const Mandatory
	ReferenceAlias property Adversary01Ship Auto Const Mandatory
	ReferenceAlias property Adversary02Ship Auto Const Mandatory
	ReferenceAlias property AdversaryShipStartMarker Auto Const Mandatory
	ReferenceAlias property Adversary01ShipStartMarker Auto Const Mandatory
	ReferenceAlias property Adversary02ShipStartMarker Auto Const Mandatory
	ReferenceAlias property GenericShipSpawnPoint01Marker Auto Const Mandatory
	ReferenceAlias property GenericShipSpawnPoint02Marker Auto Const Mandatory
	ReferenceAlias property SpaceHoldPositionTrigger Auto Const Mandatory
	RefCollectionAlias property InitialGenericShips Auto Const Mandatory
	RefCollectionAlias property ReinforcementGenericShips Auto Const Mandatory
	RefCollectionAlias property AllShips Auto Const Mandatory

	MusicType property MUSGenesisCombatBoss_MQ302_SpaceBattle Auto Const Mandatory
	ObjectReference property NewGameShipMarkerRef Auto Const Mandatory
	SpaceshipBase property LC165_LvlStarbornShip Auto Const Mandatory
	Location property LC165BuriedTempleSpaceLocation Auto Const Mandatory
	Faction property PlayerFriendFaction Auto Const Mandatory
	Perk property Piloting Auto Const Mandatory
	Spell property AbStarbornShipCloaking Auto Const Mandatory
	Keyword property DMP_Combat_HoldPosition Auto Const Mandatory
	GlobalVariable property MQ302B_AllyShipSpawnDelay Auto Const Mandatory
	ActorValue property Health Auto Const Mandatory
	ActorValue property DockingPermission Auto Const Mandatory
	ActorValue property Aggression Auto Const Mandatory
EndGroup


;Local Variables
Actor player
SpaceshipReference allyShipRef
SpaceshipReference adversary01ShipRef
SpaceshipReference adversary02ShipRef
ObjectReference spaceHoldPositionTriggerRef
float adversary01ShipBaseHealth
float adversary02ShipBaseHealth
bool adversary01ShipRetreated
bool adversary02ShipRetreated
bool hasEnabledAllyShip

;For quickstart.
bool waitingForPlayerToSit


;Local Consts
int CONST_Stage_SpaceBattleStartedStage = 110 Const
int CONST_Stage_SpawnReinforcementsStage = 130 Const
int CONST_Stage_ReinforcementsFinishedSpawningStage = 131 Const
int CONST_Stage_AllyShipEnabledStage = 150 Const
int CONST_Stage_AdversaryShipRetreatedStage = 180 Const
int CONST_Stage_SpaceBattleCompletedStage = 190 Const

float CONST_InitialSpawnDelayMin = 0.25 Const
float CONST_InitialSpawnDelayMax = 0.5 Const
float CONST_InitialCloakingDelayMin = 0.25 Const
float CONST_InitialCloakingDelayMax = 0.5 Const
float CONST_ReinforcementSpawnDelayMin = 0.5 Const
float CONST_ReinforcementSpawnDelayMax = 1.5 Const
float CONST_AllyAppearsDelay = 3.0 Const

int CONST_AllySpawnTimerID = 1 Const

float CONST_AdversaryShipRetreatHealthPercent = 0.4 Const

int CONST_LevelMod_Medium = 1 Const
int CONST_ShipDockingPermission_Never = 4 Const

;Guards
Guard CheckForAdversaryRetreat ProtectsFunctionLogic



;----------------------------------------
;Initialization & Quickstarts
;-----------------------------

Event OnQuestInit()
	;Set up local variables.
	player = Game.GetPlayer()
	spaceHoldPositionTriggerRef = SpaceHoldPositionTrigger.GetRef()
EndEvent

Function QuickstartToSpace()
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	if (playerShipRef == None)
		;This setup adapted from GoToSpace.
		InputEnableLayer myEnableLayer = InputEnableLayer.Create()
		myEnableLayer.DisablePlayerControls(abCamSwitch=True)
		SpaceshipReference testShip = NewGameShipMarkerRef.PlaceShipAtMe(QuickstartShip)
		SQ_PlayerShip.ResetPlayerShip(testShip)
		SQ_PlayerShip.ResetHomeShip(testShip)
		player.AddPerk(Piloting)
		player.AddPerk(Piloting)
		player.AddPerk(Piloting)
		player.AddPerk(Piloting)
		player.MoveTo(testShip)
		SQ_PlayerShip.HandleShipTakeOff()
		PlayerShipPilotSeat.GetRef().Activate(player)
		myEnableLayer.Delete()
		waitingForPlayerToSit = True
		RegisterForRemoteEvent(Game.GetPlayer(), "OnSit")
		While(waitingForPlayerToSit)
			Utility.Wait(0.5)
		EndWhile
	EndIf
EndFunction

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
	waitingForPlayerToSit = False
EndEvent


;----------------------------------------
;Space
;-----------------------------

;When the player arrives at Masada III, move/spawn the enemy ships.
Function SetupSpaceEncounter()
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	adversary01ShipRef = Adversary01Ship.GetShipRef()
	adversary01ShipRef.Reset()
	adversary01ShipBaseHealth = adversary01ShipRef.GetBaseValue(Health)
	adversary02ShipRef = Adversary02Ship.GetShipRef()

	if (adversary02ShipRef == None)
		;Player fighting the Hunter OR the Emissary.
		Private_SetupAdversaryShip(adversary01ShipRef, AdversaryShipStartMarker.GetRef())
		Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax))
		Private_SetupGenericShip(GenericShipSpawnPoint01Marker.GetRef(), LC165_LvlStarbornShip, CONST_LevelMod_Medium)
		Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax))
		Private_SetupGenericShip(GenericShipSpawnPoint02Marker.GetRef(), LC165_LvlStarbornShip, CONST_LevelMod_Medium)
		;Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax))
		;Private_SetupGenericShip(GenericShipSpawnPoint03Marker.GetRef(), LC165_LvlStarbornShip, CONST_LevelMod_Medium)
	Else
		;Player fighting the Hunter AND the Emissary.
		adversary02ShipRef.Reset()
		adversary02ShipBaseHealth = adversary02ShipRef.GetBaseValue(Health)
		Private_SetupAdversaryShip(adversary01ShipRef, Adversary01ShipStartMarker.GetRef())
		Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax))
		Private_SetupAdversaryShip(adversary02ShipRef, Adversary02ShipStartMarker.GetRef())
		Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax))
		Private_SetupGenericShip(GenericShipSpawnPoint01Marker.GetRef(), LC165_LvlStarbornShip, CONST_LevelMod_Medium)
		;Utility.Wait(Utility.RandomFloat(CONST_InitialSpawnDelayMin, CONST_InitialSpawnDelayMax))
		;Private_SetupGenericShip(GenericShipSpawnPoint02Marker.GetRef(), LC165_LvlStarbornShip, CONST_LevelMod_Medium)
	EndIf
EndFunction

;Helper: Set up the Adversary ship(s).
Function Private_SetupAdversaryShip(SpaceshipReference ship, ObjectReference startMarker)
	ship.Disable()
	ship.MoveTo(startMarker)
	ship.SetNoBleedoutRecovery(True)
	ship.SetValue(DockingPermission, CONST_ShipDockingPermission_Never)
	ship.SetLinkedRef(spaceHoldPositionTriggerRef, DMP_Combat_HoldPosition)
	ship.AddToFaction(PlayerFriendFaction)
	AllShips.AddRef(ship)
	RegisterForHitEvent(ship)
	RegisterForRemoteEvent(ship, "OnEnterBleedout")
	ship.EnableWithGravJumpNoWait()
EndFunction

;Helper: Set up Generic ships.
Function Private_SetupGenericShip(ObjectReference shipSpawnMarker, SpaceshipBase shipBase, int shipLevelMod)
	SpaceshipReference genericShipRef = shipSpawnMarker.PlaceShipAtMe(shipBase, shipLevelMod, abInitiallyDisabled=True)
	genericShipRef.SetLinkedRef(spaceHoldPositionTriggerRef, DMP_Combat_HoldPosition)
	genericShipRef.AddToFaction(PlayerFriendFaction)
	InitialGenericShips.AddRef(genericShipRef)
	AllShips.AddRef(genericShipRef)
	RegisterForRemoteEvent(genericShipRef, "OnDying")
	genericShipRef.EnableWithGravJumpNoWait()
EndFunction


;During the initial scene, cloak the ships.
Function ForceCloakStarbornShips()
	SpaceshipReference[] initialGenericShipRefs = InitialGenericShips.GetArray() as SpaceshipReference[]
	int i = 0
	While (i < initialGenericShipRefs.Length)
		initialGenericShipRefs[i].AddSpell(AbStarbornShipCloaking)
		Utility.Wait(Utility.RandomFloat(CONST_InitialCloakingDelayMin, CONST_InitialCloakingDelayMax))
		i = i + 1
	EndWhile
	adversary01ShipRef.AddSpell(AbStarbornShipCloaking)
	if (adversary02ShipRef != None)
		Utility.Wait(Utility.RandomFloat(CONST_InitialCloakingDelayMin, CONST_InitialCloakingDelayMax))
		adversary02ShipRef.AddSpell(AbStarbornShipCloaking)
	EndIf
EndFunction

;Following the initial scene, begin the battle.
Function StartSpaceEncounter()
	RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
	MUSGenesisCombatBoss_MQ302_SpaceBattle.Add()
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	adversary01ShipRef.RemoveFromFaction(PlayerFriendFaction)
	adversary01ShipRef.SetValue(Aggression, 2)
	adversary01ShipRef.StartCombat(playerShipRef)
	adversary01ShipRef.EvaluatePackage()
	if (adversary02ShipRef != None)
		adversary02ShipRef.RemoveFromFaction(PlayerFriendFaction)
		adversary02ShipRef.SetValue(Aggression, 2)
		adversary02ShipRef.StartCombat(playerShipRef)
		adversary02ShipRef.EvaluatePackage()
	EndIf
	int i = 0
	SpaceshipReference[] initialGenericShipRefs = InitialGenericShips.GetArray() as SpaceshipReference[]
	While (i < initialGenericShipRefs.Length)
		initialGenericShipRefs[i].RemoveFromFaction(PlayerFriendFaction)
		initialGenericShipRefs[i].StartCombat(playerShipRef)
		initialGenericShipRefs[i].EvaluatePackage()
		i = i + 1
	EndWhile
	StartTimer(MQ302B_AllyShipSpawnDelay.GetValue(), CONST_AllySpawnTimerID)
EndFunction

Event OnTimer(int timerID)
	if (timerID == CONST_AllySpawnTimerID)
		if (PlayerShip.GetShipRef().GetCurrentLocation() == LC165BuriedTempleSpaceLocation)
			EnablePlayerAllyShip()
		Else
			StartTimer(CONST_AllyAppearsDelay, CONST_AllySpawnTimerID)
		EndIf
	EndIf
EndEvent


Function EndSpaceEncounter()
	MUSGenesisCombatBoss_MQ302_SpaceBattle.Remove()
EndFunction

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSource, Location akOldLoc, Location akNewLoc)
	if ((akNewLoc == LC165BuriedTempleSpaceLocation) && GetStageDone(CONST_Stage_SpaceBattleStartedStage) && !GetStageDone(CONST_Stage_SpaceBattleCompletedStage))
		MUSGenesisCombatBoss_MQ302_SpaceBattle.Add()
	ElseIf (akOldLoc == LC165BuriedTempleSpaceLocation)
		MUSGenesisCombatBoss_MQ302_SpaceBattle.Remove()
	EndIf
EndEvent


;Mid-battle, spawn reinforcements and enable the player's ally (if any).
Event SpaceshipReference.OnDying(SpaceshipReference akSource, ObjectReference akKiller)
	if (!GetStageDone(CONST_Stage_SpawnReinforcementsStage))
		SetStage(CONST_Stage_SpawnReinforcementsStage)
	EndIf
EndEvent

Function SpawnSpaceEncounterReinforcements()
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	if (adversary02ShipRef == None)
		;Spawn reinforcements.
		;Private_SpawnReinforcementShip(LC165_LvlStarbornShip, CONST_LevelMod_Medium)
		;Utility.Wait(Utility.RandomFloat(CONST_ReinforcementSpawnDelayMin, CONST_ReinforcementSpawnDelayMax))
		;Private_SpawnReinforcementShip(LC165_LvlStarbornShip, CONST_LevelMod_Medium)
		;Utility.Wait(Utility.RandomFloat(CONST_ReinforcementSpawnDelayMin, CONST_ReinforcementSpawnDelayMax))
		;Private_SpawnReinforcementShip(LC165_LvlStarbornShip, CONST_LevelMod_Medium)
		;Utility.Wait(Utility.RandomFloat(CONST_ReinforcementSpawnDelayMin, CONST_ReinforcementSpawnDelayMax))
		;Private_SpawnReinforcementShip(LC165_LvlStarbornShip, CONST_LevelMod_Medium)
		SetStage(CONST_Stage_ReinforcementsFinishedSpawningStage)

		;Then enable the player's ally, if they haven't already been enabled by the timer.
		if (!hasEnabledAllyShip)
			StartTimer(CONST_AllyAppearsDelay, CONST_AllySpawnTimerID)
		EndIf
	Else
		;The player doesn't have an ally, so just spawn reinforcements.
		;Private_SpawnReinforcementShip(LC165_LvlStarbornShip, CONST_LevelMod_Medium)
		;Utility.Wait(Utility.RandomFloat(CONST_ReinforcementSpawnDelayMin, CONST_ReinforcementSpawnDelayMax))
		;Private_SpawnReinforcementShip(LC165_LvlStarbornShip, CONST_LevelMod_Medium)
		;Utility.Wait(Utility.RandomFloat(CONST_ReinforcementSpawnDelayMin, CONST_ReinforcementSpawnDelayMax))
		;Private_SpawnReinforcementShip(LC165_LvlStarbornShip, CONST_LevelMod_Medium)
		SetStage(CONST_Stage_ReinforcementsFinishedSpawningStage)
	EndIf
EndFunction

Function EnablePlayerAllyShip()
	if (!hasEnabledAllyShip)
		hasEnabledAllyShip = True
		;Enable the allied ship.
		allyShipRef = AllyShip.GetShipRef()
		if (allyShipRef != None)
			allyShipRef.MoveNear(PlayerShip.GetShipRef(), allyShipRef.CONST_NearPosition_ForwardWide, allyShipRef.CONST_NearDistance_Close, allyShipRef.CONST_NearFacing_AwaySmall)
			allyShipRef.SetValue(DockingPermission, CONST_ShipDockingPermission_Never)
			allyShipRef.EnableWithGravJump()
			AllShips.AddRef(allyShipRef)
		EndIf
		;And start their scene.
		SetStage(CONST_Stage_AllyShipEnabledStage)
	EndIf
EndFunction

;Helper: Set up Generic ships.
;Function Private_SpawnReinforcementShip(SpaceshipBase shipBase, int shipLevelMod)
;	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
;	SpaceshipReference genericShipRef = playerShipRef.PlaceShipAtMe(shipBase, shipLevelMod, abInitiallyDisabled=True)
;	genericShipRef.MoveNear(playerShipRef, genericShipRef.CONST_NearPosition_ForwardTight, genericShipRef.CONST_NearDistance_Moderate, genericShipRef.CONST_NearFacing_TowardLarge)
;	ReinforcementGenericShips.AddRef(genericShipRef)
;   AllShips.AddRef(genericShipRef)
;	genericShipRef.EnableWithGravJumpNoWait()
;	genericShipRef.StartCombat(playerShipRef)
;EndFunction


;When an Adversary ship is damaged or enters bleedout, check whether it should retreat.
Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	bool retreated = CheckForAdversaryRetreat(akTarget as SpaceshipReference)
	if (!retreated)
		RegisterForHitEvent(akTarget)
	EndIf
EndEvent

Event SpaceshipReference.OnEnterBleedout(SpaceshipReference akSource)
	CheckForAdversaryRetreat(akSource, 0)
EndEvent


bool Function CheckForAdversaryRetreat(SpaceshipReference ship, float overrideHealthPercent=-1.0)
	bool shipRetreated

	LockGuard CheckForAdversaryRetreat
		;When the adversary's ship is reduced below CONST_AdversaryShipRetreatHealthPercent, it retreats.
		if (ship == adversary01ShipRef)
			float adversary01ShipHealthPercent = adversary01ShipRef.GetValue(Health) / adversary01ShipBaseHealth
			if (overrideHealthPercent >= 0)
				adversary01ShipHealthPercent = overrideHealthPercent
			EndIf
			if (adversary01ShipHealthPercent < CONST_AdversaryShipRetreatHealthPercent)
				shipRetreated = True
				adversary01ShipRetreated = True
				if (adversary01ShipRef.Is3DLoaded())
					adversary01ShipRef.DisableWithGravJumpNoWait()
				Else
					adversary01ShipRef.DisableNoWait()
				EndIf
			EndIf
		ElseIf (ship == adversary02ShipRef)
			float adversary02ShipHealthPercent = adversary02ShipRef.GetValue(Health) / adversary02ShipBaseHealth
			if (overrideHealthPercent >= 0)
				adversary02ShipHealthPercent = overrideHealthPercent
			EndIf
			if (adversary02ShipHealthPercent < CONST_AdversaryShipRetreatHealthPercent)
				shipRetreated = True
				adversary02ShipRetreated = True
				if (adversary02ShipRef.Is3DLoaded())
					adversary02ShipRef.DisableWithGravJumpNoWait()
				Else
					adversary02ShipRef.DisableNoWait()
				EndIf
			EndIf
		EndIf

		;Check if both adversary ships have retreated. If so, set a stage to advance the quest.
		if (adversary01ShipRetreated && ((adversary02ShipRef == None) || adversary02ShipRetreated))
			SetStage(CONST_Stage_AdversaryShipRetreatedStage)
		EndIf
	EndLockGuard

	return shipRetreated
EndFunction