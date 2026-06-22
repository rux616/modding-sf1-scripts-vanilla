;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Akila_Jansen_MilenaS_001A8B65 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Move the Dalliance (a unique ship) to its location
Alias_MilenaShip.GetRef().MoveTo(Alias_DallianceMapMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; When the ships are destroyed - Milena says something
City_Akila_Jansen_MilenaSpace_500_EnemiesDown.Start()

; Let the main quest know it's been resolved
City_Akila_Jansen.SetStage(300)

; Allow docking
Alias_MilenaShip.GetShipRef().SetValue(DockingPermission, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Scene Property City_Akila_Jansen_MilenaSpace_500_EnemiesDown Auto Const Mandatory

ReferenceAlias Property Alias_MilenaAxelrod Auto Const Mandatory

ReferenceAlias Property Alias_MileaShipCaptainMarker Auto Const Mandatory

Quest Property City_Akila_Jansen Auto Const Mandatory

ReferenceAlias Property Alias_MilenaShip Auto Const Mandatory

ReferenceAlias Property Alias_DallianceMapMarker Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory
