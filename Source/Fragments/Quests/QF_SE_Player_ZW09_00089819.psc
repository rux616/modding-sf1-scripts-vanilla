;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_ZW09_00089819 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
HailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE Utility_FAB_Script
Quest __temp = self as Quest
Utility_FAB_Script kmyQuest = __temp as Utility_FAB_Script
;END AUTOCAST
;BEGIN CODE
SpaceshipReference hailShip = Alias_HailingShip.GetRef() as SpaceshipReference
kmyQuest.ShipAttackPlayer(hailShip)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
PSE_zw09_ShipDestroyed.setValue(1)
utility.wait(6)
setstage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; When the hailing ship reaches its orbit destination (currently CenterMarker)
; it fast travels away.
utility.wait(4)
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.RestoreValue(PShipSystemGravDriveHealth, 1000)
utility.wait(2)
oTarg.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

GlobalVariable Property PSE_zw09_ShipDestroyed Auto Const Mandatory

Faction Property PPlayerEnemyFaction Auto Const Mandatory

ActorValue Property PShipSystemGravDriveHealth Auto Const Mandatory
