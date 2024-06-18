;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_FAB17_0005072A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_Smuggler.GetShipRef().DisableWithGravJump()
SpaceshipReference ShipRef = Alias_HailingShip.GetShipRef()

ShipRef.AddtoFaction(PlayerEnemyFaction)
ShipRef.SetValue(Aggression, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
PHailTemplate_100a_Hailing.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the confrontation scene
Utility.wait(5)
SE_FAB17_050_InitialScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
SpaceshipReference SmugglerShip = Alias_Smuggler.GetShipRef()
SE_FAB17_050_InitialScene.Stop()
SmugglerShip.AddtoFaction(PlayerEnemyFaction)
SmugglerShip.SetValue(Aggression, 1)

Utility.Wait(2)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
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

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
SE_FAB17_050_InitialScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; The smuggler departs
SE_FAB17_050_InitialScene.Stop()
(Alias_Smuggler.GetRef() as SpaceshipReference).DisableWithGravJumpNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property PHailTemplate_100a_Hailing Auto Const Mandatory

Scene Property SE_FAB17_050_InitialScene Auto Const Mandatory

ReferenceAlias Property Alias_Smuggler Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory
