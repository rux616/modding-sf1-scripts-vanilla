;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ104_000160A9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ102.SetStage(1150)
MQ101.SetStage(1810)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)

Game.GetPlayer().moveto(MQ104AStart)
Game.GetPlayer().addtoFaction(ConstellationFaction)
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor SarahMorganREF = Alias_TempSarahMorgan.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleActive(SarahMorganREF)
SarahMorganREF.EvaluatePackage()

;start up the temple quest
MQ_TempleQuest_MQ104A.SetStage(10)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)


Utility.Wait(0.50)

SetStage(30)
SetStage(40)
SetStage(300)
SetObjectiveCompleted(50)

Game.GetPlayer().addtoFaction(ConstellationFaction)
Game.GetPlayer().addtoFaction(EyeBoardingFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;player can now board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;player can now board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

;set player as having acquired the first three Artifacts
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(0)
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(1)
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(2)

;move Andreja
Actor AndrejaREF = Alias_Andreja.GetActorRef()
AndrejaREF.SetGhost()
AndrejaREF.moveto(Alias_AndrejaIntroMarker.GetRef())
Alias_MatteoKhatri.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(12)
SetObjectiveDisplayed(22)
SetObjectiveDisplayed(40)

;enable the artifact rooms
Alias_OpenCaveEnableMarker01.GetRef().EnableNoWait()
Alias_OpenCaveEnableMarker02.GetRef().EnableNoWait()
Alias_ClosedCaveEnableMarker01.GetRef().DisableNoWait()
Alias_ClosedCaveEnableMarker02.GetRef().DisableNoWait()

;disable the exterior actors in Andreja's cave
Alias_RadiantLocation02EnableMarker.GetRef().Disable()

;make sure we can see the map marker and land there
ObjectReference MapMarker01REF = Alias_MapMarker01.GetRef()
ObjectReference MapMarker02REF = Alias_MapMarker02.GetRef()

MapMarker01REF.AddtoMap(True)
MapMarker01REF.SetMarkerVisibleOnStarMap()
MapMarker01REF.SetRequiresScanning(False)
MapMarker02REF.AddtoMap(True)
MapMarker02REF.SetMarkerVisibleOnStarMap()
MapMarker02REF.SetRequiresScanning(False)

;swap the Activators with the appropriate Artifacts
ObjectReference ArtifactActivator01REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(5, Alias_Artifact01Activator.GetRef())
Alias_Artifact01Activator.ForceRefTo(ArtifactActivator01REF)
ArtifactActivator01REF.EnableNoWait()

ObjectReference ArtifactActivator02REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceEmbeddedArtifact(6, Alias_Artifact02Activator.GetRef())
Alias_Artifact02Activator.ForceRefTo(ArtifactActivator02REF)
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

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)

;advance if the player has all
If (GetStageDone(40) == 1) && (GetStageDone(50) == 1)
  SetStage(60)
EndIf

;give player the appropriate artifact
ObjectReference Artifact01REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(5, MQ104AArtifactSpawnMarker01)
Alias_Artifact01QuestObject.ForceRefTo(Artifact01REF)
Artifact01REF.Enable()
Game.GetPlayer().additem(Artifact01REF)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(5)
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

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;if player somehow skipped Andreja, make sure that it's set
;GEN-476246: Setting the proper stage on both this and Andreja's quests
COM_Companion_Andreja.SetStage(50)
SetStage(50)

SetObjectiveCompleted(30)

;Andreja Forcegreets
Actor AndrejaREF = Alias_Andreja.GetActorRef()
SetObjectiveDisplayed(45)
Game.GetPlayer().StopCombatAlarm()
AndrejaREF.moveto(Alias_AndrejaArtifactMarker.GetRef())
AndrejaREF.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
(SQ_Followers as SQ_FollowersScript).SetRoleInActive(AndrejaREF)
AndrejaREF.EvaluatePackage()

COM_Andreja_Story_IntroScene02.Start()

;advance if the player has all
If (GetStageDone(30) == 1) && (GetStageDone(50) == 1)
  SetStage(60)
EndIf

;give player the appropriate artifact
ObjectReference Artifact02REF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(6, MQ104AArtifactSpawnMarker02)
Alias_Artifact02QuestObject.ForceRefTo(Artifact02REF)
Artifact02REF.Enable()
Game.GetPlayer().additem(Artifact02REF)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Alias_VaruunZealot.GetActorRef().Kill()
Game.GetPlayer().StopCombatAlarm()
Alias_Andreja.GetActorRef().StopCombatAlarm()
COM_Andreja_Story_IntroScene01.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStage(20) ;make sure we advance just in case
SetStage(32)

;Andreja now follows you
Actor AndrejaREF = Alias_Andreja.GetActorRef()
AndrejaREF.AddKeyword(SQ_Followers_UseFollowPlayerCustom)
(SQ_Followers as SQ_FollowersScript).SetRoleActive(AndrejaREF)
AndrejaREF.EvaluatePackage()
AndrejaREF.SetGhost(False)

SetObjectiveCompleted(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

;make sure collection is enabled
ArmillaryMountSwapEnableMarker.DisableNoWait()

;get Matteo and Noel in position
Actor MatteoKhatriREF = Alias_MatteoKhatri.GetActorRef()
MatteoKhatriREF.Disable()
MatteoKhatriREF.EvaluatePackage()
MatteoKhatriREF.Enable()
Alias_Noel.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Actor AndrejaREF=Alias_Andreja.GetActorRef()

;move Andreja
AndrejaREF.Disable()
AndrejaREF.Moveto(MQ_LodgeEntranceMoveMarker)
AndrejaREF.EvaluatePackage()
AndrejaREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
MQ104A_002a_AndrejaScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;MQ104_002_ReturnScene.Start()
MQ104A_002b_ArtifactScene.Start()

SetObjectiveCompleted(50)
SetObjectiveDisplayed(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Actor AndrejaREF = Alias_Andreja.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(AndrejaREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SetStage(110)

;only make Andreja active if there is no locked in companion
If COM_PQ_LockedInCompanion.GetValueInt() > -1
  kmyquest.ShowHelpMessage("CompanionBlocked")
Else
  Actor AndrejaREF = Alias_Andreja.GetActorRef()
  (SQ_Companions as SQ_CompanionsScript).SetRoleActive(AndrejaREF)
  AndrejaREF.EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveCompleted(55)
SetObjectiveDisplayed(60)

;start up the temple quest
MQ_TempleQuest_MQ104A.SetStageNoWait(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE mq104ascript
Quest __temp = self as Quest
mq104ascript kmyQuest = __temp as mq104ascript
;END AUTOCAST
;BEGIN CODE
kmyquest.TempleArrived()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0402_Item_00
Function Fragment_Stage_0402_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
MQ104A_008b_TempleCompanionReaction.Start()

kmyquest.ShowHelpMessage("ZeroG")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
MQ104A_008_TempleCompanionReaction.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
MQ104A_009_TempleCompanionReaction.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
MQ104A_010_TempleCompanionReaction.Start()

SetObjectiveCompleted(70)
SetObjectiveCompleted(73)
SetObjectiveDisplayed(80)

;move Vladimir to the Lodge
Actor VladimirREF = Alias_Vladimir.GetActorRef()
VladimirREF.EvaluatePackage()
VladimirREF.moveto(MQ106_VladimirMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_01
Function Fragment_Stage_0600_Item_01()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
MQ_TutorialQuest.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_02
Function Fragment_Stage_0600_Item_02()
;BEGIN CODE
Alias_Companion.GetActorRef().SetValue(MQ104A_CompanionPresentTemple, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Alias_Vladimir.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0705_Item_00
Function Fragment_Stage_0705_Item_00()
;BEGIN CODE
Alias_Vladimir.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
MQ104_BlockStarbornPowerTopicDialogue.SetValue(1)
MQ104A_011b_PowerReaction.Start()

SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)

Alias_WalterStroud.GetActorRef().EvaluatePackage()
Alias_MatteoKhatri.GetActorRef().EvaluatePackage()

;failsafe add the power if player doesn't have it
Actor PlayerREF = Game.GetPlayer()
If PlayerREF.HasSpell(AntiGravityFieldSpell) == 0
  GrantSpellAntiGravityFieldSpell.Cast(PlayerREF, PlayerREF)
  MQ104APowerTutorialMSG.Show()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
MQ104_BlockStarbornPowerTopicDialogue.SetValue(0)

CompleteAllObjectives()

;start up another temple quest
MQ_TempleQuest_01.SetStageNoWait(10)

;check if MQ105 should start
If MQ103.GetStageDone(2000) && MQ104B.GetStageDone(1000)
  MQ105.SetStage(10)
EndIf

;Send Affinity Event
float currentGameTime = Utility.GetCurrentGameTime()
float cooldownTime = (currentGameTime + COM_WantsToTalk_CooldownDays.GetValue())
int i = 0
while i < Alias_Companions.Length
    Alias_Companions[i].GetActorRef().SetValue(COM_WantsToTalk_MQ104A_Cooldown, cooldownTime) 
    i += 1
endwhile
COM_WantsToTalkEvent_MQ104A.Send()

;Achievement Unlocked
Game.AddAchievement(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
MQ104_BlockStarbornPowerTopicDialogue.SetValue(0)

Alias_Vladimir.GetActorRef().MoveToMyEditorLocation()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Actor AndrejaREF = Alias_Andreja.GetActorRef()
AndrejaREF.SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_ArtifactCollection Auto Const Mandatory

Quest Property MQ104 Auto Const Mandatory

Quest Property MQ103 Auto Const Mandatory

Quest Property FFLodge01 Auto Const Mandatory

Quest Property MQ105 Auto Const Mandatory

Scene Property MQ104_002_ReturnScene Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

ObjectReference Property MQ104AStart Auto Const Mandatory

ReferenceAlias Property Alias_TEMPSarahMorgan Auto Const Mandatory

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

ReferenceAlias Property Alias_Noel Auto Const Mandatory

ReferenceAlias Property Alias_MatteoKhatri Auto Const Mandatory

ReferenceAlias Property Alias_OpenCaveEnableMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_ClosedCaveEnableMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_OpenCaveEnableMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_ClosedCaveEnableMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_Artifact01QuestObject Auto Const Mandatory

ReferenceAlias Property Alias_Artifact02QuestObject Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker02 Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

ReferenceAlias Property Alias_TempleMapMarker Auto Const Mandatory

ObjectReference Property MQ104AArtifactSpawnMarker01 Auto Const Mandatory

ObjectReference Property MQ104AArtifactSpawnMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_WalterStroud Auto Const Mandatory

ReferenceAlias Property Alias_AndrejaMarker Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

Message Property MQ104APowerTutorialMSG Auto Const Mandatory

Spell Property AntiGravityFieldSpell Auto Const Mandatory

Spell Property GrantSpellAntiGravityFieldSpell Auto Const Mandatory

Quest Property MQ_TempleQuest_MQ104A Auto Const Mandatory

ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const Mandatory

Quest Property MQ_TempleQuest_01 Auto Const Mandatory

GlobalVariable Property MQ_TurnOnTemples Auto Const Mandatory

Scene Property COM_Andreja_Story_IntroScene01 Auto Const Mandatory

Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory

ReferenceAlias Property Alias_AndrejaArtifactMarker Auto Const Mandatory

Scene Property COM_Andreja_Story_IntroScene02 Auto Const Mandatory

ObjectReference Property MQ_LodgeEntranceMoveMarker Auto Const Mandatory

Scene Property MQ104A_002a_AndrejaScene Auto Const Mandatory

Scene Property MQ104A_002b_ArtifactScene Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

ReferenceAlias Property Alias_Artifact01Activator Auto Const Mandatory

ReferenceAlias Property Alias_Artifact02Activator Auto Const Mandatory

ReferenceAlias Property Alias_AndrejaIntroMarker Auto Const Mandatory

ReferenceAlias Property Alias_VaruunZealot Auto Const Mandatory

ReferenceAlias Property Alias_RadiantLocation02EnableMarker Auto Const Mandatory

Spell Property ArtifactPowerAntiGravityField_Spell Auto Const Mandatory

Scene Property MQ104A_008b_TempleCompanionReaction Auto Const Mandatory

Faction Property ConstellationFaction Auto Const Mandatory

GlobalVariable Property COM_PQ_LockedInCompanion Auto Const Mandatory

Quest Property COM_Companion_Andreja Auto Const Mandatory

GlobalVariable Property MQ104_BlockStarbornPowerTopicDialogue Auto Const Mandatory

Quest Property MQ_TutorialQuest Auto Const Mandatory

AffinityEvent Property COM_WantsToTalkEvent_MQ104A Auto Const Mandatory

GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const Mandatory

ActorValue Property COM_WantsToTalk_MQ104A_Cooldown Auto Const Mandatory

ReferenceAlias[] Property Alias_Companions Auto Const Mandatory

Scene Property MQ104A_011b_PowerReaction Auto Const Mandatory
