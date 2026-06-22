;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CF03_Stage150_Mathis_Towe_0024EA77 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN CODE
If CF03.GetStageDone(175) == 1
CF03.SetStage(170)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CF03 Auto Const Mandatory
