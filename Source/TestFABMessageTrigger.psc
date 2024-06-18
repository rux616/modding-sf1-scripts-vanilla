Scriptname TestFABMessageTrigger extends ObjectReference Const

Message Property MessageToShow Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    Debug.Trace(akActionRef + " entered FAB Trigger.")
	if ( Game.GetPlayer() == akActionRef )
        MessageToShow.Show()
    EndIf
EndEvent