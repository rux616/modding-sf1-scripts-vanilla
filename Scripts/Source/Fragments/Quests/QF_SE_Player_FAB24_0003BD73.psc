;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB24_0003BD73 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
HailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Food_Unpackaged)
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

oTarg = Alias_EscortShip.GetRef() as SpaceshipReference 
oTarg.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().AddToFaction(Pplayerenemyfaction)
Alias_EscortShip.GetShipRef().AddToFaction(Pplayerenemyfaction)

Alias_EscortShip.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef())
Alias_HailingShip.GetShipRef().StartCombat(Alias_PlayerShip.GetShipRef())

Utility.Wait(5)
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ReferenceAlias Property Alias_EscortShip Auto Const Mandatory

ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const Mandatory

SpaceshipBase Property EncShip_Hopetech_A_Watchdog01_Template Auto Const

LeveledItem Property LL_Food_Unpackaged Auto Const Mandatory

Faction Property PPlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory
