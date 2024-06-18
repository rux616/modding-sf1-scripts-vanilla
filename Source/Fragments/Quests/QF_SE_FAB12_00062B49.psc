;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_FAB12_00062B49 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
PHailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
SpaceshipReference HailingShip = Alias_HailingShip.GetShipRef()
SpaceshipReference SecurityShip = Alias_SecurityShip.GetShipRef()

HailingShip.AddtoFaction(PlayerEnemyFaction)
HailingShip.SetValue(Aggression, 1)
SecurityShip.AddtoFaction(PlayerEnemyFaction)
SecurityShip.SetValue(Aggression, 1)
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
oTarg.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property PHailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_SecurityShip Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory
