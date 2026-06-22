Scriptname PheremoneScript2 extends ActiveMagicEffect

EVENT OnEffectStart(Objectreference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
  
  akCaster.StopCombat()

 Debug.Notification("combat")

ENDEVENT