;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFCydoniaZ06_00037E62 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
StoryManager_CydoniaLoad.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_Letter.GetRef())
Game.GetPlayer().AddItem(Alias_Present.GetRef())

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Letter.GetRef())
Game.GetPlayer().RemoveItem(Alias_Present.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;set a timer for a TL to appear on Logan Cullen 24 hours after quest ends
FFCydoniaZ06_TLTimerLogan.SetValue(DaysPassed.GetValue() + 1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Chris  Auto Const Mandatory

ReferenceAlias Property Alias_Logan Auto Const Mandatory

ReferenceAlias Property Alias_Present Auto Const Mandatory

ReferenceAlias Property Alias_Letter Auto Const Mandatory



GlobalVariable Property FFCydoniaZ06_TLTimerLogan Auto Const

GlobalVariable Property DaysPassed Auto Const

GlobalVariable Property StoryManager_CydoniaLoad Auto Const
