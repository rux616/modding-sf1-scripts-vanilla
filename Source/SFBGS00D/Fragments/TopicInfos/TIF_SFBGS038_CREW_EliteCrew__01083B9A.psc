;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:TopicInfos:TIF_SFBGS038_CREW_EliteCrew__01083B9A Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Crew_EliteCrewQuestScript kmyQuest = GetOwningQuest() as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Recruited()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
