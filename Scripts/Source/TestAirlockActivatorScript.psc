Scriptname TestAirlockActivatorScript extends ObjectReference Const

Event OnActivate(ObjectReference akActionRef)
	TestAirlockScript01 LinkedScript = (self.GetLinkedRef() as TestAirlockScript01)

	If LinkedScript.bPowerered==True
		LinkedScript.PowerOff()
	Else
		LinkedScript.PowerOn()
	EndIf

EndEvent