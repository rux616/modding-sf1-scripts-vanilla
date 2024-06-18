Scriptname OutpostShipbuilderMenuScript extends TerminalMenu

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " auiMenuItemID=" + auiMenuItemID)
    OutpostShipbuilderMenuActivator myShipbuilderRef = akTerminalRef as OutpostShipbuilderMenuActivator
    if myShipbuilderRef
        ShipVendorScript theShipVendor = myShipbuilderRef.myVendor as ShipVendorScript
        debug.trace(self + " myShipbuilderRef=" + myShipbuilderRef + " theShipVendor=" + theShipVendor)
        if theShipVendor
            if auiMenuItemID == 1
                debug.trace(self + " menu item 1 - modify ship")
                theShipVendor.myLandingMarker.ShowHangarMenu(0, theShipVendor, abOpenToAvailableTab = false)
            elseif auiMenuItemID == 2
                debug.trace(self + " menu item 2 - buy ship")
                theShipVendor.myLandingMarker.ShowHangarMenu(0, theShipVendor, abOpenToAvailableTab = true)
            endif
            debug.trace(self + " menu handling DONE")
        endif
    endif
EndEvent