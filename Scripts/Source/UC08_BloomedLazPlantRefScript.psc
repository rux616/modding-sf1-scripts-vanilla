Scriptname UC08_BloomedLazPlantRefScript extends ObjectReference Const
{Fail safe script to keep the Lazarus Plants turned off if the cell resets before they're disabled}

Quest Property UC08 Mandatory Const Auto
{Quest used to manage anim stage of this object}

int Property AnimStage = 413 Const Auto
{Once this stage is set on UC08, the plant stays off}

string Property JumpToOff = "Stage2NoTransition" Const Auto
{The "jump to off" anim call for this object}

Event OnLoad()
    if !IsDisabled() && UC08.GetStageDone(AnimStage)
        PlayAnimation(JumpToOff)
    endif   
EndEvent