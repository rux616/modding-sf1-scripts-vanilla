;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_SFBGS003_SFTA00_FD00492D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE DefaultFollowerToggleQuestScript
Quest __temp = self as Quest
DefaultFollowerToggleQuestScript kmyQuest = __temp as DefaultFollowerToggleQuestScript
;END AUTOCAST
;BEGIN CODE
SFBGS003_DialogueTAHQ.SetStage(1)
SFBGS003_MiscPointer.SetStage(1000)

Actor myPlayer = Game.GetPlayer()
myPlayer.AddPerk(BackgroundBountyHunter)
myPlayer.AddPerk(Skill_Intimidation)
myPlayer.AddPerk(Skill_Deception)

If !GetStageDone(2) && !GetStageDone(3)
	myPlayer.MoveTo(Alias_Roach.GetActorRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(1)
SetStage(200)
SetStage(300)
If !GetStageDone(3)
	Actor myHannibal = Alias_Hannibal.GetActorRef()
	Game.GetPlayer().Moveto(myHannibal)
	Alias_Roach.GetActorRef().Moveto(myHannibal)
EndIf

SetStage(325)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(1)
SetStage(100)
SetStage(200)
SetStage(300)
SetStage(400)
SetStage(500)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(810)
SetStage(850)
SetStage(900)

Actor myPlayer = Game.GetPlayer()
Alias_PlayerChopShopFriend.ForceRefTo(myPlayer)

ObjectReference myDockingMarker = Alias_ChopShopDecoyDockingMarker.GetRef()
myDockingMarker.SetFactionOwner(PlayerFaction)


; Dock the Decoy Ship with the Chop Shop, 
; and move the player, Roach and Adrastos/Hannibal there
SpaceshipReference myDecoyShip = Alias_DecoyShip.GetShipRef()
myDecoyShip.Enable()

SpaceshipReference myChopShopStation = Alias_ChopShopStation.GetShipRef()
myChopShopStation.SetValue(DockingPermission, 0)

myDecoyShip.InstantDock(myChopShopStation)

myDockingMarker.SetFactionOwner(SFTA00_ChopShopStationFriendFaction)

myPlayer.MoveTo(Alias_DecoyShipHannibalWaveMarker.GetRef())
Utility.Wait(3)
Alias_Roach.GetRef().MoveTo(Alias_DecoyShipRoachSeat.GetRef())
Alias_Hannibal.GetRef().MoveTo(Alias_DecoyShipAdrastosPrisonerFurniture.GetRef())

SetStage(325)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
SetActive()

;Remove Roach's crime faction
Actor myRoach = Alias_Roach.GetActorRef()
myRoach.SetCrimeFaction(None)
myRoach.RemoveFromFaction(CrimeFactionFreestar)
myRoach.RemoveFromFaction(AkilaCityFaction)

;Sets the crew on the Junker ship to 0, to avoid chatter, etc
SpaceshipReference myJunkerShip = Alias_JunkerShip.GetShipRef()
myJunkerShip.SetValue(SpaceshipCrew, 0)

; Damage the systems on the junker ship.
Float fDamageEnginesValue = (myJunkerShip.GetValue(ShipSystemEngineHealth) * 0.95)
Float fDamageWeapons1Value = (myJunkerShip.GetValue(ShipSystemWeaponGroup1Health) * 0.99)
Float fDamageWeapons2Value = (myJunkerShip.GetValue(ShipSystemWeaponGroup2Health) * 0.85)
Float fDamageWeapons3Value = (myJunkerShip.GetValue(ShipSystemWeaponGroup3Health) * 0.99)
Float fDamageShieldSystemValue = (myJunkerShip.GetValue(ShipSystemShieldsHealth) * 0.99)
Float fDamageShieldHealthValue = (myJunkerShip.GetValue(ShieldHealth) * 0.99)
Float fDamageHealthValue = (myJunkerShip.GetValue(Health) * 0.75)

myJunkerShip.EnablePartRepair(ShipSystemEngineHealth, False)
myJunkerShip.EnablePartRepair(ShipSystemWeaponGroup1Health, False)
myJunkerShip.EnablePartRepair(ShipSystemWeaponGroup2Health, False)
myJunkerShip.EnablePartRepair(ShipSystemWeaponGroup3Health, False)
myJunkerShip.EnablePartRepair(ShipSystemShieldsHealth, False)
myJunkerShip.DamageValue(ShipSystemEngineHealth, fDamageEnginesValue)
myJunkerShip.DamageValue(ShipSystemWeaponGroup1Health, fDamageWeapons1Value)
myJunkerShip.DamageValue(ShipSystemWeaponGroup2Health, fDamageWeapons2Value)
myJunkerShip.DamageValue(ShipSystemWeaponGroup3Health, fDamageWeapons3Value)
myJunkerShip.DamageValue(ShipSystemShieldsHealth, fDamageShieldSystemValue)
myJunkerShip.DamageValue(ShieldHealth, fDamageShieldHealthValue)
myJunkerShip.DamageValue(Health, fDamageHealthValue)

;Dock the Junker ship with the Station
SpaceshipReference myChopShopStation = Alias_ChopShopStation.GetShipRef()
myChopShopStation.SetValue(DockingPermission, 0)
myJunkerShip.InstantDock(myChopShopStation)
myChopShopStation.SetValue(DockingPermission, 1)

;Unlock the Ship
myJunkerShip.SetExteriorLoadDoorInaccessible(False)

;Setup Bounty Scanner stuff for Hannibal
Actor myHannibal = Alias_Hannibal.GetActorRef()
myHannibal.SetValue(SFBGS003_SQ_Bounty_AmountAV, SFBGS003_CreditsRewardBountyQuestSmall.GetValue())
myHannibal.AddBountyCrime(SFBGS003_ScannerCrimeBasic43)
myHannibal.AddBountyCrime(SFBGS003_ScannerCrimeBasic40)
myHannibal.AddBountyCrime(SFBGS003_ScannerCrimeBasic16)
myHannibal.AddBountyCrime(SFBGS003_BountyCrime_42)

; Set Cached_PreFollowerAggression on Hannibal to 0 to allow him to 
; react to getting shot. This is due to an issue in SQ_Followers where
; the AV was getting set to -1 incorrectly.
myHannibal.SetValue(Cached_PreFollowerAggression, 0)
myHannibal.SetScanned(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SFBGS003_DialogueTAHQ.SetStage(500)

; Initiailizes some scripting to handle when the player gets 
; too far away from Roach so they don't lose him.
(Alias_Roach as DLC03:SFTA00AliasFollowerObjectiveScript).StartFollow()

Actor myHannibal = Alias_Hannibal.GetActorRef()
myHannibal.Enable()

SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
If !GetStageDone(2) && !GetStageDone(3)
	SFTA00_0325_Roach_EnteredAkila.Start()
EndIf

; Temporarily disable ships that use the landing pad, and reenable 
; them later.
; SQ_CargoShips will continue to make new ships appear when it can.
SpaceshipReference myCargoShip01 = Alias_CargoShip01.GetShipRef()
SpaceshipReference myCargoShip04 = Alias_CargoShip04.GetShipRef()
SpaceshipReference myCargoShip05 = Alias_CargoShip05.GetShipRef()
SpaceshipReference myCargoShip07 = Alias_CargoShip07.GetShipRef()
myCargoShip01.Disable()
myCargoShip04.Disable()
myCargoShip05.Disable()
myCargoShip07.Disable()

Utility.Wait(5)

;Enable the ship on the landing pad and unlock it
SpaceshipReference myDecoyShip = Alias_DecoyShip.GetShipRef()
myDecoyShip.Enable()
;Make the Decoy Ship Inaccessible
Alias_DecoyShip.GetShipRef().SetExteriorLoadDoorInaccessible(True)

; Set an actor value to prevent ships from landing on the 
; Decoy Ship's landing pad
Location myAkilaLoc = Alias_AkilaLoc.GetLocation()
myAkilaLoc.SetValue(SQ_CargoShipsProhibited, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Only play Roach's line if the player has not yet scanned or shot him.
If !GetStageDone(358) && !GetStageDone(360)
	SFTA00_0350_Roach_SpottedAdrastos.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0358_Item_00
Function Fragment_Stage_0358_Item_00()
;BEGIN CODE
If !GetStageDone(206)
	SFTA00_0355_Roach_AdrastosScanned.Start()
EndIf
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
If !GetStageDone(500)
	SetObjectiveDisplayed(360)
	SFTA00_0360_Roach_PlayerShotAdrastos.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0365_Item_00
Function Fragment_Stage_0365_Item_00()
;BEGIN CODE
If SFTA00_0360_Roach_PlayerShotAdrastos.IsPlaying()
	SFTA00_0360_Roach_PlayerShotAdrastos.Stop()
EndIf

If SFTA00_0370_Roach_PlayerDownedAdrastos.IsPlaying()
	SFTA00_0370_Roach_PlayerDownedAdrastos.Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
Actor myActor = Alias_Hannibal.GetActorRef()
Alias_HannibalAttacked.ForceRefTo(myActor)
myActor.StopCombat()
myActor.StopCombatAlarm()
myActor.SetNoBleedoutRecovery(True)
myactor.AllowBleedoutDialogue(True)

SetObjectiveCompleted(360)
SetStage(400)

SFTA00_0370_Roach_PlayerDownedAdrastos.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
If !IsObjectiveCompleted(300)
	SetObjectiveDisplayed(300, False)
EndIf
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

;Get Adrastos back up.
Actor myActor = Alias_Hannibal.GetActorRef()
myActor.SetNoBleedoutRecovery(False)
myActor.ResetHealthAndLimbs()
myActor.StopCombatAlarm()
myActor.StopCombat()
myActor.EvaluatePackage()

; Initiailizes some scripting to handle when the player gets 
; too far away from Adrastos so they don't lose him.
(Alias_Hannibal as DLC03:SFTA00AliasFollowerObjectiveScript).StartFollow()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

;Make the Decoy Ship accessible and make sure it's enabled
SpaceshipReference myDecoy = Alias_DecoyShip.GetShipRef()
myDecoy.SetExteriorLoadDoorInaccessible(False)
myDecoy.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
; Set the decoy ship as the player's new home ship to avoid fast travel issues
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Alias_DecoyShip.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

;Enable the map marker so the player can jump to the Chop Shop.
Alias_ChopShopMapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
; Reenable the Akila Cargo Ships
Alias_CargoShip01.GetShipRef().Enable()
Alias_CargoShip04.GetShipRef().Enable()
Alias_CargoShip05.GetShipRef().Enable()
Alias_CargoShip07.GetShipRef().Enable()

; Set an actor value to allow the cargo ships to land in Akila again
Location myAkilaLoc = Alias_AkilaLoc.GetLocation()
myAkilaLoc.SetValue(SQ_CargoShipsProhibited, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)

;Only play the scene if we aren't using debug commands to get here
If !GetStageDone(3)
	Utility.Wait(3)
	SFTA00_0800_Adrastos_Arrival.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(810)

;Only play the scene if not using the debug stage
If !GetStageDone(3)
	SFTA00_0810a_ChopShop_Hailing.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0815_Item_00
Function Fragment_Stage_0815_Item_00()
;BEGIN CODE
If SFTA00_0810b_HailingAnswered.IsPlaying()
	SFTA00_0800_Adrastos_Arrival.Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
SetObjectiveCompleted(810)
SetObjectiveDisplayed(850)

Alias_PlayerChopShopFriend.ForceRefTo(Game.GetPlayer())

SpaceshipReference myDecoyShip = Alias_DecoyShip.GetShipRef()
myDecoyShip.AddtoFaction(SFTA00_ChopShopStationFaction)

SpaceshipReference myChopShopStation = Alias_ChopShopStation.GetShipRef()
myChopShopStation.SetValue(DockingPermission, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(850)
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN AUTOCAST TYPE dlc03:sfta00questscript
Quest __temp = self as Quest
dlc03:sfta00questscript kmyQuest = __temp as dlc03:sfta00questscript
;END AUTOCAST
;BEGIN CODE
; Just in case, make sure to reenable the Akila Cargo Ships if the 
; quest ends
Alias_CargoShip01.GetShipRef().Enable()
Alias_CargoShip04.GetShipRef().Enable()
Alias_CargoShip05.GetShipRef().Enable()
Alias_CargoShip07.GetShipRef().Enable()

;Restore Roach's crime faction
Actor myRoach = Alias_Roach.GetActorRef()
myRoach.SetCrimeFaction(CrimeFactionFreestar)
myRoach.AddToFaction(CrimeFactionFreestar)
myRoach.AddToFaction(AkilaCityFaction)

;Reenable the docking door on the station, just in case.
kmyQuest.SetDecoyDockAccessible(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE dlc03:sfta00questscript
Quest __temp = self as Quest
dlc03:sfta00questscript kmyQuest = __temp as dlc03:sfta00questscript
;END AUTOCAST
;BEGIN CODE
;Disable fast travel completely.
kmyQuest.ChopShopDisableFastTravel()

SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)

;Set Deke's Name to Hannibal
ObjectReference myDeke = Alias_Deke.GetRef()
myDeke.SetOverrideName(SFTA00_HannibalNameMSG)

;Lock Hannibal's Loot Chest
ObjectReference myChest = Alias_HannibalChest.GetRef()
myChest.Lock()
myChest.SetLockLevel(254)

If SFTA00_0810e_AfterHail.IsPlaying()
	SFTA00_0810e_AfterHail.Stop()
EndIf

Utility.Wait(5)
SFTA00_1000_Roach_EnterShop.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1025_Item_00
Function Fragment_Stage_1025_Item_00()
;BEGIN CODE
SFTA00_1025_ReceptionSpacerAlert.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1026_Item_00
Function Fragment_Stage_1026_Item_00()
;BEGIN CODE
Alias_ReceptionSpacer.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
Utility.Wait(5)
SFTA00_1050_Hannibal_PA_Lockdown.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SFTA00_1100_Roach_LoadingBay.Start()

SetObjectiveDisplayed(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
If !GetStageDone(206)
	SFTA00_1150_Roach_MissilePodDiscovery.Start()
EndIf

If IsObjectiveDisplayed(1100)
	SetObjectiveCompleted(1100)
EndIf
If !GetStageDone(1450) && !GetStageDone(1400) && !GetStageDone(1300) && !GetStageDone(1200)
	SetObjectiveDisplayed(1150)
EndIf

If !GetStageDone(1450) && GetStageDone(1400)
	SetObjectiveDisplayed(1400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
If !GetStageDone(206)
	SFTA00_1200_Roach_ShipLocked.Start()
EndIf

If IsObjectiveDisplayed(1100)
	SetObjectiveDisplayed(1100, False)
EndIf
If IsObjectiveDisplayed(1150)
	SetObjectiveCompleted(1150)
EndIf
If !GetStageDone(1450) && !GetStageDone(1400) && !GetStageDone(1300)
	SetObjectiveDisplayed(1200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
If !GetStageDone(206)
	SFTA00_1250_Roach_ControlRoomDoors.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
If !GetStageDone(206)
	SFTA00_1300_Roach_ControlRoomComputer.Start()
EndIf

If IsObjectiveDisplayed(1100)
	SetObjectiveDisplayed(1100, False)
EndIf
If IsObjectiveDisplayed(1150)
	SetObjectiveDisplayed(1150, False)
EndIf
If IsObjectiveDisplayed(1200)
	SetObjectiveCompleted(1200)
EndIf
If !GetStageDone(1450) && !GetStageDone(1400)
	SetObjectiveDisplayed(1300)
	SetStage(1350)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
If !GetStageDone(1375)
	SetObjectiveDisplayed(1350)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1375_Item_00
Function Fragment_Stage_1375_Item_00()
;BEGIN CODE
Alias_LivingQuartersDoors.SetOpen(True)

If IsObjectiveDisplayed(1350)
	SetObjectiveCompleted(1350)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
If !GetStageDone(206)
	SFTA00_1400_Roach_SunsailKey.Start()
EndIf

If IsObjectiveDisplayed(1100)
	SetObjectiveDisplayed(1100, False)
EndIf
If IsObjectiveDisplayed(1150)
	SetObjectiveDisplayed(1150, False)
EndIf
If IsObjectiveDisplayed(1200)
	SetObjectiveDisplayed(1200, False)
EndIf
If IsObjectiveDisplayed(1300)
	SetObjectiveCompleted(1300)
EndIf
If !GetStageDone(1450) && GetStageDone(1150)
	SetObjectiveDisplayed(1400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1450_Item_00
Function Fragment_Stage_1450_Item_00()
;BEGIN CODE
SetStageNoWait(1451)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1451_Item_00
Function Fragment_Stage_1451_Item_00()
;BEGIN CODE
;Disable the part of the wall that is getting destroyed by the missile.
Alias_MissileDoorEnableMarker.GetRef().Disable()

;Screen Shake, Rumble, and SFX
ObjectReference myPod = Alias_MissilePod.GetRef()
Utility.Wait(0.01)
SFBGS003_WwiseEvent_QST_SFTA00_Missile_MissileLaunchSequence.Play(myPod)
Utility.Wait(4.5)
Game.ShakeCamera(none, 0.5, 3)

SetObjectiveCompleted(1400)
SFTA00_1450_Roach_MissileFired.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
Alias_Deke.GetRef().Enable()
SFTA00_1500a_Deke_Surrender.Start()

SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1505_Item_00
Function Fragment_Stage_1505_Item_00()
;BEGIN CODE
ObjectReference myDeke = Alias_Deke.GetRef()

myDeke.SetOverrideName(SFTA00_DekeNameMSG)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN CODE
ObjectReference myHannibal = Alias_Hannibal.GetRef()
myHannibal.SetOverrideName(SFTA00_HannibalNameMSG)

SFTA00_1600a_Hannibal_PA.Start()

; Lock the door on the way back to the Decoy ship to prevent issues
; with the player getting into the Decoy ship just before it 
; undocks and disables.
ObjectReference myDockDoor = Alias_ChopShopEntranceDoor.GetRef()
myDockDoor.Lock()
myDockDoor.SetLockLevel(254)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1515_Item_00
Function Fragment_Stage_1515_Item_00()
;BEGIN CODE
;Make the Decoy Ship not unconscious so that it can move while the 
;player isn't flying it
Alias_DecoyShip.GetShipRef().SetUnconscious(false)
Utility.Wait(0.5)
SetStage(1520)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1520_Item_00
Function Fragment_Stage_1520_Item_00()
;BEGIN CODE
SpaceshipReference myDecoyShip = Alias_DecoyShip.GetShipRef()
myDecoyShip.SetValue(SpaceshipCrew, 1)
myDecoyShip.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1550_Item_00
Function Fragment_Stage_1550_Item_00()
;BEGIN CODE
If !GetStageDone(1510)
	SFTA00_1600a_Hannibal_PA.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1500)
SetObjectiveDisplayed(1610)
SetObjectiveDisplayed(1620)
SetObjectiveDisplayed(1630)
SetObjectiveDisplayed(1640)

;Unlock Hannibal's Loot Chest
ObjectReference myChest = Alias_HannibalChest.GetRef()
myChest.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1610_Item_00
Function Fragment_Stage_1610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1610)
SetStage(1800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1620_Item_00
Function Fragment_Stage_1620_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1620)
If GetStageDone(1621) && GetStageDone(1622) && GetStageDone(1630) && GetStageDone(1640)
	SetStage(1800)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1621_Item_00
Function Fragment_Stage_1621_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1621)
If GetStageDone(1620) && GetStageDone(1622) && GetStageDone(1630) && GetStageDone(1640)
	SetStage(1800)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1622_Item_00
Function Fragment_Stage_1622_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1622)
If GetStageDone(1620) && GetStageDone(1621) && GetStageDone(1630) && GetStageDone(1640)
	SetStage(1800)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1630_Item_00
Function Fragment_Stage_1630_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1630)
If GetStageDone(1620) && GetStageDone(1621) && GetStageDone(1622) && GetStageDone(1640)
	SetStage(1800)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1640_Item_00
Function Fragment_Stage_1640_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1640)

If GetStageDone(1620) && GetStageDone(1621) && GetStageDone(1622) && GetStageDone(1630)
	SetStage(1800)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1650_Item_00
Function Fragment_Stage_1650_Item_00()
;BEGIN CODE
Alias_DecoyShip.GetShipRef().DisableWithGravJump()

Utility.Wait(2)
SFTA00_1700_Roach_Frustrated.Start()

; Unlock the door we locked in stage 1510
ObjectReference myDockDoor = Alias_ChopShopEntranceDoor.GetRef()
myDockDoor.Lock(False)
myDockDoor.SetLockLevel(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN AUTOCAST TYPE dlc03:sfta00questscript
Quest __temp = self as Quest
dlc03:sfta00questscript kmyQuest = __temp as dlc03:sfta00questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1700)
SetObjectiveDisplayed(1800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1825_Item_00
Function Fragment_Stage_1825_Item_00()
;BEGIN CODE
SFTA00_1825_Roach_Junker.Start()
Alias_JunkerShip.GetShipRef().SetEssential(False)
Alias_Roach.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1900_Item_00
Function Fragment_Stage_1900_Item_00()
;BEGIN AUTOCAST TYPE dlc03:sfta00questscript
Quest __temp = self as Quest
dlc03:sfta00questscript kmyQuest = __temp as dlc03:sfta00questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1800)
SetObjectiveDisplayed(1900)

SpaceshipReference myJunkerShip = Alias_JunkerShip.GetShipRef()

; Reenable Fast Travel
kmyQuest.ChopShopEnableFastTravel()

;Add the Junker ship to the player's Owned ships
Game.AddPlayerOwnedShip(myJunkerShip)
Game.TrySetPlayerHomeSpaceShip(myJunkerShip)

;Remove the Decoy ship from the player's fleet.

Game.RemovePlayerOwnedShip(Alias_DecoyShip.GetShipRef())


myJunkerShip.SetEssential(False)

myJunkerShip.EnablePartRepair(ShipSystemEngineHealth, True)
myJunkerShip.EnablePartRepair(ShipSystemWeaponGroup1Health, True)
myJunkerShip.EnablePartRepair(ShipSystemWeaponGroup2Health, True)
myJunkerShip.EnablePartRepair(ShipSystemWeaponGroup3Health, True)
myJunkerShip.EnablePartRepair(ShipSystemShieldsHealth, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
; The player's tracker name AV was just set. Now set the player's 
; Tracker Name on the marker in the support quest 
SFBGS003TASupportQuestScript myQuestScript = SFBGS003_TrackersAllianceSupportQuest as SFBGS003TASupportQuestScript
myQuestScript.SetPlayerTrackerName()

;Unlock the TA HQ Basement door.
ObjectReference myDoor = Alias_TAHQBasementDoor.GetRef()
myDoor.Unlock()
myDoor.SetLockLevel(0)

Game.GetPlayer().SetValue(SFTA00_ForeknowledgeAV, 1)

If !IsObjectiveCompleted(1620)
	SetObjectiveDisplayed(1620, False)
EndIf
If !IsObjectiveCompleted(1630)
	SetObjectiveDisplayed(1630)
EndIf
SetObjectiveCompleted(1900)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFBGS003_DialogueTAHQ Auto Const Mandatory

ReferenceAlias Property Alias_DecoyShip Auto Const Mandatory

ReferenceAlias Property Alias_Hannibal Auto Const Mandatory

Scene Property SFTA00_1300_Roach_ControlRoomComputer Auto Const Mandatory

ReferenceAlias Property Alias_HannibalChest Auto Const Mandatory

Scene Property SFTA00_1825_Roach_Junker Auto Const Mandatory

Scene Property SFTA00_1050_Hannibal_PA_Lockdown Auto Const Mandatory

Scene Property SFTA00_1000_Roach_EnterShop Auto Const Mandatory

ReferenceAlias Property Alias_Deke Auto Const Mandatory

Scene Property SFTA00_1500a_Deke_Surrender Auto Const Mandatory

Scene Property SFTA00_1600a_Hannibal_PA Auto Const Mandatory

Scene Property SFTA00_1700_Roach_Frustrated Auto Const Mandatory

ReferenceAlias Property Alias_JunkerShip Auto Const Mandatory

Message Property SFTA00_AdrastosNameMSG Auto Const Mandatory

Message Property SFTA00_HannibalNameMSG Auto Const Mandatory

ReferenceAlias Property Alias_Roach Auto Const Mandatory

Quest Property SFBGS003_MiscPointer Auto Const Mandatory

Perk Property BackgroundBountyHunter Auto Const Mandatory

Perk Property Skill_Deception Auto Const Mandatory

Perk Property Skill_Intimidation Auto Const Mandatory

Faction Property SFTA00_ChopShopStationFaction Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

ReferenceAlias Property Alias_ChopShopStation Auto Const Mandatory

Scene Property SFTA00_0350_Roach_SpottedAdrastos Auto Const Mandatory

Scene Property SFTA00_0355_Roach_AdrastosScanned Auto Const Mandatory

Scene Property SFTA00_0360_Roach_PlayerShotAdrastos Auto Const Mandatory

Scene Property SFTA00_0370_Roach_PlayerDownedAdrastos Auto Const Mandatory

Scene Property SFTA00_0800_Adrastos_Arrival Auto Const Mandatory

Scene Property SFTA00_0810a_ChopShop_Hailing Auto Const Mandatory

Message Property SFTA00_DekeNameMSG Auto Const Mandatory

Quest Property SFBGS003_TrackersAllianceSupportQuest Auto Const Mandatory

ReferenceAlias Property Alias_ChopShopMapMarker Auto Const Mandatory

Scene Property SFTA00_1100_Roach_LoadingBay Auto Const Mandatory

Scene Property SFTA00_1150_Roach_MissilePodDiscovery Auto Const Mandatory

Scene Property SFTA00_1200_Roach_ShipLocked Auto Const Mandatory

Scene Property SFTA00_1450_Roach_MissileFired Auto Const Mandatory

Scene Property SFTA00_1400_Roach_SunsailKey Auto Const Mandatory

Scene Property SFTA00_1025_ReceptionSpacerAlert Auto Const Mandatory

LocationAlias Property Alias_TAHQLoc Auto Const Mandatory

ActorValue Property SFTA00_ForeknowledgeAV Auto Const Mandatory

Scene Property SFTA00_0325_Roach_EnteredAkila Auto Const Mandatory

Scene Property SFTA00_1250_Roach_ControlRoomDoors Auto Const Mandatory

ReferenceAlias Property Alias_TAHQBasementDoor Auto Const Mandatory

ReferenceAlias Property Alias_MissilePod Auto Const Mandatory

WwiseEvent Property SFBGS003_WwiseEvent_QST_SFTA00_Missile_MissileLaunchSequence Auto Const Mandatory

ReferenceAlias Property Alias_DecoyShipAdrastosPrisonerFurniture Auto Const Mandatory

ReferenceAlias Property Alias_CargoShip01 Auto Const Mandatory

ReferenceAlias Property Alias_CargoShip04 Auto Const Mandatory

ReferenceAlias Property Alias_CargoShip05 Auto Const Mandatory

ReferenceAlias Property Alias_CargoShip07 Auto Const Mandatory

ReferenceAlias Property Alias_AkilaLandingPad Auto Const Mandatory

ActorValue Property ShipSystemWeaponGroup1Health Auto Const Mandatory

ActorValue Property ShipSystemWeaponGroup2Health Auto Const Mandatory

ActorValue Property ShipSystemWeaponGroup3Health Auto Const Mandatory

ActorValue Property ShipSystemEngineHealth Auto Const Mandatory

ReferenceAlias Property Alias_MissileDoorEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_DecoyShipHannibalWaveMarker Auto Const Mandatory

ReferenceAlias Property Alias_DecoyShipRoachSeat Auto Const Mandatory

ReferenceAlias Property Alias_ReceptionSpacer Auto Const Mandatory

GlobalVariable Property SFBGS003_CreditsRewardBountyQuestSmall Auto Const Mandatory

ReferenceAlias Property Alias_RoachTAHQMArker Auto Const Mandatory

ActorValue Property SFBGS003_SQ_Bounty_AmountAV Auto Const Mandatory

Message Property SFBGS003_ScannerCrimeBasic40 Auto Const Mandatory

Message Property SFBGS003_ScannerCrimeBasic43 Auto Const Mandatory

LocationAlias Property Alias_ChopShopSpaceLoc Auto Const Mandatory

Message Property SFBGS003_ScannerCrimeBasic16 Auto Const Mandatory

Message Property SFBGS003_BountyCrime_42 Auto Const Mandatory

GlobalVariable Property SFTA00_JunkerShipRepairRateValue Auto Const Mandatory

ActorValue Property SpaceshipRepairRate Auto Const Mandatory

ActorValue Property ShipSystemShieldsHealth Auto Const Mandatory

ActorValue Property ShieldHealth Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

ReferenceAlias Property Alias_ChopShopEntranceDockDoor Auto Const Mandatory

ReferenceAlias Property Alias_HannibalAttacked Auto Const Mandatory

Scene Property SFTA00_0810b_HailingAnswered Auto Const Mandatory

ReferenceAlias Property Alias_PlayerChopShopFriend Auto Const Mandatory

ReferenceAlias Property Alias_ChopShopDecoyDockingMarker Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property SFTA00_ChopShopStationFriendFaction Auto Const Mandatory

LocationAlias Property Alias_AkilaLoc Auto Const Mandatory

RefCollectionAlias Property Alias_LivingQuartersDoors Auto Const Mandatory

ReferenceAlias Property Alias_ChopShopEntranceDoor Auto Const Mandatory

Faction Property CrimeFactionFreestar Auto Const Mandatory

Faction Property AkilaCityFaction Auto Const Mandatory

ActorValue Property Cached_PreFollowerAggression Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

Scene Property SFTA00_0810e_AfterHail Auto Const Mandatory

ActorValue Property SQ_CargoShipsProhibited Auto Const Mandatory

ActorValue Property SFBGS003_SQ_Bounty_isScannedAV Auto Const Mandatory
