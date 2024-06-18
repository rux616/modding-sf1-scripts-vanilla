;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ203A_250_DoctorMain_01000807 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
;Stop the Doctor Idle scene.
MQ203A_260_DoctorIdle.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;Start the Doctor Idle scene.
MQ203A_260_DoctorIdle.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ203A_260_DoctorIdle Auto Const Mandatory
