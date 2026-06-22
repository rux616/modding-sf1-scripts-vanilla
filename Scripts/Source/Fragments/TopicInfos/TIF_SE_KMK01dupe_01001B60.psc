;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_SE_KMK01dupe_01001B60 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE SEScript
SEScript kmyQuest = GetOwningQuest() as SEScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RemoveItemFromPlayerOrShip(ShipRepairKit, 1, 10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property ShipRepairKit Auto Const Mandatory
