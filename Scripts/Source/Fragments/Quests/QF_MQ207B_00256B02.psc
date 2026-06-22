;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ207B_00256B02 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()

Alias_Vladimir.GetActorRef().moveto(MQ206C_Marker_Vladimir)
Alias_SarahMorgan.GetActorRef().moveto(MQ206C_Marker_SarahBarrett)

Int ButtonPressed = TestMQ206AMSG.Show()
If ButtonPressed == 0
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.getActorRef())
  Alias_SarahMorgan.getActorRef().disable()
  Alias_Barrett.GetActorRef().moveto(MQ206C_Marker_SarahBarrett)
ElseIf ButtonPressed == 1
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.getActorRef())
  Alias_SamCoe.getActorRef().disable()
ElseIf ButtonPressed == 2
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.getActorRef())
  Alias_Andreja.getActorRef().disable()
ElseIf ButtonPressed == 3
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.getActorRef())
  Alias_Barrett.getActorRef().disable()
EndIf

Game.GetPlayer().moveto(LodgeStartMarker)

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
;Set by: MQ207C quickstarts. Advance MQ207B into a usable state.
SetStage(10)
SetStage(15)
SetStage(20)
SetActive(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor VladimirREF = Alias_Vladimir.GetActorRef()
SetObjectiveDisplayed(5)

;Lodge is repaired if it hasn't been already
MQ204LodgeAttackClutterEnableMarker.Disable()

;move Vlad to his spot
VladimirREF.Disable()
VladimirREF.moveto(MQ206C_Marker_Vladimir)
VladimirREF.Enable()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN AUTOCAST TYPE MQCheckGravJumpQuestScript
Quest __temp = self as Quest
MQCheckGravJumpQuestScript kmyQuest = __temp as MQCheckGravJumpQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(11)

kmyquest.CheckSkillsMenu()

MQ_TutorialQuest.SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
SetObjectiveCompleted(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)

;Send Affinity Event
float currentGameTime = Utility.GetCurrentGameTime()
float cooldownTime = (currentGameTime + COM_WantsToTalk_CooldownDays.GetValue())
int i = 0
while i < Alias_Companions.Length
    Alias_Companions[i].GetActorRef().SetValue(COM_WantsToTalk_MQ207_Cooldown, cooldownTime) 
    i += 1
endwhile
COM_WantsToTalkEvent_MQ207.Send()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(12)
SetObjectiveDisplayed(30)

;if the player's ship grav jump range is too short, pop objective
If Alias_PlayerShip.GetShipReference().GetGravJumpRange() < 21
  Setstage(12)
EndIf

;Start MQ207C.
LC116NishinaResearchStationLocation.Reset()
LC116NishinaResearchStationResearchLevelLocation.Reset()
MQ207C.Start()

;enable the artifact rooms
Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait()
Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait()

;make sure we can see the map marker and land there
ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef()

MapMarker01REF.AddToMapScanned(True)
MapMarker01REF.SetMarkerVisibleOnStarMap()
MapMarker01REF.SetRequiresScanning(False)

;swap the Activators with the appropriate Artifacts
ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(11, Alias_Artifact01Activator.GetRef())
Alias_Artifact01Activator.ForceRefTo(ArtifactActivator01REF)
ArtifactActivator01REF.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
SetObjectiveCompleted(12)
SetObjectiveDisplayed(11, abDisplayed=False)
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
MUSGenesisStingerStarbornAppearB.add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)

;advance if the player has all
If (GetStageDone(40) == 1)
  SetStage(60)
EndIf

;give player the appropriate artifact
ObjectReference ArtifactREF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(11, MQ206CArtifactSpawnMarker01)
Alias_Artifact01QuestObject.ForceRefTo(ArtifactREF)
ArtifactREF.Enable()
Game.GetPlayer().additem(ArtifactREF)
MQ00_ArtifactsHolder.addref(ArtifactREF)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Display 'Listen to the distress signal'
SetObjectiveCompleted(30)
SetObjectiveDisplayed(35)
SetObjectiveDisplayed(11, abDisplayed=False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0038_Item_00
Function Fragment_Stage_0038_Item_00()
;BEGIN CODE
;Set by: MQ206D, stage 110. Player listened to distress signal.

;Complete 'Listen to the distress signal'
SetObjectiveCompleted(35)

;Display 'Complete 'Entangled''
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0039_Item_00
Function Fragment_Stage_0039_Item_00()
;BEGIN CODE
;Set by: MQ206D, stage 120. Player ignored distress signal.

;Hide 'Listen to the distress signal'
SetObjectiveDisplayed(35,False)

;Display 'Complete 'Entangled''
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set by: MQ206D, various stages. The player has taken the Artifact.

;Hide 'Complete 'Entangled''
SetObjectiveDisplayed(40,False)

;Complete 'Find the Artifact on Freya III'.
SetObjectiveCompleted(30)

;advance if the player has all
If (GetStageDone(30) == 1)
  SetStage(60)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;if we're waiting for the player to get all the Artifacts, then update
If MQ301.GetStageDone(900)
  MQ301.SetStage(1000)
EndIF

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ104 Auto Const Mandatory

Quest Property MQ103 Auto Const Mandatory

Quest Property FFLodge01 Auto Const Mandatory

Quest Property MQ105 Auto Const Mandatory

Scene Property MQ104_002_ReturnScene Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

ObjectReference Property MQ104AStart Auto Const Mandatory

Quest Property MQ104B Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

ActorValue Property MQ104A_CompanionPresentTemple Auto Const Mandatory

Scene Property MQ104A_008_TempleCompanionReaction Auto Const Mandatory

Scene Property MQ104A_009_TempleCompanionReaction Auto Const Mandatory

Scene Property MQ104A_010_TempleCompanionReaction Auto Const Mandatory

ObjectReference Property MQ106_VladimirMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_Vladimir Auto Const Mandatory

Scene Property MQ104A_012_PowerDemo Auto Const Mandatory

ObjectReference Property MQ104AStartTestCell Auto Const Mandatory

ObjectReference Property MQ104AVladTestMarker Auto Const Mandatory

ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_Artifact01QuestObject Auto Const Mandatory

ReferenceAlias Property Alias_Artifact02QuestObject Auto Const Mandatory

Quest Property MQ207C Auto Const Mandatory

ObjectReference Property LodgeStartMarker Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

ReferenceAlias Property MQ00_CompanionWhoDies Auto Const

Message Property TestMQ206AMSG Auto Const Mandatory

ObjectReference Property MQ206C_Marker_Vladimir Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker01 Auto Const Mandatory

Quest Property MQ305 Auto Const Mandatory

ObjectReference Property MQ206CArtifactSpawnMarker01 Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

ActorValue Property PlayerUnityTimesEntered Auto Const Mandatory

ObjectReference Property MQ206C_Marker_SarahBarrett Auto Const Mandatory

ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const Mandatory

ObjectReference Property MQ204LodgeAttackClutterEnableMarker Auto Const Mandatory

RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const

Quest Property MQ301 Auto Const Mandatory

ReferenceAlias Property Alias_Artifact01Activator Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_Starborn01 Auto Const Mandatory

MusicType Property MUSGenesisStingerStarbornAppearB Auto Const Mandatory

Location Property LC116NishinaResearchStationLocation Auto Const Mandatory

Location Property LC116NishinaResearchStationResearchLevelLocation Auto Const Mandatory

Quest Property MQ_TutorialQuest Auto Const Mandatory

AffinityEvent Property COM_WantsToTalkEvent_MQ207 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactRoomSpawnMarker01 Auto Const Mandatory

ReferenceAlias[] Property Alias_Companions Auto Const Mandatory

GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const Mandatory

ActorValue Property COM_WantsToTalk_MQ207_Cooldown Auto Const Mandatory
