;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302_220_EyeScene01_00155995 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
;add ExitToDeath keyword on dying actor
MQ302bOtherYou.GetActorRef().addKeyword(ExitToDeath)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MQ302bOtherYou Auto Const

Keyword Property ExitToDeath Auto Const Mandatory
