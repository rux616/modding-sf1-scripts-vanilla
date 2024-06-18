;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_SE_Player_AC03_00063AC2 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SpaceshipReference ShipRef = Alias_PlayerShip.GetShipRef()
ObjectReference PlayerRef = Game.GetPlayer()

int CargoShipParts = ShipRef.GetItemCount(Platinum)
int PlayerShipParts = PlayerRef.GetItemCount(Platinum)

If CargoShipParts >= 5
    ShipRef.RemoveItem(Platinum, 5)
else
    int NumberOfPartsRemoved = ShipRef.RemoveItem(Platinum, CargoShipParts)
    int RemainingPartRemoval = (5 - NumberOfPartsRemoved)
    PlayerRef.RemoveItem(Platinum, RemainingPartRemoval)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Platinum Auto Const

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory
