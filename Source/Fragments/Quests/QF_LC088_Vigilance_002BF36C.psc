;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC088_Vigilance_002BF36C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Quickstart - Docking Port

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Quickstart - Rokov

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_Rokov)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Quickstart - Mathis

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_Mathis)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Quickstart - Naeva

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_Naeva)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Quickstart - Adler

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_Adler)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart - Huan

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_Huan)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Quickstart - Estelle

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_Estelle)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Quickstart - Flee

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC088_Quickstart_Flee)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart - Kibwe

;All Quickstarts: Perform faction and any other general setup.
SetStage(9)

;Disable all prior enemies on the ship, as if they had fled.
Alias_Flee_NonBossBattleEnemies.DisableAll()

;Move the player to the quickstart marker.
if (!CF_Post.GetStageDone(0))
     Game.GetPlayer().MoveTo(LC088_Quickstart_Kibwe)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
;Quickstart Helper Stage
;Set by: Other Quickstarts

;LC088_Space needs to be running in order for CF08_Fleet to fill its
;aliases, so set LC088_Space's CF Skip stage.
;
;This also spawns a ship for the player and sets prior stages.
LC088_Space.SetStage(40)

;Instant-dock the player's ship to the Vigilance.
Alias_PlayerShip.GetShipRef().InstantDock(Alias_Vigilance.GetShipRef())

;Advance CF08 to this point.
CF08_Fleet.SetStage(310)

;If not starting from the beginning, disable the boarding alarm
;and start the announcements scene.
if (!GetStageDone(0))
     SetStage(110)
EndIf

;If quickstarting to Ops, disable the announcements scene.
if (GetStageDone(8))
     LC088_000_Announcements.Stop()
EndIf

;Move the player to the quickstart marker.
Game.GetPlayer().MoveTo(LC082_Quickstart_DockingPort)

;After loading into the Vigilance, Stage 11's on-load setup runs.
;When it finishes, it sets stage 12 to indicate that
;we can proceed with the quickstart.
While (!GetStageDone(12))
     Utility.Wait(0.1)
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Startup Stage

;Reset the location.
Location vigilanceLoc = Alias_LC088VigilanceLocation.GetLocation()
vigilanceLoc.Reset()

;Remove LocTypeShowClothing from the Vigilance.
vigilanceLoc.RemoveKeyword(LocTypeShowClothing)

;Perform the basic state swap for the Vigilance's interior.
LC082_CFMain_EnableMarker.Disable()
LC088_DisableMarker.Disable()
LC088_EnableMarker.Enable()
Alias_Brig_Clutter.EnableAll()
Alias_Flee_NonBossBattleEnemies.EnableAll()
Alias_Ops_CrowdWalla.TryToDisable()
Alias_Ops_RobotsAndTurrets.EnableAll()

;Initialize the doors to the Operations Center.
kMyQuest.Ops_InitSecurityDoors()

;Enable the boarding alarm.
LC082_BoardingAlarmMarkerRef.Enable()

;Lock down the elevators.
kMyQuest.Ops_SetElevatorLockedDown(True)

;Set up for the Operations Center event.
kMyQuest.Ops_SetupOps()

;Continue with setup in another thread.
SetStageNoWait(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 10, via CallFunctionNoWait.
;
;This quest has some setup that can only be done after the Viglance
;has loaded for the first time. In normal gameplay, all of this will
;just execute immediately. For quickstarts, we have to block and wait
;until the quickstart has loaded the player into the cell.

;Wait for the Brig to initialize on load.
While (!LC082_BrigManagerRef.HasInitilized())
     Utility.Wait(0.1)
EndWhile

;Set up the prisoners in the Brig.
kMyQuest.SetupBrigPrisoners()

;Set up the Captains' events.
kMyQuest.SetupAllCaptainEvents()

;Update4: Lock the Quarters and Mess Hall doors.
Alias_Patch_MessHallDoor.GetRef().Lock()
Alias_Patch_QuartersDoor.GetRef().Lock()

;And we're done.
SetStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
;Set by: Startup, Rokov Active

Actor RokovRef = Alias_Rokov.GetActorRef()
RokovRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_03)
RokovRef.AddToFaction(CrimeFactionCrimsonFleet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
;Set by: Startup, Mathis Active

Actor MathisRef = Alias_Mathis.GetActorRef()
MathisRef.AddPerk(LC088_Vigilance_MathisInitialDebuffPerk)
MathisRef.AddItem(LLI_CrimsonFleet_Heavy)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Set by: Startup, Naeva Active
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
;Set by: Startup, Adler Active

;If Adler is active, the Weapons Security Office Door starts open
;so it doesn't slow his pathing when his event starts.
ObjectReference adlerDoor = Alias_Adler_SecurityOfficeDoor.GetRef()
adlerDoor.Unlock()
adlerDoor.SetOpen(True)

;Update Adler's Factions.
Actor AdlerRef = Alias_Adler.GetActorRef()
AdlerRef.RemoveFromFaction(CrimeFactionUC)
AdlerRef.RemoveFromFaction(CydoniaFaction)
AdlerRef.AddToFaction(CrimeFactionCrimsonFleet)
AdlerRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Startup, Huan Active

;Huan enables during setup, to prevent the player from seeing
;her pop in later. She ignores combat until they arrive.
kMyQuest.EnableCaptain(Alias_Huan, Alias_Huan_StartMarker)

;Make sure Huan is in her correct, final outfit.
Alias_Huan.GetActorRef().SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
;Set by: Startup, Estelle Active

Actor EstelleRef = Alias_Estelle.GetActorRef()
EstelleRef.SetOutfit(Outfit_Clothes_CrimsonFleet_Captain_04)
EstelleRef.RemoveFromFaction(CrimeFactionNeon)
EstelleRef.AddToFaction(CrimeFactionCrimsonFleet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Patch: Trigger in Huan's area.

;Update4: Unlock the Mess Hall door.
Alias_Patch_MessHallDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;Set by: LC088_100_BoardingAnnouncement

;Start the Announcements scene.
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set by: Trigger, Docking Bay area.

;Start the Boarding Announcement scene.
LC088_100_BoardingAnnouncement.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Set by LC088_100_BoardingAnnouncement, scene end.

;Stop the boarding alarm.
LC082_BoardingAlarmMarkerRef.Disable()

;Start the Announcements scene.
LC088_000_Announcements.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set by: Trigger, Brig Entry area.

;Update CF08's objectives.
CF08_Fleet.SetStage(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Set by: Quest script, when any prisoner is released.

;Update CF08's objectives.
CF08_Fleet.SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
;Set by: Alias script, when all enemies in the Brig have been killed.

;Update CF08's objectives.
CF08_Fleet.SetStage(330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set by: Approaching the door to the Cargo Bay.

;Play an announcement scene here, if possible.
Game.GetPlayer().SetValue(LC088_Vigilance_PlayAnnouncementValue, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;Set by: Cargo Bay Trigger

;If Rokov's event is active, begin his announcement scene.
if (GetStageDone(13))
     ;Begin Rokov's Announcement scene over the PA.
     LC088_300_Rokov_Start.Start()
EndIf

;EVP all of the released prisoners to update their packages.
int i = 0
While (i < Alias_Brig_ReleasedPrisoners.GetCount())
     (Alias_Brig_ReleasedPrisoners.GetAt(i) as Actor).EvaluatePackage()
     i = i + 1
EndWhile

;Shut down the optional objectives for the Brig.
CF08_Fleet.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_300_Rokov_Start

;Enable Rokov and his allies.
kMyQuest.EnableCaptainAlly(Alias_Rokov_Ally01)
kMyQuest.EnableCaptainAlly(Alias_Rokov_Ally02)
kMyQuest.EnableCaptain(Alias_Rokov, Alias_Rokov_StartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Cargo Bay Combat Cleared

;Set Rokov's event complete.
if (GetStageDone(13))
     kMyQuest.SetCaptainComplete(Alias_Rokov.GetActorRef())
     kMyQuest.SetCaptainComplete(Alias_Rokov_Ally01.GetActorRef())
     kMyQuest.SetCaptainComplete(Alias_Rokov_Ally02.GetActorRef())
     if (GetStage() < 400)
          CF08_Fleet.SetStage(605)
     EndIf
EndIf

;Also set the Brig Prisoners complete.
kMyQuest.SetCaptainAlliesComplete(Alias_Brig_ReleasedPrisoners)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
;Set by: Rokov's dialogue.

;Update CF08's objectives.
CF08_Fleet.SetStage(610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Approaching the door to Robotics.

;Play an announcement scene here, if possible.
Game.GetPlayer().SetValue(LC088_Vigilance_PlayAnnouncementValue, 1)

;If Mathis is present, start the battle immediately. Otherwise,
;wait for the player to hit the trigger, which sets stage 410.
if (GetStageDone(14))
     kMyQuest.EnableCaptain(Alias_Mathis, Alias_Mathis_StartMarker)
     LC088_410_Mathis_Start.Start()

     ;Then start the Robotics Bay battle.
     kMyQuest.Robotics_StartRoboticsBayBattle()
EndIf

;Set Rokov's skip stage.
if (!CF08_Fleet.GetStageDone(610))
     CF08_Fleet.SetStage(615)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger in the Robotics Bay

if (GetStageDone(14))
     ;If Mathis is present, remove the debuff perk from him now, so
     ;he can start dealing reasonable damage to the robots.
     Alias_Mathis.GetActorRef().RemovePerk(LC088_Vigilance_MathisInitialDebuffPerk)
Else
     ;If Mathis is not present, start the battle when the player reaches
     ;the middle of the Robotics Bay. 
     kMyQuest.Robotics_StartRoboticsBayBattle()
EndIf

;And seal the Robotics Bay Doors.
kMyQuest.Robotics_SealRoboticsBayDoors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
;Set by: Quest script, Robotics_DeactivateRobots.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Robotics Bay Combat Cleared

;Cut off the standard announcement and play the Robotics End Announcement.
LC088_000_Announcements.Stop()
LC088_480_RoboticsEndAnnouncement.Start()

;Set Mathis' event complete.
if (GetStageDone(14))
     kMyQuest.SetCaptainComplete(Alias_Mathis.GetActorRef())
     if (GetStage() < 500)
          CF08_Fleet.SetStage(620)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0481_Item_00
Function Fragment_Stage_0481_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_480_RoboticsEndAnnouncement, scene phase.

;Unseal the Robotics Bay Doors.
kMyQuest.Robotics_UnsealRoboticsBayDoors()

;The scene resumes the normal announcement scenes after a delay.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
;Set by: Mathis' dialogue.

;Update CF08's objectives.
CF08_Fleet.SetStage(625)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, Engineering Entry

;Enable Naeva, if appropriate.
if (GetStageDone(15))
     kMyQuest.EnableCaptain(Alias_Naeva, Alias_Naeva_StartMarker)
     int i = 0
     int count = Alias_Naeva_Allies.GetCount()
     While (i < count)
          kMyQuest.EnableCaptainAllyRef(Alias_Naeva_Allies.GetAt(i) as Actor)
          i = i + 1
     EndWhile
EndIf

;Set Mathis' skip stage.
if (!CF08_Fleet.GetStageDone(625))
     CF08_Fleet.SetStage(630)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, Engineering Entry Hall.

;EVP Naeva and Allies
kMyQuest.EVPNaevaAndAllies()

;Start Naeva's greet scene.
;;;SetStage(511)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0511_Item_00
Function Fragment_Stage_0511_Item_00()
;BEGIN CODE
;Set by: Trigger, Naeva's Entry Hall.

;Play Naeva's greet scene.
LC088_511_Naeva_Start.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_511_Naeva_Start, scene end.

;EVP Naeva and Allies
kMyQuest.EVPNaevaAndAllies()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Door to Engineering Room 1 Opened.

;Adjust the next QT.
LC088_Vigilance_QTMarkerWeaponsRef.MoveTo(LC088_Vigilance_EngineRoom01EndBreadcrumb)

;Disable door collision.
Alias_Naeva_Room1CollisionMarkers.DisableAll()

if (GetStageDone(15))
     ;Stop Naeva's greet scene, if it was still running.
     LC088_511_Naeva_Start.Stop()

     ;Play Naeva's breach scene.
     LC088_530_Naeva_Breach_1.Start()

     ;EVP Naeva and Allies a couple of times, since we can't know
     ;when the Navmesh has healed properly.
     kMyQuest.EVPNaevaAndAllies()
     Utility.Wait(2)
     kMyQuest.EVPNaevaAndAllies()
     Utility.Wait(2)
     kMyQuest.EVPNaevaAndAllies()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Door to Engineering Room 2 Opened.

;Adjust the next QT.
LC088_Vigilance_QTMarkerWeaponsRef.MoveTo(LC088_Vigilance_EngineRoom02EndBreadcrumb)

;Disable door collision.
Alias_Naeva_Room2CollisionMarkers.DisableAll()

if (GetStageDone(15))
     ;Play Naeva's breach scene.
     LC088_550_Naeva_Breach_2.Start()

     ;EVP Naeva and Allies
     kMyQuest.EVPNaevaAndAllies()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Door to Engineering Room 3 Opened.

;Adjust the next QT.
LC088_Vigilance_QTMarkerWeaponsRef.MoveTo(LC088_Vigilance_EngineRoom03EndBreadcrumb)

;Disable door collision.
Alias_Naeva_Room3CollisionMarkers.DisableAll()

if (GetStageDone(15))
     ;Play Naeva's breach scene.
     LC088_570_Naeva_Breach_3.Start()

     ;EVP Naeva and Allies
     kMyQuest.EVPNaevaAndAllies()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0580_Item_00
Function Fragment_Stage_0580_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Script, Engine Room 3 Collection

;EVP Naeva and Allies
kMyQuest.EVPNaevaAndAllies()

;Check whether Naeva is active and in combat.
if (GetStageDone(15) && (Alias_Naeva.GetActorRef().GetCombatState() == 0)) ;Not in combat
     SetStage(581)
Else
     SetStage(585)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0581_Item_00
Function Fragment_Stage_0581_Item_00()
;BEGIN CODE
;Set by: Engine Room 3 Cleared (Stage 580) & Naeva not in combat
;(Stage 580 check or alias script).

;Play Naeva's cleared scene.
LC088_581_Naeva_Clear.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0582_Item_00
Function Fragment_Stage_0582_Item_00()
;BEGIN CODE
;Set by: LC088_581_Naeva_Clear scene done.

;Play the Engine Room Cleared Announcement.
SetStage(585)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0585_Item_00
Function Fragment_Stage_0585_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 580 or 582.

;Cut off the standard announcement and play the Engine End Announcement.
LC088_000_Announcements.Stop()
LC088_580_EngineEndAnnouncement.Start()

;Set Naeva's event complete.
if (GetStageDone(15))
     kMyQuest.SetCaptainComplete(Alias_Naeva.GetActorRef())
     kMyQuest.SetCaptainAlliesComplete(Alias_Naeva_Allies)
     if (GetStage() < 600)
          CF08_Fleet.SetStage(665)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN CODE
;Set by: Naeva's dialogue.

;Update CF08's objectives.
CF08_Fleet.SetStage(670)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Set by: Opening the door to the Weapons area.

;Start Adler's scene, if appropriate.
if (GetStageDone(16))
     SetStage(610)
EndIf

;Set Naeva's skip stage.
if (!CF08_Fleet.GetStageDone(670))
     CF08_Fleet.SetStage(675)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 600

;Enable Adler and start his Call Out scene.
kMyQuest.EnableCaptain(Alias_Adler, Alias_Adler_StartMarker)
LC088_610_Adler_Start.Start()
CF08_Fleet.SetStage(360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
;Set by: Adler Dialogue

;EVP Adler to advance his package.
Alias_Adler.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
;Set by: Adler Dialogue

;EVP Adler to advance his package.
Alias_Adler.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0631_Item_00
Function Fragment_Stage_0631_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Adler Dialogue, Direct Option

;Seal the Weapons Bay doors.
SetStage(640)

;Unlock the access door.
Alias_Adler_StealthDoor.GetRef().Unlock()

;Convert and activate the Robots and Turrets.
kMyQuest.Weapons_ConvertRobotsAndTurrets()

;Update CF08's objectives.
CF08_Fleet.SetStage(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0632_Item_00
Function Fragment_Stage_0632_Item_00()
;BEGIN CODE
;Set by: Adler Dialogue, Stealth Option

;Unlock the access door.
Alias_Adler_StealthDoor.GetRef().Unlock()

;Update CF08's objectives.
CF08_Fleet.SetStage(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0633_Item_00
Function Fragment_Stage_0633_Item_00()
;BEGIN CODE
;Set by: Adler Dialogue, 'Nothing' Option

;Update CF08's objectives.
CF08_Fleet.SetStage(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stages 631 or terminal.

;Seal the Weapons Bay Hall Door.
kMyQuest.Weapons_SealWeaponBays()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Player enters the ambush hallway, or any actor in the
;Weapons Bay section enters combat.

;EVP Adler to update his package.
Alias_Adler.TryToEvaluatePackage()

;Close Adler's objective if not completed.
CF08_Fleet.SetStage(375)

;Trigger the Weapons Bay ambush.
kMyQuest.Weapons_StartAmbush()

;Play the ambush scenes.
LC088_650_WeaponsAmbushStart.Start()
if (GetStageDone(640))
   LC088_650_WeaponsAmbushDoorStuck.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Weapons Bay Combat Cleared

;Set Adler's event complete.
if (GetStageDone(16))
     kMyQuest.SetCaptainComplete(Alias_Adler.GetActorRef())
     ;if (GetStage() < 700)
          ;No 'Speak to Adler' stage.
     ;EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
;Set by: Adler's dialogue.

;Update CF08's objectives.
CF08_Fleet.SetStage(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Mess Hall, Entry Trigger

;Adjust the next QT.
LC088_Vigilance_QTMarkerQuartersRef.MoveTo(LC088_Vigilance_MessHallStartBreadcrumb)

;Huan enabled in her setup stage.
;Start her event at this point, if appropriate.
if (GetStageDone(17))
     SetStage(710)
EndIf

;Set Adler's skip stage.
if (!CF08_Fleet.GetStageDone(370))
     CF08_Fleet.SetStage(375)
EndIf

;Update4: Unlock the Mess Hall door.
Alias_Patch_MessHallDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
;Set by: Mess Hall Corridor Door.

if (GetStageDone(17))
     if (Game.GetPlayer().IsInCombat() || Alias_Huan.GetActorRef().IsInCombat())
          LC088_710_Huan_Start_InCombat.Start()
     Else
          ;EVP Huan to start her forcegreet.
          Alias_Huan.TryToEvaluatePackage()
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
;Set by: Mess Hall Corridor Door.

;EVP Huan to start her forcegreet.
Alias_Huan.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Opening the door to the Mess Hall.

;Adjust the next QT.
LC088_Vigilance_QTMarkerQuartersRef.MoveTo(LC088_Vigilance_MessHallEndBreadcrumb)

;Update4: Unlock the Quarters door.
Alias_Patch_QuartersDoor.GetRef().Unlock()

;Disable the navcut volume near the door.
LC088_Vigilance_MessHallNavcutRef.Disable()
Utility.Wait(2)

;Push Huan into her combat alias,
;giving her combat hold positions in the Mess Hall.
if (GetStageDone(17))
     Alias_HuanCombat.ForceRefTo(Alias_Huan.GetRef())
     Alias_Huan.TryToEvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Mess Hall Trigger

;Start the Mess Hall Ambush.
kMyQuest.Mess_StartAmbush()

;Play the ambush scene.
LC088_750_MessAmbushStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0780_Item_00
Function Fragment_Stage_0780_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Mess Hall Combat Cleared

;Set Huan's event complete.
if (GetStageDone(17))
     kMyQuest.SetCaptainComplete(Alias_Huan.GetActorRef())
     if (GetStage() < 800)
          CF08_Fleet.SetStage(635)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0790_Item_00
Function Fragment_Stage_0790_Item_00()
;BEGIN CODE
;Set by: Huan's dialogue.

;Update CF08's objectives.
CF08_Fleet.SetStage(640)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Door to the Quarters area.

;Play an announcement scene here, if possible.
Game.GetPlayer().SetValue(LC088_Vigilance_PlayAnnouncementValue, 1)

;Set up the Quarters event.
kMyQuest.SetupEstelle()

;Set Huan's skip stage.
if (!CF08_Fleet.GetStageDone(640))
     CF08_Fleet.SetStage(645)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, Quarters Room; or Stage 800.

;Enable Estelle and her allies.
kMyQuest.EnableEstelle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
;Set by: Trigger Quarters area.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0880_Item_00
Function Fragment_Stage_0880_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quarters Combat Cleared

;Make sure the start-of-combat stage was set.
SetStage(820)

;Set Estelle's event complete.
if (GetStageDone(18))
     kMyQuest.SetCaptainComplete(Alias_Estelle.GetActorRef())
     kMyQuest.SetCaptainAlliesComplete(Alias_Estelle_Level2_QuartersAllies)
     kMyQuest.SetCaptainAlliesComplete(Alias_Estelle_Level3_QuartersAllies)
     if (GetStage() < 900)
          CF08_Fleet.SetStage(650)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0890_Item_00
Function Fragment_Stage_0890_Item_00()
;BEGIN CODE
;Set by: Estelle's dialogue.

;Update CF08's objectives.
CF08_Fleet.SetStage(655)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
;Set by: Door to the Flight Control area.

;Set Estelle's skip stage.
if (!CF08_Fleet.GetStageDone(655))
     CF08_Fleet.SetStage(660)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0901_Item_00
Function Fragment_Stage_0901_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger entering the Flight Control area.

;Stop the Announcements scene.
LC088_000_Announcements.Stop()

;Start the Flee scene.
LC088_910_Flee_Start.Start()

;Have enemies start fleeing.
SetStage(902)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0902_Item_00
Function Fragment_Stage_0902_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_910_Flee_Start, mid-scene.

;All enemies abandon ship.
Utility.Wait(1)
kMyQuest.Flee_StartFleeing()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0903_Item_00
Function Fragment_Stage_0903_Item_00()
;BEGIN CODE
;Set by: LC088_910_Flee_Start, mid-scene.

;Start the Abandon Ship alarm.
LC082_AbandonShipAlarmMarkerRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0921_Item_00
Function Fragment_Stage_0921_Item_00()
;BEGIN CODE
;Set by: Trigger, Flight Control Area

;Prevent further enemy escapes from this point. Play VFX & SFX.
ObjectReference dockingPortMarker = Alias_Flee_DockingPort01.GetRef()
WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker)
dockingPortMarker.Disable()
Game.ShakeCamera(dockingPortMarker, 0.25, 3)
WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker)

;Play the shuttle scene.
LC088_921_Flee_Shuttle01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0922_Item_00
Function Fragment_Stage_0922_Item_00()
;BEGIN CODE
;Set by: Trigger, Flight Control Area

;Prevent further enemy escapes from this point. Play VFX & SFX.
ObjectReference dockingPortMarker = Alias_Flee_DockingPort02.GetRef()
WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker)
dockingPortMarker.Disable()
Game.ShakeCamera(dockingPortMarker, 0.25, 3)
WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker)

;Play the shuttle scene.
LC088_922_Flee_Shuttle02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0923_Item_00
Function Fragment_Stage_0923_Item_00()
;BEGIN CODE
;Set by: Trigger, Flight Control Area

;Prevent further enemy escapes from this point. Play VFX & SFX.
ObjectReference dockingPortMarker = Alias_Flee_DockingPort03.GetRef()
WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker)
dockingPortMarker.Disable()
Game.ShakeCamera(dockingPortMarker, 0.25, 3)
WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker)

;Play the shuttle scene.
LC088_923_Flee_Shuttle03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0924_Item_00
Function Fragment_Stage_0924_Item_00()
;BEGIN CODE
;Set by: Trigger, Flight Control Area

;Prevent further enemy escapes from this point. Play VFX & SFX.
ObjectReference dockingPortMarker = Alias_Flee_DockingPort04.GetRef()
WwiseEvent_QST_CF08_Shuttle_Disembark.Play(dockingPortMarker)
dockingPortMarker.Disable()
Game.ShakeCamera(dockingPortMarker, 0.25, 3)
WwiseEvent_ShakeController_p25_p25_03.Play(dockingPortMarker)

;Play the shuttle scene.
LC088_924_Flee_Shuttle04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Set by: Player activates the Ops entry door.

;Stop the Announcements scene.
LC088_000_Announcements.Stop()

;Stop the Abandon Ship alarm.
LC082_AbandonShipAlarmMarkerRef.Disable()

;Open the door, for visual effect.
Alias_Ops_Door_EntryDoor.GetRef().SetOpen(True)

;Start the Confrontation scene.
SetStage(1010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1003_Item_00
Function Fragment_Stage_1003_Item_00()
;BEGIN CODE
Alias_Kibwe.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1005_Item_00
Function Fragment_Stage_1005_Item_00()
;BEGIN CODE
LC088_1010_KibweConfrontationIntroCamera.Stop()
Alias_Kibwe.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
;Set by: Stage 1000

;Omit the Confrontation scene if we're skipping it for quickstart.
if (!GetStageDone(1100))
     ;Start the Kibwe Confrontation scene
     LC088_1010_KibweConfrontationIntroCamera.Start()

     ;Start speech challenge quest
     CF08_SpeechChallenge_Kibwe.Start()
EndIf

;Update CF08's objectives.
CF08_Fleet.SetStage(380)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1011_Item_00
Function Fragment_Stage_1011_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_KibweConfrontation, or stage 1020.

;Lock controls.
kMyQuest.Ops_LockPlayerControls(True)

;Block Fast Travel until the lockdown has ended
kMyQuest.Ops_SetFastTravelEnabled(False)

;Start the alarm.
Alias_CF08BattleAlarm.TryToEnable()

Actor KibweRef = Alias_Kibwe.GetActorRef()
Actor ToftRef = Alias_Toft.GetActorRef()

KibweRef.SetValue(Aggression, 0)
ToftRef.SetValue(Aggression, 0)
KibweRef.StopCombat()
ToftRef.StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1012_Item_00
Function Fragment_Stage_1012_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_KibweConfrontation, or stage 1020.

;Teleport any followers into the room with the player.
SQ_Followers.TeleportFollowers(Alias_Ops_FollowerMoveToMarker.GetRef())

;Close and seal the doors to the Operations Center.
Alias_Ops_Door_EntryDoor.GetRef().SetOpen(False)
kMyQuest.Ops_SealSecurityDoors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1019_Item_00
Function Fragment_Stage_1019_Item_00()
;BEGIN CODE
;Set by: LC088_1010_KibweConfrontation

Actor KibweRef = Alias_Kibwe.GetActorRef()
Actor ToftRef = Alias_Toft.GetActorRef()

KibweRef.SetValue(Aggression, 0)
ToftRef.SetValue(Aggression, 0)
KibweRef.StopCombat()
ToftRef.StopCombat()

;Surrender Kibwe and Toft.
Alias_Ops_SurrenderedEnemies.AddRef(KibweRef)
Alias_Ops_SurrenderedEnemies.AddRef(ToftRef)

;Skip ahead to stage 1100.
SetStage(1100)

Alias_Ops_CFBodyguard01.GetActorRef().SetGhost()
Alias_Ops_CFBodyguard02.GetActorRef().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1020_Item_00
Function Fragment_Stage_1020_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_KibweConfrontation

if (!GetStageDone(1100))
     ;Make sure all prior stages have been set.
     SetStage(1011)
     SetStage(1012)

     ;Lock controls.
     kMyQuest.Ops_LockPlayerControls(False)

     ;Start the battle.
     kMyQuest.Ops_StartBattleNoWait()

     ;Update CF08's objectives.
     CF08_Fleet.SetStage(390)
     CF08_Fleet.SetStage(400)
     CF08_Fleet.SetStage(410)
EndIf

Actor KibweRef = Alias_Kibwe.GetActorRef()
Actor ToftRef = Alias_Toft.GetActorRef()

KibweRef.SetValue(Aggression, 1)
ToftRef.SetValue(Aggression, 1)
KibweRef.StartCombat(Game.GetPlayer())
ToftRef.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Alias script, Kibwe killed.

;Update CF08's objectives.
CF08_Fleet.SetStage(420)

;Activate all remaining robots and turrets.
kMyQuest.Ops_ActivateAllTurrets()
kMyQuest.Ops_ActivateAllRobots()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1051_Item_00
Function Fragment_Stage_1051_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Alias script, Toft killed.

;Update CF08's objectives.
CF08_Fleet.SetStage(430)

;Activate all remaining robots and turrets.
kMyQuest.Ops_ActivateAllTurrets()
kMyQuest.Ops_ActivateAllRobots()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1094_Item_00
Function Fragment_Stage_1094_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 1100, via Ops_EndBattle function.
LC088_581_Naeva_Clear.Stop()

;Enable Naeva and her bodyguards
Alias_Ops_CFBodyguard01.TryToEnableNoWait()
Alias_Ops_CFBodyguard02.TryToEnableNoWait()
Alias_Naeva.TryToEnable()
Alias_Naeva.TryToMoveTo(Alias_Ops_NaevaSurrenderStartMarker.GetRef())
Alias_Naeva.GetActorRef().SetGhost(true)

;Start the appropriate post-battle scene.
;Naeva and her allies are actually enabled in stage 1094,
;but the scene has to start now to lock down Ikande and Toft.

if (GetStageDone(1019))
    LC088_1019_SurrenderScene.Start()
Else
    LC088_1020_ExecutionScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Player uses Kibwe's Terminal to take control of the Vigilance.

;Unlock controls.
kMyQuest.Ops_LockPlayerControls(False)

;Clean up after the battle.
;-Stop the music.
;-Stop the battle alarm.
;-Shut down the Captains' events and clean up the Captains.
;-Deactivate robots, turrets, and any surviving enemies.
;-Clean up all of the prisoners.
;-Unseal security doors and the elevators.
;-Set Fast Travel enabled.
;-Start Naeva's post-battle scene.
;-Update LC088_Space.
;-Start the postquest.
kMyQuest.Ops_EndBattleNoWait()

;Update CF08's objectives.
CF08_Fleet.SetStageNoWait(440)
CF08_Fleet.SetStageNoWait(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1101_Item_00
Function Fragment_Stage_1101_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: CF_Post Stage 0.

;This stage should exactly mirror Stage 1100, just using the
;latent version of all function calls.
kMyQuest.Ops_LockPlayerControls(False)
kMyQuest.Ops_EndBattle()
CF08_Fleet.SetStage(440)
CF08_Fleet.SetStage(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
;Set by: Surrender scene.

;Disable Ikande.
Alias_Kibwe.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1111_Item_00
Function Fragment_Stage_1111_Item_00()
;BEGIN CODE
;Set by: Surrender scene.

;Disable Toft.
Alias_Toft.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1112_Item_00
Function Fragment_Stage_1112_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Surrender scene.

;Disable Naeva.
Actor NaevaRef = Alias_Naeva.GetActorRef()

NaevaRef.SetGhost(false)
NaevaRef.Disable()

Alias_Ops_CFBodyguard01.GetActorRef().SetGhost(false)
Alias_Ops_CFBodyguard02.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1119_Item_00
Function Fragment_Stage_1119_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Surrender scene.

;Set all prior surrender scene stages.
SetStage(1110)
SetStage(1111)
SetStage(1112)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE lc088_vigilancequestscript
Quest __temp = self as Quest
lc088_vigilancequestscript kmyQuest = __temp as lc088_vigilancequestscript
;END AUTOCAST
;BEGIN CODE
;Shutdown/Stop Stage

;Set relevant prior stages.
SetStage(1090)

;Clean up all other actors.
Alias_Flee_NonBossBattleEnemies.DisableAll()
Alias_Ops_RobotsAndTurrets.DisableAll()
Alias_Kibwe.TryToDisable()
Alias_Toft.TryToDisable()

;Make sure the Robotics doors are open.
Alias_Mathis_EnableMarker.TryToDisable()
Alias_Mathis_DisableMarker.TryToDisable()
kMyQuest.Robotics_UnsealRoboticsBayDoors()

;Clean up the quest script.
kMyQuest.Cleanup()

;Then stop the quest.
CF08_SpeechChallenge_Kibwe.Stop()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


sq_followersscript Property SQ_Followers Auto Const Mandatory
Quest Property CF_Main Auto Const Mandatory
Quest Property CF_Post Auto Const Mandatory
Quest Property CF01 Auto Const Mandatory
Quest Property CF08_Fleet Auto Const Mandatory
Quest Property CF08_SpeechChallenge_Kibwe Auto Const Mandatory
Quest Property LC082 Auto Const Mandatory
Quest Property LC088_Space Auto Const Mandatory
Quest Property LC088_Vigilance Auto Const Mandatory

ReferenceAlias property Alias_Rokov Auto Const Mandatory
ReferenceAlias property Alias_Rokov_Ally01 Auto Const Mandatory
ReferenceAlias property Alias_Rokov_Ally02 Auto Const Mandatory
ReferenceAlias property Alias_Rokov_StartMarker Auto Const Mandatory
ReferenceAlias property Alias_Mathis Auto Const Mandatory
ReferenceAlias property Alias_Mathis_StartMarker Auto Const Mandatory
ReferenceAlias property Alias_Mathis_EndMarker Auto Const Mandatory
ReferenceAlias property Alias_Naeva Auto Const Mandatory
RefCollectionAlias property Alias_Naeva_Allies Auto Const Mandatory
ReferenceAlias property Alias_Naeva_StartMarker Auto Const Mandatory
RefCollectionAlias property Alias_Naeva_Room1CollisionMarkers Auto Const Mandatory
RefCollectionAlias property Alias_Naeva_Room2CollisionMarkers Auto Const Mandatory
RefCollectionAlias property Alias_Naeva_Room3CollisionMarkers Auto Const Mandatory
ReferenceAlias property Alias_Adler Auto Const Mandatory
ReferenceAlias property Alias_Adler_StartMarker Auto Const Mandatory
ReferenceAlias property Alias_Adler_StealthDoor Auto Const Mandatory
ReferenceAlias property Alias_Huan Auto Const Mandatory
ReferenceAlias property Alias_HuanCombat Auto Const Mandatory
ReferenceAlias property Alias_Huan_StartMarker Auto Const Mandatory
ReferenceAlias property Alias_Estelle Auto Const Mandatory
ReferenceAlias property Alias_Estelle_StartMarker Auto Const Mandatory
RefCollectionAlias property Alias_Estelle_Level2_QuartersAllies Auto Const Mandatory
RefCollectionAlias property Alias_Estelle_Level3_QuartersAllies Auto Const Mandatory
ReferenceAlias property Alias_Flee_DockingPort01 Auto Const Mandatory
ReferenceAlias property Alias_Flee_DockingPort02 Auto Const Mandatory
ReferenceAlias property Alias_Flee_DockingPort03 Auto Const Mandatory
ReferenceAlias property Alias_Flee_DockingPort04 Auto Const Mandatory

RefCollectionAlias Property Alias_Brig_Clutter Auto Const Mandatory
RefCollectionAlias Property Alias_Brig_ReleasedPrisoners Auto Const Mandatory
RefCollectionAlias Property Alias_Flee_NonBossBattleEnemies Auto Const Mandatory
RefCollectionAlias Property Alias_Mess_AmbushEnemies Auto Const Mandatory
RefCollectionAlias Property Alias_Ops_RobotsAndTurrets Auto Const Mandatory
RefCollectionAlias Property Alias_Ops_SurrenderedEnemies Auto Const Mandatory
ReferenceAlias Property Alias_Adler_SecurityOfficeDoor Auto Const Mandatory
ReferenceAlias Property Alias_Kibwe Auto Const Mandatory
ReferenceAlias Property Alias_Mathis_DisableMarker Auto Const Mandatory
ReferenceAlias Property Alias_Mathis_EnableMarker Auto Const Mandatory
ReferenceAlias Property Alias_Ops_CFBodyguard01 Auto Const Mandatory
ReferenceAlias Property Alias_Ops_CFBodyguard02 Auto Const Mandatory
ReferenceAlias Property Alias_Ops_FollowerMoveToMarker Auto Const Mandatory
ReferenceAlias Property Alias_Ops_NaevaSurrenderWaitMarker Auto Const Mandatory
ReferenceAlias Property Alias_playerShip Auto Const Mandatory
ReferenceAlias Property Alias_Robotics_EventManager Auto Const Mandatory
ReferenceAlias Property Alias_Rokov_DisableMarker Auto Const Mandatory
ReferenceAlias Property Alias_Toft Auto Const Mandatory
ReferenceAlias Property Alias_Vigilance Auto Const Mandatory

Scene property LC088_000_Announcements Auto Const Mandatory
Scene Property LC088_100_BoardingAnnouncement Auto Const Mandatory
Scene Property LC088_200_Vigilance_BrigPrisonersCheer Auto Const Mandatory
Scene property LC088_300_Rokov_Start Auto Const Mandatory
Scene property LC088_380_Rokov_End Auto Const Mandatory
Scene property LC088_410_Mathis_Start Auto Const Mandatory
Scene property LC088_480_Mathis_End Auto Const Mandatory
Scene property LC088_480_RoboticsEndAnnouncement Auto Const Mandatory
Scene property LC088_511_Naeva_Start Auto Const Mandatory
Scene property LC088_530_Naeva_Breach_1 Auto Const Mandatory
Scene property LC088_550_Naeva_Breach_2 Auto Const Mandatory
Scene property LC088_570_Naeva_Breach_3 Auto Const Mandatory
Scene property LC088_580_EngineEndAnnouncement Auto Const Mandatory
Scene property LC088_581_Naeva_Clear Auto Const Mandatory
Scene property LC088_581_Naeva_End Auto Const Mandatory
Scene property LC088_610_Adler_Start Auto Const Mandatory
Scene property LC088_620_Adler_Greet Auto Const Mandatory
Scene property LC088_650_WeaponsAmbushDoorStuck Auto Const Mandatory
Scene property LC088_650_WeaponsAmbushStart Auto Const Mandatory
Scene property LC088_680_Adler_End Auto Const Mandatory
Scene property LC088_710_Huan_Start Auto Const Mandatory
Scene Property LC088_710_Huan_Start_InCombat Auto Const Mandatory
Scene property LC088_750_MessAmbushStart Auto Const Mandatory
Scene property LC088_780_Huan_End Auto Const Mandatory
Scene property LC088_810_Estelle_Start Auto Const Mandatory
Scene property LC088_880_Estelle_End Auto Const Mandatory
Scene property LC088_910_Flee_Start Auto Const Mandatory
Scene property LC088_921_Flee_Shuttle01 Auto Const Mandatory
Scene property LC088_922_Flee_Shuttle02 Auto Const Mandatory
Scene property LC088_923_Flee_Shuttle03 Auto Const Mandatory
Scene property LC088_924_Flee_Shuttle04 Auto Const Mandatory
Scene property LC088_1010_KibweConfrontation Auto Const Mandatory
Scene Property LC088_1019_SurrenderScene Auto Const Mandatory
Scene Property LC088_1020_ExecutionScene Auto Const Mandatory

ObjectReference Property LC082_CFMain_EnableMarker Auto Const Mandatory
ObjectReference Property LC088_EnableMarker Auto Const Mandatory
ObjectReference Property LC088_DisableMarker Auto Const Mandatory

ObjectReference Property LC082_Quickstart_DockingPort Auto Const Mandatory
ObjectReference Property LC088_Quickstart_Rokov Auto Const Mandatory
ObjectReference Property LC088_Quickstart_Mathis Auto Const Mandatory
ObjectReference Property LC088_Quickstart_Naeva Auto Const Mandatory
ObjectReference Property LC088_Quickstart_Adler Auto Const Mandatory
ObjectReference Property LC088_Quickstart_Estelle Auto Const Mandatory
ObjectReference Property LC088_Quickstart_Huan Auto Const Mandatory
ObjectReference Property LC088_Quickstart_Flee Auto Const Mandatory
ObjectReference Property LC088_Quickstart_Kibwe Auto Const Mandatory

LC082_BrigManagerRefScript Property LC082_BrigManagerRef Auto Const Mandatory
ObjectReference Property CF08_NaevaSurrenderEntryMarker Auto Const Mandatory
ObjectReference Property LC082_AbandonShipAlarmMarkerRef Auto Const Mandatory
ObjectReference Property LC082_BoardingAlarmMarkerRef Auto Const Mandatory

Faction Property CrimeFactionCrimsonFleet Auto Const Mandatory
Faction Property CrimeFactionNeon Auto Const Mandatory
Faction Property CrimeFactionUC Auto Const Mandatory
Faction Property CrimsonFleetFaction Auto Const Mandatory
Faction Property CydoniaFaction Auto Const Mandatory
Faction Property UCSysDefFaction Auto Const Mandatory

GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const Mandatory
LeveledItem Property LLI_CrimsonFleet_Heavy Auto Const Mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_01 Auto Const Mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_03 Auto Const Mandatory
Outfit Property Outfit_Clothes_CrimsonFleet_Captain_04 Auto Const Mandatory
Perk Property LC088_Vigilance_MathisInitialDebuffPerk Auto Const Mandatory

Scene Property LC088_1010_KibweConfrontationIntroCamera Auto Const Mandatory

LocationAlias Property Alias_LC088VigilanceLocation Auto Const Mandatory

WwiseEvent Property DRS_QST_CF08_ShipA_VerticalA_Open Auto Const Mandatory

ReferenceAlias Property Alias_Ops_Door_EntryDoor Auto Const Mandatory

WwiseEvent Property DRS_QST_CF08_GenIntRmSmWallMid_DoorD01_Open Auto Const Mandatory

Outfit Property Outfit_Clothes_CrimsonFleet_Captain_02 Auto Const Mandatory

ReferenceAlias Property Alias_CF08BattleAlarm Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_CF08_Shuttle_Disembark Auto Const Mandatory

WWiseEvent Property WwiseEvent_ShakeController_p25_p25_03 Auto Const Mandatory

ActorValue Property LC088_Vigilance_PlayAnnouncementValue Auto Const Mandatory

ReferenceAlias Property Alias_Ops_NaevaSurrenderStartMarker Auto Const Mandatory

ReferenceAlias Property Alias_Ops_CrowdWalla Auto Const Mandatory

Keyword Property LocTypeShowClothing Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ObjectReference Property LC088_Vigilance_MessHallNavcutRef Auto Const Mandatory

ObjectReference Property LC088_Vigilance_QTMarkerWeaponsRef Auto Const Mandatory
ObjectReference Property LC088_Vigilance_QTMarkerQuartersRef Auto Const Mandatory

ObjectReference Property LC088_Vigilance_EngineRoom01EndBreadcrumb Auto Const Mandatory
ObjectReference Property LC088_Vigilance_EngineRoom02EndBreadcrumb Auto Const Mandatory
ObjectReference Property LC088_Vigilance_EngineRoom03EndBreadcrumb Auto Const Mandatory
ObjectReference Property LC088_Vigilance_MessHallStartBreadcrumb Auto Const Mandatory
ObjectReference Property LC088_Vigilance_MessHallEndBreadcrumb Auto Const Mandatory

ReferenceAlias Property Alias_Patch_MessHallDoor Auto Const

ReferenceAlias Property Alias_Patch_QuartersDoor Auto Const
