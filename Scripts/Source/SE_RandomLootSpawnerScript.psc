Scriptname SE_RandomLootSpawnerScript extends Quest
{Spawns a random number of a particular item based off of a formlist}

RefCollectionAlias property Alias_Markers Auto Const Mandatory
{Refcollection of the markers that this script can place items at}

RefCollectionAlias property Alias_SpawnedObjects Auto Const Mandatory
{Refcollection that the containers will go into}

Formlist Property Crateslist Auto Const Mandatory
{Formlist of different types of items that can be spawned}

int property maxLoot Auto Const Mandatory
{maximum number of items that can be spawned}

int Property hazardChance Mandatory Const Auto
{percent chance (1-100) that a hazard will appear at the same point as the loot}

Form Property PI_SpaceHazard Const Auto
{Packin containing the hazard and effect}

bool Property itemsAreRandom Mandatory Const Auto
{Do you want to spawn all of the same item or not}

Event OnQuestinit()

    int crateType = Utility.RandomInt(0,Crateslist.GetSize()-1)
    int numCrates = Utility.RandomInt(1,maxLoot)
    int i=0
    debug.trace(self + " Alias_Markers at start: " + Alias_Markers)
    while i<numCrates
        ObjectReference Spawnpoint = Alias_Markers.GetAt(Utility.RandomInt(0,Alias_Markers.GetCount()-1)) as ObjectReference

        ObjectReference newCrate

        if (itemsAreRandom == 0)
            newCrate = Spawnpoint.PlaceAtMe(Crateslist.GetAt(crateType))
        Else
            newCrate = Spawnpoint.PlaceAtMe(Crateslist.GetAt(Utility.RandomInt(0,Crateslist.GetSize()-1)))
        endif

        if (Utility.RandomInt(0,99) < hazardChance)

            Spawnpoint.PlaceAtMe(PI_SpaceHazard)

        endif


        Alias_Markers.RemoveRef(Spawnpoint)
        Alias_SpawnedObjects.addRef(newCrate)

        if (Alias_Markers.GetCount() == 0)
            i=numCrates
        EndIf

        i=i+1
    endwhile
    debug.trace(self + " Alias_Markers at end: " + Alias_Markers)

EndEvent