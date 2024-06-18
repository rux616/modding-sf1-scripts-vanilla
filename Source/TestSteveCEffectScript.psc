Scriptname TestSteveCEffectScript extends ActiveMagicEffect

Message property TestSteveCEffectMessageBox Auto Const Mandatory

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	TestSteveCEffectMessageBox.Show()
EndEvent