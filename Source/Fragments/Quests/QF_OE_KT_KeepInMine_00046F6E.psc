;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_KeepInMine_00046F6E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
OE_KT_KeepInMine_Scene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
ObjectReference Miner = Alias_NPC_Foreperson.GetRef()

int FoodAmount = Miner.GetItemCount(OE_KT_FoodGiftList) 
Miner.RemoveItem(OE_KT_FoodGiftList, FoodAmount)

Alias_NPC_ForePerson.GetRef().OpenOneWayTransferMenu( true, OE_KT_FoodGiftList )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
OE_KT_KeepInMine_020_TL00b.Stop()
OE_KT_KeepInMine_030_Thanks.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
int OreAmount
int FoodAmount = Alias_NPC_Foreperson.GetRef().GetItemCount(OE_KT_FoodGiftList) 
ObjectReference PlayerRef = Game.GetPlayer()

if FoodAmount >= 20
    OreAmount = FoodAmount / 4
endif

if FoodAmount >= 20
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common, OreAmount)
elseif FoodAmount >= 10
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common, 3)
elseif FoodAmount >= 5
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common, 2)
else 
    PlayerRef.AddItem(LL_Loot_Resource_Both_Common, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction)
Alias_NPC_Group00.SetValue(Aggression, 1)
Alias_NPC_Group00.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Scene Property OE_KT_KeepInMine_Scene01 Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Foreperson Auto Const Mandatory

FormList Property OE_KT_FoodGiftList Auto Const Mandatory

LeveledItem Property LL_Loot_Resource_Both_Common Auto Const Mandatory

Scene Property OE_KT_KeepInMine_030_Thanks Auto Const Mandatory

Scene Property OE_KT_KeepInMine_020_TL00b Auto Const Mandatory

RefCollectionAlias Property Alias_NPC_Group00 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory
