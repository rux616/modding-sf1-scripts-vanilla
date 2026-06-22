Scriptname MS01Script extends Quest

GlobalVariable Property MS01_GroupsRescued Auto Const Mandatory
ReferenceAlias Property ScientistDoorPackin Mandatory Const Auto
Keyword Property Link_AirlockDoor01 Mandatory Const Auto
Keyword Property Link_AirlockDoor02 Mandatory Const Auto


int Function SpacerGroupKilled()

    int nSpacersKilled = 0

    ; Counting the clues - maybe make this a loop at some point?
    if ( GetStageDone(410) )
        nSpacersKilled += 1
    endif
    if ( GetStageDone(420) )
        nSpacersKilled += 1
    endif
    if ( GetStageDone(430) )
        nSpacersKilled += 1
    endif
    if ( GetStageDone(440) )
        nSpacersKilled += 1
    endif

    ; Update the global and refresh the objective text
    MS01_GroupsRescued.SetValue(nSpacersKilled)
    UpdateCurrentInstanceGlobal(MS01_GroupsRescued)
    SetObjectiveDisplayed(300, true, true)    

    ; If you found all 7 flag the quest
    if ( nSpacersKilled >= 4 )
        SetStage(400)
    endif

EndFunction


Function LockDoors(Bool bLock)
    ObjectReference myDoor01 = ScientistDoorPackin.GetRef().GetLinkedRef(Link_AirlockDoor01)
    ObjectReference myDoor02 = ScientistDoorPackin.GetRef().GetLinkedRef(Link_AirlockDoor02)
    myDoor01.Lock(bLock)
    myDoor02.Lock(bLock)
    If bLock == True
        myDoor01.SetLockLevel(100)
        myDoor02.SetLockLevel(100)
    Else
        myDoor01.SetLockLevel(0)
        myDoor02.SetLockLevel(0)
    EndIf
EndFunction




