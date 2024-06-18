Scriptname UC06_VV_DoorRefScript extends ObjectReference Const

Quest Property UC06 Mandatory Const Auto
{Quest to watch for unlocking}

int Property UnlockStage = 99 Const Auto
{Stage to check on UC06 to ensure the door's always unlocked}

int Property UnlockStage01 = 105 Const Auto
{Stage to check on UC06 to ensure the door's always unlocked}

int Property UnlockStage02 = 200 Const Auto
{Stage to check on UC06 to ensure the door's always unlocked}

Event OnUnload()
    if GetOpenState() != 3
        SetOpen(false)
    endif
EndEvent

Event OnCellLoad()
    if UC06.GetStageDone(UnlockStage) || UC06.GetStageDone(UnlockStage01) || UC06.GetStageDone(UnlockStage02)
        Unlock()
    endif
EndEvent