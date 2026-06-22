;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_MP_Creatures06_00067FBC Extends Quest Hidden Const

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
Actor Attacker = Alias_Attacker.GetActorRef()

Attacker.Enable()
Attacker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
If GetStageDone(500)
   Alias_Nest.GetRef().AddItem(StandardLoot)
Else
   If Utility.RandomInt(1,2) == 1
      Alias_Nest.GetRef().AddItem(BonusLoot)
   Else
      Alias_Nest.GetRef().AddItem(Creature_Egg)
   EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;SetObjectiveCompleted(500)
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

ReferenceAlias Property Alias_Nest Auto Const Mandatory

LeveledItem Property BonusLoot Auto Const Mandatory

LeveledItem Property StandardLoot Auto Const Mandatory

ReferenceAlias Property Alias_Attacker Auto Const Mandatory

MiscObject Property Creature_Egg Auto Const Mandatory
