Scriptname TestOutpostEventsScript extends ObjectReference Const

Event OnLoad()
    debug.trace(self + " OnLoad linkedRef=" + GetLinkedRef())
EndEvent

Event OnWorkshopCargoLinkChanged(ObjectReference akOldTarget, ObjectReference akNewTarget)
    debug.trace(self + " OnWorkshopCargoLinkChanged akOldTarget=" + akOldTarget + " akNewTarget=" + akNewTarget)
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akActionRef)
    debug.trace(self + " OnWorkshopObjectRemoved akActionRef=" + akActionRef)
endEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectPlaced akReference=" + akReference)
EndEvent