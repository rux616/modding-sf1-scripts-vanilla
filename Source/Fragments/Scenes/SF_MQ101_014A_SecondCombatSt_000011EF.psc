;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_014A_SecondCombatSt_000011EF Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
defaulttutorialquestscript kmyQuest = GetOwningQuest() as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("ShipLoot")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
