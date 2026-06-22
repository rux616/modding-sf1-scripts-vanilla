;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Rad01_MoveRefs_00134484 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Debug.MessageBox("Hello")

;Add aliases to factions based on location

if (CityCydoniaLocation == Alias_Secretary.GetActorRef().GetCurrentLocation())
  Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionUC)
elseif (StationTheDenLocation == Alias_Secretary.GetActorRef().GetCurrentLocation())
  Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionUC)
elseif (CityNewAtlantisLocation == Alias_Secretary.GetActorRef().GetCurrentLocation())
 Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionUC)
elseif (SettleHopeTownPitStopLocation == Alias_Secretary.GetActorRef().GetcurrentLocation())
  Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
elseif (CityAkilaCityStonerootInnLocation == Alias_Secretary.GetActorRef().GetcurrentLocation())
  Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
elseif (CityAkilaCityTheRockLocation == Alias_Secretary.GetActorRef().GetcurrentLocation())
  Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
elseif (SettleRedMileLocation == Alias_Secretary.GetActorRef().GetcurrentLocation())
  Alias_Secretary.GetActorRef().SetCrimeFaction(CrimeFactionRedMile)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property CrimeFactionUC Auto Const

Location Property CityCydoniaLocation Auto Const

Location Property StationTheDenLocation Auto Const

Location Property CityNewAtlantisLocation Auto Const

Location Property SettleHopeTownPitStopLocation Auto Const

Faction Property CrimeFactionFreestar Auto Const

Location Property CityAkilaCityStonerootInnLocation Auto Const

Location Property CityAkilaCityTheRockLocation Auto Const

Location Property SettleRedMileLocation Auto Const

Faction Property CrimeFactionRedMile Auto Const

ReferenceAlias Property Alias_Secretary Auto Const Mandatory
