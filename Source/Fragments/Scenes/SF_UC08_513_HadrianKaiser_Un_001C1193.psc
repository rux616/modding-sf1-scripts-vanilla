;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_UC08_513_HadrianKaiser_Un_001C1193 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock.Play(Kaiser.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WwiseEvent Property WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock Auto Const Mandatory

ReferenceAlias Property Kaiser Auto Const Mandatory
