Scriptname CastSpellOnEffectScript extends ActiveMagicEffect Hidden
{Cast spell on target timed after another effect.}

Spell property OnEffectSpell auto const
{Cast this spell on effect start.}

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	OnEffectSpell.Cast(akCaster, akTarget)
EndEvent