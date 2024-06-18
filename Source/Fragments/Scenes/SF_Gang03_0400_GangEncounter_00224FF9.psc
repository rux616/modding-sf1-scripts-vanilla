;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Gang03_0400_GangEncounter_00224FF9 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if City_Neon_Gang03.GetStageDone(410) == 0
City_Neon_Gang03.SetStage(430)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property City_Neon_Gang03 Auto Const Mandatory
