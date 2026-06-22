;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_COM_Companion_SarahMorga_003019B2 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE COM_CompanionQuestScript
COM_CompanionQuestScript kmyQuest = GetOwningQuest() as COM_CompanionQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.MakeRomantic()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
