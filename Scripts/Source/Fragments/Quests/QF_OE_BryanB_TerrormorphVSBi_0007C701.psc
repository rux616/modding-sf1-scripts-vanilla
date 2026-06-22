;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_BryanB_TerrormorphVSBi_0007C701 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
OE_KreetTerrormorphDone.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TravelToMarker Auto Const Mandatory

LocationAlias Property Alias_LocationToTravelTo Auto Const Mandatory

GlobalVariable Property OE_KreetTerrormorphDone Auto Const Mandatory
