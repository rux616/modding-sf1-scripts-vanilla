Scriptname Gang03_Script extends Quest

int Function HangOutsCleared()

    int nCleared = 0

    ; Counting the hangouts cleared
    if ( GetStageDone(400) )
        nCleared += 1
    endif
    if ( GetStageDone(500) )
        nCleared += 1
    endif
    if ( GetStageDone(600) )
        nCleared += 1
    endif

    ; Update the global and refresh the objective text
    Gang03_HangoutsCleared.SetValue(nCleared)
    UpdateCurrentInstanceGlobal(Gang03_HangoutsCleared)
    SetObjectiveDisplayed(700, true, true)    

    ; Cleared all Hangouts
    if ( nCleared >= 3 )
        SetStage(700)
    endif

EndFunction

Function MoveStriker(Actor aStriker)
    ObjectReference oTarg = Gang03_FinaleEntranceMarker    
    aStriker.Disable(TRUE)
    aStriker.MoveTo(oTarg)
    aStriker.RemoveFromFaction(PlayerFaction)    
    aStriker.Enable(TRUE)
EndFunction

GlobalVariable Property Gang03_HangoutsCleared Auto Const Mandatory
ObjectReference Property Gang03_FinaleEntranceMarker Mandatory Const Auto
Faction Property PlayerFaction Mandatory Const Auto