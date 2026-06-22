;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFCydoniaR03_0023E9B7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_BookAlias.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
FFCydoniaR03Misc.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN AUTOCAST TYPE FFCydoniaR03QuestScript
Quest __temp = self as Quest
FFCydoniaR03QuestScript kmyQuest = __temp as FFCydoniaR03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RemoveBook()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE FFCydoniaR03QuestScript
Quest __temp = self as Quest
FFCydoniaR03QuestScript kmyQuest = __temp as FFCydoniaR03QuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

;Give the player a copy of the book as a reward.
kmyQuest.BookReward()

;Increment the book number count by 1 for the next time the player runs this quest.
FFCydoniaR03_BookNumber.Mod(1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property FFCydoniaR03_BookNumber Auto Const Mandatory

ReferenceAlias Property Alias_BookAlias Auto Const Mandatory

Quest Property FFCydoniaR03Misc Auto Const Mandatory
