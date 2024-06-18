;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ207C_00257DE1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 0: Start in space.

;Wait for startup.
kMyQuest.WaitForStartup()

;Set the Quickstart Flag stage.
SetStage(11)

;Set relevant prior stages.
MQ207B.SetStage(1)

;Give the player the quickstart perks.
kMyQuest.AddQuickstartPerks()

;Adjust the player's level.
kMyQuest.SetQuickstartLevel()

;Get the player into space.
Debug.ExecuteConsole("bat gotospace")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 1: Entrance

;Wait for startup.
kMyQuest.WaitForStartup()

;Set the Quickstart Flag stage.
SetStage(11)

;Set relevant prior stages.
MQ207B.SetStage(1)

;Give the player the quickstart perks.
kMyQuest.AddQuickstartPerks()

;Adjust the player's level.
kMyQuest.SetQuickstartLevel()

;Display an initial objective.
SetStage(105)

;Move the player to the entrance.
Game.GetPlayer().MoveTo(Alias_QuickstartMarker_Entrance.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 2: Director's Office

;Wait for startup.
kMyQuest.WaitForStartup()

;Set the Quickstart Flag stage.
SetStage(11)

;Set relevant prior stages.
SetStage(205) ;Escort Done
MQ207B.SetStage(1)

;Give the player the quickstart perks.
kMyQuest.AddQuickstartPerks()

;Adjust the player's level.
kMyQuest.SetQuickstartLevel()

;Enable Rafael.
Alias_RafaelAguerro.TryToEnable()

;Move all of the quest NPCs into position.
Alias_EthanHughes.TryToMoveTo(Alias_Nishina01_ActorTarget_DirectorsOffice_EthanHughesStandGuard_I.GetRef())

;Unlock the exterior door. Open the airlock door.
kMyQuest.UnlockExteriorDoor()
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorAirlock_I.GetRef(), True)

;Return Ethan's terminal to normal scripted behavior.
(Alias_Nishina01_SecurityOfficeTerminal_I.GetRef() as MQ207CEthanTerminalScript).EndScriptControl()

;Set up the security doors for the quickstart.
kMyQuest.SetRefColSecurityDoorState(Alias_Nishina01_SecurityDoors_I_All, True)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_SecurityOffice_I.GetRef(), True)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_StorageCorridor_I.GetRef(), True)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_StorageRoom_I.GetRef(), True)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_DoctorsHall_I.GetRef(), True)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_Stairwell_I.GetRef(), True)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_DirectorsOffice_I.GetRef(), True)

;Move the player to the director's office.
Game.GetPlayer().MoveTo(Alias_QuickstartMarker_DirectorsOffice.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 3: Shifting

;Wait for startup.
kMyQuest.WaitForStartup()

;Set the Quickstart Flag stage.
SetStage(11)

;Set relevant prior stages.
MQ207B.SetStage(1)

;Give the player the quickstart perks.
kMyQuest.AddQuickstartPerks()

;Adjust the player's level.
kMyQuest.SetQuickstartLevel()

;Enable Rafael.
Alias_RafaelAguerro.TryToEnable()

;Unlock the exterior door. Open the airlock door.
kMyQuest.UnlockExteriorDoor()
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorAirlock_I.GetRef(), True)

;Return Ethan's terminal to normal scripted behavior.
(Alias_Nishina01_SecurityOfficeTerminal_I.GetRef() as MQ207CEthanTerminalScript).EndScriptControl()

;Set up the security doors for the quickstart.
kMyQuest.SetRefColSecurityDoorState(Alias_Nishina01_SecurityDoors_I_All, True)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_StorageCorridor_I.GetRef(), True)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_StorageRoom_I.GetRef(), True)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_DoctorsHall_I.GetRef(), True)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_Stairwell_I.GetRef(), True)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_DirectorsOffice_I.GetRef(), True)
kMyQuest.AllowSecurityDoorUnlock(Alias_Nishina01_SecurityDoor_Escort_FabricationLabHall_I.GetRef())

;Start Maria's Escort once the doors have been set up.
SetStage(400)

;Move the player to the director's office.
Game.GetPlayer().MoveTo(Alias_QuickstartMarker_DirectorsOffice.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 4: Fabrication Lab

;Wait for startup.
kMyQuest.WaitForStartup()

;Set the Quickstart Flag stage.
SetStage(11)

;Set relevant prior stages.
SetStage(30)  ;End Lockdown
SetStage(400) ;Director Scene Done
SetStage(401) ;Swap Fabrication Lab Hall Triggers
SetStage(410) ;Move Maria to Lab
SetStage(441) ;Move Rafael to Entryway
MQ207B.SetStage(1)

;Give the player the quickstart perks.
kMyQuest.AddQuickstartPerks()

;Adjust the player's level.
kMyQuest.SetQuickstartLevel()

;Enable Rafael.
Alias_RafaelAguerro.TryToEnable()

;All of the NPCs can stay in these positions.

;Unlock the exterior door. Open the airlock door.
kMyQuest.UnlockExteriorDoor()
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorAirlock_I.GetRef(), True)

;Enable the Fabrication Lab hallway trigger.
Alias_Nishina01_FabricationLabHallwayTrigger_I.TryToEnable()

;Move the player to the Fabrication Lab.
Game.GetPlayer().MoveTo(Alias_QuickstartMarker_FabricationLab.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 5: Research Level

;Wait for startup.
kMyQuest.WaitForStartup()

;Set the Quickstart Flag stage.
SetStage(11)

;Set relevant prior stages.
SetStage(30)  ;End Lockdown
SetStage(40)  ;Toggle Triggers & Distortions
SetStage(441) ;Move Rafael to Entryway
MQ207B.SetStage(1)

;Give the player the quickstart perks.
kMyQuest.AddQuickstartPerks()

;Adjust the player's level.
kMyQuest.SetQuickstartLevel()

;Enable Rafael and Dr. Barakova.
Alias_RafaelAguerro.TryToEnable()
Alias_DrBarakova.TryToEnable()

;Unlock the exterior door. Open the airlock door.
kMyQuest.UnlockExteriorDoor()
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorAirlock_I.GetRef(), True)

;Swap the debris in the Storage Room.
Alias_Nishina01_StorageRoomCollapseEnableMarker_II.TryToEnable()

;Unlock the Elevator Lobby in Nishina-I.
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorElevatorLobby_I.GetRef(), True)

;Move the player to the research level elevator.
Game.GetPlayer().MoveTo(Alias_QuickstartMarker_ResearchLevelElevator.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 6: High Energy Research Lab

;Wait for startup.
kMyQuest.WaitForStartup()

;Set the Quickstart Flag stage.
SetStage(11)

;Set relevant prior stages.
SetStage(30)  ;End Lockdown
SetStage(40)  ;Toggle Triggers & Distortions
SetStage(441) ;Move Rafael to Entryway
MQ207B.SetStage(1)

;Give the player the quickstart perks.
kMyQuest.AddQuickstartPerks()

;Adjust the player's level.
kMyQuest.SetQuickstartLevel()

;Enable Rafael and Dr. Barakova.
Alias_RafaelAguerro.TryToEnable()
Alias_DrBarakova.TryToEnable()

;Unlock the exterior door. Open the airlock door.
kMyQuest.UnlockExteriorDoor()
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorAirlock_I.GetRef(), True)

;Swap the debris in the Storage Room.
Alias_Nishina01_StorageRoomCollapseEnableMarker_II.TryToEnable()

;Unlock the Elevator Lobby in Nishina-I.
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorElevatorLobby_I.GetRef(), True)

;Move the player to the lab.
Game.GetPlayer().MoveTo(Alias_QuickstartMarker_HighEnergyResearchLab.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 7: Ending, Nishina I Path

;Wait for startup.
kMyQuest.WaitForStartup()

;Set the Quickstart Flag stage.
SetStage(11)

;Set relevant prior stages.
SetStage(30) ;End the Lockdown
SetStage(910);Set up for Nishina-I Ending.
SetStage(912)
MQ207B.SetStage(1)

;Give the player the quickstart perks.
kMyQuest.AddQuickstartPerks()

;Adjust the player's level.
kMyQuest.SetQuickstartLevel()

;Stop Ethan's initial scene.
MQ207C_121_EntranceAirlock.Stop()

;Enable Dr. Barakova.
Alias_DrBarakova.TryToEnable()

;Unlock the exterior door. Open the airlock door.
kMyQuest.UnlockExteriorDoor()
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorAirlock_I.GetRef(), True)

;Unlock the Elevator Lobby in Nishina-I.
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorElevatorLobby_I.GetRef(), True)

;Move the player to the elevator lobby.
Game.GetPlayer().MoveTo(Alias_QuickstartMarker_Ending_I.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 8: Ending, Nishina II Path

;Wait for startup.
kMyQuest.WaitForStartup()

;Set the Quickstart Flag stage.
SetStage(11)

;Set relevant prior stages.
SetStage(920);Set up for Nishina-II Ending.
SetStage(922)
MQ207B.SetStage(1)

;Give the player the quickstart perks.
kMyQuest.AddQuickstartPerks()

;Adjust the player's level.
kMyQuest.SetQuickstartLevel()

;Enable Rafael and move him again to correct his facing.
Alias_RafaelAguerro.TryToEnable()
Alias_RafaelAguerro.TryToMoveTo(Alias_Nishina01_ActorTarget_Ending02_RafaelAguerroMarker_II.GetRef())

;Unlock the exterior door.
kMyQuest.UnlockExteriorDoor()

;Swap the debris in the Storage Room.
Alias_Nishina01_StorageRoomCollapseEnableMarker_II.TryToEnable()

;Move the player to the elevator lobby.
Game.GetPlayer().MoveTo(Alias_QuickstartMarker_Ending_II.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 9: Ending, Nishina Merged Path

;Wait for startup.
kMyQuest.WaitForStartup()

;Set the Quickstart Flag stage.
SetStage(11)

;Set relevant prior stages.
SetStage(30) ;End the Lockdown
MQ207B.SetStage(1)

;Give the player the quickstart perks.
kMyQuest.AddQuickstartPerks()

;Adjust the player's level.
kMyQuest.SetQuickstartLevel()

;Enable Rafael and Dr. Barakova.
Alias_RafaelAguerro.TryToEnable()
Alias_DrBarakova.TryToEnable()

;Unlock the exterior door. Open the airlock door.
kMyQuest.UnlockExteriorDoor()
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorAirlock_I.GetRef(), True)

;Unlock the Elevator Lobby in Nishina-I.
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorElevatorLobby_I.GetRef(), True)

;Move the player to Nishina.
Game.GetPlayer().MoveTo(Alias_QuickstartMarker_FabricationLab.GetRef())

;Start the Nishina-III Ending.
SetStage(930)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Run on Start

;Reset the location.
Alias_NishinaLocation.GetLocation().Reset()
Alias_NishinaResearchLevelLocation.GetLocation().Reset()

;All of the doors in Nishina-I except the initial airlock door
;start open. We can't just set them to the open state in the editor
;because they're also key-locked, which means they need to start
;locked, which is now incompatible with 'Open by Default' flag.
;So open all of the doors through script.
kMyQuest.SetRefColSecurityDoorState(Alias_Nishina01_SecurityDoors_I_All, False)
;And then close the initial airlock door again.
kMyQuest.SealSecurityDoor(Alias_Nishina01_SecurityDoorAirlock_I.GetRef())

;All distortions start disabled. Handled by MQ207CShiftingQuestScript.

;The player is Friendly to the NishinaI and NishinaII factions.
PlayerFaction.SetAlly(MQ207CNishinaIFaction, True, True)
PlayerFaction.SetAlly(MQ207CNishinaIIFaction, True, True)

;We've finished initializing.
kMyQuest.StartupStageDone()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
SetStage(3)
Game.GetPlayer().MoveTo(MQ207C_QuickstartMarker_CafeteriaRef)
SetStage(435)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: 'Spot the Difference' Quickstart
SetStage(30)
SetStage(40)
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorElevatorLobby_I.GetRef(), True)
kMyQuest.SetRefColSecurityDoorState(Alias_Nishina02_SecurityDoors_All_I, False)
kMyQuest.SetRefColSecurityDoorState(Alias_Nishina02_SecurityDoors_All_II, False)
kMyQuest.SetNishina02RobotsAndTurretsUnconscious()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Set by: Skill challenge in Storage Corridor.

;This also introduces the name of the Cataxi.
SetStage(22)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
;Set by: Quest script, monitoring the player giving food in
;MQ207C_182_EscortReactStorageRoom02.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Dialogue with Ethan (MQ207C_450_ShiftingEthanInOffice)
;or the Director (MQ207C_Director_Main, persuade), or Quickstart.

;Wait for startup.
kMyQuest.WaitForStartup()

;Complete 'Speak to Ethan' objective, if displayed.
if (IsObjectiveDisplayed(450))
     SetObjectiveCompleted(450)
EndIf

;Enable the remaining scientists in Nishina I.
Alias_Nishina01_ScientistEnableMarker_I.TryToEnable()

;Return Ethan's terminal to normal scripted behavior, to support subsequent quickstarts.
(Alias_Nishina01_SecurityOfficeTerminal_I.GetRef() as MQ207CEthanTerminalScript).EndScriptControl()

;End the Security Lockdown.
kMyQuest.SetRefColSecurityDoorStateNoWait(Alias_Nishina01_SecurityDoors_I_All, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE mq207cshiftingquestscript
Quest __temp = self as Quest
mq207cshiftingquestscript kmyQuest = __temp as mq207cshiftingquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 560, or Quickstart.

;Disable all Shifting Triggers
kMyQuest.EnableShiftingTriggers(False)

;Enable all Distortions
kMyQuest.EnableDistortions(True)

;Unblock activation on Distortions
kMyQuest.SetDistortionsActivationBlocked(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE mq207cshiftingquestscript
Quest __temp = self as Quest
mq207cshiftingquestscript kmyQuest = __temp as mq207cshiftingquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 720 or TBD.

;Disable all Shifting Triggers
kMyQuest.EnableShiftingTriggers(False)

;Disable all Distortions
kMyQuest.EnableDistortions(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
;Set by: SE_MQ207C, stage 30.

;If the player hasn't already progressed past this...
if (GetStage() < 120)
     ;Display 'Investigate the Distress Signal'
     SetObjectiveDisplayed(105)
     SetActive()

     ;MQ206C completes 'Listen to the Distress Signal'
     ;MQ206C displays 'Complete Entangled'
     MQ206C.SetStage(38)

     ;Add the Nishina Map Marker to the player's map.
     ObjectReference mapMarkerRef = Alias_NishinaMapMarker.GetRef()
     mapMarkerRef.AddToMapScanned(True)
     mapMarkerRef.SetRequiresScanning(False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_Support, Stage 120

;Complete 'Investigate the distress signal', if active.
if (IsObjectiveDisplayed(105))
     SetObjectiveCompleted(105)
EndIf

;Display 'Enter Nishina Research Station'
SetObjectiveDisplayed(120)

;Update MQ206C, if appropriate.
if (!GetStageDone(110))
     ;MQ206C hides 'Listen to the Distress Signal'
     ;MQ206C displays 'Complete Entangled'
     MQ206C.SetStage(39)
EndIf

;Unlock the exterior door and let the player inside.
kMyQuest.UnlockExteriorDoor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0121_Item_00
Function Fragment_Stage_0121_Item_00()
;BEGIN CODE
;Set by: Trigger in Airlock

;Start the Entry Airlock scene.
MQ207C_121_EntranceAirlock.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0123_Item_00
Function Fragment_Stage_0123_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_121_EntranceAirlock

;Allow Ethan to open the security office door.
kMyQuest.AllowSecurityDoorUnlock(Alias_Nishina01_SecurityDoor_Escort_SecurityOffice_I.GetRef())

;Start the security lockdown.
SetStageNoWait(124)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0124_Item_00
Function Fragment_Stage_0124_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_121_EntranceAirlock

;Start the Security Lockdown
if (!GetStageDone(30))
     kMyQuest.SealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_SecurityOffice_I.GetRef())
     kMyQuest.SealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_StorageCorridor_I.GetRef())
     kMyQuest.SetRefColSecurityDoorState(Alias_Nishina01_SecurityDoors_I_All, True)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
;Set by: MQ207C_121_EntranceAirlock

;EVP Ethan to advance his package.
Alias_EthanHughes.TryToEvaluatePackage()

;Return Ethan's terminal to normal scripted behavior.
(Alias_Nishina01_SecurityOfficeTerminal_I.GetRef() as MQ207CEthanTerminalScript).EndScriptControl()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0127_Item_00
Function Fragment_Stage_0127_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger on Ethan's path to the airlock.

;Close and lock the Security Office door.
kMyQuest.SealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_SecurityOffice_I.GetRef())

;Prevent Ethan from reopening it.
kMyQuest.AllowSecurityDoorUnlock(Alias_Nishina01_SecurityDoor_Escort_SecurityOffice_I.GetRef(), False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger on Ethan's path to the airlock.

;Unlock and open the Airlock door.
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorAirlock_I.GetRef(), True)

;Complete 'Enter Nishina Research Station'
SetObjectiveCompleted(120)

;Display 'Speak to Ethan'
SetObjectiveDisplayed(130)

;EVP Ethan to advance his package.
Alias_EthanHughes.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0131_Item_00
Function Fragment_Stage_0131_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_130_EntranceGreet

;EVP Ethan to advance his package.
Alias_EthanHughes.TryToEvaluatePackage()

;Allow Ethan to open the Storage Corridor door.
kMyQuest.AllowSecurityDoorUnlock(Alias_Nishina01_SecurityDoor_Escort_StorageCorridor_I.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_130_EntranceGreet

;Complete 'Speak to Ethan'
SetObjectiveCompleted(130)

;Display 'Follow Ethan'
SetObjectiveDisplayed(140)

;Start the Storage Corridor Escort Scene
MQ207C_140_EscortStorageCorridor.Start()

;Start Maria's idle scene.
MQ207C_200_MariaIdle.Start()

;EVP Ethan to advance his package.
Alias_EthanHughes.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Storage Corridor shift trigger.

;Hide 'Follow Ethan'
SetObjectiveDisplayed(140, False)

;Display 'Explore the Ruins'
SetObjectiveDisplayed(150)

;Enable Storage Corridor enemies.
Alias_Nishina01_StorageCorridorCreatures_II.EnableAll()

;Stop the escort scene.
MQ207C_140_EscortStorageCorridor.Stop()

;Move Ethan into position for his next scene.
Alias_EthanHughes.TryToDisable()
Alias_EthanHughes.TryToMoveTo(Alias_Nishina01_StorageCorridorSceneMarker_Ethan_I.GetRef())
Alias_EthanHughes.TryToEvaluatePackage()
Alias_EthanHughes.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0154_Item_00
Function Fragment_Stage_0154_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: DefaultCounterQuestA quest script.
;When only one enemy remains, shift back on the next animation event.

;Register for animation events.
if (GetStage() < 155)
     kMyQuest.RegisterForAttackEvents()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: DefaultCounterQuestA quest script.
;Failsafe: Set if all enemies in the storage corridor have
;died without without an animation event triggering the shift back.

;Disable Player Controls.
kMyQuest.DisableControls()

;Shift the player back to Nishina-I.
((kMyQuest as Quest) as MQ207CShiftingQuestScript).Shift(shiftToMarker=Alias_Nishina01_StorageCorridorSceneMarker_Player_I.GetRef(), additionalStageToSet=160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Shifting quest script, on shift back to Nishina-I.

;Lock player controls.
kMyQuest.DisableControls()

;Hide 'Explore the Ruins'
SetObjectiveDisplayed(150, False)

;Display 'Follow Ethan' again.
SetObjectiveDisplayed(140)

;Disable Storage Corridor enemies.
Alias_Nishina01_StorageCorridorCreatures_II.DisableAll()

;Enable Rafael for the next scene.
Alias_RafaelAguerro.TryToEnable()

;Start the shift back scene.
MQ207C_162a_EscortReactStorageCorridor.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0169_Item_00
Function Fragment_Stage_0169_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_160_EscortReactStorageCorridor

;Allow Ethan to open the Storage Room door.
kMyQuest.AllowSecurityDoorUnlock(Alias_Nishina01_SecurityDoor_Escort_StorageRoom_I.GetRef())

;Re-enable Player Controls.
kMyQuest.EnableControls()

;And continue.
SetStage(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
;Set by: Stage 169

;Start the Storage Room escort scene.
MQ207C_170_EscortStorageRoom.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0171_Item_00
Function Fragment_Stage_0171_Item_00()
;BEGIN CODE
;Set by: Trigger in Nishina-I Storage Room.

;Hide 'Follow Ethan'
SetObjectiveDisplayed(140, False)

;Display 'Explore the Ruins'
SetObjectiveDisplayed(171)

;Stop the Escort scene.
MQ207C_170_EscortStorageRoom.Stop()

;Move Ethan into position for his next scene.
Actor ethanRef = Alias_EthanHughes.GetActorRef()
ethanRef.EvaluatePackage()
ethanRef.SnapIntoInteraction(Alias_Nishina01_StorageRoomSceneMarker_Ethan_I.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
;Set by: Trigger in Nishina-II Storage Room.

;Start Rafael's Storage Room scene. He stands up.
MQ207C_180_EscortReactStorageRoom01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0181_Item_00
Function Fragment_Stage_0181_Item_00()
;BEGIN CODE
;Set by: MQ207C_180_EscortReactStorageRoom01

;Complete 'Explore the Ruins'
SetObjectiveCompleted(171)

;Display 'Speak to Rafael'
SetObjectiveDisplayed(181)

;EVP Rafael to advance his package.
Alias_RafaelAguerro.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0182_Item_00
Function Fragment_Stage_0182_Item_00()
;BEGIN AUTOCAST TYPE mq207cshiftingquestscript
Quest __temp = self as Quest
mq207cshiftingquestscript kmyQuest = __temp as mq207cshiftingquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_182_EscortReactStorageRoom02

;EVP Rafael to advance his package.
Alias_RafaelAguerro.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0183_Item_00
Function Fragment_Stage_0183_Item_00()
;BEGIN CODE
;Set by: MQ207C_182_EscortReactStorageRoom02
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0185_Item_00
Function Fragment_Stage_0185_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_182_EscortReactStorageRoom02

;Shift the player back to Nishina-I.
((kMyQuest as Quest) as MQ207CShiftingQuestScript).Shift(shiftToMarker=Alias_Nishina01_StorageRoomSceneMarker_Player_I.GetRef(), additionalStageToSet=186)

;Complete 'Speak to Rafael'
SetObjectiveCompleted(181)

;Display 'Follow Ethan'
SetObjectiveDisplayed(140)

;Start Ethan's Storage Room scene.
MQ207C_185_EscortReactStorageRoom03.Start()

;Allow Ethan to open the Doctor's Hall and Stairwell doors.
kMyQuest.AllowSecurityDoorUnlock(Alias_Nishina01_SecurityDoor_Escort_DoctorsHall_I.GetRef())
kMyQuest.AllowSecurityDoorUnlock(Alias_Nishina01_SecurityDoor_Escort_Stairwell_I.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0186_Item_00
Function Fragment_Stage_0186_Item_00()
;BEGIN CODE
;Set by: Shifting in the Storage Room

;Stop all scenes on Rafael and EVP him to advance his package.
MQ207C_180_EscortReactStorageRoom01.Stop()
MQ207C_182_EscortReactStorageRoom02.Stop()
Alias_RafaelAguerro.TryToEvaluatePackage()

;Wait to make sure the cameras break before we return to Nishina01.
Utility.Wait(0.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
;Set by: MQ207C_180_EscortReactStorageRoom

;Start the Stairs Escort Scene
MQ207C_190_EscortStairs.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0191_Item_00
Function Fragment_Stage_0191_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger in the Doctor's Hall.

;Hide 'Follow Ethan'
SetObjectiveDisplayed(140, False)

;Display 'Find the Director's Office'
SetObjectiveDisplayed(191)

;Stop the Stairs Escort Scene
MQ207C_190_EscortStairs.Stop()

;Move Ethan into position for his next scene.
Alias_EthanHughes.TryToDisable()
Alias_EthanHughes.TryToMoveTo(Alias_Nishina01_StairsSceneMarker_Ethan_I.GetRef())
Alias_EthanHughes.TryToEvaluatePackage()
Alias_EthanHughes.TryToEnable()

;Stop Maria's idle scene.
MQ207C_200_MariaIdle.Stop()

;Unseal the Stairwell door if Ethan didn't open it.
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoor_Escort_Stairwell_I.GetRef(), True)

;Enable Doctor's Corridor enemies.
Alias_Nishina01_DoctorsCorridorCreatures_II.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger at the top of the stairs in Nishina-II.

;Hide 'Find the Director's Office'
SetObjectiveDisplayed(191, False)

;Switch back to 'Follow Ethan'
SetObjectiveDisplayed(140)

;Allow Ethan to open the Director's office door.
kMyQuest.AllowSecurityDoorUnlock(Alias_Nishina01_SecurityDoor_Escort_DirectorsOffice_I.GetRef())

;Make sure Maria's idle scene has stopped.
MQ207C_200_MariaIdle.Stop()
Alias_MariaHughes.TryToEvaluatePackage()

;Start the Director Escort Scene
MQ207C_200_EscortDirector.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
;Set by: Trigger in the Director's Office

;Complete 'Follow Ethan'
SetObjectiveCompleted(140)

;Display 'Speak to Director Patel'
SetObjectiveDisplayed(210)

;EVP Maria to make her turn around.
Alias_MariaHughes.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0206_Item_00
Function Fragment_Stage_0206_Item_00()
;BEGIN CODE
;Set by: MQ207C_200_EscortDirector

;EVP Ethan to advance his package.
Alias_EthanHughes.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger in the Director's Office

;Stop the Escort Scene
MQ207C_200_EscortDirector.Stop()

;Make sure the objectives updated.
SetStage(205)

;Start the Director's Scene
MQ207C_210_DirectorIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0214_Item_00
Function Fragment_Stage_0214_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Director Wrapup Scene Started.

;Move Ethan back to his office and lock the door.
Alias_EthanHughes.TryToDisable()
Alias_EthanHughes.GetRef().MoveToMyEditorLocation()
Alias_EthanHughes.TryToEvaluatePackage()
Alias_EthanHughes.TryToEnable()
ObjectReference securityOfficeSecurityDoor = Alias_Nishina01_SecurityDoor_Escort_SecurityOffice_I.GetRef()
kMyQuest.SealSecurityDoor(securityOfficeSecurityDoor)
kMyQuest.AllowSecurityDoorUnlock(securityOfficeSecurityDoor, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_214_DirectorWrapup

;Complete 'Speak to Director Patel'
SetObjectiveCompleted(210)

;Display 'Follow Maria'
SetObjectiveDisplayed(400)

;Allow Maria to open the Fabrication Lab Hall Door.
kMyQuest.AllowSecurityDoorUnlock(Alias_Nishina01_SecurityDoor_Escort_FabricationLabHall_I.GetRef())

;Start Maria's Escort Scene.
MQ207C_400_ShiftingMariaEscort.Start()

;Swap the debris in the Storage Room.
Alias_Nishina01_StorageRoomCollapseEnableMarker_II.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN CODE
;Set by: Maria opening the Fabrication Lab Hallway Door

;Toggle the Fabrication Lab hallway trigger.
Alias_Nishina01_FabricationLabHallwayTrigger_I.TryToEnable()
Alias_Nishina01_FabricationLabHallwayTrigger02_I.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger in the Fabrication Lab Hall.

;Hide 'Follow Maria'
SetObjectiveDisplayed(400,False)

;Display 'Make your way to the lab'
SetObjectiveDisplayed(410)

;Stop Maria's Escort Scene
MQ207C_400_ShiftingMariaEscort.Stop()

;Move Maria into position in the Nishina-I Fabrication Lab.
if (!GetStageDone(13))
     Alias_MariaHughes.TryToDisable()
     Alias_MariaHughes.TryToEvaluatePackage()
     Alias_MariaHughes.TryToMoveTo(Alias_Nishina01_ActorTarget_FabricationLab_MariaHughesMarker_I.GetRef())
     Alias_MariaHughes.TryToEnable()
Else
     Alias_MariaHughes.TryToEvaluatePackage()
     Alias_MariaHughes.TryToMoveTo(Alias_Nishina01_ActorTarget_FabricationLab_MariaHughesMarker_I.GetRef())
EndIf

;Enable Post-Director enemies.
Alias_Nishina01_PostDirectorCreatures_II.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
;Set by: Trigger in the Storage Room.

;Hide 'Get to the Lab'
SetObjectiveDisplayed(410, False)

;Display 'Speak to Rafael'
SetObjectiveDisplayed(420)

;EVP Rafael to advance his package.
Alias_RafaelAguerro.TryToEvaluatePackage()

;Stop combat.
;;;MQ207CNishinaIIEnemyFaction.SetAlly(MQ207CNishinaIIFaction, True, True)
Alias_RafaelAguerro.TryToStopCombat()
Alias_RafaelAguerro.TryToEvaluatePackage()
Game.GetPlayer().StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0421_Item_00
Function Fragment_Stage_0421_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_420_ShiftingRafaelInStorage

;EVP Rafael to advance his package.
Alias_RafaelAguerro.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
;Set by: MQ207C_420_ShiftingRafaelInStorage

;Complete 'Speak to Rafael'
SetObjectiveCompleted(420)

;Display 'Get to the Lab'
SetObjectiveDisplayed(410)

;Give the player the pantry key.
Game.GetPlayer().AddItem(LC116_PantryKey)

;EVP Rafael to advance his package.
Alias_RafaelAguerro.TryToEvaluatePackage()

;Set Rafael hostile to the creatures agaain.
MQ207CNishinaIIEnemyFaction.SetEnemy(MQ207CNishinaIIFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0435_Item_00
Function Fragment_Stage_0435_Item_00()
;BEGIN CODE
;Set by: Shifting trigger, dining hall.

;Force the Cafeteria NPCs to stand and track the player.
Alias_Nishina01_CafeteriaNPCs_I.EvaluateAll()

;Start the Cafeteria Scene.
MQ207C_425_Cafeteria.Start()

;Unlock and open the pantry door.
ObjectReference pantryDoor = Alias_Nishina01_PantryDoor_II.GetRef()
pantryDoor.Unlock()
pantryDoor.SetOpen(True)

;Move Rafael to the marker at the far end of the dining hall.
Alias_RafaelAguerro.TryToEvaluatePackage()
Alias_RafaelAguerro.TryToMoveTo(Alias_Nishina01_LobbyWaitMarker_Rafael_II.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0437_Item_00
Function Fragment_Stage_0437_Item_00()
;BEGIN CODE
;Set by: MQ207C_425_Cafeteria, in scene.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0438_Item_00
Function Fragment_Stage_0438_Item_00()
;BEGIN CODE
;Set by: MQ207C_425_Cafeteria, in scene.

;Force the Cafeteria NPCs to flee.
Alias_Nishina01_CafeteriaNPCs_I.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0439_Item_00
Function Fragment_Stage_0439_Item_00()
;BEGIN CODE
;Set by: MQ207C_425_Cafeteria, scene end.

;Force the Cafeteria NPCs to flee.
Alias_Nishina01_CafeteriaNPCs_I.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
;Set by: Shifting Trigger, Dining Hall Exit.

;EVP Rafael to advance his package.
Alias_RafaelAguerro.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0445_Item_00
Function Fragment_Stage_0445_Item_00()
;BEGIN CODE
;Set by: Nishina01_LobbyCreatures_II, alias script, on death.

;Hide 'Get to the Lab'
SetObjectiveDisplayed(410, False)

;Display 'Speak to Rafael'
SetObjectiveDisplayed(445)

;EVP Rafael to advance his package.
Alias_RafaelAguerro.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0446_Item_00
Function Fragment_Stage_0446_Item_00()
;BEGIN CODE
;Set by: MQ207C_430_Rafael_Main, scene end script.

;Complete 'Speak to Rafael'
SetObjectiveCompleted(445)

;Display 'Get to the Lab'
SetObjectiveDisplayed(410)

;EVP Rafael to advance his package.
Alias_RafaelAguerro.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
;Set by: Trigger in Ethan's Office

;Set Stage 441 to make sure Rafael is in position.
SetStage(441)

;Hide 'Get to the Lab'
SetObjectiveDisplayed(410, False)

;Display 'Speak to Ethan'
SetObjectiveDisplayed(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0451_Item_00
Function Fragment_Stage_0451_Item_00()
;BEGIN CODE
;Set by: MQ207C_450_ShiftingEthanInOffice

;Complete 'Speak to Ethan'
SetObjectiveCompleted(450)

;Display 'Get to the Lab'
SetObjectiveDisplayed(410)

;End the security lockdown.
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
;Set by: Trigger outside the Fabrication Lab.

;Disable the Fabrication Lab hallway triggers.
Alias_Nishina01_FabricationLabHallwayTrigger_I.TryToDisable()
Alias_Nishina01_FabricationLabHallwayTrigger02_I.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set by: Trigger in the Fabrication Lab

;Set Stage 441 to make sure Rafael is in position.
SetStage(441)

;Set Stage 490 to make sure the Fabrication Lab Hall triggers
;have been disabled.
SetStage(490)

;Complete 'Make your way to the Fabrication Lab'
SetObjectiveCompleted(410)

;Hide any now-irrelevant 'Speak to' Objectives.
if (IsObjectiveDisplayed(420) && !IsObjectiveCompleted(420))
     SetObjectiveDisplayed(420,False)
EndIf
if (IsObjectiveDisplayed(445) && !IsObjectiveCompleted(445))
     SetObjectiveDisplayed(445,False)
EndIf
if (IsObjectiveDisplayed(450) && !IsObjectiveCompleted(450))
     SetObjectiveDisplayed(450,False)
EndIf

;Display 'Speak to Maria'
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
;Set by: MQ207C_500_ExperimentMaria01

;Complete 'Speak to Maria'
SetObjectiveCompleted(500)

;Display 'Assist Maria'
SetObjectiveDisplayed(510)

;Begin the Experiment
MQ207C_510_ExperimentMaria02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0511_Item_00
Function Fragment_Stage_0511_Item_00()
;BEGIN CODE
;Set by: MQ207C_510_ExperimentMaria02

;Enable the distortion.
ObjectReference experimentDistortion = Alias_Nishina01_FabricationLabDistortion_I.GetRef()
experimentDistortion.EnableNoWait()
WwiseEvent_QST_MQ207C_DistortionsAppear.Play(Game.GetPlayer());experimentDistortion)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN CODE
;Set by: MQ207C_510_ExperimentMaria02

;EVP Maria to advance her package.
Alias_MariaHughes.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0516_Item_00
Function Fragment_Stage_0516_Item_00()
;BEGIN CODE
;Set by: MQ207C_515_ExperimentMaria03

;EVP Maria to advance her package.
Alias_MariaHughes.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
;Set by: MQ207C_515_ExperimentMaria03

;Hide 'Assist Maria'
SetObjectiveDisplayed(510, False)

;Display 'Stand in the distortion'
SetObjectiveDisplayed(520)

;Enable the distortion trigger.
Alias_Nishina01_FabricationLabDistortionTrigger_I.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Player enters distortion trigger.

;Disable controls until the player shifts.
kMyQuest.DisableControls()

;Complete 'Stand in the distortion'
SetObjectiveCompleted(520)

;Redisplay 'Assist Maria'
SetObjectiveDisplayed(510)

;Continue the experiment.
MQ207C_520_ExperimentMaria04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_560_ExperimentMaria05

;Shift the player to Nishina-II
((kMyQuest as Quest) as MQ207CShiftingQuestScript).Shift(Alias_Nishina01_FabricationLabDistortion_I.GetRef() as MQ207CShiftingObjectScript)

;Reenable player controls.
kMyQuest.EnableControls()

;Complete 'Assist Maria'
SetObjectiveCompleted(510)

;Display 'Find a Probe Control Unit'
SetObjectiveDisplayed(540)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Set by: Default Script, Probe Control Unit

;Complete 'Find a Probe Control Unit'
SetObjectiveCompleted(540)

;Display 'Recalibrate the Distortion'
SetObjectiveDisplayed(550)

;Toggle Distortions & Shifting Triggers
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
;Set by: Fabrication Lab Distortion

;Complete 'Recalibrate the Distortion'
SetObjectiveCompleted(550)

;Display 'Speak to Maria'
SetObjectiveDisplayed(560)

;EVP Maria to advance her package.
Alias_MariaHughes.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0561_Item_00
Function Fragment_Stage_0561_Item_00()
;BEGIN CODE
;Set by: MQ207C_560_ShiftingMariaExperiment05

;EVP Maria to advance her package.
Alias_MariaHughes.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
;Set by: MQ207C_560_ShiftingMariaExperiment05

;Complete 'Speak to Maria'
SetObjectiveCompleted(560)

;Display 'Speak to Director Patel'
SetObjectiveDisplayed(570)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0571_Item_00
Function Fragment_Stage_0571_Item_00()
;BEGIN CODE
;Set by: MQ207C_570_ExperimentDirectorSendoff

;Display '(Optional) Get supplies'
SetObjectiveDisplayed(571)

;Enable Dr. Barakova, who has been disabled up to this point.
Alias_DrBarakova.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0572_Item_00
Function Fragment_Stage_0572_Item_00()
;BEGIN CODE
;Set by: MQ207C_Support, stage 50

;Complete '(Optional) Get Supplies from Dr. Barakova', if displayed.
if (IsObjectiveDisplayed(571))
     SetObjectiveCompleted(571)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0573_Item_00
Function Fragment_Stage_0573_Item_00()
;BEGIN CODE
;Set by: MQ207C_570_ExperimentDirectorSendoff
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0580_Item_00
Function Fragment_Stage_0580_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_491_ShiftingDirectorIntro

;Complete 'Speak to Director Patel'
SetObjectiveCompleted(570)

;Display 'Take the elevator to the Research Level'
SetObjectiveDisplayed(580)

;Unlock the Elevator Lobby in Nishina-I.
kMyQuest.UnsealSecurityDoor(Alias_Nishina01_SecurityDoorElevatorLobby_I.GetRef(), True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Set by: Trigger on the Research Level

;Hide '(Optional) Get Supplies from Dr. Barakova', if active.
if (!IsObjectiveCompleted(571))
     SetObjectiveDisplayed(571,False)
EndIf

;Complete 'Take the elevator to the Research Level'
SetObjectiveCompleted(580)

;Display 'Make your way to the High Energy Research Lab'
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0601_Item_00
Function Fragment_Stage_0601_Item_00()
;BEGIN CODE
;Set by: Shifting in the first conduit hall.

;Force an autosave.
Game.RequestAutosave()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
;Set by: Trigger in the Facilities Area

;Start the Facilities Lockdown scene.
MQ207C_610_FacilitiesAreaLockdown.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0611_Item_00
Function Fragment_Stage_0611_Item_00()
;BEGIN CODE
;Set by: MQ207C_610_FacilitiesAreaLockdown

;Hide 'Get to the Lab'
SetObjectiveDisplayed(600, False)

;Display 'Override the Lockdown' for the Facilities area.
SetObjectiveDisplayed(611)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0618_Item_00
Function Fragment_Stage_0618_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Facilities Terminal

;Complete 'Override the Lockdown' for the Facilities area.
SetObjectiveCompleted(611)

;Show 'Get to the Lab'
SetObjectiveDisplayed(600)

;Override the lockdown in the Facilities area.
kMyQuest.PlayLockdownEndedSFXNoWait()
kMyQuest.SetRefColSecurityDoorStateNoWait(Alias_Nishina02_SecurityDoors_Facilities_I, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
;Set by: Trigger in the Accelerator Area

;Start the Accelerator Lockdown scene.
MQ207C_620_AcceleratorAreaLockdown.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0621_Item_00
Function Fragment_Stage_0621_Item_00()
;BEGIN CODE
;Set by: MQ207C_620_AcceleratorAreaLockdown

;Hide 'Get to the Lab'
SetObjectiveDisplayed(600, False)

;Display 'Override the Lockdown' for the Accelerator area.
SetObjectiveDisplayed(621)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Accelerator Utility Room Terminal

;Unlock the Accelerator Control Room.
kMyQuest.PlayLockdownEndedSFXNoWait()
kMyQuest.SetRefColSecurityDoorStateNoWait(Alias_Nishina02_SecurityDoors_AcceleratorControl_I, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0628_Item_00
Function Fragment_Stage_0628_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Accelerator Control Room Terminal

;Complete 'Override the Lockdown' for the Accelerator area.
SetObjectiveCompleted(621)

;Show 'Get to the Lab'
SetObjectiveDisplayed(600)

;Unlock the Security Doors in the Accelerator Area
kMyQuest.PlayLockdownEndedSFXNoWait()
kMyQuest.SetRefColSecurityDoorStateNoWait(Alias_Nishina02_SecurityDoors_Accelerator_I, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
;Set by: Trigger in the Storage Area

;Start the Storage Lockdown scene.
MQ207C_630_StorageAreaLockdown.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0631_Item_00
Function Fragment_Stage_0631_Item_00()
;BEGIN CODE
;Set by: MQ207C_630_StorageAreaLockdown

;Display 'Override the Lockdown' for the Storage
if (GetStage() <= 631)
     SetObjectiveDisplayed(600, False)
     SetObjectiveDisplayed(631)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0638_Item_00
Function Fragment_Stage_0638_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Storage Room Terminal

;Complete 'Override the Lockdown' for the Storage area.
if (IsObjectiveDisplayed(631))
     SetObjectiveCompleted(631)
     SetObjectiveDisplayed(600, True)
EndIf

;Unlock the Security Doors in the Storage Area
kMyQuest.PlayLockdownEndedSFXNoWait()
kMyQuest.SetRefColSecurityDoorStateNoWait(Alias_Nishina02_SecurityDoors_Storage_I, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger in the High Energy Research Lab

;Complete 'Make your way to the High Energy Research Lab'
SetObjectiveCompleted(600)

;Display 'Disengage Power Interlocks X/Y'
SetObjectiveDisplayed(700)

;Start the music override.
kMyQuest.StartMusicOverride()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0711_Item_00
Function Fragment_Stage_0711_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, ProcessResearchLabActivation

;Trigger Wave 2.
kMyQuest.TriggerResearchLabAmbushWave(1, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0712_Item_00
Function Fragment_Stage_0712_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, ProcessResearchLabActivation

;Trigger Wave 3.
kMyQuest.TriggerResearchLabAmbushWave(1, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0715_Item_00
Function Fragment_Stage_0715_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Alias script, Nishina02_Creatures_ArtifactRoomWave1_II

;Trigger Wave 2.
kMyQuest.TriggerResearchLabAmbushWave(2, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0716_Item_00
Function Fragment_Stage_0716_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Alias script, Nishina02_Creatures_ArtifactRoomWave2_II

;Trigger Wave 3.
kMyQuest.TriggerResearchLabAmbushWave(2, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
;Set by: Emergency Shutdown I or II.

;Complete 'Disengage Power Interlocks'
SetObjectiveCompleted(700)

;Complete 'Shut down the Probe'
SetObjectiveCompleted(710)

;Display 'Take the Artifact'
SetObjectiveDisplayed(720)

;Disable all distortions and shifting triggers.
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0721_Item_00
Function Fragment_Stage_0721_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, Nishina I Emergency Shutdown Activated

;Set the common stage.
SetStage(720)

;Allow the player to take the Artifact.
kMyQuest.UnblockArtifactActivator_I()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0722_Item_00
Function Fragment_Stage_0722_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, Nishina II Emergency Shutdown Activated

;Set the common stage.
SetStage(720)

;Allow the player to take the Artifact.
kMyQuest.UnblockArtifactActivator_II()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN CODE
;Set by: Taking the Artifact, Nishina I or II paths ONLY.

;Play the Artifact scene.
MQ207C_730_TakeArtifact.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0731_Item_00
Function Fragment_Stage_0731_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Player took the Artifact, Nishina I, via quest script.

;Set the common stage and play the Artifact movie.
SetStage(730)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0732_Item_00
Function Fragment_Stage_0732_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Player took the Artifact, Nishina II, via quest script.

;Set the common stage and play the Artifact movie.
SetStage(730)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0735_Item_00
Function Fragment_Stage_0735_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_730_TakeArtifact

;Set up for the appropriate ending.
if (GetStageDone(731))
     MQ207C_731_EndLockdown.Start()
     SetStage(910)
Else
     SetStage(920)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0770_Item_00
Function Fragment_Stage_0770_Item_00()
;BEGIN CODE
;Set by: Quest script, UpdateFrequencyIntakes
;The player is now committed to the Ending III route.

;Hide all other lab objectives.
SetObjectiveDisplayed(700, False)
SetObjectiveDisplayed(710, False)
SetObjectiveDisplayed(720, False)

;Display 'Activate Primary Calibration'
SetObjectiveDisplayed(770)

;Begin preloading Nishina01 for the transition during the Artifact video.
Alias_Nishina02_InvisibleLoadDoor.GetRef().PreloadTargetArea()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0780_Item_00
Function Fragment_Stage_0780_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, Primary Calibration Activated

;Complete 'Activate Primary Calibration'
SetObjectiveCompleted(770)

;Display 'Wait for the Experiment'
SetObjectiveDisplayed(780)

;Disable all distortions and shifting triggers.
SetStage(50)

;Start the Special Ending sequence.
kMyQuest.PlaySpecialEndingShifting()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0790_Item_00
Function Fragment_Stage_0790_Item_00()
;BEGIN CODE
;Set by: Activating Artifact Activator III, Nishina I or II

;Start the Nishina III Ending sequence.
SetStage(930)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stages 910, 920, or 930.

;Set the location explored.
Alias_NishinaLocation.GetLocation().SetExplored()

;Lock all of the terminals in Nishina02.
kMyQuest.SetNishina02TerminalsLockedNoWait()

;Stop the research lab music override.
kMyQuest.StopMusicOverride()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 731.

;Set the common stage.
SetStage(900)

;Complete 'Take the Artifact'
SetObjectiveCompleted(720)

;Display 'Speak to Director Patel'
SetObjectiveDisplayed(910)

;Move all of the NPCs into position for the ending scene.
Alias_DirectorPatel.TryToEvaluatePackage()
Alias_DirectorPatel.TryToMoveTo(Alias_Nishina01_ActorTarget_Ending01_DirectorPatelMarker_I.GetRef())
Alias_MariaHughes.TryToEvaluatePackage()
Alias_MariaHughes.TryToMoveTo(Alias_Nishina01_ActorTarget_Ending01_MariaHughesMarker_I.GetRef())
Alias_RafaelAguerro.TryToDisable()

;End the Lockdown
kMyQuest.PlayLockdownEndedSFXNoWait()
(Alias_Nishina01_ElevatorFloorMarker_I.GetRef() as LoadElevatorFloorScript).SetAccessible(True)
(Alias_Nishina02_ElevatorFloorMarker_I.GetRef() as LoadElevatorFloorScript).SetAccessible(True)
kMyQuest.SetRefColSecurityDoorStateNoWait(Alias_Nishina02_SecurityDoors_All_I, False)

;Set any remaining robots or turrets unconscious.
kMyQuest.SetNishina02RobotsAndTurretsUnconscious()

;Ignore Friendly Hits on the security cameras going forward.
kMyQuest.SetRefColCameraState(Alias_Nishina02_I_SecurityCameras, True, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0915_Item_00
Function Fragment_Stage_0915_Item_00()
;BEGIN CODE
;Set by: Trigger outside the Elevator Lobby, Nishina-I.

;Start the ending scene.
MQ207C_915_EndingNishinaI.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 732.

;Set the common stage.
SetStage(900)

;Complete 'Take the Artifact'
SetObjectiveCompleted(720)

;Display 'Speak to Rafael'
SetObjectiveDisplayed(920)

;Move all of the NPCs into position for the ending scene.
Alias_DirectorPatel.TryToDisable()
Alias_MariaHughes.TryToDisable()
Alias_EthanHughes.TryToDisable()
Alias_RafaelAguerro.TryToEvaluatePackage()
Alias_RafaelAguerro.TryToMoveTo(Alias_Nishina01_ActorTarget_Ending02_RafaelAguerroMarker_II.GetRef())

;Toggle the postquest debris.
Alias_Nishina01_PostquestDebrisEnableMarker_II.TryToEnable()

;Enable the postquest enemies in the exterior.
Alias_NishinaExt_ExteriorEnemiesEnableMarker_II.TryToEnable()

;Swap the exterior load door, so it loads to/from Nishina II.
Alias_NishinaExt_ExteriorDoor_I.TryToDisable()
Alias_NishinaExt_ExteriorDoor_II.TryToEnable()

;Disable any surviving creatures in Nishina01.
kMyQuest.CleanupNishina01Creatures()

;End the Lockdown
kMyQuest.PlayLockdownEndedSFXNoWait()
kMyQuest.SetRefColSecurityDoorStateNoWait(Alias_Nishina02_SecurityDoors_All_II, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0925_Item_00
Function Fragment_Stage_0925_Item_00()
;BEGIN CODE
;Set by: Trigger outside the Elevator Lobby, Nishina-II.

;Start the ending scene.
MQ207C_925_EndingNishinaII.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0929_Item_00
Function Fragment_Stage_0929_Item_00()
;BEGIN CODE
;Set by: MQ207C_925_EndingNishinaII

;Rafael becomes a temporary follower.
MQ207C_RafaelPostquest.SetStage(20)

;Then finish out the quest.
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0930_Item_00
Function Fragment_Stage_0930_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Activating Artifact Activator, Nishina I or II

;Start the transition scene.
MQ207C_930_EndingNishinaIII.Start()

;Set the common stage.
SetStage(900)

;Complete 'Wait for the Experiment'
SetObjectiveCompleted(780)

;Set the Foreknowledge AV for future playthroughs.
Game.GetPlayer().SetValue(MQ207C_ForeknowledgeMergeAV, 1)

;Disable the dividers in Nishina01.
Alias_Nishina01_PostquestDividerEnableMarker_III.TryToDisable()

;Enable Rafael's corpse in Nishina01.
Alias_Nishina01_RafaelAguerroCorpse_III.TryToEnable()

;End the Lockdown
(Alias_Nishina01_ElevatorFloorMarker_I.GetRef() as LoadElevatorFloorScript).SetAccessible(True)
(Alias_Nishina02_ElevatorFloorMarker_I.GetRef() as LoadElevatorFloorScript).SetAccessible(True)
kMyQuest.SetRefColSecurityDoorStateNoWait(Alias_Nishina02_SecurityDoors_All_I, False)

;Ignore Friendly Hits on the security cameras going forward.
kMyQuest.SetRefColCameraState(Alias_Nishina02_I_SecurityCameras, True, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0931_Item_00
Function Fragment_Stage_0931_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_930_EndingNishinaIII

;Play the Artifact movie.
(MQ00 as MQ00QuestScript).PlayArtifactVisionNoWait()

;Wait for the movie to start.
;Utility.WaitMenuPause(0.5)

;Move the player using the invisible load door.
Alias_Nishina02_InvisibleLoadDoor.GetRef().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0932_Item_00
Function Fragment_Stage_0932_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_930_EndingNishinaIII

;Push the player into the bed furniture.
Alias_Nishina01_DrOfficeBedFurniture_I.TryToDisable()
ObjectReference bed = Alias_Nishina01_DrOfficeBedFurniture_III.GetRef()
bed.Enable()
Game.GetPlayer().SnapIntoInteraction(bed)

;Disable controls until the scene ends.
kMyQuest.DisableControls(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0934_Item_00
Function Fragment_Stage_0934_Item_00()
;BEGIN CODE
;Set by: MQ207C_930_EndingNishinaIII

;Display 'Speak to Everyone'
SetObjectiveDisplayed(930)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0936_Item_00
Function Fragment_Stage_0936_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_930_EndingNishinaIII

;Also give the player the Artifact at this point.
kMyQuest.GiveArtifact()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0939_Item_00
Function Fragment_Stage_0939_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ207C_930_EndingNishinaIII

;Rafael will disable when the player next leaves Freya.
MQ207C_RafaelPostquest.SetStage(100)

;Reenable player controls.
kMyQuest.EnableControls()

;Then finish out the quest.
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE mq207cquestscript
Quest __temp = self as Quest
mq207cquestscript kmyQuest = __temp as mq207cquestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Ending Scenes.

;Complete all objectives, and the quest.
CompleteAllObjectives()
CompleteQuest()

;EVP all of the quest actors.
Alias_DirectorPatel.TryToEvaluatePackage()
Alias_EthanHughes.TryToEvaluatePackage()
Alias_MariaHughes.TryToEvaluatePackage()
Alias_RafaelAguerro.TryToEvaluatePackage()
Alias_DrBarakova.TryToEvaluatePackage()

;Make sure everything connected with the experiment is disabled.
kMyQuest.ShutdownExperiment()

;Disable Rafael's corpse in the Nishina I lab.
Alias_Nishina02_RafaelAguerroCorpse_I.TryToDisable()

;Clean up any remaining robots or turrets.
kMyQuest.CleanupNishina02RobotsAndTurretsNoWait()

;Let MQ207C_Support know the quest has ended.
MQ207C_Support.SetStage(200)

;Stop the Satellite Distress Signal SE.
SE_MQ207C.Stop()

;Clear all of the quest scripts' local variables.
kMyQuest.ClearVariables()

;Achievement Unlocked
Game.AddAchievement(8)

;Give the player the Artifact, advancing MQ207B.
MQ207B.SetStage(40)

;Then stop.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;if the player is in ending 3, get them out of the chair
If GetStageDone(939)
  Alias_Nishina01_DrOfficeBedFurniture_III.GetRef().Activate(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


LocationAlias property Alias_NishinaLocation Auto Const Mandatory
LocationAlias Property Alias_NishinaResearchLevelLocation Auto Const Mandatory
RefCollectionAlias property Alias_ShiftingTriggers Auto Const Mandatory
RefCollectionAlias property Alias_Distortions Auto Const Mandatory
ReferenceAlias property Alias_DirectorPatel Auto Const Mandatory
ReferenceAlias property Alias_EthanHughes Auto Const Mandatory
ReferenceAlias property Alias_MariaHughes Auto Const Mandatory
ReferenceAlias property Alias_RafaelAguerro Auto Const Mandatory
ReferenceAlias property Alias_DrBarakova Auto Const Mandatory
ReferenceAlias property Alias_QuickstartMarker_Space Auto Const Mandatory
ReferenceAlias property Alias_QuickstartMarker_Entrance Auto Const Mandatory
ReferenceAlias property Alias_QuickstartMarker_DirectorsOffice Auto Const Mandatory
ReferenceAlias property Alias_QuickstartMarker_FabricationLab Auto Const Mandatory
ReferenceAlias property Alias_QuickstartMarker_ResearchLevelElevator Auto Const Mandatory
ReferenceAlias property Alias_QuickstartMarker_HighEnergyResearchLab Auto Const Mandatory
ReferenceAlias property Alias_QuickstartMarker_Ending_I Auto Const Mandatory
ReferenceAlias property Alias_QuickstartMarker_Ending_II Auto Const Mandatory
ReferenceAlias property Alias_NishinaExt_ExteriorDoor_I Auto Const Mandatory
ReferenceAlias property Alias_NishinaExt_ExteriorDoor_II Auto Const Mandatory
RefCollectionAlias property Alias_Nishina01_SecurityDoors_I_All Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_SecurityDoorAirlock_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_SecurityDoorElevatorLobby_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_SecurityDoor_Escort_SecurityOffice_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_SecurityDoor_Escort_StorageCorridor_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_SecurityDoor_Escort_StorageRoom_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_SecurityDoor_Escort_DoctorsHall_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_SecurityDoor_Escort_Stairwell_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_SecurityDoor_Escort_DirectorsOffice_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_SecurityDoor_Escort_FabricationLabHall_I Auto Const Mandatory
RefCollectionAlias property Alias_Nishina01_StorageCorridorCreatures_II Auto Const Mandatory
ReferenceAlias Property Alias_Nishina01_StorageCorridorSceneMarker_Player_I Auto Const Mandatory
ReferenceAlias Property Alias_Nishina01_StorageCorridorSceneMarker_Ethan_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_StorageRoomSceneMarker_Player_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_StorageRoomSceneMarker_Ethan_I Auto Const Mandatory
RefCollectionAlias property Alias_Nishina01_DoctorsCorridorCreatures_II Auto Const Mandatory
RefCollectionAlias property Alias_Nishina01_PostDirectorCreatures_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_StairsSceneMarker_Ethan_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_FabricationLabHallwayTrigger_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_StorageRoomCollapseEnableMarker_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_PantryDoor_II Auto Const Mandatory
ReferenceAlias Property Alias_Nishina01_SecurityOfficeTerminal_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ScientistEnableMarker_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_FabricationLabQT_II Auto Const Mandatory
RefCollectionAlias property Alias_Nishina01_CreaturesAll_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_FabricationLabDistortion_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_FabricationLabDistortionTrigger_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ProbeControlUnit_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_FabricationLabDistortion_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ElevatorFloorMarker_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_PostquestDebrisEnableMarker_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_DrOfficeBedFurniture_III Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_PostquestDividerEnableMarker_III Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_RafaelAguerroCorpse_III Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_SecurityOffice_EthanHughesWarpMarker_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_DirectorsOffice_EthanHughesStandGuard_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_DirectorsOffice_PlayerMoveForDirectorsScene Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_FabricationLab_MariaHughesMarker_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Entryway_RafaelSandboxMarker_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending01_DirectorPatelMarker_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending01_EthanHughesMarker_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending01_EthanHughesStartMarker_I01 Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending01_MariaHughesMarker_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending02_RafaelAguerroMarker_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending03_DirectorPatelStartMarker_III Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending03_DirectorPatelMarker_III Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending03_MariaHughesStartMarker_III Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending03_MariaHughesMarker_III Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending03_RafaelAguerroStartMarker_III Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending03_RafaelAguerroMarker_III Auto Const Mandatory
ReferenceAlias property Alias_Nishina01_ActorTarget_Ending03_DrBarakovaMarker_III Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_ElevatorFloorMarker_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_RafaelAguerroCorpse_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_PowerInterlockChainHead_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_PowerInterlockChainHead_II Auto Const Mandatory
RefCollectionAlias property Alias_Nishina02_PowerInterlocks_I Auto Const Mandatory
RefCollectionAlias property Alias_Nishina02_PowerInterlocks_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_MasterControlTerminal_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_MasterControlTerminal_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_EmergencyShutdown_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_EmergencyShutdown_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_PrimaryCalibration_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_PrimaryCalibration_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_LabDistortionNearestArtifact_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_LabDistortionNearestArtifact_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_ArtifactActivator_I Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_ArtifactActivator_II Auto Const Mandatory
ReferenceAlias property Alias_Nishina02_InvisibleLoadDoor Auto Const Mandatory
ReferenceAlias Property Alias_NishinaExt_ExteriorEnemiesEnableMarker_II Auto Const Mandatory
ReferenceAlias Property Alias_NishinaMapMarker Auto Const Mandatory
ReferenceAlias Property Alias_Nishina01_FabricationLabHallwayTrigger02_I Auto Const Mandatory
ReferenceAlias Property Alias_Nishina01_LobbyWaitMarker_Rafael_II Auto Const Mandatory
ReferenceAlias Property Alias_Nishina01_StairsToLabQT_I Auto Const Mandatory
ReferenceAlias Property Alias_Nishina01_DrOfficeBedFurniture_I Auto Const Mandatory
RefCollectionAlias Property Alias_Nishina01_CafeteriaNPCs_I Auto Const Mandatory
RefCollectionAlias property Alias_Nishina02_SecurityDoors_Facilities_I Auto Const Mandatory
RefCollectionAlias property Alias_Nishina02_SecurityDoors_AcceleratorControl_I Auto Const Mandatory
RefCollectionAlias property Alias_Nishina02_SecurityDoors_Accelerator_I Auto Const Mandatory
RefCollectionAlias property Alias_Nishina02_SecurityDoors_Storage_I Auto Const Mandatory
RefCollectionAlias property Alias_Nishina02_SecurityDoors_All_I Auto Const Mandatory
RefCollectionAlias property Alias_Nishina02_SecurityDoors_All_II Auto Const Mandatory
RefCollectionAlias property Alias_Nishina02_RobotsAndTurrets_All_I Auto Const Mandatory
RefCollectionAlias property Alias_Nishina02_RobotsToDisablePostquest_I Auto Const Mandatory
RefCollectionAlias Property Alias_Nishina02_I_SecurityCameras Auto Const Mandatory

Scene property MQ207C_121_EntranceAirlock Auto Const Mandatory
Scene property MQ207C_140_EscortStorageCorridor Auto Const Mandatory
Scene property MQ207C_162a_EscortReactStorageCorridor Auto Const Mandatory
Scene property MQ207C_162_EscortReactStorageCorridor Auto Const Mandatory
Scene property MQ207C_170_EscortStorageRoom Auto Const Mandatory
Scene property MQ207C_180_EscortReactStorageRoom01 Auto Const Mandatory
Scene property MQ207C_182_EscortReactStorageRoom02 Auto Const Mandatory
Scene property MQ207C_185_EscortReactStorageRoom03 Auto Const Mandatory
Scene property MQ207C_190_EscortStairs Auto Const Mandatory
Scene property MQ207C_200_EscortDirector Auto Const Mandatory
Scene Property MQ207C_200_MariaIdle Auto Const Mandatory
Scene property MQ207C_210_DirectorIntro Auto Const Mandatory
Scene property MQ207C_400_ShiftingMariaEscort Auto Const Mandatory
Scene Property MQ207C_425_Cafeteria Auto Const Mandatory
Scene property MQ207C_510_ExperimentMaria02 Auto Const Mandatory
Scene property MQ207C_520_ExperimentMaria04 Auto Const Mandatory
Scene property MQ207C_610_FacilitiesAreaLockdown Auto Const Mandatory
Scene property MQ207C_620_AcceleratorAreaLockdown Auto Const Mandatory
Scene property MQ207C_630_StorageAreaLockdown Auto Const Mandatory
Scene property MQ207C_730_TakeArtifact Auto Const Mandatory
Scene property MQ207C_731_EndLockdown Auto Const Mandatory
Scene property MQ207C_915_EndingNishinaI Auto Const Mandatory
Scene property MQ207C_925_EndingNishinaII Auto Const Mandatory
Scene property MQ207C_930_EndingNishinaIII Auto Const Mandatory
Scene Property MQ207C_930_EndingNishinaIII_02 Auto Const Mandatory
Scene Property MQ207C_930_EndingNishinaIII_03 Auto Const Mandatory

sq_parentscript Property SQ_Parent Auto Const Mandatory
Quest Property MQ207B Auto Const Mandatory
Quest Property MQ207C_RafaelPostquest Auto Const Mandatory
Quest Property MQ206C Auto Const Mandatory
Quest Property SE_MQ207C Auto Const Mandatory
Quest Property MQ207C_Support Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory
Faction Property MQ207CNishinaIFaction Auto Const Mandatory
Faction Property MQ207CNishinaIIFaction Auto Const Mandatory
Faction Property MQ207CNishinaIIEnemyFaction Auto Const Mandatory

Key Property LC116_PantryKey Auto Const Mandatory
ActorValue Property MQ207C_ForeknowledgeMergeAV Auto Const Mandatory
Message Property MQ207C_QuickstartLevelForceMessage Auto Const Mandatory
Message Property MQ207C_SurveyDataDownloadedMessage Auto Const Mandatory
Keyword Property PlanetTrait19PsychotropicBiota Auto Const Mandatory
ObjectReference Property MQ207C_QuickstartMarker_CafeteriaRef Auto Const Mandatory
WwiseEvent Property WwiseEvent_QSTMQ207C_ShiftToA Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_MQ207C_DistortionsAppear Auto Const Mandatory

Quest Property MQ00 Auto Const Mandatory
