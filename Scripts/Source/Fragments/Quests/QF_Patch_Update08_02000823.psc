;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update08_02000823 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
PlayerSkills.SetStage(701)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN CODE
PlayerSkills.SetStage(701)
PlayerSkills.SetStage(702)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_03
Function Fragment_Stage_0000_Item_03()
;BEGIN CODE
PlayerSkills.SetStage(701)
PlayerSkills.SetStage(702)
PlayerSkills.SetStage(703)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_04
Function Fragment_Stage_0000_Item_04()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property PlayerSkills Auto Const Mandatory
