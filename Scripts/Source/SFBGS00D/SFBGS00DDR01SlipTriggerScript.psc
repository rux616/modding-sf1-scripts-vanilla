Scriptname SFBGS00D:SFBGS00DDR01SlipTriggerScript extends ObjectReference
{Applies an impulse to actors entering the trigger to simulate slipping}

Int Property Cooldown = 9 auto const
{After triggered once, cannot cause any actor to slip for Cooldown seconds}

Auto State Default

    Event OnCellLoad()
        RegisterForRemoteEvent(GetLinkedRef(), "OnDestroyed")
    EndEvent

    ;ragdolls NPC, and blocks slipping for Cooldown seconds
    Event OnTriggerEnter(ObjectReference akActionRef)
        if(akActionRef != Game.GetPlayer() && (akActionRef as Actor).IsInCombat())
            (akActionRef as Actor).PushActorAway((akActionRef as Actor), 1)
            GotoState("Waiting")
            StartTimer(Cooldown)
        endif
    EndEvent
    
EndState

;disable trigger if oil puddle is destroyed
Event ObjectReference.OnDestroyed(ObjectReference akSender, ObjectReference akDestroyer)
    if(akSender == GetLinkedRef())
        DisableNoWait()
        CancelTimer()
        GotoState("Destroyed")
    endif
EndEvent

;after Cooldown seconds, resets to allow slipping again
Event OnTimer(int aiTimerID)
    GotoState("Default")
EndEvent

State Destroyed
EndState

State Waiting
EndState