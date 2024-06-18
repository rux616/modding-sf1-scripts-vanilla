;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TEST_E3Akila_000E5003 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_RangerMarker.GetRef().EnableNoWait()
Alias_GuardMarker.GetRef().EnableNoWait()
Alias_Helga.GetRef().DisableNoWait()
Alias_Mary.GetRef().DisableNoWait()
Alias_Ranger.GetRef().MoveTo(Alias_RangerMarker.GetRef())
Alias_Guard.GetRef().MoveTo(Alias_GuardMarker.GetRef())
Game.GetPlayer().MoveTo(Alias_RockEntrance.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
TEST_E3_AkilaCityConvoScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property TEST_E3_AkilaCityConvoScene Auto Const Mandatory

ReferenceAlias Property Alias_RangerMarker Auto Const Mandatory

ReferenceAlias Property Alias_GuardMarker Auto Const Mandatory

ReferenceAlias Property Alias_Ranger Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

ReferenceAlias Property Alias_RockEntrance Auto Const Mandatory

ReferenceAlias Property Alias_Mary Auto Const Mandatory

ReferenceAlias Property Alias_Helga Auto Const Mandatory
