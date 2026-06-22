;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ401d_0017B94D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MQ401VariantQuestScript
Quest __temp = self as Quest
MQ401VariantQuestScript kmyQuest = __temp as MQ401VariantQuestScript
;END AUTOCAST
;BEGIN CODE
Actor AndrejaREF = Alias_Andreja.GetActorRef()

SetObjectiveDisplayed(10)

MQ401_SkipMQ.SetValueInt(1)

(MQ401 as MQ401QuestScript).CleanUpNormalMainQuest()

kmyquest.EnableQuestActors()

;make sure MQ402 is running
If MQ402.IsRunning() == False
  MQ402.Start()
EndIf

;Andreja has the Artifacts and is kill-able
(MQ402 as MQ402Script).AddLodgeArtifacts(AndrejaREF)
(AndrejaREF.GetBaseObject() as ActorBase).SetEssential(False)

Alias_Armillary.GetRef().DisableNoWait()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)

MQ401c_001_IntroScene.Start()

Actor PlayerRef = Game.GetPlayer()
if PlayerRef.HasPerk(Trait_KidStuff)
  TraitKidStuff.SetStageNoWait(25)
endif

; If the player has the Starter Home trait, queue up the quest
If PlayerRef.HasPerk(Trait_StarterHome)
  TraitStarterHome.SetStageNoWait(100)
Else
  TraitStarterHome.Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

Actor PlayerREF = Game.GetPlayer()
Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor Zealot01REF = Alias_Zealot01.GetActorRef()
Actor Zealot02REF = Alias_Zealot02.GetActorRef()
Actor Zealot03REF = Alias_Zealot03.GetActorRef()
Actor Zealot04REF = Alias_Zealot04.GetActorRef()

AndrejaREF.AddtoFaction(PlayerEnemyFaction)
AndrejaREF.SetValue(Aggression, 1)
AndrejaREF.StartCombat(PlayerREF)

Zealot01REF.AddtoFaction(PlayerEnemyFaction)
Zealot01REF.SetValue(Aggression, 1)
Zealot01REF.StartCombat(PlayerREF)

Zealot02REF.AddtoFaction(PlayerEnemyFaction)
Zealot02REF.SetValue(Aggression, 1)
Zealot02REF.StartCombat(PlayerREF)

Zealot03REF.AddtoFaction(PlayerEnemyFaction)
Zealot03REF.SetValue(Aggression, 1)
Zealot03REF.StartCombat(PlayerREF)

Zealot04REF.AddtoFaction(PlayerEnemyFaction)
Zealot04REF.SetValue(Aggression, 1)
Zealot04REF.StartCombat(PlayerREF)

;make sure player can access the second floor if combat goes there
If PlayerREF.GetItemCount(LodgeKey) == 0
  PlayerREF.additem(LodgeKey, absilent=true)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
setstage(110)

If GetStageDone(130) && GetStageDone(140) && GetStageDone(150) && GetStageDone(160)
  SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
setstage(110)

If GetStageDone(120) && GetStageDone(140) && GetStageDone(150) && GetStageDone(160)
  SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
setstage(110)

If GetStageDone(130) && GetStageDone(120) && GetStageDone(150) && GetStageDone(160)
  SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
setstage(110)

If GetStageDone(130) && GetStageDone(140) && GetStageDone(120) && GetStageDone(160)
  SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
setstage(110)

If GetStageDone(130) && GetStageDone(140) && GetStageDone(150) && GetStageDone(120)
  SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
MQ402.SetStage(100)

If GetStageDone(220) && GetStageDone(230) && GetStageDone(240) && GetStageDone(250) && GetStageDone(260) && GetStageDone(270) && GetStageDone(280) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
If GetStageDone(210) && GetStageDone(230) && GetStageDone(240) && GetStageDone(250) && GetStageDone(260) && GetStageDone(270) && GetStageDone(280) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
If GetStageDone(210) && GetStageDone(220) && GetStageDone(240) && GetStageDone(250) && GetStageDone(260) && GetStageDone(270) && GetStageDone(280) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
If GetStageDone(210) && GetStageDone(220) && GetStageDone(230) && GetStageDone(250) && GetStageDone(260) && GetStageDone(270) && GetStageDone(280) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
If GetStageDone(210) && GetStageDone(220) && GetStageDone(230) && GetStageDone(240) && GetStageDone(260) && GetStageDone(270) && GetStageDone(280) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
If GetStageDone(210) && GetStageDone(220) && GetStageDone(230) && GetStageDone(240) && GetStageDone(250) && GetStageDone(270) && GetStageDone(280) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
If GetStageDone(210) && GetStageDone(220) && GetStageDone(230) && GetStageDone(240) && GetStageDone(250) && GetStageDone(260) && GetStageDone(280) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
If GetStageDone(220) && GetStageDone(230) && GetStageDone(240) && GetStageDone(250) && GetStageDone(260) && GetStageDone(270) && GetStageDone(210) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
If GetStageDone(220) && GetStageDone(230) && GetStageDone(240) && GetStageDone(250) && GetStageDone(260) && GetStageDone(270) && GetStageDone(210) && GetStageDone(280)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
PlayerREF.AddItem(Alias_ArtifaceDataSlate.GetRef())
PlayerREF.AddItem(Alias_LodgeArtifact01.GetRef())
PlayerREF.AddItem(Alias_LodgeArtifact02.GetRef())
PlayerREF.AddItem(Alias_LodgeArtifact03.GetRef())
PlayerREF.AddItem(Alias_LodgeArtifact04.GetRef())
PlayerREF.AddItem(Alias_LodgeArtifact05.GetRef())
PlayerREF.AddItem(Alias_LodgeArtifact06.GetRef())
PlayerREF.AddItem(Alias_LodgeArtifact07.GetRef())
PlayerREF.AddItem(Alias_LodgeArtifact08.GetRef())

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

PlayerREF.AddtoFaction(ConstellationFaction)
If PlayerREF.GetItemCount(LodgeKey) == 0
  PlayerREF.additem(LodgeKey, absilent=true)
EndIf
PlayerREF.AddtoFaction(EyeBoardingFaction)

CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property ConstellationFaction Auto Const Mandatory

Key Property LodgeKey Auto Const Mandatory

Quest Property MQ402 Auto Const Mandatory

Quest Property MQ401 Auto Const Mandatory

Scene Property MQ401c_001_IntroScene Auto Const Mandatory

GlobalVariable Property MQ401_SkipMQ Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact01 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact02 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifaceDataSlate Auto Const Mandatory

ReferenceAlias Property Alias_Zealot02 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact03 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact04 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact05 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact06 Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Zealot01 Auto Const Mandatory

ReferenceAlias Property Alias_Zealot03 Auto Const Mandatory

ReferenceAlias Property Alias_Zealot04 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact07 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact08 Auto Const Mandatory

ReferenceAlias Property Alias_Armillary Auto Const Mandatory

Perk Property Trait_KidStuff Auto Const Mandatory

Perk Property Trait_StarterHome Auto Const Mandatory

Quest Property TraitKidStuff Auto Const Mandatory

Quest Property TraitStarterHome Auto Const Mandatory
