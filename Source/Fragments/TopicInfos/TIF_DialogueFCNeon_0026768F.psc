;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueFCNeon_0026768F Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE FCNeon_KosmosOrgResourcesScript
FCNeon_KosmosOrgResourcesScript kmyQuest = GetOwningQuest() as FCNeon_KosmosOrgResourcesScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SellResource(kmyQuest.RESOURCETYPE_STIMULANT)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
