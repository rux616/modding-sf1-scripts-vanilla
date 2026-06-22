Scriptname LegendaryOnHitEffectStaggerScript extends ActiveMagicEffect const


int Property ChanceLargeStagger = 5 const auto
int Property ChanceMediumStagger = 10 const auto
int Property ChanceSmallStagger = 20 const auto

Explosion Property mod_Legendary_StaggerLarge_Explosion const auto mandatory
Explosion Property mod_Legendary_StaggerMedium_Explosion const auto mandatory
Explosion Property mod_Legendary_StaggerSmall_Explosion const auto mandatory


Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration) 
	debug.trace(self + "OnEffectStart() akTarget:" + akTarget + ", akCaster" + akCaster)

	int roll = Utility.RandomInt(1, 100)

	debug.trace(self + "roll = " + roll)

	if roll <= ChanceLargeStagger
		debug.trace(self + "Large Stagger!")
		akTarget.placeAtMe(mod_Legendary_StaggerLarge_Explosion)

	elseif roll <= ChanceMediumStagger
		debug.trace(self + "Medium Stagger!")
		akTarget.placeAtMe(mod_Legendary_StaggerMedium_Explosion)

	elseif roll <= ChanceSmallStagger
		debug.trace(self + "Small Stagger!")
		akTarget.placeAtMe(mod_Legendary_StaggerSmall_Explosion)

	endif
EndEvent
