Scriptname FXabVisualEffectScript extends ActiveMagicEffect
{This Script applies a Visual Effect.}

VisualEffect Property VisualEffectToApply Auto Const Mandatory
{This is the visue effect that will be used.}

 Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    	VisualEffectToApply.play(akCaster)
 EndEvent

 Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
   		VisualEffectToApply.Stop(akCaster)
 EndEvent