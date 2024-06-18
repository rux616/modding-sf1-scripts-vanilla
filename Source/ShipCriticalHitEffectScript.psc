Scriptname ShipCriticalHitEffectScript extends ActiveMagicEffect
{test script for critical hits on ships}

SQ_ParentScript property SQ_Parent auto const mandatory
{ holds critical hit data/logic }

struct CriticalHitEffect
    int weight
    int criticalHitType ; enum
    ActorValue systemAV ; only for System and EM damage; none = random damage
endStruct

CriticalHitEffect[] property CriticalHitEffects auto Const
{ array of critical hit effects }

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    debug.trace(self + " OnEffectStart on " + akTarget)
    SQ_Parent.HandleCriticalHit(akTarget as SpaceshipReference, CriticalHitEffects)
endEvent
