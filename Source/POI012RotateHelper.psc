Scriptname POI012RotateHelper extends ObjectReference Const


Event OnCellLoad()
    SetAnimationVariableFloat("Speed", 0.01)
    PlayAnimation("RotateCW_Loop")
EndEvent

