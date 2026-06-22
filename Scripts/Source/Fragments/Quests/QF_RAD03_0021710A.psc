;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RAD03_0021710A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE RAD03QuestScript
Quest __temp = self as Quest
RAD03QuestScript kmyQuest = __temp as RAD03QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property Alias_MissionBoardLoc Auto Const Mandatory

Keyword Property Mission_LocationPriorityCargoMission Auto Const Mandatory

missionparentscript Property MB_Parent Auto Const Mandatory
