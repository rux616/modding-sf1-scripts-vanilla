;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NA_Botany02_MiscPoin_000A3100 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE City_NA_Botany02Pointer_Wait
Quest __temp = self as Quest
City_NA_Botany02Pointer_Wait kmyQuest = __temp as City_NA_Botany02Pointer_Wait
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)

;Start timer to set stage in 24 hours
kmyQuest.Wait24()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;24 hours have passed, player can now speak to Kelton and begin quest
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;enable the tree sap
TreeSap_Enabler.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ObjectReference Property TreeSap_Enabler Auto Const
