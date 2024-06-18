Scriptname RevertToOpenStateOnCellLoad extends ObjectReference

bool property ShouldBeOpenOnCellLoad auto Const
GlobalVariable property DefaultDaysBeforeDoorsReset auto const

float timeOfLastOpenStateChange = -1.0

Event OnCellLoad()
    ;; check that enough time has passed since the last time this door's open state was changed
    if(Utility.GetCurrentGameTime() - timeOfLastOpenStateChange >= DefaultDaysBeforeDoorsReset.GetValue())
        int currentOpenState = GetOpenState()

        if(ShouldBeOpenOnCellLoad)
            if(currentOpenState != 1 || currentOpenState != 2)
                SetOpen(true)
            endIf
        else
            if(currentOpenState != 3 && currentOpenState != 4)
                SetOpen(false)
            endIf
        endIf
    endIf
EndEvent

Event OnOpen(ObjectReference akActionRef)
    SetTimeofLastOpenStateChange()
EndEvent

Event OnClose(ObjectReference akActionRef)
    SetTimeofLastOpenStateChange()
EndEvent

function SetTimeofLastOpenStateChange()
    timeOfLastOpenStateChange = Utility.GetCurrentGameTime()
endFunction