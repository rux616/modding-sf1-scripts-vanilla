;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueGenericVendor_LI_0033E7FE Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueShipServicesScript
DialogueShipServicesScript kmyQuest = GetOwningQuest() as DialogueShipServicesScript
;END AUTOCAST
;BEGIN CODE
kmyquest.RepairPlayerShip()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
