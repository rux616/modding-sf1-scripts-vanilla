;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC03_SpaceEncounterQuest_001FE72F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
ALias_OutlawShipsAll.SetValue(Aggression, 2)
ALias_OutlawShipsAll.AddToFaction(PlayerEnemyFaction)

; Stop the outlaw ships from healing
Alias_Ship01.GetShipRef().EnablePartRepair(Health, false)
Alias_OutlawShipRookie01.GetShipRef().EnablePartRepair(Health, false)
Alias_OutlawShipRookie02.GetShipRef().EnablePartRepair(Health, false)

; Damage the outlaw ships in various amounts
float fBlastDamage01 = Alias_Ship01.GetShipRef().GetBaseValue(Health) * 0.4
Alias_Ship01.GetShipRef().DamageValue(Health, fBlastDamage01)

float fBlastDamage02 = Alias_OutlawShipRookie01.GetShipRef().GetBaseValue(Health) * 0.6
Alias_OutlawShipRookie01.GetShipRef().DamageValue(Health, fBlastDamage02)

float fBlastDamage03 = Alias_OutlawShipRookie02.GetShipRef().GetBaseValue(Health) * 0.5
Alias_OutlawShipRookie02.GetShipRef().DamageValue(Health, fBlastDamage03)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Ship01 Auto Const Mandatory

ReferenceAlias Property Alias_OutlawShipRookie01 Auto Const Mandatory

ReferenceAlias Property Alias_OutlawShipRookie02 Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

RefCollectionAlias Property Alias_OutlawShipsAll Auto Const Mandatory
