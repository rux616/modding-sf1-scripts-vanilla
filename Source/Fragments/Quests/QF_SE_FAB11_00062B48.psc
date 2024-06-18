;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_FAB11_00062B48 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
PHailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; When the hailing ship reaches its orbit destination (currently CenterMarker)
; it fast travels away.
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().AddToFaction(Pplayerenemyfaction)
Alias_SecurityShip.GetShipRef().AddToFaction(Pplayerenemyfaction)

Alias_SecurityShip.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef())
Alias_HailingShip.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property PHailTemplate_100a_Hailing Auto Const Mandatory

Faction Property PPlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_SecurityShip Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory
