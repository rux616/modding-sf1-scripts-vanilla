Scriptname DR029ElevatorAvoidanceScript extends ObjectReference Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef == Game.GetPlayer())
        MovingPlatformMasterScript movingPlatform = GetLinkedRef() as MovingPlatformMasterScript

        if(movingPlatform != None)
            if(movingPlatform.IsInteriorDoorClosing())
                float doorOpenSeconds = movingPlatform.GetDoorOpenSeconds()

                Utility.Wait(doorOpenSeconds)
            endIf

            if(movingPlatform.IsMoving() && movingPlatform.GetCurrentDirection() < 0)
                movingPlatform.CancelTravelAndReturnToOriginFloor()
            endIf
        endIf
    endIf
EndEvent