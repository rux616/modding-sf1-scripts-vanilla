;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_Rad01_LIST_00134462 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE Rad01_LIST_QuestScript
Rad01_LIST_QuestScript kmyQuest = GetOwningQuest() as Rad01_LIST_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PurchasePamphlets()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
