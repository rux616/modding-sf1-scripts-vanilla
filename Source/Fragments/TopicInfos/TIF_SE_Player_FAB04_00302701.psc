;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_SE_Player_FAB04_00302701 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE SE_FAB04_MathCount
SE_FAB04_MathCount kmyQuest = GetOwningQuest() as SE_FAB04_MathCount
;END AUTOCAST
;BEGIN CODE
kmyQuest.CountShipParts()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
