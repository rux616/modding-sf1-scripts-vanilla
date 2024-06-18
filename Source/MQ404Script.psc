Scriptname MQ404Script extends Quest

Int Property HunterAppearsStage=130 Const Auto
Int Property HunterAppearsPrereqStage=120 Const Auto

Function WaitForWorkshopMenuClose()
    RegisterForMenuOpenCloseEvent("WorkshopMenu")
EndFunction

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    if (asMenuName== "WorkshopMenu")
        if (abOpening == False) && GetStageDone(HunterAppearsPrereqStage)
            SetStage(HunterAppearsStage)
            UnRegisterForMenuOpenCloseEvent("WorkshopMenu")
        endif
    endif
endEvent