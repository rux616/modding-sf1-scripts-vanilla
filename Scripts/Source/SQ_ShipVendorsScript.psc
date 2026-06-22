Scriptname SQ_ShipVendorsScript extends Quest
{script for SQ_ShipVendors quest which handles system for creating and managing ships for sale}

Keyword Property LinkShipVendorLandingMarker auto const mandatory
{ keyword to get landing marker a vendor is linked to }

GlobalVariable Property GameDaysPassed Auto Const mandatory

ActorValue property SQ_ShipVendorsLastRefreshTimestamp auto const mandatory
{ used to stamp the vendor with the last player's visit - used to determine when to refresh ship list }

