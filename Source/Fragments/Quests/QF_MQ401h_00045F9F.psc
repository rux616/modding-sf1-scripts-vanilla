;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ401h_00045F9F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor AndrejaREF = Alias_OtherPlayer.GetActorRef()

SetObjectiveDisplayed(10)

MQ401_SkipMQ.SetValueInt(1)

(MQ401 as MQ401QuestScript).CleanUpNormalMainQuest()

;make sure MQ402 is running
If MQ402.IsRunning() == False
  MQ402.Start()
EndIf

;Andreja has the Artifacts and is kill-able
(MQ402 as MQ402Script).AddLodgeArtifacts(AndrejaREF)
(AndrejaREF.GetBaseObject() as ActorBase).SetEssential(False)

;swap clutter state in Lodge to post-attack
MQ204LodgeAttackClutterEnableMarker.Enable()

Alias_Armillary.GetRef().DisableNoWait()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

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

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef()

OtherPlayerREF.Enable()

Actor SarahREF = Alias_Andreja.GetActorRef()
QST_MQ401_Magshear_SingleShot.Play(Game.GetPlayer())
SarahREF.KillEssential()

MQ401H_002_OutroScene.Start()

SetObjectiveCompleted(20)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

Actor PlayerREF = Game.GetPlayer()
Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef()

OtherPlayerREF.AddtoFaction(PlayerEnemyFaction)
OtherPlayerREF.SetValue(Aggression, 1)
OtherPlayerREF.StartCombat(PlayerREF)

;make sure player can access the second floor if combat goes there
If PlayerREF.GetItemCount(LodgeKey) == 0
  PlayerREF.additem(LodgeKey, absilent=true)
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
If GetStageDone(220) && GetStageDone(210) && GetStageDone(240) && GetStageDone(250) && GetStageDone(260) && GetStageDone(270) && GetStageDone(280) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
If GetStageDone(220) && GetStageDone(230) && GetStageDone(210) && GetStageDone(250) && GetStageDone(260) && GetStageDone(270) && GetStageDone(280) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
If GetStageDone(220) && GetStageDone(230) && GetStageDone(240) && GetStageDone(210) && GetStageDone(260) && GetStageDone(270) && GetStageDone(280) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
If GetStageDone(220) && GetStageDone(230) && GetStageDone(240) && GetStageDone(250) && GetStageDone(210) && GetStageDone(270) && GetStageDone(280) && GetStageDone(290)
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
If GetStageDone(220) && GetStageDone(230) && GetStageDone(240) && GetStageDone(250) && GetStageDone(260) && GetStageDone(210) && GetStageDone(280) && GetStageDone(290)
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
If GetStageDone(220) && GetStageDone(230) && GetStageDone(240) && GetStageDone(250) && GetStageDone(260) && GetStageDone(270) && GetStageDone(280) && GetStageDone(210)
  SetStage(1000)
EndIf
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

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef()

OtherPlayerREF.BlockActivation(True, True)
ffStarbornDeath.Cast(OtherPlayerREF, OtherPlayerREF)

;increment quantum essence
FortifyQuantumEssenceSpell.Cast(OtherPlayerREF, Game.GetPlayer())
QuantumEssenceAddMSG.Show()

Utility.Wait(5.0)
OtherPlayerREF.Disable()
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

ReferenceAlias Property Alias_LodgeArtifact03 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact04 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact05 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact06 Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_OtherPlayer Auto Const Mandatory

Scene Property MQ401H_002_OutroScene Auto Const Mandatory

ObjectReference Property MQ204LodgeAttackClutterEnableMarker Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

Spell Property ffStarbornDeath Auto Const Mandatory

Spell Property FortifyQuantumEssenceSpell Auto Const Mandatory

Message Property QuantumEssenceAddMSG Auto Const Mandatory

WwiseEvent Property QST_MQ401_Magshear_SingleShot Auto Const Mandatory

ReferenceAlias Property Alias_Armillary Auto Const Mandatory

Perk Property Trait_KidStuff Auto Const Mandatory

Perk Property Trait_StarterHome Auto Const Mandatory

Quest Property TraitKidStuff Auto Const Mandatory

Quest Property TraitStarterHome Auto Const Mandatory
