;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC08SpaceEnc01_0038DB7B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SpaceShipReference ShipREF = Alias_Ship01.GetRef() as SpaceshipReference
ShipREF.SetValue(Aggression, 2)
ShipREF.AddToFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Ship01 Auto Const Mandatory
