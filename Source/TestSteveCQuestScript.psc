Scriptname TestSteveCQuestScript extends Quest

ReferenceAlias property TestSteveCHoldingContainer Auto Const Mandatory

TextureSet property Decal_JGVectera01 Auto Const Mandatory
ObjectReference testDecal

ReferenceAlias property PlayerShip Auto Const Mandatory
Cell property TestSteveCSpaceCell Auto Const Mandatory
RefCollectionAlias property TestSpaceCellRefs Auto Const Mandatory
RefCollectionAlias property TestSpaceCellRefs_Ship01 Auto Const Mandatory
ReferenceAlias property TestSpaceCellRefs_Ship02 Auto Const Mandatory
ReferenceAlias property DebugText Auto Const Mandatory
ReferenceAlias property TestDoor Auto Const Mandatory
SpaceshipBase property PirateShipModular01 Auto Const Mandatory
SpaceshipBase[] property TestShips Auto Const Mandatory
ReferenceAlias property TestLinkedRefShip Auto Const Mandatory
ReferenceAlias property TestLinkedRefNonship Auto Const Mandatory
ReferenceAlias property TestLinkedRefNonship2 Auto Const Mandatory
ReferenceAlias property TestLever Auto Const Mandatory
Keyword property BEDisembarkerLink Auto Const Mandatory
Message property MQ206D_PowerInterlock_Disengage Auto Const Mandatory
Message property MQ206D_PowerInterlock_Engage Auto Const Mandatory
ReferenceAlias property SimonSaysMarker Auto Const Mandatory
ReferenceAlias property SimonSaysActor Auto Const Mandatory
Spell property LC088_DefensiveBatteryFireProjectileSpell Auto Const Mandatory
Static property XMarker Auto Const Mandatory
ObjectReference property TestSteveCSpaceTrigger1Ref Auto Const Mandatory
SpaceshipReference property TestSteveCDockingParentShipRef Auto Const Mandatory
SpaceshipReference property TestSteveCDockingChildShipRef Auto Const Mandatory
ObjectReference property TestSteveCAsteroidRef Auto Const Mandatory
ObjectReference property TestSteveCBossChest Auto Const Mandatory
Message property TestSteveCOnActivateEventMessage Auto Const Mandatory
Message property TestSteveCOnOpenEventMessage Auto Const Mandatory
Message property TestMessageBox01 Auto Const Mandatory
ReferenceAlias property TestAliasedItem01 Auto Const Mandatory
ReferenceAlias property TestAliasedItem02 Auto Const Mandatory
ReferenceAlias property TestSteveCUniqueShip Auto Const Mandatory
ReferenceAlias property TheKeyMapMarkerHeadingRef Auto Const Mandatory
ReferenceAlias property TheKeyAlternateMapMarkerHeadingRef Auto Const Mandatory
ReferenceAlias property TheKeyOriginMarkerRef Auto Const Mandatory
ReferenceAlias property SuvorovPlanetUniqueArrivalMarkerRef Auto Const Mandatory
ReferenceAlias property DefensiveBatteryLaphaMapMarkerHeadingRef Auto Const Mandatory
ObjectReference property TestSteveCTerminalRef Auto Const Mandatory
Perk property TestVorpalShipPerk Auto Const Mandatory
ObjectReference property TestSteveCAmbushLeverRef Auto Const Mandatory
ObjectReference property TestSteveCAmbushMarkerRef Auto Const Mandatory
ObjectReference property MQ206DLandingMarkerRef Auto Const Mandatory
SpaceshipBase property TestLeveledShip Auto Const Mandatory
ReferenceAlias property LC165TestStarbornCaster Auto Const Mandatory
ActorValue property LC165_StarbornStateValue Auto Const Mandatory
Spell property LC165_Starborn_Bridge_GravityWell Auto Const Mandatory
Keyword property LinkCustom01 Auto Const Mandatory
RefCollectionAlias property PipeTraps Auto Const Mandatory
SpaceshipReference property TestDisembarking02 Auto Const Mandatory
ReferenceAlias property TestDialogueBugs2Actor Auto Const Mandatory
Faction property LC165StarbornEnemyFaction Auto Const Mandatory
ActorValue property Aggression Auto Const Mandatory
ActorValue property Confidence Auto Const Mandatory
Spell property AIPower_VoidForm Auto Const Mandatory
Spell property LC165_Scripted_VoidFormAb Auto Const Mandatory
Spell property TestSteveCStarbornCasterScriptedSpell Auto Const Mandatory
Formlist property FilterList_InventoryCategoryAidFood Auto Const Mandatory
ObjectReference property TestSteveCCloseDoorOnDetachRef Auto Const Mandatory
ObjectReference property TestSteveCProjectileSourceMarkerRef Auto Const Mandatory
ObjectReference property TestSteveCTrafficManagerSettingsRef Auto Const Mandatory
ReferenceAlias property TestSwapActor01 Auto Const Mandatory
ReferenceAlias property TestSwapActor02 Auto Const Mandatory
Spell property LC165_AbTeleportSwapIn Auto Const Mandatory
Spell property LC165_AbTeleportSwapOut Auto Const Mandatory
Explosion property LC165_StarbornTeleportSwapExplosion Auto Const Mandatory
int CONST_TestSwapTimerDelay = 5 Const
int CONST_TestSwapTimerID = 2 Const
int CONST_TeleportOutVFXDelay = 2 Const


SpaceshipReference testShipN

Function TestSpawnLeveledShip(int difficulty)
	if (testShipN != None)
		testShipN.Disable()
		testShipN.Delete()
	EndIf
	SpaceshipReference ship = PlayerShip.GetShipRef()
	testShipN = ship.PlaceShipNearMe(TestLeveledShip, ship.CONST_NearPosition_DeadAhead, ship.CONST_NearDistance_Close, ship.CONST_NearFacing_Direct, aiLevelMod=difficulty)
	Debug.Trace("EnemyShipLevel: " + testShipN.GetLevel() + " " + testShipN.GetLeveledSpaceshipBase())
EndFunction



Event OnQuestStarted()
	RegisterForRemoteEvent(TestSteveCSpaceTrigger1Ref, "OnTriggerEnter")
	RegisterForRemoteEvent(TestSteveCSpaceTrigger1Ref, "OnTriggerLeave")
	RegisterForRemoteEvent(TestSteveCBossChest, "OnActivate")
	RegisterForRemoteEvent(TestSteveCBossChest, "OnOpen")
	RegisterForRemoteEvent(TestSteveCAmbushLeverRef, "OnActivate")
	RegisterForRemoteEvent(TestSteveCCloseDoorOnDetachRef, "OnCellDetach")
	RegisterForRemoteEvent(TestSwapActor01, "OnLoad")
EndEvent

Function TestSpaceCell()
	PlayerShip.GetRef().PlaceCellAtMe(TestSteveCSpaceCell, TestSpaceCellRefs)
	TestSpaceCellRefs_Ship01.RefillAlias()
	TestSpaceCellRefs_Ship02.RefillAlias()
EndFunction

Function SetDebugTextColor(int r, int g, int b, int a)
	DebugText.GetRef().SetDebugTextColor(r, g, b, a)
EndFunction

Function SetDebugTextSize(int s)
	DebugText.GetRef().SetDebugTextSize(s)
EndFunction

Function SetDebugTextString(String t)
	DebugText.GetRef().SetDebugTextString(t)
EndFunction

Function SetDebugTextBillboard(bool b)
	DebugText.GetRef().SetDebugTextBillboard(b)
EndFunction

Function SetLockedWithDelay(bool shouldUnlock)
	Utility.Wait(2)
	if (shouldUnlock)
		TestDoor.GetRef().Unlock()
	Else
		TestDoor.GetRef().Lock()
	EndIf
EndFunction

Function SpawnTestShip(int i)
	float[] offsets = new float[6]
	offsets[1] = 1000
	ObjectReference marker = PlayerShip.GetRef().PlaceShipAtMe(TestShips[i], akOffsetValues=offsets)
EndFunction

Function MoveShip1(SpaceshipReference ship)
	ship.MoveTo(ship)
EndFunction

Function MoveShip2(SpaceshipReference ship)
	float[] offsets = new float[6]
	offsets[1] = 1000
	ObjectReference marker = ship.PlaceAtMe(XMarker, akOffsetValues=offsets)
	ship.MoveTo(marker)
EndFunction

Function MoveShip3(SpaceshipReference ship)
	ship.Disable()
	float[] offsets = new float[6]
	offsets[1] = 1000
	ObjectReference marker = ship.PlaceAtMe(XMarker, akOffsetValues=offsets)
	ship.MoveTo(marker)
	ship.Enable()
EndFunction

Function MoveShip4()
	ObjectReference newShip = PlayerShip.GetRef().PlaceShipAtMe(PirateShipModular01)
	float[] offsets = new float[6]
	offsets[1] = 1000
	ObjectReference marker = PlayerShip.GetRef().PlaceAtMe(XMarker, akOffsetValues=offsets)
	newShip.MoveTo(marker)
	newShip.Enable()
EndFunction

Function TestShipOpen(SpaceshipReference s, bool shouldBeOpen)
	s.SetOpen(shouldBeOpen)
	Debug.Trace("Tried it.")
EndFunction

Function TestGravJumpVFX(SpaceshipReference ship, bool shouldEnable)
	if (shouldEnable)
		ship.EnableWithGravJump()
	Else
		ship.DisableWithGravJump()
	EndIf
EndFunction

Function TraceLinkedRefs()
	ObjectReference testNonShip = TestLinkedRefNonship.GetRef()
	ObjectReference[] refsLinkedToMe3 = testNonShip.GetRefsLinkedToMe()
	Actor[] actorsLinkedToMe3 = testNonShip.GetActorsLinkedToMe()
	Debug.Trace("Tracing NONSHIP Unnamed Linked Ref: " + refsLinkedToMe3.Length + " " + actorsLinkedToMe3.Length)
	ObjectReference[] refsLinkedToMe4 = testNonShip.GetRefsLinkedToMe(BEDisembarkerLink)
	Actor[] actorsLinkedToMe4 = testNonShip.GetActorsLinkedToMe(BEDisembarkerLink)
	Debug.Trace("Tracing NONSHIP Named Linked Ref: " + refsLinkedToMe4.Length + " " + actorsLinkedToMe4.Length)	
EndFunction


;----------------------------------------
;Container Inventory Bug Test Cases
;----------------------------

ReferenceAlias property MentatsAlias1 Auto Const Mandatory
ReferenceAlias property MentatsAlias2 Auto Const Mandatory
ReferenceAlias property BerryMentatsAlias1 Auto Const Mandatory
ReferenceAlias property BerryMentatsAlias2 Auto Const Mandatory
ReferenceAlias property BourbonAlias Auto Const Mandatory

Function AddBourbonByRef()
	ObjectReference aliasedBourbonRef = BourbonAlias.GetRef()
	Game.GetPlayer().AddItem(aliasedBourbonRef)
EndFunction

Function AddBerryMentatsByRef()
	ObjectReference aliasedBerryMentats = BerryMentatsAlias1.GetRef()
	Game.GetPlayer().AddItem(aliasedBerryMentats)
EndFunction




RefCollectionAlias property TestActivators Auto Const Mandatory
GlobalVariable property TestSteveCCurrentCountGlobal Auto Const Mandatory
GlobalVariable property TestSteveCTotalCountGlobal Auto Const Mandatory
GlobalVariable property TestSteveCQuestTargetsGlobal Auto Const Mandatory
ObjectReference[] allTestActivators
int currentActivatorCount

Function TestActivatorCounting()
	currentActivatorCount = 0
	TestSteveCCurrentCountGlobal.SetValue(currentActivatorCount)
	if (allTestActivators == None)
		int totalActivatorCount = TestActivators.GetCount()
		TestSteveCTotalCountGlobal.SetValue(totalActivatorCount)
		UpdateCurrentInstanceGlobal(TestSteveCTotalCountGlobal)
		allTestActivators = new ObjectReference[totalActivatorCount]
		int i = 0
		While (i < allTestActivators.Length)
			allTestActivators[i] = TestActivators.GetAt(i)
			RegisterForRemoteEvent(allTestActivators[i], "OnActivate")
			i = i + 1
		EndWhile
	EndIf
	UpdateActivatorCount()
EndFunction

Function TestActivatorsBlockActivation(bool abBlocked, bool abHideActivateText)
	int i = 0
	While (i < allTestActivators.Length)
		allTestActivators[i].BlockActivation(abBlocked, abHideActivateText)
		i = i + 1
	EndWhile
EndFunction

Function UpdateActivatorCount()
	TestSteveCCurrentCountGlobal.SetValue(currentActivatorCount)
	UpdateCurrentInstanceGlobal(TestSteveCCurrentCountGlobal)
	UpdateCurrentInstanceGlobal(TestSteveCTotalCountGlobal)
	SetObjectiveDisplayed(300,True)
	Debug.Trace("Val="+(currentActivatorCount%2))
	if ((currentActivatorCount%2) > 0)
		SetObjectiveDisplayed(302,False)
		SetObjectiveDisplayed(301,True)
	Else
		SetObjectiveDisplayed(301,False)
		SetObjectiveDisplayed(302,True)
	EndIf
EndFunction

Function SetActivatorCount(int newCount, bool redisplay)
	TestSteveCCurrentCountGlobal.SetValue(newCount)
	UpdateCurrentInstanceGlobal(TestSteveCCurrentCountGlobal)
	if (redisplay)
		SetObjectiveDisplayed(300,True,True)
	EndIf
EndFunction


Auto State Waiting
	Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
		GoToState("Busy")
		if (akSource == TestSteveCBossChest)
			TestSteveCOnActivateEventMessage.Show()
		ElseIf (akSource == TestSteveCAmbushLeverRef)
			if (TestSteveCAmbushMarkerRef.IsDisabled())
				TestSteveCAmbushMarkerRef.Enable()
			Else
				TestSteveCAmbushMarkerRef.Disable()
			EndIf
		Else
			;TestSteveCOnActivateEventMessage.Show()
			if (TestActivators.Find(akSource) >= 0)
				TestActivators.RemoveRef(akSource)
				currentActivatorCount = currentActivatorCount + 1
			Else
				TestActivators.AddRef(akSource)
				currentActivatorCount = currentActivatorCount - 1
			EndIf
			UpdateActivatorCount()
		EndIf
		Utility.Wait(5)
		GoToState("Waiting")
	EndEvent
EndState

State Busy
	Event OnBeginState(String oldState)
		Debug.Trace("Busy begin.")
	EndEvent

	Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
		Debug.Trace("Ignored; busy.")
	EndEvent

	Event OnEndState(String newState)
		Debug.Trace("Busy end.")
	EndEvent
EndState

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
EndEvent

Event ObjectReference.OnOpen(ObjectReference akSource, ObjectReference akActionRef)
	if (akSource == TestSteveCBossChest)
		TestSteveCOnOpenEventMessage.Show()
	EndIf
EndEvent

Function SetActivateTextOverride(int index)
	if (index == 0)
		TestLever.GetRef().SetActivateTextOverride(MQ206D_PowerInterlock_Engage)
	Else
		TestLever.GetRef().SetActivateTextOverride(MQ206D_PowerInterlock_Disengage)
	EndIf
EndFunction

Function TestPlayBink(bool shouldWait)
	if (shouldWait)
		Game.PlayBink("artifactvision.bk2")
	Else
		Game.PlayBinkNoWait("artifactvision.bk2")
	EndIf
	Debug.Trace("0s")
	Utility.Wait(3)
	Debug.Trace("3s")
	Utility.Wait(3)
	Debug.Trace("6s")
	Utility.Wait(3)
	Debug.Trace("9s")
	Utility.Wait(3)
	Debug.Trace("12s")
EndFunction

Function TestCast(ObjectReference source, ObjectReference target)
	LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target)
	Utility.Wait(2)
	LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target)
	Utility.Wait(2)
	LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target)
	Utility.Wait(2)
	LC088_DefensiveBatteryFireProjectileSpell.Cast(source, target)
EndFunction

Function TestCastFromProjectileSource()
	LC088_DefensiveBatteryFireProjectileSpell.Cast(TestSteveCProjectileSourceMarkerRef, PlayerShip.GetRef())
EndFunction


Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
	Debug.Trace("Got OnTriggerEnter")
	StartTimer(0, 1)
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akTriggerRef)
	Debug.Trace("Got OnTriggerLeave")
EndEvent

Event OnTimer(int timerID)
	if (timerID == 1)
		if (TestSteveCSpaceTrigger1Ref.IsInTrigger(PlayerShip.GetRef()))
			Debug.Trace("    IN TRIGGER")
			StartTimer(1, 1)
		Else
			Debug.Trace("NOT IN TRIGGER")
		EndIf
	ElseIf (timerID == CONST_TestSwapTimerID)
		TestSwap()
		StartTimer(CONST_TestSwapTimerDelay, CONST_TestSwapTimerID)
	EndIf
EndEvent


Function MoveDockingParent()
	TestSteveCDockingParentShipRef.MoveTo(TestSteveCDockingParentShipRef, 200, 200, 200)
EndFunction

Function TraceLinkedRefChildren()
	Debug.Trace(TestSteveCAsteroidRef + "'s linked ref: " + TestSteveCAsteroidRef.GetLinkedRef())
	Debug.Trace(TestSteveCDockingChildShipRef + "'s linked ref: " + TestSteveCDockingChildShipRef.GetLinkedRef())
	Debug.Trace(TestSteveCDockingParentShipRef + "'s Refs Linked To Me:")
	ObjectReference[] refsLinkedToParent = TestSteveCDockingParentShipRef.GetRefsLinkedToMe()
	int i = 0
	While (i < refsLinkedToParent.Length)
		Debug.Trace(refsLinkedToParent[i])
		i = i + 1
	EndWhile
EndFunction

Spell property TestSteveCPerkSpell Auto Const Mandatory

Function AddPerkSpell(SpaceshipReference myShip)
	myShip.AddSpell(TestSteveCPerkSpell)
EndFunction

Function DispelPerkSpell(SpaceshipReference myShip)
	myShip.DispelSpell(TestSteveCPerkSpell)
EndFunction

Function DisplayMessageBox()
	TestMessageBox01.Show()
EndFunction



Function MoveAliasedItemToContainer01()
	TestSteveCHoldingContainer.GetRef().AddItem(TestAliasedItem01.GetRef())
EndFunction

Function MoveAliasedItemToPlayer01()
	Game.GetPlayer().AddItem(TestAliasedItem01.GetRef())
EndFunction


Function MoveAliasedItemToContainer02()
	Game.GetPlayer().RemoveItem(TestAliasedItem02.GetRef(), akOtherContainer=TestSteveCHoldingContainer.GetRef())
EndFunction

Function MoveAliasedItemToPlayer02()
	Game.GetPlayer().AddItem(TestAliasedItem02.GetRef())
EndFunction



Function TraceMyLinkedRefs(ObjectReference obj)
	Debug.Trace(obj + "'s linked ref: " + obj.GetLinkedRef())
	Debug.Trace(obj + "'s linked ref children:")
	ObjectReference[] refsLinkedToMe = obj.GetRefsLinkedToMe()
	int i = 0
	While (i < refsLinkedToMe.Length)
		Debug.Trace(" " + i + "-" + refsLinkedToMe[i])
		i = i + 1
	EndWhile
EndFunction

Function TraceObjectsInTrigger(ObjectReference obj)
	Debug.Trace("Count: " + obj.GetTriggerObjectCount())
EndFunction


Function MoveKeyMapMarkerHeading(bool returnToOriginalPosition)
	if (returnToOriginalPosition)
		TheKeyMapMarkerHeadingRef.GetRef().MoveTo(TheKeyOriginMarkerRef.GetRef())
	Else
		TheKeyMapMarkerHeadingRef.GetRef().MoveTo(TheKeyAlternateMapMarkerHeadingRef.GetRef())
	EndIf
EndFunction

Function MoveSuvorovArrivalMarker(bool returnToOriginalPosition)
	if (returnToOriginalPosition)
		SuvorovPlanetUniqueArrivalMarkerRef.GetRef().MoveTo(TheKeyOriginMarkerRef.GetRef())
	Else
		SuvorovPlanetUniqueArrivalMarkerRef.GetRef().MoveTo(DefensiveBatteryLaphaMapMarkerHeadingRef.GetRef())
	EndIf
EndFunction

Function TestValues(int value1, int value2)
	TestSteveCTerminalRef.AddTextReplacementValue("Value1", value1)
	TestSteveCTerminalRef.AddTextReplacementValue("Value2", value2)
EndFunction


ReferenceAlias property TestTurret Auto Const Mandatory

Function TraceTurretLOS()
	Actor turretRef = TestTurret.GetActorRef()
	Actor playerRef = Game.GetPlayer()
	Debug.Trace("Turret to Player, Direct: " + turretRef.HasDirectLOS(playerRef))
	Debug.Trace("Player to Turret, Direct: " + playerRef.HasDirectLOS(turretRef))
	Debug.Trace("Turret to Player, Detection: " + turretRef.HasDetectionLOS(playerRef))
	Debug.Trace("Player to Turret, Detection: " + playerRef.HasDetectionLOS(turretRef))
EndFunction

Function SetIgnoreFriendlyHits(bool shouldIgnoreFriendlyHits)
	ObjectReference shipRef = TestSteveCUniqueShip.GetRef()
	Debug.Trace("Is TestSteveCUniqueShipRef ignoring friendly hits before? " + shipRef.IsIgnoringFriendlyHits())
	shipRef.IgnoreFriendlyHits(shouldIgnoreFriendlyHits)
	Debug.Trace("Is TestSteveCUniqueShipRef ignoring friendly hits after? " + shipRef.IsIgnoringFriendlyHits())
EndFunction

Function AddVorpalShipPerk()
	PlayerShip.GetShipRef().AddPerk(TestVorpalShipPerk)
EndFunction

Function RegisterForShipHit()
	RegisterForHitEvent(TestSteveCDockingParentShipRef)
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	Debug.Trace("Got Ship Hit.")
EndEvent


SQ_ParentScript property SQ_Parent Auto Const Mandatory

Function RegisterForTestBE(SpaceshipReference testBEShipRef)
	RegisterForCustomEvent(SQ_Parent, "SQ_BEStarted")
EndFunction

Event SQ_ParentScript.SQ_BEStarted(SQ_ParentScript source, Var[] akArgs)
	Debug.Trace("The quest that started was " + akArgs[1] + " for " + akArgs[0])
EndEvent

Function TraceGravity(ObjectReference testObject)
	Debug.Trace(testObject.GetGravityScale())
EndFunction

Function TestCastSpell(int spellID)
	Actor caster = LC165TestStarbornCaster.GetActorRef()
	RegisterForRemoteEvent(caster, "OnSpellCast")
	caster.SetValue(LC165_StarbornStateValue, spellID)
	caster.EvaluatePackage()
EndFunction

Event ObjectReference.OnSpellCast(ObjectReference akSource, Form akSpell)
	int spellID = akSource.GetValue(LC165_StarbornStateValue) as int
	Debug.Trace("TestSteveCQuestScript got OnSpellCast, ID=" + spellID)
	if (spellID == 1)
		LC165_Starborn_Bridge_GravityWell.Cast(akSource, akSource.GetLinkedRef(LinkCustom01))
	ElseIf (spellID == 2)
		AIPower_VoidForm.Cast(akSource, akSource)
	ElseIf (spellID == 3)
		akSource.AddSpell(LC165_Scripted_VoidFormAb)
	EndIf
	akSource.SetValue(LC165_StarbornStateValue, 0)
	(akSource as Actor).EvaluatePackage()
EndEvent

ObjectReference property TestPlatformHelperRef Auto Const Mandatory

Function SetVariable(String name, float value)
	TestPlatformHelperRef.SetAnimationVariableFloat(name, value)
EndFunction

Function PlayAnimation(String name)
	TestPlatformHelperRef.PlayAnimation(name)
EndFunction


Function BreakPipes()
	ObjectReference[] pipes = PipeTraps.GetArray()
	int i = 0
	While (i < pipes.Length)
		TrapPipeSpray pipe = pipes[i] as TrapPipeSpray
		if (pipe != None)
			pipe.BreakPipe()
			Debug.Trace("WORKED: " + pipe + " was cast to TrapPipeSpray.")
		Else
			Debug.Trace("ERROR: " + pipe + " failed to cast to TrapPipeSpray.")
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function SetTestDisembarking02Inaccessible(bool shouldBeInaccessible)
	TestDisembarking02.SetExteriorLoadDoorInaccessible(shouldBeInaccessible)
EndFunction

Actor temp

Function DuplicatePlayer()
	temp = Game.GetPlayer().PlaceDuplicateActorAtMe(Game.GetPlayer())
	temp.RemoveFromAllFactions()
	temp.AddToFaction(LC165StarbornEnemyFaction)
	temp.SetValue(Aggression, 2)
	temp.SetValue(Confidence, 4)
	temp.SetGroupFaction(None)
	temp.StartCombat(Game.GetPlayer())
EndFunction

Function TraceHasSpell()
	Debug.Trace("TraceHasSpell " + LC165TestStarbornCaster.GetActorRef() + " has spell " + TestSteveCStarbornCasterScriptedSpell + "? =" + LC165TestStarbornCaster.GetActorRef().HasSpell(TestSteveCStarbornCasterScriptedSpell))
EndFunction

Function ForceAddSpell()
	LC165TestStarbornCaster.GetActorRef().AddSpell(TestSteveCStarbornCasterScriptedSpell)
EndFunction


Function TestGivingFood()
	Actor testActor = TestDialogueBugs2Actor.GetActorRef()
	RegisterForRemoteEvent(testActor, "OnItemAdded")
	testActor.OpenOneWayTransferMenu(True, FilterList_InventoryCategoryAidFood)
EndFunction

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
	SetStage(600)
EndEvent

Event ObjectReference.OnCellDetach(ObjectReference akSource)
	Debug.Trace("Closing door OnCellDetach.")
	akSource.SetOpen(False)
EndEvent

Function ClearDialogueBugsActorAlias()
	TestDialogueBugs2Actor.Clear()
EndFunction

Function TestLOSToPlayer(Actor source)
	int i = 0
	While (i < 500)
		Debug.Trace(source.HasDirectLOS(Game.GetPlayer()))
		Utility.Wait(0.5)
		i = i + 1
	EndWhile
EndFunction

Function TestArrays()
	int[] testArray = new int[1]
	testArray[0] = 591
	int[] test2 = testArray
	testArray[0] = 592
	int[] test3 = testArray
	Debug.Trace("Done")
EndFunction

Function TestSnap(ObjectReference target)
	Game.GetPlayer().SnapIntoInteraction(target)
EndFunction

Function TestActivate(ObjectReference target)
	Game.GetPlayer().Activate(target)
EndFunction

Function TestOpen(ObjectReference target)
	target.SetOpen()
EndFunction

Function TestSnap2(ObjectReference target)
	target.Disable()
	target.Enable()
	Game.GetPlayer().SnapIntoInteraction(target)
EndFunction



Event ReferenceAlias.OnLoad(ReferenceAlias source)
	if (source == TestSwapActor01)
		StartTimer(CONST_TestSwapTimerDelay, CONST_TestSwapTimerID)
	EndIf
EndEvent

Function TestSwap()
	Actor testSwapActor01Ref = TestSwapActor01.GetActorRef()
	Actor testSwapActor02Ref = TestSwapActor02.GetActorRef()
	testSwapActor01Ref.RemoveSpell(LC165_AbTeleportSwapIn)
	testSwapActor02Ref.RemoveSpell(LC165_AbTeleportSwapIn)
	ObjectReference swapMarker1 = testSwapActor01Ref.PlaceAtMe(XMarker)
	ObjectReference swapMarker2 = testSwapActor02Ref.PlaceAtMe(XMarker)
	swapMarker1.PlaceAtMe(LC165_StarbornTeleportSwapExplosion)
	TeleportIn(testSwapActor01Ref, teleportInSpell=LC165_AbTeleportSwapIn)
	TeleportIn(testSwapActor02Ref, teleportInSpell=LC165_AbTeleportSwapIn)
	testSwapActor01Ref.MoveTo(swapMarker2)
	testSwapActor02Ref.MoveTo(swapMarker1)
	swapMarker1.Delete()
	swapMarker2.Delete()
EndFunction


Function TeleportIn(Actor target, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None)
	if (target != None)
		if (teleportInSpell == None)
			teleportInSpell = LC165_AbTeleportSwapIn
		EndIf
		if (teleportOutSpell == None)
			teleportOutSpell = LC165_AbTeleportSwapOut
		EndIf

		if (teleportInExplosion != None)
			target.PlaceAtMe(teleportInExplosion)
		EndIf
		target.RemoveSpell(teleportOutSpell)
		target.AddSpell(teleportInSpell)
	EndIf
EndFunction

Function TeleportOut(Actor target, Spell teleportInSpell=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0, bool shouldDisable=False)
	if (target != None)
		if (teleportInSpell == None)
			teleportInSpell = LC165_AbTeleportSwapIn
		EndIf
		if (teleportOutSpell == None)
			teleportOutSpell = LC165_AbTeleportSwapOut
		EndIf

		if (teleportOutExplosion != None)
			target.PlaceAtMe(teleportOutExplosion)
		EndIf
		target.RemoveSpell(teleportInSpell)
		target.AddSpell(teleportOutSpell)
		Utility.Wait(teleportOutSpellDelay)
		if (shouldDisable)
			target.Disable()
		EndIf
	EndIf
EndFunction

Function CombatTeleportNearRef(Actor actorToTeleport, ObjectReference sourceRef, float minDistance=0.0, float maxDistance=0.0, bool allowZOffset=True, bool alwaysInFront=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	if (!actorToTeleport.IsDead())
		float[] akOffsets = new float[3]
		ObjectReference target = sourceRef.PlaceAtMe(XMarker, akOffsetValues=akOffsets)
		if ((minDistance > 0) || (maxDistance > 0))
			target.MoveToNearestNavmeshLocation()
		EndIf
		CombatTeleport(actorToTeleport, target, False, teleportInSpell, teleportInExplosion, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
		target.Delete()
	EndIf
EndFunction

Function CombatTeleport(Actor actorToTeleport, ObjectReference target, bool shouldBeInvisibleAfterTeleport=False, Spell teleportInSpell=None, Explosion teleportInExplosion=None, Spell teleportOutSpell=None, Explosion teleportOutExplosion=None, float teleportOutSpellDelay=-1.0)
	TeleportOut(actorToTeleport, teleportInSpell, teleportOutSpell, teleportOutExplosion, teleportOutSpellDelay)
	actorToTeleport.MoveTo(target)
	TeleportIn(actorToTeleport, teleportInSpell, teleportInExplosion, teleportOutSpell)
EndFunction