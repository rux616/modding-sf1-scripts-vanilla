Scriptname OutpostCrewStationScript extends ObjectReference Const

SQ_CrewScript property SQ_Crew auto const mandatory

Event OnWorkshopObjectRemoved(ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectRemoved " + akReference)
    SQ_Crew.CheckCrewCountAtOutpost(akReference)
EndEvent
