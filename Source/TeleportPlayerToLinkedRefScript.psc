Scriptname TeleportPlayerToLinkedRefScript extends ObjectReference

event OnActivate(ObjectReference akActionRef)
    ObjectReference player = Game.GetPlayer()
    ObjectReference moveToRef = GetLinkedRef()

    if(moveToRef != NONE)
        player.MoveTo(moveToRef)
    endIf
endEvent