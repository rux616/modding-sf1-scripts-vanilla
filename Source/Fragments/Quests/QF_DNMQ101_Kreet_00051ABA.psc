;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DNMQ101_Kreet_00051ABA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;enable pirates at shelter
;ShelterPirates.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;enable pirates coming out of base
;LandingDockPirates.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;enable cafeteria pirates
cafeteriaPirates.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;enable Lab 1 Pirates
Lab1Pirates.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;enable Lab 2 Pirates
Lab2Pirates.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;enable roof Pirates
RoofPirates.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;enable pirate ship if there's combat on the roof
Alias_LandingShip.TryToEnable()
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ShelterPirates Auto Const

ObjectReference Property LandingDockPirates Auto Const

ObjectReference Property CafeteriaPirates Auto Const

ObjectReference Property Lab1Pirates Auto Const

ObjectReference Property Lab2Pirates Auto Const

ObjectReference Property RoofPirates Auto Const

ObjectReference Property RoofShipMarker Auto Const

ReferenceAlias Property Alias_LandingShip Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory
