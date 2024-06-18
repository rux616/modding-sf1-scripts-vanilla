Scriptname RL040RadioOnHitScript extends ObjectReference Const

ObjectReference Property myEnableMarker Mandatory Const Auto
ObjectReference Property PirateSceneTrigger Mandatory Const Auto

WwiseEvent Property sSparkEvent Mandatory Const Auto

Explosion Property ElectricalExplosionSmall Mandatory Const Auto

Quest Property RL040Quest Mandatory Const Auto

Event OnLoad()
    Utility.Wait(3)
	RegisterForHitEvent(self)
EndEvent

Event OnUnload()
    UnregisterForAllHitEvents(self)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    ;self.PlaceAtMe(ElectricalExplosionSmall)
    sSparkEvent.Play(self)
    PirateSceneTrigger.DisableNoWait()
    myEnableMarker.EnableNoWait()
    RL040Quest.SetStage(30)
EndEvent