;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_KT04_000251D1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
BE_KT04_AudioSlateSeries.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
BE_KT04_AudioSlateSeries.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
BE_KT04_AudioSlateSeries.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
BE_KT04_AudioSlateSeries.SetValue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_01
Function Fragment_Stage_0005_Item_01()
;BEGIN CODE
SetObjectiveDisplayed(10)
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_02
Function Fragment_Stage_0005_Item_02()
;BEGIN CODE
SetObjectiveDisplayed(10)
SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_03
Function Fragment_Stage_0005_Item_03()
;BEGIN CODE
SetObjectiveDisplayed(10)
SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_04
Function Fragment_Stage_0005_Item_04()
;BEGIN CODE
SetObjectiveDisplayed(10)
SetStage(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_05
Function Fragment_Stage_0005_Item_05()
;BEGIN CODE
SetStage(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
BE_KT04_AudioSlateSeries.SetValue(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
SetObjectiveFailed(10)
BE_KT04.SetObjectiveFailed(10)
Alias_MapMarker.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
ObjectReference[] FurnitureRef = Alias_CrewSpawnMarkers.GetArray()
int i = 0
while i < FurnitureRef.Length
    Alias_CrewWoundedMarkers.AddRef(FurnitureRef[i].PlaceAtMe(NPCWoundedLean))
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
Alias_MapMarker.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0)
HailTemplate_100a_KT04_HailStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveFailed(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_KT04_HailStart Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

GlobalVariable Property BE_KT04_AudioSlateSeries Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

GlobalVariable Property BE_KT04_Variant01 Auto Const Mandatory

GlobalVariable Property BE_KT04_Variant02 Auto Const Mandatory

GlobalVariable Property BE_KT04_Variant03 Auto Const Mandatory

GlobalVariable Property BE_KT04_Variant04 Auto Const Mandatory

RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const Mandatory

RefCollectionAlias Property Alias_CrewWoundedMarkers Auto Const Mandatory

Furniture Property NPCWoundedLean Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

Quest Property BE_KT04 Auto Const Mandatory
