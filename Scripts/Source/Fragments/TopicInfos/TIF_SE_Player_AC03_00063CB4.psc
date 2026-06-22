;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_SE_Player_AC03_00063CB4 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SpaceshipReference ShipRef = Alias_PlayerShip.GetShipRef()
ObjectReference PlayerRef = Game.GetPlayer()

int CargoShipParts = ShipRef.GetItemCount(Lithium)
int PlayerShipParts = PlayerRef.GetItemCount(Lithium)

If CargoShipParts >= 5
    ShipRef.RemoveItem(Lithium, 5)
else
    int NumberOfPartsRemoved = ShipRef.RemoveItem(Lithium, CargoShipParts)
    int RemainingPartRemoval = (5 - NumberOfPartsRemoved)
    PlayerRef.RemoveItem(Lithium, RemainingPartRemoval)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Lithium Auto Const

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory
