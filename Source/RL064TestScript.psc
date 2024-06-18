Scriptname RL064TestScript extends ObjectReference

SPELL Property ExplosionFireHazardSpell Auto Const
ObjectReference Property IceLinked Auto
Explosion Property fragGrenadeExplosion Auto Const

Event OnLoad()
	if Is3DLoaded()
		RegisterForHitEvent(self)
        IceLinked = GetLinkedRef()
	EndIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
  Debug.Trace(akTarget + " was hit by " + akAggressor)
  ;disable()
  ;ExplosionFireHazardSpell.RemoteCast(self, Game.GetPlayer(), Game.GetPlayer())
  self.PlaceAtMe(fragGrenadeExplosion)
  MeltIce()
  ;RegisterForHitEvent(self) ; listen for another one
EndEvent

Function MeltIce()
    float currentScale = IceLinked.GetScale()
    while currentScale >= 0.1
        Utility.Wait(0.1)
        IceLinked.SetScale(currentScale * 0.9)
        currentScale = IceLinked.GetScale()
    EndWhile
    IceLinked.Disable()
    UnregisterForAllHitEvents()
EndFunction