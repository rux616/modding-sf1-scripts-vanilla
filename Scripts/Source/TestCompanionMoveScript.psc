Scriptname TestCompanionMoveScript extends ObjectReference Const

Actor Property TestCompanion Auto Const

Event OnActivate(ObjectReference akActivator)
	TestCompanion.SetPlayerTeammate()
EndEvent