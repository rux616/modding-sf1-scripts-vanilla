Scriptname SQ_ShipServicesActorScript extends ShipVendorScript conditional

DialogueShipServicesScript property DialogueShipServices auto const mandatory
{ quest handling ship services dialogue }

Function HandleOnLoad()
    debug.trace(self + " HandleOnLoad")
    ; update dialogue globals
    Parent.HandleOnLoad()
    DialogueShipServices.UpdateFuelGlobals()
endFunction


