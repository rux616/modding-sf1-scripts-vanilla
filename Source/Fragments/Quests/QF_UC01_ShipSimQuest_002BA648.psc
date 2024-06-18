;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC01_ShipSimQuest_002BA648 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
ObjectReference myShip = Alias_BleedoutTestShip.GetRef()
myShip.Enable()
Alias_ActiveEnemy.ForceRefTo(myShip)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
if Game.UsingGamepad()
  UC01_ShipSim_ExitPilotSeat_Controller.ShowAsHelpMessage("", afDuration = 5, afInterval=0, aiMaxTimes=1)
else
  UC01_ShipSim_ExitPilotSeat.ShowAsHelpMessage("", afDuration = 5, afInterval=0, aiMaxTimes=1)
endIf

UC01_PilotSeatGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE uc01_shipsimulationquestscript
Quest __temp = self as Quest
uc01_shipsimulationquestscript kmyQuest = __temp as uc01_shipsimulationquestscript
;END AUTOCAST
;BEGIN CODE
debug.trace("Sim Ship Spawn is in cell: " + Alias_StartMarker.GetRef().GetParentCell())

;If the player's heard the intro before, close that off before things get started
if UC01_ShipSim_HeardIntroOnce.GetValue() >= 1.0
  SetStage(130)
endif

;Close interior door if left open from previous use
Alias_ShipInteriorDoor.GetRef().SetOpen(false)

ObjectReference SimREF = Alias_SimShip.GetRef()
debug.trace("Sim Ship is in cell: " + SimREF.GetParentCell())
Actor PlayerREF = Game.GetPlayer()
PlayerREF.AddPerk(UC01_PilotingPerk)
PlayerREF.MoveTo(Alias_TeleportMarker.GetRef())
debug.trace("Sim Ship is in cell: " + SimREF.GetParentCell())
kmyquest.SimShipEnablePlayer = InputEnableLayer.Create()
kmyquest.SimShipEnablePlayer.EnableMenu(false)
kmyquest.SimShipEnablePlayer.EnableFastTravel(false)
kmyquest.SimShipEnablePlayer.EnableGravJump(false)
kmyquest.SimShipEnablePlayer.EnableFarTravel(false)
kmyquest.SimShipEnablePlayer.EnableLocationDiscovery(false)

WwiseEvent_QST_UC01_PlayerInSimulator_True.Play(PlayerREF)

if UC01.IsRunning() && !UC01.GetStageDone(590) && !UC01.GetStageDone(600)
  UC01.SetStage(590)
endif

if UC01.IsRunning()
  UC01.SetActive(false)
endif

SetActive()
SetObjectiveDisplayed(100)

if !UC01.GetStageDone(1000)
    Alias_Proctor.GetRef().MoveTo(Alias_ProctorMarker.GetRef())
endif

;Teleport followers to wait marker
Actor[] teleportedFollowers = AvailableCompanions.GetActorArray()
int i = 0
while i < teleportedFollowers.Length
    if teleportedFollowers[i].IsinFaction(CurrentCompanionFaction) || teleportedFollowers[i].IsinFaction(AvailableCrewFaction) 
        if teleportedFollowers[i].GetValue(FollowerState) != 2
          Alias_Companions.AddRef(teleportedFollowers[i])
        endif
    endif
    i += 1
endWhile

Actor [] eligibleCompanions = Alias_Companions.GetActorArray()
if eligibleCompanions != None
    SQ_Followers.TeleportFollowers(Alias_WaitMarker.GetRef(), SpecificFollowersToTeleport = eligibleCompanions, IncludeFollowingFollowers = true, IncludeWaitingFollowers = false, StartFollowingAfterTeleport = false, StartWaitingAfterTeleport = true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
UC01_ShipSimQuest_125_FirstTimeEntry.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
if UC01_ShipSim_HeardIntroOnce.GetValue() < 1.0
  UC01_ShipSim_HeardIntroOnce.SetValue(1.0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
UC01_ShipSimQuest_125_FirstTimeEntry.Stop()
UC01_ShipSimulatorHelperQuest_200_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE uc01_shipsimulationquestscript
Quest __temp = self as Quest
uc01_shipsimulationquestscript kmyQuest = __temp as uc01_shipsimulationquestscript
;END AUTOCAST
;BEGIN CODE
if !GetStageDone(1)
  kmyquest.BeginSequence()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(999)

if UC01_ShipSim_PlayerPassedSequence.GetValue() == 0
  UC01_ShipSim_PlayerPassedSequence.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
if Game.UsingGamepad()
  UC01_ShipSim_ExitPilotSeat_Controller.ShowAsHelpMessage("", afDuration = 5, afInterval=0, aiMaxTimes=1)
else
  UC01_ShipSim_ExitPilotSeat.ShowAsHelpMessage("", afDuration = 5, afInterval=0, aiMaxTimes=1)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
UC01_ShipSimulatorHelperQuest_600_PlayerDefeated.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(250, false, false)
SetObjectiveDisplayed(300, false, false)
if !GetStageDone(500)
  SetObjectiveDisplayed(999)
else
  SetObjectiveDisplayed(999, false, false)
  SetObjectiveDisplayed(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Play hatch sound only when the player truly leaves and not on activate
DRS_UC01_ShipSimulator_Hatch.Play(Game.GetPlayer())

UC01_ShipSimulatorHelperQuest_1000_ExitSequence.Start()
UC01_ShipSimQuest_125_FirstTimeEntry.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1005_Item_00
Function Fragment_Stage_1005_Item_00()
;BEGIN CODE
;Animate interior door during sim shutdown
Alias_ShipInteriorDoor.GetRef().SetOpen(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN AUTOCAST TYPE uc01_shipsimulationquestscript
Quest __temp = self as Quest
uc01_shipsimulationquestscript kmyQuest = __temp as uc01_shipsimulationquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.SimShipEnablePlayer.Delete()
Actor PlayerREF = Game.GetPlayer()
WwiseEvent_QST_UC01_PlayerInSimulator_False.Play(PlayerREF)

if UC01_ShipSim_PlayedThroughOnce.GetValue() < 1.0
  UC01_ShipSim_PlayedThroughOnce.SetValue(1.0)
endif
PlayerREF.RemovePerk(UC01_PilotingPerk)
PlayerREF.Moveto(Alias_ExitMarker.GetRef())
SetActive(false)
if UC01.IsRunning()
  UC01.SetActive(true)
endif

;Only overwrite the player's tier score if it's higher than their earlier ones
;and they haven't yet turned into Tuala
if !UC01.GetStageDone(630)
  int HighestTierInt = UC01_ShipSim_HighestTierReached.GetValueInt()
  int CurrentTierInt = UC01_ShipSim_CurrentTier.GetValueInt()

  if HighestTierInt < CurrentTierInt
    UC01_ShipSim_HighestTierReached.SetValue(CurrentTierInt)  
  endif
endif

;Disable old ship if player exits simulation
SpaceshipReference SimShipRef = Alias_SimShip.GetShipRef()
SimShipRef.DisableNoWait()
SimShipRef.Delete()

;Remove Sim Ship from player's ship list
SQ_PlayerShip.ResetPlayerShip(SQ_PlayerShip.HomeShip.GetShipRef())

;If the player leaves mid-combat ensure that any remaining ships are disabled
Alias_ActiveEnemies.DisableAll()

;Make followers who waited outside the sim follow again
Actor[] teleportedFollowers = Alias_Companions.GetActorArray()
if teleportedFollowers != None
    SQ_Followers.AllFollowersFollow(teleportedFollowers)
endif

;Close animated door
Alias_AnimatedDoor.GetRef().SetOpen(false)

;Animate interior door
SetStage(1005)

Stop()
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_SimShip Auto Const Mandatory

ReferenceAlias Property Alias_SimShipSeat Auto Const Mandatory

ReferenceAlias Property Alias_ExitRock Auto Const Mandatory

Scene Property UC01_ShipSimulatorHelperQuest_600_PlayerDefeated Auto Const Mandatory

ReferenceAlias Property Alias_ExitMarker Auto Const Mandatory

Quest Property UC01 Auto Const Mandatory

Scene Property UC01_ShipSimulatorHelperQuest_200_Intro Auto Const Mandatory

Scene Property UC01_ShipSimulatorHelperQuest_1000_ExitSequence Auto Const Mandatory

Message Property UC01_DEBUG_ShipSim Auto Const

GlobalVariable Property UC01_ShipSim_PlayerPassedSequence Auto Const Mandatory

ReferenceAlias Property Alias_BleedoutTestShip Auto Const Mandatory

ReferenceAlias Property Alias_ActiveEnemy Auto Const Mandatory

Message Property UC01_DEBUG_ExitingShipSim Auto Const Mandatory

ReferenceAlias Property Alias_StartMarker Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC01_PlayerInSimulator_True Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC01_PlayerInSimulator_False Auto Const Mandatory

ReferenceAlias Property Alias_TeleportMarker Auto Const Mandatory

GlobalVariable Property UC01_ShipSim_HighestTierReached Auto Const Mandatory

GlobalVariable Property UC01_ShipSim_CurrentTier Auto Const Mandatory

GlobalVariable Property UC01_ShipSim_PlayedThroughOnce Auto Const Mandatory

GlobalVariable Property UC01_ShipSim_HeardIntroOnce Auto Const Mandatory

Scene Property UC01_ShipSimQuest_125_FirstTimeEntry Auto Const Mandatory

sq_playershipscript Property SQ_PlayerShip Auto Const Mandatory

WwiseEvent Property DRS_UC01_ShipSimulator_Hatch Auto Const Mandatory

ReferenceAlias Property Alias_Proctor Auto Const Mandatory

ReferenceAlias Property Alias_ProctorMarker Auto Const Mandatory

SQ_FollowersScript Property SQ_Followers Auto Const Mandatory

ReferenceAlias Property Alias_WaitMarker Auto Const Mandatory

GlobalVariable Property UC01_PilotSeatGlobal Auto Const Mandatory

Message Property UC01_ShipSim_ExitPilotSeat Auto Const Mandatory

Perk Property UC01_PilotingPerk Auto Const Mandatory

RefCollectionAlias Property Alias_ActiveEnemies Auto Const Mandatory

Message Property UC01_ShipSim_ExitPilotSeat_Controller Auto Const Mandatory

RefCollectionAlias Property Alias_Companions Auto Const Mandatory

ReferenceAlias Property Alias_AnimatedDoor Auto Const Mandatory

ReferenceAlias Property Alias_ShipInteriorDoor Auto Const Mandatory

RefCollectionAlias Property availableCompanions Auto Const Mandatory

ActorValue Property FollowerState Auto Const Mandatory

Faction Property CurrentCompanionFaction Auto Const Mandatory

Faction Property AvailableCrewFaction Auto Const Mandatory
