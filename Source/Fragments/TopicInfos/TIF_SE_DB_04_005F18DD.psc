;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_SE_DB_04_005F18DD Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE SE_DB_04_Script
SE_DB_04_Script kmyQuest = GetOwningQuest() as SE_DB_04_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.DropLoot() ; SE_DB_04_Script missing, so commented out until can be fixed
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
