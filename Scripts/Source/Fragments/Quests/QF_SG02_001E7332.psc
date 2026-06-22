;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SG02_001E7332 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Move Alban to his farm
Actor AlACT = Alias_AlbanLopez.GetActorRef()
ObjectReference AlMarker = Alias_AlbanInitialMarker.GetRef()
AlACT.MoveTo(AlMarker)

; Start up the satellite message
SetStage(100)

; Turn off all the Map Markers you don't need yet
Alias_Spacers01_MapMarker.GetRef().Disable()
Alias_Spacers02_MapMarker.GetRef().Disable()
Alias_SpacersStation_MapMarker.GetRef().Disable()
Alias_SatelliteMapMarker_Alban.GetRef().Disable()
Alias_SatelliteMapMarker_Banda.GetRef().Disable()
Alias_SatelliteMapMarker_Lemaire.GetRef().Disable()
Alias_SatelliteMapMarker_Wen.GetRef().Disable()
Alias_MapMarker_Rendezvous.GetRef().Disable()

; Move Jacquelyn's ship from its holding cell to the meetup cell
Alias_LemaireShip.GetRef().MoveTo(Alias_LemaireShipMarker.GetRef())

; Start up the generic dialogue for Alban's Farm (post quest)
SG02_AlbanFarmDialogue.Start()
SG02_AlbanFarm.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Alias_WenSatellite.RefillAlias()
Alias_AlbanMarker.RefillAlias()
Alias_ChandaMarker.RefillAlias()
Alias_JackieMarker.RefillAlias()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Alias_AlbanLopez.GetRef().MoveTo(Alias_AlbanMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SG02_0775_ApproachOverhear.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(1000)
Game.GetPlayer().MoveTo(Alias_AlbanMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

; Play the distress call
SG02_0100_DistressCall.Start()

; Flag it explored so you see the name
Alias_AlbanFarmLocation.GetLocation().SetExplored(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
; Stop the distress call
SG02_0100_DistressCall.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Refill all the aliases
Alias_BandaSatellite.RefillAlias()
Alias_LemaireSatellite.RefillAlias()
Alias_WenSatellite.RefillAlias()
Alias_AlbanSatellite.RefillAlias()

; Getting the Enemies to spawn at the Satellites
Alias_AlbanSatelliteEnemies.EnableAll()
Alias_BandaSatelliteEnemies.EnableAll()

; Enable the Map Marker
Alias_SatelliteMapMarker_Alban.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(400)
SetObjectiveDisplayed(500)
SetObjectiveDisplayed(600)

; Fix the satellite
Alias_AlbanSatellite.GetRef().ClearDestruction()
QST_SG02_SatelliteRepair.Play(Game.GetPlayer())

; After you've fixed it - block activation
Alias_AlbanSatellite.GetRef().BlockActivation()

; After you fix the satellite
SG02_0300_FixedAlbanSatellite.Start()

; Enable the other map markers
Alias_SatelliteMapMarker_Banda.GetRef().Enable()
Alias_SatelliteMapMarker_Lemaire.GetRef().Enable()
Alias_SatelliteMapMarker_Wen.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SG02_0500_FixedBandaSatellite.Stop()
SG02_0600_FixedWenSatellite.Stop()

SetObjectiveCompleted(400)

; Fix the satellite
Alias_LemaireSatellite.GetRef().ClearDestruction()
QST_SG02_SatelliteRepair.Play(Game.GetPlayer())

; After you've fixed it - block activation
Alias_LemaireSatellite.GetRef().BlockActivation()

; If all the satellites are repaired - progress
if ( GetStageDone(500) && GetStageDone(600) )
  SetStage(700)
endif

; Play the associated scene
SG02_0400_FixedLemaireSatellite.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
; Have the Spacers come in
int i = 0
while i < Alias_LemaireSatelliteEnemies.GetCount()
  ObjectReference theRef = Alias_LemaireSatelliteEnemies.GetAt(i)
  if theRef
    (theRef as SpaceshipReference).EnableWithGravJump()
  endif
  i += 1		
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SG02_0400_FixedLemaireSatellite.Stop()
SG02_0600_FixedWenSatellite.Stop()

SetObjectiveCompleted(500)

; Fix the satellite
Alias_BandaSatellite.GetRef().ClearDestruction()
QST_SG02_SatelliteRepair.Play(Game.GetPlayer())

; After you've fixed it - block activation
Alias_BandaSatellite.GetRef().BlockActivation()

; If all the satellites are repaired - progress
if ( GetStageDone(400) && GetStageDone(600) )
  SetStage(700)
endif

; Play the associated scene
SG02_0500_FixedBandaSatellite.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SG02_0400_FixedLemaireSatellite.Stop()
SG02_0500_FixedBandaSatellite.Stop()

SetObjectiveCompleted(600)

; Fix the satellite
Alias_WenSatellite.GetRef().ClearDestruction()
QST_SG02_SatelliteRepair.Play(Game.GetPlayer())

; After you've fixed it - block activation
Alias_WenSatellite.GetRef().BlockActivation()

; If all the satellites are repaired - progress
if ( GetStageDone(400) && GetStageDone(500) )
  SetStage(700)
endif

; Play the associated scene
SG02_0600_FixedWenSatellite.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(700)

; Move everyone to the ship
ObjectReference oTarg = Alias_AlbanLopez.GetRef()
oTarg.MoveTo(oTarg.GetLinkedRef(SG02FamilyShipMeetupKeyword))
oTarg = Alias_ChandaBanda.GetRef()
oTarg.MoveTo(oTarg.GetLinkedRef(SG02FamilyShipMeetupKeyword))
oTarg = Alias_JacquelynLemaire.GetRef()
oTarg.MoveTo(oTarg.GetLinkedRef(SG02FamilyShipMeetupKeyword))

; Enable the Map Marker to the rendezvous
Alias_MapMarker_Rendezvous.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0775_Item_00
Function Fragment_Stage_0775_Item_00()
;BEGIN CODE
; Talk the scene
SG02_0775_ApproachOverhear.Start()

; Do some objective sleight of hand
SetObjectiveDisplayed(780)
SetObjectiveDisplayed(700, FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0780_Item_00
Function Fragment_Stage_0780_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(780)
SetObjectiveDisplayed(700)

; Make Jackie and Banda move
Alias_ChandaBanda.GetActorRef().EvaluatePackage()
Alias_JacquelynLemaire.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
Actor ChandaACT = Alias_ChandaBanda.GetActorRef()
Actor JackyACT = Alias_JacquelynLemaire.GetActorRef()
ChandaACT.EvaluatePackage()
JackyACT.EvaluatePackage()

SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)
SetObjectiveDisplayed(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0825_Item_00
Function Fragment_Stage_0825_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(875)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
SetObjectiveCompleted(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; If you haven't dealt with Lemaire - remove the objective
if ( !GetStageDone(850) )
  SetObjectiveDisplayed(850, FALSE)
endif

SetObjectiveCompleted(875)
SetObjectiveDisplayed(900)
SetObjectiveDisplayed(950)

; Refill aliases of spacer ships
Alias_SpacerContact01Group.RefillAlias()
Alias_Spacers01.RefillAlias()
Alias_SpacerContact02Group.RefillAlias()
Alias_Spacers02.RefillAlias()

; Enable the Map Markers
Alias_Spacers01_MapMarker.GetRef().Enable()
Alias_Spacers02_MapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
SetObjectiveFailed(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0930_Item_00
Function Fragment_Stage_0930_Item_00()
;BEGIN CODE
SetStage(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)

; Move the people to Alban's farm
Alias_AlbanLopez.GetRef().MoveTo(Alias_AlbanMarker.GetRef())
Alias_ChandaBanda.GetRef().MoveTo(Alias_ChandaMarker.GetRef())

; Move Jackie only if she is part of the Defense Pact
if ( GetStageDone(850) )
  Alias_JacquelynLemaire.GetRef().MoveTo(Alias_JackieMarker.GetRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1005_Item_00
Function Fragment_Stage_1005_Item_00()
;BEGIN CODE
; Enable all the allies (if they're coming)

int i = 0
; If no one is helping, then bypass the enable
if ( !GetStageDone(950) )
  i=99
endif

; Check to see if the Lemaire's are on board
bool bLemaire = GetStageDone(850)

while i < Alias_Spacers01_Allies.GetCount()
  SpaceshipReference theRef = Alias_Spacers01_Allies.GetAt(i) as SpaceshipReference 
  if theRef
    ; If Lemaire is on board - just enable everyone
    ; Otherwise - only Lemaire's ship has Gen03
    if ( bLemaire || !theRef.HasLocRefType(AutofillGeneric03) )
      theRef.EnableWithGravJump()
    endif
  endif
  i += 1		
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)

; If the other group is killed - advance the quest
if ( GetStageDone(1020) )
  SetStage(1000)
endif

; If the player has backup, they react
if ( GetStageDone(950) ) && Alias_Spacers01_Allies.GetCount() > 0
  SG02_Reaction_1010_Spacers01Killed.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1015_Item_00
Function Fragment_Stage_1015_Item_00()
;BEGIN CODE
; Enable all the allies (if they're coming)

int i = 0
; If no one is helping, then bypass the enable
if ( !GetStageDone(950) )
  i=99
endif

; Check to see if the Lemaire's are on board
bool bLemaire = GetStageDone(850)

while i < Alias_Spacers02_Allies.GetCount()
  SpaceshipReference theRef = Alias_Spacers02_Allies.GetAt(i) as SpaceshipReference 
  if theRef
    ; If Lemaire is on board - just enable everyone
    ; Otherwise - only Lemaire's ship has Gen03
    if ( bLemaire || !theRef.HasLocRefType(AutofillGeneric03) )
      theRef.EnableWithGravJump()
    endif
  endif
  i += 1		
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1020_Item_00
Function Fragment_Stage_1020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(950)

; If the other group is killed - advance the quest
if ( GetStageDone(1010) )
  SetStage(1000)
endif

; If the player has backup, they react
if ( GetStageDone(950) ) && Alias_Spacers02_Allies.GetCount() > 0
  SG02_Reaction_1020_Spacers02Killed.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)

;Block the station's boarding
(Alias_Starstation.GetRef() as SpaceshipReference).SetValue(DockingPermission, 4)

; Enable the last map marker
Alias_SpacersStation_MapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
; Enable all the allies (if they're coming)
int i = 0

; Check to see if the Lemaire's are on board
bool bLemaire = GetStageDone(850)
; Check to see if the allies were already used
bool bNoReserves = GetStageDone(950)
bool bEnable

while i < Alias_SpacersStation_Allies.GetCount()
  SpaceshipReference theRef = Alias_SpacersStation_Allies.GetAt(i) as SpaceshipReference 
  if theRef
    bEnable = TRUE  ; By default - enable the allies
    ; If the Lemaires aren't in the alliance (Gen03) then they don't show up
    if ( !bLemaire && theRef.HasLocRefType(AutofillGeneric03) )
      bEnable = FALSE
    endif

    ; If the player already used the families' ships, some won't be here
    if ( bNoReserves  && theRef.HasLocRefType(AutofillGeneric04) )
      bEnable = FALSE
    endif

    if ( bEnable )
      theRef.EnableWithGravJump()
    endif

  endif
  i += 1		
endWhile

;TURNING THIS OFF - Pacing this based on the first group dying
; In 45 seconds more guys spawn in
;Utility.Wait(45.0)
;SetStage(1175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1175_Item_00
Function Fragment_Stage_1175_Item_00()
;BEGIN CODE
; Chanda Banda announces what's going on
SG02_Reaction_1175_Reinforcements.Start()

; For the disabled enemies - spawn them in
int i = 0

while i <= Alias_StationSpacers_Group02.GetCount()
  SpaceshipReference theRef = Alias_SpacersStation.GetAt(i) as SpaceshipReference 
  if theRef
    if ( !theRef.IsEnabled() )
      theRef.EnableWithGravJump()
    endif
  endif
  i += 1		
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)

; Alban Lopez reacts
SG02_Reaction_1200_StationShipsKilled.Start()

; After all the spacers outside are killed - port in the family where they belong
Actor oTarg = Alias_AlbanLopez.GetActorRef()
oTarg.MoveTo(Alias_AlbanFightMarker.GetRef())
oTarg = Alias_ChandaBanda.GetActorRef()
oTarg.MoveTo(Alias_BandaFightMarker.GetRef())
oTarg.IgnoreFriendlyHits()

;Remove this is we turn the assassination option back on
oTarg = Alias_AlbanLopez.GetActorRef()
oTarg.IgnoreFriendlyHits()

; Is Jackie in the alliance?
if ( GetStageDone(850) )
  oTarg = Alias_JacquelynLemaire.GetActorRef()
  oTarg.MoveTo(Alias_JackieFightMarker.GetRef())
  oTarg.IgnoreFriendlyHits()

;Turning off the assassination option for time
;If we turn back on, we should reassess when this happens
;We only want Alban to be ignore friendly hits if the Lemare's not here 
;(since the player should be able to assassinate him)
;else
;  oTarg = Alias_AlbanLopez.GetActorRef()
;  oTarg.IgnoreFriendlyHits()
endif

int i = 0
int iCount = Alias_StationNPCs_Settlers.GetCount()

while i < iCount
  Actor currAct = Alias_StationNPCs_Settlers.GetAt(i) as Actor
  currAct.IgnoreFriendlyHits()

  i += 1
endwhile

Game.GetPlayer().AddtoFaction(SG02_PlayerAllyFaction)

;Unblock boarding the station
(Alias_Starstation.GetRef() as SpaceshipReference).SetValue(DockingPermission, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
;Turning off unless we end up with more time to polish this
; If you sided with Jackie - she makes a special request
;if ( GetStageDone(850) )
;  SetObjectiveDisplayed(1210)
;  SG02_1210_JackieBark.Start()
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1220_Item_00
Function Fragment_Stage_1220_Item_00()
;BEGIN CODE
; Flag you've talked with Jackie
SetStage(1240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1230_Item_00
Function Fragment_Stage_1230_Item_00()
;BEGIN CODE
; Flag you've talked with Jackie
SetStage(1240)

SetObjectiveDisplayed(1250)

; Alban can be killed now
Alias_AlbanLopez.GetActorRef().SetEssential(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1240_Item_00
Function Fragment_Stage_1240_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(SG02_PlayerAllyFaction)

SetObjectiveCompleted(1200)
; Did you kill Alban - if so different quest turn in
if ( GetStageDone(1250) )
  SetObjectiveDisplayed(1500)
else
  SetObjectiveDisplayed(1400)
endif

; If the player was considering killing Alban, the window is over
if ( GetStageDone(1230) && !GetStageDone(1250) )
  ; Alban is safe again
  Alias_AlbanLopez.GetActorRef().SetEssential(TRUE)
  SetObjectiveDisplayed(1250, FALSE)
endif

; Move the family close to the end so you don't have to backtrack
ObjectReference oTarg = Alias_AlbanLopez.GetRef()
oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom09))
oTarg = Alias_ChandaBanda.GetRef()
oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom09))

; Is Jackie in the alliance?
if ( GetStageDone(850) )
  oTarg = Alias_JacquelynLemaire.GetRef()
  oTarg.MoveTo(oTarg.GetLinkedRef(LinkCustom09))
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; NOTE: The quest stops when the player leaves the Starstation
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Start the denouement scene
SG02_1500a_ChandaJackieConflict.Start()

; NOTE: The quest stops when the player leaves the Starstation
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Move Alban to his farm
if ( GetStageDone(1400) )
  Alias_AlbanLopez.GetRef().MoveTo(Alias_AlbanMarker.GetRef())
endif

; Flag this quest as having been completed for NewGame+
Game.GetPlayer().SetValue(SG02_ForeknowledgeAV, 1.0)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SG02_0100_DistressCall Auto Const Mandatory

ReferenceAlias Property Alias_AlbanLopez Auto Const Mandatory

ReferenceAlias Property Alias_AlbanMarker Auto Const Mandatory

Scene Property SG02_0300_FixedAlbanSatellite Auto Const Mandatory

ReferenceAlias Property Alias_WenSatellite Auto Const Mandatory

ReferenceAlias Property Alias_LemaireSatellite Auto Const Mandatory

ReferenceAlias Property Alias_BandaSatellite Auto Const Mandatory

ReferenceAlias Property Alias_AlbanSatellite Auto Const Mandatory

Scene Property SG02_0400_FixedLemaireSatellite Auto Const Mandatory

Scene Property SG02_0500_FixedBandaSatellite Auto Const Mandatory

Scene Property SG02_0600_FixedWenSatellite Auto Const Mandatory

ReferenceAlias Property Alias_LemaireCaptainMarker Auto Const Mandatory

ReferenceAlias Property Alias_ChandaBanda Auto Const Mandatory

ReferenceAlias Property Alias_JacquelynLemaire Auto Const Mandatory

Scene Property SG02_0775_ApproachOverhear Auto Const Mandatory

RefCollectionAlias Property Alias_Spacers01 Auto Const Mandatory

RefCollectionAlias Property Alias_Spacers02 Auto Const Mandatory

RefCollectionAlias Property Alias_SpacerContact01Group Auto Const Mandatory

RefCollectionAlias Property Alias_SpacerContact02Group Auto Const Mandatory

ReferenceAlias Property Alias_ChandaMarker Auto Const Mandatory

ReferenceAlias Property Alias_JackieMarker Auto Const Mandatory

Keyword Property SG02FamilyShipMeetupKeyword Auto Const Mandatory

RefCollectionAlias Property Alias_Spacers01_Allies Auto Const Mandatory

RefCollectionAlias Property Alias_Spacers02_Allies Auto Const Mandatory

LocationRefType Property AutofillGeneric03 Auto Const Mandatory

RefCollectionAlias Property Alias_SpacersStation_Allies Auto Const Mandatory

LocationRefType Property AutofillGeneric04 Auto Const Mandatory

RefCollectionAlias Property Alias_SpacersStation Auto Const Mandatory

Keyword Property SG02FinaleKeyword Auto Const Mandatory

Scene Property SG02_1210_JackieBark Auto Const Mandatory

Scene Property SG02_1500a_ChandaJackieConflict Auto Const Mandatory

LocationAlias Property Alias_AlbanFarmLocation Auto Const Mandatory

RefCollectionAlias Property Alias_AlbanSatelliteEnemies Auto Const Mandatory

RefCollectionAlias Property Alias_BandaSatelliteEnemies Auto Const Mandatory

RefCollectionAlias Property Alias_LemaireSatelliteEnemies Auto Const Mandatory

ReferenceAlias Property Alias_SatelliteMapMarker_Alban Auto Const Mandatory

ReferenceAlias Property Alias_SatelliteMapMarker_Banda Auto Const Mandatory

ReferenceAlias Property Alias_SatelliteMapMarker_Lemaire Auto Const Mandatory

ReferenceAlias Property Alias_SatelliteMapMarker_Wen Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker_Rendezvous Auto Const Mandatory

ReferenceAlias Property Alias_SpacersStation_MapMarker Auto Const Mandatory

ReferenceAlias Property Alias_Spacers02_MapMarker Auto Const Mandatory

ReferenceAlias Property Alias_Spacers01_MapMarker Auto Const Mandatory

ReferenceAlias Property Alias_LemaireShip Auto Const Mandatory

ReferenceAlias Property Alias_LemaireShipMarker Auto Const Mandatory

ReferenceAlias Property Alias_Starstation Auto Const Mandatory

ReferenceAlias Property Alias_StarstationPlacementMarker Auto Const Mandatory

ActorValue Property SG02_ForeknowledgeAV Auto Const Mandatory

Scene Property SG02_Reaction_1175_Reinforcements Auto Const Mandatory

Scene Property SG02_Reaction_1200_StationShipsKilled Auto Const Mandatory

Scene Property SG02_Reaction_1010_Spacers01Killed Auto Const Mandatory

Scene Property SG02_Reaction_1020_Spacers02Killed Auto Const Mandatory

Quest Property SG02_AlbanFarmDialogue Auto Const Mandatory

Quest Property SG02_AlbanFarm Auto Const Mandatory

ReferenceAlias Property Alias_LemaireStationMarker Auto Const Mandatory

ReferenceAlias Property Alias_BandaStationMarker Auto Const Mandatory

ReferenceAlias Property Alias_AlbanStationMarker Auto Const Mandatory

Keyword Property LinkCustom09 Auto Const Mandatory

WwiseEvent Property QST_SG02_SatelliteRepair Auto Const Mandatory

RefCollectionAlias Property Alias_StationNPCs_Settlers Auto Const Mandatory

Faction Property SG02_PlayerAllyFaction Auto Const Mandatory

ReferenceAlias Property Alias_AlbanInitialMarker Auto Const Mandatory

RefCollectionAlias Property Alias_StationSpacers_Group02 Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

RefCollectionAlias Property Alias_InteriorEnemiesUpperFloor Auto Const Mandatory

ReferenceAlias Property Alias_AlbanFightMarker Auto Const Mandatory

ReferenceAlias Property Alias_BandaFightMarker Auto Const Mandatory

ReferenceAlias Property Alias_JackieFightMarker Auto Const Mandatory
