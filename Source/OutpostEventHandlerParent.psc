Scriptname OutpostEventHandlerParent extends ObjectReference
{ use as a parent for any script that needs to get workshop events from OutpostPackinDummyScript }

function HandleOnWorkshopObjectPlaced(ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectPlaced")
endFunction

function HandleOnWorkshopObjectRemoved(ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectRemoved")
endFunction
