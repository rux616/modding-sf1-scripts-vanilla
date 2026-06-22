Scriptname SetFactionOnDoorOpen extends ObjectReference Const

Faction property FactionToSet auto const
Keyword property TargetActorKeyword auto const

Event OnOpen(ObjectReference akActionRef)
    Actor targetActor = GetLinkedRef(TargetActorKeyword) as Actor
    if(targetActor != None)
        targetActor.AddToFaction(FactionToSet)
    endIf
EndEvent