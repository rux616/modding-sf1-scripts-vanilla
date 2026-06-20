;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Scenes:SF_CREW_EliteCrew_Muria_Pick_01083E74 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Crew_EliteCrewQuestScript kmyQuest = GetOwningQuest() as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PickupSceneEnded()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
