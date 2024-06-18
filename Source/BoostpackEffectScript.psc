Scriptname BoostpackEffectScript extends ActiveMagicEffect
{script lives on the boostpack enchantment and sets an actor variable for when the boostpack is active or not}

ActorValue property BoostpackActive Auto Const


;*****************************************************


;*****************************************************

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    RegisterForAnimationEvent(akTarget, "StartImpactFX")
    RegisterForAnimationEvent(akTarget, "StopImpactFX")
EndEvent

;*****************************************************

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    UnRegisterForAnimationEvent(akTarget, "StartImpactFX")
    UnRegisterForAnimationEvent(akTarget, "StopImpactFX")
EndEvent

;*****************************************************

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    If akSource
        if (asEventName == "StartImpactFX")
            akSource.setValue(BoostpackActive, 1)
        EndIf

        if (asEventName == "StopImpactFX")
            akSource.setValue(BoostpackActive, 0)
        EndIf
    EndIf
EndEvent

;*****************************************************