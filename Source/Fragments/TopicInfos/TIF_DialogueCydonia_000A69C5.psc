;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueCydonia_000A69C5 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueCydoniaQuestScript
DialogueCydoniaQuestScript kmyQuest = GetOwningQuest() as DialogueCydoniaQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.HorusAid()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
