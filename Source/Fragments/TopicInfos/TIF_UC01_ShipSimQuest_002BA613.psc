;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_UC01_ShipSimQuest_002BA613 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE UC01_ShipSimulationQuestScript
UC01_ShipSimulationQuestScript kmyQuest = GetOwningQuest() as UC01_ShipSimulationQuestScript
;END AUTOCAST
;BEGIN CODE
GetOwningQuest().SetStage(650)
kmyquest.DirectPlayerToReset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
