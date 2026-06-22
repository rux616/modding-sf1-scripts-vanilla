;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CREW_GenericCrew_00220674 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE crew_genericcrewquestscript
crew_genericcrewquestscript kmyQuest = GetOwningQuest() as crew_genericcrewquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.Recruited()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
