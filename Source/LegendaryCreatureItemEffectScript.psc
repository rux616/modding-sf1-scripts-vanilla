Scriptname LegendaryCreatureItemEffectScript extends ActiveMagicEffect
{Adds a legendary item

NOTE: This spell effect is on an ability on the RACE of actors that can have Legendary versions.
The spell effect has a condition that the creatue has the EncTypeLegendary keyword.
}

LegendaryItemQuestScript Property LegendaryItemQuest const auto  
{AUTOFILL}

LeveledItem Property LeveledListOfItemsToSpawn const auto
{If set, use this leveled list when creating items. Otherwise use the default set on LegendaryItemQuestScript}

FormList Property ListOfSpecificModsToChooseFrom const auto
{If set, contsrain possible legendary mod choices to this list... it's possible that depending on the list of items rolling and how limited the list of mods is, you might not get a legendary item}

FormList Property ListOfSpecificModsToDisallow const auto
{If set, do not attach any of these particular legendary mods... it's possible that depending on the list of items rolling and how limited the list of mods is, you might not get a legendary item}

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	debug.trace(self + "OnEffectStart() adding Legendary item!!!")

	LegendaryItemQuest.GenerateLegendaryItem(akTarget, LeveledListOfItemsToSpawn, ListOfSpecificModsToChooseFrom, ListOfSpecificModsToDisallow)


EndEvent
