Scriptname TestOpenSalonMenu extends ObjectReference Const

Event OnActivate(ObjectReference akActionRef)
    Game.ShowRaceMenu(uiMode=2)    
    RegisterForMenuOpenCloseEvent("ChargenMenu")
EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    if (asMenuName== "ChargenMenu")
        if (abOpening == False)
            UnRegisterForMenuOpenCloseEvent("ChargenMenu")
            Game.FadeOutGame(False, True, 0.0, 0.1) ;fade in        
        endif
    endif
endEvent
