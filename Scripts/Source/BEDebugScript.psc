Scriptname BEDebugScript extends Quest
{Quest script for BEDebug, the Boarding Encounter Debug quest.}

Group QuestProperties CollapsedOnBase
	SQ_ParentScript property SQ_Parent Auto Const Mandatory
	SQ_PlayerShipScript property SQ_PlayerShip Auto Const Mandatory
	ReferenceAlias property PlayerShip Auto Const Mandatory
	LocationAlias property PlayerShipInteriorLocation Auto Const Mandatory
	ReferenceAlias property PlayerShipPilotSeat Auto Const Mandatory
	ReferenceAlias property Companion Auto Const Mandatory
	GlobalVariable property BEChanceMainGlobal Auto Const Mandatory
	GlobalVariable property BEChanceDerelictGlobal Auto Const Mandatory
	ObjectReference property NewAtlantisShipLandingMarker Auto Const Mandatory
	ActorValue property ShipSystemEngineHealth Auto Const Mandatory
	Keyword property CurrentInteractionLinkedRefKeyword Auto Const Mandatory
	ReferenceAlias property TestCreatedShip Auto Const Mandatory
EndGroup

;Local variables.
SpaceshipReference testShip
SpaceshipReference testShipWaitingForBE
bool skipInstantBoardingAfterDocking
BEScript testShipQuest

Function TestBE(String testBEQuestName, SpaceshipBase testBEShip, bool skipInstantBoarding)
	Start()
	if (testBEQuestName == "")
		Debug.Trace("ERROR: BEDebugScript: TestBE: TestBE requires a debug quest name.", 2)
		return
	EndIf
	SQ_Parent.SendBEForceStopEvent()
	While((testShipQuest != None) && (testShipQuest.IsRunning()))
		Utility.Wait(0.1)
	EndWhile
	BEChanceMainGlobal.SetValue(100)
	BEChanceDerelictGlobal.SetValue(100)
	Debug.ExecuteConsole("SetDebugQuest " + testBEQuestName + " 1 1")

	Actor player = Game.GetPlayer()
	ObjectReference playerShipPilotSeatRef = PlayerShipPilotSeat.GetRef()
	Location playerShipInteriorLoc = PlayerShipInteriorLocation.GetLocation() 
	if ((playerShipInteriorLoc == None) || (playerShipPilotSeatRef == None))
		Debug.Trace("ERROR: BEDebugScript: TestBE: Tried to verify the player was in their ship, but failed. You must be in space to use TestBE.", 2)
	Else
		if (player.GetCurrentLocation() == playerShipInteriorLoc)
			Debug.Trace("BEDebugScript: TestBE: Verified the player was already on their ship, so skipping move.")
		Else
			Debug.Trace("BEDebugScript: TestBE: Moving the player back to their ship.")
			player.MoveTo(playerShipPilotSeatRef)
		EndIf

		testShipWaitingForBE = TestBESpawn(testBEShip)
		if (testShipWaitingForBE == None)
			Debug.Trace("WARN: BEDebugScript: TestBE: TestBESpawn did not return a ship, so skipping instant docking.", 1)
		Else
			Debug.Trace("BEDebugScript: TestBE: TestBESpawn spawned " + testShipWaitingForBE.GetBaseObject() + " " + testShipWaitingForBE + ". Attempting instant docking.", 0)
			RegisterForCustomEvent(SQ_Parent, "SQ_BEStarted")
			skipInstantBoardingAfterDocking = skipInstantBoarding
			PlayerShip.GetShipRef().InstantDock(testShipWaitingForBE)
		EndIf
	EndIf
EndFunction

SpaceshipReference Function TestBESpawn(SpaceshipBase testBEShip)
	if (testBEShip == None)
		Debug.Trace("WARN: BEDebugScript: TestBESpawn: Was not given a ship to spawn.", 1)
	Else
		SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
		if (playerShipRef == None)
			Debug.Trace("ERROR: BEDebugScript: TestBESpawn: Was given a ship to spawn, but you have no player ship. You must be in space to spawn a ship.", 2)
		Else
			if (playerShipRef.IsDocked())
				playerShipRef.InstantUndock()
			EndIf
			if (testShip != None)
				testShip.Disable()
				testShip.Delete()
			EndIf
			if (testShipWaitingForBE != None)
				testShipWaitingForBE.Disable()
				testShipWaitingForBE.Delete()
			EndIf
			float[] offsets = new float[6]
			offsets[1] = 250
			testShip = PlayerShip.GetRef().PlaceShipAtMe(testBEShip, abPlayFx=False, akOffsetValues=offsets)
			testShip.EnablePartRepair(ShipSystemEngineHealth, false)
			testShip.DamageValue(ShipSystemEngineHealth, 100000)
			testShip.WaitFor3DLoad()
			return testShip
		EndIf
	EndIf
EndFunction

Event SQ_ParentScript.SQ_BEStarted(SQ_ParentScript akSender, Var[] akArgs)
	SpaceshipReference enemyShip = akArgs[0] as SpaceshipReference
	BEScript enemyShipBEQuest = akArgs[1] as BEScript
	Debug.Trace("BEDebugScript: SQ_BEStarted: Received SQ_BEStarted for " + enemyShip + " " + enemyShipBEQuest, 0)
	if (enemyShip == testShipWaitingForBE)
		testShipQuest = enemyShipBEQuest
		testShipWaitingForBE = None
		if (skipInstantBoardingAfterDocking)
			Debug.Trace("BEDebugScript: SQ_BEStarted is skipping instant boarding per request.", 0)
		Else
			TestBEInstantBoard(enemyShip, enemyShipBEQuest)
		EndIf
	EndIf
EndEvent

Function TestBEInstantBoard(SpaceshipReference enemyShip, BEScript enemyShipBEQuest)
	Debug.Trace("BEDebugScript: TestBEInstantBoard: Attempting instant boarding of " + enemyShip, 0)
	ObjectReference loadMarker = enemyShipBEQuest.GetEnemyShipLoadDoorMarker()
	Actor player = Game.GetPlayer()
	player.MoveTo(loadMarker)
	Actor companionRef = Companion.GetActorRef()
	if (companionRef != None)
		companionRef.MoveTo(player)
	EndIf
EndFunction

Function TestBEUndock()
	PlayerShip.GetShipRef().InstantUndock()
EndFunction


ObjectReference Function TestSpawnShip(Form testObject)
	if (testObject == None)
		Debug.Trace("WARN: BEDebugScript: TestSpawn: Was not given a ship to spawn.", 1)
	Else
		SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
		if (playerShipRef == None)
			Debug.Trace("ERROR: BEDebugScript: TestSpawn: Was given a ship to spawn, but you have no player ship. You must be in space to spawn a ship.", 2)
		Else
			float[] offsets = new float[6]
			offsets[1] = 250
			testShip = PlayerShip.GetRef().PlaceShipAtMe(testObject, akOffsetValues=offsets)
			TestCreatedShip.ForceRefTo(testShip)
		EndIf
	EndIf
EndFunction


Function SetHomeShip(Form newShipBase)
	SpaceshipReference oldPlayerShipRef = PlayerShip.GetShipRef()
	oldPlayerShipRef.Disable()
	SpaceshipReference newPlayerShipRef = NewAtlantisShipLandingMarker.PlaceShipAtMe(newShipBase, abPlayFx=False, abInitiallyDisabled=True)
	SQ_PlayerShip.ResetHomeShip(newPlayerShipRef)
	newPlayerShipRef.SetLinkedRef(NewAtlantisShipLandingMarker, CurrentInteractionLinkedRefKeyword)
	newPlayerShipRef.Enable()
EndFunction