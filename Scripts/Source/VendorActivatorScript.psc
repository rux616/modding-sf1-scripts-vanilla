Scriptname VendorActivatorScript extends ObjectReference
{ script for accessing the vendor menu via an activator }

ActorBase property Vendor auto const mandatory
{ vendor to create on load }

Container property VendorContainer auto const mandatory
{ vendor container to create on load }

Keyword property VendorContainerKeyword01 auto const mandatory
{ used to link vendor container }

bool property ClearVendorActorInventoryOnLoad = false auto const
{ If true, the spawned Vendor actor will have its inventory cleared each time the Activator loads. }

Actor myVendor ; created vendor
ObjectReference myVendorContainer ; created container

Event OnLoad()
    ; create vendor refs
    if myVendor == NONE
        myVendor = PlaceActorAtMe(Vendor, abInitiallyDisabled=true)
        myVendorContainer = PlaceAtMe(VendorContainer, abInitiallyDisabled=true)
        myVendor.SetLinkedRef(myVendorContainer, VendorContainerKeyword01)
    endif

    ; Clear vendor actor contents, if necessary
    if ClearVendorActorInventoryOnLoad
        myVendor.RemoveAllItems()
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
    debug.trace(self + " OnActivate " + akActionRef)
    if akActionRef == Game.GetPlayer()
        myVendor.ShowBarterMenu()
    endif
EndEvent
