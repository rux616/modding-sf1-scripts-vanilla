;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_FC03_HopeGreet01Scene_0026C494 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_13_Begin
Function Fragment_Phase_13_Begin()
;BEGIN CODE
HT_CosetteRef.MoveTo(FC03_Cosette_St1500Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_13_End
Function Fragment_Phase_13_End()
;BEGIN CODE
FC03_CosetteInterruptScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property FC03_Cosette_St1500Marker Auto Const Mandatory

ObjectReference Property HT_CosetteRef Auto Const Mandatory

Scene Property FC03_CosetteInterruptScene Auto Const Mandatory
