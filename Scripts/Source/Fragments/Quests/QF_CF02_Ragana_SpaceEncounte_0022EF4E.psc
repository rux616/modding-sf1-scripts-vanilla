;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF02_Ragana_SpaceEncounte_0022EF4E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_RaganaSpeechChallenge.ForceRefTo(Alias_Ship01.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SpaceShipReference ShipRaganaRef = Alias_Ship01.GetRef() as SpaceshipReference
SpaceShipReference ShipEscortRef = Alias_EscortShip.GetRef() as SpaceshipReference

ShipRaganaRef.SetValue(Aggression, 2)
ShipRaganaRef.AddToFaction(PlayerEnemyFaction)
ShipRaganaRef.SetValue(DockingPermission, 4)

ShipEscortRef.SetValue(Aggression, 2)
ShipEscortRef.AddToFaction(PlayerEnemyFaction)
ShipEscortRef.Startcombat(alias_PlayerShip.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
CF02.SetStage(520)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Ship01 Auto Const Mandatory

Quest Property CF02 Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

ReferenceAlias Property Alias_EscortShip Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ReferenceAlias Property Alias_RaganaSpeechChallenge Auto Const Mandatory
