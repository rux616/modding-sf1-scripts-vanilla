Scriptname SE_DB_04_Script extends Quest

ReferenceAlias Property HailingShip Mandatory Const Auto

form Property LootItem Auto Const Mandatory
{The specific loot item type that will be placed.}

Function DropLoot()
    ObjectReference Spawnpoint = HailingShip.GetShipReference()
    Spawnpoint.PlaceAtMe(LootItem)
EndFunction