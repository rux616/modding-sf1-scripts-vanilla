;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestMQ101SpaceEncounter_000153AC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;kill the ship
Alias_EnemyShip.GetShipref().Kill()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_BlackFleetShips Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip Auto Const Mandatory
