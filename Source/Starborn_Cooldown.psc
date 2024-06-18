Scriptname Starborn_Cooldown extends ActiveMagicEffect

ActorValue Property CooldownGroup Auto Const Mandatory

Int Property CooldownValue Auto Const Mandatory

EVENT OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)

    akCaster.SetValue(CooldownGroup, CooldownValue)

ENDEVENT		