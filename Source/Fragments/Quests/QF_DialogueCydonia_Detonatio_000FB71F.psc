;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueCydonia_Detonatio_000FB71F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE CYDetonationHelperQuestScript
Quest __temp = self as Quest
CYDetonationHelperQuestScript kmyQuest = __temp as CYDetonationHelperQuestScript
;END AUTOCAST
;BEGIN CODE
;kmyQuest.StartDetonationSequence()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Disable all the first time triggers. We no longer need them.
Alias_DetonationFirstTimeTriggers.DisableAll()
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

Keyword Property DialogueCydoniaDetonationQuestStartKeyword Auto Const Mandatory

GlobalVariable Property CY_DetonationCount Auto Const Mandatory

RefCollectionAlias Property Alias_DetonationFirstTimeTriggers Auto Const Mandatory
