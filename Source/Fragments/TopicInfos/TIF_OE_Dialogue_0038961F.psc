;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_OE_Dialogue_0038961F Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE OE_DialogueAVScript
OE_DialogueAVScript kmyQuest = GetOwningQuest() as OE_DialogueAVScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetWhatsGoingOn(akSpeakerRef, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
