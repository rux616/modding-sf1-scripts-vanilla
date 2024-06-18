Scriptname ENV_DisableSprintEffectScript extends ActiveMagicEffect

InputEnableLayer InputLayer

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    InputLayer = InputEnableLayer.Create()

    InputLayer.EnableSprinting(false)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    InputLayer.Delete()
EndEvent