Scriptname CCT_StayInBleedoutEffectScript extends ActiveMagicEffect
{sets NoBleedoutRecovery when bleedout starts; clear it when hit while in bleedout.}

float property IgnoreHitsTimeSeconds = 2.0 auto Const
{ how long after entering bleedout to ignore hits? }

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    RegisterForRemoteEvent(akCaster, "OnEnterBleedout")
    RegisterForRemoteEvent(akCaster, "OnUnload")
EndEvent

Event Actor.OnEnterBleedout(Actor akSource)
    debug.trace(self + " OnEnterBleedout " + akSource + " - setting no bleedout recovery TRUE")
    akSource.SetNoBleedoutRecovery(true)
    StartTimer(IgnoreHitsTimeSeconds)
    akSource.EvaluatePackage()
EndEvent

Event OnTimer(int aiTimerID)
    debug.trace(self + " Registering for hit event")
    RegisterForHitEvent(GetCasterActor())
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    Actor myActor = GetCasterActor()
    debug.trace(self + "OnHit: myActor=" + myActor + " IsBleedingOut=" + myActor.IsBleedingOut())
    if myActor && myActor.IsBleedingOut() > 0
        debug.trace(self + " OnHit: " + myActor + " - setting no bleedout recovery FALSE")
        myActor.SetNoBleedoutRecovery(false)
    endif
EndEvent

Event ObjectReference.OnUnload(ObjectReference akSource)
    (akSource as Actor).SetNoBleedoutRecovery(false)
endEvent