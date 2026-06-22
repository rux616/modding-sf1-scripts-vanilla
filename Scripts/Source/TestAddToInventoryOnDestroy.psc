Scriptname TestAddToInventoryOnDestroy extends ObjectReference

LeveledItem Property LL_Loot_IcyAsteroid Mandatory Const Auto


Event OnDestroyed(ObjectReference akDestroyer)
    Game.GetPlayer().AddItem(LL_Loot_IcyAsteroid)
EndEvent