;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_AF07_00134535 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE se_af07script
Quest __temp = self as Quest
se_af07script kmyQuest = __temp as se_af07script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)
kmyQuest.StartWaves()
Alias_TestBeacon.getref().BlockActivation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SE_AF07_001_SpawnScene Auto Const

ReferenceAlias Property Alias_TestBeacon Auto Const Mandatory
