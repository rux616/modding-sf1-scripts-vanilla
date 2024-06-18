Scriptname Artifact_Moonform_Stagger_Resist extends ActiveMagicEffect
{Awards a perk.}

Perk Property StaggerResist_Perk Auto Const Mandatory

EVENT OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)

    akCaster.addPerk(StaggerResist_Perk)

ENDEVENT

EVENT OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)

    akCaster.removePerk(StaggerResist_Perk)

ENDEVENT

