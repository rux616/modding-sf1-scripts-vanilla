;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ206A_007b_MatteoSpeech_002295AF Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
MatteoKhatri.GetActorRef().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
MatteoKhatri.GetActorRef().SetGhost(False)
GetOwningQuest().SetStage(220)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MatteoKhatri Auto Const
