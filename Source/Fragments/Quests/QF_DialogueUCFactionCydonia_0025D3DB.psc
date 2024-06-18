;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueUCFactionCydonia_0025D3DB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
UC03_PlayerKilledSpacerBoss.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_SpacerEnableMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
UC_LouMeetsPlayerEarly.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_SpacerEnableMarker Auto Const Mandatory

GlobalVariable Property UC03_PlayerKilledSpacerBoss Auto Const Mandatory

GlobalVariable Property DialogueCydonia_RedEyes Auto Const Mandatory

GlobalVariable Property UC_LouMeetsPlayerEarly Auto Const Mandatory
