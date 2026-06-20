;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_MS03_MiscObjective_020357F7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
