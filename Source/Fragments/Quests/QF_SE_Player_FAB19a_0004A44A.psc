;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB19a_0004A44A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Move the Juno to this space cell and make it hostile
ObjectReference oTarg = Alias_GeneralMarker03.GetRef()
SpaceshipReference oJuno = Alias_Juno.GetRef() as SpaceshipReference
oJuno.Enable()
oJuno.MoveTo(oTarg)
oJuno.SetValue(Aggression, 3.0)
oJuno.StartCombat(Alias_PlayerShip.GetRef() as SpaceshipReference)
oJuno.SetValue(DockingPermission, 4)

;remove ghost and essential status from Juno_ship
Alias_Juno.GetShipRef().SetGhost(false)
Alias_Juno.GetShipRef().IsEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Initial scene plays
Utility.Wait(5.0)
SE_Player_FAB19a_100_JunoBarks.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SE_Player_FAB19a_100_JunoBarks Auto Const Mandatory

ReferenceAlias Property Alias_PatrolStartMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_Juno Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ReferenceAlias Property Alias_GeneralMarker03 Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory
