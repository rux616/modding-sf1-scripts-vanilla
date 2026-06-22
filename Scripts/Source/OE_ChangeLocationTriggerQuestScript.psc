Scriptname OE_ChangeLocationTriggerQuestScript extends Quest
{finds nearby OE locations with landing markers to use to start OEs with ships}

LocationAlias property OE_Location auto const mandatory
{ OE Location to send story event for }

ReferenceAlias Property Trigger Auto const mandatory
{The trigger associated with the OE_Location }

Keyword Property REEncounterTypeShip auto const mandatory
{ keyword for starting an OE }

Event OnQuestStarted()
    ; get trigger, make sure not already triggered
    RETriggerScript triggerRef = Trigger.GetRef() as RETriggerScript
    debug.trace(self + " OnQuestStarted triggerRef=" + triggerRef)
    if triggerRef && triggerRef.IsDisabled() == false && triggerRef.inStateOff == false
        triggerRef.StartEncounter(REEncounterTypeShip)
    Else
        if triggerRef
            debug.trace(self + " not calling StartEncounter on triggerRef=" + triggerRef + ": isDisabled=" + triggerRef.IsDisabled() + " inStateOff=" + triggerRef.inStateOff)
        Else
            debug.trace(self + " not calling StartEncounter - triggerRef=NONE")
        endif
    endif

    Stop()
endEvent