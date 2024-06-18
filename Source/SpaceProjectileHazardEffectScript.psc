Scriptname SpaceProjectileHazardEffectScript extends ActiveMagicEffect

Spell property Debug_SpaceProjectileSpell Auto Const Mandatory

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	akTarget.AddSpell(Debug_SpaceProjectileSpell, False)
EndEvent