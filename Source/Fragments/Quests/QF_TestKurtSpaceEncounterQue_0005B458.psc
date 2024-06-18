;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestKurtSpaceEncounterQue_0005B458 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SE_KMK01HailingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_PlayerShip.GetRef().RemoveItem(ShipRepairKit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SpaceshipReference HailingShip = Alias_Ship01.GetRef() as SpaceshipReference
HailingShip.DisableWithGravJumpNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

Potion Property ShipRepairKit Auto Const Mandatory

ReferenceAlias Property Alias_Ship01 Auto Const Mandatory

Scene Property SE_KMK01HailingScene Auto Const Mandatory
