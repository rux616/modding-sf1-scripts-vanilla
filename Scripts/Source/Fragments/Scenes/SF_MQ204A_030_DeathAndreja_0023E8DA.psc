;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ204A_030_DeathAndreja_0023E8DA Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
;make sure Andreja has keyword
Andreja.GetActorRef().AddKeyword(ExitToDeath)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Andreja Auto Const

Keyword Property ExitToDeath Auto Const Mandatory
