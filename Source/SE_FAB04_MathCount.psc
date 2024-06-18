Scriptname SE_FAB04_MathCount extends Quest
{Calculate the total number of ship parts the player has for both ship and inventory}

GlobalVariable Property InventoryTotal Auto Const Mandatory

Form Property ItemToRemove Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

int Property RequiredParts = 10 Auto

int CargoShipParts
int PlayerShipParts

Function CountShipParts()
    CargoShipParts = Alias_PlayerShip.GetRef().GetItemCount(ItemToRemove)
    PlayerShipParts = Game.GetPlayer().GetItemCount(ItemToRemove)
    int TotalParts = (CargoShipParts + PlayerShipParts)
    InventoryTotal.SetValue(TotalParts)
endFunction

Function RemoveShipParts()
    SpaceshipReference ShipRef = Alias_PlayerShip.GetShipRef()
    ObjectReference PlayerRef = Game.GetPlayer()

    If CargoShipParts >= RequiredParts
        ShipRef.RemoveItem(ItemToRemove, RequiredParts)
    else
        int NumberOfPartsRemoved = ShipRef.RemoveItem(ItemToRemove, CargoShipParts)
        int RemainingPartRemoval = (RequiredParts - NumberOfPartsRemoved)
        PlayerRef.RemoveItem(ItemToRemove, RemainingPartRemoval)
    endif
endFunction