Scriptname PlanetTraitScanTargetScript extends ObjectReference
{ script for uncovering a planet trait when all the loc refs in this location are scanned }

SQ_ParentScript property SQ_Parent auto const mandatory
{ use to get planet trait data }

ObjectReference property PlanetTraitScanTargetRef auto const mandatory
{ ref from ScanTargetNames array on SQ_ParentScript to use for name }

Location myLocation

Event OnLoad()
    myLocation = GetCurrentLocation()
    BlockActivation(true, true)
    SQ_Parent.CheckForScanTargetUpdate(self)
    debug.trace(self + " IsScanned=" + IsScanned())
EndEvent

auto State ready

    Event OnScanned()
        gotoState("done")
        debug.trace(self + " OnScanned: myLocation=" + myLocation)
        ; discover any traits for this location
        SQ_Parent.DiscoverMatchingPlanetTraits(self)
    EndEvent

EndState

State done
    Event OnScanned()
        ; do nothing
    endEvent
EndState

function testIsScanned()
    debug.trace(self + " IsScanned=" + IsScanned())
endFunction