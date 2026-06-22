Scriptname ArtifactPower_ReflectShield extends ActiveMagicEffect

Perk Property ReflectPerk Auto Const Mandatory

EVENT OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)

    akCaster.addPerk(ReflectPerk)

ENDEVENT

EVENT OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)

    akCaster.removePerk(ReflectPerk)

ENDEVENT