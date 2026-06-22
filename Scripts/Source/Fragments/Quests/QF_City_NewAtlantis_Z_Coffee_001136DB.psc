;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NewAtlantis_Z_Coffee_001136DB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(TerraCino)
CompleteAllObjectives()


QuestTimer.SetValue(DaysPassed.GetValue()+1)
QuestCompleted.Mod(1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property TerraCino Auto Const

GlobalVariable Property QuestTimer Auto Const

GlobalVariable Property DaysPassed Auto Const

GlobalVariable Property QuestCompleted Auto Const
