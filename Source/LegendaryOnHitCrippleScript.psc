Scriptname LegendaryOnHitCrippleScript extends ActiveMagicEffect Const

int Property CrippleChance = 20 const auto
{% Chance to cripple a leg on hit}

ActorValue Property LeftMobilityCondition const auto
ActorValue Property RightMobilityCondition const auto

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	debug.trace(self + "OnEffectStart() akTarget:" + akTarget + ", akCaster:" + akCaster)

	int roll = Utility.RandomInt(1, 100) 
	int coinFlip = Utility.RandomInt(0, 1)

	debug.trace(self + "Roll: " + roll + ", coinFlip: " + coinFlip)

	if roll <= CrippleChance
		if coinFlip == 1
			akTarget.DamageValue(LeftMobilityCondition, 99999)
		else
			akTarget.DamageValue(RightMobilityCondition, 99999)
		endif

	endif
EndEvent