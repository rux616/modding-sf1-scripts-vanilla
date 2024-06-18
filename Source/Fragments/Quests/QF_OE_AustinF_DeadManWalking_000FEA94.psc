;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_AustinF_DeadManWalking_000FEA94 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
ObjectReference predator = NONE
ObjectReference marker = Alias_SpawnMarker.GetRef()
int count = Alias_Predators.GetCount()
int index = 0

While index < count
   predator = Alias_Predators.GetAt(index)
   predator.MoveTo(marker)
   index += 1
EndWhile

Alias_Predators.DisableAll()
Alias_Creatures.KillAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
If Game.GetPlayer().GetItemCount(MedPack) >= 1
    Game.GetPlayer().RemoveItem(MedPack, 1)
    SetStage(275)
Else
    SetStage(300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
Scene_Healed.Start()
ENV_AFFL_Infection_LungInfection.Cure()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
Actor Colonist = Alias_Colonist.GetActorRef()

Colonist.SetProtected(False)
Colonist.Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
ENV_AFFL_Infection_LungInfection.Gain()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Player didn't heal the colonist
If !GetStageDone(275)
   SetStage(300)
EndIf

;Spawn enemies 
SetStage(700)

;Player agreed to help but didn't. fail quest.
If GetStageDone(250) || GetStageDone(200) 
   SetStage(985)
Else
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Alias_Predators.EnableAll()
Alias_Predators.EvaluateAll()

If !GetStageDone(600)
   Alias_colonist.GetActorRef().SetProtected(False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0985_Item_00
Function Fragment_Stage_0985_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
SetStage(995)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0995_Item_00
Function Fragment_Stage_0995_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property Alias_Colonist Auto Const Mandatory

ReferenceAlias Property Alias_WoundedMarker Auto Const Mandatory

Scene Property Scene_Healed Auto Const Mandatory

Potion Property MedPack Auto Const Mandatory

RefCollectionAlias Property Alias_predators Auto Const Mandatory

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

env_afflictionscript Property ENV_AFFL_Infection_LungInfection Auto Const Mandatory

ReferenceAlias Property Alias_spawnMarker Auto Const Mandatory

RefCollectionAlias Property Alias_Creatures Auto Const Mandatory
