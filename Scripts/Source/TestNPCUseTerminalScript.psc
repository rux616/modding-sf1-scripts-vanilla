Scriptname TestNPCUseTerminalScript extends ObjectReference Const

Actor Property TestActor Auto Const
GlobalVariable Property TestNPCUseTerminalGlobal Auto Const

Event OnActivate(ObjectReference akActionRef)
	TestNPCUseTerminalGlobal.SetValueInt(1)
	TestActor.EvaluatePackage()
EndEvent