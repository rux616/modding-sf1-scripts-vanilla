;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueCydoniaConvo_Comm_000812F3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
CY_Community_Support01_Variation.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
CY_CommunityConvo_CooldownTime.SetValue(Utility.GetCurrentGameTime() + CY_CommunityConvo_CooldownTimeDaysToAdd.GetValue())

;Reset the Variation Value if we've reached the end, so we can loop 
;again.
If CY_Community_Support01_Variation.GetValue() == 3
	CY_Community_Support01_Variation.SetValue(0)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CY_CommunityConvo_CooldownTime Auto Const Mandatory

GlobalVariable Property CY_CommunityConvo_CooldownTimeDaysToAdd Auto Const Mandatory

GlobalVariable Property CY_Community_Support01_Variation Auto Const Mandatory
