;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ401j_00025233 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
ObjectReference PlantREF = Alias_Plant.GetRef()
SetObjectiveDisplayed(10)

MQ401_SkipMQ.SetValueInt(1)

(MQ401 as MQ401QuestScript).CleanUpNormalMainQuest()

PlantREF.Enable()
PlantREF.BlockActivation()

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
MQ401j_001_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Game.StopDialogueCamera()
MQ401j_001_IntroScene.Stop()
Alias_Plant.GetRef().BlockActivation(True, True)
Alias_Noel.GetActorRef().Enable()

Utility.Wait(1.0)

MQ401j_002_OutroScene.Start()

SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

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

Book Property MQ401I_ArtifactLocations Auto Const Mandatory

Scene Property MQ401i_002_OutroScene Auto Const Mandatory

Scene Property MQ401j_001_IntroScene Auto Const Mandatory

ReferenceAlias Property Alias_Noel Auto Const Mandatory

ReferenceAlias Property Alias_Plant Auto Const Mandatory

Scene Property MQ401j_002_OutroScene Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

ReferenceAlias Property Alias_Armillary Auto Const Mandatory

Perk Property Trait_KidStuff Auto Const Mandatory

Perk Property Trait_StarterHome Auto Const Mandatory

Quest Property TraitKidStuff Auto Const Mandatory

Quest Property TraitStarterHome Auto Const Mandatory
