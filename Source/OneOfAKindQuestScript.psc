Scriptname OneOfAKindQuestScript extends Quest

ReferenceAlias Property CageDoor Mandatory Const Auto
{Ref alias for the Ecliptic base cage door.}

Function OpenCageGate()
    ObjectReference CageREF = CageDoor.GetRef()
    int currOpenState = CageRef.GetOpenState()

    if currOpenState == 1
        CageREF.SetOpen(false)
    elseif currOpenState == 3
        CageREF.SetOpen(true)
        SetStage(200)
    endif
EndFunction