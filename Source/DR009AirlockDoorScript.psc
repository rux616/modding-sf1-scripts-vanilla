Scriptname DR009AirlockDoorScript extends ObjectReference

event OnActivate(ObjectReference akActionRef)
    ObjectReference player = Game.GetPlayer()
	if(akActionRef == player)
        ObjectReference cosmeticDoor = self.GetLinkedRef()

        if(cosmeticDoor != None)
            int openState = cosmeticDoor.GetOpenState()

            if(openState == 1 || openState == 2)
                cosmeticDoor.SetOpen(false)
            elseIf(openState == 3 || openState == 4)
                cosmeticDoor.SetOpen(true)
            endIf
        endIF
    endIf
endEvent