;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NA_Botany03_MiscPoin_000980E8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE Botany03_WaitScript
Quest __temp = self as Quest
Botany03_WaitScript kmyQuest = __temp as Botany03_WaitScript
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

;Enable Tree Sound Marker
TreeSoundMarker.Enable()
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


ObjectReference Property TreeSoundMarker Auto Const
