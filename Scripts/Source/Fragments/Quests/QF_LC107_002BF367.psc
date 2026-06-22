;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC107_002BF367 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Quickstart - Entrance

;Set the Quickstart Helper stage.
SetStage(9)

;Set relevant prior stages.
CF07.SetStage(220)
CF07.SetStage(230)
SetStage(20)
SetStage(190)

;Give the player quest items up to this point.
Actor playerRef = Game.GetPlayer()
playerRef.AddItem(Alias_DataCoreEmpty.GetRef())
;playerRef.AddItem(Alias_DataCoreFull.GetRef())
;playerRef.AddItem(Alias_CaptainTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef())

;Move the player.
playerRef.MoveTo(LC107_EntranceMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Quickstart - Vault Entrance

;Set the Quickstart Helper stage.
SetStage(9)

;Set relevant prior stages.
CF07.SetStage(220)
CF07.SetStage(230)
SetStage(20)
SetStage(190)
SetStage(200)

;Give the player quest items up to this point.
Actor playerRef = Game.GetPlayer()
playerRef.AddItem(Alias_DataCoreEmpty.GetRef())
;playerRef.AddItem(Alias_DataCoreFull.GetRef())
;playerRef.AddItem(Alias_CaptainTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef())

;Move the player.
playerRef.MoveTo(LC107_VaultEntranceMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Quickstart - Engineering

;Set the Quickstart Helper stage.
SetStage(9)

;Set relevant prior stages.
CF07.SetStage(220)
CF07.SetStage(230)
SetStage(20)
SetStage(190)
SetStage(200)
SetStage(240)
SetStage(250)

;Give the player quest items up to this point.
Actor playerRef = Game.GetPlayer()
playerRef.AddItem(Alias_DataCoreEmpty.GetRef())
;playerRef.AddItem(Alias_DataCoreFull.GetRef())
playerRef.AddItem(Alias_CaptainTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef())

;Move the player.
playerRef.MoveTo(LC107_EngineeringMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Quickstart - Vault Floor

;Set the Quickstart Helper stage.
SetStage(9)

;Set relevant prior stages.
CF07.SetStage(220)
CF07.SetStage(230)
SetStage(20)
SetStage(190)
SetStage(200)
SetStage(220)
SetStage(240)
SetStage(250)
SetStage(270)
SetStage(290)
SetStage(300)
SetStage(310)

;Open quickstart doors.
Alias_QuickstartDoors.SetOpen(True)

;Give the player quest items up to this point.
Actor playerRef = Game.GetPlayer()
playerRef.AddItem(Alias_DataCoreEmpty.GetRef())
;playerRef.AddItem(Alias_DataCoreFull.GetRef())
playerRef.AddItem(Alias_CaptainTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef())

;Move the player.
playerRef.MoveTo(LC107_VaultFloorMarkerRef)

;Display the Quickstart Complete message.
kMyQuest.WaitForCredTankInitialization()
Debug.Notification("Quickstart complete.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Quickstart - Vault Control

;Set the Quickstart Helper stage.
SetStage(9)

;Set relevant prior stages.
CF07.SetStage(220)
CF07.SetStage(230)
CF07.SetStage(270)
CF07.SetStage(275)
CF07.SetStage(276)
CF07.SetStage(280)
CF07.SetStage(290)
SetStage(20)
SetStage(190)
SetStage(200)
SetStage(240)

;Open quickstart doors.
Alias_QuickstartDoors.SetOpen(True)

;Give the player quest items up to this point.
Actor playerRef = Game.GetPlayer()
playerRef.AddItem(Alias_DataCoreEmpty.GetRef())
;playerRef.AddItem(Alias_DataCoreFull.GetRef())
playerRef.AddItem(Alias_CaptainTransferModule.GetRef())
playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef())
playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef())

;Move the player.
playerRef.MoveTo(LC107_ControlRoomMarkerRef)

;Display the Quickstart Complete message.
kMyQuest.WaitForCredTankInitialization()
Debug.Notification("Quickstart complete.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Quickstart - Escape Vault Control

;Set the Quickstart Helper stage.
SetStage(9)

;Set relevant prior stages.
SetStage(20)
SetStage(190)
SetStage(200)
SetStage(240)

;Open quickstart doors.
Alias_QuickstartDoors.SetOpen(True)

;Give the player quest items up to this point.
Actor playerRef = Game.GetPlayer()
;playerRef.AddItem(Alias_DataCoreEmpty.GetRef())
playerRef.AddItem(Alias_DataCoreFull.GetRef())
playerRef.AddItem(Alias_CaptainTransferModule.GetRef())
playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef())
playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef())

;Disable the Entry Enemies.
Alias_EntryEnemies.DisableAll()

;Move the player.
playerRef.MoveTo(LC107_ControlRoomMarkerRef)

;Start the escape.
SetStage(510)
SetStage(515)
SetStage(521)
CF07.SetStage(400)

;Display the Quickstart Complete message.
Debug.Notification("Quickstart complete.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Quickstart - Escape Engine Room

;Set the Quickstart Helper stage.
SetStage(9)

;Set relevant prior stages.
SetStage(20)
SetStage(190)
SetStage(200)
SetStage(240)

;Open quickstart doors.
Alias_QuickstartDoors.SetOpen(True)

;Give the player quest items up to this point.
Actor playerRef = Game.GetPlayer()
;playerRef.AddItem(Alias_DataCoreEmpty.GetRef())
playerRef.AddItem(Alias_DataCoreFull.GetRef())
playerRef.AddItem(Alias_CaptainTransferModule.GetRef())
playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef())
playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef())

;Disable the Entry Enemies.
Alias_EntryEnemies.DisableAll()

;Move the player.
playerRef.MoveTo(LC107_EscapeEngineMarkerRef)

;Start the escape.
SetStage(510)
SetStage(515)
SetStage(521)
CF07.SetStage(400)

;Display the Quickstart Complete message.
Debug.Notification("Quickstart complete.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Quickstart - Escape Engineering

;Set the Quickstart Helper stage.
SetStage(9)

;Set relevant prior stages.
SetStage(20)
SetStage(190)
SetStage(200)
SetStage(240)
SetStage(600)

;Open quickstart doors.
Alias_QuickstartDoors.SetOpen(True)

;Give the player quest items up to this point.
Actor playerRef = Game.GetPlayer()
;playerRef.AddItem(Alias_DataCoreEmpty.GetRef())
playerRef.AddItem(Alias_DataCoreFull.GetRef())
playerRef.AddItem(Alias_CaptainTransferModule.GetRef())
playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef())
playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef())

;Disable the Entry Enemies.
Alias_EntryEnemies.DisableAll()

;Move the player.
playerRef.MoveTo(LC107_EscapeEngineeringMarkerRef)

;Start the escape.
SetStage(510)
SetStage(515)
SetStage(521)
CF07.SetStage(400)

;Display the Quickstart Complete message.
Debug.Notification("Quickstart complete.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
;Quickstart - Escape Vault Entrance

;Set the Quickstart Helper stage.
SetStage(9)

;Set relevant prior stages.
SetStage(20)
SetStage(190)
SetStage(200)
SetStage(240)
SetStage(650)

;Open quickstart doors.
Alias_QuickstartDoors.SetOpen(True)

;Give the player quest items up to this point.
Actor playerRef = Game.GetPlayer()
;playerRef.AddItem(Alias_DataCoreEmpty.GetRef())
playerRef.AddItem(Alias_DataCoreFull.GetRef())
playerRef.AddItem(Alias_CaptainTransferModule.GetRef())
playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef())
playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef())

;Disable the Entry Enemies.
Alias_EntryEnemies.DisableAll()

;Move the player.
playerRef.MoveTo(LC107_EscapeVaultEntranceMarkerRef)

;Start the escape.
SetStage(510)
SetStage(515)
SetStage(521)
CF07.SetStage(400)

;Display the Quickstart Complete message.
Debug.Notification("Quickstart complete.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
;Quickstart Helper, called by all quickstarts.

;Set the standard CF Quickstart stage.
CF_Main.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Startup

;Set the reactors to their initial states.
kMyQuest.SetReactorState(Alias_ReactorsMain, kMyQuest.CONST_ReactorState_Inactive)
kMyQuest.SetReactorState(Alias_ReactorsAux, kMyQuest.CONST_ReactorState_Active)

;Disable refs that exist only for navmesh gen.
Alias_NavmeshGenOnlyRefs.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Alias Script, Captain's Transfer Module

;When the player picks up the Captain's Transfer Module,
;reset the CredTank script on all of the standard CredTanks
;in the cell so they'll animate on proximity.
kMyQuest.ResetStandardCredTanks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
;Set by: Alias Script, Kryx's Transfer Module
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
;Set by: Alias Script, Kryx's Log
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Set by: LC107_EngineRoomComputer_Desktop

;Give the player Osterholt's Safe Code from the terminal entry.
Game.GetPlayer().AddItem(LC107_EngineeringSafeKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Quickstart - Space, No Conduction Grid

;Set the Quickstart Helper stage.
SetStage(9)

;Set relevant prior stages.
CF07.SetStage(210)
SetStage(20)

;Give the player quest items up to this point.
Actor playerRef = Game.GetPlayer()
playerRef.AddItem(Alias_DataCoreEmpty.GetRef())
;playerRef.AddItem(Alias_DataCoreFull.GetRef())
;playerRef.AddItem(Alias_CaptainTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef())

;Move the player onto a ship and into space.
kMyQuest.DEBUG_GoToSpaceAndWait(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Quickstart - Space, No Conduction Grid

;Set the Quickstart Helper stage.
SetStage(9)

;Set relevant prior stages.
CF07.SetStage(210)
SetStage(20)

;Give the player quest items up to this point.
Actor playerRef = Game.GetPlayer()
playerRef.AddItem(Alias_DataCoreEmpty.GetRef())
;playerRef.AddItem(Alias_DataCoreFull.GetRef())
;playerRef.AddItem(Alias_CaptainTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxTransferModule.GetRef())
;playerRef.AddItem(Alias_JasperKryxSlateFinal.GetRef())

;Move the player onto a ship and into space.
kMyQuest.DEBUG_GoToSpaceAndWait(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF07 stage 210, or quickstart.

;Enable the ships and the Unknown Ship map marker.
SpaceshipReference legacyRef = Alias_LegacyShip.GetShipRef()
SpaceshipReference erebosRef = Alias_ErebosShip.GetShipRef()
legacyRef.Enable()
erebosRef.Enable()
erebosRef.InstantDock(legacyRef)
Alias_UnknownShipMapMarker.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, UpdateArrivalProcess.

if (!GetStageDone(190))
     ;Play the Approach commentary scene.
     CF07_zzLegacy000_Companion_Storm_Approach.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF07_zzLegacy000_Companion_Storm_Approach, scene end.

;Register for the next stage of the arrival process.
kMyQuest.UpdateArrivalProcess()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Set by: Quest Script, UpdateArrivalProcess.

if (!GetStageDone(190))
     ;Play the During commentary scene.
     CF07_zzLegacy001_Companion_Storm_During.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0151_Item_00
Function Fragment_Stage_0151_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF07_zzLegacy001_Companion_Storm_During, scene end.

;Register for the next stage of the arrival process.
kMyQuest.UpdateArrivalProcess()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
;Set by: Quest Script, UpdateArrivalProcess.

;Swap the Map Marker at this point.
SetStage(172)

if (!GetStageDone(190))
     ;Then play the ShipSighted commentary scene.
     CF07_zzLegacy002_Companion_Storm_ShipSighted.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0171_Item_00
Function Fragment_Stage_0171_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF07_zzLegacy002_Companion_Storm_ShipSighted, scene end.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0172_Item_00
Function Fragment_Stage_0172_Item_00()
;BEGIN CODE
;Set by: Quest Script, UpdateArrivalProcess, or stage 170.

;Swap the map markers.
Alias_LegacyShipNameOverride.Clear()
Alias_UnknownShipMapMarker.TryToDisable()
Alias_LegacyShipMapMarker.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
;Set by: Quest Script, on docking with the Legacy.

;Set all prior space stages.
SetStage(100)
SetStage(150)
SetStage(170)
SetStage(172)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set by: Trigger, just inside the entrance.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
;Set by: Trigger, just inside the entrance.

;Play CF07's Lockdown scene.
CF07_zLegacy000_Callout_InitialLockdown.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN CODE
;Set by: Trigger, Cargo Hold.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0204_Item_00
Function Fragment_Stage_0204_Item_00()
;BEGIN CODE
;Set by: Trigger, Crew Quarters (Multiple Rooms)

;Play the companion commentary scene.
CF07_zzLegacy004_Companion_Ship_CrewQuarters.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Set by: Trigger, Vault Entrance Corridor.

;Update CF07 to point the player to the Transfer Module.
CF07.SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Vault Entrance Controls used.

;Open the Vault Entrance Door.
Alias_VaultEntranceDoor.GetRef().SetOpen(True)

;Complete the objective on CF07.
CF07.SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0245_Item_00
Function Fragment_Stage_0245_Item_00()
;BEGIN CODE
;Set by: Trigger, Vault Entrance Hall Scanner
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Set by: Trigger, Vault Entrance Lobby
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
;Set by: Trigger, CredTank Hallway

;Display optional objective.
CF07.SetStage(260)

;Play the companion commentary scene.
CF07_zzLegacy006_Companion_Ship_CredTank.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0265_Item_00
Function Fragment_Stage_0265_Item_00()
;BEGIN CODE
;Set by: CredTank script.

;Complete the objective on CF07.
CF07.SetStage(265)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
;Set by: Trigger, Engineering Section

;Hide the optional objective if necessary.
CF07.SetStage(266)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
;Set by: LC107AlarmActivator_Entry, when triggered.

;Play the Security Alarm scene.
CF07_zLegacy008_Callout_SecurityAlarm.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
;Set by: Trigger, Engineering Section
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set by: Trigger, Vault Floor
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
;Set by: Trigger, inside the Vault.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0302_Item_00
Function Fragment_Stage_0302_Item_00()
;BEGIN CODE
;Set by: Trigger, Vault Floor

;Play the companion commentary scene.
CF07_zzLegacy007_Companion_Ship_CredTankBay.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;Set by: Default Open script, Door to Vault Control Room
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
;Set by: Trigger, Vault Controls Overlook

;Play the companion commentary scene.
CF07_zzLegacy008_Companion_Ship_KryxRemains.Start()

;Update CF07's objective.
CF07.SetStage(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF07 stage 290.

;Unblock the power switches after the player listens to Kryx's log.
kMyQuest.UnblockVaultPowerSwitches()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0331_Item_00
Function Fragment_Stage_0331_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Power Switch 01 activated.

;If both switches have been flipped, proceed.
if (GetStageDone(331) && GetStageDone(332))
     SetStage(333)
Else
     kMyQuest.SetVaultControlsPowerStatus(kMyQuest.CONST_VaultControlsPowerStatus_HalfPower)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0332_Item_00
Function Fragment_Stage_0332_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Power Switch 02 activated.

;If both switches have been flipped, proceed.
if (GetStageDone(331) && GetStageDone(332))
     SetStage(333)
Else
     kMyQuest.SetVaultControlsPowerStatus(kMyQuest.CONST_VaultControlsPowerStatus_HalfPower)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0333_Item_00
Function Fragment_Stage_0333_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Stages 331 & 332.

;Turn on the Vault Control Console.
kMyQuest.SetVaultControlsPowerStatus(kMyQuest.CONST_VaultControlsPowerStatus_Powered)

;Update CF07's objectives.
CF07.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
;Set by: Quest Script, Transfer Module 1 Inserted.

;If both modules have been inserted, proceed.
if (GetStageDone(340) && GetStageDone(341))
     SetStage(342)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0341_Item_00
Function Fragment_Stage_0341_Item_00()
;BEGIN CODE
;Set by: Quest Script, Transfer Module 2 Inserted.

;If both modules have been inserted, proceed.
if (GetStageDone(340) && GetStageDone(341))
     SetStage(342)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0342_Item_00
Function Fragment_Stage_0342_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Stages 341 & 342.

;Update the Vault Control Console.
kMyQuest.SetVaultControlsPowerStatus(kMyQuest.CONST_VaultControlsPowerStatus_ReadyForDataCoreInsert)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0343_Item_00
Function Fragment_Stage_0343_Item_00()
;BEGIN CODE
;Set by: Quest Script, Data Core Inserted.

;Update CF07's objective.
CF07.SetStage(360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0345_Item_00
Function Fragment_Stage_0345_Item_00()
;BEGIN CODE
;Set by: Quest Script, Download Control.

;Begin the data transfer.
SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 343.

;Start the state swap for the rest of the ship.
SetStageNoWait(351)

;Perform the data transfer.
CF07_zLegacy004_Callout_CurrencyTransfer.Start()
CF07.SetStage(370)
kMyQuest.PerformCredTankDataTransfer()

;Then proceed.
SetStage(360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0351_Item_00
Function Fragment_Stage_0351_Item_00()
;BEGIN CODE
;Set by: Stage 350.

;Seal the doors.
ObjectReference vaultControlEntryDoorRef = Alias_VaultControlEntryDoor.GetRef()
vaultControlEntryDoorRef.SetOpen(False)
vaultControlEntryDoorRef.Lock()
vaultControlEntryDoorRef.SetLockLevel(253) ;Requires Terminal

;Offscreen, start the state swap.
LC107_EscapeStateNonvault_DisableMarkerRef.Disable()
LC107_EscapeStateNonvault_EnableMarkerRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 350, when the data transfer has finished.

;Disable Fast Travel from the Legacy to avoid any edge cases.
kMyQuest.DisableFastTravelOnLegacy()

;Update the Vault Control Console.
kMyQuest.SetVaultControlsPowerStatus(kMyQuest.CONST_VaultControlsPowerStatus_DownloadFinished)

;Complete the data transfer.
CF07_zLegacy005_Callout_CurrencyTransferComplete.Start()
CF07.SetStage(380)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
;Set by: Quest Script, Transfer Module 1 Removed.

;If both modules have been removed, proceed.
if (GetStageDone(370) && GetStageDone(371))
     SetStage(372)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0371_Item_00
Function Fragment_Stage_0371_Item_00()
;BEGIN CODE
;Set by: Quest Script, Transfer Module 2 Removed.

;If both modules have been removed, proceed.
if (GetStageDone(370) && GetStageDone(371))
     SetStage(372)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0372_Item_00
Function Fragment_Stage_0372_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Stages 370 & 371.

;Update the Vault Control Console.
kMyQuest.SetVaultControlsPowerStatus(kMyQuest.CONST_VaultControlsPowerStatus_ReadyForDataCoreRemoval)

;Make the Data Core pop up.
kMyQuest.PopupDataCore()

;Then allow it to be removed.
SetStage(373)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0373_Item_00
Function Fragment_Stage_0373_Item_00()
;BEGIN CODE
;Set by: Stage 372.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0374_Item_00
Function Fragment_Stage_0374_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Data Core Removed.

;Make sure the player's controls are locked.
kMyQuest.LockPlayerForEscape()

;Start the Hull Breach Scene, which drives the state swap.
CF07_zLegacy006_Callout_HullBreach.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF07_zLegacy006_Callout_HullBreach / CF03 stage 390

;Play the initial light flicker vfx, ending at black.
kMyQuest.PlayBreachSequenceStartVFX()

;Allow the scene to advance when ready.
SetStage(501)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0501_Item_00
Function Fragment_Stage_0501_Item_00()
;BEGIN CODE
;Set by: Stage 500.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF07_zLegacy006_Callout_HullBreach / CF03 stage 395

;Perf tracking timer.
;Debug.Trace("State Swap-----")
;float startTime = Utility.GetCurrentRealTime()

;Do the things that absolutely have to be done while we're at black.

;Shut down the CredTank rack system. Disable all shelves and tanks.
kMyQuest.CallFunctionNoWait("CredTanksShutdown", None)

;Break the initial hull breaches.
kMyQuest.CallFunctionNoWait("BreakVaultInstantBreaches", None)

;Perform the main enable state swap.
;Debug.Trace("T3: " + (Utility.GetCurrentRealTime() - startTime))
LC107_EscapeStateVault_DisableMarkerRef.Disable()
LC107_EscapeStateVault_EnableMarkerRef.Enable()
LC107_EscapeStateVault_Lighting_EnableMarkerRef.Enable()
;Debug.Trace("T4: " + (Utility.GetCurrentRealTime() - startTime))

;Disable all of the refs that couldn't be enable-parented
;because they required navmesh.
Alias_NavmeshGenInitialRefs.DisableAll()
;Debug.Trace("T5: " + (Utility.GetCurrentRealTime() - startTime))

;Enable Hull Breach triggers.
HullBreachTriggers.EnableAll()
;Debug.Trace("T6: " + (Utility.GetCurrentRealTime() - startTime))

;Wait for the Breaches and CredTanks.
kMyQuest.WaitForBreachesAndCredTanks()
;Debug.Trace("T7: " + (Utility.GetCurrentRealTime() - startTime))

;Perf tracking timer.
;float endTime = Utility.GetCurrentRealTime()
;Debug.Trace("State Swap completed in: " + (endTime-startTime))

;Swap the audio ambience.
Alias_LC107_DestructionAudioSwitchMarker.TryToEnable()

;Turn off the Control Console.
kMyQuest.SetVaultControlsPowerStatus(kMyQuest.CONST_VaultControlsPowerStatus_Shutdown)

;Allow the scene to advance when ready.
SetStage(511)

;Then continue with noncritical setup.
SetStageNoWait(515)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0511_Item_00
Function Fragment_Stage_0511_Item_00()
;BEGIN CODE
;Set by: Stage 510.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 510.

;If the Vault Floor or Vault Control quickstarts were used, disable
;the entry enemies that were bypassed.
if (GetStageDone(3) || GetStageDone(4))
     Alias_EntryEnemies.DisableAll()
EndIf

;Unseal the doors.
ObjectReference vaultControlEntryDoorRef = Alias_VaultControlEntryDoor.GetRef()
vaultControlEntryDoorRef.Unlock()
vaultControlEntryDoorRef.SetOpen(True)

;Enable escape enemies and triggers.
Alias_EscapeTriggers.EnableAll()
Alias_EscapeEnemies.EnableAll()

;Open security and critical-path doors.
Alias_EscapeDoors.SetOpen(True)

;Make sure the Nonvault State Swap happened.
LC107_EscapeStateNonvault_DisableMarkerRef.Disable()
LC107_EscapeStateNonvault_EnableMarkerRef.Enable()

;Set the reactors to their escape state.
kMyQuest.SetReactorState(Alias_ReactorsMain, kMyQuest.CONST_ReactorState_Inactive)
kMyQuest.SetReactorState(Alias_ReactorsAux, kMyQuest.CONST_ReactorState_Inactive)

;Turn off the Vault Control Console.
kMyQuest.SetVaultControlsPowerStatus(kMyQuest.CONST_VaultControlsPowerStatus_Reset)

;Set the cell as a non-sealed environment.
kMyQuest.SetNotSealedEnvironment()

;Break other instant breaches.
kMyQuest.BreakOtherInstantBreaches()

;Damage destructible traps.
kMyQuest.DamageDestructibleTraps()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF07_zLegacy006_Callout_HullBreach / CF03 stage 397

;Play the ending light flicker vfx.
kMyQuest.PlayBreachSequenceEndVFX()

;Unlock player movement.
kMyQuest.UnlockPlayerMovement()

;Allow the scene to advance when ready.
SetStage(521)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0521_Item_00
Function Fragment_Stage_0521_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 520.

;Start ambient explosions, level 0.
kMyQuest.StartAmbientExplosions(0)

;Trigger the two initial timed breaches.
Utility.Wait(2)
(Alias_LC107HullBreachInitialTrigger02.GetRef() as LC107HullBreachTriggerScript).TriggerBreaches()
Utility.Wait(2)
(Alias_LC107HullBreachInitialTrigger01.GetRef() as LC107HullBreachTriggerScript).TriggerBreaches()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Set by: Trigger, Vault Floor Exit
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, Exiting Engine Section

;Start ambient explosions, level 1.
kMyQuest.StartAmbientExplosions(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;Set by: Trigger, Exiting Engineering Section
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, Exiting Vault Entrance Section

;Start ambient explosions, level 2.
kMyQuest.StartAmbientExplosions(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0770_Item_00
Function Fragment_Stage_0770_Item_00()
;BEGIN CODE
;Set by: Trigger, Crew Quarters Lower Level

;Block off the hallway on the Crew Quarters Upper Level to
;prevent the player from looping back around.
LC107_EscapeStateEnableSpecialMarkerRef.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
;Set by: Change Location script.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: CF07.

;Destroy the Legacy and the Erebos.
SpaceshipReference erebosShip = Alias_ErebosShip.GetShipRef()
erebosShip.SetValue(DockingPermission, 4)
erebosShip.SetEssential(False)
erebosShip.InstantUndock()
erebosShip.Kill()
SpaceshipReference legacyRef = Alias_LegacyShip.GetShipRef()
legacyRef.SetValue(Invulnerable, 0)
legacyRef.SetValue(DockingPermission, 4)
legacyRef.SetEssential(False)
FX_ShipExplosionHuge02.Play(legacyRef)
Utility.Wait(10)
legacyRef.Kill()

;Disable the Legacy's map marker.
Alias_UnknownShipMapMarker.TryToDisable()
Alias_LegacyShipMapMarker.TryToDisable()

;Unlock fast travel.
kMyQuest.UnlockFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE LC107QuestScript
Quest __temp = self as Quest
LC107QuestScript kmyQuest = __temp as LC107QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Change Location script.

;Clean up the Legacy.
SetStage(1000)
Alias_ErebosShip.TryToDisable()
Alias_LegacyShip.TryToDisable()

;Clean up the quest script.
kMyQuest.Cleanup()

;Shut down.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Quest Property CF_Main Auto Const Mandatory
Quest Property CF07 Auto Const Mandatory

ObjectReference Property LC107_EscapeStateNonvault_DisableMarkerRef Auto Const Mandatory
ObjectReference Property LC107_EscapeStateNonvault_EnableMarkerRef Auto Const Mandatory
ObjectReference Property LC107_EscapeStateVault_DisableMarkerRef Auto Const Mandatory
ObjectReference Property LC107_EscapeStateVault_EnableMarkerRef Auto Const Mandatory
ObjectReference Property LC107_EscapeStateEnableSpecialMarkerRef Auto Const Mandatory
ObjectReference Property LC107_EntranceMarkerRef Auto Const Mandatory
ObjectReference Property LC107_VaultEntranceMarkerRef Auto Const Mandatory
ObjectReference Property LC107_EngineeringMarkerRef Auto Const Mandatory
ObjectReference Property LC107_VaultFloorMarkerRef Auto Const Mandatory
ObjectReference Property LC107_ControlRoomMarkerRef Auto Const Mandatory
ObjectReference Property LC107_EscapeEngineMarkerRef Auto Const Mandatory
ObjectReference Property LC107_EscapeEngineeringMarkerRef Auto Const Mandatory
ObjectReference Property LC107_EscapeVaultEntranceMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_DockingPortDoor Auto Const Mandatory
ReferenceAlias Property Alias_CaptainTransferModule Auto Const Mandatory
ReferenceAlias Property Alias_JasperKryxTransferModule Auto Const Mandatory
ReferenceAlias Property Alias_DataCoreEmpty Auto Const Mandatory
ReferenceAlias Property Alias_DataCoreFull Auto Const Mandatory
ReferenceAlias Property Alias_LegacyShip Auto Const Mandatory
ReferenceAlias Property Alias_UnknownShipMapMarker Auto Const Mandatory
ReferenceAlias Property Alias_LegacyShipMapMarker Auto Const Mandatory
ReferenceAlias Property Alias_VaultEntranceDoor Auto Const Mandatory
ReferenceAlias Property Alias_VaultControlEntryDoor Auto Const Mandatory
ReferenceAlias Property Alias_VaultControlsDataCoreSlot Auto Const Mandatory
ReferenceAlias Property Alias_JasperKryxSlateFinal Auto Const Mandatory
ReferenceAlias Property Alias_ErebosShip Auto Const Mandatory
ReferenceAlias Property Alias_LC107HullBreachInitialTrigger01 Auto Const Mandatory
ReferenceAlias Property Alias_LC107HullBreachInitialTrigger02 Auto Const Mandatory
ReferenceAlias Property Alias_LC107_DestructionAudioSwitchMarker Auto Const Mandatory

RefCollectionAlias Property HullBreachTriggers Auto Const
RefCollectionAlias Property Alias_EntryEnemies Auto Const Mandatory
RefCollectionAlias Property Alias_EscapeEnemies Auto Const Mandatory
RefCollectionAlias Property Alias_EscapeDoors Auto Const Mandatory
RefCollectionAlias Property Alias_EscapeTriggers Auto Const Mandatory
RefCollectionAlias Property Alias_QuickstartDoors Auto Const Mandatory
RefCollectionAlias Property Alias_ReactorsMain Auto Const Mandatory
RefCollectionAlias Property Alias_ReactorsAux Auto Const Mandatory
RefCollectionAlias Property Alias_NavmeshGenOnlyRefs Auto Const Mandatory
RefCollectionAlias Property Alias_NavmeshGenInitialRefs Auto Const Mandatory

Scene Property CF07_zzLegacy000_Companion_Storm_Approach Auto Const Mandatory
Scene Property CF07_zzLegacy001_Companion_Storm_During Auto Const Mandatory
Scene Property CF07_zzLegacy002_Companion_Storm_ShipSighted Auto Const Mandatory
Scene Property CF07_zLegacy000_Callout_InitialLockdown Auto Const Mandatory
Scene Property CF07_zLegacy004_Callout_CurrencyTransfer Auto Const Mandatory
Scene Property CF07_zLegacy005_Callout_CurrencyTransferComplete Auto Const Mandatory
Scene Property CF07_zLegacy006_Callout_HullBreach Auto Const Mandatory
Scene Property CF07_zLegacy008_Callout_SecurityAlarm Auto Const Mandatory
Scene Property CF07_zzLegacy003_Companion_Ship_Robots Auto Const Mandatory
Scene Property CF07_zzLegacy004_Companion_Ship_CrewQuarters Auto Const Mandatory
Scene Property CF07_zzLegacy006_Companion_Ship_CredTank Auto Const Mandatory
Scene Property CF07_zzLegacy007_Companion_Ship_CredTankBay Auto Const Mandatory
Scene Property CF07_zzLegacy008_Companion_Ship_KryxRemains Auto Const Mandatory
Scene Property CF07_zLegacy007_Evacuate_HullBreach Auto Const Mandatory

Key Property LC107_EngineeringSafeKey Auto Const Mandatory
ActorValue Property DockingPermission Auto Const Mandatory
WWiseEvent Property WwiseEvent_QST_CF07_BlackScreen Auto Const Mandatory

ReferenceAlias Property Alias_LegacyShipNameOverride Auto Const Mandatory

ActorValue Property Invulnerable Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

ObjectReference Property LC107_EscapeStateVault_Lighting_EnableMarkerRef Auto Const Mandatory

VisualEffect Property FX_ShipExplosionHuge02 Auto Const Mandatory
