;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_016_KreetOrbitScene_00063800 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
defaulttutorialquestscript kmyQuest = GetOwningQuest() as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("PlanetLanding01")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
