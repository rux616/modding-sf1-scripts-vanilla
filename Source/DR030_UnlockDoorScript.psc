Scriptname DR030_UnlockDoorScript extends ObjectReference Const

Event OnActivate(ObjectReference akActionRef)
	ObjectReference doorRef = GetLinkedRef()

	if(doorRef != None)
		if(doorRef.IsLocked())
       	 	doorRef.Unlock()
			doorRef.SetOpen()
		else
			int OpenState = doorRef.GetOpenState()

			if(openState == 1)
				doorRef.SetOpen(false)
			endIf

			doorRef.SetOpen(false)
			doorRef.Lock()
		endIf
    endIf
EndEvent