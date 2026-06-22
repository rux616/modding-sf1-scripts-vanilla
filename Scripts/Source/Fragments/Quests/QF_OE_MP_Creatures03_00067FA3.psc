;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_MP_Creatures03_00067FA3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Actor Ambusher = Alias_Ambusher.GetActorRef()

Ambusher.Enable()
Ambusher.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetStage(150)
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

Keyword Property OE_PlayerInRange_Keyword Auto Const Mandatory

ReferenceAlias Property Alias_Nest Auto Const Mandatory
ReferenceAlias Property Alias_Ambusher Auto Const Mandatory

LeveledItem Property CommonLoot Auto Const Mandatory
LeveledItem Property UncommonLoot Auto Const Mandatory
LeveledItem Property RareLoot Auto Const Mandatory
