;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ303_00254243 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Actor HunterREF = Alias_Hunter.GetActorRef()

;put all the Artifacts on the Hunter
ObjectReference ArtifactREF01 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(14, MQ303ArtifactSpawnMarker01)
Alias_HunterArtifact01.ForceRefTo(ArtifactREF01)
ArtifactREF01.Enable()
HunterREF.additem(ArtifactRef01)

ObjectReference ArtifactREF02 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(15, MQ303ArtifactSpawnMarker02)
Alias_HunterArtifact02.ForceRefTo(ArtifactREF02)
ArtifactREF02.Enable()
HunterREF.additem(ArtifactRef02)

ObjectReference ArtifactREF03 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(16, MQ303ArtifactSpawnMarker03)
Alias_HunterArtifact03.ForceRefTo(ArtifactREF03)
ArtifactREF03.Enable()
HunterREF.additem(ArtifactRef03)

ObjectReference ArtifactREF04 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(17, MQ303ArtifactSpawnMarker04)
Alias_HunterArtifact04.ForceRefTo(ArtifactREF04)
ArtifactREF04.Enable()
HunterREF.additem(ArtifactRef04)

ObjectReference ArtifactREF05 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(18, MQ303ArtifactSpawnMarker05)
Alias_HunterArtifact05.ForceRefTo(ArtifactREF05)
ArtifactREF05.Enable()
HunterREF.additem(ArtifactRef05)

;if the Hunter destroyed the scow in MQ404, he has that Artifact
If MQ404.GetStageDone(200)
  ObjectReference ArtifactREF10 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(10, MQ202ArtifactSpawnMarker)
  MQ202ArtifactHolder.ForceRefTo(ArtifactREF10)
  ArtifactREF10.Enable()
  HunterREF.additem(ArtifactRef10)
Else
  SetStage(136)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
PlayerREF.Additem(Alias_HunterArtifact01.GetRef())
PlayerREF.Additem(Alias_HunterArtifact02.GetRef())
PlayerREF.Additem(Alias_HunterArtifact03.GetRef())
PlayerREF.Additem(Alias_HunterArtifact04.GetRef())
PlayerREF.Additem(Alias_HunterArtifact05.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0131_Item_00
Function Fragment_Stage_0131_Item_00()
;BEGIN CODE
;check if you have all of them
If GetStageDone(132) && GetStageDone(133) && GetStageDone(134) && GetStageDone(135) && GetStageDone(136)
  SetStage(200)
EndIf

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(14)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_00
Function Fragment_Stage_0132_Item_00()
;BEGIN CODE
;check if you have all of them
If GetStageDone(131) && GetStageDone(133) && GetStageDone(134) && GetStageDone(135) && GetStageDone(136)
  SetStage(200)
EndIf

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0133_Item_00
Function Fragment_Stage_0133_Item_00()
;BEGIN CODE
;check if you have all of them
If GetStageDone(131) && GetStageDone(132) && GetStageDone(134) && GetStageDone(135) && GetStageDone(136)
  SetStage(200)
EndIf

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(16)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0134_Item_00
Function Fragment_Stage_0134_Item_00()
;BEGIN CODE
;check if you have all of them
If GetStageDone(131) && GetStageDone(132) && GetStageDone(133) && GetStageDone(135) && GetStageDone(136)
  SetStage(200)
EndIf

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
;check if you have all of them
If GetStageDone(131) && GetStageDone(132) && GetStageDone(133) && GetStageDone(134) && GetStageDone(136)
  SetStage(200)
EndIf

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(18)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0136_Item_00
Function Fragment_Stage_0136_Item_00()
;BEGIN CODE
;check if you have all of them
If GetStageDone(131) && GetStageDone(132) && GetStageDone(133) && GetStageDone(134) && GetStageDone(135)
  SetStage(200)
EndIf

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0137_Item_00
Function Fragment_Stage_0137_Item_00()
;BEGIN CODE
;advance quest if player also has the Artifacts
If GetStageDone(200)
  SetStage(210)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
PlayerREF.Additem(Alias_HunterArtifact01.GetRef())
PlayerREF.Additem(Alias_HunterArtifact02.GetRef())
PlayerREF.Additem(Alias_HunterArtifact03.GetRef())
PlayerREF.Additem(Alias_HunterArtifact04.GetRef())
PlayerREF.Additem(Alias_HunterArtifact05.GetRef())
If MQ404.GetStageDone(200)
  PlayerREF.AddItem(MQ202ArtifactHolder.GetRef())
EndIf
;if player has all Artifacts from Hunter/Emissary, advance main quest
MQ302b.SetObjectiveCompleted(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor HunterREF = Alias_Hunter.GetActorRef()

;if player has all Artifacts from Hunter/Emissary, advance main quest
MQ302b.SetObjectiveCompleted(230)

If MQ304.GetStageDone(200)
  MQ302b.SetStage(1280)
EndIf

If HunterREF.IsDead()
  ;wait to stop until the player also has the gun
  If GetStageDone(137)
    SetStage(210)
  EndIf
Else
  Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Actor HunterREF = Alias_Hunter.GetActorRef()

HunterREF.BlockActivation(True, True)
AbStarbornDeath.Cast(HunterREF, HunterREF)

;increment quantum essence
FortifyQuantumEssenceSpell.Cast(HunterREF, Game.GetPlayer())
QuantumEssenceAddMSG.Show()

Utility.Wait(5.0)
HunterREF.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_HunterArtifact01 Auto Const Mandatory

ReferenceAlias Property Alias_HunterArtifact02 Auto Const Mandatory

ReferenceAlias Property Alias_HunterArtifact03 Auto Const Mandatory

ReferenceAlias Property Alias_HunterArtifact04 Auto Const Mandatory

ReferenceAlias Property Alias_HunterArtifact05 Auto Const Mandatory

ReferenceAlias Property Alias_Hunter Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

ObjectReference Property MQ303ArtifactSpawnMarker01 Auto Const Mandatory

ObjectReference Property MQ303ArtifactSpawnMarker02 Auto Const Mandatory

ObjectReference Property MQ303ArtifactSpawnMarker03 Auto Const Mandatory

ObjectReference Property MQ303ArtifactSpawnMarker04 Auto Const Mandatory

ObjectReference Property MQ303ArtifactSpawnMarker05 Auto Const Mandatory

Quest Property MQ303 Auto Const Mandatory

Quest Property MQ302b Auto Const Mandatory

Quest Property MQ304 Auto Const Mandatory

ObjectReference Property MQ202ArtifactSpawnMarker Auto Const Mandatory

ReferenceAlias Property MQ202ArtifactHolder Auto Const

Quest Property MQ404 Auto Const Mandatory

Spell Property AbStarbornDeath Auto Const Mandatory

LeveledItem Property LL_Weapon_Reward_MQ302B_Hunter Auto Const Mandatory

Weapon Property Rocketlauncher Auto Const Mandatory

Message Property QuantumEssenceAddMSG Auto Const Mandatory

Spell Property FortifyQuantumEssenceSpell Auto Const Mandatory

Ammo Property Ammo20mmXPL Auto Const Mandatory
