Scriptname GrantTradeTowerLobbyKeyScript extends ObjectReference Const

Key property TradeTowerLobbyKey auto const mandatory
Keyword property PenthouseVisitorKeyword auto const mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef is Actor)
        Actor actorRef = akActionRef as Actor

        actorRef.AddItem(TradeTowerLobbyKey)
        actorRef.AddKeyword(PenthouseVisitorKeyword)
    endIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    if(akActionRef is Actor)
        Actor actorRef = akActionRef as Actor
        bool hasPenthouseVisitorKeyword = actorRef.HasKeyword(PenthouseVisitorKeyword) ; An extra level of security, to make sure this script has given this Actor a key, before removing one from their inventory.
        int keyCount = actorRef.GetItemCount()

        if(hasPenthouseVisitorKeyword && keyCount > 0)
            actorRef.RemoveItem(TradeTowerLobbyKey)
            actorRef.RemoveKeyword(PenthouseVisitorKeyword)
        endIf
    endIf
EndEvent