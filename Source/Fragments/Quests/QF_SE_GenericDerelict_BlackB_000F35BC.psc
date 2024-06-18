;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_GenericDerelict_BlackB_000F35BC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SE_GenericDerelict_BlackboxGlobal.SetValue(100)
SetObjectiveDisplayed(10)
Game.GetPlayer().AddAliasedItem(SE_GenericDerelict_BlackBox, Alias_Blackbox)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SE_GenericDerelict_BlackboxGlobal.SetValue(0)
Game.GetPlayer().RemoveItem(Alias_Blackbox.GetRef())
Game.GetPlayer().RemoveItem(SE_GenericDerelict_BlackBox, 99)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Blackbox Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_BlackboxGlobal Auto Const Mandatory

MiscObject Property SE_GenericDerelict_BlackBox Auto Const Mandatory
