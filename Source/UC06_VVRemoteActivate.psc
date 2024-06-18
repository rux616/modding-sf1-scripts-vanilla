Scriptname UC06_VVRemoteActivate extends ReferenceAlias

ReferenceAlias Property VaeVictis Mandatory Const Auto
{Alias for Vae Victis NPC}

Event OnActivate(ObjectReference akActionRef)
    Actor PlayerAct = Game.GetPlayer()
    if akActionRef == PlayerAct
        VaeVictis.GetRef().Activate(PlayerAct)
    endif
EndEvent