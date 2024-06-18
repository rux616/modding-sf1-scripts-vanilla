Scriptname LegendaryArmorMagicEffectDisarmScript extends ActiveMagicEffect

ActorValue Property ModLegendaryArmorDisarm const auto
{AUTOFILL}

Spell Property DisarmSpell const auto
{AUTOFILL}

keyword Property NoDisarm const auto

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	If akTarget is Actor
		debug.trace(self + "OnEffectStart() akTarget: " + akTarget + ", akCaster: " + akCaster)
		RegisterForHitEvent(akTarget)
	EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	If akTarget is Actor
		debug.trace(self + "OnEffectFinish() akTarget: " + akTarget + ", akCaster: " + akCaster)
		UnregisterForAllHitEvents()
	EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	debug.trace(self + "OnHit() akTarget: " + akTarget + ", akAggressor: " + akAggressor)

	if akAggressor.HasKeyword(NoDisarm)
		debug.trace(self + "akAggressor has NoDisarm keyword. BAILING")
		return
	endif


	int dieRoll = Utility.RandomInt(1, 100)

	debug.trace(self + "DIE ROLL: " + dieRoll + ", Actor Value ModLegendaryArmorDisarm:" + akTarget.GetValue(ModLegendaryArmorDisarm))

	if dieRoll <= akTarget.GetValue(ModLegendaryArmorDisarm)
		;disarm aggressor
		DisarmSpell.Cast(akTarget, akAggressor)

	endif

	RegisterForHitEvent(akTarget)

EndEvent