;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ402_001DC418 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;player can build armillary on their ship
MQAlllowArmillaryGravDrive.SetValueInt(1)

;Emissary needs to be random since no Companion dies
MQ_EmissaryRandom.SetValueInt(1)
MQ_EmissaryRevealed.SetValueInt(1)

;set player as having acquired the first three Artifacts
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(0)
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(1)
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(2)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MQ_TempleQuest_01.Start()

SetObjectiveCompleted(10)
SetObjectiveDisplayed(110)
SetObjectiveDisplayed(120)
SetObjectiveDisplayed(130)
SetObjectiveDisplayed(140)
SetObjectiveDisplayed(150)
SetObjectiveDisplayed(160)
SetObjectiveDisplayed(170)
SetObjectiveDisplayed(180)

;swap the Activators with the appropriate Artifacts
ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(5, Alias_ArtifactActivator01.GetRef())
Alias_ArtifactActivator01.ForceRefTo(ArtifactActivator01REF)
ArtifactActivator01REF.EnableNoWait()

ObjectReference ArtifactActivator02REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(6, Alias_ArtifactActivator02.GetRef())
Alias_ArtifactActivator02.ForceRefTo(ArtifactActivator02REF)
ArtifactActivator02REF.EnableNoWait()

ObjectReference ArtifactActivator03REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(8, Alias_ArtifactActivator03.GetRef())
Alias_ArtifactActivator03.ForceRefTo(ArtifactActivator03REF)
ArtifactActivator03REF.EnableNoWait()

ObjectReference ArtifactActivator04REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(9, Alias_ArtifactActivator04.GetRef())
Alias_ArtifactActivator04.ForceRefTo(ArtifactActivator04REF)
ArtifactActivator04REF.EnableNoWait()

ObjectReference ArtifactActivator05REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(11, Alias_ArtifactActivator05.GetRef())
Alias_ArtifactActivator05.ForceRefTo(ArtifactActivator05REF)
ArtifactActivator05REF.EnableNoWait()

ObjectReference ArtifactActivator06REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(12, Alias_ArtifactActivator06.GetRef())
Alias_ArtifactActivator06.ForceRefTo(ArtifactActivator06REF)
ArtifactActivator06REF.EnableNoWait()

;enable the artifact rooms
Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait()
Alias_OpenCaveEnableMarker02.GetRef().EnableNoWait()
Alias_OpenCaveEnableMarker03.GetRef().EnableNoWait()
Alias_OpenCaveEnableMarker04.GetRef().EnableNoWait()
Alias_OpenCaveEnableMarker05.GetRef().EnableNoWait()
Alias_OpenCaveEnableMarker06.GetRef().EnableNoWait()

Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait()
Alias_ClosedCaveEnableMarker02.GetRef().DisableNoWait()
Alias_ClosedCaveEnableMarker03.GetRef().DisableNoWait()
Alias_ClosedCaveEnableMarker04.GetRef().DisableNoWait()
Alias_ClosedCaveEnableMarker05.GetRef().DisableNoWait()
Alias_ClosedCaveEnableMarker06.GetRef().DisableNoWait()

;make sure we can see the map marker and land there
ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef()
ObjectReference MapMarker02REF = Alias_MapMarker02.GetRef()
ObjectReference MapMarker03REF = Alias_MapMarker02.GetRef()
ObjectReference MapMarker04REF = Alias_MapMarker02.GetRef()
ObjectReference MapMarker05REF = Alias_MapMarker02.GetRef()
ObjectReference MapMarker06REF = Alias_MapMarker02.GetRef()

MapMarker01REF.AddToMapScanned(True)
MapMarker01REF.SetMarkerVisibleOnStarMap()
MapMarker01REF.SetRequiresScanning(False)

MapMarker02REF.AddToMapScanned(True)
MapMarker02REF.SetMarkerVisibleOnStarMap()
MapMarker02REF.SetRequiresScanning(False)

MapMarker03REF.AddToMapScanned(True)
MapMarker03REF.SetMarkerVisibleOnStarMap()
MapMarker03REF.SetRequiresScanning(False)

MapMarker04REF.AddToMapScanned(True)
MapMarker04REF.SetMarkerVisibleOnStarMap()
MapMarker04REF.SetRequiresScanning(False)

MapMarker05REF.AddToMapScanned(True)
MapMarker05REF.SetMarkerVisibleOnStarMap()
MapMarker05REF.SetRequiresScanning(False)

MapMarker06REF.AddToMapScanned(True)
MapMarker06REF.SetMarkerVisibleOnStarMap()
MapMarker06REF.SetRequiresScanning(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)

;advance if the player has all
If (GetStageDone(120) == 1) && (GetStageDone(130) == 1) && (GetStageDone(140) == 1) && (GetStageDone(150) == 1) && (GetStageDone(160) == 1)
  SetStage(500)
EndIf

;give player the appropriate artifact
ObjectReference ArtifactREF01 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(5, MQHoldingCellCenterMarker)
ArtifactREF01.Enable()
Game.GetPlayer().additem(ArtifactREF01)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)

;advance if the player has all
If (GetStageDone(110) == 1) && (GetStageDone(130) == 1) && (GetStageDone(140) == 1) && (GetStageDone(150) == 1) && (GetStageDone(160) == 1)
  SetStage(500)
EndIf

;give player the appropriate artifact
ObjectReference ArtifactREF02 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(6, MQHoldingCellCenterMarker)
ArtifactREF02.Enable()
Game.GetPlayer().additem(ArtifactREF02)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0122_Item_00
Function Fragment_Stage_0122_Item_00()
;BEGIN CODE
Actor Starborn02REF = Alias_Starborn02.GetActorRef()

Starborn02REF.Enable()
Starborn02REF.moveto(Alias_ArtifactRoomSpawnMarker02.GetRef())

;play music
MUSGenesisStingerStarbornAppearB.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)

;advance if the player has all
If (GetStageDone(110) == 1) && (GetStageDone(120) == 1) && (GetStageDone(140) == 1) && (GetStageDone(150) == 1) && (GetStageDone(160) == 1)
  SetStage(500)
EndIf

;give player the appropriate artifact
ObjectReference ArtifactREF03 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(8, MQHoldingCellCenterMarker)
ArtifactREF03.Enable()
Game.GetPlayer().additem(ArtifactREF03)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140)

;advance if the player has all
If (GetStageDone(110) == 1) && (GetStageDone(120) == 1) && (GetStageDone(130) == 1)  && (GetStageDone(150) == 1) && (GetStageDone(160) == 1)
  SetStage(500)
EndIf

;give player the appropriate artifact
ObjectReference ArtifactREF04 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(9, MQHoldingCellCenterMarker)
ArtifactREF04.Enable()
Game.GetPlayer().additem(ArtifactREF04)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0142_Item_00
Function Fragment_Stage_0142_Item_00()
;BEGIN CODE
Actor Starborn04REF = Alias_Starborn04.GetActorRef()

Starborn04REF.Enable()
Starborn04REF.moveto(Alias_ArtifactRoomSpawnMarker04.GetRef())

;play music
MUSGenesisStingerStarbornAppearB.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)

;advance if the player has all
If (GetStageDone(110) == 1) && (GetStageDone(120) == 1) && (GetStageDone(130) == 1) && (GetStageDone(140) == 1) && (GetStageDone(160) == 1)
  SetStage(500)
EndIf

;give player the appropriate artifact
ObjectReference ArtifactREF05 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(11, MQHoldingCellCenterMarker)
ArtifactREF05.Enable()
Game.GetPlayer().additem(ArtifactREF05)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)

;advance if the player has all
If (GetStageDone(110) == 1) && (GetStageDone(120) == 1) && (GetStageDone(130) == 1) && (GetStageDone(140) == 1) && (GetStageDone(150) == 1)
  SetStage(500)
EndIf

;give player the appropriate artifact
ObjectReference ArtifactREF06 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(12, MQHoldingCellCenterMarker)
ArtifactREF06.Enable()
Game.GetPlayer().additem(ArtifactREF06)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0162_Item_00
Function Fragment_Stage_0162_Item_00()
;BEGIN CODE
Actor Starborn06REF = Alias_Starborn06.GetActorRef()

Starborn06REF.Enable()
Starborn06REF.moveto(Alias_ArtifactRoomSpawnMarker06.GetRef())

;play music
MUSGenesisStingerStarbornAppearB.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE mq402script
Quest __temp = self as Quest
mq402script kmyQuest = __temp as mq402script
;END AUTOCAST
;BEGIN CODE
;make sure other Lodge members are there when you return
kmyquest.EnableLodgeActors()

;make sure the Armillary in Lodge is disabled
ObjectReference ArmillaryREF = Alias_LodgeArmillary.GetRef()
ArmillaryREF.DisableNoWait()

SetObjectiveCompleted(110)
SetObjectiveCompleted(120)
SetObjectiveCompleted(130)
SetObjectiveCompleted(140)
SetObjectiveCompleted(150)
SetObjectiveCompleted(160)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN CODE
;make sure the Armillary in Lodge is disabled
ObjectReference ArmillaryREF = Alias_LodgeArmillary.GetRef()
ArmillaryREF.DisableNoWait()

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE mq402script
Quest __temp = self as Quest
mq402script kmyQuest = __temp as mq402script
;END AUTOCAST
;BEGIN CODE
kmyquest.AddLodgeArtifacts(Game.GetPlayer())

MQ_TempleQuest_01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SpaceshipReference HunterShipREF= Alias_Scorpius.GetShipReference()
SpaceshipReference EmissaryShipREF = Alias_Helix.GetShipReference()

;enable the Starborn ships
HunterShipREF.Enable()
EmissaryShipREF.Enable()

SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(610)

MQ402_003_HunterEmissary.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
;Buried temple quest starts with Emissary as ally
MQ302b.SetStage(20)

MQ302_SidedWithChoice.SetValueInt(0)

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
;Buried temple quest starts with Hunter as ally
MQ302b.SetStage(21)

MQ302_SidedWithChoice.SetValueInt(1)

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
;Buried temple quest starts with neither as ally
MQ302b.SetStage(22)

MQ302_SidedWithChoice.SetValueInt(2)

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SpaceshipReference HunterShipREF= Alias_Scorpius.GetShipReference()
SpaceshipReference EmissaryShipREF = Alias_Helix.GetShipReference()

HunterShipREF.DisableWithGravJump()
EmissaryShipREF.DisableWithGravJump()

HunterShipREF.moveto(LC165_Adversary01ShipStartMarker)
EmissaryShipREF.moveto(LC165_Adversary02ShipStartMarkerRef)

HunterShipREF.EvaluatePackage()
EmissaryShipREF.EvaluatePackage()

HunterShipREF.Enable()
EmissaryShipREF.Enable()

CompleteAllObjectives()
MQ302.SetStage(15)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_OpenCaveEnableMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_OpenCaveEnableMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_ClosedCaveEnableMarker04 Auto Const Mandatory

ReferenceAlias Property Alias_ClosedCaveEnableMarker06 Auto Const Mandatory

ReferenceAlias Property Alias_ClosedCaveEnableMarker05 Auto Const Mandatory

ReferenceAlias Property Alias_ClosedCaveEnableMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_ClosedCaveEnableMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_OpenCaveEnableMarker06 Auto Const Mandatory

ReferenceAlias Property Alias_OpenCaveEnableMarker05 Auto Const Mandatory

ReferenceAlias Property Alias_OpenCaveEnableMarker04 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker04 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker05 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker06 Auto Const Mandatory

ObjectReference Property MQHoldingCellCenterMarker Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

Quest Property MQ302 Auto Const Mandatory

ReferenceAlias Property Alias_Scorpius Auto Const Mandatory

ReferenceAlias Property Alias_Helix Auto Const Mandatory

Quest Property MQ302b Auto Const Mandatory

Scene Property MQ402_003_HunterEmissary Auto Const Mandatory

GlobalVariable Property MQ_EmissaryRandom Auto Const Mandatory

GlobalVariable Property MQ_EmissaryRevealed Auto Const Mandatory

Quest Property MQ_TempleQuest_01 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactActivator01 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactActivator02 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactActivator03 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactActivator04 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactActivator05 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactActivator06 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArmillary Auto Const Mandatory

ObjectReference Property LC165_Adversary01ShipStartMarker Auto Const Mandatory

ObjectReference Property LC165_Adversary02ShipStartMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_Starborn02 Auto Const Mandatory

ReferenceAlias Property Alias_Starborn04 Auto Const Mandatory

ReferenceAlias Property Alias_Starborn06 Auto Const Mandatory

MusicType Property MUSGenesisStingerStarbornAppearB Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactRoomSpawnMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactRoomSpawnMarker04 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactRoomSpawnMarker06 Auto Const Mandatory

GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const Mandatory

GlobalVariable Property MQ302_SidedWithChoice Auto Const Mandatory
