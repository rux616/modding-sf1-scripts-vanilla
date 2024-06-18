;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_UC08_260a_JakobKaiserEyes_0005DD6F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_08_Begin
Function Fragment_Phase_08_Begin()
;BEGIN CODE
WwiseEvent_QST_UC08_Robot_Remote_Unlock.Play(Kaiser.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WwiseEvent Property WwiseEvent_QST_UC08_Robot_Remote_Unlock Auto Const Mandatory

ReferenceAlias Property Kaiser Auto Const Mandatory
