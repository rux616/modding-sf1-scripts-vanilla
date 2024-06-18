Scriptname UC09_ContinueAddressTrigger extends ReferenceAlias

ReferenceAlias Property Abello Mandatory Const Auto
{Reference alias for President Abello}

Event OnActivate(ObjectReference akActionRef)
    ObjectReference PlayerREF = Game.GetPlayer()
    if akActionRef == PlayerRef
        Abello.GetRef().Activate(PlayerRef)
    endif
EndEvent