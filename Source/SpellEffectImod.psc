Scriptname SpellEffectImod extends ActiveMagicEffect
{Plays the selected Imod on begin effect}

ImageSpaceModifier Property StingwingPoisonImod Auto

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    StingwingPoisonImod.Apply()
EndEvent
