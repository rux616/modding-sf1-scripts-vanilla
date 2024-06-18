Scriptname AnnihilatorModEffect extends ActiveMagicEffect

Spell Property AnnihilatorSpawnHazardSelf Auto Const Mandatory

Event OnDeath(ObjectReference akKiller)
    Actor target = GetTargetActor()
    Debug.Trace("OnDeath event triggered")
    AnnihilatorSpawnHazardSelf.Cast(target, target)
    Debug.Trace("Spawned spell at " + target)
    Dispel()
EndEvent