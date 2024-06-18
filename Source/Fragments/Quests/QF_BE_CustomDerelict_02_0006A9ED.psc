;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_CustomDerelict_02_0006A9ED Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const Mandatory

Keyword Property LocTypeBEDerelict Auto Const Mandatory
