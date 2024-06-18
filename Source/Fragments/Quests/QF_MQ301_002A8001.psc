;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ301_002A8001 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

Game.GetPlayer().additem(MQ301MoonBaseKey)

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)


Game.GetPlayer().additem(MQ301MoonBaseKey)
Game.GetPlayer().additem(MQ301NasaKey)

SetStage(130)
SetStage(132)

Game.GetPlayer().moveto(MQ301ExtNASAMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)


SetStage(137)

Game.GetPlayer().MoveTo(MQ301InteriorNASAMarker)

Game.GetPlayer().additem(MQ301NasaKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(5)

ObjectReference MoonMapMarkerREF = Alias_MoonMapMarker.GetRef()

MoonMapMarkerREF.Enable()
MoonMapMarkerREF.AddToMapScanned()
MoonMapMarkerREF.SetMarkerVisibleOnStarMap()

Alias_MoonTransmitter.GetRef().Enable()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN AUTOCAST TYPE mq301script
Quest __temp = self as Quest
mq301script kmyQuest = __temp as mq301script
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateMoonLogCount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN AUTOCAST TYPE mq301script
Quest __temp = self as Quest
mq301script kmyQuest = __temp as mq301script
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateMoonLogCount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0033_Item_00
Function Fragment_Stage_0033_Item_00()
;BEGIN AUTOCAST TYPE mq301script
Quest __temp = self as Quest
mq301script kmyQuest = __temp as mq301script
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateMoonLogCount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN AUTOCAST TYPE mq301script
Quest __temp = self as Quest
mq301script kmyQuest = __temp as mq301script
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateMoonLogCount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN AUTOCAST TYPE mq301script
Quest __temp = self as Quest
mq301script kmyQuest = __temp as mq301script
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateMoonLogCount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0036_Item_00
Function Fragment_Stage_0036_Item_00()
;BEGIN AUTOCAST TYPE mq301script
Quest __temp = self as Quest
mq301script kmyQuest = __temp as mq301script
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateMoonLogCount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(15)

Alias_MoonTransmitter.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
NASAMapMarkerREF.SetMarkerVisibleOnStarMap()

Alias_MoonTransmitter.GetRef().BlockActivation(True, True)
MQ301_001_LaunchScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveCompleted(10)
SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)

NASAMapMarkerREF.Enable()
NASAMapMarkerREF.AddToMapScanned()
NASAMapMarkerREF.SetMarkerVisibleOnStarMap()

Game.GetPlayer().additem(MQ301NasaKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_01
Function Fragment_Stage_0130_Item_01()
;BEGIN CODE
SetObjectiveDisplayed(20)

NASAMapMarkerREF.Enable()
NASAMapMarkerREF.AddToMapScanned()
NASAMapMarkerREF.SetMarkerVisibleOnStarMap()

Game.GetPlayer().additem(MQ301NasaKey)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_00
Function Fragment_Stage_0132_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(12, abdisplayed=False)
SetObjectiveDisplayed(25)

;kmyquest.ShowHelpMessage("NASAExterior")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
SetObjectiveCompleted(25)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0137_Item_00
Function Fragment_Stage_0137_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

kmyquest.ShowHelpMessage("Flashlight")

;place the correct Artifact
ObjectReference ArtifactPlacementREF = Alias_Artifact.GetRef()
ObjectReference AttachREF = Alias_GravDriveActivator.GetRef()
ObjectReference ArtifactREF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifactandAttach(13, ArtifactPlacementREF, AttachREF)
Alias_Artifact.ForceRefTo(ArtifactREF)
ArtifactREF.BlockActivation(true, true)
ArtifactREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0141_Item_00
Function Fragment_Stage_0141_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0142_Item_00
Function Fragment_Stage_0142_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0143_Item_00
Function Fragment_Stage_0143_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0144_Item_00
Function Fragment_Stage_0144_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveCompleted(60)
SetObjectiveCompleted(70)

Game.getPlayer().additem(MQ301PrototypeKey)

SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
MQ301_003_CompanionReaction_TruthAboutEarth.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0147_Item_00
Function Fragment_Stage_0147_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("ZeroG")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)

Alias_Artifact.GetRef().BlockActivation(False, False)
Alias_ReleaseArtifactSwitch.GetRef().GetParentCell().setGravityScale(0)
Alias_ReleaseArtifactSwitch.GetRef().GetParentCell().setGravityScale(1)
Alias_GravDriveSoundMarker.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
ObjectReference GravDriveDoorREF = Alias_GravDriveDoor.GetRef()
ObjectReference GravDriveAnimHelperREF = Alias_GravDriveAnimHelper.GetRef()
Actor PlayerREF = Game.GetPlayer()

Bool bAnimationsPlayed = True

If GravDriveDoorREF.PlayAnimation("Open")
  ;do nothing
Else
  bAnimationsPlayed = False
EndIf

If GravDriveAnimHelperREF.PlayAnimation("Play01")
  ;do nothing
Else
  bAnimationsPlayed = False
EndIf

;if the animations failed to play, force quest ahead
If bAnimationsPlayed == False
  PlayerREF.AddItem(Alias_Artifact.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
AudioLogsQuest_MQ301_Earth09.Stop()
AudioLogsQuest_MQ301_Earth10.Stop()
MQ301_004_StarbornScene.Start()

;Controller Shake for effect.
Actor PlayerREF = Game.GetPlayer()
Game.ShakeCamera(none, 0.25, 5)
WwiseEvent_ShakeController_p5_p5_05.Play(PlayerREF)
OE_EarthquakeSound.Play(PlayerREF)

SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(13)

;hold the artifact as a quest object
MQ00_ArtifactsHolder.AddRef(Alias_Artifact.GetRef())

;make sure MQ302 is running for the intro scene dialogue
MQ302.SetStage(10)

;Enable the Starborn attackers in NASA
Alias_StarbornAttackers.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)

;move Actors
Actor HunterREF = Alias_Hunter.GetActorRef()
Actor EmissaryREF = Alias_Emissary.GetActorRef()

HunterREF.Disable()
HunterREF.EvaluatePackage()
HunterREF.moveto(MQ301EmissaryHunterMoveToMarker)
HunterREF.Enable()
EmissaryREF.Disable()
EmissaryREF.EvaluatePackage()
EmissaryREF.moveto(MQ301EmissaryHunterMoveToMarker)
EmissaryREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;check if the player completed the final radiant artifact quests
If MQ207B.GetStageDone(1000)
  SetStage(1000)
Else
  SetStage(900)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllOBjectives()

;Reset the Buried Temple.
LC165BuriedTempleSpaceLocation.Reset()
LC165BuriedTempleLocation.Reset()

;start MQ302 in the right state
int iChoice = MQ302_SidedWithChoice.GetValueInt()
If iChoice == 0
  ;start MQ302B with the Emissary as your ally.
  MQ302b.SetStage(20)
ElseIf iChoice == 1
  ;start MQ302B with the Hunter as your ally.
  MQ302b.SetStage(21)
Else
  ;start MQ302B with neither ally.
  MQ302b.SetStage(22)
EndIf

;Achievement Unlocked
Game.AddAchievement(9)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MQ301StartMarker Auto Const Mandatory

Key Property MQ301MoonBaseKey Auto Const Mandatory

Scene Property MQ301_001_LaunchScene Auto Const Mandatory

ReferenceAlias Property Alias_MoonTransmitter Auto Const Mandatory

Scene Property MQ301_002_CompanionReaction Auto Const Mandatory

Scene Property MQ301_003_CompanionReaction_TruthAboutEarth Auto Const Mandatory

ObjectReference Property MQ301ExtNASAMarker Auto Const Mandatory

ObjectReference Property MQ301InteriorNASAMarker Auto Const Mandatory

Quest Property MQ302 Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

ReferenceAlias Property Alias_Artifact Auto Const Mandatory

Scene Property MQ301_004_StarbornScene Auto Const Mandatory

ObjectReference Property NASAMapMarkerREF Auto Const Mandatory

Quest Property MQ207B Auto Const Mandatory

LocationAlias Property Alias_NASALocation Auto Const Mandatory

Location Property LC165BuriedTempleSpaceLocation Auto Const Mandatory

Location Property LC165BuriedTempleLocation Auto Const Mandatory

Quest Property MQ302b Auto Const Mandatory

GlobalVariable Property MQ302_SidedWithChoice Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth10 Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth09 Auto Const Mandatory

Key Property MQ301NasaKey Auto Const Mandatory

Key Property MQ301PrototypeKey Auto Const Mandatory

ReferenceAlias Property Alias_ReleaseArtifactSwitch Auto Const Mandatory

Quest Property MQ_TutorialQuest Auto Const Mandatory

RefCollectionAlias Property Alias_StarbornAttackers Auto Const Mandatory

ReferenceAlias Property Alias_Emissary Auto Const Mandatory

ObjectReference Property MQ301EmissaryHunterMoveToMarker Auto Const Mandatory

ReferenceAlias Property Alias_Hunter Auto Const Mandatory

ReferenceAlias Property Alias_GravDriveActivator Auto Const Mandatory

ReferenceAlias Property Alias_GravDriveDoor Auto Const Mandatory

ReferenceAlias Property Alias_GravDriveAnimHelper Auto Const Mandatory

ReferenceAlias Property Alias_MoonMapMarker Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

ReferenceAlias Property Alias_GravDriveSoundMarker Auto Const Mandatory

RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const

WwiseEvent Property WwiseEvent_ShakeController_p75_p75_03 Auto Const Mandatory

WwiseEvent Property WwiseEvent_ShakeController_p5_p5_05 Auto Const Mandatory

WwiseEvent Property OE_EarthquakeSound Auto Const Mandatory
