;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ201_00017CE8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(7)


Game.GetPlayer().MoveTo(LodgeStartMarker)
Alias_Vladimir.GetActorRef().moveto(MQ106_VladimirMarker01)

;player can now board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

SetStage(10)

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;make sure the NG Plus quest variant options are also running
MQ404.Start()

;make sure player can board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(12)
SetObjectiveDisplayed(22)

;enable the artifact rooms
Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait()
Alias_OpenCaveEnableMarker02.GetRef().EnableNoWait()
Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait()
Alias_ClosedCaveEnableMarker02.GetRef().DisableNoWait()

;make sure we can see the map marker and land there
ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef()
ObjectReference MapMarker02REF = Alias_MapMarker02.GetRef()

MapMarker01REF.AddToMapScanned(True)
MapMarker01REF.SetMarkerVisibleOnStarMap()
MapMarker01REF.SetRequiresScanning(False)
MapMarker02REF.AddToMapScanned(True)
MapMarker02REF.SetMarkerVisibleOnStarMap()
MapMarker02REF.SetRequiresScanning(False)

;swap the Activators with the appropriate Artifacts
ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(8, Alias_ArtifactActivator01.GetRef())
Alias_ArtifactActivator01.ForceRefTo(ArtifactActivator01REF)
ArtifactActivator01REF.EnableNoWait()

ObjectReference ArtifactActivator02REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(9, Alias_ArtifactActivator02.GetRef())
Alias_ArtifactActivator02.ForceRefTo(ArtifactActivator02REF)
ArtifactActivator02REF.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
SetObjectiveCompleted(12)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
SetObjectiveCompleted(14)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Actor Starborn01REF = Alias_Starborn01.GetActorRef()

Starborn01REF.Enable()
Starborn01REF.moveto(Alias_ArtifactRoomSpawnMarker01.GetRef())
;play music
MUSGenesisStingerStarbornAppearB.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)

;advance if the player has the other artifacts
If (GetStageDone(40) == 1)
  SetStage(100)
EndIf

;give player the appropriate artifact
ObjectReference Artifact01REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(8, MQ201ArtifactSpawnMarker01)
Alias_ArtifactQuestObject01.ForceRefTo(Artifact01REF)
Artifact01REF.Enable()
Game.GetPlayer().additem(Artifact01REF)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
SetObjectiveCompleted(22)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
SetObjectiveCompleted(24)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Actor Starborn02REF = Alias_Starborn02.GetActorRef()

Starborn02REF.Enable()
Starborn02REF.moveto(Alias_ArtifactRoomSpawnMarker02.GetRef())

;play music
MUSGenesisStingerStarbornAppearB.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)

;advance if the player has the other artifacts
If (GetStageDone(30) == 1)
  SetStage(100)
EndIf

;give player the appropriate artifact
ObjectReference Artifact02REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(9, MQ201ArtifactSpawnMarker02)
Alias_ArtifactQuestObject02.ForceRefTo(Artifact02REF)
Artifact02REF.Enable()
Game.GetPlayer().additem(Artifact02REF)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

;make sure collection is enabled
ArmillaryMountSwapEnableMarker.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
MQ204_002_ReturnScene.Start()

SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
MQCompanionLockedBailoutMSG.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

MQ201B.SetStageNoWait(10)

;Achievement Unlocked
Game.AddAchievement(5)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;Achievement Unlocked
Game.AddAchievement(5)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_ArtifactCollection Auto Const Mandatory

Scene Property MQ204_002_ReturnScene Auto Const Mandatory

Quest Property MQ202 Auto Const Mandatory

Quest Property MQ203 Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

ReferenceAlias Property Alias_Vladimir Auto Const Mandatory

ObjectReference Property MQ203VladimirStartMarker Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_OpenCaveEnableMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_ClosedCaveEnableMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactQuestObject01 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactQuestObject02 Auto Const Mandatory

ReferenceAlias Property Alias_MQ204CompanionChoice Auto Const Mandatory

ObjectReference Property SarahMorganREF Auto Const Mandatory

ObjectReference Property MQ106_VladimirMarker01 Auto Const Mandatory

ObjectReference Property LodgeStartMarker Auto Const Mandatory

GlobalVariable Property MQ_CompanionAtEye Auto Const Mandatory

GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const Mandatory

ReferenceAlias Property MQ00_CompanionAtEye Auto Const

ReferenceAlias Property Alias_MapMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker02 Auto Const Mandatory

ObjectReference Property MQ201ArtifactSpawnMarker01 Auto Const Mandatory

ObjectReference Property MQ201ArtifactSpawnMarker02 Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

Quest Property MQ201B Auto Const Mandatory

ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const Mandatory

Quest Property MQ404 Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactActivator01 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactActivator02 Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_Starborn01 Auto Const Mandatory

ReferenceAlias Property Alias_Starborn02 Auto Const Mandatory

MusicType Property MUSGenesisStingerStarbornAppearB Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactRoomSpawnMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactRoomSpawnMarker02 Auto Const Mandatory

Message Property MQCompanionLockedBailoutMSG Auto Const Mandatory
