;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_Anchorpoint_Repeatab_0205D540 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_AnchorpointQuestRepeatManager
Quest __temp = self as Quest
SFBGS00D:SFFL_AnchorpointQuestRepeatManager kmyQuest = __temp as SFBGS00D:SFFL_AnchorpointQuestRepeatManager
;END AUTOCAST
;BEGIN CODE
; This stage is set from the completion stage of SFFL_AnchorpointZ02A

; Initiate the function on the quest script to start the 
; 6-hour reset timer for AnchorpointZ02A
kmyquest.StartRepeatTimer(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_AnchorpointQuestRepeatManager
Quest __temp = self as Quest
SFBGS00D:SFFL_AnchorpointQuestRepeatManager kmyQuest = __temp as SFBGS00D:SFFL_AnchorpointQuestRepeatManager
;END AUTOCAST
;BEGIN CODE
; This stage is set from the completion stage of SFFL_AnchorpointZ04

; Initiate the function on the quest script to start the 
; 6-hour reset timer for AnchorpointZ02A
kmyquest.StartRepeatTimer(4)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property SFFL_AnchorpointZ04_RepeatGlobal Auto Const Mandatory

GlobalVariable Property SFFL_AnchorpointZ02_RepeatGlobal Auto Const Mandatory
