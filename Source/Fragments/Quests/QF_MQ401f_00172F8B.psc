;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ401f_00172F8B Extends Quest Hidden Const

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

Alias_Andreja.GetActorRef().AddSpell(MQ204HunterInvisibility)

Alias_Armillary.GetRef().DisableNoWait()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Actor HunterREF = Alias_Andreja.GetActorRef()

HunterREF.RemoveSpell(MQ204HunterInvisibility)

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

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Game.StopDialogueCamera()
MQ401c_001_IntroScene.Stop()

Actor PlayerREF = Game.GetPlayer()
Actor HunterREF = Alias_Andreja.GetActorRef()
HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)

;move to holding cell
HunterREF.Moveto(MQHoldingCellCenterMarker)
HunterREF.DisableNoWait()

PlayerREF.AddtoFaction(ConstellationFaction)
PlayerREF.additem(LodgeKey)
PlayerREF.AddtoFaction(EyeBoardingFaction)

CompleteAllObjectives()
MQ402.SetStage(100)
MQ402.SetStage(510) ;hand over Lodge Artifacts
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

MiscObject Property Credits Auto Const Mandatory

Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const Mandatory

ObjectReference Property MQHoldingCellCenterMarker Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

Spell Property ffStarbornTeleport Auto Const Mandatory

Spell Property MQ204HunterInvisibility Auto Const Mandatory

ReferenceAlias Property Alias_Armillary Auto Const Mandatory

Perk Property Trait_KidStuff Auto Const Mandatory

Perk Property Trait_StarterHome Auto Const Mandatory

Quest Property TraitKidStuff Auto Const Mandatory

Quest Property TraitStarterHome Auto Const Mandatory
