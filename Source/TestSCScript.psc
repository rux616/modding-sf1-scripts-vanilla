Scriptname TestSCScript extends Quest
{Quest script for TestSC, the Test Space Combat quest.}

Group QuestProperties
	int property TestDefaultPlayerLevel = 35 Auto Const
	{DEFAULT=35. When running test commands, if no level is specified, set the player to this level.}

	SpaceshipBase[] property TestPlayerShips Auto Const Mandatory
	{Array of potential player test ships.}

	int property TestDefaultEnemyShipSpawnDistance = 700 Auto Const
	{Default=500. When running test commands, if spawning an enemy ship, and no distance is specified, spawn the ship(s) at this distance from the player.}

	int property TestDefaultEnemyShipLevelMod = 3 Auto Const
	{Default=3, Hard, player level. When running test commands, if spawning an enemy ship, and no level mod is specified, spawn the ship(s) with this level mod.}

	SpaceshipBase[] property TestEnemyShips Auto Const Mandatory
	{Array of potential enemy test ships.}

	Cell[] property TestEnemySpaceCells Auto Const Mandatory
	{Array of potential enemy ship space cells.}	
EndGroup


Group AutofillProperties
	SQ_PlayerShipScript property SQ_PlayerShip Auto Const Mandatory
	ReferenceAlias property PlayerShip Auto Const Mandatory
	ReferenceAlias property PlayerShipPilotSeat Auto Const Mandatory
	ReferenceAlias property TestSpaceCombatStartMarker Auto Const Mandatory
	RefCollectionAlias property EnemyShips Auto Const Mandatory
	ActorValue property Experience Auto Const Mandatory
	ObjectReference property CTestCOCMarkerRef Auto Const Mandatory
	ObjectReference property NewGameShipMarkerRef Auto Const Mandatory
EndGroup

;Local Variables
Actor player
bool waitingForPlayerToSit
int pridEnemyIndex


;---------------------------
;Startup & Initialization
;------------------------

Event OnQuestInit()
	player = Game.GetPlayer()
EndEvent

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
	waitingForPlayerToSit = False
EndEvent


;---------------------------
;Test Commands
;--------------

Function SetLevel(int level=-1)
	if (level <= 0)
		level = TestDefaultPlayerLevel
	EndIf
	int currentLevel = Game.GetPlayerLevel()
	if (currentLevel < level)
		float currentXP = Game.GetXPForLevel(currentLevel)
		float targetXP = Game.GetXPForLevel(level)
		player.SetValue(Experience, targetXP - currentXP)
		Utility.Wait(1)
		Debug.Trace("TestSCScript: Set player level to " + level)
	ElseIf (currentLevel > level)
		Debug.Trace("TestSCScript: WARN: Player level " + currentLevel + " is already higher than specified level " + level, 1)
	EndIf
EndFunction


Function SetShipIfNeeded(int shipID=0)
	if (PlayerShip.GetShipRef() == None)
		SetShip(shipID)
	EndIf
EndFunction

Function SetShip(int shipID=0)
	if ((shipID >= 0) && (shipID < TestPlayerShips.Length))
		SetShipBase(TestPlayerShips[shipID])
	Else
		Debug.Trace("TestSCScript: ERROR: SetShip was passed an invalid ID: " + shipID, 2)
	EndIf
EndFunction

Function SetShipBase(SpaceshipBase shipBase)
	SpaceshipReference oldShip = PlayerShip.GetShipRef()
	if (oldShip != None)
		PlayerShipPilotSeat.GetRef().Activate(player)
		Utility.Wait(1)
		player.MoveTo(CTestCOCMarkerRef)
		oldShip.DisableNoWait()
		oldShip.Delete()
	EndIf
	SpaceshipReference newShip = NewGameShipMarkerRef.PlaceShipAtMe(shipBase)
	SQ_PlayerShip.ResetPlayerShip(newShip)
	SQ_PlayerShip.ResetHomeShip(newShip)
	InputEnableLayer myEnableLayer = InputEnableLayer.Create()
	myEnableLayer.DisablePlayerControls(abCamSwitch=True)
	player.MoveTo(newShip)
	SQ_PlayerShip.HandleShipTakeOff()
	PlayerShipPilotSeat.GetRef().Activate(player)
	myEnableLayer.Delete()
	waitingForPlayerToSit = True
	RegisterForRemoteEvent(Game.GetPlayer(), "OnSit")
	While(waitingForPlayerToSit)
		Utility.Wait(0.5)
	EndWhile
	newShip.MoveTo(TestSpaceCombatStartMarker.GetRef())
EndFunction


Function SpawnEnemy(int enemyID, int count, int distance, int levelMod, bool shouldNotDeleteEnemies)
	SetLevel()
	SetShipIfNeeded()
	if ((enemyID < 0) || (enemyID >= TestEnemyShips.Length))
		Debug.Trace("TestSCScript: ERROR: SpawnEnemy was passed an invalid EnemyID: " + enemyID, 2)
	Else
		if (!shouldNotDeleteEnemies)
			DeleteEnemies()
		EndIf
		if (count <= 0)
			count = 1
		EndIf
		if (distance <= 0)
			distance = TestDefaultEnemyShipSpawnDistance
		EndIf
		if (levelMod <= 0)
			levelMod = TestDefaultEnemyShipLevelMod
		EndIf
		levelMod = levelMod - 1
		SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
		float[] offsets = new float[6]
		offsets[1] = distance
		offsets[5] = 180
		int i = 0
		While (i < count)
			offsets[0] = i*125
			SpaceshipReference newEnemyShip = playerShipRef.PlaceShipAtMe(TestEnemyShips[enemyID], aiLevelMod=levelMod, abPlayFx=False, akOffsetValues=offsets)
			EnemyShips.AddRef(newEnemyShip)
			Debug.Trace("TestSCScript: Spawned Enemy: " + newEnemyShip)
			i = i + 1
		EndWhile
	EndIf
EndFunction


Function SpawnEnemyCell(int cellID, bool shouldNotDeleteEnemies)
	if ((cellID >= 0) && (cellID < TestEnemySpaceCells.Length))
		SpawnEnemyCellName(TestEnemySpaceCells[cellID], shouldNotDeleteEnemies)
	Else
		Debug.Trace("TestSCScript: ERROR: SpawnCell was passed an invalid ID: " + cellID, 2)
	EndIf
EndFunction

Function SpawnEnemyCellName(Cell cellToPlace, bool shouldNotDeleteEnemies)
	SetLevel()
	SetShipIfNeeded()
	if (!shouldNotDeleteEnemies)
		DeleteEnemies()
	EndIf
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	playerShipRef.PlaceCellAtMe(cellToPlace, EnemyShips)
	SpaceshipReference[] enemyShipRefs = EnemyShips.GetArray() as SpaceshipReference[]
	if (enemyShipRefs != None)
		int i = 0
		While (i < enemyShipRefs.Length)
			Debug.Trace("TestSCScript: Spawned Enemy: " + enemyShipRefs[i])
			i = i + 1
		EndWhile
	EndIf
EndFunction


Function DeleteEnemies()
	SpaceshipReference[] enemyShipRefs = EnemyShips.GetArray() as SpaceshipReference[]
	if (enemyShipRefs != None)
		int i = 0
		While (i < enemyShipRefs.Length)
			SpaceshipReference current = enemyShipRefs[i]
			EnemyShips.RemoveRef(enemyShipRefs[i])
			enemyShipRefs[i].DisableNoWait()
			enemyShipRefs[i].Delete()
			i = i + 1
		EndWhile
	EndIf
EndFunction


Function ResetPosition()
	PlayerShip.GetRef().MoveTo(TestSpaceCombatStartMarker.GetRef())
EndFunction

Function ResetAll()
	DeleteEnemies()
	ResetPosition()
EndFunction



Function TracePlayer()
	Debug.Trace("Player Ship: " + PlayerShip.GetShipRef())
EndFunction

Function TraceEnemies()
	int enemyShipCount = EnemyShips.GetCount()
	if (enemyShipCount == 0)
		Debug.Trace("TestSCScript: WARN: No enemy ships found.", 1)
	Else
		SpaceshipReference[] enemyShipRefs = EnemyShips.GetArray() as SpaceshipReference[]
		int i = 0
		While (i < enemyShipRefs.Length)
			Debug.Trace("Enemy " + i + ": " + enemyShipRefs[i])
			i = i + 1
		EndWhile
	EndIf
EndFunction