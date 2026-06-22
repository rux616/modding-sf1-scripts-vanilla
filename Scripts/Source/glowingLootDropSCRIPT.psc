Scriptname glowingLootDropSCRIPT extends ActiveMagicEffect

LeveledItem PROPERTY list AUTO

ACTOR caster

EVENT OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)

	caster = akCaster

ENDEVENT

EVENT onDying(ObjectReference akKiller)

	caster.additem(list)
	debug.trace("farts")

ENDEVENT