;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_FAB07_0007E2B4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Lillian says "hi"
Utility.Wait(5.0)
SE_FAB07_100_LillianSeesPC.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Lillian speaks up after the fight
SE_FAB07_200_LillianFightOver.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; If all the baddies are dead - quest progresses
if ( GetStageDone(220) && GetStageDone(230) )
  SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
; If all the baddies are dead - quest progresses
if ( GetStageDone(210) && GetStageDone(230) )
  SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
; If all the baddies are dead - quest progresses
if ( GetStageDone(210) && GetStageDone(220) )
  SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SE_Player_FAB07_RunOnce.SetValue(1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SE_FAB07_100_LillianSeesPC Auto Const Mandatory

Scene Property SE_FAB07_200_LillianFightOver Auto Const Mandatory

GlobalVariable Property SE_Player_FAB07_RunOnce Auto Const Mandatory
