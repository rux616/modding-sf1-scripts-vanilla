Scriptname WellRestedScript extends ActiveMagicEffect

Message Property MyMessage Auto

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	MyMessage.Show()
EndEvent
