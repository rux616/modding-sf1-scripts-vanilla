Scriptname PushActorAwayScript extends ActiveMagicEffect

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Actor targetActor = akTarget as Actor
	If targetActor
		akCaster.PushActorAway(targetActor, Magnitude)
	EndIf
EndEvent

Float Property Magnitude Auto Const
