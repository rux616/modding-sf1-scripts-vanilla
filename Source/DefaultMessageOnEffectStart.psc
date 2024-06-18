Scriptname DefaultMessageOnEffectStart extends ActiveMagicEffect Default

Message Property MessageToShow Auto Const Mandatory
{ The message to show when this effect starts. }

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	MessageToShow.Show()
EndEvent