;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_FFCydoniaR02_001E61A7 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE FFCydoniaR02QuestScript
FFCydoniaR02QuestScript kmyQuest = GetOwningQuest() as FFCydoniaR02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckItems()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
