;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS01SpaceEncounter01_001EF7EF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
; Pass the info to the main quest
MS01.SetStage(830)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
; Pass the info to the main quest, just in case
MS01.SetStage(830)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS01 Auto Const Mandatory
