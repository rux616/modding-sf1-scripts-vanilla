;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_AC01_000850F4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
HailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
SpaceshipReference ShipRef = Alias_HailingShip.GetShipRef()
ShipRef.AddtoFaction(PlayerEnemyFaction)
ShipRef.SetValue(Aggression, 1)
ShipRef.StartCombat(Alias_PlayerShip.GetShipRef())
Setstage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
PSE_Player_AC01_RunOnce.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; When the hailing ship reaches its orbit destination (currently CenterMarker)
; it fast travels away.
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.SetGhost(true)
Utility.wait(3)
oTarg.DisableWithGravJump()
Alias_MapMarker.GetRef().DisableNoWait()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

GlobalVariable Property PSE_Player_AC01_RunOnce Auto Const Mandatory
