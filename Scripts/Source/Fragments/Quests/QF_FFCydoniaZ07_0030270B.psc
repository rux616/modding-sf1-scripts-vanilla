;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFCydoniaZ07_0030270B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If FFCydoniaZ07Misc.IsRunning()
	FFCydoniaZ07Misc.SetStage(1000)
EndIf

;Check to see if the player has already explored the cave location.
Location myCave = Alias_Cave.GetLocation()
If myCave.IsExplored()
	SetStage(10)
EndIf

SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE FFCydoniaZ07QuestScript
Quest __temp = self as Quest
FFCydoniaZ07QuestScript kmyQuest = __temp as FFCydoniaZ07QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

kmyQuest.RegisterOre()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
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

Quest Property FFCydoniaZ07Misc Auto Const Mandatory

LocationAlias Property Alias_Cave Auto Const Mandatory
