;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_GenericCrew_0026C4EA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE crew_genericcrewquestscript
Quest __temp = self as Quest
crew_genericcrewquestscript kmyQuest = __temp as crew_genericcrewquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetCostMultAndUpdateCost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE crew_genericcrewquestscript
Quest __temp = self as Quest
crew_genericcrewquestscript kmyQuest = __temp as crew_genericcrewquestscript
;END AUTOCAST
;BEGIN CODE
;Speech challenge won - Taskmaster discount
kmyquest.SetCostMultAndUpdateCost(1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
