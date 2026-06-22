Scriptname OnWeaponFire_Backfire extends ActiveMagicEffect Hidden

int Property ChanceBackfire = 10 Const Auto

SPELL Property myWeaponFireSpell Auto Const
String Property myAnimEvent Auto Const

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    DEBUG.TRACE("Effect applied to " + akCaster + " by " + akTarget)
    registerForAnimationEvent(akTarget, myAnimEvent)
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    debug.trace("Received anim event: " + asEventName + akSource)
    
    if asEventName == myAnimEvent
        if Game.GetDieRollSuccess(ChanceBackfire)
            myWeaponFireSpell.Cast(akSource)
        endif
    else
        registerForAnimationEvent(akSource, myAnimEvent)
    endif
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
        UnregisterForAnimationEvent(akCaster, myAnimEvent)
EndEvent