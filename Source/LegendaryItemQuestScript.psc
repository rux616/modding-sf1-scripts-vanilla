Scriptname LegendaryItemQuestScript extends Quest

LeveledItem Property LGND_PossibleLegendaryItemBaseLists const auto 
{AUTOFILL
Leveled list holding all the base LL_<Item> lists to use to generate Legendary items}

ActorValue Property SpawnedLegendaryItem const auto
{AUTOFILL used as a "do once" for spawning without having to have the spawning script store a variable}

Struct LegendaryModRule

ObjectMod LegendaryObjectMod
{A legendary Object Mod
Filter: "mod_Legendary"}

Formlist AllowedKeywords
{Formlist of keywords ANY of which present on the item means this mod may be added
Note: if none of these keywords are present, the mod can't be added to that item}

Formlist DisallowedKeywords
{Formlist of keywords ANY of which present on the item means this mod may not be added
Note: this trumps AllowedKeywords}

bool AllowGrenades = false
{Default: false; if true this mod is allowed on grenades }

EndStruct


Struct AmmoDatum
	Ammo AmmoType
	LeveledItem AmmoLeveledList
	int Count = 1
EndStruct

LegendaryModRule[] Property LegendaryModRules auto
{After the weapon is spawned, check these rules, then add an appropriate legendary mod}

AmmoDatum[] Property AmmoData const auto
{Used to add the correct leveled list of ammo that the spawned item uses}

CustomEvent LegendaryMagicEffectEvent 
;used to send messages from Contact-Target enchantment effects running on things hit by legendary weapons
;to enchantment effects running on actors equipped with those lengedary weapons
;See LegendaryMagicEffectEventSenderScript & LegendaryMagicEffectEventListenScript 
;Event enums
int Property iEventType_Starting = 1 const auto hidden 
int Property iEventType_Finishing = 2 const auto hidden
int Property iEventType_OnHit = 3 const auto hidden


ObjectMod[] PreviouslySpawnedMods  ;used for a "do all before repeating" behavior

Formlist Property WeaponTypeGrenadesKeywordList Auto Const Mandatory
{autofill}


Event OnQuestStarted()
    PreviouslySpawnedMods = new ObjectMod[0]
EndEvent

;ideally we'd be able register for custom events directly on ActiveMagicEffect scripts,
;but since we can't, I'm having the ActiveMagicEffect script send the event through the quest script
Function SendLegendaryMagicEffectEvent(Var[] kArgs)
	;called by LegendaryMagicEffectEventSenderScript running on Contact-Target enchantment's magic effects
	debug.trace(self + "SendLegendaryMagicEffectEvent() kArgs:" + kArgs)

	SendCustomEvent("LegendaryMagicEffectEvent", kArgs)
EndFunction


ObjectReference Function GenerateLegendaryItem(ObjectReference ObjectToSpawnIn, LeveledItem LeveledListOfItemsToSpawn = None, FormList ListOfSpecificModsToChooseFrom = None, FormList ListOfSpecificModsToDisallow = None)

	debug.trace(self + "GenerateLegendaryItem() ObjectToSpawnIn:" + ObjectToSpawnIn)
	debug.trace(self + "GenerateLegendaryItem() LeveledListOfItemsToSpawn:" + LeveledListOfItemsToSpawn)
	debug.trace(self + "GenerateLegendaryItem() ListOfSpecificModsToChooseFrom:" + ListOfSpecificModsToChooseFrom)
	debug.trace(self + "GenerateLegendaryItem() ListOfSpecificModsToDisallow:" + ListOfSpecificModsToDisallow)
	
	LeveledItem spawnList

	if LeveledListOfItemsToSpawn
		spawnlist = LeveledListOfItemsToSpawn

	else ;use default defined on this quest script
		debug.trace(self + "GenerateLegendaryItem() LeveledListOfItemsToSpawn is not set, so using default.")
		spawnlist = LGND_PossibleLegendaryItemBaseLists

	endif

	debug.trace(self + "GenerateLegendaryItem() spawnlist:" + spawnlist)

	if ObjectToSpawnIn.GetValue(SpawnedLegendaryItem) > 0
		debug.trace(self + "GenerateLegendaryItem() not spawning object because ObjectToSpawnIn already spawned a legendary object. " + ObjectToSpawnIn)
		RETURN None
	endif

	ObjectToSpawnIn.SetValue(SpawnedLegendaryItem, 1)

	ObjectReference item = ObjectToSpawnIn.PlaceAtMe(spawnlist, aiCount = 1, abForcePersist = false, abInitiallyDisabled = true, abDeleteWhenAble = false)

	if item
		debug.trace(self + "GenerateLegendaryItem() PlaceAtMe returned: " + item)
	else
		debug.trace(self + "GenerateLegendaryItem() PlaceAtMe returned nothing")
	endif

	AddLegendaryMod(item, ListOfSpecificModsToChooseFrom, ListOfSpecificModsToDisallow)
	
	

	;add ammo if needed
	weapon itemWeapon = item.GetBaseObject() as weapon

	if itemWeapon
		ammo itemAmmo = itemWeapon.GetAmmo()
		if itemAmmo
			int i = AmmoData.FindStruct("AmmoType", itemAmmo)
				if i >= 0
					AmmoDatum itemWeaponAmmoDatum = AmmoData[i]
					debug.trace(self + "GenerateLegendaryItem() adding ammo list: " + itemWeaponAmmoDatum.AmmoLeveledList)

					ObjectToSpawnIn.addItem(itemWeaponAmmoDatum.AmmoLeveledList, itemWeaponAmmoDatum.Count)
				endif
		endif

	endif

	debug.trace(self + "GenerateLegendaryItem() adding item: " + item)
	ObjectToSpawnIn.additem(item)

	item.enable()
	return item
EndFunction


Function AddLegendaryMod(ObjectReference item, FormList ListOfSpecificModsToChooseFrom = None, FormList ListOfSpecificModsToDisallow = None)
	;take an item and add a legendary mod to it

	debug.trace(self + "AddLegendaryMod() item:" + item)

	;GET THE MODS WE CAN INSTALL ON THIS ITEM
	ObjectMod[] AllowedMods = GetAllowedMods(item, ListOfSpecificModsToChooseFrom, ListOfSpecificModsToDisallow)

	ObjectMod[] PreferredMods = new ObjectMod[0]

	;FIND THE MODS WE HAVEN'T SPAWNED RECENTLY
	int i = 0
	while (i < AllowedMods.length)
		if  PreviouslySpawnedMods.Find(AllowedMods[i]) < 0  ;not found
			debug.trace(self + "AddLegendaryMod() adding item to PreferredMods:" + AllowedMods[i])

			PreferredMods.add(AllowedMods[i])
		endif

		i += 1
	endwhile
	
	;if we don't have anything to pick from, reset and pick from any 
	if PreferredMods.length == 0
		debug.trace(self + "AddLegendaryMod() couldn't find any previously unspawned mods, clearing PreviouslySpawnedMods and using any allowable")
		PreviouslySpawnedMods.clear()  ;*see note below
		PreferredMods = AllowedMods
	endif
	;* NOTE:
	;We aren't guaranteed to have gotten each mod yet before we clear PreviouslySpawnedMods
	;because some non-used things might not have rules that passed during current call to GetAllowedMods
	;but it's okay that we reshuffle the deck from time to time before seeing all the cards - so to speak
	;this is effectively how the various "Do All Before Repeating" functionality in the editor works
	;*** We could make this less prone to resetting if we kept seperate arrays for weapon and armor mods


	;ROLL A DIE AND PICK A MOD
	int max = PreferredMods.Length
	if max > 0
		int dieRoll = Utility.RandomInt(0, max - 1)

		ObjectMod legendaryMod = PreferredMods[dieRoll]

		PreviouslySpawnedMods.Add(legendaryMod)

		debug.trace(self + "AddLegendaryMod() item: " + item)
		debug.trace(self + "AddLegendaryMod() attaching: " + legendaryMod)

		bool success = item.AttachMod(legendaryMod)

		if success == false
			Game.Warning(self + "FAILED TO ATTACH " + legendaryMod + " to "+ item)
		endif
		
	else
		Game.Warning(self + "AddLegendaryMod() could not find any appropriate Legendary Mods to add to item: " + item)

	endif

EndFunction


ObjectMod[] Function GetAllowedMods(ObjectReference item, FormList ListOfSpecificModsToChooseFrom = None, FormList ListOfSpecificModsToDisallow = None)
	;loop through LegendaryModRules and add appropriate mods to AlloweMods
	debug.trace(self + "GetAllowedMods() item:" + item)
	debug.trace(self + "ListOfSpecificModsToDisallow: " + ListOfSpecificModsToDisallow)
	
	ObjectMod[] AllowedMods = New ObjectMod[0]
	
	int i = 0
	while (i < LegendaryModRules.Length)
		LegendaryModRule Rule = LegendaryModRules[i]
		ObjectMod ModToConsider = Rule.LegendaryObjectMod

		debug.trace(self + "ModToConsider: " + ModToConsider)
		
		bool continue = !item.HasKeywordInFormList(WeaponTypeGrenadesKeywordList) || Rule.AllowGrenades
		continue = continue && (!ListOfSpecificModsToDisallow || (ListOfSpecificModsToDisallow.Find(ModToConsider) <= -1))
		continue = continue && (!ListOfSpecificModsToChooseFrom || (ListOfSpecificModsToChooseFrom.Find(ModToConsider) >= 0))
	
		if Rule.AllowedKeywords
			continue = continue && item.HasKeywordInFormList(Rule.AllowedKeywords)
		endif

		if Rule.DisallowedKeywords
			continue = continue && !item.HasKeywordInFormList(Rule.DisallowedKeywords)
		endif

		continue = continue && ModToConsider

		if (continue)
			debug.trace(self + "AllowedMods adding: " + ModToConsider)
			AllowedMods.add(ModToConsider)
		else
			debug.trace(self + "AllowedMods *NOT* adding: " + ModToConsider)
		endif

		i += 1
	endwhile

	debug.trace(self + "GetAllowedMods() returning:" + AllowedMods)

	return AllowedMods
EndFunction

