;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Packages:PF_SSFL_SE_EC02_TravelToDaxD_0106D4FB Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
akActor.Disable(True)
SFFL_SE_EC02.SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFFL_SE_EC02 Auto Const Mandatory
