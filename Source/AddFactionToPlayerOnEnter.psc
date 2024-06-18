Scriptname AddFactionToPlayerOnEnter extends ObjectReference Const

Faction property FactionToAdd auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef == Game.GetPlayer())
        Actor player = Game.GetPlayer()

        player.AddToFaction(FactionToAdd)
    EndIf
EndEvent