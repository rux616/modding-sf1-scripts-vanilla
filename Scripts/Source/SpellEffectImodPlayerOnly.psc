Scriptname SpellEffectImodPlayerOnly extends ActiveMagicEffect
{Plays the selected Imod on begin effect}

ImageSpaceModifier Property myImod Auto

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	if akTarget == Game.GetPlayer()
		myImod.Apply()
	endif
EndEvent
