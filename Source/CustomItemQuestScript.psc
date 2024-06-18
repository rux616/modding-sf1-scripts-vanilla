Scriptname CustomItemQuestScript extends Quest

Struct ItemDatum

String ID
{Indentifier - used to help identify items in array. Not otherwise used.}

int QuestStage
{Spawn item at this quest stage}

LeveledItem LeveledListToSpawnFrom
{List to spawn from}

Formlist ModsFormlist
{List of mods to install on item
****IMPORTANT NOTE***
THIS BYPASSES ALL NORMAL ITEM INSTANTIATION RULES}

ObjectReference ReferenceToSpawnIn
{Where to spawn item}

ReferenceAlias AliasToSpawnIn
{Where to spawn in, overrides ReferenceToSpawnIn}

bool PlaceAtMeInstead
{Place AT instead of IN ReferenceToSpawnIn}

ReferenceAlias AliasToForceItemInto
{if set, item will be forced into this alias}

EndStruct

ItemDatum[] Property ItemData const auto

Event OnStageSet(int auiStageID, int auiItemID)
    int foundIndex =  ItemData.findStruct("QuestStage", auiStageID)
    ItemDatum FoundDatum

    if foundIndex >= 0
    	FoundDatum = ItemData[foundIndex]
   	endif

    if FoundDatum && auiItemID == 0

    	ObjectReference spawnInRef
    	if FoundDatum.AliasToSpawnIn
			spawnInRef = FoundDatum.AliasToSpawnIn.GetReference()
    	elseif FoundDatum.ReferenceToSpawnIn
			spawnInRef = FoundDatum.ReferenceToSpawnIn
    	else
    		Game.Warning(Self + "OnStageSet() didn't find ReferenceToSpawnIn, using Game.GetPlayer() instead.")
    		spawnInRef = Game.GetPlayer()
    	endif

    	SpawnCustomItem(FoundDatum.LeveledListToSpawnFrom, FoundDatum.ModsFormlist,	spawnInRef, FoundDatum.PlaceAtMeInstead, FoundDatum.AliasToForceItemInto)
    endif
EndEvent


form Function SpawnCustomItem(LeveledItem LeveledListToSpawnFrom, Formlist ModsFormlist, ObjectReference ReferenceToSpawnIn, bool PlaceAtMeInstead = false, ReferenceAlias AliasToForceItemInto = none) global
	
	ObjectReference item = ReferenceToSpawnIn.PlaceAtMe(LeveledListToSpawnFrom, aiCount = 1, abForcePersist = false, abInitiallyDisabled = true, abDeleteWhenAble = false)

	debug.trace("SpawnCustomItem() creating item " + item)

	int i = 0
	while (i < ModsFormlist.GetSize())
		
		ObjectMod omod = ModsFormlist.GetAt(i) as ObjectMod
		bool success = item.AttachMod(omod)

		if success == false
			Game.Error("FAILED TO ATTACH " + omod + " to "+ item)
		else
			debug.trace("SpawnCustomItem() attaching " + omod + " to " + item)
		endif

		i += 1
	endwhile

	item.enable()

	if AliasToForceItemInto
		AliasToForceItemInto.ForceRefTo(item)
	endif

	if PlaceAtMeInstead
		debug.trace("SpawnCustomItem() placed item: " + item + " at " + ReferenceToSpawnIn)
	else
		debug.trace("SpawnCustomItem() adding item: " + item + " to " + ReferenceToSpawnIn)
		ReferenceToSpawnIn.additem(item)
	endif


	


	RETURN item

EndFunction