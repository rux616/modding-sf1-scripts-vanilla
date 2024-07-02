;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update06_002F0FE9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
;CREW_EliteCrew_LyleBrower - Removes Lyle from CrimeFactionFreestar and stops combat alert if he's on the playership
Actor Lyle = Alias_LyleBrewer.GetActorRef()
Location PlayerShip = Alias_PlayerShipIntLoc.GetLocation()

Lyle.RemoveFromFaction(FreestarCrime)
if Lyle.GetCurrentLocation() == PlayerShip
  Lyle.StopCombatAlarm()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_LyleBrewer Auto Const Mandatory

LocationAlias Property Alias_PlayerShipIntLoc Auto Const Mandatory

Faction Property FreestarCrime Auto Const
