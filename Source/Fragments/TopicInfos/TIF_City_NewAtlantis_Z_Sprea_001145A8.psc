;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_City_NewAtlantis_Z_Sprea_001145A8 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Game.GetPlayer().RemoveItem(NewsSlate.GetRef())

;George.GetActorRef().AddItem(NewsSlate.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property pCity_NA_Z_SpreadTheNewsDataSlate Auto Const Mandatory

ReferenceAlias Property George Auto Const

ReferenceAlias Property NewsSlate Auto Const
