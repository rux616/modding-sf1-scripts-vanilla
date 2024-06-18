Scriptname TestCryoTankExplode extends ObjectReference Const

SPELL Property ExplosionFireHazardSpell Auto Const
Explosion Property fragGrenadeExplosion Auto Const

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

  self.PlaceAtMe(fragGrenadeExplosion)
  FreezeIce()
  
EndEvent

Function FreezeIce()

    ObjectReference IceLinked = GetLinkedRef()
    ;IceLinked.Enable()

    float MaxScale = IceLinked.GetScale()
    IceLinked.SetScale(0.01)
    float currentScale = IceLinked.GetScale()
    while currentScale <= MaxScale - 0.2
        Utility.Wait(0.1)
        IceLinked.SetScale(currentScale * 1.2)
        currentScale = IceLinked.GetScale()
    EndWhile
    IceLinked.SetScale(MaxScale)
    UnregisterForAllHitEvents()
 EndFunction  