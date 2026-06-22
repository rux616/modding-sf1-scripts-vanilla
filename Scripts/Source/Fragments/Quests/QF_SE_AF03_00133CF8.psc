;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_AF03_00133CF8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 3)
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

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SpaceshipReference currShip = Alias_HailingShip.getShipref()

currShip.addtofaction(PlayerEnemyFaction)
currShip.addtofaction(EclipticFaction)
currShip.SetCrimeFaction(None)
currShip.removefromfaction(CitizenShipFactionUC)
currShip.removefromfaction(CitizenShipFactionFreestar)
currShip.StartCombat(Alias_PlayerShip.GetShipReference())
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Faction Property EclipticFaction Auto Const

Faction Property PlayerEnemyFaction Auto Const

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

Faction Property CitizenShipFactionUC Auto Const Mandatory

Faction Property CitizenShipFactionFreestar Auto Const Mandatory
