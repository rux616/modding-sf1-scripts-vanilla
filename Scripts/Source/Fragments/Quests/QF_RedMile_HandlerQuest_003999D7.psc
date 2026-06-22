;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RedMile_HandlerQuest_003999D7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE RedMileHandlerQuestScript
Quest __temp = self as Quest
RedMileHandlerQuestScript kmyQuest = __temp as RedMileHandlerQuestScript
;END AUTOCAST
;BEGIN CODE
;Spawn the first set of creatures
kmyQuest.RespawnCreatures(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
