Scriptname OpenStarMapOnActivate extends ObjectReference
{Opens the Star Map when this activator is used.}

Message property FailedActivationMessage auto const mandatory

Event OnActivate(ObjectReference akActionRef)
    GoToState("Busy")
    if Game.IsMenuControlsEnabled()
        Game.ShowGalaxyStarMapMenu()
    else
        FailedActivationMessage.Show()
    endif
    GoToState("")
EndEvent

State Busy
    Event OnActivate(ObjectReference akActionRef)
        ; Do nothing
    EndEvent
endState