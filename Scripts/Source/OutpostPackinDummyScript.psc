Scriptname OutpostPackinDummyScript extends ObjectReference Const
{passes events along to linked ref}

Event OnWorkshopObjectPlaced(ObjectReference akReference)
    OutpostEventHandlerParent myEventRef = GetLinkedRef() as OutpostEventHandlerParent
    debug.trace(self + " OnWorkshopObjectPlaced myEventRef=" + myEventRef)
    if myEventRef
        myEventRef.HandleOnWorkshopObjectPlaced(akReference)
    endif
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
    OutpostEventHandlerParent myEventRef = GetLinkedRef() as OutpostEventHandlerParent
    debug.trace(self + " OnWorkshopObjectRemoved myEventRef=" + myEventRef)
    if myEventRef
        myEventRef.HandleOnWorkshopObjectRemoved(akReference) 
    EndIf
EndEvent