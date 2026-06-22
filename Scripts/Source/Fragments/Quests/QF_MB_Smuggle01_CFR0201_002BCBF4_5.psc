;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MB_Smuggle01_CFR0201_002BCBF4_5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; dispay objective
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE missioncargoquestscript
Quest __temp = self as Quest
missioncargoquestscript kmyQuest = __temp as missioncargoquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)

;Counter to check number of missions completed
CF_TheKey_MissionBoardCounter.Mod(1)

kmyQuest.MissionComplete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE missioncargoquestscript
Quest __temp = self as Quest
missioncargoquestscript kmyQuest = __temp as missioncargoquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MissionFailed()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CF_TheKey_MissionBoardCounter Auto Const Mandatory
