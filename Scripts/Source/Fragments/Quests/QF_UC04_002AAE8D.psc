;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC04_002AAE8D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
SetStage(105)
ObjectReference HadrianREF = Alias_Hadrian.GetRef()
HadrianREF.Enable()
HadrianREF.Moveto(HadrianInitialSceneMarker)
Game.GetPlayer().Moveto(DebugMarker01)

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
SetStage(105)
ObjectReference HadrianREF = Alias_Hadrian.GetRef()
HadrianREF.Enable()
HadrianREF.Moveto(HadrianSceneMarker)
Alias_Player.GetRef().MoveTo(DebugMarker02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
SetStage(105)
SetStage(300)
ObjectReference HadrianREF = Alias_Hadrian.GetRef()
HadrianREF.Enable()
HadrianREF.Moveto(HadrianInitialSceneMarker)
Game.GetPlayer().Moveto(DebugMarker03a)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
SetStage(105)
SetStage(300)
SetStage(350)
SetStage(355)
ObjectReference HadrianREF = Alias_Hadrian.GetRef()
HadrianREF.Enable()
HadrianREF.Moveto(DebugMarker04a)
Alias_Player.GetRef().MoveTo(DebugMarker03)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
FFNewAtlantis01.SetStage(10)
FFNewAtlantis01.Stop()
Game.GetPlayer().AddItem(TestVSWeapons)
ObjectReference HadrianREF = Alias_Hadrian.GetRef()
HadrianREF.Enable()
HadrianREF.Moveto(HadrianNATMarker)
Alias_NatStationEnableMarker.GetRef().Disable()
Alias_SpaceportEnableMarker.GetRef().Disable()
UC03_Spaceport_EnableMarker_Actors.Disable()
SetStage(405)
SetStage(425)
SetStage(550)
SetStage(600)
Alias_Player.GetRef().MoveTo(DebugMarker05)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveCompleted(500)

;Turn off the MQ106 hunter
Alias_StarbornHunter.GetRef().Disable()
UC_NA_CL_GagarinTransferScene.SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
ObjectReference HadrianREF = Alias_Hadrian.GetRef()
HadrianREF.Enable()
HadrianREF.Moveto(HadrianStarportMarker)
Alias_NatStationEnableMarker.GetRef().Disable()
Alias_SpaceportEnableMarker.GetRef().Disable()
UC03_Spaceport_EnableMarker_Actors.Disable()
SetStage(425)
SetStage(430)
SetStage(500)
SetStage(550)
SetStage(600)
SetStage(800)
SetStage(850)
Alias_Terrormorph_Viewport.GetActorRef().Kill()
Alias_Player.GetRef().MoveTo(DebugMarker07)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveCompleted(500)
SetObjectiveCompleted(600)
SetObjectiveCompleted(650)
SetObjectiveCompleted(690)
SetObjectiveCompleted(800)
UC03_450_MinistersSceneCont.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
SetStage(105)
SetStage(300)
SetStage(350)
SetStage(355)
SetStage(405)
SetStage(425)
SetStage(431)
ObjectReference HadrianREF = Alias_Hadrian.GetRef()
HadrianREF.Enable()
HadrianREF.MoveTo(HadrianAdminTeleportMarker)
Alias_Player.GetRef().MoveTo(UC03_DebugMarker08a)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetObjectiveCompleted(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
SetStage(105)
SetStage(300)
SetStage(350)
SetStage(360)
SetStage(355)
SetStage(405)
SetStage(425)
SetStage(431)
SetStage(600)
ObjectReference HadrianREF = Alias_Hadrian.GetRef()
HadrianREF.Enable()
HadrianREF.MoveTo(HadrianAdminTeleportMarker)
Alias_Player.GetRef().MoveTo(UC03_DebugMarker08a)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetObjectiveCompleted(350)
UC03_450_MinistersSceneCont.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
SetStage(450)

UC04_AttackActive.SetValue(1)
Alias_NatStationEnableMarker.GetRef().Disable()
Alias_SpaceportEnableMarker.GetRef().Disable()
UC03_Spaceport_EnableMarker_Actors.Disable()
Alias_TarmacEnableMarker.GetRef().Enable()
Alias_MinisterHallEmergencyDoor.GetRef().Unlock()
kmyquest.SetUpAttackState()
FFNewAtlantis01.SetStage(10)
FFNewAtlantis01.Stop()
DialogueUCNAConvo_SecurityOffice.Start()
DialogueUCNAConvo_SecurityOffice.Stop()

Game.GetPlayer().AddItem(TestVSWeapons)
Game.GetPlayer().Moveto(DebugMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Actor PlayREF = Game.GetPlayer()
CrTerrormorphMindControl.Cast(PlayREF, PlayREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
ObjectReference HadrianREF = Alias_Hadrian.GetRef()
HadrianREF.Moveto(DebugMarker04a)
Alias_NatStationEnableMarker.GetRef().Disable()
Alias_SpaceportEnableMarker.GetRef().Disable()
UC03_Spaceport_EnableMarker_Actors.Disable()
Alias_ChiefYasin.GetRef().Disable()
SetStage(425)
SetStage(430)
SetStage(500)
SetStage(550)
SetStage(600)
SetStage(800)
SetStage(850)
SetStage(900)
SetStage(959)
Alias_Player.GetRef().MoveTo(DebugMarker03)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveCompleted(500)
SetObjectiveCompleted(600)
SetObjectiveCompleted(650)
SetObjectiveCompleted(690)
SetObjectiveCompleted(800)
UC03_450_MinistersSceneCont.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
ObjectReference HadrianREF = Alias_Hadrian.GetRef()
HadrianREF.Enable()
HadrianREF.Moveto(HadrianStarportMarker)
Alias_NatStationEnableMarker.GetRef().Disable()
Alias_SpaceportEnableMarker.GetRef().Disable()
SetStage(425)
SetStage(430)
SetStage(500)
SetStage(550)
SetStage(600)
SetStage(800)
Alias_Terrormorph_Viewport.GetActorRef().Kill()
Alias_Terrormorph_Spaceport.GetActorRef().Kill()
Alias_Player.GetRef().MoveTo(UC05_DebugMarker13)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveCompleted(500)
SetObjectiveCompleted(600)
SetObjectiveCompleted(650)
SetObjectiveCompleted(690)
UC03_450_MinistersSceneCont.Stop()
Utility.Wait(5.0)
SetStage(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
UC04_DEBUG_LastTimeOnTheUC.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ToggleShutter(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Get Jakob sandboxing in the right spot in RDHQ
UC04_JakobSandboxing_PostUC03.SetValue(1)

SetObjectiveDisplayed(100)
SetActive()

;Get the Lodge secret door added to the main Lodge door collection so we 
;can manipulate them all later
Alias_LodgeDoorsExt.AddRef(Alias_LodgeSecretDoor.GetRef())

;Prevent cargo ships from landing for the duration
SQ_CargoShipsStayInOrbit.SetValue(1)

;Turn off the Gagarin transfer folks
Alias_GagarinBusinessman.GetRef().Disable()
Alias_GagarinBusinesswoman.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
;Disable Hadrian's Ship
Alias_HadrianShip.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
UC04_200_HadrianAttractScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_HadrianData.GetRef())

SetObjectiveCompleted(100)
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
Alias_ResourceOfficer.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0343_Item_00
Function Fragment_Stage_0343_Item_00()
;BEGIN CODE
UC02_HadrianKnowsPlayerIsVanguard.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0345_Item_00
Function Fragment_Stage_0345_Item_00()
;BEGIN CODE
;Save for the player here. Things are about to get real
Game.RequestSave()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0347_Item_00
Function Fragment_Stage_0347_Item_00()
;BEGIN CODE
UC03_PlayerKnows_TerrormorphProjectFailed.Setvalue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE uc09questscript
Quest __temp = self as Quest
uc09questscript kmyQuest = __temp as uc09questscript
;END AUTOCAST
;BEGIN CODE
;Hadrian will ignore friendly hits from here on out
Alias_Hadrian.GetActorRef().IgnoreFriendlyHits(true)

kmyquest.GetNPCsInPlace()

;Locking the Lodge doors now to keep the player from possibly 
;kicking off MQ204
if !MQ204.GetStageDone(600)
  ((self as Quest) as UC04_QuestScript).LockAllDoors(Alias_LodgeDoorsExt, true)

  ;SF1629: Turn on a trigger informing the player to complete
  ;the quest to regain access to the Lodge
  Alias_LodgeDoorTriggers.EnableAll()
endif

;Turn off Male Worker 04. Gets turned back on in UC05, stage 307
Alias_MASTMaleWorker04.GetRef().Disable()

if !GetStageDone(4) && !GetStageDone(8)
  UC04_350_AnnoucementScene.Start()
endif 

SetObjectiveCompleted(100)
SetObjectiveDisplayed(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0351_Item_00
Function Fragment_Stage_0351_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
;Make sure Hadrian's in the cell and in the right package
Actor HadACT = Alias_Hadrian.GetActorRef()
HadACT.MoveTo(HadrianAdminTeleportMarker)
HadACT.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(350)
SetObjectiveDisplayed(410)
UC03_400_MinisterScene.Start()

;Snap Hadrian into place
Alias_Hadrian.GetRef().MoveTo(UC04_Hadrian_Scene400Marker)

;Get everyone in the minister's hall ghosted up
kmyquest.ToggleMinistersHallNPCsGhosted(true)

;Reset the viewport morphs to get them to the player's level
Alias_Terrormorph_Spaceport.GetActorRef().Reset()
Alias_Terrormorph_Spaceport02.GetActorRef().Reset()
Alias_Terrormorph_Viewport.GetActorRef().Reset()

;Turn off crime
UC04_TurnOffArrestScene.SetValue(1)
MQ204_TurnOffCF01Arrest.SetValue(1)
Game.SetPlayerReportCrime(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0402_Item_00
Function Fragment_Stage_0402_Item_00()
;BEGIN CODE
Alias_ChiefYasin.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0403_Item_00
Function Fragment_Stage_0403_Item_00()
;BEGIN CODE
Alias_ChiefYasin.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.AttackEnableLayer = InputEnableLayer.Create()
kmyquest.AttackEnableLayer.EnableFastTravel(false)
kmyquest.AttackEnableLayer.EnableTakeoff(false)

;Lock all the elevators
kmyquest.ToggleElevatorCollAccessibility(Alias_PrimaryFloorManagers, false)
kmyquest.ToggleElevatorCollAccessibility(Alias_AttackPathFloorManagers, false)
kmyquest.ToggleElevatorCollAccessibility(Alias_VanguardCourseFloorManagers, false)
kmyquest.ToggleElevatorCollAccessibility(Alias_VanguardRecruitmentFloorManagers, false)
kmyquest.ToggleElevatorCollAccessibility(Alias_WellFloorManagers, false)

;Set the MAST elevator inoperable
(Alias_MinisterHallFloorManager.GetRef() as LoadElevatorManagerScript).SetElevatorOperational(false)

;Lock the door to the well
(Alias_SpaceportDoorToWell.GetRef() as LoadElevatorManagerScript).SetElevatorOperational(false)

;Lock the door to the roof in the Minister's Hall
ObjectReference EmDoorREF = Alias_MinisterHallEmergencyDoor.GetRef()
EmDoorREF.Lock()
EmDoorREF.SetLockLevel(254)

;Global used to track when the player can travel around New Atlantis again
UC04_LockdownActive.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0407_Item_00
Function Fragment_Stage_0407_Item_00()
;BEGIN CODE
UC_PlayerDealthwithCFConsequences.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0408_Item_00
Function Fragment_Stage_0408_Item_00()
;BEGIN CODE
Alias_ChiefYasin.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
UC04_CabinetConvincePoints.Mod(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0416_Item_00
Function Fragment_Stage_0416_Item_00()
;BEGIN CODE
UC04_CabinetConvincePoints.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
UC04_CabinetConvincePoints.Mod(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0421_Item_00
Function Fragment_Stage_0421_Item_00()
;BEGIN CODE
UC04_CabinetConvincePoints.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0422_Item_00
Function Fragment_Stage_0422_Item_00()
;BEGIN CODE
UC04_CabinetConvincePoints.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0423_Item_00
Function Fragment_Stage_0423_Item_00()
;BEGIN CODE
SetStage(422)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0424_Item_00
Function Fragment_Stage_0424_Item_00()
;BEGIN CODE
UC04_CabinetConvincePoints.Mod(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
QST_UC04_Distant_Explosion.Play(Alias_WindowMarker.GetRef())
if !GetStageDone(5)
  UC03_450_MinistersSceneCont.Start()
endif

;Toggle on the screens in the Minister's Hall.
;Get turned off in UC05
((self as Quest) as UC04_ToggleHallScreens).UpdateHallScreens(true)

;Get the emergency lights turned on
kmyquest.ToggleEmergencyLights(true)

SetObjectiveCompleted(410)
SetObjectiveDisplayed(425)

;Get Hadrian in the right package
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
;Player convinced 
UC04_ConvincedYasin.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0452_Item_00
Function Fragment_Stage_0452_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ToggleShutter(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0455_Item_00
Function Fragment_Stage_0455_Item_00()
;BEGIN CODE
Alias_AdmiralLogan.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0456_Item_00
Function Fragment_Stage_0456_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ToggleInteriorAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(410)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
;Set up the state change
UC04_AttackActive.SetValue(1)
UC04_MASTNatActive.SetValue(1)
Alias_SpaceportNATCar.GetRef().BlockActivation(true, true)
Alias_NatStationEnableMarker.GetRef().Disable()
Alias_SpaceportEnableMarker.GetRef().Disable()
UC03_Spaceport_EnableMarker_Actors.Disable()
Alias_NATGateEnableMarker.GetRef().Disable()
Alias_EMWeapon.GetRef().Enable()
Alias_SpaceportSecurityDoor.GetRef().BlockActivation(true, true)

;This global only manages the crowds at the spaceport so Will
;can reuse this for MQ
;UC04_AttackActive manages the rest
UC04_DisableSpaceportCrowds.SetValue(1)

;Note - this one gets turned off much later than the rest. 
;Only post clean-up state (stage 1000 on DialogueUCFactionAlwaysOn)
Alias_OverhangEnableMarker.GetRef().Disable()
Alias_WarningSignsEnableMarker.GetRef().Disable()
Alias_TarmacEnableMarker.GetRef().Enable()
kmyquest.SetUpAttackState()

;Turn off the crew spawner in NA until the sequence is done
Alias_NACrewSpawner.GetRef().Disable()

;Kill relevant City Life scenes
if !UC_NA_CL_TolimanScene.GetStageDone(1000)
  UC_NA_CL_TolimanScene.SetStage(999)
endif 

if !UC_NA_CL_GagarinTransferScene.GetStageDone(1000)
  UC_NA_CL_GagarinTransferScene.SetStage(999)
endif

if !UC_NA_CL_RealtyOfficeScene.GetStageDone(1000)
  UC_NA_CL_RealtyOfficeScene.SetStage(999)
endif

if !UC_NA_CL_DiplomatScene.GetStageDone(1000)
  UC_NA_CL_DiplomatScene.SetStage(999)
endif

;Disable New Atlantis Crowds
CrowdDisableNA.SetValue(1)

;Disable Tommy Bitlows
Actor TBAct = Alias_TommyBillows.GetActorRef()
TBAct.Disable()

;Turn off the MQ106 hunter
Alias_StarbornHunter.GetRef().Disable()

;CF05 - Make sure that the Jade Dragon isn't sitting at the spaceport
if CF05.IsRunning() && !CF05.GetStageDone(720)
  CF05.SetStage(701)
endif

;Get the player in the proper faction so they're ignored by the other NPCs
Alias_PlayerFriendFaction.ForceRefTo(Game.GetPlayer())

;Set up Hadrian/companion/player to be ignored by the Thralls until the player attacks 'em
Alias_FollowerThrallFriendFaction.AddRef(Alias_Hadrian.GetRef())
Alias_FollowerThrallFriendFaction.AddRef(Game.GetPlayer())

ObjectReference CompACT = Alias_Companion.GetRef()
if CompACT != none
  Alias_FollowerThrallFriendFaction.AddRef(CompACT)
endif

;EVP all the main folks
Alias_PresidentAbello.GetActorRef().EvaluatePackage()
Utility.Wait(2.0)
Alias_ChiefPatel.GetActorRef().EvaluatePackage()
Utility.Wait(0.1)
Alias_ChiefYasin.GetActorRef().EvaluatePackage()
Utility.Wait(0.3)
Alias_AdmiralLogan.GetActorRef().EvaluatePackage()

;Turn on the appropriate WWise events
;ObjectReference PlayAct = Game.GetPlayer()
;WwiseEvent_QST_UC04_NewAtlantis_Terrormorph_ShipDebris_On_State.Play(PlayAct)
;WwiseEvent_QST_NewAtlantis_EmergencyAlarm_On_State.Play(PlayAct)

;Turn on all the table goodies
Alias_TableGoodies.EnableAll()

;Snap the NAT guards into their furnitures
Alias_NatGuard.GetActorRef().SnapIntoInteraction(Alias_NatGuard01Furniture.GetRef())
Alias_NatGuard02.GetActorRef().SnapIntoInteraction(Alias_NatGuard02Furniture.GetRef())

;If the Adoring Fan is active and in NA, and isn't the player's active crew, turn him off
Actor FanACT = Alias_AdoringFan.GetActorRef()
if TraitUnwantedHero.IsRunning() && FanACT.IsEnabled() && FanACT.GetCurrentLocation() == Alias_NewAtlantisLocation.GetLocation() && FanACT != Alias_EliteCrew.GetActorRef()
  SetStage(556)
endif

;Turn off Hadrian's combat dialogue for the NAT scene
UC_Hadrian_ECCombatDialogueActive.SetValue(0)

;Turn off the MQ204 ship if it's around
ObjectReference MQ204Ship = Alias_MQ204Ship.GetRef()

if MQ204Ship != none && MQ204.IsRunning() && !MQ204Ship.IsDisabled()
  MQ204Ship.Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0551_Item_00
Function Fragment_Stage_0551_Item_00()
;BEGIN CODE
;Get the extra hall guards charging in
Alias_BackUpMinisterHallGuards.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0556_Item_00
Function Fragment_Stage_0556_Item_00()
;BEGIN CODE
Alias_AdoringFan.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
if !GetStageDone(610)
  UC04_602_NATGuard_OntoTheNAT.Start()

  SetObjectiveDisplayed(600, false, false)
  SetObjectiveDisplayed(570)

  ;Get Hadrian's EM Orion equipped
  ObjectReference HadEM = Alias_EMOrion.GetRef()
  Actor HadACT = Alias_Hadrian.GetActorRef()
  ;SF-26546: Make sure Hadrian's got ammo for her new EM rifle
  HadACT.AddItem(AmmoLaser, 100)
  HadACT.AddItem(HadEM)
  HadACT.RemoveItem(Crew_Elite_Orion)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0575_Item_00
Function Fragment_Stage_0575_Item_00()
;BEGIN CODE
SetObjectiveCompleted(570)
if !GetStageDone(580) && !GetStageDone(590)
  SetObjectiveDisplayed(575)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0577_Item_00
Function Fragment_Stage_0577_Item_00()
;BEGIN CODE
;if !GetStageDone(585) && !GetStageDone(586) && !GetStageDone(590)
;  UC04_602_NATGuard_OntoTheNAT.Stop()
;  UC04_577_NATGuards_SpeakToPlayer.Start()
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0580_Item_00
Function Fragment_Stage_0580_Item_00()
;BEGIN CODE
if !GetStageDone(590)
  SetObjectiveCompleted(570)
  SetObjectiveCompleted(575)

  ;Get the right objective showing, based on whether the player
  ;equipped the EM weapon directly or has it in their inventory
  Actor PlayACT = Game.GetPlayer()
  if PlayACT.WornHasKeyword(WeaponTypeEM)
    SetObjectiveDisplayed(580)
    SetStage(581)
  else
    SetObjectiveDisplayed(581)
  endif
endif

Game.GetPlayer().EquipItem(Alias_EMWeapon.GetRef())
Game.GetPlayer().AddItem(AmmoLaser, 200)

UC04_580_Hadrian_EMWeaponAcquired.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0581_Item_00
Function Fragment_Stage_0581_Item_00()
;BEGIN CODE
SetObjectiveSkipped(570)
SetObjectiveSkipped(575)
SetObjectiveCompleted(581)
SetObjectiveDisplayed(580)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0582_Item_00
Function Fragment_Stage_0582_Item_00()
;BEGIN CODE
if !GetStageDone(610)
  UC04_582_Hadrian_UseEMWeapon.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0585_Item_00
Function Fragment_Stage_0585_Item_00()
;BEGIN CODE
Actor ThrallF01 = Alias_NATThrallF01.GetActorRef()
Actor ThrallF02 = Alias_NATThrallF01.GetActorRef()
Actor ThrallM01 = Alias_NATThrallM01.GetActorRef()
Actor ThrallM02 = Alias_NATThrallM02.GetActorRef()
Actor NGA01 = Alias_NatGuard.GetActorRef()
Actor NGA02 = Alias_NatGuard02.GetActorRef()

;Let the player's followers jump in on the fun
Alias_FollowerThrallFriendFaction.RemoveAll()

;Get the thralls focusing on the player
Actor PlayACT = Game.GetPlayer()
UC04_NATThrallFaction.SetEnemy(PlayerFaction)
NGA01.RemoveFromFaction(UC04_NATThrallEnemyFaction)
NGA02.RemoveFromFaction(UC04_NATThrallEnemyFaction)
Alias_FollowerThrallFriendFaction.AddRef(NGA01)
Alias_FollowerThrallFriendFaction.AddRef(NGA02)
ThrallF01.SetValue(Aggression, 1.0)
ThrallF02.SetValue(Aggression, 1.0)
ThrallM01.SetValue(Aggression, 1.0)
ThrallM02.SetValue(Aggression, 1.0)
ThrallF01.StopCombat()
ThrallF02.StopCombat()
ThrallM01.StopCombat()
ThrallM02.StopCombat()
ThrallF01.StartCombat(PlayACT)
ThrallF02.StartCombat(PlayACT)
ThrallM01.StartCombat(PlayACT)
ThrallM02.StartCombat(PlayACT)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0586_Item_00
Function Fragment_Stage_0586_Item_00()
;BEGIN CODE
Alias_NatGuard02.GetActorRef().EvaluatePackage()
Actor PA = Alias_Hadrian.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleActive(PA, false)
(SQ_Followers as SQ_FollowersScript).CommandFollow(PA)
PA.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0587_Item_00
Function Fragment_Stage_0587_Item_00()
;BEGIN CODE
Actor NTM02 = Alias_NatThrallM02.GetActorRef()
NTM02.SetValue(Aggression, 0.0)
NTM02.RemoveFromFaction(UC04_NATThrallFaction)
NTM02.AddToFaction(UC04_NATGuardFriendFaction)
NTM02.StopCombatAlarm()

if (GetStageDone(589) || GetStageDone(592)) && (GetStageDone(588) || GetStageDone(591))  && (GetStageDone(602) || GetStageDone(603))
  SetStage(590)
elseif !GetStageDone(583)
  UC04_583_Hadrian_FirstStunned.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0588_Item_00
Function Fragment_Stage_0588_Item_00()
;BEGIN CODE
Actor NTM01 = Alias_NatThrallM01.GetActorRef()
NTM01.SetValue(Aggression, 0.0)
NTM01.RemoveFromFaction(UC04_NATThrallFaction)
NTM01.AddToFaction(UC04_NATGuardFriendFaction)
NTM01.StopCombatAlarm()

if (GetStageDone(589) || GetStageDone(592)) && (GetStageDone(587) || GetStageDone(593)) && (GetStageDone(602) || GetStageDone(603))
  SetStage(590)
elseif !GetStageDone(583)
  UC04_583_Hadrian_FirstStunned.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0589_Item_00
Function Fragment_Stage_0589_Item_00()
;BEGIN CODE
Actor NTF01 = Alias_NatThrallF01.GetActorRef()
NTF01.SetValue(Aggression, 0.0)
NTF01.RemoveFromFaction(UC04_NATThrallFaction)
NTF01.AddToFaction(UC04_NATGuardFriendFaction)
NTF01.StopCombatAlarm()

if (GetStageDone(588) || GetStageDone(591)) && (GetStageDone(587) || GetStageDone(593)) && (GetStageDone(602) || GetStageDone(603))
  SetStage(590)
elseif !GetStageDone(583)
  UC04_583_Hadrian_FirstStunned.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN CODE
SetObjectiveSkipped(570)
SetObjectiveSkipped(575)
SetObjectiveSkipped(581)
SetObjectiveCompleted(580)
SetObjectiveDisplayed(590)

;Stop combat on all the Thralls one more time
Actor F01 = Alias_NatThrallF01.GetActorRef()
Actor F02 = Alias_NatThrallF02.GetActorRef()
Actor M01 = Alias_NatThrallM01.GetActorRef()
Actor M02 = Alias_NatThrallM02.GetActorRef()

F01.StopCombat()
F02.StopCombat()
M01.StopCombat()
M02.StopCombat()
F01.StopCombatAlarm()
F02.StopCombatAlarm()
M01.StopCombatAlarm()
M02.StopCombatAlarm()


Actor NGA01 = Alias_NatGuard.GetActorRef()
Actor NGA02 = Alias_NatGuard02.GetActorRef()
NGA01.SetValue(Invulnerable, 0.0)
NGA02.SetValue(Invulnerable, 0.0)
NGA02.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0591_Item_00
Function Fragment_Stage_0591_Item_00()
;BEGIN CODE
UC04_NAT_ThrallsKilled.Mod(1)

if (GetStageDone(589) || GetStageDone(592)) && (GetStageDone(587) || GetStageDone(593)) && (GetStageDone(602) || GetStageDone(603))
  SetStage(590)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0592_Item_00
Function Fragment_Stage_0592_Item_00()
;BEGIN CODE
UC04_NAT_ThrallsKilled.Mod(1)

if (GetStageDone(588) || GetStageDone(591)) && (GetStageDone(587) || GetStageDone(593)) && (GetStageDone(602) || GetStageDone(603))
  SetStage(590)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0593_Item_00
Function Fragment_Stage_0593_Item_00()
;BEGIN CODE
UC04_NAT_ThrallsKilled.Mod(1)

if (GetStageDone(589) || GetStageDone(592)) && (GetStageDone(588) || GetStageDone(591)) && (GetStageDone(602) || GetStageDone(603))
  SetStage(590)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0594_Item_00
Function Fragment_Stage_0594_Item_00()
;BEGIN CODE
UC04_NAT_ThrallsKilled.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0595_Item_00
Function Fragment_Stage_0595_Item_00()
;BEGIN CODE
SetObjectiveCompleted(590)
SetObjectiveDisplayed(600)

;Unblock activation on the NAT
Alias_NATActivator.GetRef().BlockActivation(false, false)

;Get everyone into their new packages
Alias_NatGuard.GetActorRef().EvaluatePackage()
Alias_NatGuard02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0599_Item_00
Function Fragment_Stage_0599_Item_00()
;BEGIN CODE
Alias_ThrallEnableMarker.GetRef().Disable()
SetStage(590)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
UC04_600_Hadrian_ConfirmOrders.Start()

;Get the state change in place
SetStage(550)

;Get all the NPCs set up to be "Ignore Friendly Hits" to the player
Alias_EssentialGuards.AddRefCollection(Alias_SpaceportGuards)
Alias_SpaceportGuards.AddRef(Alias_OfficerSaleh.GetRef())

;Get everyone into a faction where they're allied with the player
Alias_AlliedGuards.AddRefCollection(Alias_SpaceportGuards)
Alias_AlliedGuards.AddRefCollection(Alias_WoundedSoliders)
Alias_AlliedGuards.AddRef(Alias_SpaceportMedic.GetRef())
Alias_AlliedGuards.AddRef(Alias_NatGuard.GetRef())
Alias_AlliedGuards.AddRef(Alias_NatGuard02.GetRef())

;Then mark them all as Ignore Friendly hits
(Alias_EssentialGuards as UC03_SpaceportGuardRefColl).MarkCollectionIgnoreFriendlyHits(Alias_SpaceportGuards)
(Alias_WoundedSoliders as UC03_SpaceportGuardRefColl).MarkCollectionIgnoreFriendlyHits(Alias_WoundedSoliders)
Alias_SpaceportMedic.GetActorRef().IgnoreFriendlyHits(true)
Alias_NatGuard.GetRef().IgnoreFriendlyHits(true)
Alias_NatGuard02.GetRef().IgnoreFriendlyHits(true)

;Turn on officer Yumi and get him in place
Actor YumiREF = Alias_OfficerSaleh.GetActorRef()
YumiREF.Enable()
YumiREF.MoveTo(UC04_OfficerYumi_Scene700Marker)
YumiREF.EvaluatePackage()

;Make Hadrian a follower of the player
Actor PA = Alias_Hadrian.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleActive(PA, true)
(SQ_Followers as SQ_FollowersScript).CommandFollow(PA)

;Enable the fire team
Actor FTM = Alias_FireTeamMarine_Essential.GetActorRef()
Actor FTC = Alias_FireTeamMarineCaptain_Essential.GetActorRef()
FTC.IgnoreFriendlyHits(true)
FTM.IgnoreFriendlyHits(true)
FTC.Enable()
FTM.Enable()

;Turn off their idles
FTC.SetValue(IdleChatterTimeMin, -1.0)
FTC.SetValue(IdleChatterTimeMax, -1.0)
FTM.SetValue(IdleChatterTimeMin, -1.0)
FTM.SetValue(IdleChatterTimeMax, -1.0)

;Get everyone turned on for the Thrall fight
Alias_NATGuard.GetRef().Enable()
Alias_ThrallEnableMarker.GetRef().Enable()

;Disable the Resource Officer
Alias_ResourceOfficer.GetRef().Disable()

;Get the extra hall guards primed and ready to charge and turn on their trigger
Alias_Trigger551.GetRef().Enable()
Alias_BackUpMinisterHallGuards.EnableAll()

;Set the MAST elevator operable again
(Alias_MinisterHallFloorManager.GetRef() as LoadElevatorManagerScript).SetElevatorOperational(true)

;Unlock the elevator in the Minister's Hall
kmyquest.ToggleElevatorCollAccessibility(Alias_AttackPathFloorManagers, true)

;Block activation on the NAT
Alias_NATActivator.GetRef().BlockActivation(true, true)

;Get the run-in guards in place
kmyquest.MoveRunInGuardsToStartLocations()

;Make sure that the Gagarin scene is off
if !UC_NA_CL_GagarinTransferScene.GetStageDone(1000)
  UC_NA_CL_GagarinTransferScene.SetStage(999)
endif

SetObjectiveCompleted(425)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0601_Item_00
Function Fragment_Stage_0601_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
Actor NGA01 = Alias_NatGuard.GetActorRef()
Actor NGA02 = Alias_NatGuard02.GetActorRef()
Actor NTM01 = Alias_NatThrallM01.GetActorRef()
Actor NTM02 = Alias_NatThrallM02.GetActorRef()
Actor NTF01 = Alias_NatThrallF01.GetActorRef()
Actor NTF02 = Alias_NatThrallF02.GetActorRef()

NGA01.SetValue(Invulnerable, 1.0)
NGA02.SetValue(Invulnerable, 1.0)

;Make sure that the Gagarin scene is off
if GetStageDone(9)
  UC_NA_CL_GagarinTransferScene.SetStage(999)
endif

kmyquest.ToggleInteriorAlarm(false)

Utility.Wait(2.0)
NGA01.AddToFaction(UC04_NATThrallEnemyFaction)
NGA02.AddToFaction(UC04_NATThrallEnemyFaction)
NTF01.StartCombat(NGA02, true)
NTM02.StartCombat(NGA02, true)
NTM01.StartCombat(NGA01, true)
NTF02.StartCombat(NGA01, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0602_Item_00
Function Fragment_Stage_0602_Item_00()
;BEGIN CODE
Actor NTF02 = Alias_NatThrallF02.GetActorRef()
NTF02.SetValue(Aggression, 0.0)
NTF02.RemoveFromFaction(UC04_NATThrallFaction)
NTF02.AddToFaction(UC04_NATGuardFriendFaction)
NTF02.StopCombatAlarm()

if (GetStageDone(589) || GetStageDone(592)) && (GetStageDone(588) || GetStageDone(591))  && (GetStageDone(587) || GetStageDone(593))
  SetStage(590)
elseif !GetStageDone(583)
  UC04_583_Hadrian_FirstStunned.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0603_Item_00
Function Fragment_Stage_0603_Item_00()
;BEGIN CODE
UC04_NAT_ThrallsKilled.Mod(1)

if (GetStageDone(589) || GetStageDone(592)) && (GetStageDone(587) || GetStageDone(593)) && (GetStageDone(588) || GetStageDone(591))
  SetStage(590)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0606_Item_00
Function Fragment_Stage_0606_Item_00()
;BEGIN CODE
Alias_NATThrallM02.GetActorRef().SetNoBleedoutRecovery(true)
SetStage(587)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0607_Item_00
Function Fragment_Stage_0607_Item_00()
;BEGIN CODE
Alias_NATThrallM01.GetActorRef().SetNoBleedoutRecovery(true)
SetStage(588)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0608_Item_00
Function Fragment_Stage_0608_Item_00()
;BEGIN CODE
Alias_NATThrallF01.GetActorRef().SetNoBleedoutRecovery(true)
SetStage(589)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0609_Item_00
Function Fragment_Stage_0609_Item_00()
;BEGIN CODE
Alias_NATThrallF02.GetActorRef().SetNoBleedoutRecovery(true)
SetStage(602)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
;Kill any earlier ambient scenes that could've gotten stuck
UC04_582_Hadrian_UseEMWeapon.Stop()
UC04_580_Hadrian_EMWeaponAcquired.Stop()
UC04_583_Hadrian_FirstStunned.Stop()
Actor HadrianACT = Alias_Hadrian.GetActorRef()

;Remove Hadrian's EM weapon
ObjectReference HadEM = Alias_EMOrion.GetRef()
Actor HadACT = Alias_Hadrian.GetActorRef()
HadACT.RemoveItem(HadEM)
if HadACT.GetItemCount(Crew_Elite_Orion) < 1
  HadACT.EquipItem(Crew_Elite_Orion)
endif

HadrianACT.MoveTo(HadrianTeleportMarker)

;Have her say her line
if !GetStageDone(800)
  UC03_610_HadrianShout.Start()
endif

;Move Hadrian to the lower NAT station
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(HadrianACT, false)
HadrianACT.EvaluatePackage()

;Register for folks getting mind controlled
kmyquest.RegisterForMindControlEvents()

;Enable the viewport Terrormorph and get it fighting UC security
Actor TVRef = Alias_Terrormorph_Viewport.GetActorRef()
TVRef.Moveto(Alias_TerrormorphSpawn_Viewport.GetRef())
TVRef.SetGhost(true)
TVRef.Enable()

;Get the kill target for the Viewport morph turned on
Actor TMKillPartnerACT = Alias_ViewportTMKillPartner.GetActorRef()
TMKillPartnerACT.SetGhost(true)
TMKillPartnerACT.Enable()

;Snap them both into their interaction points
ObjectReference KillREF = Alias_KillFurniture.GetRef()
TMKillPartnerACT.SnapIntoInteraction(KillREF)
TVRef.SnapIntoInteraction(KillREF)

;Get everyone shooting at the morph
Alias_SpaceportGuards.StartCombatAll(TVRef)

;Get their killed scene up and running
UC04_610a_TerrormorphPairedKillAnim.Start()

;Also get the Spaceport morphs online and their ambush triggers
Actor TMPort01 = Alias_Terrormorph_Spaceport.GetActorRef()
Actor TMPort02 = Alias_Terrormorph_Spaceport02.GetActorRef()
TMPort01.Enable()
TMPort02.Enable()
TMPort01.SetUnconscious(true)
TMPort02.SetUnconscious(true)
Alias_Terrormorph_Spaceport_AmbushTrigger01.GetRef().Enable()
Alias_Terrormorph_Spaceport_AmbushTrigger02.GetRef().Enable()

;Turn off the Thralls at the NAT
Alias_ThrallEnableMarker.GetRef().Disable()

;Unblock activation on the NAT one more time, just in case
Alias_NATActivator.GetRef().BlockActivation(false, false)

;Turn on the emergency lights
kmyquest.ToggleEmergencyLights()

;Turn Hadrian's combat dialogue back on
UC_Hadrian_ECCombatDialogueActive.SetValue(1)

;Get proper perk applied to the spaceport guards
kmyquest.TogglePerkOnCollection(Alias_SpaceportGuards, UC04_SpaceportGuard_ReduceMorphDamage)

SetObjectiveSkipped(570)
SetObjectiveSkipped(575)
SetObjectiveSkipped(580)
SetObjectiveSkipped(590)
SetObjectiveCompleted(600)
SetObjectiveDisplayed(610)

;Save for the player here. Things are now, in fact, real
Game.RequestSave()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0615_Item_00
Function Fragment_Stage_0615_Item_00()
;BEGIN CODE
UC04_615_EmergencyBroadcast02.Start()

;Get the guards running in
Alias_RunInGuards.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
UC04_615_MedicScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;Kill Hadrian's shout scene
UC03_610_HadrianShout.Stop()

SetObjectiveCompleted(600)
SetObjectiveCompleted(610)

;Get the Viewport morph and the Guard into their furniture
Alias_ViewportTMKillPartner.GetActorRef().EvaluatePackage()
Alias_Terrormorph_Viewport.GetActorRef().EvaluatePackage()

;Clear the essential state of the guards
Alias_EssentialGuards.RemoveAll()

;Pull the protected status from the Terrormorph
Alias_Terrormorph_Viewport_Protected.Clear()

if Alias_Terrormorph_Viewport.GetActorRef().IsDead()
  SetObjectiveDisplayed(690)
else
  SetObjectiveDisplayed(650)
  UC03_650_SalehShout.Start()
endif

Utility.Wait(2.0)
Alias_Hadrian.GetActorRef().EvaluatePackage()
Utility.Wait(2.0)
SetStage(651)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0651_Item_00
Function Fragment_Stage_0651_Item_00()
;BEGIN CODE
;Just in case, let's try and unghost that morph one more time
Alias_Terrormorph_Viewport.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0655_Item_00
Function Fragment_Stage_0655_Item_00()
;BEGIN CODE
Alias_Terrormorph_Viewport.GetActorRef().EvaluatePackage()
Actor TMKillPartnerACT = Alias_ViewportTMKillPartner.GetActorRef()
TMKillPartnerACT.SetGhost(false)
TMKillPartnerACT.EvaluatePackage()

;Just in case, let's try and unghost that morph one more time
Alias_Terrormorph_Viewport.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0689_Item_00
Function Fragment_Stage_0689_Item_00()
;BEGIN CODE
;Also get the critter out of its furniture
SetStage(651)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
;Kill Hadrian's shout scene
UC03_610_HadrianShout.Stop()

SetObjectiveCompleted(650)

if !GetStageDone(850)

  if GetStageDone(650)
    SetObjectiveDisplayed(690)
  endif

  ;Get the Marines in the Spaceport Guards collection
  Actor FTMREF = Alias_FireteamMarine.GetActorRef()
  FTMREF.EvaluatePackage()

  Actor FTMCREF = Alias_FireteamMarineCaptain.GetActorRef()
  FTMCREF.EvaluatePackage()

  ;Get Hadrian back as a follower to the player
  Actor PA = Alias_Hadrian.GetActorRef()
  (SQ_Followers as SQ_FollowersScript).SetRoleActive(PA, false)
  (SQ_Followers as SQ_FollowersScript).CommandFollow(PA)

  Alias_OfficerSaleh.GetActorRef().EvaluatePackage()

  ;Player the companion's reaction scene
  UC04_695_Yumi_Post2ndMorphKilled.Start()
else

  SetObjectiveDisplayed(850)

  ;Turn on the global for all the post-attack dialogue
  UC04_PostAttackDialogueActive.SetValue(1)

  ;Unreigster for mind control events
  kmyquest.UnregisterForMindControlEvents()

  ;Disable Yasin until the end of UC05
  Alias_ChiefYasin.GetRef().Disable()

  ;Get Abello in position for her scene
  Alias_PresidentAbello.GetRef().Moveto(HadrianAdminTeleportMarker)

  ;Get the NAT back to MAST turned back on
  UC04_MASTNatActive.SetValue(0)
  Alias_SpaceportNATCar.GetRef().BlockActivation(false, false)

  ;Make sure MAST NAT is unblocked again
  Alias_NATActivator.GetRef().BlockActivation(false, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0715_Item_00
Function Fragment_Stage_0715_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(UC04_ContrabandLockerKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0716_Item_00
Function Fragment_Stage_0716_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(UC04_ContrabandLockerKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0717_Item_00
Function Fragment_Stage_0717_Item_00()
;BEGIN CODE
SetObjectiveCompleted(715)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
UC03_DEBUG_AdditionalMurderToys.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN CODE
UC04_PlayerKilledAnyGuard.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
;Wake the tarmac morphs up if you haven't already
SetStage(815)

Alias_Hadrian.GetActorRef().EvaluatePackage()
Alias_FireteamMarine.GetActorRef().EvaluatePackage()
Alias_FireteamMarineCaptain.GetActorRef().EvaluatePackage()

if GetStageDone(690) && !GetStageDone(850)
  SetObjectiveCompleted(690)
  SetObjectiveDisplayedAtTop(800)
  SetObjectiveDisplayed(801)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0805_Item_00
Function Fragment_Stage_0805_Item_00()
;BEGIN CODE
SetObjectiveCompleted(801)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
Actor FTMREF = Alias_FireteamMarine.GetActorRef()
FTMREF.EvaluatePackage()
Alias_FireteamMarine_Essential.Clear()

Actor FTMCREF = Alias_FireteamMarineCaptain.GetActorRef()
FTMCREF.EvaluatePackage()
Alias_FireteamMarineCaptain_Essential.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0815_Item_00
Function Fragment_Stage_0815_Item_00()
;BEGIN CODE
Actor TMPort01 = Alias_Terrormorph_Spaceport.GetActorRef()
Actor TMPort02 = Alias_Terrormorph_Spaceport02.GetActorRef()
TMPort01.SetUnconscious(false)
TMPort02.SetUnconscious(false)
TMPort01.SetProtected(false)
TMPort02.SetProtected(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.UnregisterForMindControlEvents()
UC04_820_Hadrian_MarinesMindControlled.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0825_Item_00
Function Fragment_Stage_0825_Item_00()
;BEGIN CODE
SetStage(820)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
if GetStageDone(835)
  SetStage(850)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0835_Item_00
Function Fragment_Stage_0835_Item_00()
;BEGIN CODE
if GetStageDone(830)
  SetStage(850)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0845_Item_00
Function Fragment_Stage_0845_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(801)
  SetObjectiveFailed(801)
endif

if UC04_AttackActive.GetValue() >= 1
  UC04_MarinesDied.SetValue(1)

  ;Increment the death count
  kmyquest.IncrementGuardDeathCount()

  if GetStageDone(847)
    SetStage(849)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0847_Item_00
Function Fragment_Stage_0847_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
if UC04_AttackActive.GetValue() >= 1
  UC04_MarinesDied.SetValue(1)

  ;Increment the guard death count
  kmyquest.IncrementGuardDeathCount()

  if GetStageDone(845)
    SetStage(849)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(800)

;Turn off the wounded NAT guard
Alias_NATGuard.GetRef().Disable()

;Turn off the back up guards
Alias_BackUpMinisterHallGuards.DisableAll()

if !GetStageDone(700) && UC04_695_Yumi_Post2ndMorphKilled.IsPlaying()
  UC04_695_Yumi_Post2ndMorphKilled.Stop()
endif

if GetStageDone(690)
  if !IsObjectiveCompleted(801)
    SetObjectiveDisplayed(801, false, false)
  endif

  if GetStageDone(800)
    SetObjectiveDisplayed(850)
  endif

  ;Play Hadrian's post-kill scene
  UC04_848_CompanionRxn_FinalTerrormorphDead.Start()

  ;Turn on the global for all the post-attack dialogue
  UC04_PostAttackDialogueActive.SetValue(1)

  ;Unreigster for mind control events
  kmyquest.UnregisterForMindControlEvents()

  ;Prevent the Marines from being followers
  kmyquest.ToggleMarineFollowers(0)

  ;Disable Yasin until the end of UC05
  Alias_ChiefYasin.GetRef().Disable()

  ;Get Abello in position for her scene
  Alias_PresidentAbello.GetRef().Moveto(HadrianAdminTeleportMarker)

  ;Get Sarkin and Logan in the right spots
  Alias_ChiefSarkin.GetRef().Moveto(UC03_ChiefSarkin_Scene900)
  Alias_AdmiralLogan.GetRef().Moveto(UC03_AdmiralLogan_Scene900)

  ;Let the player get to the MAST NAT station now
  UC04_MASTNatActive.SetValue(0)
  Alias_SpaceportNATCar.GetRef().BlockActivation(false, false)

  ;Make sure MAST NAT is unblocked again
  Alias_NATActivator.GetRef().BlockActivation(false, false)
endif

;Remove the damage perk from the guards
;Get proper perk applied to the spaceport guards
kmyquest.TogglePerkOnCollection(Alias_SpaceportGuards, UC04_SpaceportGuard_ReduceMorphDamage, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0851_Item_00
Function Fragment_Stage_0851_Item_00()
;BEGIN CODE
Alias_OfficerSaleh.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
UC04_860_SituationResolvedScene.Start()
;Turn off the alarm WWise events
;ObjectReference PlayAct = Game.GetPlayer()
;WwiseEvent_QST_NewAtlantis_EmergencyAlarm_Off_State.Play(PlayAct)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(690)
SetObjectiveCompleted(850)
SetObjectiveDisplayed(900)

;Make sure Hadrian's a follower at this point
Actor PA = Alias_Hadrian.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleActive(PA, false)
(SQ_Followers as SQ_FollowersScript).CommandFollow(PA)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
;Lock off the elevator again
(Alias_MinisterHallFloorManager.GetRef() as LoadElevatorManagerScript).SetElevatorOperational(false)

SetObjectiveCompleted(850)
SetObjectiveDisplayed(900)

UC04_910_PresAttract.Start()

;Reset all the living guards
kmyquest.ResetLivingSpaceportGuards()

;Get the emergency lights turned off
kmyquest.ToggleEmergencyLights(false)

UC04_AttackActive.SetValue(0)
Alias_NatStationEnableMarker.GetRef().Enable()
Alias_SpaceportEnableMarker.GetRef().Enable()
UC03_Spaceport_EnableMarker_Actors.Enable()
Alias_NATGateEnableMarker.GetRef().Enable()
Alias_WarningSignsEnableMarker.GetRef().Enable()
Alias_ReconstructionMarker.GetRef().Disable()
kmyquest.SetUpAttackState(false)
kmyquest.DisableRefifDeadRefCollection()
UC04_DisableSpaceportCrowds.SetValue(0)

;Clean up all the dead morphs
Alias_Terrormorph_Viewport.GetRef().Disable()
Alias_Terrormorph_Spaceport.GetRef().Disable()
Alias_Terrormorph_Spaceport02.GetRef().Disable()
Alias_Terrormorph_Spaceport_AmbushTrigger01.GetRef().Disable()
Alias_Terrormorph_Spaceport_AmbushTrigger02.GetRef().Disable()

;Enable the Resource Officer
Alias_ResourceOfficer.GetRef().Enable()

;Turn the crew spawner back on again
Alias_NACrewSpawner.GetRef().Enable()

;Turn off the paired kill partner
Alias_ViewportTMKillPartner.GetRef().Disable()

;re-enable New Atlantis Crowds
CrowdDisableNA.SetValue(0)

;Turn on the MQ106 hunter
Alias_StarbornHunter.GetRef().Enable()

;Folks are no longer friends of the player
Alias_PlayerFriendFaction.Clear()

;Get the guards back to fighting the player
(Alias_EssentialGuards as UC03_SpaceportGuardRefColl).MarkCollectionIgnoreFriendlyHits(Alias_SpaceportGuards, false)

;Turn off Hadrian's follower behavior
Actor PA = Alias_Hadrian.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(PA, false)

;Turn off the debris WWise events
;ObjectReference PlayAct = Game.GetPlayer()
;WwiseEvent_QST_UC04_NewAtlantis_Terrormorph_ShipDebris_Off_State.Play(PlayAct)

;Try turning off the alarms again if it didn't take earlier
;WwiseEvent_QST_NewAtlantis_EmergencyAlarm_Off_State.Play(PlayAct)

;Disable all the unclaimed table goodies
Alias_TableGoodies.DisableAll()

;Unblock activation on the NAT one more time, just in case
Alias_NATActivator.GetRef().BlockActivation(false, false)

;Get the Adoring Fan turned back on if we turned him off earlier
Actor FanACT = Alias_AdoringFan.GetActorRef()
if TraitUnwantedHero.IsRunning() && !FanACT.IsEnabled() && FanACT.GetCurrentLocation() == Alias_NewAtlantisLocation.GetLocation() && FanACT != Alias_EliteCrew.GetActorRef()
  FanACT.Enable()
endif

;If the player didn't pick up the EM weapon, clean that up now
if !GetStageDone(580)
  Alias_EMWeapon.GetRef().Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0911_Item_00
Function Fragment_Stage_0911_Item_00()
;BEGIN CODE
Alias_AdmiralLogan.GetActorRef().EvaluatePackage()
Alias_ChiefSarkin.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE uc04_questscript
Quest __temp = self as Quest
uc04_questscript kmyQuest = __temp as uc04_questscript
;END AUTOCAST
;BEGIN CODE
;Start the timer to disable the tarmac state change
DialogueUCFactionAlwaysOn.SetStage(990)

;Turn the arrest scenes back on
UC04_TurnOffArrestScene.SetValue(0)
MQ204_TurnOffCF01Arrest.SetValue(0)

;Turn crime back on
Game.SetPlayerReportCrime(true)

kmyquest.AttackEnableLayer.Delete()

;Unlock the door to the Well
;Lock the door to the well
(Alias_SpaceportDoorToWell.GetRef() as LoadElevatorManagerScript).SetElevatorOperational(true)

;SF1629: Turn off triggers informing the player to complete
;the quest to regain access to the Lodge
Alias_LodgeDoorTriggers.DisableAll()

;Unlock the Lodge
((self as Quest) as UC04_QuestScript).LockAllDoors(Alias_LodgeDoorsExt, false)

;Get the elevator operable one last time
(Alias_MinisterHallFloorManager.GetRef() as LoadElevatorManagerScript).SetElevatorOperational(true)

;Unlock the elevators again
kmyquest.ToggleElevatorCollAccessibility(Alias_PrimaryFloorManagers, true)
kmyquest.ToggleElevatorCollAccessibility(Alias_AttackPathFloorManagers, true)
kmyquest.ToggleElevatorCollAccessibility(Alias_VanguardCourseFloorManagers, true)
kmyquest.ToggleElevatorCollAccessibility(Alias_VanguardRecruitmentFloorManagers, true)
kmyquest.ToggleElevatorCollAccessibility(Alias_WellFloorManagers, true)

;Get the door up to the roof from the Minister's hall reopened again
ObjectReference EmDoorREF = Alias_MinisterHallEmergencyDoor.GetRef()
EmDoorRef.SetLockLevel(0)
EmDoorRef.Unlock()

;Reopen the security door
Alias_SpaceportSecurityDoor.GetRef().BlockActivation(false, false)

;Reenable Bitlows
Alias_TommyBillows.GetActorRef().Enable()

;Get cargo ships flying back in again
SQ_CargoShipsStayInOrbit.SetValue(0)

;Update Hadrian's name to have "Major" in there
Alias_Hadrian.GetRef().SetOverrideName(UC04_HadrianNameUpdate)

;CF05 - Bring back the Jade Dragon if appropriate
if CF05.IsRunning() && !CF05.GetStageDone(720)
  CF05.SetStage(702)
endif

; RAD02 - Light in the Darkness - queue up the interview for this quest
RAD02.SetStage(400)

;Unblock activation on the NAT one more time, just in case
Alias_NATActivator.GetRef().BlockActivation(false, false)

;Unghost everyone in the Minister's Hall
kmyquest.ToggleMinistersHallNPCsGhosted(false)

;Make sure Hadrian's combat dialogue is back on
UC_Hadrian_ECCombatDialogueActive.SetValue(1)

UC04_LockdownActive.SetValue(0)

;One more time for turning off the lights
kmyquest.ToggleEmergencyLights(false)

;Check to turn the MQ204 ship back on
ObjectReference MQ204Ship = Alias_MQ204Ship.GetRef()
if MQ204.IsRunning() && !CF05.IsRunning() && MQ204Ship != none && MQ204Ship.IsDisabled()
  MQ204Ship.Enable()
endif

CompleteAllObjectives()
UC05.Start()
UC05.SetStage(110)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property UC03_400_MinisterScene Auto Const Mandatory

Message Property UC03_DEBUG_ExplosionInTheDistance Auto Const

Scene Property UC03_450_MinistersSceneCont Auto Const Mandatory

ReferenceAlias Property Alias_NATStationEnableMarker Auto Const Mandatory

ObjectReference Property HadrianTeleportMarker Auto Const

ReferenceAlias Property Alias_Hadrian Auto Const Mandatory

Scene Property UC03_610_HadrianShout Auto Const Mandatory

Message Property UC03_DEBUG_AdditionalMurderToys Auto Const Mandatory

Scene Property UC03_650_SalehShout Auto Const Mandatory

ReferenceAlias Property Alias_Terrormorph_Viewport Auto Const Mandatory

RefCollectionAlias Property Alias_EssentialGuards Auto Const Mandatory

RefCollectionAlias Property Alias_SpaceportGuards Auto Const Mandatory

Message Property UC03_DEBUG_PaintTheScene800 Auto Const Mandatory

ReferenceAlias Property Alias_Terrormorph_Spaceport Auto Const Mandatory

ReferenceAlias Property Alias_OfficerSaleh Auto Const Mandatory

ObjectReference Property DebugMarker01 Auto Const

ReferenceAlias Property Alias_Player Auto Const Mandatory

ObjectReference Property DebugMarker02 Auto Const

ObjectReference Property HadrianSceneMarker Auto Const

ObjectReference Property DebugMarker03 Auto Const

ObjectReference Property DebugMarker04 Auto Const

ReferenceAlias Property Alias_MinisterHallEmergencyDoor Auto Const Mandatory

ObjectReference Property HadrianNATMarker Auto Const

ObjectReference Property DebugMarker05 Auto Const

Message Property UC03_DEBUG_MoveToSpaceport Auto Const Mandatory

ReferenceAlias Property Alias_SpaceportEnableMarker Auto Const Mandatory

LeveledItem Property TestVSWeapons Auto Const Mandatory

ObjectReference Property DebugMarker07 Auto Const

ObjectReference Property HadrianStarportMarker Auto Const

ObjectReference Property HadrianMASTNATMarker Auto Const

Scene Property UC04_200_HadrianAttractScene Auto Const Mandatory

ReferenceAlias Property Alias_HadrianData Auto Const Mandatory

ReferenceAlias Property Alias_ResourceOfficer Auto Const Mandatory

Scene Property UC04_350_HadrianPreCabinetScene Auto Const Mandatory

ReferenceAlias Property Alias_FireTeamMarine_Essential Auto Const Mandatory

ReferenceAlias Property Alias_FireTeamMarineCaptain_Essential Auto Const Mandatory

GlobalVariable Property UC04_MarinesDied Auto Const Mandatory

Quest Property UC05 Auto Const Mandatory

GlobalVariable Property UC04_AttackActive Auto Const Mandatory

ReferenceAlias Property Alias_AdmiralLogan Auto Const Mandatory

Scene Property UC04_910_PresAttract Auto Const Mandatory

ReferenceAlias Property Alias_ChiefSarkin Auto Const Mandatory

ReferenceAlias Property Alias_TarmacEnableMarker Auto Const Mandatory

Quest Property DialogueUCNewAtlantisUC01Vanguard Auto Const Mandatory

Scene Property UC04_615_MedicScene Auto Const Mandatory

Key Property UC04_ContrabandLockerKey Auto Const Mandatory

Quest Property FFNewAtlantis01 Auto Const Mandatory

Quest Property DialogueUCNAConvo_SecurityOffice Auto Const Mandatory

ReferenceAlias Property Alias_FireTeamMarine Auto Const Mandatory

ReferenceAlias Property Alias_FireTeamMarineCaptain Auto Const Mandatory

GlobalVariable Property UC04_PostAttackDialogueActive Auto Const Mandatory

Scene Property UC04_605_EmergencyAnnouncementScene Auto Const Mandatory

Scene Property UC04_615_EmergencyBroadcast02 Auto Const Mandatory

ReferenceAlias Property Alias_NACrewSpawner Auto Const Mandatory

Scene Property UC04_690_CompanionRxn_FirstTerrormorphDead Auto Const Mandatory

ObjectReference Property HadrianInitialSceneMarker Auto Const Mandatory

Scene Property UC04_350_AnnoucementScene Auto Const Mandatory

ObjectReference Property HadrianAdminTeleportMarker Auto Const Mandatory

ObjectReference Property DebugMarker02a Auto Const

ObjectReference Property DebugMarker03a Auto Const

ObjectReference Property DebugMarker04a Auto Const

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

GlobalVariable Property UC04_CabinetConvincePoints Auto Const Mandatory

Message Property UC04_DEBUG_AnimationIssues Auto Const Mandatory

ObjectReference Property UC03_DebugMarker08a Auto Const Mandatory

Message Property UC04_DEBUG_MoveToNATStation Auto Const Mandatory

ReferenceAlias Property Alias_MinisterHallElevator Auto Const Mandatory

ReferenceAlias Property Alias_PresidentAbello Auto Const Mandatory

ReferenceAlias Property Alias_ChiefPatel Auto Const Mandatory

ReferenceAlias Property Alias_ChiefYasin Auto Const Mandatory

ReferenceAlias Property Alias_MinisterHallGuard Auto Const Mandatory

SPELL Property CrTerrormorphMindControl Auto Const Mandatory

Scene Property UC04_860_SituationResolvedScene Auto Const Mandatory

GlobalVariable Property UC04_ConvincedYasin Auto Const Mandatory

GlobalVariable Property UC04_LockdownActive Auto Const Mandatory

GlobalVariable Property UC04_JakobSandboxing_PostUC03 Auto Const Mandatory

Message Property UC04_DEBUG_WhatsChanged Auto Const Mandatory

Message Property UC04_DEBUG_LastTimeOnTheUC Auto Const Mandatory

ObjectReference Property UC04_Hadrian_Scene400Marker Auto Const Mandatory

ObjectReference Property UC05_DebugMarker13 Auto Const Mandatory

Message Property UC04_HadrianNameUpdate Auto Const Mandatory

GlobalVariable Property CrowdDisableNA Auto Const Mandatory

ReferenceAlias Property Alias_TerrormorphSpawn_Viewport Auto Const Mandatory

GlobalVariable Property UC02_HadrianKnowsPlayerIsVanguard Auto Const Mandatory

GlobalVariable Property UC03_PlayerKnows_TerrormorphProjectFailed Auto Const Mandatory

GlobalVariable Property UC04_PlayerKilledAnyGuard Auto Const Mandatory

Scene Property UC04_695_Yumi_Post2ndMorphKilled Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory

RefCollectionAlias Property Alias_PrimaryFloorManagers Auto Const Mandatory

RefCollectionAlias Property Alias_AttackPathFloorManagers Auto Const Mandatory

RefCollectionAlias Property Alias_VanguardCourseFloorManagers Auto Const Mandatory

RefCollectionAlias Property Alias_VanguardRecruitmentFloorManagers Auto Const Mandatory

ReferenceAlias Property Alias_TommyBillows Auto Const Mandatory

ReferenceAlias Property Alias_SpaceportDoorToWell Auto Const Mandatory

ReferenceAlias Property Alias_PlayerFriendFaction Auto Const Mandatory

RefCollectionAlias Property Alias_WoundedSoliders Auto Const Mandatory

ReferenceAlias Property Alias_SpaceportMedic Auto Const Mandatory

RefCollectionAlias Property Alias_LodgeDoorsExt Auto Const Mandatory

ReferenceAlias Property Alias_LodgeSecretDoor Auto Const Mandatory

Quest Property MQ204 Auto Const Mandatory

RefCollectionAlias Property Alias_SpaceportCrew Auto Const Mandatory

RefCollectionAlias Property Alias_IACrew Auto Const Mandatory

Scene Property UC04_820_Hadrian_MarinesMindControlled Auto Const Mandatory

GlobalVariable Property SQ_CargoShipsStayInOrbit Auto Const Mandatory

ReferenceAlias Property Alias_WarningSignsEnableMarker Auto Const Mandatory

GlobalVariable Property UC_PlayerDealthwithCFConsequences Auto Const Mandatory

RefCollectionAlias Property Alias_AlliedGuards Auto Const Mandatory

Scene Property UC04_600_Hadrian_ConfirmOrders Auto Const Mandatory

Scene Property UC04_602_NATGuard_OntoTheNAT Auto Const Mandatory

ReferenceAlias Property Alias_Terrormorph_Viewport_Protected Auto Const Mandatory

ActorValue Property IdleChatterTimeMax Auto Const Mandatory

ActorValue Property IdleChatterTimeMin Auto Const Mandatory

ObjectReference Property UC03_ChiefSarkin_Scene900 Auto Const Mandatory

ObjectReference Property UC03_AdmiralLogan_Scene900 Auto Const Mandatory

ReferenceAlias Property Alias_ReconstructionMarker Auto Const Mandatory

Quest Property DialogueUCFactionAlwaysOn Auto Const Mandatory

Scene Property UC04_550_CabinetPostMainScene Auto Const Mandatory

Quest Property RAD02 Auto Const Mandatory

WwiseEvent Property QST_UC04_Distant_Explosion Auto Const Mandatory

ReferenceAlias Property Alias_WindowMarker Auto Const Mandatory

ReferenceAlias Property Alias_NATGuard02 Auto Const Mandatory

Faction Property UC04_NATThrallFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_NATGuard Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Scene Property UC04_577_NATGuards_SpeakToPlayer Auto Const Mandatory

Scene Property UC04_590_Hadrian_EMWeaponAcquired Auto Const Mandatory

Ammo Property AmmoLaser Auto Const Mandatory

ReferenceAlias Property Alias_EMWeapon Auto Const Mandatory

Faction Property UC04_NATThrallEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_NATThrallF01 Auto Const Mandatory

ReferenceAlias Property Alias_NATThrallM01 Auto Const Mandatory

ReferenceAlias Property Alias_NATThrallM02 Auto Const Mandatory

Faction Property UC04_NATGuardFriendFaction Auto Const Mandatory

GlobalVariable Property UC04_NAT_ThrallsKilled Auto Const Mandatory

Keyword Property UC04_Thrall_KnockedOutKeyword Auto Const Mandatory

Scene Property UC04_580_Hadrian_EMWeaponAcquired Auto Const Mandatory

ReferenceAlias Property Alias_NATActivator Auto Const Mandatory

Scene Property UC04_583_Hadrian_FirstStunned Auto Const Mandatory

ReferenceAlias Property Alias_ThrallEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Terrormorph_Spaceport02 Auto Const Mandatory

ReferenceAlias Property Alias_StarbornHunter Auto Const Mandatory

Quest Property UC_NA_CL_TolimanScene Auto Const Mandatory

ReferenceAlias Property Alias_ViewportTMKillPartner Auto Const Mandatory

Quest Property UC_NA_CL_GagarinTransferScene Auto Const Mandatory

Quest Property UC_NA_CL_RealtyOfficeScene Auto Const Mandatory

Quest Property UC_NA_CL_DiplomatScene Auto Const Mandatory

ReferenceAlias Property Alias_HadrianShip Auto Const Mandatory

RefCollectionAlias Property Alias_WellFloorManagers Auto Const Mandatory

ObjectReference Property UC04_OfficerYumi_Scene700Marker Auto Const Mandatory

GlobalVariable Property UC04_MASTNatActive Auto Const Mandatory

ReferenceAlias Property Alias_OverhangEnableMarker Auto Const Mandatory

Keyword Property WeaponTypeEM Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory

RefCollectionAlias Property Alias_FollowerThrallFriendFaction Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

Scene Property UC04_582_Hadrian_UseEMWeapon Auto Const Mandatory

ReferenceAlias Property Alias_NATThrallF02 Auto Const Mandatory

RefCollectionAlias Property Alias_BackUpMinisterHallGuards Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC04_NewAtlantis_Terrormorph_ShipDebris_On_State Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_NewAtlantis_EmergencyAlarm_On_State Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC04_NewAtlantis_Terrormorph_ShipDebris_Off_State Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_NewAtlantis_EmergencyAlarm_Off_State Auto Const Mandatory

Scene Property UC04_610a_TerrormorphPairedKillAnim Auto Const Mandatory

ReferenceAlias Property Alias_KillFurniture Auto Const Mandatory

ReferenceAlias Property Alias_Terrormorph_Spaceport_AmbushTrigger01 Auto Const Mandatory

ReferenceAlias Property Alias_Terrormorph_Spaceport_AmbushTrigger02 Auto Const Mandatory

RefCollectionAlias Property Alias_TableGoodies Auto Const Mandatory

GlobalVariable Property UC04_DisableSpaceportCrowds Auto Const Mandatory

ReferenceAlias Property Alias_Trigger551 Auto Const Mandatory

ObjectReference Property UC03_Spaceport_EnableMarker_Actors Auto Const Mandatory

ReferenceAlias Property Alias_MASTMaleWorker04 Auto Const Mandatory

ReferenceAlias Property Alias_MinisterHallFloorManager Auto Const Mandatory

Scene Property UC04_848_CompanionRxn_FinalTerrormorphDead Auto Const Mandatory

ReferenceAlias Property Alias_NatGuard02Furniture Auto Const Mandatory

ReferenceAlias Property Alias_NatGuard01Furniture Auto Const Mandatory

ReferenceAlias Property Alias_GagarinBusinesswoman Auto Const Mandatory

ReferenceAlias Property Alias_GagarinBusinessman Auto Const Mandatory

RefCollectionAlias Property Alias_RunInGuards Auto Const Mandatory

ReferenceAlias Property Alias_NATGateEnableMarker Auto Const Mandatory

Perk Property UC04_SpaceportGuard_ReduceMorphDamage Auto Const Mandatory

ReferenceAlias Property Alias_TriggerStationInterior Auto Const Mandatory

Location Property UC04_Terrormorph_CustomLoc Auto Const Mandatory

ReferenceAlias Property Alias_SpaceportNATCar Auto Const Mandatory

ReferenceAlias Property Alias_AdoringFan Auto Const Mandatory

Quest Property TraitUnwantedHero Auto Const Mandatory

ReferenceAlias Property Alias_EliteCrew Auto Const Mandatory

LocationAlias Property Alias_NewAtlantisLocation Auto Const Mandatory

ReferenceAlias Property Alias_EMOrion Auto Const Mandatory

Weapon Property Crew_Elite_Orion Auto Const Mandatory

GlobalVariable Property UC_Hadrian_ECCombatDialogueActive Auto Const Mandatory

ReferenceAlias Property Alias_SpaceportSecurityDoor Auto Const Mandatory

ReferenceAlias Property Alias_MQ204Ship Auto Const Mandatory

ActorValue Property Invulnerable Auto Const Mandatory

GlobalVariable Property UC04_TurnOffArrestScene Auto Const Mandatory

GlobalVariable Property MQ204_TurnOffCF01Arrest Auto Const Mandatory

RefCollectionAlias Property Alias_LodgeDoorTriggers Auto Const Mandatory
