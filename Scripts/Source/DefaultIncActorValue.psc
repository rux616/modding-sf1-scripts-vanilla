Scriptname DefaultIncActorValue extends ActiveMagicEffect Const
;Increment the Quantum Essence on the player

Group Data
ActorValue Property ValueToInc Auto Const Mandatory

float Property AmountToInc = 1.0 Auto Const

EndGroup

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	;debug.trace(self + "OnEffectStart() akTarget: " + akTarget + ", akCaster: " + akCaster)
	game.getPlayer().SetValue(ValueToInc, (game.getPlayer().GetValue(ValueToInc) + AmountToInc))


EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)

EndEvent