;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ207C_121_EntranceAirloc_0028887C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
WwiseEvent_QST_MQ207C_Scanner_Confirmation.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WwiseEvent Property WwiseEvent_QST_MQ207C_Scanner_Confirmation Auto Const Mandatory
