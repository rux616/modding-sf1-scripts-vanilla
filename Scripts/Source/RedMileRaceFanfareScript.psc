Scriptname RedMileRaceFanfareScript extends Quest

Float Property Speed Auto
RefCollectionAlias property Alias_LightRotationHelpers Auto Const Mandatory

Function StartDoorOpenFanfare()
    ;Rotate the lights
    int i = 0 
    ObjectReference[] LightRotationHelpers 
    LightRotationHelpers = Alias_LightRotationHelpers.GetArray()

    While (i < LightRotationHelpers.length )
        LightRotationHelpers[i].SetAnimationVariableFloat("Speed", Speed)
        LightRotationHelpers[i].PlayAnimation("RotateCW_Loop")
        i = i + 1
    EndWhile

EndFunction

Function StopFanfare()

EndFunction