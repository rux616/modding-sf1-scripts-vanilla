;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNewHomesteadR05_0021952E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Luthor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_ChunksVendor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Luthor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
If FFNewHomesteadR05Misc.IsRunning()
	FFNewHomesteadR05Misc.SetStage(1000)
EndIf

SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_SpecialSauce.GetRef())

SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(FFNewHomesteadR05_Foreknowledge_AV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE FFNewHomesteadR05QuestScript
Quest __temp = self as Quest
FFNewHomesteadR05QuestScript kmyQuest = __temp as FFNewHomesteadR05QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_SpecialSauce.GetRef())

kmyQuest.SetCooldown()

FFNewHomesteadR05_NumTimesCompleted.Mod(1)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Luthor Auto Const Mandatory

ReferenceAlias Property Alias_ChunksVendor Auto Const Mandatory

ReferenceAlias Property Alias_SpecialSauce Auto Const Mandatory

GlobalVariable Property FFNewHomesteadR05_NumTimesCompleted Auto Const Mandatory

Quest Property FFNewHomesteadR05Misc Auto Const Mandatory

ActorValue Property FFNewHomesteadR05_Foreknowledge_AV Auto Const Mandatory
