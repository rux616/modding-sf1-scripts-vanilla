Scriptname LC165ActivationBlockedObjectScript extends ObjectReference
{Blocks activation on load, optionally hiding activation text and displaying a message on activation.}

bool property ShouldHideActivationText = False Auto Const
Message property MessageToDisplayOnActivation Auto Const
int property RedisplayDelay = 3 Auto Const

Auto State WaitingToForLoad
	Event OnCellLoad()
		BlockActivation(True, ShouldHideActivationText)
		if (MessageToDisplayOnActivation != None)
			GoToState("WaitingForActivation")
		Else
			GoToState("Done")
		EndIf
	EndEvent
EndState

State WaitingForActivation
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Busy")
		MessageToDisplayOnActivation.Show()
		Utility.Wait(RedisplayDelay)
		GoToState("WaitingForActivation")
	EndEvent
EndState

State Busy
	;Do nothing. 
EndState

State Done
	;Do nothing. 
EndState