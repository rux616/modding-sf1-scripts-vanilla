;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC09_PostQuest_NewAtlanti_001A2F82 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE uc09questscript
Quest __temp = self as Quest
uc09questscript kmyQuest = __temp as uc09questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.GetNPCsInPlace()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
UC09_PostQuest_110_ShipTechs_HeatleechScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property UC09_PostQuest_110_ShipTechs_HeatleechScene Auto Const Mandatory
