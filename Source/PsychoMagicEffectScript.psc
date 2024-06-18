Scriptname PsychoMagicEffectScript extends ActiveMagicEffect

Keyword Property PlayerConsumePsycho Auto Mandatory

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Actor PlayerREF = Game.GetPlayer()
	If akTarget == PlayerREF
		PlayerREF.SayCustom(PlayerConsumePsycho)
	EndIf
EndEvent