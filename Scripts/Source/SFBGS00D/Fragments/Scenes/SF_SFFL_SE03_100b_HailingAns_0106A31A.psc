;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Scenes:SF_SFFL_SE03_100b_HailingAns_0106A31A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_23_End
Function Fragment_Phase_23_End()
;BEGIN CODE
;have ship grav jump away and set completion global
SE03.SetStage(300)
CompletedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CompletedGlobal Auto Const Mandatory

Quest Property SE03 Auto Const Mandatory
