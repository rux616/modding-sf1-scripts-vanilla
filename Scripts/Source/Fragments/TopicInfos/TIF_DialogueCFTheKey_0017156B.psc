;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueCFTheKey_0017156B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueCFTheKeyQuestScript
DialogueCFTheKeyQuestScript kmyQuest = GetOwningQuest() as DialogueCFTheKeyQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.DialogueShipServices.RepairPlayerShip()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
