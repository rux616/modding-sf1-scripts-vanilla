Scriptname LC056BossRoomExitDoorScript extends ObjectReference

ObjectReference Property DoorLeftRotationHelper Mandatory Const Auto
ObjectReference Property DoorRightRotationHelper Mandatory Const Auto

Event OnActivate(ObjectReference akActionRef)
    DoorLeftRotationHelper.SetAnimationVariableFloat("Position", 0.25)
    DoorLeftRotationHelper.SetAnimationVariableFloat("Speed", 0.1)
    DoorLeftRotationHelper.PlayAnimation("Rotate_Short")

    DoorRightRotationHelper.SetAnimationVariableFloat("Position", 0.25)
    DoorRightRotationHelper.SetAnimationVariableFloat("Speed", 0.1)
    DoorRightRotationHelper.PlayAnimation("Rotate_Short")
EndEvent
