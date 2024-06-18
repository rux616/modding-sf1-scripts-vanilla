;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_City_NewAtlantis_Z_GemJe_000C557F Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;adding quest items to alias inventories

Alias_George.GetActorRef().RemoveItem(Alias_Gem.GetRef())
Game.GetPlayer().RemoveItem(Alias_Plate.GetRef())

Alias_George.GetActorRef().AddItem(Alias_Plate.GetRef())
Game.GetPlayer().AddItem(Alias_Gem.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_George Auto Const

ReferenceAlias Property Alias_Plate Auto Const

ReferenceAlias Property Alias_Gem Auto Const
