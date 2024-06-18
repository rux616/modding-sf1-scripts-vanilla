Scriptname ShipbuilderMenuActivator extends ObjectReference
{ script for buying ships via a kiosk activator 
    NOTE: kiosk should either be linked to a landing marker, OR be linked to another kiosk which is linked to the landing marker.ShipVendorScript
    So, if you have multiple kiosks, only link one to the landing marker, link the others to that kiosk.
}

ActorBase property ShipbuilderVendor auto const mandatory
{ vendor to create when built - needs to have ShipVendorScript }

ShipVendorScript property myVendor auto hidden
{ holds the ship vendor for the "master" kiosk }

ShipbuilderMenuActivator property myLinkedParent auto hidden
{ linked kiosk that holds the vendor to use }

Message Property ShipBuilderVendorMessage Auto Const
{the message that pops up on activation}

bool initialized = false

Event OnLoad()
    if initialized == false
        debug.trace(self + " OnLoad: initializing...")
        if myVendor == None && myLinkedParent == NONE
            ; get vendor from linked kiosk, or create a new one
            myLinkedParent = GetLinkedRef() as ShipbuilderMenuActivator
            debug.trace(self + " myLinkedParent=" + myLinkedParent)
            if myLinkedParent == NONE
                ; not linked to another kiosk
                ; create vendor
                myVendor = PlaceAtMe(ShipbuilderVendor, abInitiallyDisabled=true) as ShipVendorScript
                ; link to landing marker and reinitialize
                debug.trace(self + " myVendor=" + myVendor)
                myVendor.Initialize(GetLinkedRef())
            EndIf
        endif
        initialized = true
    EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
    debug.trace(self + " OnActivate " + akActionRef)
    if akActionRef == Game.GetPlayer()
        ShipVendorScript theShipServicesActor = myVendor
        if theShipServicesActor == None
            debug.trace(self + " trying to get my vendor from linked parent")
            ; get it from my linked kiosk
            theShipServicesActor = myLinkedParent.myVendor
        endif
        debug.trace(self + " theShipServicesActor=" + theShipServicesActor)
        if theShipServicesActor
	     int messageIndex = ShipBuilderVendorMessage.Show()
            if messageIndex == 0
			 theShipServicesActor.myLandingMarker.ShowHangarMenu(0, theShipServicesActor, abOpenToAvailableTab = false)
	     elseif messageIndex == 1
            		theShipServicesActor.myLandingMarker.ShowHangarMenu(0, theShipServicesActor, abOpenToAvailableTab = true)
	     endif
        endif
    endif
EndEvent

