;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_UC04_00226482 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE uc04_questscript
uc04_questscript kmyQuest = GetOwningQuest() as uc04_questscript
;END AUTOCAST
;BEGIN CODE
GetOwningQuest().SetStage(810)
kmyquest.ToggleMarineFollowers()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
