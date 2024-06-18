;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_013d_ShieldsDownSce_000FED06 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
defaulttutorialquestscript kmyQuest = GetOwningQuest() as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("WeaponGroup2")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
