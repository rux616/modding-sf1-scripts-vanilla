Scriptname SE_SpecificLootSpawner extends Quest
{Spawns a specific object at a number of generic markers.}

RefCollectionAlias property Alias_Markers Auto Const Mandatory
{Possible locations at which loot items can be placed.}
form Property LootItem Auto Const Mandatory
{The specific loot item type that will be placed.}
int Property AmountOfLoot Mandatory Const Auto
{The maximum number of loot items that will be placed, if less than number of references in Alias_Markers.}

Event OnQuestinit()

    debug.trace(self + " OnQuestInit")

    int i = AmountOfLoot

;Set max number of loot to place.
    if (i > Alias_Markers.GetCount())
        i = Alias_Markers.GetCount()
    EndIf
    debug.trace(self + "Alias_Markers count is " + Alias_Markers.GetCount())
    debug.trace(self + " i = " + i)

;Place specific loot item at a random marker until all loot items are placed.
    while i >= 0
        ObjectReference Spawnpoint = Alias_Markers.GetAt(Utility.RandomInt(0,Alias_Markers.GetCount()-1)) as ObjectReference
        ObjectReference NewObject = Spawnpoint.PlaceAtMe(LootItem)
        debug.trace(self + " New Object " + NewObject + " placed at " + Spawnpoint)        
        Alias_Markers.RemoveRef(Alias_Markers.GetAt(i))
        i=i-1
    endwhile
EndEvent



