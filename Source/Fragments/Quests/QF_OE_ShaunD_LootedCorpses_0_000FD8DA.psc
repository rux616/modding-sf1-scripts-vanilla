;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_ShaunD_LootedCorpses_0_000FD8DA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
float offset = 1.0

ObjectReference lootingFurn = Alias_LootingFurn.GetRef()
lootingFurn.SetAngle(0.0, 0.0, 180.0) ; rotate to face corpse
lootingFurn.MoveTo(Alias_Marker_Corpse00.getReference(), afyOffset = offset, abMatchRotation = false)
lootingFurn.MoveToNearestNavmeshLocation()

; link corpses for patrol
int i = 1
while i < Alias_Corpses.GetCount()
 Alias_Corpses.GetAt(i-1).SetLinkedRef(Alias_Corpses.GetAt(i))
 i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Alias_NPC01.GetActorReference().AddToFaction(PlayerEnemyFaction)
Alias_NPC01.GetActorReference().SetValue(Aggression, 1)
Alias_NPC01.GetActorReference().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN AUTOCAST TYPE oescript
Quest __temp = self as Quest
oescript kmyQuest = __temp as oescript
;END AUTOCAST
;BEGIN CODE
;(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NPC01 Auto Const Mandatory

ActorValue Property Aggression Auto Const

Faction Property PlayerEnemyFaction Auto Const

ReferenceAlias Property Alias_Marker_Corpse00 Auto Const Mandatory

Furniture Property NPCSearchingFloor Auto Const

Keyword Property LinkCustom01 Auto Const

RefCollectionAlias Property Alias_Corpses Auto Const Mandatory

ReferenceAlias Property Alias_LootingFurn Auto Const Mandatory
