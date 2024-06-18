;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_UC08_490_FollowKaiserToSp_001C1196 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN CODE
WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock_Fail.Play(Kaiser.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN CODE
WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock_Fail.Play(Kaiser.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_Begin
Function Fragment_Phase_09_Begin()
;BEGIN CODE
WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock_Fail.Play(Kaiser.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_17_Begin
Function Fragment_Phase_17_Begin()
;BEGIN CODE
WwiseEvent_QST_UC08_Robot_Remote_Unlock.Play(Kaiser.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property UC08_DEBUG_MultipleTransmitUnlockSounds Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock_Fail Auto Const Mandatory

ReferenceAlias Property Kaiser Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC08_Robot_Remote_Unlock Auto Const Mandatory
