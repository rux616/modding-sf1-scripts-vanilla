Scriptname ArtifactPower_Advancement extends ActiveMagicEffect

Perk Property PowerPerk Auto Const Mandatory

SPELL Property PowerSpell Auto Const Mandatory

;multipurpose script fired by spells with configured properties, to versatilely award and advance a given artifact power.
;as players can't know multiples of the same spell, addspell needs no conditions on its firing. addperk should not either, as perks' rank limits should prevent overflow.
;however it is interesting to note i couldn't locate a getperkrank() function anywhere in the script library, or any other functions referring to perk ranks.

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Actor PlayerREF = Game.GetPlayer()

	PlayerREF.RemoveSpell(PowerSpell) ;remove the spell if the player already has it, so that the UI fanfare can trigger again when it is added
	PlayerREF.AddPerk(PowerPerk) ;adds or upgrades the perk governing the power's rank. must be done first so that we can determine the rank when displaying the UI fanfare
	PlayerREF.AddSpell(PowerSpell, abVerbose=False) ;adds the artifact power in question (but don't display the HUD message since UI fanfare has its own message).


EndEvent