Scriptname TestFormationOnActivate extends ObjectReference Const

GlobalVariable Property TestFormationGlobal Auto Const
Actor Property Leader Auto Const
Actor Property Follower01 Auto Const
Actor Property Follower02 Auto Const
Actor Property Follower03 Auto Const
Actor Property Follower04 Auto Const
Int Property GlobalSetValue = 1 Auto Const

Event OnActivate(ObjectReference akActionRef)

	TestFormationGlobal.SetValue(GlobalSetValue)
	Leader.EvaluatePackage()
	Follower01.EvaluatePackage()
	Follower02.EvaluatePackage()
	Follower03.EvaluatePackage()
	Follower04.EvaluatePackage()

EndEvent