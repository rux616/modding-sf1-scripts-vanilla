;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_UC07_701_Kaiser_ProceedTo_001F428A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
Actor NineNineREF = Unit99.GetActorRef()
NineNineREF.PlayIdle(QuadA_IdleHowl)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WwiseEvent Property QST_Siren_Scream_WEF Auto Const Mandatory

ReferenceAlias Property Unit99 Auto Const Mandatory

Idle Property QuadA_IdleHowl Auto Const Mandatory
