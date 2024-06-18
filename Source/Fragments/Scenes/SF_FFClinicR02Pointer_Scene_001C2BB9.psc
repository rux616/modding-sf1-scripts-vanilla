;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_FFClinicR02Pointer_Scene_001C2BB9 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
FFClinicR02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
FFClinicR02.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFClinicR02 Auto Const Mandatory
