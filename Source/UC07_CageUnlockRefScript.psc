Scriptname UC07_CageUnlockRefScript extends ObjectReference Const

Quest Property UC07 Mandatory Const Auto
{Relevant UC quest}

Quest Property Dialogue1OfAKindUC07 Mandatory Const Auto
{Quest used to manage the open/close state of Unit 99's gate}

int Property StageToSet = 190 Const Auto
{Stage to set when this gate is unlocked}

int Property PrereqStage = 302 Const Auto
{Only care about these changes once this stage is set (and Unit 99 is turned on)}

Event OnLockStateChanged()
    if UC07.GetStageDone(PrereqStage) && !IsLocked() && !Dialogue1OfAKindUC07.GetStageDone(StageToSet)
        Dialogue1OfAKindUC07.SetStage(StageToSet)
        int currOpenState = GetOpenState()
        if currOpenState == 3 || currOpenState == 4
            SetOpen(true)
        endif
    endif
EndEvent