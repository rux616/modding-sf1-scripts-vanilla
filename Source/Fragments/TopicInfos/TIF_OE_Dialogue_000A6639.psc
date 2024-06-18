;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_OE_Dialogue_000A6639 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE oe_dialogueavscript
oe_dialogueavscript kmyQuest = GetOwningQuest() as oe_dialogueavscript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetTopic04(akSpeakerRef, 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
