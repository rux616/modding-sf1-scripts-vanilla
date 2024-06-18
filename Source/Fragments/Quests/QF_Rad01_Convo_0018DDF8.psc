;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Rad01_Convo_0018DDF8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if Rad01_LIST.GetStageDone(290)
   SetObjectiveDisplayed(100)
else
   Rad01_LIST.SetStage(250)
endif

;Add aliases to factions based on location

if (CityCydoniaLocation == Alias_Actor1.GetActorRef().GetCurrentLocation())
  Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionUC)
  Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionUC)
elseif (StationTheDenLocation == Alias_Actor1.GetActorRef().GetCurrentLocation())
  Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionUC)
  Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionUC)
elseif (CityNewAtlantisLocation == Alias_Actor1.GetActorRef().GetCurrentLocation())
  Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionUC)
  Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionUC)
elseif (SettleHopeTownPitStopLocation == Alias_Actor1.GetActorRef().GetcurrentLocation())
  Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
elseif (CityAkilaCityStonerootInnLocation == Alias_Actor1.GetActorRef().GetcurrentLocation())
  Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
elseif (CityAkilaCityTheRockLocation == Alias_Actor1.GetActorRef().GetcurrentLocation())
  Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
  Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
elseif (SettleRedMileLocation == Alias_Actor1.GetActorRef().GetcurrentLocation())
  Alias_Actor1.GetActorRef().SetCrimeFaction(CrimeFactionRedMile)
  Alias_Actor2.GetActorRef().SetCrimeFaction(CrimeFactionRedMile)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
Rad01_LIST.SetStage(299)

if getstagedone(151)
  game.getplayer().removeitem(credits, Rad01_Convo_Credits.GetValueInt())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveFailed(100)
Rad01_LIST.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
if IsObjectiveCompleted(100) == false
   SetObjectiveSkipped(100)
endif
Alias_Actor1.TryToDisable()
Alias_Actor2.TryToDisable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Actor1 Auto Const Mandatory

ReferenceAlias Property Alias_Actor2 Auto Const Mandatory

Quest Property Rad01_LIST Auto Const Mandatory

MiscObject Property Credits Auto Const

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

GlobalVariable Property Rad01_Convo_Credits Auto Const Mandatory
