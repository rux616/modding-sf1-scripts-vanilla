;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_AustinF_DeadManBox02_000626FF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_RewardContainer.Getref().Lock()
Alias_RewardContainer.Getref().SetLockLevel(255)

Alias_Corpse.GetRef().AddItem(Alias_KeyObject.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor Creature = NONE

If Alias_BiomePredator
   Creature = Alias_BiomePredator.GetActorRef()

   Creature.Enable()
   Creature.EvaluatePackage()
EndIf
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

ReferenceAlias Property Alias_RewardContainer Auto Const Mandatory

ReferenceAlias Property Alias_KeyObject Auto Const Mandatory

ReferenceAlias Property Alias_Corpse Auto Const Mandatory


ReferenceAlias Property Alias_BiomePredator Auto Const Mandatory
