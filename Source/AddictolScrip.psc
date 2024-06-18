Scriptname AddictolScrip extends ActiveMagicEffect

Spell Property Addiction Auto Const

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Actor targetAsActor = akTarget as Actor
	If targetAsActor
		targetAsActor.RemoveSpell(Addiction)
	EndIf
EndEvent