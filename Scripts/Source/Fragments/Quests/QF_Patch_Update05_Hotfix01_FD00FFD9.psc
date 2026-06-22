;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update05_Hotfix01_FD00FFD9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
; For [SF-40158]. Set stage 350 on SFTA00 in order to allow the player
; to speak with Adrastos, since this stage was getting skipped and could
; not get set if the player scanned or shot Adrastos before getting within
; range of him.
SFTA00.SetStage(350)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFTA00 Auto Const Mandatory
