Scriptname POIBB005TurbineScript extends ObjectReference Const

ObjectReference Property Blades Mandatory Const Auto

Event OnLoad()
    Utility.Wait(0.2)
    Blades.SetAnimationVariableFloat("Speed", 0.25)
    Blades.PlayAnimation("RotateCW_Loop")
EndEvent