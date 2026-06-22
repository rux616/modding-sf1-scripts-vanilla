Scriptname ER_Peace_EnableMarkerRefScript extends ObjectReference Const

Quest Property City_ER_Peace Mandatory Const Auto
{Quest to check for completion to trigger this state change}

int Property StageToCheck = 1000 Auto Const
{Stage we're looking for completion on City_ER_Peace}

Event OnUnload()
    if City_ER_Peace.GetStageDone(StageToCheck) && !IsDisabled()
        Disable()
    endif
EndEvent