;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_SE_Player_BB02_002D6B7F Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Alias_PlayerShip.GetRef().RemoveItem(ShipRepairKit)
Game.GetPlayer().RemoveItem(ShipRepairKit)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property InorgCommonHelium3 Auto Const

ReferenceAlias Property Alias_playerShip Auto Const

Potion Property ShipRepairKit Auto Const Mandatory
