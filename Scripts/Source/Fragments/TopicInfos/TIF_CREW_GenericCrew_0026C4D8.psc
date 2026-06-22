;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CREW_GenericCrew_0026C4D8 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE crew_genericcrewquestscript
crew_genericcrewquestscript kmyQuest = GetOwningQuest() as crew_genericcrewquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.SpeechChallengeAttempted()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
