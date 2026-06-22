Scriptname LC039_TestElevatorScript extends ObjectReference Const

Event OnActivate(ObjectReference akActionRef)
    
    ObjectReference linkedDoor = GetLinkedRef()

    linkedDoor.Activate(akActionRef)

EndEvent