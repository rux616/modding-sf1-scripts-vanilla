Scriptname EH_CreateFruit extends ActiveMagicEffect

Potion Property AddFruit Auto Const

ACTOR caster

EVENT OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)

	caster = akCaster
    caster.additem(AddFruit)

ENDEVENT