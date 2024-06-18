;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ204A_030b_DeathSamScene_002C6CFE Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
SamCoe.GetActorRef().AddKeyword(ExitToDeath)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SamCoe Auto Const

Keyword Property ExitToDeath Auto Const Mandatory
