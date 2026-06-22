Scriptname StarPower_AlienAlliance_Faction extends ActiveMagicEffect

Faction Property PlayerAllyFaction Auto Const Mandatory

ACTOR target

EVENT OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)

    target = akTarget as Actor
    target.stopcombat()
    target.makeplayerfriend()
    target.addtofaction(PlayerAllyFaction)

ENDEVENT