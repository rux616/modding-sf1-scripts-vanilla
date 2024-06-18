Scriptname TestTutorialScript extends ObjectReference Const

Message Property TestTutorialMessage Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	TestTutorialMessage.ShowAsHelpMessage("Jump", 30, 30, 1)
EndEvent