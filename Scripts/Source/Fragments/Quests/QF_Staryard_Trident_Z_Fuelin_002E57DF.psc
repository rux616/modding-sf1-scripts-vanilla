;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Staryard_Trident_Z_Fuelin_002E57DF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
StoryManager_TridentLoad.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

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
;set a timer for post-quest top level
Staryard_Trident_Z_FuelingGreatness_Timer.SetValue(GameDaysPassed.GetValue() + 1)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Staryard_Trident_Z_FuelingGreatness_Timer Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property StoryManager_TridentLoad Auto Const
