;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CREW_EliteCrew_AmeliaEarh_0018E135 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Crew_EliteCrewQuestScript kmyQuest = GetOwningQuest() as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.FollowSceneEnded()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
