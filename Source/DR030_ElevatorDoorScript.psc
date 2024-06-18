Scriptname DR030_ElevatorDoorScript extends ObjectReference Const

Event OnActivate(ObjectReference akActionRef)
	ObjectReference moveToMarker = GetLinkedRef()

    if(moveToMarker != None)
        akActionRef.moveto(moveToMarker)
    endIf
EndEvent
