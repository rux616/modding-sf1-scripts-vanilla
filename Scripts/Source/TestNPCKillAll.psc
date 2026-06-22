Scriptname TestNPCKillAll extends ObjectReference Const

ObjectReference Property SpawnController auto const
{Either fill this with the spawn controller, or use a default linkedRef to the spawn controller}

Event OnActivate(ObjectReference akActionRef)
    ObjectReference SpawnControllerFromLink = self.GetLinkedRef()
    if(SpawnControllerFromLink)
        (SpawnControllerFromLink as TestNPCArenaScript).KillAllNPCs()
    elseif(SpawnController)
        (SpawnController as TestNPCArenaScript).KillAllNPCs()
    endif
EndEvent


