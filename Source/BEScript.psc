Scriptname BEScript extends Quest
{Standard script for Boarding Encounter quests.}

Struct GenericCrewDatum
	ActorBase CrewActor
	{The Actor to spawn.}
	float ActorLevelModChanceEasy = 0.5
	{Default=0.5. Chance the actor's aiLevelMod will be 0, Easy.}
	float ActorLevelModChanceMedium = 0.4
	{Default=0.4. Chance the actor's aiLevelMod will be 1, Medium. If not Easy or Medium, the actor will be 2, Hard.}
	int InstancesToSpawn = -1
	{Default=-1 (Unlimited). The maximum number of instances of this actor to spawn on this ship.}
EndStruct

Struct ModuleDatum
	ObjectReference moduleRef
	ObjectReference shipCrewSpawnMarkerRef01
	ObjectReference shipCrewSpawnMarkerRef02
	ObjectReference shipCrewSpawnMarkerRef03
	ObjectReference shipCrewSpawnMarkerRef04
	ObjectReference shipCrewSpawnMarkerRef05
	ObjectReference shipTurretSpawnMarkerRef01
	ObjectReference shipTurretSpawnMarkerRef02
	ObjectReference shipTurretSpawnMarkerRef03
	ObjectReference shipTurretSpawnMarkerRef04
	ObjectReference shipTurretSpawnMarkerRef05
	ObjectReference shipComputerRef
EndStruct


Group QuestProperties CollapsedOnBase
	bool property ShutDownOnUndock = False Auto ;NOT Const
	{DEFAULT=False. Should this quest shut down when the target ship undocks?
	This should be FALSE for most Boarding Encounters-- you want the quest to continue to run until the target ship unloads. Otherwise, if you undock, then re-dock, a new and potentially different Boarding Encounter will start.}

	bool property ShutDownOnUnload = True Auto ;NOT Const
	{DEFAULT=True. Should this quest shut down when the target ship unloads?
	This should be TRUE for most Boarding Encounters-- you want the quest to shut down when the target ship unloads so it and the target ship can be cleaned up.}

	bool property ShutDownOnTakeover = True Auto ;NOT Const
	{DEFAULT=True. Should this quest shut down if the player takes over the enemy ship?
	This should be TRUE for most Boarding Encounters-- the encounter should not remain active once a player has taken over the ship.}

	int property StageToSetOnBoarding = -1 Auto Const
	{DEFAULT=-1. If >=0, stage to set when the player boards the enemy ship for the first time.}

	int property StageToSetWhenAllCrewDead = -1 Auto Const
	{Default=-1. If >=0, stage to set when all of the enemy ship's crew has been killed.}
EndGroup

Group CrewProperties
	bool property ShouldCrewStartInCombat = True Auto Const
	{DEFAULT=True. Is this a hostile boarding encounter?
	If True, the crew will start in the Suspicious state, and Companions will play a combat-oriented line when boarding the enemy ship. Does not apply to Surface Encounters.}

	bool property ShouldSpawnCrew = True Auto Const
	{DEFAULT=True. Should this BE spawn generic crew ?}

	bool property ShouldSpawnCaptain = True Auto Const
	{DEFAULT=True. Should this BE spawn a generic captain?}

	GenericCrewDatum property CaptainData Auto ;NOT Const or Mandatory
	{When a BE spawns its generic crew, if at least one actor is alive (SpaceshipCrew actor value >= 1, adjusted by any mods below), and ShouldSpawnCaptain=True,
	the first actor to be spawned will be this Captain. One and only one Captain is spawned (InstancesToSpawn will be ignored).
	The Captain will be added to the AllCrew, GenericCrew, and Captain aliases.}

	GenericCrewDatum[] property CrewData Auto ;NOT Const or Mandatory
	{When a BE spawns its generic crew, it determines how many slots it has to fill based on the SpaceshipCrew actor value (and any mods below), then cycles
	through CrewData until it's spawned the required number of actors, or until it runs out of actors it can spawn.
	Crew are added to the AllCrew and GenericCrew aliases.}

	float property CrewCountPercent = 1.0 Auto Const
	{DEFAULT=1.0. Multiply SpaceshipCrew by this value before spawning crew. Use 0.5 if you want half the normal crew, etc.
	NOTE: The SpaceshipCrew count is visible to players during space battles, so you should only modify this for surface encounters or very unusual space encounters,
	since players will be expecting a specific number of enemies.}

	int property CrewCountOverride = -1 Auto Const
	{OPTIONAL, DEFAULT=-1. If >=0, set the number of crew members to spawn to this value. If set, CrewCountMod and the SpaceshipCrew actor value are ignored.
	NOTE: The SpaceshipCrew count is visible to players during space battles, so you should only modify this for surface encounters or very unusual space encounters,
	since players will be expecting a specific number of enemies.}

	int property CrewSpawnPattern = 1 Auto Const
	{DEFAULT=1. When spawning generic crew, what pattern should we spawn them in?
	0=FILL. Select a module, fill all of its spawn points, move on to the next module, repeat.
	1=HALF FILL. Select a module, fill half of its spawn points, move on to the next module, repeat. Spawn excess crew randomly.
	2=SPREAD. Select a module, fill one spawn point in it, move on to the next module, repeat. Spawn excess crew randomly.
	3=RANDOM. Select spawn points completely at random.}

	bool property ShouldSpawnCorpses = True Auto Const
	{DEFAULT=True. Should this BE spawn generic corpses?}

	GenericCrewDatum[] property CorpseData Auto ;NOT Const or Mandatory
	{OPTIONAL. When a BE spawns its generic crew corpses, it determines how many slots it has to fill based on the SpaceshipCrew actor value (Max-Current)(and any mods below),
	then cycles through CrewCorpseData (if any) until it's spawned the required number of actors, or runs out of actors it can spawn.
	If CrewCorpseData=None, it just continues using the remaining actors in CrewData.}

	float property CorpseCountPercent = 1.0 Auto Const
	{DEFAULT=1.0. Multiply the number of corpses to spawn CorpseCountPercent before spawning corpses.
	Use 0.5 if you want half the normal number of corpses, etc.}

	int property CorpseCountOverride = -1 Auto Const
	{OPTIONAL; DEFAULT=-1. If >=0, set the number of crew corpses to spawn to this value. If set, CorpseCountMod and the SpaceshipCrew actor value are ignored.}

	int property CorpseSpawnPattern = 0 Auto Const
	{DEFAULT=1. When spawning crew corpses, what pattern should we spawn them in?
	0=FILL. Select a module, fill all of its spawn points, move on to the next module, repeat.
	1=HALF FILL. Select a module, fill half of its spawn points, move on to the next module, repeat. Spawn excess crew randomly.
	2=SPREAD. Select a module, fill one spawn point in it, move on to the next module, repeat. Spawn excess crew randomly.
	3=RANDOM. Select spawn points completely at random.}
EndGroup

Group TurretProperties CollapsedOnBase
	float property TurretSpawnChance = 0.0 Auto Const
	{DEFAULT=0. Chance that this BE will spawn turrets at all; 0=Never, 1=Always, 0.5=Half the time.}

	float property TurretModulePercentChance = 0.5 Auto Const
	{Default=0.5. If this ship has turrets, what percentage of modules should have them?
	The actual number of turrets in each module will be randomly selected between the Min and Max values for that size of module.}

	GenericCrewDatum property TurretData Auto Const
	{If this ship has turrets, the data for the turrets to spawn.}

	int property TurretsToSpawnMin_Small = 1 Auto Const
	{DEFAULT=1. Min turrets to spawn in a Small module that we select to have turrets.}

	int property TurretsToSpawnMax_Small = 1 Auto Const
	{DEFAULT=1. Min turrets to spawn in a Small module that we select to have turrets.}
	
	int property TurretsToSpawnMin_Large = 2 Auto Const
	{DEFAULT=1. Min turrets to spawn in a Small module that we select to have turrets.}
	
	int property TurretsToSpawnMax_Large = 3 Auto Const
	{DEFAULT=1. Min turrets to spawn in a Small module that we select to have turrets.}

	bool property ShouldTurretsStartUnconscious = False Auto Const
	{DEFAULT=False. If True, spawned turrets will be set unconscious.}

	bool property ShouldTurretsStartFriendlyToPlayer = False Auto Const
	{DEFAULT=False. If True, spawned turrets will be set friendly to the player.}
EndGroup

Group ComputerProperties CollapsedOnBase
	float property GenericComputersEnableChance = 1.0 Auto Const
	{DEFAULT=0. Chance that this BE will enable generic computers if robots and/or turrets have spawned.
	0=Never, 1=Always, 0.5=Half the time.}

	float property GenericComputersModulePercentChance = 0.25 Auto Const
	{DEFAULT=0.5. If we're enabling generic computers, what percentage of modules should have them?}

	int property GenericComputersMax = -1 Auto Const
	{DEFAULT=-1. Maximum number of generic computers to enable. (-1 for no cap.)}

	int property GenericComputerRobotLinkStatus = 0 Auto Const
	{DEFAULT=0. Which Computers should get LinkTerminalRobot links to control their robots?
	0=All Computers
	1=Cockpit Computer Only
	2=No Computers}

	int property GenericComputerTurretLinkStatus = 0 Auto Const
	{DEFAULT=0. Which Computers should get LinkTerminalTurret links to control their robots?
	0=All Computers
	1=Cockpit Computer Only
	2=No Computers}

	bool property ForceEnableCockpitComputer = False Auto Const
	{DEFAULT=False. If True, absolutely always enable the computer in the cockpit.}

	bool property ForceEnableGenericComputers = False Auto Const
	{DEFAULT=False. If True, always enable generic computers, even if we don't have any robots or turrets
	to link them to. Any BE setting this to True is responsible for making sure they have content.}

	bool property ShouldEnableGenericComputerCockpit = True Auto Const
	{DEFAULT=True. If we're enabling Generic Computers, should we always enable the cockpit computer?}

	bool property ShouldPreferGenericComputerThematicModules = True Auto Const
	{DEFAULT=True. If we're enabling Generic Computers, should we always prefer computers in Computer Core
	and Engineering-themed modules, all other restrictions permitting?}

	float property GenericComputerLockPercentChance_Cockpit = 0.0 Auto Const
	{DEFAULT=0.0. Chance that the cockpit's generic computer is locked.}

	float property GenericComputerLockPercentChance_General = 0.5 Auto Const
	{DEFAULT=0.5. Chance that any other generic computer is locked.}

	float property GenericComputerLinkedContainerLockPercentChance = 1.0 Auto Const
	{DEFAULT=1.0. Additional chance that a generic computer's linked container will be locked.
	This is on top of the base chance of locking any given container, and uses the container min and max lock levels.}

	int property GenericComputerLockLevelMin = 1 Auto Const
	{DEFAULT=1. Minimum lock level for generic computers we decide to lock. (1=Novice, 2=Advanced, 3=Expert, 4=Master)}

	int property GenericComputerLockLevelMax = 2 Auto Const
	{DEFAULT=4. Maximum lock level for generic computers we decide to lock. (1=Novice, 2=Advanced, 3=Expert, 4=Master)}
EndGroup

Group ShipProperties CollapsedOnBase
	bool property ShouldSupportCrewCriticalHit Auto Const
	{DEFAULT=False. If True, if a Crew Critical Hit occurs, this ship will decompress and kill its crew. If False, nothing will happen.}

	Hazard property ShipHazard Auto
	{DEFAULT=None. If set, this hazard will be active throughout the ship. SetShipHazard and ClearShipHazard can be used to change or remove it.}

	Hazard[] property PotentialHazards Auto Const
	{Default=None. If set, if ShipHazard is None, a PotentialHazard will be selected at random to become the ShipHazard.}

	float property PotentialHazardChance = 1.0 Auto Const
	{Default=1.0. The chance that one of PotentialHazard's Hazards will be used. The default 1.0 means that if ShipHazard is None and PotentialHazards is filled, one will always be used.}

	bool property ShouldHaveOxygenAtmosphere = True Auto
	{DEFAULT=True. If True, this ship will have a normal atmosphere. If False, the ship will have no oxygen if it is in space or on a planet with no oxygen.}

	float property ShipGravity = -1.0 Auto
	{DEFAULT=-1. If >= 0, Overrides the ship's default gravity. SetShipGravity can be used to change it.}

	float property ShipGravityModPercentChance = 1.0 Auto
	{DEFAULT=1. The chance that ShipGravity's Gravity Override will be used. The default 1.0 means that ShipGravity will always be used, 0.5 would apply it half the time, etc.}

	bool property ShouldOverrideGravityOnlyInSpace = True Auto Const
	{DEFAULT=True. If True, ShipGravity's override will be used for docking encounters, and ignored for landing encounters, which is usually what you want.
	If False, it will be used for both. Use with caution.}

	Faction property OwnerFaction Auto
	{DEFAULT=None. If set, this faction will be set as the owner faction of the ship's interior. Items in the cell will be owned, and taking them will be theft.
	Note that this faction must have the 'Can be owner' flag set on the Faction in order for ownership to work. If set, UseAutomaticOwnershipSystem is ignored.
	If this is initially none, but the automatic ownership system sets a faction as this ship's owner, that faction is forced into OwnerFaction.}

	bool property UseAutomaticOwnershipSystem = True Auto Const
	{DEFAULT=True. If True, if the ship is in one of the factions in BEAutomaticOwnershipFactionList, the ship's interior will be set owned by that faction.}

	bool property ShouldAutoOpenLandingRamp = True Auto Const
	{DEFAULT=True. If True, this ship will automatically open its landing ramp once it has finished landing and spawned disembarking actors (if any).}
	
	bool property PlayHostileAlarmUponBoarding = True Auto Const
	{DEFAULT=True. If True, this ship will play a hostile alarm sound on boarding.}
EndGroup

Group ShipLootAndLockProperties CollapsedOnBase
	bool property ShouldSpawnLoot = True Auto Const
	{DEFAULT=True. Should this BE spawn standard boarding encounter loot in the Captain's Locker on the cockpit/bridge?}

	float property ContainersEnabledPercent = 0.5 Auto Const
	{DEFAULT=True. Percent of generic containers on the ship to enable.}

	bool property ShouldLockDoors = True Auto Const
	{DEFAULT=True. If this ship has doors in its LockableDoors collection, should we lock some of them?
	LockableDoors should contain only optional internal doors on the ship-- doors to loot closets and side rooms that,
	if locked, won't obstruct the critical path to the cockpit-- so locking them should always be safe from that perspective.}

	float property LockPercentChance = 0.5 Auto Const
	{DEFAULT=0.5. If ShouldLockDoors, the percent chance any given door in LockableDoors will be locked (0-1.0).}

	int property LockLevelMin = 1 Auto Const
	{DEFAULT=1. Minimum lock level for doors we decide to lock. (1=Novice, 2=Advanced, 3=Expert, 4=Master)}

	int property LockLevelMax = 2 Auto Const
	{DEFAULT=4. Maximum lock level for doors we decide to lock. (1=Novice, 2=Advanced, 3=Expert, 4=Master)}

	bool property ShouldSpawnContraband = True Auto Const
	{DEFAULT=True. If the ship is part of a qualifying faction, should this BE spawn contraband at small item markers?}

	float property ContrabandChancePercent = 0.5 Auto Const
	{DEFAULT=0.5. Chance that the ship will have any contraband at all, if it's in a qualifying faction.}

	int property ContrabandMin = 1 Auto Const
	{DEFAULT=1. Minimum amount of contraband to be found on the boarded ship. Contraband will not exceed the number of spawn markers or ContrabandMax.}

	int property ContrabandMax = 3 Auto Const
	{DEFAULT=3. Maximum amount of contraband to be found on boarded ship}
EndGroup

Group DisembarkingProperties CollapsedOnBase
	bool property ShouldSetupDisembarkingOnLanding = True Auto Const
	{Default=True. If we have disembarking actors, spawned or placed, should they disembark as soon as the ship lands? If False, you will need to manually trigger disembarking by calling SetupDisembarking.}

	bool property ShouldAddDisembarkersToAllCrew = False Auto Const
	{Default=False. Should we add our disembarking actors, spawned or placed, to the AllCrew RefCollectionAlias?}

	bool property ShouldSpawnDisembarkers = False Auto Const
	{Default=False. Should this BE spawn generic disembarking actors? Only works for Surface BEs; will be ignored for Docking BEs.}

	bool property ShouldForceDisembarkersWeaponsEquipped = False Auto Const
	{Default=False. Should we force disembarkers to wait with weapons equipped?
	 By default, actors in non-civilian factions will have their weapons equipped.
	 This property overrides all other properties and keywords and will be respected.}

	bool property ShouldForceDisembarkersWeaponsUnequipped = False Auto Const
	{Default=False. Should we force disembarkers to wait with weapons unequipped?
	 By default, actors in civilian factions will have their weapons unequipped.
	 This property overrides all other properties and keywords (except Equipped).}

	int property DisembarkersToSpawn = 0 Auto Const
	{If we do want to spawn generic disembarking actors, how many?}

	GenericCrewDatum[] property DisembarkerData Auto ;NOT Const or Mandatory
	{OPTIONAL. When a BE spawns its disembarkers, it cycles through DisembarkerData (if any) until it's spawned the required number of actors, or runs out of actors it can spawn.
	If DisembarkerData=None, it just continues using the remaining actors in CrewData.}
EndGroup

Group BoardingProperties CollapsedOnBase
	bool property ShouldBoardPlayersShip = False Auto Const
	{DEFAULT=False. If true, the enemy ship's crew will attempt to board the player's ship.}

	RefCollectionAlias property GenericBoarders Auto Const
	{Mandatory if ShouldBoardPlayersShip; Optional otherwise.
	RefCollectionAlias to push boarders into. Responsible for packaging them to attack the player's ship.}

	ReferenceAlias property PlayerShipDockingDoor Auto Const
	{Mandatory if ShouldBoardPlayerShip; Optional otherwise.
	The load door in the player's ship leading to the enemy ship.}

	ReferenceAlias property PlayerShipCockpit Auto Const
	{Mandatory if ShouldBoardPlayersShip; Optional otherwise.
	The player's cockpit module.}

	RefCollectionAlias property PlayerShipModulesAll Auto Const
	{Mandatory if ShouldBoardPlayersShip; Optional otherwise.
	RefCollection of all of the modules on the player's ship.}	

	float property MaxPercentOfCrewToBoard = 0.5 Auto Const
	{DEFAULT=0.5. If ShouldBoardPlayersShip, the maximum percentage of the enemy ship's crew that will board the player's ship.
	After MaxPercentOfCrewToBoard have tried to board, the player will have to board the enemy ship to take out the rest-- we don't want
	to completely depopulate it.}

	float property MaxSimultaneousBoardersPercent = 0.5 Auto Const
	{DEFAULT=0.5. If ShouldBoardPlayersShip, a cap on the number of enemies that can board the player's ship simultaneously, expressed as a percentage
	of the player's ship's SpaceshipCrewRating value. This prevents, say 25 pirates from piling into the Frontier.}

	int property MinBoardingWaveSize = 2 Auto Const
	{DEFAULT=2. The minimum wave size for a wave of enemies boarding the player's ship.}

	int property MaxBoardingWaveSize = 6 Auto Const
	{DEFAULT=6. The maximum wave size for a wave of enemies boarding the player's ship.}
EndGroup

Group HeatLeachProperties CollapsedOnBase
	float property HeatLeechChance = 0.0 Auto Const
	{Default=0. Percent chance that random Heat Leeches will spawn on this ship, 0.0-1.0.}

	int property MinHeatLeaches = 1 Auto Const
	{Default=1. If HeatLeechChance > 0 and we do want to spawn Heat Leeches, the minimum number to spawn.}

	int property MaxHeatLeaches = 3 Auto Const
	{Default=3. If HeatLeechChance > 0 and we do want to spawn Heat Leeches, the maximum number to spawn.}
EndGroup

Group BEObjectiveProperties CollapsedOnBase
	bool property ShouldUseBEObjective = True Auto
	{Default=True. Should BE_Objective run for this ship, provided all of the aliases below are filled?}

	Quest property BE_Objective Auto Const Mandatory
	{Autofill: The BE_Objective quest.}

	GlobalVariable property BEObjective_OnceOnly_Global Auto Const Mandatory
	{Autofill: The BEObjective_OnceOnly_Global.}

	GlobalVariable property BEObjective_OnceOnly_DoneGlobal Auto Const Mandatory
	{Autofill: The BEObjective_OnceOnly_DoneGlobal.}

	ReferenceAlias property BEObjective_EnemyShip Auto Const
	{BEObjective's EnemyShip alias. If not filled, BE_Objective will not start.}

	ReferenceAlias property BEObjective_EnemyShipPilotSeat Auto Const
	{BEObjective's EnemyShipPilotSeat alias. If not filled, BE_Objective will not start.}

	ReferenceAlias property BEObjective_EnemyShipLoadDoor Auto Const
	{BEObjective's EnemyShipLoadDoor alias. If not filled, BE_Objective will not start.}

	RefCollectionAlias property BEObjective_AllCrew Auto Const
	{BEObjective's AllCrew alias.}
EndGroup

Group AutofillProperties CollapsedOnBase
	SQ_ParentScript property SQ_Parent Auto Const Mandatory
	REParentScript property RE_Parent Auto Const Mandatory
	ReferenceAlias property PlayerShip Auto Const Mandatory
	ReferenceAlias property EnemyShip Auto Const Mandatory
	ReferenceAlias property ModuleCockpit Auto Const
	ReferenceAlias property Captain Auto Const
	ReferenceAlias property CaptainSpawnMarker Auto Const
	ReferenceAlias property CaptainsLocker Auto Const Mandatory
	ReferenceAlias property LandingDeckControlMarker Auto Const Mandatory
	ReferenceAlias property PlayerShipLoadDoor Auto Const Mandatory
	RefCollectionAlias property AllCrew Auto Const Mandatory
	RefCollectionAlias property AllModules Auto Const Mandatory
	RefCollectionAlias property GenericCrew Auto Const Mandatory
	RefCollectionAlias property GenericCorpses Auto Const Mandatory
	RefCollectionAlias property GenericRobots Auto Const Mandatory
	RefCollectionAlias property GenericTurrets Auto Const Mandatory
	RefCollectionAlias property DisembarkingCrew Auto Const Mandatory
	RefCollectionAlias property EmbarkingCrew Auto Const Mandatory
	RefCollectionAlias property Computers Auto Const Mandatory
	RefCollectionAlias property Containers Auto Const Mandatory
	RefCollectionAlias property LockableDoors Auto Const Mandatory
	RefcollectionAlias property SmallItemSpawnMarkers Auto Const Mandatory
	RefcollectionAlias property Contraband Auto Const Mandatory
	RefCollectionAlias property CrewSpawnMarkers Auto Const Mandatory
	RefCollectionAlias property CombatTargets Auto Const 
	LocationAlias property PlayerShipInteriorLocation Auto Const Mandatory
	LocationAlias property EnemyShipInteriorLocation Auto Const Mandatory
	LocationAlias property EnemyShipExteriorLocation Auto Const Mandatory
	GlobalVariable property BE_ShipCrewSizeSmall Auto Const Mandatory
	GlobalVariable property BE_ShipCrewSizeMedium Auto Const Mandatory
	GlobalVariable property BE_ForceNextGravityOverride Auto Const Mandatory
	Keyword property LinkShipModule Auto Const Mandatory
	Keyword property LinkShipModuleCrewSpawn Auto Const Mandatory
	Keyword property LinkShipModuleTurretSpawn Auto Const Mandatory
	Keyword property LinkShipModuleComputer Auto Const Mandatory
	Keyword property LinkShipLoadDoor Auto Const Mandatory
	Keyword property LinkHazardVolume Auto Const Mandatory
	Keyword property LinkCombatTravelTarget Auto Const Mandatory
	Keyword property LinkTerminalRobot Auto Const Mandatory
	Keyword property LinkTerminalTurret Auto Const Mandatory
	Keyword property LinkTerminalContainer Auto Const Mandatory
	Keyword property BEEncounterTypeDocking Auto Const Mandatory
	Keyword property BEEncounterTypeSurface Auto Const Mandatory
	Keyword property BEMarkerInUseKeyword Auto Const Mandatory
	Keyword property BEBoarderPlayerShipCockpitLink Auto Const Mandatory
	Keyword property BEBoarderPlayerShipModuleLink Auto Const Mandatory
	Keyword property BEDropship Auto Const Mandatory
	Keyword property BEDisembarkerLink Auto Const Mandatory
	Keyword property BEDisembarkerForceWeaponsEquipped Auto Const Mandatory
	Keyword property BEDisembarkerForceWeaponsUnequipped Auto Const Mandatory
	Keyword property BECrewAttackerKeyword Auto Const Mandatory
	Keyword property BECrewDefenderKeyword Auto Const Mandatory
	Keyword property BENoCrewKeyword Auto Const Mandatory
	Keyword property BESurfaceCrewSize_NoCrew Auto Const Mandatory
	Keyword property BENoTakeoverObjectiveKeyword Auto Const Mandatory
	Keyword property BENoAutomaticOwnershipKeyword Auto Const Mandatory
	Keyword property BEHostileBoardingEncounterKeyword Auto Const Mandatory
	Keyword property ActorTypeTurret Auto Const Mandatory
	Keyword property ActorTypeRobot Auto Const Mandatory
	Keyword property ENV_Loc_NotSealedEnvironment Auto Const Mandatory
	Keyword property DynamicallyLinkedDoorTeleportMarkerKeyword Auto Const Mandatory
	Keyword property LootSafeKeyword Auto Const Mandatory
	Keyword property SpaceshipPreventRampOpenOnLanding auto const
	Faction property REPlayerFriend Auto Const Mandatory
	Formlist property BEAutomaticOwnershipFactionList Auto Const Mandatory
	Formlist property BECivilianShipFactionList Auto Const Mandatory
	Formlist property BEContrabandShipFactionList Auto Const Mandatory
	Formlist property BEHazardKeywordList Auto Const
	Formlist property BEHazardFormList Auto Const
	ActorBase property ParasiteA_HeatLeech Auto Const Mandatory
	ActorValue property Aggression Auto Const Mandatory
	ActorValue property Confidence Auto Const Mandatory
	ActorValue property Suspicious Auto Const Mandatory
	ActorValue property SpaceshipCrew Auto Const Mandatory
	ActorValue property SpaceshipCrewRating Auto Const Mandatory
	ActorValue property SpaceshipCriticalHitCrew Auto Const Mandatory
	ActorValue property BEBoarderCapturedModule Auto Const Mandatory
	ActorValue property BEWaitingForLandingRampValue Auto Const Mandatory
	ActorValue property BEDisembarkWithWeaponsDrawnValue Auto Const Mandatory
	LocationRefType property Ship_CrewSpawn_RefType Auto Const Mandatory
	LocationRefType property Ship_TurretSpawn_RefType Auto Const Mandatory
	LocationRefType property Ship_Computer_RefType Auto Const Mandatory
	LocationRefType property Ship_Module_Computer_RefType Auto Const Mandatory
	LocationRefType property Ship_Module_Engineering_RefType Auto Const Mandatory
	LocationRefType property Ship_Module_Small_RefType Auto Const Mandatory
	LocationRefType property Ship_Module_Large_RefType Auto Const Mandatory
	LeveledItem property LL_BE_ShipCaptainsLockerLoot_Small Auto Const Mandatory
	LeveledItem property LL_BE_ShipCaptainsLockerLoot_Medium Auto Const Mandatory
	LeveledItem property LL_BE_ShipCaptainsLockerLoot_Large Auto Const Mandatory
	LeveledItem property Loot_LPI_Contraband_Any Auto Const Mandatory
	SQ_PlayerShipScript property SQ_PlayerShip Auto Const
	WwiseEvent property OBJ_Alarm_BoardingAlert Auto Const
EndGroup

Group DebugProperties
	bool property UseSecondLinkedRefAsCombatTravelTarget = False Auto Const
	bool property ShowTraces = True Auto Const
EndGroup


;Local Consts
int property CONST_SpawnPattern_Fill = 0 Auto Const Hidden
int property CONST_SpawnPattern_Half = 1 Auto Const Hidden
int property CONST_SpawnPattern_Spread = 2 Auto Const Hidden
int property CONST_SpawnPattern_Random = 3 Auto Const Hidden

int property CONST_SpawnPrioritization_None = 0 Auto Const Hidden
int property CONST_SpawnPrioritization_CockpitLargeSmall = 1 Auto Const Hidden

int property CONST_GenericComputerLinkStatus_All = 0 Auto Const Hidden
int property CONST_GenericComputerLinkStatus_CockpitOnly = 1 Auto Const Hidden
int property CONST_GenericComputerLinkStatus_None = 2 Auto Const Hidden

int CONST_BEObjective_Startup = 10 Const
int CONST_BEObjective_KillEnemyCrewObj = 20 Const
int CONST_BEObjective_TakeOverEnemyShipObj = 30 Const
int CONST_BEObjective_LeaveShip = 255 Const


int CONST_Aggression_VeryAggressive = 2 Const
int CONST_Confidence_Foolhardy = 4 Const
int CONST_Suspicious_DetectedActor = 2 Const
int CONST_LockLevel_Inaccessible = 254 Const

int CONST_BoardingUpdateTimerID = 1 Const
float CONST_BoardingUpdateTimerDelay = 4.0 Const
int CONST_TakeoffUpdateTimerID = 2 Const
float CONST_TakeoffUpdateTimerDelay = 2.0 Const

int CONST_WaitUntilInitializedTimeoutDelay = 120 Const


;Local Variables - General
bool hasInitialized
bool hasSpawnedCaptain
bool hasSetupDisembarking
bool hasStartedDisembarking
bool hasPlayerBoardedEnemyShip
bool isReadyForTakeoff

Actor player
Location playerShipInteriorLoc
Location enemyShipInteriorLoc
SpaceshipReference enemyShipRef
ObjectReference enemyShipCockpit
Cell enemyShipCell
Faction enemyShipCrimeFaction
bool isSurfaceEncounter
bool isDropshipEncounter

float crewSizePercent
int genericCrewSize
int crewSuspiciousState
ObjectReference enemyShipHazard
ModuleDatum[] moduleData
ObjectReference[] allCrewSpawnPoints
Actor[] robots
Actor[] turrets
Actor[] BEAliasCorpses
Actor[] HeatLeeches


;Local Variables - Boarding
SpaceshipReference playerShipRef
ObjectReference playerShipDockingDoorRef
ObjectReference playerShipCockpitRef
ObjectReference[] playerShipModulesAllRefs
Actor[] remainingBoarders
Actor[] potentialBoarders
int maxSimultaneousBoarders
bool shouldAbortBoarding

;Local Variables - Disembarking & Embarking
bool disembarkersShouldHaveWeaponsUnequipped
bool hasFinishedSetupDisembarking
bool shouldShutdownOnTakeoff
bool ShouldLandingRampsBeOpenOnLoad

;Guards.
Guard SpaceshipCrewDecrementGuard ProtectsFunctionLogic
Guard BECrewGuard ProtectsFunctionLogic
Guard DisembarkingGuard ProtectsFunctionLogic

;Custom Events
CustomEvent BEAllCrewDead


;---------------------------------------------
;Startup, Shutdown, & Event Handling
;------------------------------------

Event OnQuestStarted()
	;Store off local variables.
	player = Game.GetPlayer()
	playerShipInteriorLoc = PlayerShipInteriorLocation.GetLocation()
	enemyShipInteriorLoc = EnemyShipInteriorLocation.GetLocation()
	enemyShipRef = EnemyShip.GetRef() as SpaceshipReference
	enemyShipCockpit = ModuleCockpit.GetRef() as ObjectReference
	enemyShipCell = enemyShipCockpit.GetParentCell()
	enemyShipCrimeFaction = enemyShipRef.GetCrimeFaction()
	isSurfaceEncounter = enemyShipRef.GetWorldspace() != None
	isDropshipEncounter = enemyShipRef.HasKeyword(BEDropship)
	allCrewSpawnPoints = new ObjectReference[0]
	robots = new Actor[0]
	turrets = new Actor[0]
	BEAliasCorpses = new Actor[0]

	;Basic handling for different encounter types.
	if (isDropshipEncounter)
		;Dropship encounters shut down once they've dropped off their actors, and not before.
		ShutDownOnUnload = False
	Else
		;Standard encounters.
		if (isSurfaceEncounter)
			;For Surface encounters:
			; - Make the exterior landing deck hatch accessible.
			if (ShowTraces)
				Debug.Trace(Self + " OnStoryScript set exterior load door for " + enemyShipRef + " accessible.")
			EndIf
			enemyShipRef.SetExteriorLoadDoorInaccessible(False)
		EndIf
		;If this is a hostile boarding encounter, set the enemy crew Suspicious, and flag the location as hostile for dialogue conditions.
		if (ShouldCrewStartInCombat) && (!isSurfaceEncounter)
			crewSuspiciousState = CONST_Suspicious_DetectedActor
			enemyShipRef.AddKeyword(BEHostileBoardingEncounterKeyword)
		EndIf
	EndIf

	;Register for events.
	RegisterForRemoteEvent(player, "OnLocationChange")
	RegisterForRemoteEvent(enemyShipCockpit, "OnCellLoad")
	RegisterForRemoteEvent(enemyShipRef, "OnLoad")
	RegisterForCustomEvent(SQ_PlayerShip, "SQ_PlayerShipChanged")
	if (ShouldSupportCrewCriticalHit && !isSurfaceEncounter && !CheckForCrewCriticalHit())
		RegisterForActorValueChangedEvent(enemyShipRef, SpaceshipCriticalHitCrew)
	EndIf
	if (ShutDownOnUndock)
		RegisterForRemoteEvent(enemyShipRef, "OnShipUndock")
	EndIf
	if (ShutDownOnUnload)
		RegisterForRemoteEvent(enemyShipRef, "OnUnload")
	EndIf

	;Clear the landing zone for landing ships.
	if (isSurfaceEncounter)
		SQ_PlayerShip.ClearLandingZone(enemyShipRef)
	EndIf
	
	if (!isDropshipEncounter)
		;Assemble our module metadata.
		BuildModuleData()

		;Set ownership.
		if (OwnerFaction != None)
			enemyShipCell.SetFactionOwner(OwnerFaction)
		ElseIf (UseAutomaticOwnershipSystem && (!enemyShipRef.HasKeyword(BENoAutomaticOwnershipKeyword)))
			Faction[] ownerFactions = BEAutomaticOwnershipFactionList.GetArray() as Faction[]
			bool ownerFound
			int i = 0
			While (!ownerFound && (i < ownerFactions.Length))
				if (enemyShipRef.IsInFaction(ownerFactions[i]))
					enemyShipCell.SetFactionOwner(ownerFactions[i])
					OwnerFaction = ownerFactions[i]
					ownerFound = True
				EndIf
				i = i + 1
			EndWhile
		EndIf
		if (OwnerFaction != None)
			enemyShipCell.SetOffLimits(True)
		EndIf

		;Spawn actors.
		float baseCrewSize = enemyShipRef.GetBaseValue(SpaceshipCrew)
		float currentCrewSize = enemyShipRef.GetValue(SpaceshipCrew)
		crewSizePercent = currentCrewSize / baseCrewSize
		if (ShouldSpawnCrew && (CrewData != None))
			genericCrewSize = SetupGenericCrew(CrewData, CrewCountPercent, CrewCountOverride, CrewSpawnPattern, CONST_SpawnPrioritization_CockpitLargeSmall, False)
			;Make sure SpaceshipCrew doesn't exceed the number of living crew we were actually able to spawn.
			int spaceshipCrewValue = enemyShipRef.GetValue(SpaceshipCrew) as int
			if (genericCrewSize < spaceshipCrewValue)
				if (ShowTraces)
					Debug.Trace(Self + " OnStoryScript is reducing SpaceshipCrew from " + spaceshipCrewValue + " to " + genericCrewSize + ", the number we were actually able to spawn.")
				EndIf
				float crewLost = Math.Max(spaceshipCrewValue-genericCrewSize,0)
				enemyShipRef.ModValue(SpaceShipCrew, -crewLost)
			EndIf
		EndIf
		if (ShouldSpawnCorpses)
			if (CorpseData == None)
				CorpseData = CrewData
			EndIf
			if (CorpseData != None)
				SetupGenericCrew(CorpseData, CorpseCountPercent, CorpseCountOverride, CorpseSpawnPattern, CONST_SpawnPrioritization_None, True)
			EndIf
		EndIf
		if ((TurretData != None) && (TurretSpawnChance > 0) && (TurretModulePercentChance > 0) && (Utility.RandomFloat(0, 1) < TurretSpawnChance))
			int turretsSpawned = SetupTurrets()
			enemyShipRef.ModValue(SpaceShipCrew, turretsSpawned)
		EndIf
		if ((HeatLeechChance > 0) && (Utility.RandomFloat(0, 1) < HeatLeechChance))
			SetupHeatLeeches()
		EndIf

		;Set up hazards.
		Keyword[] hazardKeywords = BEHazardKeywordList.GetArray() as Keyword[]
		Hazard[] hazardType = BEHazardFormList.GetArray() as Hazard[]
		int i = 0
		bool hazardChosen = false
		While (i < hazardKeywords.Length) && (hazardChosen == false)
			if (enemyShipRef.HasKeyword(hazardKeywords[i]))
				ShipHazard = hazardType[i]
				hazardChosen = true
			EndIf
			i = i + 1
		EndWhile
		if ((ShipHazard == None) && (PotentialHazards != None) && (PotentialHazards.Length > 0) && (Utility.RandomFloat(0, 1) < PotentialHazardChance))
			ShipHazard = PotentialHazards[Utility.RandomInt(0, PotentialHazards.Length-1)]
		EndIf
		if (ShipHazard != None)
			SetShipHazard(ShipHazard)
		EndIf

		;Set up no-Oxygen environment.
		if (!ShouldHaveOxygenAtmosphere)
			enemyShipInteriorLoc.AddKeyword(ENV_Loc_NotSealedEnvironment)
		EndIf

		;Mod gravity.
		if ((ShipGravity >= 0) && (ShipHazard == None))
			if ((ShipGravityModPercentChance < 0) || (ShipGravityModPercentChance >= 1) || (Utility.RandomFloat(0, 1) < ShipGravityModPercentChance))
				Debug.Trace(Self + " OnStoryScript ShipGravityModPercentChance proc'd. Setting gravity to " + ShipGravity)
				SetShipGravity(ShipGravity)
			ElseIf ((BE_ForceNextGravityOverride != None) && (BE_ForceNextGravityOverride.GetValue() >= 0))
				Debug.Trace(Self + " OnStoryScript is forcing gravity to " + BE_ForceNextGravityOverride + " because the global was set.")
				SetShipGravity(BE_ForceNextGravityOverride.GetValue())
				BE_ForceNextGravityOverride.SetValue(-1)
			Else
				SetShipGravity(1)
			EndIf
		EndIf
		
		;Check whether a Crew Critical Hit has occurred.
		if (CheckForCrewCriticalHit())
			DecompressShipAndKillCrew()
		EndIf

		;Disable containers and lock safes.
		ObjectReference[] containerRefs = CommonArrayFunctions.CopyAndRandomizeObjArray(Containers.GetArray())
		int containerDisableCount = (containerRefs.Length * (1-ContainersEnabledPercent)) as int
		i = 0
		While (i < containerRefs.Length)
			if (i < containerDisableCount)
				containerRefs[i].DisableNoWait()
			ElseIf (containerRefs[i].HasKeyword(LootSafeKeyword))
				containerRefs[i].Lock()
				containerRefs[i].SetLockLevel(Utility.RandomInt(LockLevelMin, LockLevelMax) * 25)
			EndIf
			i = i + 1
		EndWhile

		;Spawn contraband.
		if (ShouldSpawnContraband)
			float RandomFloat = Utility.RandomFloat()
			if (RandomFloat <= ContrabandChancePercent)
				;Determine if this is a contraband ship.
				Faction[] contrabandShipFactions = BEContrabandShipFactionList.GetArray() as Faction[]
				i = 0
				bool contrabandFactionFound = false
					While (i < contrabandShipFactions.Length) && (contrabandFactionFound == false)
						if (enemyShipRef.IsInFaction(contrabandShipFactions[i]))
							SpawnContraband()
							contrabandFactionFound = true
						EndIf
					i = i + 1
					EndWhile
			Endif
		EndIf

		;Lock lockable doors.
		if (ShouldLockDoors)
			i = 0
			While (i < LockableDoors.GetCount())
				if (Utility.RandomFloat() < LockPercentChance)
					ObjectReference currentDoor = LockableDoors.GetAt(i)
					currentDoor.Lock()
					currentDoor.SetLockLevel(Utility.RandomInt(LockLevelMin, LockLevelMax) * 25)
				EndIf
				i = i + 1
			EndWhile
		EndIf

		;Enable, link up, and lock computers.
		SetupComputers()
	EndIf

	;Spawn or set up disembarking actors, if desired.
	if (isSurfaceEncounter)
		;Are there any placed actors we want to disembark?
		ObjectReference[] myDisembarkers = enemyShipRef.GetRefsLinkedToMe(BEDisembarkerLink)
		if (ShowTraces)
			Debug.Trace(Self + " Surface Encounter: enemyShipRef=" + enemyShipRef + " myDisembarkers=" + myDisembarkers)
		EndIf
		DisembarkingCrew.AddArray(myDisembarkers)

		;Do we want to spawn any actors to disembark?
		if (ShouldSpawnDisembarkers)
			if (DisembarkerData == None)
				DisembarkerData = CrewData
			EndIf
			SpawnGenericActors(DisembarkerData, DisembarkersToSpawn, None, False, True)
		EndIf

		;Should the disembarkers have their weapons equipped or unequipped?
		if (ShouldForceDisembarkersWeaponsEquipped)
			disembarkersShouldHaveWeaponsUnequipped = 0
		ElseIf (ShouldForceDisembarkersWeaponsUnequipped)
			disembarkersShouldHaveWeaponsUnequipped = 1
		ElseIf (enemyShipRef.HasKeyword(BEDisembarkerForceWeaponsUnequipped))
			disembarkersShouldHaveWeaponsUnequipped = 0
		ElseIf (enemyShipRef.HasKeyword(BEDisembarkerForceWeaponsEquipped))
			disembarkersShouldHaveWeaponsUnequipped = 1
		Else
			;Determine if this is a civilian ship.
			if (OwnerFaction != None)
				disembarkersShouldHaveWeaponsUnequipped = BECivilianShipFactionList.Find(OwnerFaction) >= 0
			Else
				Faction[] civilianShipFactions = BECivilianShipFactionList.GetArray() as Faction[]
				int i = 0
				While (!disembarkersShouldHaveWeaponsUnequipped && (i < civilianShipFactions.Length))
					if (enemyShipRef.IsInFaction(civilianShipFactions[i]))
						disembarkersShouldHaveWeaponsUnequipped = True
					EndIf
					i = i + 1
				EndWhile
			EndIf
		EndIf

		if (ShouldSetupDisembarkingOnLanding)
			RegisterForRemoteEvent(enemyShipRef, "OnShipLanding")
			RegisterForRemoteEvent(enemyShipRef, "OnShipRampDown")
			SetupDisembarking()
		Else
			RegisterForRemoteEvent(enemyShipRef, "OnShipLanding")
			if (ShouldAutoOpenLandingRamp && enemyShipRef.IsLanded()) 
				SetEnemyShipLandingRampsOpenState(ShouldAutoOpenLandingRamp)
			EndIf
		EndIf
	EndIf

	;Begin the boarding process, if desired.
	if (ShouldBoardPlayersShip)
		;Set up the local variables for boarding.
		playerShipRef = PlayerShip.GetRef() as SpaceshipReference
		playerShipDockingDoorRef = PlayerShipDockingDoor.GetRef()
		playerShipCockpitRef = PlayerShipCockpit.GetRef()
		playerShipModulesAllRefs = PlayerShipModulesAll.GetArray()
		maxSimultaneousBoarders = Math.Max(Math.Round(playerShipRef.GetValue(SpaceshipCrewRating) * MaxSimultaneousBoardersPercent), MinBoardingWaveSize) as int

		;Build the Remaining Boarders array. The actors who will be boarders are pulled from the end of the Generic Crew list to
		;maintain the CrewSpawnPattern as much as possible. For example, in a ship whose crew spawned with CONST_SpawnPattern_Fill,
		;pulling from the end of the list means we'll depopulate some rooms while leaving other rooms full. We'll also pull actors
		;from the cockpit last, since they were spawned first.
		int remainingBoardersCount = Math.Round(GenericCrew.GetCount() * MaxPercentOfCrewToBoard) as int
		int potentialBoardersCount = GenericCrew.GetCount() - remainingBoardersCount
		remainingBoarders = new Actor[remainingBoardersCount]
		potentialBoarders = new Actor[potentialBoardersCount]
		int i = GenericCrew.GetCount()-1
		While ((i >= 0) && (remainingBoardersCount > 0))
			remainingBoarders[remainingBoardersCount-1] = GenericCrew.GetAt(i) as Actor
			remainingBoardersCount = remainingBoardersCount - 1
			i = i - 1
		EndWhile
		While ((i >= 0) && (potentialBoardersCount > 0))
			potentialBoarders[potentialBoardersCount-1] = GenericCrew.GetAt(i) as Actor
			potentialBoardersCount = potentialBoardersCount - 1
			i = i - 1
		EndWhile
	EndIf

	;We've finished setting up. Other functions are now free to use the BE_Crew array.
	hasInitialized = True

	;Check whether docking is complete. If so, begin boarding now. If not, register for OnShipDock with abComplete=True, and do it then.
	if (ShouldBoardPlayersShip)
		RegisterForRemoteEvent(enemyShipRef, "OnShipDock")
		if (enemyShipRef.IsDocked())
			UnregisterForRemoteEvent(enemyShipRef, "OnShipDock")
			UpdateBoarding()
		EndIf
	EndIf

	;Register for SQ_ParentScript's force-shutdown event.
	RegisterForCustomEvent(SQ_Parent, "SQ_BEForceStop")

	;Notify SQ_ParentQuest that a BE has started, so other quests interested in this ship can interact with it.
	SQ_Parent.SendBEStartedEvent(enemyShipRef, Self)

	;And we're done setting up.`
	if (ShowTraces)
		Debug.Trace("BEScript: Finished starting BE " + Self + " for " + enemyShipRef)
	EndIf
EndEvent

Function BuildModuleData()
	ObjectReference[] modulesWithCrew = AllModules.GetArray()
	float startTime = Utility.GetCurrentRealTime()
	int i = 0
	While (i < modulesWithCrew.Length)
		if (modulesWithCrew[i].HasKeyword(BENoCrewKeyword) || (!modulesWithCrew[i].HasLocRefType(Ship_Module_Small_RefType) && (modulesWithCrew[i] != enemyShipCockpit)))
			modulesWithCrew.Remove(i)
			i = i - 1
		EndIf
		i = i + 1
	EndWhile
	moduleData = new ModuleDatum[modulesWithCrew.Length]
	i = 0
	While (i < moduleData.Length)
		ObjectReference currentModuleRef = modulesWithCrew[i]
		ObjectReference[] crewSpawnRefs = currentModuleRef.GetRefsLinkedToMe(LinkShipModuleCrewSpawn)
		ObjectReference[] turretSpawnRefs = currentModuleRef.GetRefsLinkedToMe(LinkShipModuleTurretSpawn)
		ObjectReference[] computerRefs = currentModuleRef.GetRefsLinkedToMe(LinkShipModuleComputer)
		ModuleDatum currentModuleData = new ModuleDatum
		currentModuleData.moduleRef = currentModuleRef
		if (crewSpawnRefs.Length >= 1)
			currentModuleData.shipCrewSpawnMarkerRef01 = crewSpawnRefs[0]
			if (crewSpawnRefs.Length >= 2)
				currentModuleData.shipCrewSpawnMarkerRef02 = crewSpawnRefs[1]
				if (crewSpawnRefs.Length >= 3)
					currentModuleData.shipCrewSpawnMarkerRef03 = crewSpawnRefs[2]
					if (crewSpawnRefs.Length >= 4)
						currentModuleData.shipCrewSpawnMarkerRef04 = crewSpawnRefs[3]
						if (crewSpawnRefs.Length >= 5)
							currentModuleData.shipCrewSpawnMarkerRef05 = crewSpawnRefs[4]
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
		int j = 0
		While (j < crewSpawnRefs.Length)
			allCrewSpawnPoints.Add(crewSpawnRefs[j])
			j = j + 1
		EndWhile
		if (turretSpawnRefs.Length >= 1)
			currentModuleData.shipTurretSpawnMarkerRef01 = turretSpawnRefs[0]
			if (turretSpawnRefs.Length >= 2)
				currentModuleData.shipTurretSpawnMarkerRef02 = turretSpawnRefs[1]
				if (turretSpawnRefs.Length >= 3)
					currentModuleData.shipTurretSpawnMarkerRef03 = turretSpawnRefs[2]
					if (turretSpawnRefs.Length >= 4)
						currentModuleData.shipTurretSpawnMarkerRef04 = turretSpawnRefs[3]
						if (turretSpawnRefs.Length >= 5)
							currentModuleData.shipTurretSpawnMarkerRef05 = turretSpawnRefs[4]
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
		if (computerRefs.Length >= 1)
			currentModuleData.shipComputerRef = computerRefs[0]
		EndIf
		moduleData[i] = currentModuleData
		i = i + 1
	EndWhile
	if (allCrewSpawnPoints.Length == 0)
		Debug.Trace("WARN: " + Self + " allCrewSpawnPoints was empty. As a fallback, filling with any available markers.", 1)
		allCrewSpawnPoints = CrewSpawnMarkers.GetArray()
	EndIf
	Debug.Trace("BEScript: BuildModuleData completed in " + (Utility.GetCurrentRealTime() - startTime))
	Debug.Trace("--------------")
	modulesWithCrew = AllModules.GetArray()
	Debug.Trace("--------------")
EndFunction

;If we want to use BE_Objective, start or stop it OnLocationChange.
;We could start it OnCellLoad, instead, but this is cleaner because there's no equivalent unload event on which to stop it.
Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
	if (akSource == Game.GetPlayer())
		if (akNewLoc == enemyShipInteriorLoc)
			;Start BE_Objective, if appropriate.
			if (ShouldUseBEObjective)
				;Don't start BE_Objective if the enemy ship has BENoTakeoverObjectiveKeyword or BESurfaceCrewSize_NoCrew.
				;Don't start BE_Objective if it was set to Once Only and has been done.
				;Don't start BE_Objective if any of our required aliases are missing.
				if (enemyShipRef.HasKeyword(BENoTakeoverObjectiveKeyword))
					Debug.Trace("BEScript: BE_Objective is not starting because " + enemyShipRef + " has BENoTakeoverObjectiveKeyword.")  
					ShouldUseBEObjective = False
				ElseIf (enemyShipRef.HasKeyword(BESurfaceCrewSize_NoCrew))
					Debug.Trace("BEScript: BE_Objective is not starting because " + enemyShipRef + " has BESurfaceCrewSize_NoCrew.")  
					ShouldUseBEObjective = False
				ElseIf ((BEObjective_OnceOnly_Global.GetValue() == 1) && (BEObjective_OnceOnly_DoneGlobal.GetValue() == 1))
					Debug.Trace("BEScript: BE_Objective is not starting because the player has taken over a ship before.")
					ShouldUseBEObjective = False
				ElseIf ((BEObjective_EnemyShip == None) || (BEObjective_EnemyShipPilotSeat == None) || (BEObjective_EnemyShipLoadDoor == None) || (BEObjective_AllCrew == None))
					Debug.Trace("BEScript: BE_Objective is not starting because an objective alias was not filled.")
					ShouldUseBEObjective = False
				Else
					;Try to fill BE_Objective's aliases.
					BE_Objective.SetStage(CONST_BEObjective_Startup)
					BEObjective_EnemyShip.ForceRefTo(enemyShipRef)
					BEObjective_EnemyShip.RefillDependentAliases()
					;Check whether we failed to fill our Pilot Seat or Load Door aliases.
					;If so, something unusual is going on, and we can't display useful objectives. Abort and let this BE handle it.
					if ((BEObjective_EnemyShipPilotSeat.GetRef() == None) || (BEObjective_EnemyShipLoadDoor.GetRef() == None))
						ShouldUseBEObjective = False
					Else
						if (enemyShipRef.GetValue(SpaceshipCrew) > 0)
							;If we have living crew, add them to BEObjective_AllCrew so we can display quest targets to them.
							int i = 0
							While (i < AllCrew.GetCount())
								Actor current = AllCrew.GetAt(i) as Actor
								if (!current.IsDead())
									BEObjective_AllCrew.AddRef(current)
								EndIf
								i = i + 1
							EndWhile
							if (BEObjective_AllCrew.GetCount() == 0)
								Debug.Trace("ERROR: BEScript: " + enemyShipRef + " has a SpaceshipCrew > 0, but no living crew actors were found. This should never happen.", 2)
							EndIf
						EndIf
						if (BEObjective_AllCrew.GetCount() > 0)
							(BEObjective_EnemyShipPilotSeat as BEObjectiveBlockPilotSeatScript).BlockTakeover(Self)
							BE_Objective.SetStage(CONST_BEObjective_KillEnemyCrewObj)
							Debug.Trace("BEScript: BE_Objective started at stage " + CONST_BEObjective_KillEnemyCrewObj)
						Else
							if (ShipGravity < 1)
								(BEObjective_EnemyShipPilotSeat as BEObjectiveBlockPilotSeatScript).BlockTakeover(Self)
							EndIf
							BE_Objective.SetStage(CONST_BEObjective_TakeOverEnemyShipObj)
							Debug.Trace("BEScript: BE_Objective started at stage " + CONST_BEObjective_TakeOverEnemyShipObj)
						EndIf
					EndIf
				EndIf
			EndIf
		ElseIf (akOldLoc == enemyShipInteriorLoc)
			;Stop BE_Objective, if appropriate.
			if (ShouldUseBEObjective)
				BE_Objective.SetStage(CONST_BEObjective_LeaveShip)
			EndIf
		EndIf
	EndIf
EndEvent


;Register alias-spawned actors with the quest and add them to the crew.
Function RegisterBEAliasActor(Actor BEAliasActor, bool startsDead, bool shouldIncludeInCrew, bool shouldIncludeAtFrontOfBoardingParty, bool shouldIncludeAtBackOfBoardingParty)
	;RegisterBEAliasActor calls block until BEScript has finished initializing.
	WaitUntilInitialized()
	LockGuard BECrewGuard
		if (startsDead)
			;If this actor is supposed to start dead, force-kill them when we can.
			BEAliasCorpses.Add(BEAliasActor)
			if (BEAliasActor.Is3DLoaded())
				RE_Parent.KillWithForceNoWait(BEAliasActor)
			EndIf
		Else
			;Otherwise, register for their death event.
			RegisterForRemoteEvent(BEAliasActor, "OnDying")
		EndIf
		if (AllCrew.Find(BEAliasActor) < 0)
			;If this was an alias-created actor (not created by the generic crew system)...
			;If this actor is supposed to count as part of the ship's crew, add them.
			if (shouldIncludeInCrew)
				;All actors who we want to count as part of the crew, and who aren't already dying or dead, are added to AllCrew.
				if (!startsDead && !BEAliasActor.IsDead())
					AllCrew.AddRef(BEAliasActor)
					if (ShouldUseBEObjective && (BEObjective_EnemyShip.GetRef() == enemyShipRef))
						BEObjective_AllCrew.AddRef(BEAliasActor)
					EndIf
					BEAliasActor.AddKeyword(BECrewDefenderKeyword)
				EndIf
				;Set their suspicious state to match the generic crew.
				BEAliasActor.SetValue(Suspicious, crewSuspiciousState)
				;Link them to the robot array if needed.
				if (BEAliasActor.HasKeyword(ActorTypeRobot))
					if (robots.Length > 0)
						robots[robots.Length-1].SetLinkedRef(BEAliasActor, LinkTerminalRobot)
					EndIf
					robots.Add(BEAliasActor)
				EndIf
				;If we now have too many actors in the crew, remove one of the generic crew members
				;spawned on startup and replace them with this actor.
				if (AllCrew.GetCount() > genericCrewSize)
					Actor crewToReplace
					if (!ShouldBoardPlayersShip)
						if (GenericCrew.GetCount() > 0)
							crewToReplace = GenericCrew.GetAt(GenericCrew.GetCount() - 1) as Actor
						EndIf
					ElseIf (ShouldBoardPlayersShip && potentialBoarders.Length > 0)
						crewToReplace = potentialBoarders[potentialBoarders.Length - 1]
						potentialBoarders.Remove(potentialBoarders.Length - 1)
					ElseIf (ShouldBoardPlayersShip && remainingBoarders.Length > 0)
						crewToReplace = remainingBoarders[remainingBoarders.Length - 1]
						remainingBoarders.Remove(remainingBoarders.Length - 1)
						Debug.Trace("WARN: RegisterBEAliasActor was forced to remove a boarding actor. This may result in a BEAlias actor being deleted unexpectedly. If this occurs, adjust your minimum crew size or MaxPercentOfCrewToBoard.", 1)
					EndIf
					if (crewToReplace != None)
						GenericCrew.RemoveRef(crewToReplace)
						AllCrew.RemoveRef(crewToReplace)
						if (ShouldUseBEObjective && (BEObjective_EnemyShip.GetRef() == enemyShipRef))
							BEObjective_AllCrew.RemoveRef(crewToReplace)
						EndIf
						crewToReplace.DisableNoWait()
					EndIf
				EndIf
			EndIf
		EndIf
		;If this actor is supposed to be in the boarding party, add them.
		if (ShouldBoardPlayersShip && (remainingBoarders != None))
			if (shouldIncludeAtFrontOfBoardingParty)
				remainingBoarders.Insert(BEAliasActor, 0)
			ElseIf (shouldIncludeAtBackOfBoardingParty)
				remainingBoarders.Add(BEAliasActor)
			EndIf
		EndIf
	EndLockGuard
EndFunction

Event OnTimer(int timerID)
	if (timerID == CONST_BoardingUpdateTimerID)
		UpdateBoarding()
	ElseIf (timerID == CONST_TakeoffUpdateTimerID)
		UpdateTakeoff()
	EndIf
EndEvent


Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
	;Do we need to decrement SpaceshipCrew when this actor dies?
	TryToDecrementSpaceshipCrew(akSender, False)
	;If we're boarding the player's ship, and this actor was one of the boarders, remove them from GenericBoarders.
	if (GenericBoarders != None)
		if (GenericBoarders.Find(akSender) >= 0)
			GenericBoarders.RemoveRef(akSender)
		EndIf
	EndIf
	;Print a trace notification.
	if (ShowTraces)
		Debug.Trace(Self + " Crew Member:" + akSender + " died. SpaceShipCrew=" + enemyShipRef.GetValue(SpaceshipCrew))
	EndIf
EndEvent

Function RemoveHackedActors(Actor[] actorsToRemove)
	int i = 0
	While (i < actorsToRemove.Length)
		Actor currentActor = actorsToRemove[i]
		TryToDecrementSpaceshipCrew(currentActor, True)
		;Print a trace notification.
		if (ShowTraces)
			Debug.Trace(Self + " RemoveHackedActors: Removed " + currentActor + " SpaceShipCrew=" + enemyShipRef.GetValue(SpaceshipCrew))
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function TryToDecrementSpaceshipCrew(Actor actorToProcess, bool omitIfDead)
	LockGuard(SpaceshipCrewDecrementGuard)
		if ((AllCrew.Find(actorToProcess) >= 0) && (!omitIfDead || !actorToProcess.IsDead()))
			enemyShipRef.ModValue(SpaceshipCrew, -1)
			if (enemyShipRef.GetValue(SpaceshipCrew) <= 0)
				if (StageToSetWhenAllCrewDead >= 0)
					SetStage(StageToSetWhenAllCrewDead)
				EndIf
				SendCustomEvent("BEAllCrewDead", None)
			EndIf
		EndIf
	EndLockGuard
EndFunction


;Handle the player disabling or converting robots or turrets.
;If they do, they no longer count as actors that need to be defeated in order to secure the ship.
Event SQ_ParentScript.SQ_NativeTerminalActor_Unconscious(SQ_ParentScript source, Var[] akArgs)
	Actor targetActor = akArgs[1] as Actor
	if (robots.Find(targetActor) >= 0)
		RemoveHackedActors(robots)
	ElseIf (turrets.Find(targetActor) >= 0)
		RemoveHackedActors(turrets)
	EndIf
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Ally(SQ_ParentScript source, Var[] akArgs)
	Actor targetActor = akArgs[1] as Actor
	if (robots.Find(targetActor) >= 0)
		RemoveHackedActors(robots)
	ElseIf (turrets.Find(targetActor) >= 0)
		RemoveHackedActors(turrets)
	EndIf
EndEvent

Event SQ_ParentScript.SQ_NativeTerminalActor_Frenzy(SQ_ParentScript source, Var[] akArgs)
	Actor targetActor = akArgs[1] as Actor
	if (robots.Find(targetActor) >= 0)
		RemoveHackedActors(robots)
	ElseIf (turrets.Find(targetActor) >= 0)
		RemoveHackedActors(turrets)
	EndIf
EndEvent

Event OnActorValueChanged(ObjectReference source, ActorValue akActorValue)
	if ((source == enemyShipRef) && (akActorValue == SpaceshipCriticalHitCrew) && CheckForCrewCriticalHit())
		UnregisterForActorValueChangedEvent(enemyShipRef, SpaceshipCriticalHitCrew)
		DecompressShipAndKillCrew()
	EndIf
EndEvent

Event SpaceshipReference.OnShipDock(SpaceshipReference source, bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
	if (abComplete && ShouldBoardPlayersShip)
		UnregisterForRemoteEvent(enemyShipRef, "OnShipDock")
		UpdateBoarding()
	EndIf
EndEvent

Event SpaceshipReference.OnShipLanding(SpaceshipReference source, bool abComplete)
	if (abComplete)
		if (ShouldSetupDisembarkingOnLanding)
			SetupDisembarking()
		ElseIf (ShouldAutoOpenLandingRamp)
			SetEnemyShipLandingRampsOpenState(True)
		EndIf
	EndIf
EndEvent

Event SpaceshipReference.OnShipRampDown(SpaceshipReference source)
	SetupDisembarking()
EndEvent

Event SpaceshipReference.OnShipUndock(SpaceshipReference source, bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)
	;If the two ships undock for any reason, abort boarding.
	shouldAbortBoarding = True
	;If undocking is complete, and we want to shut down on undock, do so.
	if (abComplete && ShutDownOnUndock)
		if (ShowTraces)
			Debug.Trace(Self + " shutting down on OnShipUndock.")
		EndIf
		CleanupAndStop()
	EndIf
EndEvent

Event ObjectReference.OnUnload(ObjectReference source)
	if (ShutDownOnUnload)
		if (ShowTraces)
			Debug.Trace(Self + " shutting down on OnUnload.")
		EndIf
		CleanupAndStop()
	EndIf
EndEvent

Event SQ_PlayerShipScript.SQ_PlayerShipChanged(SQ_PlayerShipScript source, Var[] akArgs)
	if ((akArgs[0] as SpaceshipReference) == enemyShipRef)
		;Clean up the ship.
		SetShipGravity(1)
		SetShipHasOxygen(True)
		enemyShipCell.SetFactionOwner(None)
		enemyShipCell.SetOffLimits(False)
		enemyShipRef.RemoveKeyword(BEHostileBoardingEncounterKeyword)
		Debug.Trace(Self + " cleaned up on takeover.")
		;Then shut down, if we want to do that.
		if (ShutDownOnTakeover)
			if (ShowTraces)
				Debug.Trace(Self + " shutting down on takeover.")
			EndIf
			CleanupAndStop()
		EndIf
	EndIf
EndEvent

Event SQ_ParentScript.SQ_BEForceStop(SQ_ParentScript akSource, Var[] akArgs)
	if (ShowTraces)
		Debug.Trace(Self + " shutting down; FORCE STOP.")
	EndIf
	CleanupAndStop()
EndEvent

Function CleanupAndStop()
	;Clear all local variables.
	playerShipInteriorLoc = None
	enemyShipInteriorLoc = None
	enemyShipRef = None
	enemyShipCockpit = None
	enemyShipCell = None
	enemyShipHazard = None
	moduleData = None
	robots = None
	turrets = None
	BEAliasCorpses = None
	HeatLeeches = None
	playerShipRef = None
	playerShipDockingDoorRef = None
	playerShipCockpitRef = None
	playerShipModulesAllRefs = None
	remainingBoarders = None
	potentialBoarders = None

	;Then stop.
	Stop()
EndFunction


;---------------------------------------------
;Generic Crew System
;--------------------

;Set up and spawn Generic Crew or Generic Crew Corpses.
int Function SetupGenericCrew(GenericCrewDatum[] actorData, float countPercent, int countOverride, int spawnPattern, int spawnPrioritization, bool isSpawningCorpses=False)
	;How many actors should we spawn?
	int actorsToSpawn
	if (countOverride >= 0)
		actorsToSpawn = countOverride
	ElseIf (!isSpawningCorpses)
		actorsToSpawn = Math.Max(0, enemyShipRef.GetValue(SpaceShipCrew) * countPercent * crewSizePercent) as int
		;If we've wound up with zero crew, make sure that's -really- what we wanted, and not just a rounding error.
		if (actorsToSpawn == 0)
			if (enemyShipRef.GetValue(SpaceShipCrew) == 0)
				if (ShowTraces)
					Debug.Trace("WARN: " + Self + " spawning 0 living crew because SpaceshipCrew=0.", 1)
				EndIf
			ElseIf (countPercent == 0)
				if (ShowTraces)
					Debug.Trace("WARN: " + Self + " spawning 0 living crew because countPercent=0.", 1)
				EndIf
			ElseIf (crewSizePercent == 0)
				if (ShowTraces)
					Debug.Trace("WARN: " + Self + " spawning 0 living crew because crewSizePercent=0.", 1)
				EndIf
			Else
				;None of our inputs was actually 0, we just had a rounding error. Force the crew size to 1 instead.
				actorsToSpawn = 1
				if (ShowTraces)
					Debug.Trace("WARN: " + Self + " forcing 1 living crew to avoid a rounding error.", 1)
				EndIf
			EndIf
		EndIf
	Else ;isSpawningCorpses
		actorsToSpawn = Math.Max(0, (enemyShipRef.GetBaseValue(SpaceShipCrew) - enemyShipRef.GetValue(SpaceShipCrew)) * countPercent) as int
	EndIf

	;Where should we spawn them?
	ObjectReference[] spawnPoints = SelectSpawnPoints(actorsToSpawn, spawnPattern, spawnPrioritization)
	;Have we found too few spawn points?
	if (spawnPoints.Length < actorsToSpawn)
		if (ShowTraces)
			Debug.Trace("WARN: " + Self + " was asked to spawn " + actorsToSpawn + " actors, but could only find " + spawnPoints.Length + " spawn points. isSpawningCorpses=" + isSpawningCorpses, 1)
		EndIf
		;If so, we can only spawn as many actors as spawn points...
		actorsToSpawn = spawnPoints.Length
		;...plus the Captain, who always has a spawn point.
		if (ShouldSpawnCaptain && !hasSpawnedCaptain && (Captain.GetRef() == None))
			actorsToSpawn = actorsToSpawn + 1
		EndIf
	EndIf

	;Spawn them.
	int genericCrewSpawned = SpawnGenericActors(actorData, actorsToSpawn, spawnPoints, isSpawningCorpses, False)
	return genericCrewSpawned
EndFunction

;Set up and spawn turrets.
int Function SetupTurrets()
	int turretsSpawned = 0
	int modulesWithTurretsTarget = (moduleData.Length * TurretModulePercentChance) as int
	if (modulesWithTurretsTarget > 0)
		int modulesWithTurrets = 0
		ModuleDatum[] randomizedModuleData = CopyAndRandomizeModuleDataArray(moduleData)
		int i = 0
		While ((modulesWithTurrets < modulesWithTurretsTarget) && (i < randomizedModuleData.Length))
			ModuleDatum currentModule = randomizedModuleData[i]
			if (currentModule.shipTurretSpawnMarkerRef01 != None)
				modulesWithTurrets = modulesWithTurrets + 1

				int turretsToSpawnInCurrentModule
				if (currentModule.moduleRef.HasLocRefType(Ship_Module_Large_RefType))
					turretsToSpawnInCurrentModule = Utility.RandomInt(TurretsToSpawnMin_Large, TurretsToSpawnMax_Large)
				Else
					turretsToSpawnInCurrentModule = Utility.RandomInt(TurretsToSpawnMin_Small, TurretsToSpawnMax_Small)
				EndIf
				ObjectReference[] turretSpawnMarkers = new ObjectReference[0]
				if (turretsToSpawnInCurrentModule >= 1)
					turretSpawnMarkers.Add(currentModule.shipTurretSpawnMarkerRef01)
				EndIf
				if ((turretsToSpawnInCurrentModule >= 2) && (currentModule.shipTurretSpawnMarkerRef02 != None))
					turretSpawnMarkers.Add(currentModule.shipTurretSpawnMarkerRef02)
				EndIf
				if ((turretsToSpawnInCurrentModule >= 3) && (currentModule.shipTurretSpawnMarkerRef03 != None))
					turretSpawnMarkers.Add(currentModule.shipTurretSpawnMarkerRef03)
				EndIf
				if ((turretsToSpawnInCurrentModule >= 4) && (currentModule.shipTurretSpawnMarkerRef04 != None))
					turretSpawnMarkers.Add(currentModule.shipTurretSpawnMarkerRef04)
				EndIf
				if ((turretsToSpawnInCurrentModule >= 5) && (currentModule.shipTurretSpawnMarkerRef05 != None))
					turretSpawnMarkers.Add(currentModule.shipTurretSpawnMarkerRef05)
				EndIf

				int j = 0
				While (j < turretSpawnMarkers.Length)
					Actor newTurret = SpawnGenericActor(turretSpawnMarkers[j], turretData, False, False)
					if (ShouldTurretsStartUnconscious)
						newTurret.SetUnconscious(True)
					EndIf
					if (ShouldTurretsStartFriendlyToPlayer)
						newTurret.AddToFaction(REPlayerFriend)
					EndIf
					turretsSpawned = turretsSpawned + 1
					j = j + 1
				EndWhile
			EndIf
			i = i + 1
		EndWhile
	EndIf
	return turretsSpawned
EndFunction

;Set up and spawn Heat Leeches.
int Function SetupHeatLeeches()
	;How many leeches should we spawn?
	int leechesToSpawn = Utility.RandomInt(MinHeatLeaches, MaxHeatLeaches)
	if (ShowTraces)
		Debug.Trace(Self + " is trying to spawn " + leechesToSpawn + " Heat Leeches.")
	EndIf

	;Where should we spawn them?
	ObjectReference[] spawnPoints = SelectSpawnPoints(leechesToSpawn, CONST_SpawnPattern_Fill, CONST_SpawnPrioritization_None)
	if (spawnPoints.Length < leechesToSpawn)
		if (ShowTraces)
			Debug.Trace("WARN: " + Self + " was asked to spawn " + leechesToSpawn + " leeches, but could only find " + spawnPoints.Length + " spawn points.", 1)
		EndIf
		leechesToSpawn = spawnPoints.Length
	EndIf

	;Spawn them.
	HeatLeeches = new Actor[leechesToSpawn]
	int i = 0
	While (i < leechesToSpawn)
		HeatLeeches[i] = spawnPoints[i].PlaceActorAtMe(ParasiteA_HeatLeech)
		HeatLeeches[i].SetLinkedRef(spawnPoints[i].GetLinkedRef(LinkShipModule), LinkShipModule)
		i = i + 1
	EndWhile
	return leechesToSpawn
EndFunction


;Select spawn points to spawn the actors or corpses at.
ObjectReference[] Function SelectSpawnPoints(int actorsToSpawn, int spawnPattern, int spawnPrioritization)
	ObjectReference[] selectedSpawnPoints = new ObjectReference[0]
	ModuleDatum[] randomizedModuleData = CopyAndRandomizeModuleDataArray(moduleData)
	ModuleDatum[] prioritizedModuleData

	;Do some initial error checking.
	if (randomizedModuleData.Length == 0)
		Debug.Trace("ERROR: " + Self + " has no modules in ModulesWithCrew, so no crew can be spawned.", 2)
		return selectedSpawnPoints
	EndIf

	if (ShowTraces)
		Debug.Trace(Self + " SelectSpawnPoints was asked to select " + actorsToSpawn + " spawn points, Pattern=" + spawnPattern + " Prioritization=" + spawnPrioritization)
	EndIf

	if (spawnPattern != CONST_SpawnPattern_Random)
		;Prioritize modules, if desired.
		if (spawnPrioritization == CONST_SpawnPrioritization_None)
			prioritizedModuleData = randomizedModuleData
		ElseIf (spawnPrioritization == CONST_SpawnPrioritization_CockpitLargeSmall)
			prioritizedModuleData = new ModuleDatum[randomizedModuleData.Length]
			int pIndex = 0

			;Prioritize the cockpit first.
			int cockpitIndex = randomizedModuleData.FindStruct("moduleRef", enemyShipCockpit)
			if (cockpitIndex >= 0)
				prioritizedModuleData[pIndex] = randomizedModuleData[cockpitIndex]
				pIndex = pIndex + 1
				randomizedModuleData.Remove(cockpitIndex)
			EndIf
			;Then large modules.
			int i = randomizedModuleData.Length-1
			While (i >= 0)
				if ((i < randomizedModuleData.Length) && (randomizedModuleData[i].moduleRef.HasLocRefType(Ship_Module_Large_RefType)))
					prioritizedModuleData[pIndex] = randomizedModuleData[i]
					pIndex = pIndex + 1
					randomizedModuleData.Remove(i)
				EndIf
				i = i - 1
			EndWhile
			;Then all other modules.
			i = 0
			While (i < randomizedModuleData.Length)
				prioritizedModuleData[pIndex] = randomizedModuleData[i]
				pIndex = pIndex + 1
				i = i + 1
			EndWhile
		EndIf

		int i = 0
		While ((selectedSpawnPoints.Length < actorsToSpawn) && (i < prioritizedModuleData.Length))
			ModuleDatum currentModule = prioritizedModuleData[i]
			ObjectReference[] moduleSpawnPoints = GetUnusedSpawnPointsInModule(currentModule)
			;How many of spawn points from this module do we want?
			int moduleSpawnPointsToAdd
			if (spawnPattern == CONST_SpawnPattern_Fill)
				moduleSpawnPointsToAdd = moduleSpawnPoints.Length
			ElseIf (spawnPattern == CONST_SpawnPattern_Half)
				moduleSpawnPointsToAdd = Math.Round(moduleSpawnPoints.Length / 2.0)
			Else
				moduleSpawnPointsToAdd = Math.Min(moduleSpawnPoints.Length, 1) as int
			EndIf
			;Add moduleSpawnPointsToAdd to our array.
			int j = 0
			While ((j < moduleSpawnPoints.Length) && (j < moduleSpawnPointsToAdd) && (selectedSpawnPoints.Length < actorsToSpawn))
				selectedSpawnPoints.Add(moduleSpawnPoints[j])
				moduleSpawnPoints[j].AddKeyword(BEMarkerInUseKeyword)
				j = j + 1
			EndWhile
			i = i + 1
		EndWhile

		if (ShowTraces)
			Debug.Trace(Self + " SelectSpawnPoints selected " + selectedSpawnPoints.Length + "/" + actorsToSpawn + " by fill pattern " + spawnPattern)
		EndIf
	EndIf

	;Select any remaining spawn points randomly.
	if (selectedSpawnPoints.Length < actorsToSpawn)
		ObjectReference[] randomizedSpawnPoints = CommonArrayFunctions.CopyAndRandomizeObjArray(allCrewSpawnPoints)
		int i = 0
		While ((selectedSpawnPoints.Length < actorsToSpawn) && (i < randomizedSpawnPoints.Length))
			ObjectReference nextSpawnPoint = randomizedSpawnPoints[i]
			if (!nextSpawnPoint.HasKeyword(BEMarkerInUseKeyword))
				selectedSpawnPoints.Add(nextSpawnPoint)
				nextSpawnPoint.AddKeyword(BEMarkerInUseKeyword)
			EndIf
			i = i + 1
		EndWhile

		if (ShowTraces)
			Debug.Trace(Self + " SelectSpawnPoints selected " + selectedSpawnPoints.Length + "/" + actorsToSpawn + " after random selection.")
		EndIf
	EndIf

	if (ShowTraces)
		Debug.Trace(Self + " SelectSpawnPoints was asked to select " + actorsToSpawn + " spawn points, and selected " + selectedSpawnPoints.Length)
	EndIf

	return selectedSpawnPoints
EndFunction

;Select all of the unused spawn points (spawn points without BEMarkerInUseKeyword) linked to this module.
ObjectReference[] Function GetUnusedSpawnPointsInModule(ModuleDatum moduleDataRef)
	ObjectReference[] unusedSpawnPoints = new ObjectReference[0]
	if ((moduleDataRef.shipCrewSpawnMarkerRef01 != None) && (!moduleDataRef.shipCrewSpawnMarkerRef01.HasKeyword(BEMarkerInUseKeyword)))
		unusedSpawnPoints.Add(moduleDataRef.shipCrewSpawnMarkerRef01)
	EndIf
	if ((moduleDataRef.shipCrewSpawnMarkerRef02 != None) && (!moduleDataRef.shipCrewSpawnMarkerRef02.HasKeyword(BEMarkerInUseKeyword)))
		unusedSpawnPoints.Add(moduleDataRef.shipCrewSpawnMarkerRef02)
	EndIf
	if ((moduleDataRef.shipCrewSpawnMarkerRef03 != None) && (!moduleDataRef.shipCrewSpawnMarkerRef03.HasKeyword(BEMarkerInUseKeyword)))
		unusedSpawnPoints.Add(moduleDataRef.shipCrewSpawnMarkerRef03)
	EndIf
	if ((moduleDataRef.shipCrewSpawnMarkerRef04 != None) && (!moduleDataRef.shipCrewSpawnMarkerRef04.HasKeyword(BEMarkerInUseKeyword)))
		unusedSpawnPoints.Add(moduleDataRef.shipCrewSpawnMarkerRef04)
	EndIf
	if ((moduleDataRef.shipCrewSpawnMarkerRef05 != None) && (!moduleDataRef.shipCrewSpawnMarkerRef05.HasKeyword(BEMarkerInUseKeyword)))
		unusedSpawnPoints.Add(moduleDataRef.shipCrewSpawnMarkerRef05)
	EndIf
	return unusedSpawnPoints
EndFunction


int Function SpawnGenericActors(GenericCrewDatum[] actorData, int actorsToSpawn, ObjectReference[] spawnPoints, bool isSpawningCorpses, bool isSpawningDisembarkers)
	int spawnedCount = 0
	int currentActorDataIndex = 0
	While ((spawnedCount < actorsToSpawn) && (actorData.Length > 0))
		if (ShouldSpawnCaptain && !hasSpawnedCaptain && !isSpawningDisembarkers)
			if (Captain.GetRef() != None)
				Debug.Trace("ERROR: " + Self + " is set to ShouldSpawnCaptain=True, but we already had an alias-created captain. We will not spawn a generic captain to avoid bashing the existing actor.", 2)
				hasSpawnedCaptain = True
			Else
				;If we haven't spawned a Captain yet, the first actor spawned is always the Captain.
				hasSpawnedCaptain = True
				ObjectReference captainSpawnMarkerRef = CaptainSpawnMarker.GetRef()
				Actor newCaptain = SpawnGenericActor(captainSpawnMarkerRef, CaptainData, isSpawningCorpses, False)
				Captain.ForceRefTo(newCaptain)
				spawnedCount = spawnedCount + 1
				;Add the Captain's spawn point to the spawnPoints array so spawnedCount can be safely used as an index.
				;Otherwise, we can get an off-by-one error where we're one spawn point short.
				spawnPoints.Insert(captainSpawnMarkerRef, 0)
			EndIf
		ElseIf (currentActorDataIndex >= actorData.Length)
			currentActorDataIndex = 0
		ElseIf (actorData[currentActorDataIndex].InstancesToSpawn == 0)
			actorData.Remove(currentActorDataIndex)
		ElseIf (actorData[currentActorDataIndex].CrewActor == None)
			Debug.Trace("ERROR: " + Self + " Found a None actor in actorData. Removing it and attempting to proceed.", 2)
			actorData.Remove(currentActorDataIndex)
		Else
			if (!isSpawningDisembarkers)
				SpawnGenericActor(spawnPoints[spawnedCount], actorData[currentActorDataIndex], isSpawningCorpses, isSpawningDisembarkers)
			Else
				SpawnGenericActor(enemyShipRef, actorData[currentActorDataIndex], isSpawningCorpses, isSpawningDisembarkers)
			EndIf
			spawnedCount = spawnedCount + 1
			currentActorDataIndex = currentActorDataIndex + 1
		EndIf
	EndWhile
	if (ShowTraces)
		if (isSpawningDisembarkers)
			Debug.Trace(Self + "SpawnGenericActors: Spawned " + spawnedCount + " Disembarkers.", 0)
		ElseIf (!isSpawningCorpses)
			Debug.Trace(Self + " SpawnGenericActors: Spawned " + spawnedCount + "/" + actorsToSpawn + " Crew. Remaining CrewData Length=" + CrewData.Length, 0)
		Else
			Debug.Trace(Self + " SpawnGenericActors: Spawned " + spawnedCount + "/" + actorsToSpawn + " Crew Corpses. Remaining CorpseData Length=" + CorpseData.Length, 0)
		EndIf
	EndIf
	return spawnedCount
EndFunction


Actor Function SpawnGenericActor(ObjectReference spawnPoint, GenericCrewDatum spawnData, bool isSpawningCorpses, bool isSpawningDisembarkers)
	ActorBase actorBaseToSpawn = spawnData.CrewActor
	int actorLevelMod
	float actorLevelModChance = Utility.RandomFloat(0, 1)
	if (actorLevelModChance < spawnData.ActorLevelModChanceEasy)
		actorLevelMod = 0 ;Easy
	ElseIf (actorLevelModChance < (spawnData.ActorLevelModChanceEasy + spawnData.ActorLevelModChanceMedium))
		actorLevelMod = 1 ;Medium
	Else
		actorLevelMod = 2 ;Hard
	EndIf

	if (ShowTraces)
		Debug.Trace("--Attempting to spawn " + actorBaseToSpawn + " at " + spawnPoint + " in module " + spawnPoint.GetLinkedRef(LinkShipModule))
	EndIf

	Actor newActor = spawnPoint.PlaceActorAtMe(actorBaseToSpawn, actorLevelMod, enemyShipInteriorLoc)

	if (ShowTraces)
		Debug.Trace("----Spawned: " + newActor)
	EndIf

	if (isSpawningDisembarkers)
		DisembarkingCrew.AddRef(newActor)
	ElseIf (!isSpawningCorpses)
		RegisterForRemoteEvent(newActor, "OnDying")
		AllCrew.AddRef(newActor)
		if (ShouldUseBEObjective && (BEObjective_EnemyShip != None) && (BEObjective_EnemyShip.GetRef() == enemyShipRef))
			BEObjective_AllCrew.AddRef(newActor)
		EndIf
		GenericCrew.AddRef(newActor)
		newActor.AddKeyword(BECrewDefenderKeyword)
		newActor.SetValue(Suspicious, crewSuspiciousState)
		if (ShouldCrewStartInCombat) && (OwnerFaction == None) && (!isSurfaceEncounter)
			debug.trace(self + " setting " + newActor + " Very Aggressive")
			newActor.SetValue(Aggression, CONST_Aggression_VeryAggressive)
		EndIf
		if (enemyShipCrimeFaction != None)
			newActor.SetCrimeFaction(enemyShipCrimeFaction)
		EndIf
		;Link the actor to their spawn point's linked ref, if any, so they can use it as a patrol or furniture target if desired.
		ObjectReference spawnLink = spawnPoint.GetLinkedRef()
		if (spawnLink != None)
			newActor.SetLinkedRef(spawnLink)
		EndIf
		;Link the actor to their spawn point's module and module's linkedref chain, so they can use it for combat travel targets if desired.
		ObjectReference moduleTrigger = spawnPoint.GetLinkedRef(LinkShipModule)
		ObjectReference[] combatTargetRef = CombatTargets.GetArray()
		newActor.SetLinkedRef(moduleTrigger, LinkShipModule)
		int i = 0
		bool combatTargetFound = false

		While i < combatTargetRef.Length && CombatTargetFound == false 
			if moduleTrigger == combatTargetRef[i].GetLinkedRef(LinkShipModule)
		    	newActor.SetLinkedRef(combatTargetRef[i], LinkCombatTravelTarget)
				combatTargetFound = true
			endif
			i = i + 1
		EndWhile

		;If the actor is a robot or turret, add them to the appropriate chain, array, and RefCollection.
		if (newActor.HasKeyword(LinkTerminalTurret)) ;BUG: GEN-415432
			if (turrets.Length > 0)
				turrets[turrets.Length-1].SetLinkedRef(newActor, LinkTerminalTurret)
			EndIf
			turrets.Add(newActor)
			GenericTurrets.AddRef(newActor)
		ElseIf (newActor.HasKeyword(ActorTypeRobot))
			if (robots.Length > 0)
				robots[robots.Length-1].SetLinkedRef(newActor, LinkTerminalRobot)
			EndIf
			robots.Add(newActor)
			GenericRobots.AddRef(newActor)
		EndIf
	Else
		GenericCorpses.AddRef(newActor)
		;DON'T try to use KillWithForce now, as it blocks the script thread, and the actors won't load until the player loads onto the ship anyway.
		;Instead, wait until the player boards the ship, and then kill the actors we want to be corpses.
	EndIf

	return newActor
EndFunction


Function SetupComputers()
	ObjectReference[] computersToEnable = new ObjectReference[0]
	ObjectReference cockpitComputer

	;If forcing the Cockpit Computer enabled, add it now.
	if (ForceEnableCockpitComputer)
		cockpitComputer = moduleData[moduleData.FindStruct("moduleRef", enemyShipCockpit)].shipComputerRef
		computersToEnable.Add(cockpitComputer)
	EndIf

	;Do we want to enable generic computers?
	bool shouldEnableGenericComputers
	if (ForceEnableGenericComputers)
		shouldEnableGenericComputers = True
	ElseIf ((robots.Length > 0) || (turrets.Length > 0))
		if ((GenericComputersEnableChance > 0) && (Utility.RandomFloat(0, 1) < GenericComputersEnableChance))
			shouldEnableGenericComputers = True
		EndIf
	EndIf
	if (shouldEnableGenericComputers)
		;If so, figure out which ones to enable.

		;Always enable the cockpit computer, if we want to do so.
		if (ShouldEnableGenericComputerCockpit && !ForceEnableCockpitComputer)
			cockpitComputer = moduleData[moduleData.FindStruct("moduleRef", enemyShipCockpit)].shipComputerRef
			computersToEnable.Add(cockpitComputer)
		EndIf

		;How many additional generic computers do we want?
		int genericComputersToEnableCount
		if (GenericComputersMax >= 0)
			genericComputersToEnableCount = Math.Min(moduleData.Length * GenericComputersModulePercentChance, GenericComputersMax) as int
		Else
     		genericComputersToEnableCount = moduleData.Length * GenericComputersModulePercentChance as int
		EndIf
		if (genericComputersToEnableCount > computersToEnable.Length)
			ModuleDatum[] randomizedModuleData = CopyAndRandomizeModuleDataArray(moduleData)

			if (ShouldPreferGenericComputerThematicModules)
				ObjectReference[] nonPreferredComputers = new ObjectReference[0]
				int i = 0
				While ((i < moduleData.Length) && (computersToEnable.Length < genericComputersToEnableCount))
					ModuleDatum currentModule = moduleData[i]
					ObjectReference currentModuleRef = currentModule.moduleRef
					if (currentModule.shipComputerRef != None)
						if (currentModuleRef.HasLocRefType(Ship_Module_Computer_RefType) || currentModuleRef.HasLocRefType(Ship_Module_Engineering_RefType))
							computersToEnable.Add(currentModule.shipComputerRef)
						ElseIf (currentModuleRef != enemyShipCockpit)
							nonPreferredComputers.Add(currentModule.shipComputerRef)
						EndIf
					EndIf
					i = i + 1
				EndWhile
				if (computersToEnable.Length < genericComputersToEnableCount)
					i = 0
					While (i < nonPreferredComputers.Length)
						computersToEnable.Add(nonPreferredComputers[i])
						i = i + 1
					EndWhile
				EndIf
			Else
				int i = 0
				While ((i < moduleData.Length) && (computersToEnable.Length < genericComputersToEnableCount))
					ModuleDatum currentModule = moduleData[i]
					if ((currentModule.shipComputerRef != None) && (currentModule.moduleRef != enemyShipCockpit))
						computersToEnable.Add(currentModule.shipComputerRef)
					EndIf
					i = i + 1
				EndWhile
			EndIf
		EndIf
	EndIf

	;Handle the cockpit computer.
	bool enabledAnyComputers
	if (cockpitComputer != None)
		enabledAnyComputers = True
		Computers.AddRef(cockpitComputer)
		cockpitComputer.EnableNoWait()
		if ((GenericComputerRobotLinkStatus < CONST_GenericComputerLinkStatus_None) && (robots.Length > 0))
			cockpitComputer.SetLinkedRef(robots[0], LinkTerminalRobot)
		EndIf
		if ((GenericComputerTurretLinkStatus < CONST_GenericComputerLinkStatus_None) && (turrets.Length > 0))
			cockpitComputer.SetLinkedRef(turrets[0], LinkTerminalTurret)
		EndIf
		ObjectReference linkedContainer = cockpitComputer.GetLinkedRef(LinkTerminalContainer)
		if ((linkedContainer != None) && (Utility.RandomFloat(0, 1) < GenericComputerLinkedContainerLockPercentChance))
			linkedContainer.Lock()
			linkedContainer.SetLockLevel(Utility.RandomInt(LockLevelMin, LockLevelMax) * 25)
		EndIf
		if ((GenericComputerLockPercentChance_Cockpit > 0) && (Utility.RandomFloat(0, 1) < GenericComputerLockPercentChance_Cockpit))
			cockpitComputer.Lock()
			cockpitComputer.SetLockLevel(Utility.RandomInt(GenericComputerLockLevelMin, GenericComputerLockLevelMax) * 25)
		EndIf
	EndIf
	;Handle other computers.
	int i = 0
	While (i < computersToEnable.Length)
		enabledAnyComputers = True
		ObjectReference currentComputer = computersToEnable[i]
		if (currentComputer != cockpitComputer)
			currentComputer.EnableNoWait()
			Computers.AddRef(currentComputer)
			if ((GenericComputerRobotLinkStatus == CONST_GenericComputerLinkStatus_All) && (robots.Length > 0))
				currentComputer.SetLinkedRef(robots[0], LinkTerminalRobot)
			EndIf
			if ((GenericComputerTurretLinkStatus == CONST_GenericComputerLinkStatus_All) && (turrets.Length > 0))
				currentComputer.SetLinkedRef(turrets[0], LinkTerminalTurret)
			EndIf
			ObjectReference linkedContainer = cockpitComputer.GetLinkedRef(LinkTerminalContainer)
			if ((linkedContainer != None) && (Utility.RandomFloat(0, 1) < GenericComputerLinkedContainerLockPercentChance))
				linkedContainer.Lock()
				linkedContainer.SetLockLevel(Utility.RandomInt(LockLevelMin, LockLevelMax) * 25)
			EndIf
			if ((GenericComputerLockPercentChance_General > 0) && (Utility.RandomFloat(0, 1) < GenericComputerLockPercentChance_General))
				currentComputer.Lock()
				currentComputer.SetLockLevel(Utility.RandomInt(GenericComputerLockLevelMin, GenericComputerLockLevelMax) * 25)
			EndIf
		EndIf
		i = i + 1
	EndWhile

	;If we enabled any computers, we need to register for the player using them to shut down robots or turrets.
	if (enabledAnyComputers)
		RegisterForCustomEvent(SQ_Parent, "SQ_NativeTerminalActor_Unconscious")
		RegisterForCustomEvent(SQ_Parent, "SQ_NativeTerminalActor_Frenzy")
		RegisterForCustomEvent(SQ_Parent, "SQ_NativeTerminalActor_Ally")
	EndIf
EndFunction


;When the player loads into the enemy ship for the first time, finish any setup that we can't do until the ship's references have loaded.
;For example, we need to wait for containers to calc before we add items to them, or their intitial calc will wipe out anything added through script.
Event ObjectReference.OnCellLoad(ObjectReference akSource)
	;Unregister; do this once only.
	UnregisterForRemoteEvent(akSource, "OnCellLoad")

	;Now that their 3D has loaded, kill the actors who are supposed to be corpses.
	LockGuard BECrewGuard
		Actor[] genericCorpseRefs = GenericCorpses.GetArray() as Actor[]
		int i = 0
		While (i < genericCorpseRefs.Length)
			RE_Parent.KillWithForceNoWait(genericCorpseRefs[i])
			i = i + 1
		EndWhile
		i = 0
		While (i < BEAliasCorpses.Length)
			RE_Parent.KillWithForceNoWait(BEAliasCorpses[i])
			i = i + 1
		EndWhile	
	EndLockGuard
	
	;Spawn loot.
	if (ShouldSpawnLoot)
		ObjectReference captainsLockerRef = CaptainsLocker.GetRef()
		int maxCrew = (enemyShipRef.GetBaseValue(SpaceShipCrew) * crewSizePercent) as int
		if (maxCrew == 0)
			;Don't spawn additional loot.
		ElseIf (maxCrew <= BE_ShipCrewSizeSmall.GetValueInt())
			captainsLockerRef.AddItem(LL_BE_ShipCaptainsLockerLoot_Small)
		ElseIf (maxCrew <= BE_ShipCrewSizeMedium.GetValueInt())
			captainsLockerRef.AddItem(LL_BE_ShipCaptainsLockerLoot_Medium)
		Else ;Large
			captainsLockerRef.AddItem(LL_BE_ShipCaptainsLockerLoot_Large)
		EndIf
	EndIf

	;Set StageToSetOnBoarding. 
	if (StageToSetOnBoarding >= 0)
		SetStage(StageToSetOnBoarding)
	EndIf

	;Play the alarm if the variable is true
	if (PlayHostileAlarmUponBoarding)
		OBJ_Alarm_BoardingAlert.Play(player)
	endif

	;Send an assault combat alarm if the ship is owned and hostile.
	if ((ShouldCrewStartInCombat) && (!isSurfaceEncounter) && (OwnerFaction != None) && (AllCrew != None) && (AllCrew.GetCount() > 0))
		Actor[] allCrewRefs = AllCrew.GetArray() as Actor[]
		int i = 0
		While (i < allCrewRefs.Length)
			Actor current = allCrewRefs[i]
			if (current != None)
				current.SendAssaultAlarm()
			EndIf
			i = i + 1
		EndWhile
	EndIf
EndEvent



;---------------------------------------------
;Boarding
;----------------------

Function UpdateBoarding()
	if (ShowTraces)
		Debug.Trace(Self + " UpdateBoarding status.", 0)
	EndIf
	;Check the status of the current boarding party.
	int i = 0
	While (i < GenericBoarders.GetCount())
		Actor currentBoarder = GenericBoarders.GetAt(i) as Actor
		if (currentBoarder != None)
			;BECrewDefenderKeyword and BECrewAttackerKeyword are used by crew combat dialogue conditions.
			;Check whether the boarder has pathed back through the load and update the keywords if necessary. (It usually isn't...)
			Location currentBoarderLocation = currentBoarder.GetCurrentLocation()
			bool isAttacking = currentBoarder.HasKeyword(BECrewAttackerKeyword)
			if (!isAttacking && (currentBoarderLocation == playerShipInteriorLoc))
				currentBoarder.RemoveKeyword(BECrewDefenderKeyword)
				currentBoarder.AddKeyword(BECrewAttackerKeyword)
			ElseIf (isAttacking && (currentBoarderLocation != playerShipInteriorLoc))
				currentBoarder.RemoveKeyword(BECrewAttackerKeyword)
				currentBoarder.AddKeyword(BECrewDefenderKeyword)
			EndIf

			;If any of the boarders have reached the player's cockpit, let the boarders disperse to other modules.
			;Temp? We'll probably need to revisit this at some point, but at least it keeps the boarders from all piling up in one module.
			if ((playerShipCockpitRef.GetValue(BEBoarderCapturedModule) == 0) && playerShipCockpitRef.IsInTrigger(currentBoarder))
				playerShipCockpitRef.SetValue(BEBoarderCapturedModule, 1)
				Debug.Trace("--" + Self + " UpdateBoarding now considers the Cockpit captured. Boarders will now disperse.", 0)
			EndIf
		EndIf
		i = i + 1
	EndWhile
	;Do we want any new actors to board the player's ship?
	if (player.IsInLocation(enemyShipInteriorLoc))
		;Don't do anything. We don't want to send enemies to board the player's ship if the player is currently boarding theirs.
		if (ShowTraces)
			Debug.Trace("--" + Self + " UpdateBoarding skipped because the player has boarded the enemy ship.", 0)
		EndIf
	Else
		;Do we need to send in another wave of boarders?
		bool startedWave = False
		int slotsForMoreBoarders = maxSimultaneousBoarders - GenericBoarders.GetCount()
		if ((remainingBoarders.Length > 0) && (slotsForMoreBoarders >= MinBoardingWaveSize))
			LockGuard BECrewGuard

				;If so, how many should we send?
				int boardersToAdd = Math.Min(remainingBoarders.Length, Math.Min(slotsForMoreBoarders, MaxBoardingWaveSize)) as int
				if (boardersToAdd > 0)
					if (ShowTraces)
						Debug.Trace("--" + Self + " UpdateBoarding: Starting a new wave of boarders with " + boardersToAdd + " boarders. " + (remainingBoarders.Length-boardersToAdd) + " remain.", 0)
					EndIf
					startedWave = True
					i = 0
					While (i < boardersToAdd)
						Actor nextBoarder = remainingBoarders[0]
						ObjectReference randomModule = playerShipModulesAllRefs[Utility.RandomInt(0, playerShipModulesAllRefs.Length-1)]
						nextBoarder.SetLinkedRef(playerShipCockpitRef, BEBoarderPlayerShipCockpitLink)
						nextBoarder.SetLinkedRef(randomModule, BEBoarderPlayerShipModuleLink)
						;Prevent boarders from fleeing back to their own ship.
						nextBoarder.SetValue(Confidence, CONST_Confidence_Foolhardy)
						if (ShouldCrewStartInCombat)
							debug.trace(self + " setting " + nextBoarder + " Very Aggressive")
							nextBoarder.SetValue(Aggression, CONST_Aggression_VeryAggressive)
						EndIf
						GenericBoarders.AddRef(nextBoarder)
						if (!player.IsInLocation(enemyShipInteriorLoc))
							nextBoarder.Disable()
							nextBoarder.RemoveKeyword(BECrewDefenderKeyword)
							nextBoarder.AddKeyword(BECrewAttackerKeyword)
							nextBoarder.MoveTo(playerShipDockingDoorRef)
							nextBoarder.Enable(True)
						EndIf
						nextBoarder.EvaluatePackage()
						if (ShowTraces)
							Debug.Trace("----" + Self + " UpdateBoarding: " + nextBoarder + " boards.", 0)
						EndIf
						remainingBoarders.Remove(0)
						i = i + 1
					EndWhile
				EndIf

			EndLockGuard
		EndIf
	EndIf

	if (GenericBoarders.GetCount() > 0)
		StartTimer(CONST_BoardingUpdateTimerDelay, CONST_BoardingUpdateTimerID)
	Else
		if (ShowTraces)
			Debug.Trace("--" + Self + " UpdateBoarding ends because no boarders remain.", 0)
		EndIf
	EndIf
EndFunction


;---------------------------------------------
;Disembarking
;----------------------

Function SetupDisembarking()
	LockGuard(DisembarkingGuard)
		if (!hasSetupDisembarking && enemyShipRef.IsLanded())
			hasSetupDisembarking = True
			if (DisembarkingCrew.GetCount() > 0)
				if (ShowTraces)
					Debug.Trace(Self + " SetupDisembarking with " + DisembarkingCrew.GetCount() + " disembarkers.", 0)
				EndIf
				Actor[] disembarkingCrewRefs = DisembarkingCrew.GetArray() as Actor[]
				;Do we want to add our disembarkers to the base crew?
				if (ShouldAddDisembarkersToAllCrew)
					AllCrew.AddArray(disembarkingCrewRefs as ObjectReference[])
					if (ShouldUseBEObjective && (BEObjective_EnemyShip.GetRef() == enemyShipRef))
						BEObjective_AllCrew.AddArray(disembarkingCrewRefs as ObjectReference[])
					EndIf
					enemyShipRef.ModValue(SpaceShipCrew, disembarkingCrewRefs.Length)
					int i = 0
					While (i < disembarkingCrewRefs.Length)
						RegisterForRemoteEvent(disembarkingCrewRefs[i], "OnDying")
						i = i + 1
					EndWhile
				EndIf
				;Move the disembarkers into position on the landing deck, enable them, and give them a link to the landing deck to force them to wait until landing has finished.
				ObjectReference LandingDeckControlMarkerRef = LandingDeckControlMarker.GetRef()
				ObjectReference[] landingDeckMarkerRefs = LandingDeckControlMarkerRef.GetLinkedRefChain()
				int i = 0
				While ((i < disembarkingCrewRefs.Length) && (i < landingDeckMarkerRefs.Length))
					if (ShowTraces)
						Debug.Trace(Self + " SetupDisembarking moves " + disembarkingCrewRefs[i] + " to " + landingDeckMarkerRefs[i], 0)
					EndIf
					disembarkingCrewRefs[i].MoveTo(landingDeckMarkerRefs[i])
					i = i + 1
				EndWhile
				While (i < disembarkingCrewRefs.Length)
					if (ShowTraces)
						Debug.Trace(Self + " SetupDisembarking moves " + disembarkingCrewRefs[i] + " to fallback control marker.", 0)
					EndIf
					disembarkingCrewRefs[i].MoveTo(LandingDeckControlMarkerRef)
					i = i + 1
				EndWhile
				i = 0
				While (i < disembarkingCrewRefs.Length)
					disembarkingCrewRefs[i].SetValue(BEWaitingForLandingRampValue, 1)
					if (disembarkersShouldHaveWeaponsUnequipped)
						disembarkingCrewRefs[i].SetValue(BEDisembarkWithWeaponsDrawnValue, 1)
					EndIf
					disembarkingCrewRefs[i].SetLinkedRef(landingDeckMarkerRefs[landingDeckMarkerRefs.Length-1], LinkCombatTravelTarget)
					disembarkingCrewRefs[i].EnableNoWait()
					disembarkingCrewRefs[i].EvaluatePackage()
					i = i + 1
				EndWhile
			EndIf
			;Then open the landing ramp.
			SetEnemyShipLandingRampsOpenState(True)
		EndIf
		if (!hasStartedDisembarking && (!enemyShipRef.Is3DLoaded() || enemyShipRef.IsRampDown()))
			hasStartedDisembarking = True
			Actor[] disembarkingCrewRefs = DisembarkingCrew.GetArray() as Actor[]
			int i = 0
			While (i < disembarkingCrewRefs.Length)
				disembarkingCrewRefs[i].SetValue(BEWaitingForLandingRampValue, 0)
				disembarkingCrewRefs[i].EvaluatePackage()
				i = i + 1
			EndWhile
			if (isDropshipEncounter)
				;If this is a Dropship encounter, take off again as soon as possible.
				TakeOffWhenAble()
			EndIf
		EndIf
	EndLockGuard
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSource)
	SetEnemyShipLandingRampsOpenState(ShouldLandingRampsBeOpenOnLoad)
EndEvent


;---------------------------------------------
;Embarking
;----------------------

Function EmbarkAllCrewAndTakeoffWhenAble(bool shouldQuestShutDownOnTakeoff=True)
	EmbarkAllCrew()
	TakeOffWhenAble()
EndFunction

Function EmbarkAllCrew()
	EmbarkActorsRefCol(AllCrew)
EndFunction

Function EmbarkActorsRefCol(RefCollectionAlias actorsToEmbark)
	EmbarkActors(actorsToEmbark.GetArray() as Actor[])
EndFunction

Function EmbarkActors(Actor[] actorsToEmbark)
	int i = 0
	While (i < actorsToEmbark.Length)
		Actor current = actorsToEmbark[i]
		if (current != None)
			EmbarkActor(current)
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function EmbarkActor(Actor actorToEmbark)
	;Make sure the embarking actor has a link to something inside the ship the embarkation package can use.
	if (actorToEmbark.GetLinkedRef(LinkShipModule) == None)
		actorToEmbark.SetLinkedRef(enemyShipCockpit, LinkShipModule)
	EndIf
	;Then add the embarking actor to the EmbarkingCrew RefCollection, which sends them back onto the ship.
	DisembarkingCrew.RemoveRef(actorToEmbark)
	EmbarkingCrew.AddRef(actorToEmbark)
	actorToEmbark.EvaluatePackage()
EndFunction


;---------------------------------------------
;Takeoff
;----------------------

Function TakeOffWhenAble(bool shouldQuestShutDownOnTakeoff=True)
	shouldShutdownOnTakeoff = shouldQuestShutDownOnTakeoff
	StartTimer(CONST_TakeoffUpdateTimerDelay, CONST_TakeoffUpdateTimerID)
EndFunction

Function UpdateTakeoff()
	;Check whether our EmbarkingActors, if any, have finished embarking.
	bool hasFinishedEmbarking = True
	if (EmbarkingCrew == None)
		Debug.Trace("WARNING: " + Self + "'s EmbarkingCrew Alias was NONE.", 1)
	ElseIf (EmbarkingCrew.GetCount() > 0)
		Actor[] embarkingCrewActors = EmbarkingCrew.GetArray() as Actor[]
		int i = 0
		While ((i < embarkingCrewActors.Length) && hasFinishedEmbarking)
			Actor current = embarkingCrewActors[i]
			if ((current == None) || (current.IsDead()) || (current.IsDisabled()))
				;Remove the Embarker; they won't be joining us.
				EmbarkingCrew.RemoveRef(current)
			ElseIf (current.IsInLocation(enemyShipInteriorLoc))
				;The Embarker is on board. Nothing we need to do here.
			ElseIf (!current.Is3DLoaded())
				;The Embarker is unloaded. Force them on board so this process doesn't stall out.
				current.MoveToPackageLocation()
			Else
				;The Embarker is not on board.
				hasFinishedEmbarking = False
			EndIf
			i = i + 1
		EndWhile
	EndIf

	if (hasFinishedEmbarking)
		;We next need to seal the exterior load door, if we haven't done so on a previous attempt, but we can't do that if the player is on board the enemy ship.
		if (!enemyShipRef.IsExteriorLoadDoorInaccessible())
			if (!player.IsInLocation(enemyShipInteriorLoc))
				;Try to set it inaccessible.
				enemyShipRef.SetExteriorLoadDoorInaccessible(True)
				;Double-check that there wasn't a timing issue that trapped the player on the enemy ship.
				if ((enemyShipInteriorLoc != None) && (player.IsInLocation(enemyShipInteriorLoc)))
					enemyShipRef.SetExteriorLoadDoorInaccessible(False)
				EndIf
			EndIf
		EndIf

		;TODO - GEN-365305 - SetExteriorLoadDoorInaccessible isn't working, which prevents this check from ever passing.
		;if (enemyShipRef.IsExteriorLoadDoorInaccessible())
			;We next need to make sure the landing deck is clear.
			if (enemyShipRef.IsLandingDeckClear())
				;We're ready for takeoff.
				isReadyForTakeoff = True

				;Do we want to shut down once takeoff has finished?
				if (shouldShutdownOnTakeoff)
					ShutDownOnUnload = True
					RegisterForRemoteEvent(enemyShipRef, "OnUnload")
				EndIf

				;Close the landing ramp.
				ObjectReference[] landingRamps = enemyShipRef.GetLandingRamps()
				if ((landingRamps == None) || (landingRamps.Length == 0))
					;If we couldn't find any landing ramps (likely because the ship was unloaded), just take off.
					FinishTakeoff()
				Else
					int i = 0
					While (i < landingRamps.Length)
						RegisterForRemoteEvent(landingRamps[i], "OnClose")
						landingRamps[i].SetOpen(False)
						i = i + 1
					EndWhile
				EndIf

				;And return, bailing out of the timer loop.
				return
			EndIf
		;EndIf
	EndIf

	;If we haven't successfully taken off yet, try again later.
	StartTimer(CONST_TakeoffUpdateTimerDelay, CONST_TakeoffUpdateTimerID)
EndFunction


Event ObjectReference.OnClose(ObjectReference akSource, ObjectReference akActionRef)
	if (isReadyForTakeoff)
		FinishTakeoff()
	EndIf
EndEvent

Function FinishTakeoff()
	ObjectReference exteriorLandingDeckTrigger = enemyShipRef.GetExteriorLoadDoors()[0].GetLinkedRef()
	if (exteriorLandingDeckTrigger != None)
		Actor[] actorsOnLandingDeck = exteriorLandingDeckTrigger.GetAllRefsInTrigger() as Actor[]
		int i = 0
		While (i < actorsOnLandingDeck.Length)
			Actor current = actorsOnLandingDeck[i]
			if ((current != None) && (current != Game.GetPlayer()) && (!current.IsEssential()))
				actorsOnLandingDeck[i].Kill()
			EndIf
			i = i + 1
		EndWhile
	EndIf

	;Take off.
	enemyShipRef.DisableWithTakeoffOrLanding()
	Debug.Trace("BEScript " + Self + ": " + enemyShipRef + " completed takeoff.")

	;And make sure we shut down, if we're supposed to do so.
	if (ShutDownOnUnload)
		Debug.Trace("BEScript " + Self + ": " + enemyShipRef + " shuts down.")
		CleanupAndStop()
	EndIf
EndFunction


;---------------------------------------------
;Quest Functions
;----------------------

;Set the ship and its crew friendly or hostile to the player.
Function SetCrewPlayerFriend(bool shouldBeFriends, bool shouldStartOrStopCombat=True)
	;Update the state of the crew.
	LockGuard BECrewGuard
		int i = 0
		While (i < AllCrew.GetCount())
			SetPlayerFriend(AllCrew.GetAt(i), shouldBeFriends, shouldStartOrStopCombat)
			i = i + 1
		EndWhile
	EndLockGuard
	;Update the state of the ship.
	SetPlayerFriend(EnemyShip.GetRef(), shouldBeFriends, shouldStartOrStopCombat)
	;And if now friends to the player, stop boarding.
	if (shouldBeFriends)
		shouldAbortBoarding = True
	EndIf
EndFunction

;Set a specific ship or actor to be friendly or hostile to the player.
Function SetPlayerFriend(ObjectReference target, bool shouldBeFriends, bool shouldStartOrStopCombat=True)
	if (shouldBeFriends)
		target.TryToAddToFaction(REPlayerFriend)
		if (shouldStartOrStopCombat)
			target.TryToStopCombat()
		EndIf
	Else
		target.TryToRemoveFromFaction(REPlayerFriend)
		if (shouldStartOrStopCombat)
			target.TryToStartCombat(player)
			target.TryToStartCombat(PlayerShip.GetRef())
		EndIf
	EndIf
	target.TryToEvaluatePackage()
EndFunction

;Remove the Attacker & Defender keywords from an actor.
Function RemoveCrewKeywords(Actor target)
	target.RemoveKeyword(BECrewAttackerKeyword)
	target.RemoveKeyword(BECrewDefenderKeyword)
EndFunction

;Check whether this encounter supports Crew Critical Hits, and if so, whether one has occurred.
bool Function CheckForCrewCriticalHit()
	return ShouldSupportCrewCriticalHit && !isSurfaceEncounter && (enemyShipRef.GetValue(SpaceshipCriticalHitCrew) == 1)
EndFunction

;Decompress the ship and kill all of its (non-robot, non-turret) crew.
Function DecompressShipAndKillCrew()
	;Is the ship currently loaded?
	bool isPlayerInEnemyShip = Game.GetPlayer().GetParentCell() == enemyShipCell
	;We can't set gravity to zero if there are any robots on the ship.
	;To start with, check whether GenericRobots has any robots.
	bool blockZeroG = (GenericRobots != None) && (GenericRobots.GetCount() > 0)
	;Kill the crew.
	Actor[] allCrewRefs = AllCrew.GetArray() as Actor[]
	int i = 0
	While (i < allCrewRefs.Length)
		Actor current = allCrewRefs[i]
		if (current != None)
			if (current.HasKeyword(ActorTypeRobot))
				blockZeroG = True
			ElseIf (current.HasKeyword(ActorTypeTurret))
				;Do nothing.
			Else
				current.Kill()
			EndIf
		EndIf
		i = i + 1
	EndWhile
	if (HeatLeeches != None)
		if (!isPlayerInEnemyShip)
			i = 0
			While (i < HeatLeeches.Length)
				HeatLeeches[i].DisableNoWait()
				i = i + 1
			EndWhile
		Else
			blockZeroG = True
		EndIf
	EndIf
	Debug.Trace(Self + " DecompressShipAndKillCrew: Killed crew.")
	;Remove Oxygen.
	SetShipHasOxygen(False)
	;Set Gravity to 0, if we can.
	if (blockZeroG)
		Debug.Trace(Self + " DecompressShipAndKillCrew: Removed oxygen, did not set ZeroG because robots or creatures were present.")
	Else
		SetShipGravity(0)
		Debug.Trace(Self + " DecompressShipAndKillCrew: Removed oxygen, set ZeroG.")
	EndIf
EndFunction

;Set the ship's gravity.
Function SetShipGravity(float newGravity)
	if (newGravity < 0)
		Debug.Trace("ERROR: " + Self + " SetShipGravity was asked to set a gravity <=0.", 2)
	ElseIf (ShouldOverrideGravityOnlyInSpace && isSurfaceEncounter)
		Debug.Trace("WARN: " + Self + " SetShipGravity call ignored because ShouldOverrideGravityOnlyInSpace=True, and this ship is not in space.", 1)
	Else
		ShipGravity = newGravity
		enemyShipCell.SetGravityScale(ShipGravity)
	EndIf
EndFunction

;Set the ship's oxygen.
Function SetShipHasOxygen(bool hasOxygen)
	if (hasOxygen)
		enemyShipRef.RemoveKeyword(ENV_Loc_NotSealedEnvironment)
	Else
		enemyShipRef.AddKeyword(ENV_Loc_NotSealedEnvironment)
	EndIf
EndFunction

;Set a hazard for all of the ship's modules.
Function SetShipHazard(Hazard newHazard)
	if (enemyShipHazard != None)
		enemyShipHazard.Disable()
		enemyShipHazard.Delete()
	EndIf
	if (newHazard == None)
		enemyShipHazard = None
	Else
		enemyShipHazard = enemyShipCockpit.PlaceAtMe(newHazard)
		ObjectReference[] allModuleRefs = AllModules.GetArray()
		int i = 0
		While (i < allModuleRefs.Length)
			allModuleRefs[i].SetLinkedRef(enemyShipHazard, LinkHazardVolume)
			if (allModuleRefs[i].IsInTrigger(player))
				allModuleRefs[i].Disable()
				allModuleRefs[i].Enable()
			EndIf
			i = i + 1
		EndWhile
	EndIf
EndFunction

Function SetModuleHazard(ObjectReference module, Hazard newHazard)
	ObjectReference currentHazardRef = module.GetLinkedRef(LinkHazardVolume)
	if ((currentHazardRef != None) && (currentHazardRef != enemyShipHazard))
		currentHazardRef.Disable()
		currentHazardRef.Delete()
	EndIf
	if (newHazard == None)
		module.SetLinkedRef(None, LinkHazardVolume)
	Else
		ObjectReference newHazardRef = module.PlaceAtMe(newHazard)
		module.SetLinkedRef(newHazardRef, LinkHazardVolume)
		if (module.IsInTrigger(player))
			module.Disable()
			module.Enable()
		EndIf
	EndIf
EndFunction

Function SpawnContraband()
	ObjectReference[] PotentialContrabandSpawnPoints = SmallItemSpawnMarkers.GetArray()
	int contrabandToSpawn = Utility.RandomInt(ContrabandMin, Math.Min(ContrabandMax, PotentialContrabandSpawnPoints.Length) as int)
	int i = 0
	While i < contrabandToSpawn
		Contraband.AddRef(PotentialContrabandSpawnPoints[i].PlaceAtMe(Loot_LPI_Contraband_Any))
		PotentialContrabandSpawnPoints[i].AddKeyword(BEMarkerInUseKeyword)
		i = i + 1
	endWhile
endFunction

;For docking encounters only, returns the marker the player will be teleported to when they load into the enemy ship.
ObjectReference Function GetEnemyShipLoadDoorMarker()
	if (isSurfaceEncounter)
		Debug.Trace("ERROR: " + Self + " GetEnemyShipLoadDoorMarker is only supported for Docking encounters.", 2)
	Else
		ObjectReference playerShipDoorRef = PlayerShipLoadDoor.GetRef()
		if (playerShipDoorRef != None)
			ObjectReference enemyShipDoorRef = playerShipDoorRef.GetLinkedRef(LinkShipLoadDoor)
			ObjectReference enemyShipTeleportMarker = enemyShipDoorRef.GetLinkedRef(DynamicallyLinkedDoorTeleportMarkerKeyword)
			if (enemyShipTeleportMarker != None)
				return enemyShipTeleportMarker
			ElseIf (enemyShipDoorRef != None)
				return enemyShipDoorRef
			EndIf
		EndIf
	EndIf
	return None
EndFunction

;Return whether OnStoryScript has finished initializing the BE.
bool Function HasInitialized()
	return hasInitialized
EndFunction

;Block until OnStoryScript finishes initializing the BE.
Function WaitUntilInitialized()
	int failsafe = 0
	While (!hasInitialized && (failsafe < CONST_WaitUntilInitializedTimeoutDelay))
		failsafe = failsafe + 1
		Utility.Wait(1)
	EndWhile
	if (failsafe == CONST_WaitUntilInitializedTimeoutDelay)
		Debug.Trace("ERROR: " + Self + " WaitUntilInitialize timed out.", 2)
	EndIf
EndFunction

int Function GetLandingRampsOpenState()
	ObjectReference[] landingRamps = enemyShipRef.GetLandingRamps()
	if (landingRamps == None)
		Debug.Trace("Warning: No landing ramps detected. Is ship loaded?")
		return 0
	EndIf
	if (landingRamps.Length == 0)
		return 0
	EndIf
	return landingRamps[0].GetOpenState()

EndFunction

Function SetEnemyShipLandingRampsOpenState(bool abOpen = true)
	ShouldLandingRampsBeOpenOnLoad = abOpen
	ObjectReference[] landingRamps = enemyShipRef.GetLandingRamps()
	bool loaded = enemyShipRef.WaitFor3DLoad()
	if (loaded) && (enemyShipRef.IsLanded()) && (landingRamps != None)
		int i = 0
		While (i < landingRamps.Length)
			landingRamps[i].SetOpen(abOpen)
			i = i + 1
		EndWhile
	else
	Debug.Trace("Warning: Failed to open landing ramps. Has ship landed? Is ship loaded?")
	endif
	if abOpen && SpaceshipPreventRampOpenOnLanding
		; failsafe in case BE_Landing added this keyword
		enemyShipRef.RemoveKeyword(SpaceshipPreventRampOpenOnLanding)
	endif
EndFunction



;---------------------------------------------
;Utility Functions
;----------------------

ModuleDatum[] Function CopyModuleDataArray(ModuleDatum[] input)
    ModuleDatum[] output = new ModuleDatum[input.Length]
    int i = 0
    While (i < input.Length)
        output[i] = input[i]
        i = i + 1
    EndWhile
    return output
EndFunction

ModuleDatum[] Function CopyAndRandomizeModuleDataArray(ModuleDatum[] input)
    ModuleDatum[] output = CopyModuleDataArray(input)
    float[] random = Utility.RandomFloatsFromSeed(Utility.RandomInt(0, 100000), output.Length, 0, 1)
    int i = output.Length - 1
    While (i >= 0)
        int currentRandomIndex = (random[i] * i) as int
        ModuleDatum temp = output[i]
        output[i] = output[currentRandomIndex]
        output[currentRandomIndex] = temp
        i = i - 1
    EndWhile
    return output
EndFunction



;---------------------------------------------
;Debug Functions
;----------------------

Function DEBUG_ForceUpdateAllCrew()
	int i = 0
	Actor[] allCrewActors = AllCrew.GetArray() as Actor[]
	While (i < allCrewActors.Length)
		allCrewActors[i].MoveToPackageLocation()
		i += 1
	EndWhile
EndFunction

Function DEBUG_SetLandingRampOpen(bool shouldBeOpen)
	 SetEnemyShipLandingRampsOpenState(shouldBeOpen)
EndFunction

Function DEBUG_SetDoorInaccessible(bool shouldBeInaccessible)
	enemyShipRef.SetExteriorLoadDoorInaccessible(shouldBeInaccessible)
EndFunction



;---------------------------------------------
;Patch Functions
;----------------------

Function PATCH_RetryTakeoff()
	if (IsRunning())
		if (isReadyForTakeoff)
			;If a ship tried to take off (isReadyForTakeOff=True), but then fell through the timer loop,
			;call UpdateTakeoff to try again with the fixed timer loop.
			Debug.Trace("PATCH: PATCH_RetryTakeoff tried to update takeoff for " + Self)
			UpdateTakeoff()
		EndIf
	EndIf
EndFunction