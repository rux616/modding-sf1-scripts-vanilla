Scriptname AddictionOddsScript extends ActiveMagicEffect

Float Property Magnitude Auto
ActorValue Property TrackingActorValue Auto Const

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	akTarget.ModValue(TrackingActorValue, Magnitude)
EndEvent
