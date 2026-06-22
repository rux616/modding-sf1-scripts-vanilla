;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ103_000114C9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.SetStage(1150)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)

Game.GetPlayer().MoveTo(LodgeStartMarker)
Game.GetPlayer().additem(Credits, 1500)
Game.GetPlayer().additem(Eon)
Game.GetPlayer().AddPerk(TraitFreestarCollectiveSettler)
SetStage(10)

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ102.CompleteQuest()

SetStage(210)
SetStage(610)

SetObjectiveCompleted(40)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)

Game.GetPlayer().MoveTo(MQ103DungeonStart)
Alias_SamCoe.GetActorRef().moveto(MQ103DungeonStart)

Game.GetPlayer().additem(Credits, 1500)
Game.GetPlayer().additem(Eon)
Game.GetPlayer().addPerk(BackgroundGangster)

;make sure cave is unblocked
LC006_CaveBlocker_EnableMarker.Disable()

;swap activator for right Artifact
ObjectReference ArtifactActivatorREF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(4, Alias_ArtifactActivator.GetRef())
Alias_ArtifactActivator.ForceRefTo(ArtifactActivatorREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;enable Sam and Core
Alias_SamCoe.GetActorRef().moveto(MQ103SamStartMarker)
Alias_CoraCoe.GetActorRef().moveto(MQ103SamStartMarker)

;swap activator for right Artifact
ObjectReference ArtifactActivatorREF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(4, Alias_ArtifactActivator.GetRef())
Alias_ArtifactActivator.ForceRefTo(ArtifactActivatorREF)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
MQ102_01_SamCoraScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;Sam and Cora become passengers
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()

(SQ_PlayerShip as SQ_PlayerShipScript).AddPassenger(SamCoeREF)
(SQ_PlayerShip as SQ_PlayerShipScript).AddPassenger(CoraCoeREF)

;Start EC quest for Cora
CREW_EliteCrew_CoraCoe.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;move Sam and Cora to your ship
ObjectReference PassengerMarkerREF = Alias_PlayerShipPassengerMarker.GetRef()
Actor SamREF = Alias_SamCoe.GetActorRef()
Actor CoraREF = Alias_CoraCoe.GetActorRef()

;SamREF.moveto(PassengerMarkerREF)
;CoraREF.moveto(PassengerMarkerREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;Sam is no longer a passenger
Actor SamCoeREF = Alias_SamCoe.GetActorRef()

(SQ_PlayerShip as SQ_PlayerShipScript).RemovePassenger(SamCoeREF)
PassengersRefColl.RemoveRef(SamCoeREF)
DisembarkingCrew.RemoveRef(SamCoeREF)
SamCoeRef.EvaluatePackage()
SamCoeREF.Moveto(MQ103_SamOutsideAkilaMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("FollowerWarn")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0203_Item_00
Function Fragment_Stage_0203_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
MQCompanionLockedBailoutMSG.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Actor SamREF = Alias_SamCoe.GetActorRef()

(SQ_Companions as SQ_CompanionsScript).SetRoleActive(SamREF)
(SQ_Companions as SQ_CompanionsScript).LockInCompanion(SamREF as CompanionActorScript, True, CustomMessage = MQ103SamLockInMSG, TextReplaceActivator = COM_MQ103_TxtReplace_QuestName_SamCoe)

SamREF.EvaluatePackage()

SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

;if FC is already complete
If FC01.GetStageDone(2000)
  SetStage(225)
;FC01 isn't complete but has already advanced beyond stage 110
ElseIf FC01.GetStageDone(110)
  SetStage(220)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
MQ103_04a_GalBankLockedScene.Start()

SetObjectiveDisplayed(40, abDisplayed=False)
SetObjectiveDisplayed(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_01
Function Fragment_Stage_0220_Item_01()
;BEGIN CODE
;disable the galbank trigger
Alias_SetStage300Trigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetObjectiveCompleted(45)
SetObjectiveDisplayed(40, abForce=True)

MQ103_04b_GalBankOpenScene.Start()

SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
Alias_GalBankVaultDoor.GetRef().Unlock()

Alias_SetStage300Trigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
MQ103_04_GalBankVaultScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

Game.GetPlayer().additem(MQ103CoeVaultKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(55)

MQ103_04_GalBankVaultScene.Stop()

;unlock coe estate doors
CoeEstateFirstFloorDoorREF.Lock(false)
CoeEstateBalconyDoorREF.Lock(false)
CoeEstateFrontDoorREF.Lock(false)
CoeEstateFirstFloorDoorTwo.Lock(False)

Game.GetPlayer().AddToFaction(CoeEstateDoorFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
SetObjectiveCompleted(55)
SetObjectiveDisplayed(60)

;enable maps and lock doors
Alias_SolomonMaps.GetRef().EnableNoWait()
;ObjectReference CoeOfficeDoorREF = Alias_CoeOfficeDoor.GetRef()
;CoeOfficeDoorREF.SetOpen(False)
;CoeOfficeDoorREF.Lock(True)
;CoeOfficeDoorREF.SetLockLevel(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;GEN-467503: Temporarily removing Sam's weapon matching with the player
Alias_SamCoe.GetRef().RemoveKeyword(TeammateReadyWeapon_DO)

MQ103_06_CoeEstateIntroScene.Start()

ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef()
OfficeDoorREF.SetOpen(False)
OfficeDoorRef.Lock()
OfficeDoorRef.BlockActivation(true, true)

SetStage(330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
Alias_JacobCoe.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)

;GEN-467503: Readding Sam's weapon matching with the player
Alias_SamCoe.GetRef().AddKeyword(TeammateReadyWeapon_DO)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
SetObjectiveDisplayedAtTop(80)
SetObjectiveDisplayed(85)
SetObjectiveDisplayed(90)
SetObjectiveDisplayed(95)

;Cora is no longer a passenger
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
(SQ_PlayerShip as SQ_PlayerShipScript).RemovePassenger(CoraCoeREF)
PassengersRefColl.RemoveRef(CoraCoeREF)
DisembarkingCrew.RemoveRef(CoraCoeREF)
CoraCoeREF.EvaluatePackage()
CoraCoeREF.moveto(MQ103_CoraSpaceportReadingMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveFailed(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
Alias_SolomonMaps.GetRef().SetFactionOwner(PlayerFaction)

Game.GetPlayer().additem(MQ103JacobOfficeKey)

SetObjectiveCompleted(85)
;re-display map objective
SetObjectiveDisplayed(80, abforce=true)
;hide other optionals objectives
SetObjectiveDisplayed(90, abDisplayed=false)
SetObjectiveDisplayed(95, abDisplayed=false)

Alias_JacobCoe.GetActorRef().EvaluatePackage()

ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef()
OfficeDoorRef.BlockActivation(False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
;re-display map objective
SetObjectiveDisplayed(80, abforce=true)
;hide other optionals objectives
SetObjectiveDisplayed(85, abDisplayed=false)
SetObjectiveDisplayed(95, abDisplayed=false)

ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef()
OfficeDoorRef.BlockActivation(False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Cora is no longer a passenger
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
(SQ_PlayerShip as SQ_PlayerShipScript).RemovePassenger(CoraCoeREF)
PassengersRefColl.RemoveRef(CoraCoeREF)
DisembarkingCrew.RemoveRef(CoraCoeREF)
CoraCoeREF.EvaluatePackage()

SetObjectiveCompleted(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
MQ103_12b_CoraJacobScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetStage(600)

Alias_CoraCoe.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveCompleted(70)
SetObjectiveCompleted(80)
SetObjectiveDisplayed(85, abDisplayed=False)
SetObjectiveDisplayed(90, abDisplayed=False)
SetObjectiveDisplayed(95, abDisplayed=False)

SetObjectiveDisplayed(100)

;if the distraction scene is running, end it
If MQ103_11a_JacobSamArgueScene.IsPlaying()
  MQ103_11a_JacobSamArgueScene.Stop()
  MQ103_11b_JacobSamEndScene.Start()
EndIF

Alias_JacobCoe.GetActorRef().EvaluatePackage()

ObjectReference OfficeDoorREF = Alias_CoeOfficeDoor.GetRef()
OfficeDoorRef.BlockActivation(False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)

Alias_LockeGangMapMarker.GetRef().Enable()
Alias_LockeGangMapMarker.GetRef().AddToMapScanned()

;unlock shaw gang door
LC006_LoadDoor_Ext.Lock(False)

;make sure cave is unblocked
LC006_CaveBlocker_EnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
MQ103_15_LockeGangSamScene.Start()

SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
MQ103_16a_LockeGangEavesdrop.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
MQ103_16b_LockeGangEavesdrop.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
MQ103_17_ArtifactScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN AUTOCAST TYPE mq103script
Quest __temp = self as Quest
mq103script kmyQuest = __temp as mq103script
;END AUTOCAST
;BEGIN CODE
;disable Artifact activator
Alias_ArtifactActivator.GetRef().Disable()

;give the player the appropriate Artifact
ObjectReference ArtifactREF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(4, MQ103ArtifactSpawnMarker)
Alias_MQ103ArtifactQuestObject.ForceRefTo(ArtifactREF)
ArtifactREF.Enable()
Game.GetPlayer().additem(ArtifactREF)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(4)

;make sure Cora is a passenger again if she was at the Coe estate
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
(SQ_PlayerShip as SQ_PlayerShipScript).AddPassenger(CoraCoeREF)

;block fast travel until you encounter Locke
kmyquest.MQ103EnableLayer = InputEnableLayer.Create()
kmyquest.MQ103EnableLayer.EnableFastTravel(False)

;make sure Artifact Collection is enabled
ArmillaryMountSwapEnableMarker.Disable()

SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

;player is temporary ally to Shaw Gang
PlayerREF.addtoFaction(MQ103LockeGangFaction)

;kill any remaining gang members in the cave and stop combat
Alias_LockeGangInteriorNPCs.KillAll()
PlayerREF.StopCombatAlarm()

;enable Locke and disable other Locke Gang actors
MQ103LockeEnableMarkerREF.Enable()
MQ103LockeGangExteriorEnableMarker.Disable()

MQ103_18_AftermathScene.Start()

SetObjectiveCompleted(120)
SetObjectiveDisplayed(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN AUTOCAST TYPE mq103script
Quest __temp = self as Quest
mq103script kmyQuest = __temp as mq103script
;END AUTOCAST
;BEGIN CODE
;Trigger Locke Scene
Game.GetPlayer().StopCombatAlarm()
MQ103_19_AmbushScene.Start()

SetObjectiveCompleted(125)

if !GetStageDone(985)
  SetObjectiveDisplayed(127)
  SetObjectiveDisplayedAtTop(127)
endif

;player can fast travel again
kmyquest.MQ103EnableLayer.EnableFastTravel()
kmyquest.MQ103EnableLayer = None
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
Actor LockeREF = Alias_Locke.GetActorRef()
Actor PlayerREF = Game.GetPlayer()

;player is no longer temporary ally to Shaw Gang
PlayerREF.RemoveFromFaction(MQ103LockeGangFaction)

LockeREF.AddToFaction(PlayerEnemyFaction)
LockeREF.SetValue(Aggression, 1)

Alias_LockeBodyguard.AddToFaction(PlayerEnemyFaction)
Alias_LockeBodyguard.SetValue(Aggression, 1)

;GEN-467888: Hostility functionality still needs to trigger
;If you talk down Shaw. Just turning off the object changes
;This GetStageDone(950) check used to be directly on the stage conditions

if !GetStageDone(950)
  SetObjectiveCompleted(125)

  if !GetStageDone(985)
    SetObjectiveDisplayed(127)
    SetObjectiveDisplayedAtTop(127)
  endif

  SetStageNoWait(925)
endif

SetObjectiveDisplayed(129, abdisplayed=false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0925_Item_00
Function Fragment_Stage_0925_Item_00()
;BEGIN CODE
Utility.Wait(5.0)

;enable Ashta
MQ103AshtaEnableMarker.Enable()
Alias_AshtaALL.SetValue(Aggression, 2)

MQ103_19b_AshtaScene.Start()

SetStage(955)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetStage(985)

;enable Ashta
MQ103AshtaEnableMarker.Enable()
Alias_AshtaALL.SetValue(Aggression, 2)

MQ103_19b_AshtaScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0955_Item_00
Function Fragment_Stage_0955_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(128)

Alias_Locke.GetActorRef().EvaluatePackage()
Alias_LockeBodyguard.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0956_Item_00
Function Fragment_Stage_0956_Item_00()
;BEGIN CODE
SetObjectiveCompleted(128)

If GetStageDone(950) && !GetStageDone(960)
  SetObjectiveDisplayed(129)
EndIf

Alias_LockeBodyguard.EvaluateAll()
Alias_Locke.GetActorRef().EvaluatePackage()
Alias_LockeAshtaScreammer.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0957_Item_00
Function Fragment_Stage_0957_Item_00()
;BEGIN CODE
SetObjectiveCompleted(129)
Game.GetPlayer().additem(LL_Weapon_Razorback_Upgraded)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0960_Item_00
Function Fragment_Stage_0960_Item_00()
;BEGIN CODE
SetStage(985)
SetObjectiveDisplayed(129, abdisplayed=false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0985_Item_00
Function Fragment_Stage_0985_Item_00()
;BEGIN CODE
SetObjectiveCompleted(125)
SetObjectiveCompleted(127)
SetObjectiveDisplayed(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0987_Item_00
Function Fragment_Stage_0987_Item_00()
;BEGIN CODE
MQ103_20_SmugglerAfterScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
;Cora is no longer a passenger
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()

(SQ_PlayerShip as SQ_PlayerShipScript).RemovePassenger(CoraCoeREF)
DisembarkingCrew.RemoveRef(CoraCoeREF)
PassengersRefColl.RemoveRef(CoraCoeREF)
CoraCoeREF.EvaluatePackage()

;Sam is no longer following
Actor SamREF = Alias_SamCoe.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleInActive(SamREF, DisplayMessageIfChanged=False)
(SQ_Companions as SQ_CompanionsScript).LockInCompanion(SamREF as CompanionActorScript, False, MQ103SamLockInMidquestOverMSG)
DisembarkingCrew.RemoveRef(SamREF)
PassengersRefColl.RemoveRef(SamREF)

int iFailSafe = 0
while iFailSafe < 15 && ((SQ_PlayerShip as SQ_PlayerShipScript).DisembarkingCrew.Find(SamREF) < 0 && (SQ_PlayerShip as SQ_PlayerShipScript).DismissedCrew.Find(SamREF) < 0)
  Utility.Wait(1.0)
  iFailSafe += 1
endwhile

(SQ_PlayerShip as SQ_PlayerShipScript).DisembarkingCrew.RemoveRef(SamREF)
(SQ_PlayerShip as SQ_PlayerShipScript).DismissedCrew.RemoveRef(SamREF)
SamREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0995_Item_00
Function Fragment_Stage_0995_Item_00()
;BEGIN CODE
MQ103_21a_LodgeMoveScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_ArtifactCollection.GetRef().EnableNoWait()
MQ103_21a_LodgeMoveScene.Stop()
MQ103_21_LodgeScene.Start()

SetObjectiveCompleted(130)
SetObjectiveDisplayed(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
MQ103_21_LodgeScene.Stop()
MQ103_22_EndScene.Start()

SetObjectiveCompleted(140)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1120_Item_00
Function Fragment_Stage_1120_Item_00()
;BEGIN CODE
Actor SamREF = Alias_SamCoe.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).LockInCompanion(SamREF as CompanionActorScript, False, MQ103SamLockInOverMSG)
(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(SamREF)
(SQ_Companions as SQ_CompanionsScript).SetRoleActive(SamREF)
(SamREF as CompanionActorScript).AllowStoryGatesAndRestartTimer()
SamREF.EvaluatePackage()

SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1130_Item_00
Function Fragment_Stage_1130_Item_00()
;BEGIN CODE
Actor SamREF = Alias_SamCoe.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).LockInCompanion(SamREF as CompanionActorScript, False, MQ103SamLockInOverMSG)
(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(SamREF)
(SamREF as CompanionActorScript).AllowStoryGatesAndRestartTimer()

SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE mq103script
Quest __temp = self as Quest
mq103script kmyQuest = __temp as mq103script
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

Actor PlayerREF = Game.GetPlayer()

;check if MQ105 should start
If MQ104A.GetStageDone(1000) && MQ104B.GetStageDone(1000)
  MQ105.SetStage(10)
EndIf

;re-enable Locke Gang actors if the player ever goes back
MQ103LockeGangExteriorEnableMarker.Enable()

;player is no longer temporary ally to Shaw Gang
PlayerREF.RemoveFromFaction(MQ103LockeGangFaction)

;GEN-467503: If Sam didn't get it back earlier
;Readding Sam's weapon matching with the player
ObjectReference SamREF = Alias_SamCoe.GetRef()
if !SamRef.HasKeyword(TeammateReadyWeapon_DO)
  SamREF.AddKeyword(TeammateReadyWeapon_DO)
endif

kmyQuest.MQ103EnableLayer.Delete()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ103 Auto Const Mandatory

Scene Property MQ102_01_SamCoraScene Auto Const Mandatory

Scene Property MQ102_02_SamPlayerIntroScene Auto Const Mandatory

Scene Property MQ102_03_ArrriveAkilaScene Auto Const Mandatory

Scene Property MQ103_09_SurveyScene Auto Const Mandatory

Scene Property MQ103_12_ArtifactScene Auto Const Mandatory

Scene Property MQ103_13_AftermathScene Auto Const Mandatory

Scene Property MQ103_15_SmugglerAfterScene Auto Const Mandatory

Scene Property MQ103_14_AmbushScene Auto Const Mandatory

Scene Property MQ103_16_LodgeScene Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactCollection Auto Const Mandatory

Scene Property MQ103_17_EndScene Auto Const Mandatory

Quest Property MQ104 Auto Const Mandatory

Quest Property FFLodge01 Auto Const Mandatory

Quest Property MQ105 Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_CoraCoe Auto Const Mandatory

ObjectReference Property MQ103SamStartMarker Auto Const Mandatory

Scene Property MQ103_03_ArriveAkilaScene Auto Const Mandatory

Scene Property MQ103_04_GalBankVaultScene Auto Const Mandatory

Scene Property MQ103_06_CoeEstateIntroScene Auto Const Mandatory

Scene Property MQ103_11b_JacobSamEndScene Auto Const Mandatory

Scene Property MQ103_11a_JacobSamArgueScene Auto Const Mandatory

Scene Property MQ103_12b_CoraJacobScene Auto Const Mandatory

Scene Property MQ103_15_LockeGangSamScene Auto Const Mandatory

Scene Property MQ103_16a_LockeGangEavesdrop Auto Const Mandatory

Scene Property MQ103_16b_LockeGangEavesdrop Auto Const Mandatory

Scene Property MQ103_17_ArtifactScene Auto Const Mandatory

Scene Property MQ103_18_AftermathScene Auto Const Mandatory

ObjectReference Property MQ103LockeEnableMarkerREF Auto Const Mandatory

Scene Property MQ103_19_AmbushScene Auto Const Mandatory

ReferenceAlias Property Alias_Locke Auto Const Mandatory

RefCollectionAlias Property Alias_LockeBodyguard Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Scene Property MQ103_20_SmugglerAfterScene Auto Const Mandatory

Scene Property MQ103_21_LodgeScene Auto Const Mandatory

Scene Property MQ103_22_EndScene Auto Const Mandatory

ObjectReference Property LodgeStartMarker Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

Quest Property MQ104A Auto Const Mandatory

Quest Property MQ104B Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory

ObjectReference Property MQ103DungeonStart Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactActivator Auto Const Mandatory

ReferenceAlias Property Alias_MQ103ArtifactQuestObject Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Weapon Property Eon Auto Const Mandatory

ObjectReference Property MQ103ArtifactSpawnMarker Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

ObjectReference Property MQ103_SamOutsideAkilaMarker Auto Const Mandatory

Key Property MQ103CoeVaultKey Auto Const Mandatory

Perk Property TraitFreestarCollectiveSettler Auto Const Mandatory

Scene Property MQ103_04a_GalBankLockedScene Auto Const Mandatory

ReferenceAlias Property Alias_GalBankVaultDoor Auto Const Mandatory

Quest Property FC01 Auto Const Mandatory

ObjectReference Property MQ103LockeGangExteriorEnableMarker Auto Const Mandatory

ObjectReference Property MQ103AshtaEnableMarker Auto Const Mandatory

RefCollectionAlias Property Alias_AshtaALL Auto Const Mandatory

ReferenceAlias Property Alias_LockeGangMapMarker Auto Const Mandatory

Scene Property MQ103_19b_AshtaScene Auto Const Mandatory

Scene Property MQ103_21a_LodgeMoveScene Auto Const Mandatory

Scene Property MQ103_04b_GalBankOpenScene Auto Const Mandatory

ObjectReference Property LC006_CaveBlocker_EnableMarker Auto Const Mandatory

ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_SetStage300Trigger Auto Const Mandatory

ReferenceAlias Property Alias_LockGang01 Auto Const Mandatory

ReferenceAlias Property Alias_LockGang02 Auto Const Mandatory

ReferenceAlias Property Alias_LockGang03 Auto Const Mandatory

ReferenceAlias Property Alias_LockGang04 Auto Const Mandatory

Faction Property MQ103LockeGangFaction Auto Const Mandatory

ReferenceAlias Property Alias_CoeOfficeDoor Auto Const Mandatory

ReferenceAlias Property Alias_CoeMainDoor Auto Const Mandatory

ReferenceAlias Property Alias_SolomonMaps Auto Const Mandatory

Key Property MQ103JacobOfficeKey Auto Const Mandatory

ReferenceAlias Property Alias_JacobCoe Auto Const Mandatory

Message Property MQ103SamLockInMSG Auto Const Mandatory

Message Property MQ103SamLockInOverMSG Auto Const Mandatory

Message Property MQ103SamLockInMidquestOverMSG Auto Const Mandatory

Quest Property CREW_EliteCrew_CoraCoe Auto Const Mandatory

LeveledItem Property LL_Weapon_Razorback_Upgraded Auto Const Mandatory

Message Property MQCompanionLockedBailoutMSG Auto Const Mandatory

ObjectReference Property MQ103_CoraSpaceportReadingMarker Auto Const Mandatory

Perk Property BackgroundGangster Auto Const Mandatory

ObjectReference Property LC006_LoadDoor_Ext Auto Const Mandatory

ObjectReference Property CoeEstateFirstFloorDoorREF Auto Const Mandatory

ObjectReference Property CoeEstateBalconyDoorREF Auto Const Mandatory

ObjectReference Property CoeEstateFrontDoorREF Auto Const Mandatory

Faction Property CoeEstateDoorFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_Blake Auto Const Mandatory

Keyword Property TeammateReadyWeapon_DO Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactSoundMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactSoundMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_LockeAshtaScreammer Auto Const Mandatory

RefCollectionAlias Property PassengersRefColl Auto Const

RefCollectionAlias Property Alias_LockeGangInteriorNPCs Auto Const Mandatory

RefCollectionAlias Property DisembarkingCrew Auto Const

ObjectReference Property CoeEstateFirstFloorDoorTwo Auto Const

Activator Property COM_MQ103_TxtReplace_QuestName_SamCoe Auto Const Mandatory
