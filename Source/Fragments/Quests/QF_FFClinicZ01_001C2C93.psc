;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFClinicZ01_001C2C93 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
StoryManager_ClinicLoad.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(Food_RS_DawnsRoost_SteerLiverPate,1)

;set value for FFClinicZ01Timer for conditioned lines/top levels
FFClinicz01Timer.SetValue(GameDaysPassed.GetValue() + 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property Food_RS_DawnsRoost_SteerLiverPate Auto Const Mandatory

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property FFClinicZ01Timer Auto Const

GlobalVariable Property StoryManager_ClinicLoad Auto Const Mandatory
