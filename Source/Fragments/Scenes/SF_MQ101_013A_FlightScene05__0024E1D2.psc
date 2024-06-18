;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_013A_FlightScene05__0024E1D2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
defaulttutorialquestscript kmyQuest = GetOwningQuest() as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
; old Phase 24
GetOwningQuest().SetObjectiveCompleted(106)
kmyQuest.ShowHelpMessage("ShipWeapons")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
