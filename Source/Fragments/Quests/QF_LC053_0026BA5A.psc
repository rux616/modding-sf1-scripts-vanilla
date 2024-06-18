;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC053_0026BA5A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SpaceshipReference WingmanRef = Alias_RangerWingman01.GetShipReference()
WingmanRef.EnableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_FirstShipA01.TryToEnable()
Alias_FirstShipA02.TryToEnable()
Alias_FirstShipA03.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_FirstShipA01 Auto Const Mandatory

ReferenceAlias Property Alias_FirstShipA02 Auto Const Mandatory

ReferenceAlias Property Alias_ShipSpawnMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_FirstShipA03 Auto Const Mandatory

ReferenceAlias Property Alias_RangerWingman01 Auto Const Mandatory
