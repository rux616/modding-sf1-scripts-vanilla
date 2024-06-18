Scriptname OutpostCargoLinkPackinScript extends ObjectReference Const
{passes on events to linked ref}

Event OnLoad()
    debug.trace(self + " OnLoad - outpost cargo link packin dummy - linkedRef=" + GetLinkedRef())
EndEvent

Event OnWorkshopCargoLinkChanged(ObjectReference akOldTarget, ObjectReference akNewTarget)
    OutpostCargoLinkMarkerScript myLinkedRef = GetLinkedRef() as OutpostCargoLinkMarkerScript
    debug.trace(self + " OnWorkshopCargoLinkChanged akOldTarget=" + akOldTarget + " akNewTarget=" + akNewTarget + " linkedRef=" + myLinkedRef)
    if myLinkedRef
        myLinkedRef.OnWorkshopCargoLinkChanged(akOldTarget, akNewTarget)
    endif
endEvent

Event OnWorkshopObjectRemoved(ObjectReference akActionRef)
    OutpostCargoLinkMarkerScript myLinkedRef = GetLinkedRef() as OutpostCargoLinkMarkerScript
    debug.trace(self + " OnWorkshopObjectRemoved akActionRef=" + akActionRef + " linkedRef=" + myLinkedRef)
    if myLinkedRef
        myLinkedRef.OnWorkshopObjectRemoved(akActionRef)
    endif
endEvent
