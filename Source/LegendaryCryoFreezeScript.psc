Scriptname LegendaryCryoFreezeScript extends ActiveMagicEffect

SPELL PROPERTY pCryoFreezeSpell AUTO
{The Cryo freeze spell}

EVENT OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    debug.trace("OnEffectStart() akTarget" + akTarget)

    ;freeze him!
    pCryoFreezeSpell.cast(game.getPlayer(), akTarget)
ENDEVENT
