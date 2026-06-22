Scriptname ModLegendaryOnCritHitRefillAPScript extends ActiveMagicEffect Const

ActorValue Property ActionPoints const auto

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	debug.trace(self + "akTarget:" + akTarget + " , akCaster" + akCaster)

	akCaster.RestoreValue(ActionPoints, 999)
EndEvent
