;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF05_0021D792 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Prep the Key and the Vigilance for debug play and Faction Setups
CF_Main.SetStage(1)
Actor PlayerRef = Game.GetPlayer()

int i = 0
While i < DebugPerks.Length
    PlayerRef.AddPerk(DebugPerks[i])
    i += 1
endWhile

Alias_playerShipStore.ForceRefTo(Alias_PlayerShip.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(0)
DialogueCFTheKey.SetStage(103)
Alias_CF05_Naeva.GetRef().MoveTo(Alias_CF05_NaevaSceneMarker.GetRef())
Alias_CF05_Jasmine.GetRef().MoveTo(Alias_CF05_JasmineSceneMarker.GetRef())
Game.GetPlayer().MoveTo(Alias_CF05_Start100Marker.GetRef())
Alias_CF05_FleetCaptain.GetRef().MoveTo(Alias_CF05_FleetCaptainSit.GetRef())
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_CF05_HuanShipLandingMarker.GetRef())

SetStage(39)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(0)
SetObjectiveCompleted(100)

SetStage(755)
SetStage(746)
SetStage(800)
SetStage(810)
SetStage(900)
Alias_CF05_Huan.TryToEnable()
Alias_CF05_PrototypeShip.TryToEnable()
Alias_CF05_PrototypeShip.GetShipRef().InstantDock(Alias_CF05_SY920ShipDockingMarker.GetRef())
LC043.SetStage(99)
LC043.SetStage(100)

Game.GetPlayer().MoveTo(Alias_CF05_SY920Marker01.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(0)
SetObjectiveCompleted(100)
SetStage(1200)

Game.GetPlayer().AddItem(Alias_CF05_EnsignUniformQT.GetRef())
Game.GetPlayer().Additem(Digipick,99)
Game.GetPlayer().AddItem(Alias_CF05_SYIDCard.GetRef())

Alias_CF05_Huan.TryToEnable()
Alias_CF05_PrototypeShip.TryToEnable()
Alias_CF05_PrototypeShip.GetShipRef().InstantDock(Alias_CF05_SY920ShipDockingMarker.GetRef())
LC043.SetStage(99)
LC043.SetStage(100)
LC043.SetStage(200)

Game.GetPlayer().MoveTo(Alias_CF05_SY920Marker02.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(11)
SetObjectiveCompleted(100)
SetStage(1205)
SetStage(1600)
game.getPlayer().AddItem(LaserPistol,1)
game.getPlayer().Additem(LLW_Ammo_LaserPistol,25)
Game.GetPlayer().AddItem(Alias_CF05_SYIDCard.GetRef())
Alias_CF05_Huan.TryToEnable()
Alias_CF05_PrototypeShip.TryToEnable()
Alias_CF05_PrototypeShip.GetShipRef().InstantDock(Alias_CF05_SY920ShipDockingMarker.GetRef())
LC043.SetStage(99)
LC043.SetStage(100)
LC043.SetStage(200)
LC043.SetStage(300)

Game.GetPlayer().MoveTo(Alias_CF05_SY920Marker03.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(11)
SetStage(43)
SetObjectiveCompleted(100)
SetStage(1205)
SetStage(1600)
SetStage(1800)
LC043.SetStage(99)
Alias_CF05_PrototypeShip.TryToEnable()
Alias_CF05_PrototypeShip.GetShipRef().InstantDock(Alias_CF05_SY920ShipDockingMarker.GetRef())
game.getPlayer().AddItem(LaserPistol,1)
game.getPlayer().Additem(LLW_Ammo_LaserPistol,25)
Alias_CF05_Huan.TryToEnable()

Game.GetPlayer().MoveTo(Alias_TheKeyStart.GetRef())
Actor HuanRef = Alias_CF05_Huan.GetActorRef()
HuanRef.AddtoFaction(CrimsonFleetFaction)
HuanRef.SetCrimeFaction(CrimsonFleetFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetStage(0)
SetObjectiveCompleted(100)
SetStage(1850)
SetStage(1900)
SetStage(1910)
Game.GetPlayer().MoveTo(Alias_CF05_Start1900Marker.GetRef())
Alias_CF05_Huan.RefillAlias()
Alias_CF05_Huan.TryToEnable()
LC043.SetStage(1000)
Alias_CF05_PrototypeShip.TryToEnable()
Alias_CF05_PrototypeShip.TryToInstantDock(Alias_CF05_StationTheKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
SetStage(0)
SetObjectiveCompleted(100)
SetStage(2200)
Game.GetPlayer().MoveTo(Alias_CF05_TheVigilanceMarker.GetRef())
Alias_CF05_Huan.TryToEnable()
LC043.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(UC05_PlayerCitizenshipID01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_CF05_EnsignUniformQT.GetRef())
Game.GetPlayer().AddItem(Alias_CF05_EnsignUniformQT01.GetRef())
Game.GetPlayer().AddItem(Alias_CF05_EnsignUniformQT02.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(CF05_PilotUniformArmor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
SetStage(0)
SetObjectiveCompleted(100)
SetStage(500)
SetStage(510)
LC043.SetStage(99)
LC043.SetupGuardConfrontation(False)

Game.GetPlayer().MoveTo(Alias_CF05_HuanMoveToShipMarker.GetRef())
Alias_CF05_Huan.GetRef().MoveTo(Alias_CF05_HuanMoveToShipMarker.GetRef())
Alias_CF05_Huan.TryToEnable()

SpaceshipReference swanRef = Alias_CF05_HuanShip.GetShipRef()
swanRef.SetForwardVelocity(0)
swanRef.MoveTo(Alias_CF05_SY920SpaceArrivalMarker.GetRef())
SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
;Player betrays Huan. Vogel starts alarm and strike team heads toward elevator

SetObjectiveCompleted(20)
SetObjectiveCompleted(1700)
Alias_CF05_SY920_ExtraAlarmGuard01.GetRef().EnableNoWait()
Alias_CF05_SY920_ExtraAlarmGuard02.GetRef().EnableNoWait()
Game.GetPlayer().AddItem(LC043_SY03DockingPortKey)
CF05_1700_Vogel_Alarm.Start()
Wwise_Event_OBJ_Alarm_Starstation_Hostile.Play(Game.GetPlayer())
Alias_CF05_AlarmGuards.EvaluateAll()
(Alias_CF05_AlarmElevatorFloorMarker.GetRef() as LoadElevatorFloorScript).SetAccessible(False)
SetStage(1800)

;LC043 - Set LC043's betrayal stage.
LC043.SetStage(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Huan betrayed, skipping objectives where she isn't betrayed and advancing

SetObjectiveCompleted(1600)
SetObjectiveSkipped(1014)
SetObjectiveSkipped(1610)
SetObjectiveCompleted(1620)
SetObjectiveSkipped(1710)
SetObjectiveSkipped(1730)
SetObjectiveDisplayed(20)
SetStage(1715)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Player convinces Vogel they're a pilot, they get keys
SetObjectiveCompleted(1610)
SetObjectiveSkipped(1620)

Game.GetPlayer().AddItem(LC043_SY03DockingPortKey)
Game.GetPlayer().AddItem(LC043_SY03FlightTestPassword)

ObjectReference VogelRef = Alias_CF05_GabrielVogel.GetRef()

VogelRef.RemoveItem(LC043_SY03DockingPortKey)
VogelRef.RemoveItem(LC043_SY03FlightTestPassword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
;Vogel is killed, guard exits security bay unlocking door

SetObjectiveSkipped(1014)
SetObjectiveSkipped(1620)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
;Uniform 1 found, bread crumb stages skipped

SetObjectiveSkipped(1034)
SetObjectiveSkipped(1035)
SetObjectiveSkipped(1041)
SetObjectiveCompleted(1033)
SetStage(1021)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_01
Function Fragment_Stage_0023_Item_01()
;BEGIN CODE
;If the Guard sees the player steal, they sound the alarm
;CF05_0765_MarineScene04.Start()

;Actor PlayerRef = Game.GetPlayer()
;if !PlayerRef.IsSneaking() || PlayerRef.IsDetectedBy(Alias_CF05_CargoBayGuard02.GetActorRef())
;    SetStage(60)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
;Uniform 2 found, skipping bread crumb objectives

SetObjectiveCompleted(1034)
SetObjectiveSkipped(1033)
SetObjectiveSkipped(1035)
SetObjectiveSkipped(1041)
SetObjectiveSkipped(1051)
SetStage(1021)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0028_Item_00
Function Fragment_Stage_0028_Item_00()
;BEGIN CODE
;Player detected opening a locker, guard forcegreets and says don't touch that

if Game.GetPlayer().IsDetectedBy(Alias_CF05_CargoBayGuard02.GetActorRef())
    CF05_0765_MarineScene04.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0033_Item_00
Function Fragment_Stage_0033_Item_00()
;BEGIN CODE
CF05_0750_Huan_UCHailingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
;Backup stage that moves Huan into position if she is late and more than 5 meters away from destination

Actor HuanRef = Alias_CF05_Huan.GetActorRef()
ObjectReference HuanFurnitureRef = Alias_CF05_CustomStanding.GetRef()
ObjectReference CaptainMarkerRef = Alias_CF05_HuanMoveToShipMarker.GetRef()

HuanFurnitureRef.EnableNoWait()
HuanFurnitureRef.MoveTo(CaptainMarkerRef)

HuanRef.MoveTo(CaptainMarkerRef)
HuanRef.EvaluatePackage()
HuanRef.SetCrimeFaction(CrimsonFleetFaction)
HuanRef.RemoveFromFaction(CrimeFactionUC)
HuanRef.RemovefromFaction(PlayerFriendFaction)
HuanRef.RemoveFromFaction(NewAtlantisFaction)

Alias_CF05_HuanCrew01.GetActorRef().RemoveFromFaction(PlayerFriendFaction)
Alias_CF05_HuanCrew02.GetActorRef().RemoveFromFaction(PlayerFriendFaction)
Alias_CF05_HuanCrew03.GetActorRef().RemoveFromFaction(PlayerFriendFaction)

Actor PilotRef = Alias_CF05_HuanPilot.GetActorRef()
ObjectReference CockpitRef = Alias_CF05_HuanCaptainChair.GetRef()

if PilotRef.GetDistance(CockpitRef) > 5
    PilotRef.MoveTo(CockpitRef)
endif

PilotRef.SetGhost(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Docking bay access granted

SetStage(1800)
Alias_CF05_DockingPortDoor.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0037_Item_00
Function Fragment_Stage_0037_Item_00()
;BEGIN CODE
Alias_CF05_ElijahNameOverride.ForceRefTo(Alias_CF05_Hauler.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0038_Item_00
Function Fragment_Stage_0038_Item_00()
;BEGIN CODE
;Triggered from CF_Main Stage 300
;Checks if any SysDef Objectives are active and kills them

If IsObjectiveDisplayed(2200) == 1
   SetObjectiveDisplayed(2200,0)
   SetStage(10000)
EndIf

If IsObjectiveDisplayed(2300) == 1
   SetObjectiveDisplayed(2300,0)
   SetStage(10000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0039_Item_00
Function Fragment_Stage_0039_Item_00()
;BEGIN CODE
SetStage(0)
SetObjectiveCompleted(100)
SetStage(500)
SetStage(510)

Game.GetPlayer().MoveTo(Alias_CF05_HuanMoveToShipMarker.GetRef())
Alias_CF05_Huan.GetRef().MoveTo(Alias_CF05_HuanMoveToShipMarker.GetRef())
Alias_CF05_Huan.TryToEnable()
Alias_CF05_PrototypeShip.TryToEnable()
Alias_CF05_PrototypeShip.GetShipRef().InstantDock(Alias_CF05_SY920ShipDockingMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0044_Item_00
Function Fragment_Stage_0044_Item_00()
;BEGIN CODE
CF05_RC_SYS920_Scene03.Start()
Actor Marine01Ref = Alias_CF05_MarineBarracks01.GetActorRef()
Actor Marine02Ref = Alias_CF05_MarineBarracks02.GetActorRef()
Actor Marine03Ref = Alias_CF05_MarineBarracks03.GetActorRef()

;if !GetStageDone(1005)
 ;   Marine01Ref.SetValue(Aggression, 2)
  ;  Marine02Ref.SetValue(Aggression, 2)
   ; Marine03Ref.SetValue(Aggression, 2)
;endif

Marine01Ref.EvaluatePackage()
Marine02Ref.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
CF05_RC_SYS920_Scene06.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0046_Item_00
Function Fragment_Stage_0046_Item_00()
;BEGIN CODE
CF05_RC_SYS920_Scene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
CF05_0765_MarineScene09.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0048_Item_00
Function Fragment_Stage_0048_Item_00()
;BEGIN CODE
CF05_RC_SYS920_Scene04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0049_Item_00
Function Fragment_Stage_0049_Item_00()
;BEGIN CODE
CF05_RC_SYS920_Scene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
if !GetStageDone(1230)
    SetObjectiveDisplayed(1041)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0053_Item_00
Function Fragment_Stage_0053_Item_00()
;BEGIN CODE
SetObjectiveSkipped(1620)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;Player pays off Huan

game.GetPlayer().RemoveItem(Credits,1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Combat initiated with station - skip all objectives and remove from friendly factions
;Open door to let marines in to attack the player and give access to checkpoint

SetStage(790)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
SetObjectiveFailed(820)
ObjectReference IDRef = Alias_CF05_UCIDCardQT.GetRef()
ObjectReference UniRef = Alias_CF05_EnsignUniformQT02.GetRef()

UniRef.BlockActivation(false, false)
IDRef.BlockActivation(false, false)

CF05_1000_CargoBayGuard01_StopScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN CODE
SetStage(1150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0063_Item_00
Function Fragment_Stage_0063_Item_00()
;BEGIN CODE
SetObjectiveSkipped(1730)
Alias_CF05_CheckpointDoor.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SpaceshipReference PlayerShip = Alias_PlayerShip.GetShipRef()
Alias_playerShipStore.ForceRefTo(PlayerShip)
If !PlayerShip.HasKeyword(CannotBeSoldShipKeyword)
    PlayerShip.AddKeyword(CannotBeSoldShipKeyword)
    SetStage(67)
Endif

ObjectReference LandingPad = Alias_CF05_HuanShipLandingMarker.GetRef()

if GetStageDone(498)
    LandingPad.RemoveKeyword(PreventPlayerLandingAtMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetStage(0)
SetObjectiveCompleted(100)
SetStage(500)
SetStage(510)
Alias_CF05_Huan.TryToEnable()
Game.GetPlayer().MoveTo(Alias_CF05_UCSpaceportTech.GetRef())
Alias_CF05_Huan.GetRef().MoveTo(Alias_CF05_UCSpaceportTech.GetRef())
Alias_CF05_Huan.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
CF05_1000_IntercomDialogue_Action10_Choice00.Send()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
SetStage(0)
DialogueCFTheKey.SetStage(103)
Alias_CF05_Naeva.GetRef().MoveTo(Alias_CF05_NaevaSceneMarker.GetRef())
Alias_CF05_Jasmine.GetRef().MoveTo(Alias_CF05_JasmineSceneMarker.GetRef())
Alias_CF05_FleetCaptain.GetRef().MoveTo(Alias_CF05_FleetCaptainSit.GetRef())
SetStage(100)
SetStage(200)
SetStage(300)
Game.GetPlayer().MoveTo(Alias_CF05_Huan.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Alias_CF05_EngineerMedina.GetRef().RemoveItem(LC043_SY02SecurityStationPassword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
CF05_Alarm.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
CF05_0100_NaevaJasmineScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;DO NOT USE 'RUN ON START' for this stage, or it will break CF07 debugs
;End of CF04/CF05 Debug Stage 2 calls this stage directly

SetObjectiveDisplayed(100)

Actor NaevaRef = Alias_CF05_Naeva.GetActorRef()
Actor JasmineRef = Alias_CF05_Jasmine.GetActorRef()
ObjectReference JasmineMarker = Alias_CF05_JasmineSceneMarker.GetRef()

JasmineMarker.EnableNoWait()

if Game.GetPlayer().GetParentCell() == StationCFTheKey
    NaevaRef.EvaluatePackage()
    JasmineRef.EvaluatePackage()
else
    NaevaRef.SnapIntoInteraction(Alias_CF05_NaevaSceneMarker.GetRef())
    JasmineRef.SnapIntoInteraction(JasmineMarker)
endif

;Dock prototype
Alias_CF05_PrototypeShip.GetShipRef().InstantDock(Alias_CF05_SY920ShipDockingMarker.GetRef())

DialogueCFTheKey.SetStage(300)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
Alias_CF05_PrototypeShip.TryToEnable()
Alias_CF05_PrototypeShip.GetShipRef().InstantDock(Alias_CF05_SY920ShipDockingMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
CF05_0100_NaevaJasmineScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
;Player chose to attack SysDef
CF_Main.SetStage(300)
SetStage(10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
CF_Main.SetStage(275)
CF05_UCArrested.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Enable and move Huan to Kay's Place
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

Actor HuanREF = Alias_CF05_Huan.GetActorRef()
ObjectReference SitRef = Alias_CF05_HuanKaysPlaceMarker.GetRef()

HuanRef.EnableNoWait()
HuanRef.MoveTo(SitRef)
HuanRef.SnapIntoInteraction(SitRef)

Alias_CF05_HuanShipLandingMarker.GetRef().SetFactionOwner(LC043DockingFaction_HuansShip)

Alias_CF05_JasmineSceneMarker.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN CODE
Alias_CF05_HuanShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)
Alias_CF05_HuanShip.RefillDependentAliases()
Alias_CF05_HuanShipDoor.RefillAlias()
Alias_CF05_HuanShipDoorExterior.RefillAlias()
Alias_CF05_DockingPortDoors.RefillAlias()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
FFNewAtlantis05.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

;Enable ship
Alias_CF05_HuanShip.TryToEnable()
Actor PilotRef = Alias_CF05_HuanPilot.GetActorRef()

;Add crew to RefCollectionAlias after making separate aliases to force voicetypes
Alias_CF05_HuanCrew.AddRef(PilotRef)
Alias_CF05_HuanCrew.AddRef(Alias_CF05_HuanCrew01.GetRef())
Alias_CF05_HuanCrew.AddRef(Alias_CF05_HuanCrew02.GetRef())
Alias_CF05_HuanCrew.AddRef(Alias_CF05_HuanCrew03.GetRef())

;Make sure ship is accessible and snap pilot into chair
PilotRef.SnapIntoInteraction(Alias_CF05_HuanCaptainChair.GetRef())
Alias_CF05_HuanShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)
Alias_CF05_HuanShip.RefillDependentAliases()
Alias_CF05_HuanShipDoor.RefillAlias()
Alias_CF05_DockingPortDoors.RefillAlias()
Alias_CF05_HuanShipDoorExterior.RefillAlias()
Alias_CF05_HuanCaptainFurniture.GetRef().SetActorOwner(CF_HuanDaiyu)

ObjectReference LandingPad = Alias_CF05_HuanShipLandingMarker.GetRef()

if !LandingPad.HasKeyword(PreventPlayerLandingAtMarker)
    LandingPad.AddKeyword(PreventPlayerLandingAtMarker)
    SetStage(498)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_02
Function Fragment_Stage_0500_Item_02()
;BEGIN CODE
SetStage(703)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
;Teleport Huan ahead of player

;Clear alias of Fleet soldier we made stay still to stop interrupting a quest scene
Alias_DockingBayFleet.Clear()

;Enable custom furniture on Huan's ship
ObjectReference HuanFurnitureRef = Alias_CF05_CustomStanding.GetRef()
Alias_CF05_HuanMoveToShipMarker.RefillAlias()

HuanFurnitureRef.SetActorOwner(CF_HuanDaiyu)
HuanFurnitureRef.EnableNoWait()
HuanFurnitureRef.MoveTo(Alias_CF05_HuanMovetoShipMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Make Huan's ship is accessible

SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

Alias_CF05_HuanShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)
Alias_CF05_Huan.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(700)
Alias_CF05_Huan.GetActorRef().EvaluatePackage()
SYMapMarkerRef.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0701_Item_00
Function Fragment_Stage_0701_Item_00()
;BEGIN CODE
;UC04 failsafe - gives temporary objective and removes objective to take off in Jade Swan

SetObjectiveDisplayed(700, false, false)
SetObjectiveDisplayed(701)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0701_Item_01
Function Fragment_Stage_0701_Item_01()
;BEGIN CODE
;UC04 failsafe - gives temporary objective and removes objective to meet Huan

SetObjectiveDisplayed(500, false, false)
SetObjectiveDisplayed(701)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0701_Item_02
Function Fragment_Stage_0701_Item_02()
;BEGIN CODE
;UC04 failsafe - disables ship until spaceport reopens

Alias_CF05_HuanShip.GetShipRef().DisableNoWait()
Alias_CF05_Huan.GetRef().DisableNoWait()
Alias_CF05_HuanCrew.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0702_Item_00
Function Fragment_Stage_0702_Item_00()
;BEGIN CODE
;UC04 complete, restore objective

SetObjectiveCompleted(701)
SetObjectiveDisplayed(500, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0702_Item_01
Function Fragment_Stage_0702_Item_01()
;BEGIN CODE
;UC04 complete, restore objective

SetObjectiveCompleted(701)
SetObjectiveDisplayed(700, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0702_Item_02
Function Fragment_Stage_0702_Item_02()
;BEGIN CODE
;UC04 complete, restore ship upon return to New Atlantis

Alias_CF05_HuanShip.GetShipRef().EnableNoWait()
Alias_CF05_Huan.GetRef().EnableNoWait()
Alias_CF05_HuanCrew.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0703_Item_00
Function Fragment_Stage_0703_Item_00()
;BEGIN CODE
;MQ204 failsafe - gives temporary objective and removes objective to take off in Jade Swan

SetObjectiveDisplayed(700, false, false)
SetObjectiveDisplayed(701)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0703_Item_01
Function Fragment_Stage_0703_Item_01()
;BEGIN CODE
;MQ204 failsafe - gives temporary objective and removes objective to meet Huan

SetObjectiveDisplayed(500, false, false)
SetObjectiveDisplayed(701)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0703_Item_02
Function Fragment_Stage_0703_Item_02()
;BEGIN CODE
;MQ204 failsafe - disables ship until spaceport reopens

Alias_CF05_HuanShip.GetShipRef().DisableNoWait()
ObjectReference HuanRef = Alias_CF05_Huan.GetRef()
if HuanRef.IsInLocation(Alias_CF05_Location_HuanShipInterior.GetLocation())
    HuanRef.DisableNoWait()
endif
Alias_CF05_HuanCrew.DisableAll()

Alias_MQ204Ship.GetShipRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0704_Item_00
Function Fragment_Stage_0704_Item_00()
;BEGIN CODE
;MQ204 complete, restore objective

SetObjectiveCompleted(701)
SetObjectiveDisplayed(500, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0704_Item_01
Function Fragment_Stage_0704_Item_01()
;BEGIN CODE
;UC04 complete, restore objective

SetObjectiveCompleted(701)
SetObjectiveDisplayed(700, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0704_Item_02
Function Fragment_Stage_0704_Item_02()
;BEGIN CODE
;MQ204 complete, restore ship upon return to New Atlantis

Alias_CF05_HuanShip.GetShipRef().EnableNoWait()
Alias_CF05_Huan.GetRef().EnableNoWait()
Alias_CF05_HuanCrew.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
CF05_0710_Huan_CommentLeavingNAScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0714_Item_00
Function Fragment_Stage_0714_Item_00()
;BEGIN AUTOCAST TYPE cf05_layerscript
Quest __temp = self as Quest
cf05_layerscript kmyQuest = __temp as cf05_layerscript
;END AUTOCAST
;BEGIN CODE
;Jade Swan takeoff initiated - prevent player exiting ship

SetObjectiveCompleted(500)
SetObjectiveDisplayed(700)

Alias_CF05_HuanShip.GetShipRef().EvaluatePackage()
Alias_CF05_HuanShipDoor.RefillAlias()
Alias_CF05_HuanShipDoorExterior.RefillAlias()
Alias_CF05_HuanShip.GetShipRef().SetExteriorLoadDoorInaccessible(True)

Alias_CF05_Location_HuanShipInterior.GetLocation().DisableSpaceTravelToAllExcept(CF05, true)

kmyquest.CF05_Layer = InputEnableLayer.Create()
kmyquest.CF05_Layer.EnableFastTravel(false)
kmyquest.CF05_Layer.EnableFarTravel(false)
kmyquest.CF05_Layer.DisablePlayerControls(false, true, false, false, false, false, false, false, false, false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
CF05_0500_Huan_MeetJadeLotusSceneEnd.Stop()
Alias_CF05_HuanShip.GetShipRef().EvaluatePackage()
CF05_0710_Huan_CommentLeavingNAScene.Start()

Actor HuanRef = Alias_CF05_Huan.GetActorRef()
HuanRef.SetGhost(false)
HuanRef.SetRestrained(false)
Alias_CF05_HuanShipLandingMarker.GetRef().SetFactionOwner(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0721_Item_00
Function Fragment_Stage_0721_Item_00()
;BEGIN CODE
;Jade Swan takeoff initiated - dock the prototype ship

Alias_CF05_HuanShip.GetShipRef().SetExteriorLoadDoorInaccessible(True)

Actor HuanRef = Alias_CF05_Huan.GetActorRef()
HuanRef.SetGhost()
HuanRef.SetRestrained(true)

Alias_CF05_PrototypeShip.TryToEnable()
Alias_CF05_PrototypeShip.GetShipRef().InstantDock(Alias_CF05_SY920ShipDockingMarker.GetRef())
Alias_CF05_HuanShip.GetShipRef().EvaluatePackage()
SetStage(65)
SetStage(714)

;LC043 - Set LC043's Space Cell to its quest state. Update guard leader.
LC043.SetStage(99)
LC043.SetupGuardConfrontation(False)

;Clear Huan's ship to dock.
SetStage(745)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0725_Item_00
Function Fragment_Stage_0725_Item_00()
;BEGIN CODE
Actor HuanRef = Alias_CF05_Huan.GetActorRef()
HuanRef.SetRestrained(false)
CF05_0710_Huan_CommentLeavingNAScene.Start()
Alias_CF05_HuanShipLandingMarker.GetRef().SetFactionOwner(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0744_Item_00
Function Fragment_Stage_0744_Item_00()
;BEGIN CODE
Alias_CF05_HuanShip.GetShipRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0745_Item_00
Function Fragment_Stage_0745_Item_00()
;BEGIN CODE
Alias_CF05_HuanShip.GetShipRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0746_Item_00
Function Fragment_Stage_0746_Item_00()
;BEGIN AUTOCAST TYPE cf05_layerscript
Quest __temp = self as Quest
cf05_layerscript kmyQuest = __temp as cf05_layerscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(755)
SetObjectiveDisplayed(800)
CF05_0750_Huan_UCHailingScene.Stop()
CF05_755_Huan_WakeUpScene.Stop()
Alias_CF05_Huan.GetActorRef().EvaluatePackage()
kmyquest.CF05_Layer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0748_Item_00
Function Fragment_Stage_0748_Item_00()
;BEGIN CODE
CF05_0750_Huan_UCHailingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0749_Item_00
Function Fragment_Stage_0749_Item_00()
;BEGIN CODE
CF05_0750_Huan_UCHailingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;SetStage(745)
Alias_CF05_Huan.GetActorRef().SnapIntoInteraction(Alias_CF05_HuanCaptainFurniture.GetRef())
CF05_0710_Huan_CommentLeavingNAScene.Stop()
if !GetStageDone(755)
    CF05_0750_Huan_UCHailingScene.Start()
endif
SetObjectiveCompleted(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_01
Function Fragment_Stage_0750_Item_01()
;BEGIN CODE
FFNewAtlantis05.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0751_Item_00
Function Fragment_Stage_0751_Item_00()
;BEGIN CODE
CF05_0750_Huan_UCHailingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0755_Item_00
Function Fragment_Stage_0755_Item_00()
;BEGIN CODE
;Jade Swan gets approval to dock
SetObjectiveCompleted(700)
CF05_0750_Huan_UCHailingScene.Stop()
CF05_755_Huan_WakeUpScene.Start()
SetObjectiveDisplayed(755)
Alias_CF05_HuanShip.GetShipRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0756_Item_00
Function Fragment_Stage_0756_Item_00()
;BEGIN CODE
;Enable map marker on arrival to SY-920 space

Utility.Wait(1)

SYMapMarkerRef.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0765_Item_00
Function Fragment_Stage_0765_Item_00()
;BEGIN CODE
Alias_CF05_Marine_SceneNPC01.GetActorRef().EvaluatePackage()
Alias_CF05_Marine_SceneNPC02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0769_Item_00
Function Fragment_Stage_0769_Item_00()
;BEGIN CODE
SetStage(770)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0775_Item_00
Function Fragment_Stage_0775_Item_00()
;BEGIN CODE
;Marine convinced to leave station, make ID card non-owned and retrievable

ObjectReference IDRef = Alias_CF05_UCIDCardQT.GetRef()

IDRef.BlockActivation(false, false)
IDRef.SetFactionOwner(PlayerFaction)
CF05_0765_MarineScene07.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0777_Item_00
Function Fragment_Stage_0777_Item_00()
;BEGIN CODE
Alias_CF05_GabrielVogel.GetActorRef().RemoveFromFaction(PlayerFriendFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0795_Item_00
Function Fragment_Stage_0795_Item_00()
;BEGIN CODE
SetObjectiveCompleted(820)
SetStage(74)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0796_Item_00
Function Fragment_Stage_0796_Item_00()
;BEGIN CODE
SetObjectiveCompleted(795)
SetObjectiveDisplayed(796)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0797_Item_00
Function Fragment_Stage_0797_Item_00()
;BEGIN CODE
SetObjectiveCompleted(795)
SetObjectiveCompleted(796)
SetObjectiveDisplayed(797)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)

Alias_CF05_HuanShipLandingMarker.GetRef().SetFactionOwner(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0805_Item_00
Function Fragment_Stage_0805_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(820)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
;Move a marine into place for a scene after Huan spoken to via intercom
SetStage(74)
SetObjectiveCompleted(820)
Alias_CF05_Marine_SceneNPC01.GetRef().MoveTo(Alias_CF05_MarineSceneMarker01.GetRef())
ObjectReference DoorRef = Alias_CF05_DockingBayDoor.GetRef()

DoorRef.SetLockLevel(254)
DoorRef.Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
Alias_CF05_BartopCounter.GetRef().SetActorOwner(CF_HuanDaiyu)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
;Re-enable checkpoint as Guard returns to post

CF05_Checkpoint02REF.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0991_Item_00
Function Fragment_Stage_0991_Item_00()
;BEGIN CODE
CF05_0992_MarineScene04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0992_Item_00
Function Fragment_Stage_0992_Item_00()
;BEGIN CODE
;Player shows an item to a guard, clear as a quest item as it's no longer needed
;Temporarily disable forcegreet trigger with guard leaving post

Alias_CF05_CargoDoorLock.GetRef().Lock(false)
Alias_CF05_CargoBaySandwich.Clear()
CF05_Checkpoint02REF.DisableNoWait()
Alias_CF05_CargoBayGuard02.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(1051)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0994_Item_00
Function Fragment_Stage_0994_Item_00()
;BEGIN CODE
;Remove activator
Alias_CF05_CargoBaySandwich.GetRef().BlockActivation(false, false)
Alias_CF05_CargoBaySandwichActivator.GetRef().DisableNoWait()
CF05_SandwichPepperedMessage_Added.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0997_Item_00
Function Fragment_Stage_0997_Item_00()
;BEGIN CODE
Alias_CF05_LabMarine02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
SetStage(1005)
SetStage(1011)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
if GetStageDone(250)
    CF_Main.SetStage(250)
endif

;Complete objectives.
if IsObjectiveDisplayed(2100) == 1
     SetObjectiveCompleted(2100)
EndIf
if IsObjectiveDisplayed(2300) == 1
     SetObjectiveCompleted(2300)
EndIf

;The Vigilance moves at the next opportunity.
LC082.UpdateVigilanceLocation("CF06")

;Disable Huan and the Jade Swan.
Alias_CF05_Huan.GetRef().IgnoreFriendlyHits(false)
Alias_CF05_Huan.GetRef().DisableNoWait()
Alias_CF05_HuanShip.GetShipRef().DisableNoWait()

;Stop the CF05 Alarm.
CF05_Alarm.Stop()

;Add achievement.
Game.AddAchievement(21)

;Start CF06
CF06.SetStage(10)

;if CF_SysDefShutdown.GetValueInt() == 0
;    Stop()
;endif

Alias_StateChangeMarker.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Run speech challenge quest and fill aliases

SetObjectiveSkipped(800)
SetObjectiveCompleted(900)
SetObjectiveDisplayed(810)
CF05_Guard_SpeechChallenge02.Start()

;Alias_CF05_Location_HuanShipInterior.GetLocation().DisableSpaceTravelToAllExcept(CF05, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1001_Item_00
Function Fragment_Stage_1001_Item_00()
;BEGIN CODE
;LC043.SetStage(120)
SetStage(1011)
SetObjectiveCompleted(810)
SetObjectiveSkipped(820)
SetObjectiveDisplayed(1020)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1002_Item_00
Function Fragment_Stage_1002_Item_00()
;BEGIN CODE
Setstage(1010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1003_Item_00
Function Fragment_Stage_1003_Item_00()
;BEGIN CODE
SetObjectiveSkipped(1010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1005_Item_00
Function Fragment_Stage_1005_Item_00()
;BEGIN CODE
;Player has passed guard and now has access to the cafeteria
;Enable cafeteria objects

LC043.SetStage(120)
SetObjectiveCompleted(810)
SetObjectiveSkipped(820)
SetObjectiveDisplayed(1020)
Alias_CF05_CargoBaySandwich.GetRef().EnableNoWait()
Alias_CF05_CargoBaySandwichActivator.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1011_Item_00
Function Fragment_Stage_1011_Item_00()
;BEGIN CODE
;Found key, skipping preliminary/bread crumb objectives

SetObjectiveSkipped(820)
SetObjectiveSkipped(795)
SetObjectiveSkipped(796)
SetObjectiveSkipped(797)
If IsObjectiveDisplayed(1010)
     SetObjectiveCompleted(1010)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1014_Item_00
Function Fragment_Stage_1014_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1014)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1015_Item_00
Function Fragment_Stage_1015_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1020)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1016_Item_00
Function Fragment_Stage_1016_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1014)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1020_Item_00
Function Fragment_Stage_1020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1020)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1021_Item_00
Function Fragment_Stage_1021_Item_00()
;BEGIN CODE
;Player found Ensign uniform, update and clean up objectives

If IsObjectiveDisplayed(1020)
     SetObjectiveCompleted(1020)
EndIf
If IsObjectiveDisplayed(1033)
     SetObjectiveCompleted(1033)
EndIf
If IsObjectiveDisplayed(1034)
     SetObjectiveCompleted(1034)
EndIf
If IsObjectiveDisplayed(1035)
     SetObjectiveCompleted(1035)
EndIf
SetObjectiveSkipped(1051)

if !GetStageDone(1600)
    SetObjectiveDisplayed(1000)
endif
Alias_CF05_CargoBaySandwichActivator.GetRef().DisableNoWait()

;Also give the player the SY-920 ID Card and helmet along with the uniform.
Game.GetPlayer().AddItem(Alias_CF05_SYIDCard.GetRef())
Game.GetPlayer().AddAliasedItem(Spacesuit_SY920_UCMarine_Helmet, Alias_CF05_Helmet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1029_Item_00
Function Fragment_Stage_1029_Item_00()
;BEGIN CODE
SetStage(60)
SetStage(1026)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1033_Item_00
Function Fragment_Stage_1033_Item_00()
;BEGIN CODE
;Player reads terminal letting them know about uniform in locker

SetObjectiveDisplayed(1033)
SetObjectiveSkipped(1014)
Alias_CF05_CargoBaySandwich.GetRef().EnableNoWait()
Alias_CF05_CargoBaySandwichActivator.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1034_Item_00
Function Fragment_Stage_1034_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1034)
SetObjectiveSkipped(1014)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1035_Item_00
Function Fragment_Stage_1035_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1035)
SetObjectiveSkipped(1014)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1038_Item_00
Function Fragment_Stage_1038_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1016)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1039_Item_00
Function Fragment_Stage_1039_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1016)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1040_Item_00
Function Fragment_Stage_1040_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1030)
     SetObjectiveCompleted(1030)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1041_Item_00
Function Fragment_Stage_1041_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1016)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1042_Item_00
Function Fragment_Stage_1042_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1041)
SetObjectiveSkipped(1014)
SetObjectiveSkipped(1016)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1043_Item_00
Function Fragment_Stage_1043_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1041)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1044_Item_00
Function Fragment_Stage_1044_Item_00()
;BEGIN CODE
if !GetStageDone(1038) && !GetStageDone(1039) && !GetStageDone(1041)
    SetObjectiveDisplayed(1016)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
;Player gets access to Command Bay, unlock and open the door

ObjectReference SecurityDoor = Alias_CF05_CargoBaySecurityDoor.GetRef()
SecurityDoor.Lock(False)
SecurityDoor.SetOpen(true)
If IsObjectiveDisplayed(1040)
     SetObjectiveCompleted(1040)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1051_Item_00
Function Fragment_Stage_1051_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1051)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_11000_Item_00
Function Fragment_Stage_11000_Item_00()
;BEGIN CODE
Alias_CF05_OpsMarker01.GetRef().DisableNoWait()
Alias_CF05_OpsMarker02.GetRef().DisableNoWait()
Alias_CF05_OpsMarker03.GetRef().DisableNoWait()

ObjectReference Actor01 = Alias_VigilanceBriefing03.GetRef()
ObjectReference Actor02 = Alias_VigilanceBriefing04.GetRef()
ObjectReference Actor03 = Alias_VigilanceBriefing05.GetRef()
Actor01.DisableNoWait()
Actor02.DisableNoWait()
Actor03.DisableNoWait()

VigilanceMainActors.RemoveRef(Actor01)
VigilanceMainActors.RemoveRef(Actor02)
VigilanceMainActors.RemoveRef(Actor03)

CF05_Guard_SpeechChallenge01.Stop()
CF05_Guard_SpeechChallenge02.Stop()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
;Player found ID card, update objectives

if (!GetStageDone(1101))
     SetObjectiveDisplayed(1100)
EndIf
if !GetStageDone(1021)
    SetObjectiveSkipped(1020)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1101_Item_00
Function Fragment_Stage_1101_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1100)
     SetObjectiveCompleted(1100)
EndIf

SetObjectiveDisplayed(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1180_Item_00
Function Fragment_Stage_1180_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1189_Item_00
Function Fragment_Stage_1189_Item_00()
;BEGIN CODE
Alias_CF05_Natara.GetRef().MoveTo(Natara_Standing_Marker_Ref001)
Alias_CF05_SecurityClerk.GetRef().MoveTo(Natara_Standing_Marker_Ref002)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1190_Item_00
Function Fragment_Stage_1190_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1190_Item_01
Function Fragment_Stage_1190_Item_01()
;BEGIN CODE
SetObjectiveCompleted(1200)
SetObjectiveSkipped(1014)
SetObjectiveSkipped(1016)
SetObjectiveSkipped(1041)
if GetStageDone(1205)
    SetStage(1189)
    SetObjectiveDisplayed(1400)
endif

;Disable Guards
Alias_CF05_MarineLobby01.GetRef().DisableNoWait()
Alias_CF05_MarineLobby02.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1195_Item_00
Function Fragment_Stage_1195_Item_00()
;BEGIN CODE
;Move Actors into Position and Start Scene
Alias_CF05_Natara.GetActorRef().EvaluatePackage()
Alias_CF05_SecurityClerk.GetActorRef().EvaluatePackage()
CF05_1195_EmergencyClearanceScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveSkipped(820)
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1200)
ObjectReference DoorRef = Alias_CF05_DockingBayDoor.GetRef()

DoorRef.SetLockLevel(254)
DoorRef.Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1205_Item_00
Function Fragment_Stage_1205_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1210)
     SetObjectiveCompleted(1210)
EndIf
if GetStageDone(1190)
    SetStage(1189)
    SetObjectiveDisplayed(1400)
endif

;LC043 - Disable the Command Bay Lobby Guards if appropriate.
;Also triggers the security team if the player returns to Ops.
LC043.SetStage(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
SetStage(1230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1220_Item_00
Function Fragment_Stage_1220_Item_00()
;BEGIN CODE
SetStage(1240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1230_Item_00
Function Fragment_Stage_1230_Item_00()
;BEGIN CODE
;Command Bay access given, door unlocked and opened

SetObjectiveSkipped(1041)
ObjectReference SecurityDoor = Alias_CF05_CommandBaySecurityDoor.GetRef()
SecurityDoor.Lock(False)
SecurityDoor.SetOpen(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
CF05_1250_Natara_VigilanceAnnouncementScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1251_Item_00
Function Fragment_Stage_1251_Item_00()
;BEGIN CODE
Alias_CF05_Natara.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1301_Item_00
Function Fragment_Stage_1301_Item_00()
;BEGIN CODE
;Remove guards to make sneaking easier

SetObjectiveSkipped(1013)
SetObjectiveCompleted(1050)
SetObjectiveCompleted(1300)
CF05_SY03_GuardEnableREF.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1306_Item_00
Function Fragment_Stage_1306_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1050)
SetObjectiveCompleted(1013)
SetStage(5000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1320_Item_00
Function Fragment_Stage_1320_Item_00()
;BEGIN CODE
SetStage(1330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1330_Item_00
Function Fragment_Stage_1330_Item_00()
;BEGIN CODE
;Natara attacks player

Actor PlayerRef = Game.GetPlayer()

PlayerRef.RemoveFromFaction(LC043SYFaction)
PlayerRef.RemoveFromFaction(LC043SY02Faction)
Alias_CF05_Natara.GetActorRef().StartCombat(PlayerRef)

If IsObjectiveDisplayed(1300)
     SetObjectiveCompleted(1300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
If !GetStageDone(1501)
     SetStage(1500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1450_Item_00
Function Fragment_Stage_1450_Item_00()
;BEGIN CODE
;Player spoke to Command bay guard - Unlock door

Alias_CF05_CommandBaySecurityDoor.GetRef().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1501_Item_00
Function Fragment_Stage_1501_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1541_Item_00
Function Fragment_Stage_1541_Item_00()
;BEGIN CODE
SetObjectiveSkipped(1540)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1545_Item_00
Function Fragment_Stage_1545_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1540)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1550_Item_00
Function Fragment_Stage_1550_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1014)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1590_Item_00
Function Fragment_Stage_1590_Item_00()
;BEGIN CODE
CF05_1700_Vogel_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
;Spin up speech challenge quest for Vogel

SetObjectiveSkipped(1013)
SetObjectiveSkipped(1050)
SetObjectiveCompleted(1400)
SetObjectiveDisplayed(1600)
CF05_Vogel_SpeechChallenge01.Start()
Alias_CF05_GabrielVogel.GetActorRef().AddtoFaction(PlayerFriendFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_01
Function Fragment_Stage_1600_Item_01()
;BEGIN CODE
SetObjectiveCompleted(1014, false)
SetObjectiveDisplayed(1014, abForce = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1697_Item_00
Function Fragment_Stage_1697_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1611)
SetObjectiveSkipped(1610)
SetObjectiveSkipped(1620)
SetObjectiveSkipped(1710)
SetObjectiveDisplayed(1800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1699_Item_00
Function Fragment_Stage_1699_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1700)
if GetStageDone(1700)
    SetObjectiveDisplayed(1611)
    SetStage(1800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_00
Function Fragment_Stage_1700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1600)
SetObjectiveSkipped(1620)
if GetStageDone(1699)
    SetObjectiveDisplayed(1611)
    SetStage(1800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_01
Function Fragment_Stage_1700_Item_01()
;BEGIN CODE
SetObjectiveDisplayed(1700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1705_Item_00
Function Fragment_Stage_1705_Item_00()
;BEGIN CODE
;Docking port door opened by checkpoint guard

Alias_CF05_DockingPortDoor.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1710_Item_00
Function Fragment_Stage_1710_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1611)
SetObjectiveDisplayed(1710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1710_Item_01
Function Fragment_Stage_1710_Item_01()
;BEGIN CODE
SetObjectiveCompleted(1610)
SetObjectiveSkipped(1620)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1711_Item_00
Function Fragment_Stage_1711_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1710)
    SetStage(1720)
EndIf

Game.GetPlayer().AddItem(LL_CF05_Spacesuit_SY920_UCPilot_Helmet_AnyQuality)
Game.GetPlayer().AddItem(LL_CF05_Spacesuit_SY920_UCPilot_Backpack_AnyQuality)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1715_Item_00
Function Fragment_Stage_1715_Item_00()
;BEGIN CODE
SetObjectiveSkipped(1611)
SetObjectiveSkipped(1700)

Alias_CF05_Pilot01.GetRef().MoveTo(Alias_CF05_Pilot02.GetRef())
Alias_CF05_EngineeringBaySecurityDoor.GetRef().SetOpen(True)

SetStage(1730)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1720_Item_00
Function Fragment_Stage_1720_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1721_Item_00
Function Fragment_Stage_1721_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1720)
     SetObjectiveCompleted(1720)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1723_Item_00
Function Fragment_Stage_1723_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1600)
SetObjectiveDisplayed(1610)
if !GetStageDone(53)
    SetObjectiveDisplayed(1620)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1725_Item_00
Function Fragment_Stage_1725_Item_00()
;BEGIN CODE
SetObjectiveFailed(1610)
SetObjectiveCompleted(1600, false)
SetObjectiveDisplayed(1600, abForce = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1730_Item_00
Function Fragment_Stage_1730_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1730)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1731_Item_00
Function Fragment_Stage_1731_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1730)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1770_Item_00
Function Fragment_Stage_1770_Item_00()
;BEGIN CODE
CF05_LC043_Scene06.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1799_Item_00
Function Fragment_Stage_1799_Item_00()
;BEGIN CODE
CF05_1699_Vogel_DialogueScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN AUTOCAST TYPE cf05_layerscript
Quest __temp = self as Quest
cf05_layerscript kmyQuest = __temp as cf05_layerscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveSkipped(1014)
SetObjectiveCompleted(1600)
if !GetStageDone(1711) && !GetStageDone(20) && !GetStageDone(1700)
    SetObjectiveDisplayed(1710)
endif
SetObjectiveDisplayed(1800)

kmyquest.CF05_Layer = InputEnableLayer.Create()
kmyquest.CF05_Layer.EnableFastTravel(false)
kmyquest.CF05_Layer.EnableGravJump(false)
kmyquest.CF05_Layer.EnableFarTravel(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1890_Item_00
Function Fragment_Stage_1890_Item_00()
;BEGIN CODE
SetObjectiveSkipped(1014)
SetObjectiveSkipped(1610)
SetObjectiveSkipped(1620)
SetObjectiveSkipped(1710)
SetObjectiveSkipped(1730)
SetObjectiveCompleted(1600)
CF05_1890_Prototype_UCHailingScene.Start()
SpaceshipReference HuanshipRef = Alias_CF05_HuanShip.GetShipRef()

HuanShipRef.AddtoFaction(CrimsonFleetFaction)
HuanShipRef.SetCrimeFaction(CrimsonFleetFaction)
Alias_CF05_Location_HuanShipInterior.GetLocation().DisableSpaceTravelToAllExcept(CF05, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1899_Item_00
Function Fragment_Stage_1899_Item_00()
;BEGIN AUTOCAST TYPE cf05_layerscript
Quest __temp = self as Quest
cf05_layerscript kmyQuest = __temp as cf05_layerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CF05_Layer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1900_Item_00
Function Fragment_Stage_1900_Item_00()
;BEGIN AUTOCAST TYPE defaultquestchangelocationscript
Quest __temp = self as Quest
defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1800)
SetObjectiveDisplayed(1900)
CF05_1900_Prototype_UCHailingScene.Start()

;LC043 - Let LC043 know the escape has started.
LC043.SetStage(460)

;Move the Jade Swan back to the Key.
SpaceshipReference swanRef = Alias_CF05_HuanShip.GetShipRef()
SpaceshipReference keyRef = Alias_CF05_StationTheKey.GetShipRef()
swanRef.InstantUndock()
swanRef.MoveTo(keyRef)
swanRef.InstantDock(keyRef)

;Move Huan back to the Key.
Actor HuanREF = Alias_CF05_Huan.GetActorRef()

HuanRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_02)
HuanRef.RemoveFromFaction(CrimeFactionUC)
HuanRef.RemoveFromFaction(NewAtlantisFaction)
HuanRef.AddtoFaction(CrimsonFleetFaction)
HuanRef.SetCrimeFaction(CrimsonFleetFaction)

if GetStageDone(5000)
    HuanREF.MoveTo(Alias_CF05_HuanReturnMarker.GetRef())
else
    ObjectReference BarFurnitureRef = Alias_CF05_HuanFinalMarker.GetRef()
    BarFurnitureRef.EnableNoWait()
    HuanREF.MoveTo(BarFurnitureRef)
endif

;Set up Delgado, Naeva, and Jasmine for the postquest scene.
Alias_Key_SceneNPC01.GetRef().EnableNoWait()
Alias_Key_SceneNPC02.GetRef().EnableNoWait()
Alias_Key_Scene01.GetRef().EnableNoWait()
Alias_CF05_Delgado.GetRef().MoveTo(Alias_CF05_DelgadoFinalMarker.GetRef())
Alias_CF05_Naeva.GetRef().MoveTo(Alias_CF05_NaevaFinalMarker.GetRef())
Alias_CF05_Jasmine.GetRef().MoveTo(Alias_Key_SceneNPC01.GetRef())

;Clear stolen quest items
Alias_CF05_EnsignUniformQT.Clear()
Alias_CF05_EnsignUniformQT01.Clear()
Alias_CF05_EnsignUniformQT02.Clear()
Alias_CF05_PilotUniformQT.Clear()

;Delete layer
SetStage(1899)

Alias_Key_SceneNPC01.GetRef().MoveTo(Alias_Key_Scene03.GetRef())
Alias_Key_SceneNPC02.GetRef().MoveTo(Alias_Key_Scene02.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1901_Item_00
Function Fragment_Stage_1901_Item_00()
;BEGIN CODE
;Return the player's ship they left on New Atlantis to the Key
Alias_CF05_PrototypeShip.GetShipRef().DisableNoWait()

SpaceshipReference ShipStore = Alias_PlayerShipStore.GetShipRef()

if GetStageDone(67)
    ShipStore.RemoveKeyword(CannotBeSoldShipKeyword)
endif

if ShipStore.IsDisabled()
    ShipStore.EnableNoWait()
endif

ShipStore.InstantDock(Alias_DockingDoor.GetRef())
SQ_PlayerShip.ResetHomeShip(Alias_PlayerShipStore.GetShipRef())

;Clear alias to clear shipcannotsell and modify keywords
SetStage(1903)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1902_Item_00
Function Fragment_Stage_1902_Item_00()
;BEGIN CODE
CF05_WelcomeBackPrototype.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1903_Item_00
Function Fragment_Stage_1903_Item_00()
;BEGIN CODE
Alias_PlayerShipStore.Clear()

;Player has docked the ComSpike, we are now removing it from the player's owned ship list
SpaceshipReference ShipRef = Alias_CF05_PrototypeShip.GetShipRef()

Game.RemovePlayerOwnedShip(ShipRef)
ShipRef.AddKeyword(CannotBeHomeShipKeyword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1905_Item_00
Function Fragment_Stage_1905_Item_00()
;BEGIN CODE
;Set by: CF05_1900_Prototype_UCHailingScene

;LC043 - Trigger the space combat.
LC043.SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1910_Item_00
Function Fragment_Stage_1910_Item_00()
;BEGIN CODE
;Player has returned to the Key - block them from using the Prototype Shp
SpaceshipReference ShipRef = Alias_CF05_PrototypeShip.GetShipRef()

ShipRef.InstantUndock()
ShipRef.EvaluatePackage()

SetStage(1850)
SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1910_Item_01
Function Fragment_Stage_1910_Item_01()
;BEGIN CODE
SetStage(1901)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1920_Item_00
Function Fragment_Stage_1920_Item_00()
;BEGIN CODE
;Huan is confronting the player - moves her to the far elevator if player takes that one instead

;Alias_CF05_Huan.GetRef().MoveTo(CF05_Huan_ReturnMarkerRef001)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;Move Huan to the bar if she wasn't betrayed and snap her into furniture

ObjectReference HuanFinalMarker = Alias_CF05_HuanFinalMarker.GetRef()

SetObjectiveCompleted(1900)
if GetStageDone(5000)
    SetObjectiveDisplayed(1990)
else
    HuanFinalMarker.EnableNoWait()
    Alias_CF05_Huan.GetActorRef().SnapIntoInteraction(HuanFinalMarker)
    SetObjectiveDisplayed(2000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2050_Item_00
Function Fragment_Stage_2050_Item_00()
;BEGIN CODE
;Huan gives you a drink

Game.GetPlayer().AddItem(DrinkBottle_Grog_Md)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1990)
SetObjectiveCompleted(2000)
SetObjectiveDisplayed(2100)

Alias_Key_SceneNPC01.GetRef().DisableNoWait()
Alias_Key_SceneNPC02.GetRef().DisableNoWait()
Alias_Key_Scene01.GetRef().DisableNoWait()
Alias_CF05_Huan.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2110_Item_00
Function Fragment_Stage_2110_Item_00()
;BEGIN CODE
;Huan moves to meeting

Alias_CF05_Huan.GetRef().MoveTo(Alias_CF05_HuanFinalMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2200_Item_00
Function Fragment_Stage_2200_Item_00()
;BEGIN CODE
;If player is still with SysDef, set up SysDef folks for player return

If GetStageDone(2100) == 1
SetObjectiveCompleted(2100)
SetObjectiveDisplayed(2200)
CF05_2100_Delgado_WrapUpScene.Stop()
Alias_CF05_Kibwe.GetRef().MoveTo(Alias_CF05_KibweMarker.GetRef())
Alias_CF05_Jillian.GetRef().MoveTo(Alias_CF05_JillianMarker.GetRef())
EndIf

CF05_ComSpikeMessage.Show()

Alias_CF05_OpsMarker01.GetRef().EnableNoWait()
Alias_CF05_OpsMarker02.GetRef().EnableNoWait()
Alias_CF05_OpsMarker03.GetRef().EnableNoWait()

Actor Actor01 = Alias_VigilanceBriefing03.GetActorRef()
Actor Actor02 = Alias_VigilanceBriefing04.GetActorRef()
Actor Actor03 = Alias_VigilanceBriefing05.GetActorRef()

Actor01.EnableNoWait()
Actor02.EnableNoWait()
Actor03.EnableNoWait()

VigilanceMainActors.AddRef(Actor01)
VigilanceMainActors.AddRef(Actor02)
VigilanceMainActors.AddRef(Actor03)
Actor01.SetCrimeFaction(CrimeFactionUCSysDef)
Actor02.SetCrimeFaction(CrimeFactionUCSysDef)
Actor03.SetCrimeFaction(CrimeFactionUCSysDef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2200_Item_01
Function Fragment_Stage_2200_Item_01()
;BEGIN CODE
;If player is not with SysDef, skip ahead to end of quest
CF05_2100_Delgado_WrapUpScene.Stop()
CF05_ComSpikeMessage.Show()
SetStage(10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2300_Item_00
Function Fragment_Stage_2300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2200)
SetObjectiveDisplayed(2300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5000_Item_00
Function Fragment_Stage_5000_Item_00()
;BEGIN CODE
CrimsonFleetCaptainState_Huan.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CF05_Naeva Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Jasmine Auto Const Mandatory

ReferenceAlias Property Alias_CF05_NaevaSceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF05_JasmineSceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Start100Marker Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property CrimsonFleetFaction Auto Const Mandatory

Quest Property CFKey Auto Const Mandatory

LC082_VigilanceQuestScript Property LC082 Auto Const Mandatory

Faction Property UCSysDefFaction Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanKaysPlaceMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Huan Auto Const Mandatory

Scene Property CF05_0100_NaevaJasmineScene Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanShip Auto Const Mandatory

ReferenceAlias Property Alias_CF05_VogelTerminal Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanMeetMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanMoveToShipMarker Auto Const Mandatory

Scene Property CF05_0710_Huan_CommentLeavingNAScene Auto Const Mandatory

ReferenceAlias Property Alias_CF05_SY920Marker01 Auto Const Mandatory

LC043QuestScript Property LC043 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CargoBaySecurityDoor Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CommandBaySecurityDoor Auto Const Mandatory

ReferenceAlias Property Alias_CF05_SY920Marker02 Auto Const Mandatory

Faction Property LC043SYFaction Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Natara Auto Const Mandatory

ReferenceAlias Property Alias_CF05_EngineeringBaySecurityDoor Auto Const Mandatory

ReferenceAlias Property Alias_CF05_SY920Marker03 Auto Const Mandatory

Faction Property LC043SY02Faction Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Delgado Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Kibwe Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Jillian Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanReturnMarker Auto Const Mandatory

LocationAlias Property Alias_CF05_Location_HuanShipInterior Auto Const Mandatory

ReferenceAlias Property Alias_CF05_DelgadoFinalMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF05_NaevaFinalMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF05_JasmineFinalMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanFinalMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Start1900Marker Auto Const Mandatory

Scene Property CF05_0750_Huan_UCHailingScene Auto Const Mandatory

ReferenceAlias Property Alias_CF05_TheVigilanceMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF05_KibweMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF05_JillianMarker Auto Const Mandatory

Key Property UC05_PlayerCitizenshipID01 Auto Const Mandatory

Armor Property CF05_EnsignUniformArmor Auto Const Mandatory

Armor Property CF05_PilotUniformArmor Auto Const Mandatory

Quest Property CF06 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_EnsignUniform Auto Const Mandatory

Scene Property CF05_1250_Natara_VigilanceAnnouncementScene Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CargoBayTransportLift Auto Const Mandatory

MiscObject Property Digipick Auto Const Mandatory

Weapon Property LaserPistol Auto Const Mandatory

LeveledItem Property LLW_Ammo_LaserPistol Auto Const Mandatory

Message Property CF05_ComSpikeMessage Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory

Idle Property Human_Root_Knockdown Auto Const Mandatory

Idle Property Human_Root_GetUp Auto Const Mandatory

ImageSpaceModifier Property FadetoBlackImod Auto Const Mandatory

ImageSpaceModifier Property FadefromBlackImod Auto Const Mandatory

ImageSpaceModifier Property HoldAtBlackImod Auto Const Mandatory

Scene Property CF05_755_Huan_WakeUpScene Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanCaptainChair Auto Const Mandatory

ImageSpaceModifier Property CF05_Blur_FadetoBlackImod Auto Const Mandatory

ReferenceAlias Property Alias_CF05_SY920SpaceArrivalMarker Auto Const Mandatory

SpaceshipBase Property CF_Huan_TheJadeLotusShip Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Hauler Auto Const Mandatory

Armor Property Clothes_UtilityOveralls_Mechanic_01 Auto Const Mandatory

Armor Property Clothes_UtilityOveralls_SSO_Hat_HeadphonesDown Auto Const Mandatory

ReferenceAlias Property Alias_CF05_UCIDCardQT Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Marine_SceneNPC02 Auto Const Mandatory

Quest Property DialogueCFTheKey Auto Const Mandatory

Faction Property LC043SY01Faction Auto Const Mandatory

Faction Property LC043SY03Faction Auto Const Mandatory

ObjectReference Property SYMapMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_CF05_SY920ShipDockingMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CargoBaySandwichActivator Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CargoBaySandwich Auto Const Mandatory

ObjectReference Property CF05_Checkpoint02REF Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CargoBayGuard02 Auto Const Mandatory

Scene Property CF05_0992_MarineScene04 Auto Const Mandatory

Message Property CF05_SandwichPepperedMessage_Added Auto Const Mandatory

GlobalVariable Property CF05_EnsignTestGlobal Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CommandBayAccessCardQT Auto Const Mandatory

ReferenceAlias Property Alias_CF05_EngineerMedina Auto Const Mandatory

ObjectReference Property StationSY920ShipNew Auto Const Mandatory

ActorBase Property CF_HuanDaiyu Auto Const Mandatory

ObjectReference Property CF05_CommandBayDoorREF Auto Const Mandatory

ReferenceAlias Property Alias_CF05_EnsignUniformQT Auto Const Mandatory

ReferenceAlias Property Alias_CF05_EnsignUniformQT01 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_EnsignUniformQT02 Auto Const Mandatory

Scene Property CF05_1195_EmergencyClearanceScene Auto Const Mandatory

ReferenceAlias Property Alias_CF05_SecurityClerk Auto Const Mandatory

ReferenceAlias Property Alias_CF05_PlayerSpawn Auto Const Mandatory

ObjectReference Property Natara_Standing_Marker_Ref001 Auto Const Mandatory

ObjectReference Property Natara_Standing_Marker_Ref002 Auto Const Mandatory

ObjectReference Property CF05_SY03_GuardEnableREF Auto Const Mandatory

ReferenceAlias Property Alias_CF05_PrototypeShip Auto Const Mandatory

Scene Property CF05_1700_Vogel_IntroScene Auto Const Mandatory

ReferenceAlias Property Alias_CF05_DockingPortDoor Auto Const Mandatory

ObjectReference Property CF05_Huan_ReturnMarkerRef001 Auto Const Mandatory

Scene Property CF05_LC043_Scene06 Auto Const Mandatory

Quest Property CF05_Vogel_SpeechChallenge01 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Pilot01 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Pilot02 Auto Const Mandatory

Scene Property CF05_1900_Prototype_UCHailingScene Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Float Property TimeToTakeOff Auto Const Mandatory

Scene Property CF05_0500_Huan_MeetJadeLotusSceneEnd Auto Const Mandatory

Scene Property CF05_1890_Prototype_UCHailingScene Auto Const Mandatory

WwiseEvent Property Wwise_Event_OBJ_Alarm_Starstation_Hostile Auto Const Mandatory

Key Property LC043_SY03DockingPortKey Auto Const Mandatory

ReferenceAlias Property Alias_CF05_StationTheKey Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_CF05_PrototypeShipPilotSeat Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanShipDoor Auto Const Mandatory

ReferenceAlias Property Alias_playerShipStore Auto Const Mandatory

Perk[] Property DebugPerks Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Marine_SceneNPC05 Auto Const Mandatory

Scene Property CF05_0765_MarineScene07 Auto Const Mandatory

Quest Property CF05_Guard_SpeechChallenge02 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Marine_SceneNPC03 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_LockerDoor Auto Const Mandatory

Scene Property CF05_0765_MarineScene04 Auto Const Mandatory

Scene Property CF05_1700_Vogel_Alarm Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanShipLandingMarker Auto Const Mandatory

RefCollectionAlias Property Alias_CF05_HuanCrew Auto Const Mandatory

Quest Property FFNewAtlantis05 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Marine_SceneNPC04 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanPilot Auto Const Mandatory

ReferenceAlias Property Alias_CF05_SYIDCard Auto Const Mandatory

RefCollectionAlias Property Alias_CF05_AlarmGuards Auto Const Mandatory

ReferenceAlias Property Alias_CF05_AlarmElevatorFloorMarker Auto Const Mandatory

Cell Property StationCFTheKey Auto Const Mandatory

Key Property LC043_SY03FlightTestPassword Auto Const Mandatory

GlobalVariable Property CF_SysDefShutdown Auto Const Mandatory

Potion Property DrinkBottle_Grog_Md Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CheckpointDoor Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Marine_SceneNPC01 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_MarineSceneMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_MarineSceneMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanCrew01 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanCrew02 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanCrew03 Auto Const Mandatory

Scene Property CF05_RC_SYS920_Scene03 Auto Const Mandatory

Scene Property CF05_RC_SYS920_Scene06 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_GabrielVogel Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

Scene Property CF05_RC_SYS920_Scene02 Auto Const Mandatory

Scene Property CF05_0765_MarineScene09 Auto Const Mandatory

Scene Property CF05_RC_SYS920_Scene04 Auto Const Mandatory

Scene Property CF05_RC_SYS920_Scene01 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_MarineLobby01 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_MarineLobby02 Auto Const Mandatory

Armor Property Spacesuit_SY920_UCMarine_Helmet Auto Const Mandatory

ReferenceAlias Property Alias_CF05_Helmet Auto Const Mandatory

ReferenceAlias Property Alias_DockingBayFleet Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CustomStanding Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CommandBayAccessCard Auto Const Mandatory

Faction Property LC043DockingFaction_HuansShip Auto Const Mandatory

ReferenceAlias Property Alias_TheKeyStart Auto Const Mandatory

RefCollectionAlias Property PlayerShips Auto Const Mandatory

sq_playershipscript Property SQ_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_playerHomeShipStore Auto Const Mandatory

ReferenceAlias Property Alias_PlayerHomeShip Auto Const Mandatory

ReferenceAlias Property Alias_Key_SceneNPC02 Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene01 Auto Const Mandatory

ReferenceAlias Property Alias_Key_SceneNPC01 Auto Const Mandatory

Scene Property CF05_WelcomeBackPrototype Auto Const Mandatory

ReferenceAlias Property Alias_CF05_MarineBarracks01 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_MarineBarracks02 Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_MarineBarracks03 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_UCSpaceportTech Auto Const Mandatory

ReferenceAlias Property Alias_DockingDoor Auto Const Mandatory

ReferenceAlias Property Alias_CF05_FleetCaptain Auto Const Mandatory

ReferenceAlias Property Alias_CF05_FleetCaptainSit Auto Const Mandatory

ReferenceAlias Property Alias_CF05_PilotUniformQT Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

Faction Property NewAtlantisFaction Auto Const Mandatory

ReferenceAlias Property Alias_CF05_BartopCounter Auto Const Mandatory

GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const Mandatory

Keyword Property ShipCannotSell Auto Const Mandatory

Keyword Property ShipCannotModify Auto Const Mandatory

Outfit Property Outfit_Clothes_CrimsonFleet_Captain_02 Auto Const Mandatory

Key Property LC043_SY02SecurityStationPassword Auto Const Mandatory

ReferenceAlias Property Alias_CF05_CargoDoorLock Auto Const Mandatory

Quest Property CF05_Alarm Auto Const Mandatory

RefCollectionAlias Property Alias_CF05_DockingPortDoors Auto Const Mandatory

ReferenceAlias Property Alias_CF05_DockingBayDoor Auto Const Mandatory

ReferenceAlias Property Alias_CF05_SY920_ExtraAlarmGuard01 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_SY920_ExtraAlarmGuard02 Auto Const Mandatory

Scene Property CF05_2100_Delgado_WrapUpScene Auto Const Mandatory

ReferenceAlias Property Alias_CF05_OpsMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_OpsMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_OpsMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_VigilanceBriefing03 Auto Const Mandatory

ReferenceAlias Property Alias_VigilanceBriefing04 Auto Const Mandatory

ReferenceAlias Property Alias_VigilanceBriefing05 Auto Const Mandatory

Scene Property CF05_1699_Vogel_DialogueScene Auto Const Mandatory

GlobalVariable Property CF05_UCArrested Auto Const Mandatory

ReferenceAlias Property Alias_CF05_ElijahNameOverride Auto Const Mandatory

Scene Property CF05_765_MarineIDCardTheftBlocker Auto Const Mandatory

LeveledItem Property LL_CF05_Spacesuit_SY920_UCPilot_Backpack_AnyQuality Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanShipDoorExterior Auto Const Mandatory

AffinityEvent Property CF05_1000_IntercomDialogue_Action10_Choice00 Auto Const Mandatory

ReferenceAlias Property Alias_CF05_HuanCaptainFurniture Auto Const Mandatory

Scene Property CF05_1000_CargoBayGuard01_StopScene Auto Const Mandatory

RefCollectionAlias Property VigilanceMainActors Auto Const Mandatory

ReferenceAlias Property Alias_CF05_LabMarine02 Auto Const Mandatory

LeveledItem Property LL_CF05_Spacesuit_SY920_UCPilot_Helmet_AnyQuality Auto Const Mandatory

Keyword Property CannotBeHomeShipKeyword Auto Const Mandatory

Keyword Property CannotBeSoldShipKeyword Auto Const Mandatory

Keyword Property PreventPlayerLandingAtMarker Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene02 Auto Const Mandatory

ReferenceAlias Property Alias_Key_Scene03 Auto Const Mandatory

ReferenceAlias Property Alias_MQ204Ship Auto Const Mandatory

Faction Property CrimeFactionUCSysDef Auto Const Mandatory

Quest Property CF05_Guard_SpeechChallenge01 Auto Const Mandatory

ReferenceAlias Property Alias_StateChangeMarker Auto Const Mandatory
