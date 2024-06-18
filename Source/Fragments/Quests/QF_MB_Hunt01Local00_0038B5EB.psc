;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MB_Hunt01Local00_0038B5EB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE missionhuntquestscript
Quest __temp = self as Quest
missionhuntquestscript kmyQuest = __temp as missionhuntquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MissionComplete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE missionhuntquestscript
Quest __temp = self as Quest
missionhuntquestscript kmyQuest = __temp as missionhuntquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MissionShutdown()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
