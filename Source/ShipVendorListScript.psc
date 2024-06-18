Scriptname ShipVendorListScript extends Activator
{ Contains a list of ships that should be sold by a ship vendor. }

struct ShipToSell
    LeveledSpaceshipBase leveledShip
    int minLevel = 1
endStruct

ShipToSell[] property ShipList auto const
{ List of ships to sell. }