;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_BE_JG02_02046853 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict)

;Set loot to spawn in captain's locker.
if (shouldSpawnLoot) ;set a value in properties
ObjectReference captainsLockerRef = Alias_CaptainsLocker.GetRef()
   if (CaptLockerLootLevel == 0) ;Default
      ;Don't spawn additional loot.
   ElseIf (CaptLockerLootLevel == 1) ;Small
      captainsLockerRef.AddItem(LL_BE_ShipCaptainsLockerLoot_Small)
   ElseIf (CaptLockerLootLevel == 2) ;Medium
      captainsLockerRef.AddItem(LL_BE_ShipCaptainsLockerLoot_Medium)
   ElseIf (CaptLockerLootLevel == 3) ;Large
      captainsLockerRef.AddItem(LL_BE_ShipCaptainsLockerLoot_Large)
   ElseIf (CaptLockerLootLevel == 4) ;Roll Random Loot
   int randCaptLootRoll = Utility.RandomInt(0, 100)
   debug.trace(self + " rolled " + randCaptLootRoll + " for random captain locker loot.")
      if (randCaptLootRoll >= 85)
         captainsLockerRef.AddItem(LL_BE_ShipCaptainsLockerLoot_Large)
      ElseIf (randCaptLootRoll <= 84 && randCaptLootRoll >= 55) 
         captainsLockerRef.AddItem(LL_BE_ShipCaptainsLockerLoot_Medium)
      ElseIf (randCaptLootRoll <= 54 && randCaptLootRoll >= 0) 
         captainsLockerRef.AddItem(LL_BE_ShipCaptainsLockerLoot_Small)
      Else
	  captainsLockerRef.AddItem(LL_BE_ShipCaptainsLockerLoot_Small)
      EndIf
   EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const Mandatory

LocationAlias Property Alias_EnemyShipExteriorLocation Auto Const Mandatory

Keyword Property LocTypeBEDerelict Auto Const

ReferenceAlias Property Alias_CaptainsLocker Auto Const Mandatory

ReferenceAlias Property Alias_enemyShip Auto Const Mandatory

Bool Property ShouldSpawnLoot = false Auto Const

Int Property CaptLockerLootLevel = 0 Auto Const
{Takes an int, 0-4. 0, no loot. 1 small, 2 med, 3 large, 4 randomize.}

LeveledItem Property LL_BE_ShipCaptainsLockerLoot_Small Auto Const

LeveledItem Property LL_BE_ShipCaptainsLockerLoot_Medium Auto Const

LeveledItem Property LL_BE_ShipCaptainsLockerLoot_Large Auto Const
