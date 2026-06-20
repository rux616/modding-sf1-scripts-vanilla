;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Packages:PF_SSFL_SE_EC07_TravelToGalB_0106A506 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
akActor.Disable(True)
SFFL_SE_EC07.Stop()
SFFL_SE_EC07_MiscDialogue.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFFL_SE_EC07 Auto Const Mandatory

Quest Property SFFL_SE_EC07_MiscDialogue Auto Const Mandatory
