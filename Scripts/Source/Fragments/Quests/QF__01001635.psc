;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01001635 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_HailingShip.RefillAlias()
Attack01_100a_DefenderHailStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(InorgCommonHelium3, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, 350)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property Attack01_100a_DefenderHailStart Auto Const Mandatory

MiscObject Property InorgCommonHelium3 Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory
