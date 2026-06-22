;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ401i_00029DA1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

MQ401_SkipMQ.SetValueInt(1)

(MQ401 as MQ401QuestScript).CleanUpNormalMainQuest()

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

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

MQ401i_002_OutroScene.Start()

PlayerREF.AddtoFaction(ConstellationFaction)
PlayerREF.additem(LodgeKey)
PlayerREF.additem(MQ401I_ArtifactLocations)
PlayerREF.AddtoFaction(EyeBoardingFaction)

Alias_Child_SarahMorgan.GetActorRef().EvaluatePackage()
Alias_Child_SamCoe.GetActorRef().EvaluatePackage()
Alias_Child_Noel.GetActorRef().EvaluatePackage()
Alias_Child_Barrett.GetActorRef().EvaluatePackage()

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

Book Property MQ401I_ArtifactLocations Auto Const Mandatory

Scene Property MQ401i_002_OutroScene Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

ReferenceAlias Property Alias_Child_SarahMorgan Auto Const Mandatory

ReferenceAlias Property Alias_Child_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_Child_Noel Auto Const Mandatory

ReferenceAlias Property Alias_Child_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_Armillary Auto Const Mandatory

Perk Property Trait_KidStuff Auto Const Mandatory

Perk Property Trait_StarterHome Auto Const Mandatory

Quest Property TraitKidStuff Auto Const Mandatory

Quest Property TraitStarterHome Auto Const Mandatory
