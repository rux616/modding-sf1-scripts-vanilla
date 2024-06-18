Scriptname TestSprayingPipe extends ObjectReference Const

Weapon Property UnarmedHuman Auto Const
Form Property FireMed01 Const Auto
Hazard Property ENV_GasVentHazard_ToxicGas_Small Const Auto

Event OnLoad()
	if Is3DLoaded()
		RegisterForHitEvent(self)
	EndIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
    debug.trace(self + " On Hit registered")
    ; Check for the weapon type somehow.
    debug.trace(self + " Source = " + akSource)
    debug.trace(self + " Bash Attack = " + abBashAttack)
    debug.trace(self + " Aggressor = " + akAggressor)
    debug.trace(self + " Projectile = " + akProjectile)

    if(abBashAttack || akSource == UnarmedHuman as Form)
        debug.trace(self + " bash attack registered.")
        ;Checking for Bash Attack does not seem to work.
        RegisterForHitEvent(self)
    Else    
        self.PlaceAtMe(FireMed01)
        ;self.PlaceAtMe(ENV_GasVentHazard_ToxicGas_Small)
        self.GetLinkedRef().Enable()
    EndIf


EndEvent