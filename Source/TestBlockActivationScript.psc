Scriptname TestBlockActivationScript extends Actor Const

Event OnActivate(ObjectReference akActionRef)
	Debug.Trace(self + "HAS BEEN ACTIVATED.")
EndEvent

Event OnLoad()
	Self.BlockActivation()
EndEvent