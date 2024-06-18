Scriptname AddFactionToLinkedRefOnTrigger extends ObjectReference Const
{Add Faction to linked actors on trigger.}

Faction Property FactionToAdd Mandatory Const Auto
Keyword Property LinkKeyword Mandatory Const Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    ;For each linked creature add faction.
    ObjectReference[] LinkedRefs = GetLinkedRefChain(LinkKeyword)
    int i = 0
    while (i < LinkedRefs.length)
        (LinkedRefs[i] as Actor).AddToFaction(FactionToAdd)
        i += 1
    endwhile
EndEvent