Scriptname ChemEffectDialogueScript extends ActiveMagicEffect

Keyword Property PlayerConsumeChem Auto Mandatory

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Actor PlayerREF = Game.GetPlayer()
	If akTarget == PlayerREF
		PlayerREF.SayCustom(PlayerConsumeChem)
	EndIf
EndEvent