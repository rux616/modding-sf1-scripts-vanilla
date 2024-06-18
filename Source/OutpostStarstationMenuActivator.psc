Scriptname OutpostStarstationMenuActivator extends ObjectReference

Message Property OutpostStarstationMessage auto const mandatory
{ message box listing options}

ActorBase property OutpostStarstationVendor auto const mandatory
{ vendor to create when built }

OutpostStarstationActorScript myVendor

Event OnWorkshopObjectPlaced(ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectPlaced")
    ; create vendor
    myVendor = PlaceAtMe(OutpostStarstationVendor, abInitiallyDisabled=true) as OutpostStarstationActorScript
    ; link to landing marker and reinitialize
    myVendor.Initialize(GetLinkedRef())
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectRemoved")
    if myVendor
        myVendor.Cleanup()
        myVendor.Delete()
        myVendor = NONE
    EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
    debug.trace(self + " OnActivate " + akActionRef)
    if akActionRef == Game.GetPlayer()
        OutpostStarstationActorScript theShipServicesActor = myVendor as OutpostStarstationActorScript
        if theShipServicesActor
            int messageIndex = OutpostStarstationMessage.Show()
            if messageIndex == 0
                theShipServicesActor.ModifyStarstation()
            endif
        endif
    endif
EndEvent