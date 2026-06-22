Scriptname TestSteveCPerkEffectScript extends ActiveMagicEffect

Perk property TestSteveCDamagePerk_Immune Auto Const Mandatory

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
  Debug.Trace("Perk added.")
  (akTarget as SpaceshipReference).AddPerk(TestSteveCDamagePerk_Immune)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
  Debug.Trace("Perk removed.")
  (akTarget as SpaceshipReference).RemovePerk(TestSteveCDamagePerk_Immune)
EndEvent