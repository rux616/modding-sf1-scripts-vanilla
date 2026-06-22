;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_City_NewAtlantis_Z_GemJe_000C5574 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Giving Guillaume the gem

Game.GetPlayer().RemoveItem(Alias_Gem.GetRef())
Alias_Guillaume.GetActorRef().AddItem(Alias_Gem.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Guillaume Auto Const

ReferenceAlias Property Alias_Gem Auto Const
