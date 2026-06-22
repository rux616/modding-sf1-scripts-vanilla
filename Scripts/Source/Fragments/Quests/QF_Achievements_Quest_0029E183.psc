;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Achievements_Quest_0029E183 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE Achievements_TrackedStatsScript
Quest __temp = self as Quest
Achievements_TrackedStatsScript kmyQuest = __temp as Achievements_TrackedStatsScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterTrackedStats()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
