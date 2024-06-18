Scriptname FXDamageSelfOnLoad extends ObjectReference Const
{Damage Self On load.}

Float Property DamageAmount = 1.0 Auto Const


Event OnLoad()
	if self.Is3DLoaded()
		self.DamageObject(DamageAmount)
	EndIf
EndEvent