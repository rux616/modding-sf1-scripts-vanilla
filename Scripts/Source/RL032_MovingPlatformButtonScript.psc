Scriptname RL032_MovingPlatformButtonScript extends ObjectReference

int property CurrentFloor = 1 auto

MovingPlatformMasterScript movingPlatformMasterScriptRef

Event OnCellLoad()
    movingPlatformMasterScriptRef = GetLinkedRef() as MovingPlatformMasterScript
EndEvent

Event OnActivate(ObjectReference akActionRef)
    if(movingPlatformMasterScriptRef.IsMoving())
        return
    endIf
    
    if(CurrentFloor == 1)
        CurrentFloor = 0
        movingPlatformMasterScriptRef.ProcessFloorTravelRequest(0)
    elseif (CurrentFloor == 0)
        CurrentFloor = 1
        movingPlatformMasterScriptRef.ProcessFloorTravelRequest(1)
    endIf
EndEvent