Scriptname CastSpellOnActivate extends ObjectReference
{Casts a spell with user as target}

Spell Property SpellToCast Mandatory Const Auto

Auto State Waiting
    Event OnActivate(ObjectReference akActionRef)
        GoToState("Busy")
        ArcElectricityToTarget(akActionRef)
        goToState("waiting")
    EndEvent
EndState

Function ArcElectricityToTarget(ObjectReference target)
    Debug.Trace("Attacking: " + target)
    if(target)
        SpellToCast.Cast(self, target)
    EndIf
EndFunction

State Busy
    Event OnActivate(ObjectReference akActionRef)
        ; Do nothing
    EndEvent
endState