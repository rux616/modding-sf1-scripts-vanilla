Scriptname LC051RotationHelperFan extends ObjectReference

Float Property Speed Auto
Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Keyword Property LinkCustom03 Auto Const
Keyword Property LinkCustom04 Auto Const
WwiseEvent Property WwiseEvent_OBJ_HugeFanBlades_Off Const Auto

ObjectReference FanRotationHelper
ObjectReference DamageTrigger

Event OnCellLoad()
    DamageTrigger = GetLinkedRef(LinkCustom01)
    FanRotationHelper = GetLinkedRef(LinkCustom02)
    FanRotationHelper.SetAnimationVariableFloat("Speed", Speed)
    FanRotationHelper.PlayAnimation("RotateCW_Loop")
EndEvent

Event OnActivate(ObjectReference akActionRef)
        StopFanRotation()
EndEvent

Function StopFanRotation()
    FanRotationHelper.SetAnimationVariableFloat("Speed", 0.1)
    FanRotationHelper.PlayAnimation("Rotate_long")
    DamageTrigger.Disable()
    WwiseEvent_OBJ_HugeFanBlades_Off.play(game.GetPlayer())
    GetLinkedRef(LinkCustom03).Disable()
    GetLinkedRef(LinkCustom04).Disable()
EndFunction
