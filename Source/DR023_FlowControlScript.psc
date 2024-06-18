Scriptname DR023_FlowControlScript extends ObjectReference

;Unlocks one of the doors in the central room and opens it. This randomizes the flow each time the player visits.

Auto State RandomDoorState
    Event OnCellLoad()
        GotoState("Done")     
        ObjectReference[] DR023doors = GetLinkedRefChain()
        ObjectReference DoorUnlocked = DR023doors[Utility.RandomInt(0,DR023doors.length-1)]
        DoorUnlocked.SetOpen()

    EndEvent

EndState

STATE Done
    ;do nothing
EndSTATE