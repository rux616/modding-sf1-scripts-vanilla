;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DBTestPCMAI_InvestigatePa_001F6311 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DBTestPCMAIScript
DBTestPCMAIScript kmyQuest = GetOwningQuest() as DBTestPCMAIScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckForNearbyPackin()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
