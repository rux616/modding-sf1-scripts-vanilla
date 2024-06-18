Scriptname DR023StorageRoomDoorScript extends ObjectReference

;This is a temp script to handle a door that will hopefully become a real door GEN-325227

ObjectReference Property DR023_DoorLeftRotationHelper Mandatory Const Auto
ObjectReference Property DR023_DoorRightRotationHelper Mandatory Const Auto

Auto State Waiting
   Event OnActivate(ObjectReference akActionRef)
        GotoState("Done")
        DR023_DoorLeftRotationHelper.SetAnimationVariableFloat("Position", 0.25)
        DR023_DoorLeftRotationHelper.SetAnimationVariableFloat("Speed", 0.1)
        DR023_DoorLeftRotationHelper.PlayAnimation("Rotate_Short")

        DR023_DoorRightRotationHelper.SetAnimationVariableFloat("Position", 0.25)
        DR023_DoorRightRotationHelper.SetAnimationVariableFloat("Speed", 0.1)
        DR023_DoorRightRotationHelper.PlayAnimation("Rotate_Short")        
    EndEvent 
EndState


State Done
	Event OnActivate(ObjectReference akActionRef)
        ;Do Nothing
    EndEvent
EndState