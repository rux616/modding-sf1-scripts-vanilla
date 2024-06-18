;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_013A_FlightScene02__0024E1CF Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
defaulttutorialquestscript kmyQuest = GetOwningQuest() as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ShowHelpMessage("ShipSpeed")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
defaulttutorialquestscript kmyQuest = GetOwningQuest() as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ShowHelpMessage("ShipBoost")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
