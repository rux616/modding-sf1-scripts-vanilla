;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_R01_Debug_02029A38 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SE_ChanceRareGlobal.SetValue(0)
SE_ChanceUniqueGlobal.SetValue(0)
SE_Player_ChanceCommonGlobal.SetValue(0)
SE_Player_ChanceRareGlobal.SetValue(0)
SE_Player_ChanceFallbackGlobal.SetValue(0)

SFFL_SE_JG_ChanceGlobal.SetValue(100)

SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property SE_ChanceRareGlobal Auto Const Mandatory

GlobalVariable Property SE_ChanceUniqueGlobal Auto Const Mandatory

GlobalVariable Property SE_Player_ChanceCommonGlobal Auto Const Mandatory

GlobalVariable Property SE_Player_ChanceRareGlobal Auto Const Mandatory

GlobalVariable Property SE_Player_ChanceFallbackGlobal Auto Const Mandatory

GlobalVariable Property SFFL_SE_JG_ChanceGlobal Auto Const Mandatory
