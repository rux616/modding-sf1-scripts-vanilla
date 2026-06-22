;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CF_Post_001655E6 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE CF_PostQuestScript
CF_PostQuestScript kmyQuest = GetOwningQuest() as CF_PostQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.DialogueShipServices.RepairPlayerShip()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
