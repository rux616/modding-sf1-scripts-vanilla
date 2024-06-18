;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_TestSteveCQuest_00045257 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE TestSteveCQuestScript
TestSteveCQuestScript kmyQuest = GetOwningQuest() as TestSteveCQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.TestGivingFood()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
