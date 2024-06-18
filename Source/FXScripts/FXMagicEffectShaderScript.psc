Scriptname FXScripts:FXMagicEffectShaderScript extends ActiveMagicEffect
{This Script applies a Visual Effect.}

EffectShader Property EffectShaderToApply Auto Const Mandatory
{This is the visue effect that will be used.}
Float Property ShaderDuration = -1.0 Const Auto 

 Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
     EffectShaderToApply.play(akTarget, ShaderDuration)
 EndEvent

 Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
   	 EffectShaderToApply.Stop(akTarget)
 EndEvent