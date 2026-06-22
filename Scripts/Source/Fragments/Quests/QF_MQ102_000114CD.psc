;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ102_000114CD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1635)
MQ101.SetStage(1800)
MQ101.SetStage(1810)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)

Game.GetPlayer().moveto(LodgeStartMarker)
Game.GetPlayer().additem(credits, 1000)

SetStage(10)

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
SQ_PlayerShip.ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)

SetStage(10)
SetStage(100)
SetStage(200)
SetStage(300)

TestGoToSpaceQuest.SetStage(10)
Utility.Wait(0.5)
Alias_SarahMorgan.GetRef().Moveto(Game.GetPlayer(), afYOffset=-2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;trigger Vasco to forcegreet
Alias_Vasco.GetActorRef().EvaluatePackage()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("FollowerWarn")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0096_Item_00
Function Fragment_Stage_0096_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0097_Item_00
Function Fragment_Stage_0097_Item_00()
;BEGIN CODE
MQCompanionLockedBailoutMSG.Show()

SetStage(96)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()

Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

(SQ_Companions as SQ_CompanionsScript).SetRoleActive(SarahMorganREF)
(SQ_Companions as SQ_CompanionsScript).LockInCompanion(SarahMorganREF as CompanionActorScript, True, MQ102SarahLockInMSG, TextReplaceActivator = COM_MQ102_TxtReplace_QuestName_SarahMorgan)
SarahMorganREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
if !UC01.GetStageDone(100)
  MQ102_002_MASTScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
UC01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;Moara's log is available in Nova Staryard
Alias_NovaMoaraLog.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()

Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()

SetObjectiveCompleted(10)

(SQ_Companions as SQ_CompanionsScript).SetRoleActive(SarahMorganREF)
(SQ_Companions as SQ_CompanionsScript).LockInCompanion(SarahMorganREF as CompanionActorScript, True, MQ102SarahLockInMSG, TextReplaceActivator = COM_MQ102_TxtReplace_QuestName_SarahMorgan)
SarahMorganREF.EvaluatePackage()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0277_Item_00
Function Fragment_Stage_0277_Item_00()
;BEGIN CODE
SetObjectiveCompleted(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0285_Item_00
Function Fragment_Stage_0285_Item_00()
;BEGIN CODE
Game.GetPlayer().removeitem(Credits, NPCDemandMoney_Medium.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0287_Item_00
Function Fragment_Stage_0287_Item_00()
;BEGIN CODE
Game.GetPlayer().removeitem(Credits, NPCDemandMoney_Small.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE mq102script
Quest __temp = self as Quest
mq102script kmyQuest = __temp as mq102script
;END AUTOCAST
;BEGIN CODE
;encounter is started through Change Location event in Story Manager

kmyquest.BlockSpaceTravel()

;start space encounter
;MQ102SpaceEncounter02a.Start()

MQ102_007_SarahVenusScene.Start()

SetObjectiveCompleted(40)
SetObjectiveDisplayed(41)
SetObjectiveDisplayed(32, abdisplayed=False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
;scene started, move Sarah to ship passenger marker
Alias_SarahMorgan.GetRef().MoveTo(PlayerShipPassengerMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveCompleted(41)
SetObjectiveDisplayed(42)
SetObjectiveDisplayed(43)

Tutorial_ShipStealth_MSGBox.Show()
Utility.Wait(0.1)
kmyquest.ShowHelpMessage("SpaceTarget")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_01
Function Fragment_Stage_0410_Item_01()
;BEGIN AUTOCAST TYPE mq102script
Quest __temp = self as Quest
mq102script kmyQuest = __temp as mq102script
;END AUTOCAST
;BEGIN CODE
kmyquest.UnBlockSpaceTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
;start space encounter
MQ102SpaceEncounter02a.Start()

;Make Varuun ships friends
Game.GetPlayer().addtoFaction(MQ102VaruunFaction)

SetObjectiveCompleted(40)
SetObjectiveCompleted(41)
SetObjectiveDisplayed(42)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
If GetStageDone(415) ;Sarah version vs Varuun version
  MQ102_008_VaruunScene02_Sarah.Start()
Else
  MQ102_008_VaruunScene01.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("MQ102Satellite")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(43, abdisplayed=false)

Game.GetPlayer().RemoveFromFaction(MQ102VaruunFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
ObjectReference SatelliteREF = Alias_SatelliteBeacon.GetRef()

SatelliteREF .BlockActivation(True, True)
QST_MQ102_Satellite_Activate_WEF.Play(SatelliteREF)

Message.ClearHelpMessages()

SetObjectiveCompleted(40)
SetObjectiveCompleted(42)
SetObjectiveCompleted(44)
SetObjectiveCompleted(50)
SetObjectiveCompleted(55)
SetObjectiveDisplayed(60)
SetObjectiveDisplayed(43, abdisplayed=False)

MQ102_012_MoaraSatelliteScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE mq102script
Quest __temp = self as Quest
mq102script kmyQuest = __temp as mq102script
;END AUTOCAST
;BEGIN CODE
kmyquest.BlockSpaceTravel()

MQ102_012_MoaraSatelliteScene.Stop()
MQ102_014_MoonScene.Start()

SetObjectiveCompleted(60)
SetObjectiveDisplayed(61)

;Moara's log is available in Nova Staryard
Alias_NovaMoaraLog.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE mq102script
Quest __temp = self as Quest
mq102script kmyQuest = __temp as mq102script
;END AUTOCAST
;BEGIN CODE
kmyquest.UnBlockSpaceTravel()

SetObjectiveCompleted(61)
SetObjectiveDisplayed(65)

Tutorial_Docking_MSGBox.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetObjectiveCompleted(65)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
SetObjectiveCompleted(61)
SetObjectiveCompleted(65)
SetObjectiveDisplayed(70)

MQ102_015_StaryardSarahComment01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
MQ102_016_StaryardSarahComment02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN CODE
SetObjectiveCompleted(61)
SetObjectiveCompleted(65)
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0595_Item_00
Function Fragment_Stage_0595_Item_00()
;BEGIN CODE
MQ102_016_StaryardSarahComment03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Moara encounter is started through Change Location event in Story Manager

MQ102_033_SaturnScene.Start()

;remove optional objective from previous
SetObjectiveDisplayed(85, abdisplayed=false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0605_Item_00
Function Fragment_Stage_0605_Item_00()
;BEGIN CODE
;damage engines and prevent engine repair
ObjectReference ShipMarkerREF = Alias_MoaraShipMarker.GetRef()
SpaceshipReference MoaraShipREF = Alias_MoaraShip.GetShipReference()

MoaraShipREF.Moveto(ShipMarkerREF)
MoaraShipREF.Enable()

MoaraShipRef.DamageValue(SpaceshipEngineHealth, 2)
MoaraShipREF.EnablePartRepair(SpaceshipEngineHealth, false)

;also damage shields a bit
MoaraShipRef.DamageValue(SpaceshipShieldHealth, 3)
MoaraShipREF.EnablePartRepair(SpaceshipShieldHealth, false)

;don't allow bleedout recovery
MoaraShipREF.SetNoBleedoutRecovery()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0607_Item_00
Function Fragment_Stage_0607_Item_00()
;BEGIN CODE
SetStage(620)
Setstage(630)

MQ102_033_NeptuneScene.Stop()
MQ102_034_ApproachShipScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveCompleted(32)
SetObjectiveCompleted(40)
SetObjectiveCompleted(41)
SetObjectiveCompleted(42)
SetObjectiveDisplayed(43, abdisplayed=false)
SetObjectiveCompleted(60)
SetObjectiveCompleted(61)
SetObjectiveCompleted(70)
SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)

MQ102_034_ApproachShipScene.Start()

SpaceshipReference MoaraShipREF = Alias_MoaraShip.GetShipReference()

MoaraShipREF.SetValue(Aggression, 1)
MoaraShipREF.AddtoFaction(PlayerEnemyFaction)
MoaraShipREF.StartCombat(Alias_PlayerShip.GetShipReference())
;don't let the ship recover from engines disabled
MoaraShipREF.EnablePartRepair(SpaceshipEngineHealth, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;If Game.UsingGamePad()
;  Tutorial_Boarding_MSGBox01.Show()
;Else
;  Tutorial_Boarding_MSGBox01_PC.Show()
;EndIf
;Utility.Wait(0.1)
;kmyquest.ShowHelpMessage("DisableEngines")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_01
Function Fragment_Stage_0630_Item_01()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
Tutorial_Boarding_MSGBox02.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_01
Function Fragment_Stage_0640_Item_01()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)

MQ102_034_ApproachShipScene.Stop()
MQ102_035_ShipDisabledScene.Start()

;move Moara to the ship
Alias_Moara.GetActorRef().moveto(Alias_MoaraShipCaptiveMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
Actor MoaraREF = Alias_Moara.GetActorRef()

SetObjectiveCompleted(100)
SetObjectiveCompleted(110)
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)

MQ102_035_ShipDisabledScene.Stop()

;make sure Moara is moved and ghosted
MoaraREF.moveto(Alias_MoaraShipCaptiveMarker.GetRef())
MoaraREF.SetGhost()

;place the appropriate artifact
ObjectReference PlacementREF = Alias_MQ102ArtifactMoara.GetRef()
ObjectReference ArtifactREF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(3, PlacementREF)
Alias_MQ102Artifact.ForceRefTo(ArtifactREF)
ArtifactREF.Enable()
ArtifactREF.BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0652_Item_00
Function Fragment_Stage_0652_Item_00()
;BEGIN CODE
SetStage(660)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0655_Item_00
Function Fragment_Stage_0655_Item_00()
;BEGIN CODE
ObjectReference CockpitDoorREF = Alias_MoaraShipCockpitDoor.GetRef()

CockpitDoorREF.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)

MQ102_036_MoaraLockedUp.Start()

;ship is no longer hostile
Game.GetPlayer().StopCombatAlarm()
SpaceshipReference MoaraShipREF = Alias_MoaraShip.GetShipReference()
MoaraShipREF.SetValue(Aggression, 0)
MoaraShipREF.AddtoFaction(PlayerAllyFaction)
MoaraShipREF.RemoveFromFaction(PlayerEnemyFaction)
MoaraShipREF.SetValue(DockingPermission, 0)
MoaraShipREF.SetIgnoreFriendlyHits(True)

ObjectReference CockpitDoorREF = Alias_MoaraShipCockpitDoor.GetRef()

If GetStageDone(670) || (CockPitDoorREF.GetOpenState() <= 2)
  SetStage(680)
Else
  SetObjectiveDisplayed(140)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0670_Item_00
Function Fragment_Stage_0670_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140)

If GetStageDone(660)
  SetStage(680)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0805_Item_00
Function Fragment_Stage_0805_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(140, abdisplayed=False)
SetObjectiveDisplayed(150)

MQ102_037_Moara.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(155)

;player can activate Artifact
Alias_MQ102Artifact.GetRef().BlockActivation(False, False)

Actor MoaraREF = Alias_Moara.GetActorRef()
MoaraREF.SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
SetObjectiveCompleted(155)
SetObjectiveDisplayed(160)

MQ102_037_SarahWrapUp.Start()

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(3)

;enable activater
ArmillaryMountSwapEnableMarker.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
MQ102_023_ReturnLodge.Start()

;Sarah Morgan stops following
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleInActive(SarahMorganREF)
DismissedCrew.RemoveRef(SarahMorganRef)
DisembarkingCrew.RemoveRef(SarahMorganRef)

SarahMorganREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
SetObjectiveDisplayed(170)

;Block the tour TL until the quest's over
MQ102_BlockNoelTour.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
MQ102_023_ReturnLodge.Stop()
MQ102_024_AddArtifact.Start()

SetObjectiveCompleted(170)
SetObjectiveDisplayed(180)

;If the tour scene is actively playing, stop it and mark it completed
if FFLodge01_Stage20_Noel_TourScene.IsPlaying()
  FFLodge01_Stage20_Noel_TourScene.Stop()
  FFLodge01_Actual.SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
SetObjectiveCompleted(180)
SetObjectiveDisplayed(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(SarahMorganREF)

(SarahMorganRef as CompanionActorScript).AllowStoryGatesAndRestartTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1120_Item_00
Function Fragment_Stage_1120_Item_00()
;BEGIN CODE
SetStage(1100)

;Sarah resumes following
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleActive(SarahMorganREF)
SarahMorganREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;start other quests
MQ103.SetStageNoWait(10)
MQ104.SetStageNoWait(10)
FFLodge01.SetStageNoWait(10)
MQ102xPostQuest.Start()
Rad02.SetStageNoWait(5)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;Sarah no longer locked in as follower
;only release lock if her companion quest doesn't have her locked as well
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
If COM_Quest_SarahMorgan_Q01_SarahLockInCND.IsTrue(SarahMorganREF)
  ;do nothing
Else
  (SQ_Companions as SQ_CompanionsScript).LockInCompanion(SarahMorganREF as CompanionActorScript, False, MQ102SarahLockInOverMSG)
EndIf

;top levels on sarah should be available
SetStage(1130)

;shut down all space encounters
MQ102SpaceEncounter02a.Stop()
MQ102SpaceEncounter03.Stop()

;remove player from any temp factions
Game.GetPlayer().RemoveFromFaction(MQ102VaruunFaction)

;move Moara
Actor MoaraREF = Alias_Moara.GetActorRef()
MoaraREF.moveto(CydoniaBarSandboxMarker)
MoaraREF.EvaluatePackage()
MoaraREF.SetGhost(False)
MoaraEliteCrewQuest.SetStage(1)

;Unblock Moara's tour TL
MQ102_BlockNoelTour.SetValue(0)

;quest failsafe timers
(MQ00 as MQ00QuestScript).StartMQ104AFailsafeTimer()
(MQ00 as MQ00QuestScript).StartMQ104BFailsafeTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ102_020_SentinelMoara Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

Scene Property MQ102_023_ReturnLodge Auto Const Mandatory

Quest Property MQ103 Auto Const Mandatory

Quest Property MQ104 Auto Const Mandatory

Quest Property FFLodge01 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactCollection Auto Const Mandatory

Scene Property MQ102_024_AddArtifact Auto Const Mandatory

Scene Property MQ102_001_PlayerScene Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Scene Property MQ102_002_MASTScene Auto Const Mandatory

Scene Property MQ102_012_SearchCluesScene Auto Const Mandatory

Scene Property MQ102_014_JupiterScene Auto Const Mandatory

ObjectReference Property LodgeStartMarker Auto Const Mandatory

Quest Property MQ102SpaceEncounter02a Auto Const Mandatory

Quest Property MQ102SpaceEncounter03 Auto Const Mandatory

Scene Property MQ102_033_SaturnScene Auto Const Mandatory

Scene Property MQ102_034_ApproachShipScene Auto Const Mandatory

Scene Property MQ102_037_SarahWrapUp Auto Const Mandatory

Scene Property MQ102_036_MoaraLockedUp Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Scene Property MQ102_007_SarahVenusScene Auto Const Mandatory

Quest Property UC01 Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory

ReferenceAlias Property Alias_FirstEncounterShip Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_MoaraShip Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

RefCollectionAlias Property Alias_MoaraShipEnemies Auto Const Mandatory

Quest Property MQ102xPostQuest Auto Const Mandatory

ReferenceAlias Property Alias_Moara Auto Const Mandatory

ObjectReference Property CydoniaBarSandboxMarker Auto Const Mandatory

SQ_PlayerShipScript Property SQ_PlayerShip Auto Const Mandatory


GlobalVariable Property NPCDemandMoney_Medium Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

Scene Property MQ102_035_ShipDisabledScene Auto Const Mandatory

ReferenceAlias Property Alias_MoaraShipCaptiveMarker Auto Const Mandatory

ObjectReference Property MQ102ArtifactSpawnMarker Auto Const Mandatory

ReferenceAlias Property Alias_MQ102Artifact Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

ReferenceAlias Property Alias_Vasco Auto Const Mandatory

Scene Property AudioLogs_MQ102_Pirate Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Large Auto Const Mandatory

Quest Property MoaraEliteCrewQuest Auto Const

Armor Property Spacesuit_Constellation_Helmet_01 Auto Const Mandatory

Armor Property Spacesuit_Constellation_Backpack_01 Auto Const Mandatory

Armor Property Spacesuit_Constellation_01 Auto Const Mandatory

ActorValue Property SpaceshipEngineHealth Auto Const Mandatory

ActorValue Property SpaceshipShieldHealth Auto Const Mandatory

LocationAlias Property Alias_CityCydoniaLocation Auto Const Mandatory

Quest Property TestGoToSpaceQuest Auto Const Mandatory

ReferenceAlias Property Alias_MoaraShipMarker Auto Const Mandatory

ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const Mandatory

Quest Property RAD02 Auto Const Mandatory

Scene Property MQ102_008_VaruunScene02_Sarah Auto Const Mandatory

Scene Property MQ102_008_VaruunScene01 Auto Const Mandatory

Faction Property MQ102VaruunFaction Auto Const Mandatory

Scene Property MQ102_012_MoaraSatelliteScene Auto Const Mandatory

ReferenceAlias Property Alias_NovaMoaraLog Auto Const Mandatory

Scene Property MQ102_014_MoonScene Auto Const Mandatory

Scene Property MQ102_015_StaryardSarahComment01 Auto Const Mandatory

Scene Property MQ102_016_StaryardSarahComment02 Auto Const Mandatory

Scene Property MQ102_016_StaryardSarahComment03 Auto Const Mandatory

Message Property Tutorial_ShipStealth_MSGBox Auto Const Mandatory

Message Property Tutorial_Docking_MSGBox Auto Const Mandatory

Message Property Tutorial_Boarding_MSGBox01 Auto Const Mandatory

Message Property Tutorial_Boarding_MSGBox01_PC Auto Const Mandatory

Message Property Tutorial_Boarding_MSGBox02 Auto Const Mandatory

Scene Property MQ102_037_Moara Auto Const Mandatory

ReferenceAlias Property Alias_MQ102ArtifactMoara Auto Const Mandatory

Message Property MQ102SarahLockInMSG Auto Const Mandatory

Message Property MQ102SarahLockInOverMSG Auto Const Mandatory

ReferenceAlias Property Alias_MoaraShipBoss Auto Const Mandatory

ReferenceAlias Property Alias_SatelliteBeacon Auto Const Mandatory

Message Property MQCompanionLockedBailoutMSG Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

WwiseEvent Property QST_MQ102_Satellite_Activate_WEF Auto Const Mandatory

Scene Property FFLodge01_Stage20_Noel_TourScene Auto Const Mandatory

GlobalVariable Property MQ102_BlockNoelTour Auto Const Mandatory

Quest Property FFLodge01_Actual Auto Const Mandatory

Keyword Property CurrentInteractionLinkedRefKeyword Auto Const Mandatory

RefCollectionAlias Property DismissedCrew Auto Const

RefCollectionAlias Property DisembarkingCrew Auto Const

ConditionForm Property COM_Quest_SarahMorgan_Q01_SarahLockInCND Auto Const Mandatory

Faction Property PlayerAllyFaction Auto Const Mandatory

Keyword Property COM_PreventStoryGateScenes Auto Const Mandatory

ReferenceAlias Property Alias_MoaraShipCockpitDoor Auto Const Mandatory

Activator Property COM_MQ102_TxtReplace_QuestName_SarahMorgan Auto Const Mandatory

Scene Property MQ102_033_NeptuneScene Auto Const Mandatory

Quest Property MQ00 Auto Const Mandatory

ReferenceAlias Property PlayerShipPassengerMarker Auto Const
