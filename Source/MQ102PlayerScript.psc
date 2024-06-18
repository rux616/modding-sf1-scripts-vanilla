Scriptname MQ102PlayerScript extends ReferenceAlias

Location Property LC099NovaShipyardLocation Mandatory Const Auto
Faction Property EclipticFaction Mandatory Const Auto
Int Property EclipticCommentStage=540 Const Auto

Auto State WaitingForPlayer
    Event OnKill(ObjectReference akVictim)
        if (akVictim as Actor).IsInFaction(EclipticFaction) && Game.GetPlayer().IsInLocation(LC099NovaShipyardLocation)
            GotoState("HasBeenTriggered")
            GetOwningQuest().SetStage(EclipticCommentStage)
        EndIf
    EndEvent
EndState

State HasBeenTriggered
    Event OnKill(ObjectReference akVictim)
        ;do nothing
    EndEvent
EndState