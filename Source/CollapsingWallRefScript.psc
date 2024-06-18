Scriptname CollapsingWallRefScript extends ObjectReference
{Script for collapsing wall panels, doors that can only be opened, not closed.}

bool property HideActivationText = False Auto Const
{Default=True. If True, when the collapsing wall initializes, block its activation text.}


Auto State Initial
	Event OnLoad()
		BlockActivation(True, HideActivationText)
		GoToState("Waiting")
	EndEvent
EndState

State Waiting
	Event OnActivate(ObjectReference akActionRef)
		GotoState("Done")
		Activate(akActionRef, True)
		BlockActivation(True, True)
	EndEvent
EndState

State Done
EndState