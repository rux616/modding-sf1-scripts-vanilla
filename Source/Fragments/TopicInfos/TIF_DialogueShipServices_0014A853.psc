;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueShipServices_0014A853 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueShipServicesScript
DialogueShipServicesScript kmyQuest = GetOwningQuest() as DialogueShipServicesScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RefuelPlayerShip()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
