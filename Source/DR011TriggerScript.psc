Scriptname DR011TriggerScript extends ObjectReference
{Script for a trigger that causes a ship to land in DR011's Shuttle Bay.}

Keyword property LinkCustom01 Auto Const Mandatory
Keyword property LinkCustom02 Auto Const Mandatory

Auto State Waiting
    Event OnTriggerEnter(ObjectReference akActionRef)
        GoToState("Done")
        ;Open the shuttle bay doors.
        (GetLinkedRef(LinkCustom01) as ShuttleBayDoorManagerScript).OpenShuttleBayDoors()
        ;Enable a ship that lands in the shuttle bay.
        GetLinkedRef(LinkCustom02).Enable()
    EndEvent
EndState

State Done
EndState