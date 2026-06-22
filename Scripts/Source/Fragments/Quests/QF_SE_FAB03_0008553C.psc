;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_FAB03_0008553C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Let's damage the ship on spawn (all systems offline, and won't repair)
SpaceshipReference sTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
ActorValue avSystem = ShipSystemEngineHealth
sTarg.EnablePartRepair(avSystem, 0)
sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))

avSystem = ShipSystemGravDriveHealth
sTarg.EnablePartRepair(avSystem, 0)
sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))

avSystem = ShipSystemReactorHealth
sTarg.EnablePartRepair(avSystem, 0)
sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))

avSystem = ShipSystemShieldsHealth
sTarg.EnablePartRepair(avSystem, 0)
sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))

avSystem = ShipSystemWeaponGroup1Health
sTarg.EnablePartRepair(avSystem, 0)
sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))

avSystem = ShipSystemWeaponGroup2Health
sTarg.EnablePartRepair(avSystem, 0)
sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))

avSystem = ShipSystemWeaponGroup3Health
sTarg.EnablePartRepair(avSystem, 0)
sTarg.DamageValue(avSystem, sTarg.GetValue(avSystem))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
PHailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; After 30 seconds all of the ship systems are brought back online
Utility.Wait(4.0)

SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; The ship now goes hostile
SpaceshipReference sTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
sTarg.StartCombat(Alias_PlayerShip.GetRef() as SpaceshipReference)
sTarg.AddToFaction(PPlayerEnemyFaction)

; Repair all the systems
ActorValue avSystem = ShipSystemEngineHealth
sTarg.EnablePartRepair(avSystem, 1.0)
sTarg.RestoreValue(avSystem, 100.0)

avSystem = ShipSystemReactorHealth
sTarg.EnablePartRepair(avSystem, 1.0)
sTarg.RestoreValue(avSystem, 100.0)

avSystem = ShipSystemShieldsHealth
sTarg.EnablePartRepair(avSystem, 1.0)
sTarg.RestoreValue(avSystem, 100.0)

avSystem = ShipSystemWeaponGroup1Health
sTarg.EnablePartRepair(avSystem, 1.0)
sTarg.RestoreValue(avSystem, 100.0)

avSystem = ShipSystemWeaponGroup2Health
sTarg.EnablePartRepair(avSystem, 1.0)
sTarg.RestoreValue(avSystem, 100.0)

avSystem = ShipSystemWeaponGroup3Health
sTarg.EnablePartRepair(avSystem, 1.0)
sTarg.RestoreValue(avSystem, 100.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
; Repair shields
SpaceshipReference sTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
ActorValue avSystem = ShipSystemShieldsHealth
sTarg.EnablePartRepair(avSystem, 1.0)
sTarg.RestoreValue(avSystem, 100.0)
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

Scene Property PHailTemplate_100a_Hailing Auto Const Mandatory

ActorValue Property ShipSystemEngineHealth Auto Const Mandatory

ActorValue Property ShipSystemGravDriveHealth Auto Const Mandatory

ActorValue Property ShipSystemReactorHealth Auto Const Mandatory

ActorValue Property ShipSystemShieldsHealth Auto Const Mandatory

ActorValue Property ShipSystemWeaponGroup1Health Auto Const Mandatory

ActorValue Property ShipSystemWeaponGroup2Health Auto Const Mandatory

ActorValue Property ShipSystemWeaponGroup3Health Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

Faction Property PPlayerEnemyFaction Auto Const Mandatory
