;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB10_00069F15 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 4)
Alias_TourEscort.GetShipRef().SetValue(DockingPermission, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
HailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
PSE_Player_FAB10_RunOnce.Setvalue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; If the hail is refused - then they bug out after a little bit of time
Utility.Wait(20)
SetStage(300)
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

oTarg = Alias_TourEscort.GetRef() as SpaceshipReference 
oTarg.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Alias_TourEscort.GetShipRef().AddToFaction(PPlayerEnemyFaction)
Alias_HailingShip.GetShipRef().AddToFaction(PPlayerEnemyFaction)

Alias_TourEscort.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef())
Alias_HailingShip.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ReferenceAlias Property Alias_TourEscort Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

Faction Property PPlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

GlobalVariable Property PSE_Player_FAB10_RunOnce Auto Const Mandatory
