Scriptname E3AkilaShipScript extends Quest

ObjectReference property AkilaLandingMarker auto const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory
SpaceshipBase Property DefaultShip Mandatory Const Auto

Function SpawnAkilaShip(SpaceshipBase ShiptoSpawn, int shipTakeOffTimer, bool StartLanded)
    ;If no ship is specified then it sets it a default ship
    If (ShipToSpawn == NONE)
        ShiptoSpawn = DefaultShip
    EndIf    

    ;Link ship to Akila landing marker
    SpaceshipReference SpaceshipREF = AkilaLandingMarker.PlaceShipAtMe(ShiptoSpawn, abInitiallyDisabled=True)

    ;Sets the ship either landed or has it landing by setting up a link
    If (StartLanded)
        SpaceshipREF.SetLinkedRef(AkilaLandingMarker, None)
    else
        SpaceshipREF.SetLinkedRef(AkilaLandingMarker, SpaceshipEnabledLandingLink)
    EndIf

    SpaceshipREF.EnableNoWait()

    While (SpaceshipRef.IsLanded() == false)
        Utility.Wait(0.5)
    EndWhile

    if (shipTakeOffTimer == 0)
        shipTakeOffTimer = 5
    EndIf

    Utility.Wait(shipTakeOffTimer)
    SpaceshipREF.TakeOff()
EndFunction
