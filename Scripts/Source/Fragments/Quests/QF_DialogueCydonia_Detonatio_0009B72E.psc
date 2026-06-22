;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueCydonia_Detonatio_0009B72E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DialogueCydoniaDetonationQuestScript
Quest __temp = self as Quest
DialogueCydoniaDetonationQuestScript kmyQuest = __temp as DialogueCydoniaDetonationQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SelectCorrectDetonation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN AUTOCAST TYPE DialogueCydoniaDetonationQuestScript
Quest __temp = self as Quest
DialogueCydoniaDetonationQuestScript kmyQuest = __temp as DialogueCydoniaDetonationQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DelayQuestEndForLastCall()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN AUTOCAST TYPE DialogueCydoniaDetonationQuestScript
Quest __temp = self as Quest
DialogueCydoniaDetonationQuestScript kmyQuest = __temp as DialogueCydoniaDetonationQuestScript
;END AUTOCAST
;BEGIN CODE
If CY_DetonationCount.GetValue() < 1
	CY_DetonationCount.Mod(1)
EndIf

;Stop the Klaxon lights
kmyQuest.EndKlaxons()
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

GlobalVariable Property CY_DetonationCount Auto Const Mandatory
