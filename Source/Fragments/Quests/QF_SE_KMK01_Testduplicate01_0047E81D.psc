;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_KMK01_Testduplicate01_0047E81D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_PlayerShip.GetRef().RemoveItem(ShipRepairKit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
TestKurtShipDeathKeyword.SendStoryEvent(NONE, Alias_Ship01.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

Potion Property ShipRepairKit Auto Const Mandatory

ReferenceAlias Property Alias_Ship01 Auto Const Mandatory

Keyword Property TestKurtShipDeathKeyword Auto Const Mandatory
