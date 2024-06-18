;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_ShaunD_Terrormorph_02_000FC918 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
OE_KreetTerrormorphDone.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_NPC_Group01.SetValue(Game.GetAggressionAV(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN AUTOCAST TYPE oescript
Quest __temp = self as Quest
oescript kmyQuest = __temp as oescript
;END AUTOCAST
;BEGIN CODE
;(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_NPC_Group01 Auto Const Mandatory

GlobalVariable Property OE_KreetTerrormorphDone Auto Const Mandatory
