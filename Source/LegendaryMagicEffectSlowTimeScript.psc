Scriptname LegendaryMagicEffectSlowTimeScript extends ActiveMagicEffect Const

Spell Property SlowTime Auto Const
Message Property modLegendarySlowTimeMsg Auto Const Mandatory

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	debug.trace(self + "OnEffectStart() akTarget: " + akTarget + ", akCaster:" + akCaster)
	modLegendarySlowTimeMsg.Show()
	SlowTime.Cast(akTarget)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	debug.trace(self + "OnEffectFinish() akTarget: " + akTarget + ", akCaster:" + akCaster)
EndEvent
