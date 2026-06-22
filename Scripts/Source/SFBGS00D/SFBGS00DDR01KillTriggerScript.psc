Scriptname SFBGS00D:SFBGS00DDR01KillTriggerScript extends ObjectReference
{Deals damage to the ref when they enter the trigger}

Int Property DamageValue = 10000 auto const
bool Property RequiresOverlap = false auto const
{Default: FALSE - Set to true if you want to require two triggers overlapping to kill a ref. Triggers should be linked to each other, no keyword}

Event OnTriggerEnter(ObjectReference akActionRef)
    if(RequiresOverlap == true)
        if(GetLinkedRef().IsInTrigger(akActionRef))
            akActionRef.DamageObject(DamageValue)
        endif
    else
        akActionRef.DamageObject(DamageValue)
    endif
EndEvent
