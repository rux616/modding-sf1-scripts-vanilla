;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueUCFactionNewAtla_0004A4EC Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE UC01_OrientationDisplayQuestScript
UC01_OrientationDisplayQuestScript kmyQuest = GetOwningQuest() as UC01_OrientationDisplayQuestScript
;END AUTOCAST
;BEGIN CODE
UCR01.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UCR01 Auto Const Mandatory
