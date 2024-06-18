Scriptname LC012_OpenDoor extends ObjectReference Const
{Opens linked door on trigger enter}


Event OnTriggerEnter(ObjectReference akActionRef)
    Debug.Trace(self+"   Trigger Entered") 
    GetLinkedRef().SetOpen()
    self.Disable()  
EndEvent