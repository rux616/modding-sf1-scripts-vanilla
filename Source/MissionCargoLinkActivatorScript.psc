Scriptname MissionCargoLinkActivatorScript extends ObjectReference
{blocks activation unless allowed by quest}

Message property MissionCargoLinkActivatorBlockedMessage auto Const
{ message to show if activated when inactive }

Event OnLoad()
    BlockActivation(true, false)
EndEvent

Function AllowActivation(bool bActivationAllowed)
    if bActivationAllowed
        gotoState("active")
    Else
        gotoState("inactive")
    endif
EndFunction

auto state inactive
    Event OnActivate(ObjectReference akActionRef)
        if akActionRef == Game.GetPlayer()
            MissionCargoLinkActivatorBlockedMessage.Show()
        endif
    EndEvent
endState

state active
    Event OnActivate(ObjectReference akActionRef)
        ; do nothing
    EndEvent
endState