;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_MP_Creatures07_00067FAB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Defenders.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Attacker.GetActorRef().Enable()
Alias_Attacker.GetActorRef().EvaluatePackage()
Alias_Defenders.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_Defenders.EvaluateAll()

If !GetStageDone(500)
   SetStage(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
If Utility.RandomInt(1,2) == 1
   Alias_Nest.GetRef().AddItem(BonusLoot)
Else
   Alias_Nest.GetRef().AddItem(Creature_Egg)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
If !GetStageDone(200)
   SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
Alias_Attacker.GetActorRef().EvaluatePackage()
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

LeveledItem Property StandardLoot Auto Const Mandatory

LeveledItem Property BonusLoot Auto Const Mandatory

ReferenceAlias Property Alias_Nest Auto Const Mandatory

Keyword Property FleePackageActivated Auto Const Mandatory

ReferenceAlias Property Alias_Attacker Auto Const Mandatory

RefCollectionAlias Property Alias_Defenders Auto Const Mandatory

MiscObject Property Creature_Egg Auto Const Mandatory
