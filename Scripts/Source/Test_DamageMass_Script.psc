Scriptname Test_DamageMass_Script extends ActiveMagicEffect

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    Debug.Trace(Self + "EVENT: OnEffectStart fired. akTarget = " + akTarget + " akCaster = " + akCaster)
EndEvent