;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ304_002514C1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Actor EmissaryREF = Alias_Emissary.GetActorRef()

;if the player surrendered the Artifact in MQ106, the Emissary has it
If MQ106_SurrenderedArtifact.GetValueInt() >= 1
  ObjectReference ArtifactREF06 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(7, MQ105ArtifactSpawnMarker)
  Alias_MQ105_ArtifactHolder.ForceRefTo(ArtifactREF06)
  ArtifactREF06.Enable()
  EmissaryREF.additem(ArtifactRef06)
Else
  SetStage(136)
EndIf

;add remaining Artifacts to Emissary
ObjectReference ArtifactREF01 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(19, MQ304ArtifactSpawnMarker01)
Alias_Artifact01.ForceRefTo(ArtifactREF01)
ArtifactREF01.Enable()
EmissaryREF.additem(ArtifactRef01)

ObjectReference ArtifactREF02 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(20, MQ304ArtifactSpawnMarker02)
Alias_Artifact02.ForceRefTo(ArtifactREF02)
ArtifactREF02.Enable()
EmissaryREF.additem(ArtifactRef02)

ObjectReference ArtifactREF03 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(21, MQ304ArtifactSpawnMarker03)
Alias_Artifact03.ForceRefTo(ArtifactREF03)
ArtifactREF03.Enable()
EmissaryREF.additem(ArtifactRef03)

ObjectReference ArtifactREF04 = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(22, MQ304ArtifactSpawnMarker04)
Alias_Artifact04.ForceRefTo(ArtifactREF04)
ArtifactREF04.Enable()
EmissaryREF.additem(ArtifactRef04)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0131_Item_00
Function Fragment_Stage_0131_Item_00()
;BEGIN CODE
;check if you have all of them
If GetStageDone(132) && GetStageDone(133) && GetStageDone(134) && GetStageDone(136)
  SetStage(200)
EndIf

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_00
Function Fragment_Stage_0132_Item_00()
;BEGIN CODE
;check if you have all of them
If GetStageDone(131) && GetStageDone(133) && GetStageDone(134) && GetStageDone(136)
  SetStage(200)
EndIf

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0133_Item_00
Function Fragment_Stage_0133_Item_00()
;BEGIN CODE
;check if you have all of them
If GetStageDone(131) && GetStageDone(132) && GetStageDone(134) && GetStageDone(136)
  SetStage(200)
EndIf

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(21)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0134_Item_00
Function Fragment_Stage_0134_Item_00()
;BEGIN CODE
;check if you have all of them
If GetStageDone(131) && GetStageDone(132) && GetStageDone(133) && GetStageDone(136)
  SetStage(200)
EndIf

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(22)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0136_Item_00
Function Fragment_Stage_0136_Item_00()
;BEGIN CODE
;check if you have all of them
If GetStageDone(131) && GetStageDone(132) && GetStageDone(133) && GetStageDone(134)
  SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0137_Item_00
Function Fragment_Stage_0137_Item_00()
;BEGIN CODE
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
PlayerREF.Additem(Alias_Artifact01.GetRef())
PlayerREF.Additem(Alias_Artifact02.GetRef())
PlayerREF.Additem(Alias_Artifact03.GetRef())
PlayerREF.Additem(Alias_Artifact04.GetRef())
If MQ106_SurrenderedArtifact.GetValueInt() >= 1
  PlayerREF.AddItem(Alias_MQ105_ArtifactHolder.GetRef())
EndIf
;if player has all Artifacts from Hunter/Emissary, advance main quest
MQ302b.SetObjectiveCompleted(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor EmissaryREF = Alias_Emissary.GetActorRef()

;if player has all Artifacts from Hunter/Emissary, advance main quest
MQ302b.SetObjectiveCompleted(240) 

If MQ303.GetStageDone(200)
  MQ302b.SetStage(1280)
EndIf

;if Emissary is dead, check if the player has the legendary gun
If EmissaryREF.IsDead()
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
Actor EmissaryREF = Alias_Emissary.GetActorRef()

;Emissary death FX
EmissaryREF.BlockActivation(True, True)
AbStarbornDeath.Cast(EmissaryREF, EmissaryREF)

FortifyQuantumEssenceSpell.Cast(EmissaryREF, Game.GetPlayer())
QuantumEssenceAddMSG.Show()

Utility.Wait(5.0)
EmissaryREF.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Artifact01 Auto Const Mandatory

ReferenceAlias Property Alias_Artifact02 Auto Const Mandatory

ReferenceAlias Property Alias_Artifact03 Auto Const Mandatory

ReferenceAlias Property Alias_Artifact04 Auto Const Mandatory

ReferenceAlias Property Alias_Emissary Auto Const Mandatory

ReferenceAlias Property Alias_Hunter Auto Const Mandatory

GlobalVariable Property MQ106_SurrenderedArtifact Auto Const Mandatory

ReferenceAlias Property Alias_MQ105_ArtifactHolder Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

ObjectReference Property MQ304ArtifactSpawnMarker01 Auto Const Mandatory

ObjectReference Property MQ304ArtifactSpawnMarker02 Auto Const Mandatory

ObjectReference Property MQ304ArtifactSpawnMarker03 Auto Const Mandatory

ObjectReference Property MQ304ArtifactSpawnMarker04 Auto Const Mandatory

ObjectReference Property MQ304ArtifactSpawnMarker05 Auto Const Mandatory

ObjectReference Property MQ105ArtifactSpawnMarker Auto Const Mandatory

Quest Property MQ303 Auto Const Mandatory

Quest Property MQ302b Auto Const Mandatory

Weapon Property InflictorRifle Auto Const Mandatory

Spell Property AbStarbornDeath Auto Const Mandatory

Spell Property FortifyQuantumEssenceSpell Auto Const Mandatory

Message Property QuantumEssenceAddMSG Auto Const Mandatory

Ammo Property AmmoParticleFuseHeavy Auto Const Mandatory

Weapon Property FragGrenade Auto Const Mandatory
