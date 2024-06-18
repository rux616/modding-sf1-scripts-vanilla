;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC088_Space_0021E73C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 0: CF - Start

;Set the CF Quickstart Helper stage.
SetStage(11)

;Then move to the Key.
Alias_PlayerShip.GetShipRef().MoveTo(Alias_KeyMapMarker.GetRef().GetLinkedRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 1: CF - Alpha

;Set the CF Quickstart Helper stage.
SetStage(11)

;Set relevant prior stages.
SetStage(100)
SetStage(110)
CF08_Fleet.SetObjectiveCompleted(10)
CF08_Fleet.SetObjectiveCompleted(20)
CF08_Fleet.SetStage(110)

;Then move to Alpha.
SpaceshipReference playerShip = Alias_PlayerShip.GetShipRef()
ObjectReference markerHeading = Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef()
playerShip.MoveTo(markerHeading)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 2: CF - Beta

;Set the CF Quickstart Helper stage.
SetStage(11)

;Set relevant prior stages.
SetStage(100)
SetStage(110)
CF08_Fleet.SetObjectiveCompleted(10)
CF08_Fleet.SetObjectiveCompleted(20)
CF08_Fleet.SetStage(110)

;Then move to Beta.
SpaceshipReference playerShip = Alias_PlayerShip.GetShipRef()
ObjectReference markerHeading = Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef()
playerShip.MoveTo(markerHeading)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 3: CF - Gamma

;Set the CF Quickstart Helper stage.
SetStage(11)

;Set relevant prior stages.
SetStage(100)
SetStage(110)
CF08_Fleet.SetObjectiveCompleted(10)
CF08_Fleet.SetObjectiveCompleted(20)
CF08_Fleet.SetStage(110)

;Then move to Gamma.
SpaceshipReference playerShip = Alias_PlayerShip.GetShipRef()
ObjectReference markerHeading = Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef()
playerShip.MoveTo(markerHeading)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 4: CF - Main

;Set the CF Quickstart Helper stage.
SetStage(11)

;Set relevant prior stages.
SetStage(100)
SetStage(110)
SetStage(150)
CF08_Fleet.SetObjectiveCompleted(10)
CF08_Fleet.SetObjectiveCompleted(20)

;Then move to the main battle.
SpaceshipReference playerShip = Alias_PlayerShip.GetShipRef()
ObjectReference markerHeading = Alias_KeyMapMarker.GetRef().GetLinkedRef()
playerShip.MoveTo(markerHeading)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Quickstart 5: SD - Start

;Set the SD Quickstart Helper stage.
SetStage(12)

;Startup stage runs on quest start.

;Then move to the Vigilance.
Alias_PlayerShip.GetShipRef().MoveTo(Alias_VigilanceMapMarker.GetRef().GetLinkedRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Quickstart 6: SD - Alpha

;Set the SD Quickstart Helper stage.
SetStage(12)

;Set relevant prior stages.
SetStage(200)
SetStage(210)
CF08_SysDef.SetObjectiveCompleted(10)
CF08_SysDef.SetStage(110)

;Then move to Alpha.
Alias_PlayerShip.GetShipRef().MoveTo(Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Quickstart 7: SD - Beta

;Set the SD Quickstart Helper stage.
SetStage(12)

;Set relevant prior stages.
SetStage(200)
SetStage(210)
SetStage(220)
SetStage(229)
CF08_SysDef.SetObjectiveCompleted(10)
CF08_SysDef.SetStage(110)
CF08_SysDef.SetStage(120)

;Then move to Beta.
Alias_PlayerShip.GetShipRef().MoveTo(Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
;Quickstart 8: SD - Gamma

;Set the SD Quickstart Helper stage.
SetStage(12)

;Set relevant prior stages.
SetStage(200)
SetStage(210)
SetStage(220)
SetStage(229)
SetStage(230)
SetStage(239)
CF08_SysDef.SetObjectiveCompleted(10)
CF08_SysDef.SetStage(110)
CF08_SysDef.SetStage(120)
CF08_SysDef.SetStage(130)

;Then move to Gamma
Alias_PlayerShip.GetShipRef().MoveTo(Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 9: SD - Main

;Set the SD Quickstart Helper stage.
SetStage(12)

;Set relevant prior stages.
SetStage(200)
SetStage(210)
SetStage(220)
SetStage(229)
SetStage(230)
SetStage(239)
SetStage(240)
SetStage(249)
SetStage(250)
CF08_SysDef.SetObjectiveCompleted(10)
CF08_SysDef.SetStage(110)
CF08_SysDef.SetStage(120)
CF08_SysDef.SetStage(130)
CF08_SysDef.SetStage(140)

;Disable docking with the Key.
kMyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), False)

;Then move to the main battle.
Alias_PlayerShip.GetShipRef().MoveTo(Alias_KeyMapMarker.GetRef().GetLinkedRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: All CF Quickstarts

;Set up factions.
PlayerFaction.SetEnemy(UCSysDefFaction)
Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet)

;Load into space.
kMyQuest.DEBUG_GoToSpaceAndWait()

;CF Quest Debug Setup
CF08_Fleet.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: All SD Quickstarts

;Set up factions.
PlayerFaction.SetAlly(UCSysDefFaction)
Game.GetPlayer().RemoveFromFaction(CrimeFactionCrimsonFleet)

;Load into space.
kMyQuest.DEBUG_GoToSpaceAndWait()

;CF Quest Debug Setup
CF08_SysDef.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;CF Initial Briefing Quickstart

;Set up factions.
PlayerFaction.SetEnemy(UCSysDefFaction)
Game.GetPlayer().AddtoFaction(CrimeFactionCrimsonFleet)

;Spawn a ship for the player, and dock it with the Key.
kMyQuest.DEBUG_SpawnPlayerShip(True)
Alias_PlayerShip.GetShipRef().InstantDock(Alias_Key.GetShipRef())

;Set quickstart stages.
CF_Main.SetStage(1)
CF_Main.SetStage(10)
CF_Main.SetStage(20)
CF_Main.SetStage(300)
CF08_Fleet.SetStage(0)
CF08_Fleet.SetStage(10)
CF08_Fleet.SetStage(20)
CF08_Fleet.SetStage(30)
CF08_Fleet.SetStage(35)
CF08_Fleet.SetStage(40)
CF08_Fleet.SetStage(45)
CF08_Fleet.SetStage(50)
SetStage(100)

;Set up the Data Core Analyzer.
kMyQuest.EnableDataCoreAnalyzer()

;Move the player to the Key.
Game.GetPlayer().MoveTo(Alias_CF_BriefingQuickstartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;SD Initial Briefing Quickstart

;Set up factions.
PlayerFaction.SetAlly(UCSysDefFaction)
Game.GetPlayer().RemoveFromFaction(CrimeFactionCrimsonFleet)

;Spawn a ship for the player, and dock it with the Vigilance.
kMyQuest.DEBUG_SpawnPlayerShip(False)
Alias_PlayerShip.GetShipRef().InstantDock(Alias_Vigilance.GetShipRef())

;Disable the Skirmish.
Alias_CF_Enemies_Skirmish.DisableAll()
Alias_CF_Allies_Skirmish.DisableAll()
Alias_SD_Enemies_Skirmish.DisableAll()

;Set quickstart stages.
CF_Main.SetStage(1)
CF_Main.SetStage(10)
CF_Main.SetStage(20)
CF_Main.SetStage(200)
LC082.SetStage(210)
CF08_SysDef.SetStage(0)
CF08_SysDef.SetStage(10)
CF08_SysDef.SetStage(20)
CF08_SysDef.SetStage(30)
SetStage(200)

;Set up the Data Core Analyzer.
kMyQuest.EnableDataCoreAnalyzer()

;Move player to the Vigilance.
Game.GetPlayer().MoveTo(Alias_SD_BriefingQuickstartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Console

;Damage the Vigilance's engines so you can board it.
kMyQuest.DEBUG_DamageVigilance()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;CF SKIP - For LC088_Vigilance quickstarts.

;Wait for the quest script's startup to finish.
kMyQuest.WaitForQuestStartup()

;LC088_Space is still responsible for spawning a ship for the player,
;which LC088_Vigilance will Instant Dock.
kMyQuest.DEBUG_SpawnPlayerShip(True)

;Set quickstart stages.
CF_Main.SetStage(1)
CF_Main.SetStage(10)
CF_Main.SetStage(20)
CF_Main.SetStage(300)

;Enable and damage the Vigilance
kMyQuest.Main_EnableVigilance()
kMyQuest.DEBUG_DamageVigilance()

;Force the space battle into a plausible state.
Alias_CF_Allies_Skirmish.DisableAll()
Alias_CF_Allies_Main.EnableAll()
Alias_CF_Enemies_All.DisableAll()

;Set up the Data Core Analyzer.
kMyQuest.EnableDataCoreAnalyzer(True)
kMyQuest.InsertDataCore(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;SD SKIP - For LC088_Key quickstarts.

;Wait for the quest script's startup to finish.
kMyQuest.WaitForQuestStartup()

;LC088_Space is still responsible for spawning a ship for the player,
;which LC088_Key will Instant Dock.
kMyQuest.DEBUG_SpawnPlayerShip(False)

;Force the space battle into a plausible state.
Alias_CF_Allies_Skirmish.DisableAll()
Alias_CF_Enemies_Skirmish.DisableAll()
Alias_SD_Allies_Main.EnableAll()
Alias_SD_Enemies_All.DisableAll()
LC088_KeyTurretsEnableMarkerRef.Disable()
kMyQuest.DisableAllCaptainShips()

;Set quickstart stages.
CF_Main.SetStage(1)
CF_Main.SetStage(10)
CF_Main.SetStage(20)
CF_Main.SetStage(200)
LC082.SetStage(210)

;Enable the Vigilance
kMyQuest.Main_EnableVigilance()

;Enable docking with the Key.
kMyQuest.SD_SwitchKeyToSDDocking()
kMyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True)

;Set up the Data Core Analyzer.
kMyQuest.EnableDataCoreAnalyzer(False)
kMyQuest.InsertDataCore(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Startup stage.
;Most initial setup handled by the quest script.

;Move the arrival points for the Key, so the player arrives
;at a safe point at some distance from the battle
Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyDistantArrivalMarker.GetRef())
Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyDistantArrivalMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location to the Key.
;The player jumps to the Key and commits to the CF path.

;Adjust faction relationships.
CF_Main.SetStage(300)

;Disable the Vigilance, and its escorts, skirmishers, and map marker.
;SD Kickout process now disables most of that.
Alias_SD_Enemies_Skirmish.DisableAll()

;Ignore allied friendly hits going forward.
kMyQuest.IgnoreAlliedFriendlyHits()

;Start CF08/End CF07
CF07.SetStage(1500)
CF08_Fleet.SetStage(10)

;Set up the Data Core Analyzer on the Key.
kMyQuest.EnableDataCoreAnalyzer()

;In case of prior quickstarts,
;make sure the doors on the Key are unlocked.
CFKey.SetStage(200)

;Set up the Vigilance for the CF Main battle.
Alias_Vigilance.GetShipRef().SetNoBleedoutRecovery(True)

;Set up the Captains' ships.
kMyQuest.SetupAllCaptainEvents()

;Set up the Key's Turrets.
kMyQuest.SetupKeyTurrets()

;Start the Skirmish start scene.
Utility.Wait(2)
kMyQuest.PlaySpaceScene(LC088_Space_CF_100_SkirmishStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_CF_100_SkirmishStart, scene end.

;Unblock incidental dialogue.
kMyQuest.UnblockIncidentalDialogue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, CF Enemies for Skirmish.

;Start the Skirmish Complete scene.
kMyQuest.PlaySpaceScene(LC088_Space_CF_105_SkirmishComplete)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0106_Item_00
Function Fragment_Stage_0106_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_CF_105_SkirmishComplete, scene end.

;Enable docking with the Key.
kMyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True)

;Update CF08's objectives.
CF08_Fleet.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: CF08, Briefing Event Completed

;Set up the Defensive Batteries.
kMyQuest.SetupDefensiveBatteries()

;Enable the CF Enemies and Allies at each Defensive Battery.
Alias_CF_Allies_Skirmish.DisableAll()
Alias_CF_Enemies_Skirmish.DisableAll()
Alias_CF_Enemies_Alpha.EnableAll()
Alias_CF_Enemies_Beta.EnableAll()
Alias_CF_Enemies_Gamma.EnableAll()

;Enable CF Allies in the Main Battle area, in front of the Key.
;Don't enable the enemies here yet.
Alias_CF_Allies_Main.EnableAll()

;Disable the Captains who appear as allies at the Batteries.
Alias_CF_Captain_EstelleShip.TryToDisable()
Alias_CF_Captain_MathisShip.TryToDisable()
Alias_CF_Captain_HuanShip.TryToDisable()

;Enable the Mines at Alpha.
Alias_CF_Mines_Alpha_EnableMarker.TryToEnable()

;Register the quest script for menu events, to catch the player
;loading into the Defensive Batteries, to control scene timing.
kMyQuest.RegisterForLoadScreenEvent()

;Enable the map markers for the Defensive Batteries.
Alias_DefensiveBatteryAlphaMapMarker.TryToEnable()
Alias_DefensiveBatteryBetaMapMarker.TryToEnable()
Alias_DefensiveBatteryGammaMapMarker.TryToEnable()

;Start LC088_Vigilance, which we'll need eventually.
SetStageNoWait(111)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0111_Item_00
Function Fragment_Stage_0111_Item_00()
;BEGIN CODE
;Set by: Stage 110

;Start LC088_Vigilance now, so it has time to finish setting up.
LC088_Vigilance.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location to Alpha.

;Alpha: Start the AlphaStart or AllyStart scenes, as appropriate.
Utility.Wait(2)
if (GetStageDone(14))
     kMyQuest.CF_EnableAllyReinforcementsBattery(Alias_CF_Allies_Alpha, Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef())
     kMyQuest.PlaySpaceScene(LC088_Space_CF_122_AllyStart)
Else
     kMyQuest.PlaySpaceScene(LC088_Space_CF_120_AlphaStart)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0121_Item_00
Function Fragment_Stage_0121_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_CF_120_AlphaStart, scene end.

;Unblock incidental dialogue.
kMyQuest.UnblockIncidentalDialogue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0128_Item_00
Function Fragment_Stage_0128_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, CF Enemies for Alpha.

;Begin restoring Battery Alpha.
kMyQuest.CF_RestoreDefensiveBattery(Alias_DefensiveBatteryAlpha.GetShipRef())

;If all Batteries complete, advance.
if (GetStageDone(128) && GetStageDone(138) && GetStageDone(148))
     SetStage(150)
Else
     ;Play the Alpha Complete scene.
     kMyQuest.PlaySpaceScene(LC088_Space_CF_128_AlphaComplete)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0129_Item_00
Function Fragment_Stage_0129_Item_00()
;BEGIN CODE
;Set by: LC088_Space_CF_128_AlphaComplete, scene end.

;Update CF08's objectives.
CF08_Fleet.SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location to Beta.

;Beta: Always play the BetaStart scene.
Utility.Wait(2)
kMyQuest.PlaySpaceScene(LC088_Space_CF_130_BetaStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0131_Item_00
Function Fragment_Stage_0131_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_CF_130_BetaStart, scene end.

;Beta: After BetaStart finishes, Estelle arrives, if appropriate.
if (GetStageDone(18))
     SetStage(132)
Else
     ;Unblock incidental dialogue.
     kMyQuest.UnblockIncidentalDialogue(2)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_00
Function Fragment_Stage_0132_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 131.

;Beta: If Estelle is active, she and another ship jump in.
;as soon as Jasmine's briefing has ended.
kMyQuest.CF_EnableAllyReinforcementsBattery(Alias_CF_Allies_Beta, Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef())
kMyQuest.PlaySpaceScene(LC088_Space_CF_132_AllyStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0133_Item_00
Function Fragment_Stage_0133_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_CF_132_AllyStart, scene end.

;Unblock incidental dialogue.
kMyQuest.UnblockIncidentalDialogue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0138_Item_00
Function Fragment_Stage_0138_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, CF Enemies for Beta.

;Begin restoring Battery Beta.
kMyQuest.CF_RestoreDefensiveBattery(Alias_DefensiveBatteryBeta.GetShipRef())

;If all Batteries complete, advance.
if (GetStageDone(128) && GetStageDone(138) && GetStageDone(148))
     SetStage(150)
Else
     ;Play the Beta Complete scene.
     kMyQuest.PlaySpaceScene(LC088_Space_CF_138_BetaComplete)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0139_Item_00
Function Fragment_Stage_0139_Item_00()
;BEGIN CODE
;Set by: LC088_Space_CF_138_BetaComplete, scene end.

;Update CF08's objectives.
CF08_Fleet.SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location to Gamma.

;Set up the GammaShipsAll RefCollection.
kMyQuest.SetUpGammaShipsAll()

;Gamma: Start the GammaStart or AllyStart scenes, as appropriate.
Utility.Wait(2)
if (GetStageDone(17))
     kMyQuest.CF_EnableAllyReinforcementsBattery(Alias_CF_Allies_Gamma, Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef())
     kMyQuest.PlaySpaceScene(LC088_Space_CF_142_AllyStart)
Else
     kMyQuest.PlaySpaceScene(LC088_Space_CF_140_GammaStart)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0141_Item_00
Function Fragment_Stage_0141_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_CF_140_GammaStart or 142_AllyStart scene end.

;Unblock incidental dialogue.
kMyQuest.UnblockIncidentalDialogue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0148_Item_00
Function Fragment_Stage_0148_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, CF Enemies for Gamma.

;Begin restoring Battery Gamma.
kMyQuest.CF_RestoreDefensiveBattery(Alias_DefensiveBatteryGamma.GetShipRef())

;If all Batteries complete, advance.
if (GetStageDone(128) && GetStageDone(138) && GetStageDone(148))
     SetStage(150)
Else
     ;Play the Gamma Complete scene.
     kMyQuest.PlaySpaceScene(LC088_Space_CF_148_GammaComplete)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0149_Item_00
Function Fragment_Stage_0149_Item_00()
;BEGIN CODE
;Set by: LC088_Space_CF_148_GammaComplete, scene end.

;Update CF08's objectives.
CF08_Fleet.SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 128/138/148, when all batteries completed.

;Block docking with the Key until the end of the battle.
kMyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), False)

;Move the arrival point for the Key, so the player arrives
;behind the CF line, instead of in the middle of the SysDef line.
Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyBehindCFLinesMarker.GetRef())
Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyBehindCFLinesMarker.GetRef())

;Form up the CF battle line.
kMyQuest.Main_FormCFBattleLine()

;Start the Ready for Main scene.
Alias_CF_MainBattleAnnouncementMarker.GetRef().MoveTo(Alias_PlayerShip.GetRef())
kMyQuest.PlaySpaceScene(LC088_Space_CF_150_ReadyForMainBattle)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0151_Item_00
Function Fragment_Stage_0151_Item_00()
;BEGIN CODE
;Set by: LC088_Space_CF_150_ReadyForMainBattle, scene end.

;Update CF08's objectives.
CF08_Fleet.SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location to Main following stage 150.

;DEBUG: If desired, skip the dialogue scene.
if (GetStageDone(33))
     SetStage(162)
     SetStage(161)
     Return
EndIf

;Start the Main Start scene.
kMyQuest.PlaySpaceScene(LC088_Space_CF_160_MainBattleStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0161_Item_00
Function Fragment_Stage_0161_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_CF_160_MainBattleStart, scene end.

;Update CF08's objectives.
CF08_Fleet.SetStage(220)

;Play the Vigilance Invulnerable scene when appropriate.
kMyQuest.CF_Main_ReadyForVigilanceInvulnerableScene()

;Add the music override.
kMyQuest.Main_SetMusicOverrideActive(True)

;Release the player's controls.
kMyQuest.Main_SetPlayerControlsEnabled(True)

;EVP all ships involved in the main battle.
kMyQuest.Main_EVPAllNoWait()

;Unblock incidental dialogue.
kMyQuest.UnblockIncidentalDialogue(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0162_Item_00
Function Fragment_Stage_0162_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_CF_160_MainBattleStart, during scene.

;Enable the SysDef Fleet, including the Vigilance.
kMyQuest.Main_EnableSDFleet(Alias_CF_Enemies_Main)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0163_Item_00
Function Fragment_Stage_0163_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, CF_Main_ReadyForVigilanceInvulnerableScene

;Start the Vigilance Invulnerable scene.
kMyQuest.PlaySpaceScene(LC088_Space_CF_163_VigilanceInvulnerable)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0164_Item_00
Function Fragment_Stage_0164_Item_00()
;BEGIN CODE
;Set by: LC088_Space_CF_163_VigilanceInvulnerable, scene end.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, CF_CheckForReinforcements

;Start the reinforcements scene.
kMyQuest.PlaySpaceScene(LC088_Space_CF_165_Reinforcements1)

;Trigger the reinforcements.
kMyQuest.Main_TriggerReinforcements(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0169_Item_00
Function Fragment_Stage_0169_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, CF_CheckForReinforcements

;Trigger allied reinforcements.
kMyQuest.Main_TriggerReinforcements(2)

;And start the reinforcements scene.
kMyQuest.PlaySpaceScene(LC088_Space_CF_169_AllyStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, CF_CheckForReinforcements

;Start the reinforcements scene.
kMyQuest.PlaySpaceScene(LC088_Space_CF_170_Reinforcements2)

;Trigger the reinforcements.
kMyQuest.Main_TriggerReinforcements(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0173_Item_00
Function Fragment_Stage_0173_Item_00()
;BEGIN CODE
;Set by: --Disabled--

;Have CF08_Fleet display QTs to the remaining ships.
CF08_Fleet.SetStage(225)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, CF_CheckForReinforcements

;Start the Vigilance Escorts Defeated scene.
kMyQuest.PlaySpaceScene(LC088_Space_CF_175_VigilanceEscortsDefeated)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0178_Item_00
Function Fragment_Stage_0178_Item_00()
;BEGIN CODE
;Set by: LC088_Space_CF_175_VigilanceEscortsDefeated, scene end.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0179_Item_00
Function Fragment_Stage_0179_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_CF_175_VigilanceEscortsDefeated, during scene.

;Fire the Defensive Batteries at the Vigilance.
kMyQuest.CF_Main_FireBatteriesAtVigilance()

;Update CF08's objectives.
CF08_Fleet.SetStage(230)

;Remove the Vigilance's damage immunity.
kMyQuest.CF_Main_RemoveVigilanceInvulnerability()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, Vigilance.

;Start the Vigilance Defeated scene.
kMyQuest.PlaySpaceScene(LC088_Space_CF_180_VigilanceDefeated)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0181_Item_00
Function Fragment_Stage_0181_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_CF_190_BoardVigilance, scene end.

;Enable docking with the Vigilance.
kMyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True)

;Push the CF Captains to dock with the Vigilance.
kMyQuest.CF_Main_StartDockingWithVigilance()

;Update CF08's objectives.
CF08_Fleet.SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, OnShipDock.

;Start the Vigilance Boarding scene.
kMyQuest.PlaySpaceScene(LC088_Space_CF_190_BoardVigilance)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0191_Item_00
Function Fragment_Stage_0191_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_CF_190_BoardVigilance, scene end.

;Update CF08's objectives.
CF08_Fleet.SetStage(310)

;Remove the music override.
kMyQuest.Main_SetMusicOverrideActive(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0193_Item_00
Function Fragment_Stage_0193_Item_00()
;BEGIN CODE
;Set by: LC088_Vigilance, stage 1100.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, OnShipUndock after completing Vigilance.

;Enable docking with the Key again.
kMyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0199_Item_00
Function Fragment_Stage_0199_Item_00()
;BEGIN CODE
;Set by: Stop Stage

;Disable the Defensive Batteries' Map Markers.
Alias_DefensiveBatteryAlphaMapMarker.TryToDisable()
Alias_DefensiveBatteryBetaMapMarker.TryToDisable()
Alias_DefensiveBatteryGammaMapMarker.TryToDisable()

;Move the arrival point for the Key back to its usual position.
Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyOriginMarker.GetRef())
Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyOriginMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location to the Vigilance.
;The player jumps to the Vigilance and commits to the SD path.

;Block travel to the Key, and to the Suvorov Surface & Orbit Locations.
Alias_KeyMapMarker.TryToDisable()
Alias_SuvorovSurfaceLocation.GetLocation().EnableSpaceTravel(Self, False)
Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self, False)

;Adjust faction relationships.
CF_Main.SetStage(200)

;Prevent player kickout from SysDef.
LC082.SetStage(210)

;Set up the ally group. This has to be done here to ensure
;Toft and Archangel's ships are set to Ignore Friendly Hits.
kMyQuest.SD_SetupAllyGroup()

;Ignore allied friendly hits going forward.
kMyQuest.IgnoreAlliedFriendlyHits()
Alias_Vigilance.GetShipRef().IgnoreFriendlyHits(True)

;Start CF08/End CF07
CF07.SetStage(1000)
CF08_SysDef.SetStage(10)

;Set up the Data Core Analyzer on the Vigilance.
kMyQuest.EnableDataCoreAnalyzer()

;Disable the CF Skirmish.
Alias_CF_Enemies_Skirmish.DisableAll()
Alias_CF_Allies_Skirmish.DisableAll()

;Set up the Captains' ships.
kMyQuest.SetupAllCaptainEvents()

;Set up the Key's Turrets.
kMyQuest.SetupKeyTurrets()

;Start the Skirmish start scene.
Utility.Wait(2)
kMyQuest.PlaySpaceScene(LC088_Space_SD_200_SkirmishStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_200_SkirmishStart, scene end.

;Unblock incidental dialogue.
kMyQuest.UnblockIncidentalDialogue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, SD Enemies for Skirmish.

;Start the Skirmish Complete scene.
kMyQuest.PlaySpaceScene(LC088_Space_SD_205_SkirmishComplete)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0206_Item_00
Function Fragment_Stage_0206_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_205_SkirmishComplete, scene end.

;Enable docking with the Vigilance.
kMyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True)

;Update CF08's objectives.
CF08_SysDef.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: CF08, Briefing Event Completed

;Set up the Defensive Batteries.
kMyQuest.SetupDefensiveBatteries()

;Enable the SD Enemies at each Defensive Battery, and the Key.
Alias_SD_Enemies_Alpha.EnableAll()
Alias_SD_Enemies_Beta.EnableAll()
Alias_SD_Enemies_Gamma.EnableAll()
Alias_SD_Enemies_Main.EnableAll()
Alias_SD_Enemies_Main_Reinforcements_1.EnableAll()
Alias_SD_Enemies_Main_Reinforcements_2.EnableAll()

;Set up the Main Battle Line
kMyQuest.Main_FormCFBattleLine()

;Set up the Main Battle reinforcements.
kMyQuest.SD_SetupMainEnemyReinforcements()

;Calculate the enemy thresholds for the main battle.
kMyQuest.SD_CalculateMainBattleCounts()

;Enable the additional ships at Beta and Gamma, if appropriate.
Actor player = Game.GetPlayer()
if (player.GetValue(CFSD01EvidenceTotal) >= LC088_Space_CFSD01EvidenceCountForSquadBeta.GetValue())
     SetStage(21)
     Alias_SD_Allies_Beta.EnableAll()
EndIf
if (player.GetValue(CFSD01EvidenceTotal) >= LC088_Space_CFSD01EvidenceCountForSquadGamma.GetValue())
     SetStage(22)
     Alias_SD_Allies_Gamma.EnableAll()
EndIf

;Enable the Mines at Alpha.
Alias_SD_Mines_Alpha_EnableMarker.TryToEnable()

;Register the quest script for menu events, to catch the player
;loading into the Defensive Batteries, to control scene timing.
kMyQuest.RegisterForLoadScreenEvent()

;Enable the map marker for Battery Alpha only.
Alias_DefensiveBatteryAlphaMapMarker.TryToEnable()

;Move the arrival marker for Suvorov to Battery Alpha temporarily,
;and unblock travel to the orbit location.
Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_DefensiveBatteryAlphaMapMarker.GetRef().GetLinkedRef())
Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self, True)

;Start LC088_Key, which we'll need eventually.
SetStageNoWait(211)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0211_Item_00
Function Fragment_Stage_0211_Item_00()
;BEGIN CODE
;Set by: Stage 210

;Start LC088_Key.
LC088_Key.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location to Alpha.

;Disable the Vigilance, and its escorts, skirmishers, and map marker.
LC082.UpdateVigilanceLocation("Shutdown")

;Disable docking with the Vigilance for the rest of the quest.
kMyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), False)

if (!GetStageDone(7) && !GetStageDone(8) && !GetStageDone(9))
     ;Delay briefly.
     Utility.Wait(2)

     ;SD Allied ships jump in.
     kMyQuest.SD_UpdateAndMoveAllyGroup(1)

     ;Start the Alpha Start scene.
     kMyQuest.PlaySpaceScene(LC088_Space_SD_220_AlphaStart)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0221_Item_00
Function Fragment_Stage_0221_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_220_AlphaStart, scene end.

;Unblock incidental dialogue.
kMyQuest.UnblockIncidentalDialogue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0226_Item_00
Function Fragment_Stage_0226_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, SD Enemies for Alpha.

;If Enemies and Battery both defeated, proceed.
if (GetStageDone(226) && GetStageDone(227))
     SetStage(228)
Else
     kMyQuest.SD_PlayBatteryPhaseCompleteScene(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0227_Item_00
Function Fragment_Stage_0227_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, Battery Alpha.

;If Enemies and Battery both defeated, proceed.
if (GetStageDone(226) && GetStageDone(227))
     SetStage(228)
Else
     kMyQuest.SD_PlayBatteryDestroyedScene(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0228_Item_00
Function Fragment_Stage_0228_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 226 & 227

;Start the Alpha Complete scene.
kMyQuest.PlaySpaceScene(LC088_Space_SD_228_AlphaComplete)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0229_Item_00
Function Fragment_Stage_0229_Item_00()
;BEGIN CODE
;Set by: LC088_Space_SD_228_AlphaComplete, scene end.

;Enable the map marker for Battery Beta.
Alias_DefensiveBatteryBetaMapMarker.TryToEnable()

;Move the arrival marker for Suvorov to Battery Beta temporarily,
;and unblock travel to the orbit location.
Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_DefensiveBatteryBetaMapMarker.GetRef().GetLinkedRef())
Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self, True)

;Update CF08's objectives.
CF08_SysDef.SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location to Beta.

if (!GetStageDone(8) && !GetStageDone(9))
     ;Delay briefly.
     Utility.Wait(2)

     ;SD Allied ships jump in.
     kMyQuest.SD_UpdateAndMoveAllyGroup(2)

     ;Start the Beta Start scene.
     kMyQuest.PlaySpaceScene(LC088_Space_SD_230_BetaStart)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0231_Item_00
Function Fragment_Stage_0231_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_230_BetaStart, scene end.

;Unblock incidental dialogue.
kMyQuest.UnblockIncidentalDialogue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0236_Item_00
Function Fragment_Stage_0236_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, SD Enemies for Beta.

;If Enemies and Battery both defeated, proceed.
if (GetStageDone(236) && GetStageDone(237))
     SetStage(238)
Else
     kMyQuest.SD_PlayBatteryPhaseCompleteScene(2)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0237_Item_00
Function Fragment_Stage_0237_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, Battery Beta.

;If Enemies and Battery both defeated, proceed.
if (GetStageDone(236) && GetStageDone(237))
     SetStage(238)
Else
     kMyQuest.SD_PlayBatteryDestroyedScene(2)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0238_Item_00
Function Fragment_Stage_0238_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 236 & 237

;Start the Beta Complete scene.
kMyQuest.PlaySpaceScene(LC088_Space_SD_238_BetaComplete)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0239_Item_00
Function Fragment_Stage_0239_Item_00()
;BEGIN CODE
;Set by: LC088_Space_SD_238_BetaComplete, scene end.

;Enable the map marker for Battery Gamma.
Alias_DefensiveBatteryGammaMapMarker.TryToEnable()

;Move the arrival marker for Suvorov to Battery Gamma temporarily,
;and unblock travel to the orbit location.
Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_DefensiveBatteryGammaMapMarker.GetRef().GetLinkedRef())
Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self, True)

;Update CF08's objectives.
CF08_SysDef.SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location to Gamma.

if (!GetStageDone(9))
     ;Delay briefly.
     Utility.Wait(2)

     ;SD Allied ships jump in.
     kMyQuest.SD_UpdateAndMoveAllyGroup(3)

     ;Set up the GammaShipsAll RefCollection.
     kMyQuest.SetUpGammaShipsAll()

     ;Start the Gamma Start scene.
     kMyQuest.PlaySpaceScene(LC088_Space_SD_240_GammaStart)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0241_Item_00
Function Fragment_Stage_0241_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_240_GammaStart, scene end.

;Unblock incidental dialogue.
kMyQuest.UnblockIncidentalDialogue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0246_Item_00
Function Fragment_Stage_0246_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, SD Enemies for Gamma.

;If Enemies and Battery both defeated, proceed.
if (GetStageDone(246) && GetStageDone(247))
     SetStage(248)
Else
     kMyQuest.SD_PlayBatteryPhaseCompleteScene(3)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0247_Item_00
Function Fragment_Stage_0247_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, Battery Gamma.

;If Enemies and Battery both defeated, proceed.
if (GetStageDone(246) && GetStageDone(247))
     SetStage(248)
Else
     kMyQuest.SD_PlayBatteryDestroyedScene(3)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0248_Item_00
Function Fragment_Stage_0248_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 246 & 247

;EVP all ships involved in the main battle.
kMyQuest.Main_EVPAllNoWait()

;Start the Gamma Complete scene.
kMyQuest.PlaySpaceScene(LC088_Space_SD_248_GammaComplete)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0249_Item_00
Function Fragment_Stage_0249_Item_00()
;BEGIN CODE
;Set by: LC088_Space_SD_248_GammaComplete, scene end.

;Allow the player to jump to the Key. Release the block on Suvorov
;and its orbit location, now that it's no longer needed. Move arrival point.
Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeySDArrivalMarker.GetRef())
Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeySDArrivalMarker.GetRef())
Alias_KeyMapMarker.TryToEnable()
Alias_SuvorovSurfaceLocation.GetLocation().EnableSpaceTravel(Self, True)
Alias_SuvorovOrbitLocation.GetLocation().EnableSpaceTravel(Self, True)

;Update CF08's objectives.
CF08_SysDef.SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, Change Location to Main following stage 249.

;SD Allied ships jump in.
kMyQuest.SD_UpdateAndMoveAllyGroup(4)

;DEBUG: If desired, skip the dialogue scene.
if (GetStageDone(33))
     SetStage(261)
     Return
EndIf

;Start the Main Start scene.
kMyQuest.PlaySpaceScene(LC088_Space_SD_260_MainBattleStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0261_Item_00
Function Fragment_Stage_0261_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_260_MainBattleStart, scene end.

;Update CF08's objectives.
CF08_SysDef.SetStage(220)

;Add the music override.
kMyQuest.Main_SetMusicOverrideActive(True)

;Release the player's controls.
kMyQuest.Main_SetPlayerControlsEnabled(True)

;EVP all ships involved in the main battle.
kMyQuest.Main_EVPAllNoWait()

;Unblock incidental dialogue.
kMyQuest.UnblockIncidentalDialogue(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0265_Item_00
Function Fragment_Stage_0265_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, CF_CheckForReinforcements

;Start the Vigilance Arrives 1 scene.
kMyQuest.PlaySpaceScene(LC088_Space_SD_265_VigilanceArrives01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0266_Item_00
Function Fragment_Stage_0266_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_265_VigilanceArrives01

;Enable the SysDef fleet and the Vigilance.
kMyQuest.Main_EnableSDFleet(Alias_SD_Allies_Main_SysDefFleet)

;Freeze combat.
kMyQuest.Main_EVPAllNoWait(True)

;Then start the Vigilance Arrives 2 scene.
kMyQuest.PlaySpaceScene(LC088_Space_SD_266_VigilanceArrives02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0267_Item_00
Function Fragment_Stage_0267_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_266_VigilanceArrives02

;Then start the Vigilance Arrives 3 scene.
kMyQuest.PlaySpaceScene(LC088_Space_SD_267_VigilanceArrives03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0268_Item_00
Function Fragment_Stage_0268_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_267_VigilanceArrives03

;Unfreeze combat.
kMyQuest.Main_EVPAllNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0269_Item_00
Function Fragment_Stage_0269_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_267_VigilanceArrives03

;Make sure combat restarted.
SetStage(268)

;If all enemy ships have already been defeated, proceed.
if (GetStageDone(270))
     ;Start the CF Defenders Defeated scene.
     kMyQuest.PlaySpaceScene(LC088_Space_SD_280_CFDefendersDefeated)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Default Alias script, SD Enemies for Main.

;Make sure the Vigilance has arrived first.
if (GetStageDone(265))
     ;Start the CF Defenders Defeated scene.
     kMyQuest.PlaySpaceScene(LC088_Space_SD_280_CFDefendersDefeated)
Else
     SetStage(265)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0271_Item_00
Function Fragment_Stage_0271_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_270_CFDefendersDefeated, scene end.

;Enable docking with the Key.
kMyQuest.SD_SwitchKeyToSDDocking()
kMyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True)

;Update CF08's objectives.
CF08_SysDef.SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, OnShipDock.

;Start the Key Boarding scene.
kMyQuest.PlaySpaceScene(LC088_Space_SD_290_BoardKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0291_Item_00
Function Fragment_Stage_0291_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Space_SD_290_BoardKey, scene end.

;Update CF08's objectives.
CF08_SysDef.SetStage(310)

;Remove the music override.
kMyQuest.Main_SetMusicOverrideActive(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0293_Item_00
Function Fragment_Stage_0293_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: LC088_Key, stage 1100.

;Disable Toft & Archangel's ships.
kMyQuest.SD_DisableAllyLeaderShips()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0295_Item_00
Function Fragment_Stage_0295_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, OnShipUndock after completing Key.

;Enable docking with the Vigilance again.
kMyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True)

;And stop combat on the player's ship for quickstarts.
Alias_PlayerShip.TryToStopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0299_Item_00
Function Fragment_Stage_0299_Item_00()
;BEGIN CODE
;Set by: Stop Stage

;Disable the Defensive Batteries' Map Markers.
Alias_DefensiveBatteryAlphaMapMarker.TryToDisable()
Alias_DefensiveBatteryBetaMapMarker.TryToDisable()
Alias_DefensiveBatteryGammaMapMarker.TryToDisable()

;Move the arrival point for the Key back to its usual position.
Alias_KeyMapMarkerHeading.TryToMoveTo(Alias_KeyOriginMarker.GetRef())
Alias_KeyPlanetArrivalMarker.TryToMoveTo(Alias_KeyOriginMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
Quest __temp = self as Quest
lc088_spacequestscript kmyQuest = __temp as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stop Stage

;Common Cleanup
;Disable all ships.
Alias_CF_Enemies_All.DisableAll()
Alias_CF_Allies_All.DisableAll()
Alias_SD_Enemies_All.DisableAll()
Alias_SD_Allies_All.DisableAll()

;Re-enable docking with both the Key and the Vigilance.
kMyQuest.SetDockingEnabled(Alias_Key.GetShipRef(), True)
kMyQuest.SetDockingEnabled(Alias_Vigilance.GetShipRef(), True)

;Do cleanup specific to the chosen path.
if (GetStageDone(100))
     SetStage(199)
ElseIf (GetStageDone(200))
     SetStage(299)
EndIf

;Clean up the quest script.
kMyQuest.Cleanup()

;And stop.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias property Alias_Key Auto Const Mandatory
LocationAlias property KeyLocation Auto Const Mandatory
LocationAlias property KeySpaceCellLocation Auto Const Mandatory
LocationAlias property DBAlphaSpaceCellLocation Auto Const Mandatory
LocationAlias property DBBetaSpaceCellLocation Auto Const Mandatory
LocationAlias property DBGammaSpaceCellLocation Auto Const Mandatory
ReferenceAlias property Alias_Vigilance Auto Const Mandatory
LocationAlias property VigilanceSpaceCellLocation Auto Const Mandatory
LocationAlias Property Alias_SuvorovSurfaceLocation Auto Const Mandatory
LocationAlias Property Alias_SuvorovOrbitLocation Auto Const Mandatory
ReferenceAlias property Alias_Player Auto Const Mandatory
ReferenceAlias property Alias_playerShip Auto Const Mandatory
ReferenceAlias property Alias_CF_Captain_RokovShip Auto Const Mandatory
ReferenceAlias property Alias_CF_Captain_MathisShip Auto Const Mandatory
ReferenceAlias property Alias_CF_Captain_NaevaShip Auto Const Mandatory
ReferenceAlias property Alias_CF_Captain_AdlerShip Auto Const Mandatory
ReferenceAlias property Alias_CF_Captain_HuanShip Auto Const Mandatory
ReferenceAlias property Alias_CF_Captain_EstelleShip Auto Const Mandatory
ReferenceAlias property Alias_DefensiveBatteryAlpha Auto Const Mandatory
ReferenceAlias property Alias_DefensiveBatteryBeta Auto Const Mandatory
ReferenceAlias property Alias_DefensiveBatteryGamma Auto Const Mandatory
ReferenceAlias property Alias_KeyMapMarker Auto Const Mandatory
ReferenceAlias property Alias_DefensiveBatteryAlphaMapMarker Auto Const Mandatory
ReferenceAlias property Alias_DefensiveBatteryBetaMapMarker Auto Const Mandatory
ReferenceAlias property Alias_DefensiveBatteryGammaMapMarker Auto Const Mandatory
ReferenceAlias property Alias_VigilanceMapMarker Auto Const Mandatory
ReferenceAlias property Alias_DefensiveBatteryAlphaProjectileSourceMarker Auto Const Mandatory
ReferenceAlias property Alias_DefensiveBatteryBetaProjectileSourceMarker Auto Const Mandatory
ReferenceAlias property Alias_DefensiveBatteryGammaProjectileSourceMarker Auto Const Mandatory
ReferenceAlias property Alias_VigilanceArrivalMarker Auto Const Mandatory
ReferenceAlias property Alias_KeyMapMarkerHeading Auto Const Mandatory
ReferenceAlias property Alias_KeyPlanetArrivalMarker Auto Const Mandatory
ReferenceAlias property Alias_KeyOriginMarker Auto Const Mandatory
ReferenceAlias property Alias_KeyBehindCFLinesMarker Auto Const Mandatory
ReferenceAlias property Alias_KeySDArrivalMarker Auto Const Mandatory
ReferenceAlias property Alias_CF_Mines_Alpha_EnableMarker Auto Const Mandatory
ReferenceAlias property Alias_SD_Mines_Alpha_EnableMarker Auto Const Mandatory
ReferenceAlias Property Alias_KeyTurretsEnableMarker Auto Const Mandatory
ReferenceAlias Property Alias_CF_MainBattleAnnouncementMarker Auto Const Mandatory
ReferenceAlias Property Alias_KeyDistantArrivalMarker Auto Const Mandatory
ReferenceAlias Property Alias_SD_BriefingQuickstartMarker Auto Const Mandatory
ReferenceAlias Property Alias_CF_BriefingQuickstartMarker Auto Const Mandatory
RefCollectionAlias property Alias_CF_Allies_All Auto Const Mandatory
RefCollectionAlias property Alias_CF_Allies_Skirmish Auto Const Mandatory
RefCollectionAlias property Alias_CF_Allies_Alpha Auto Const Mandatory
RefCollectionAlias property Alias_CF_Allies_Beta Auto Const Mandatory
RefCollectionAlias property Alias_CF_Allies_Gamma Auto Const Mandatory
RefCollectionAlias property Alias_CF_Allies_Main Auto Const Mandatory
RefCollectionAlias property Alias_CF_Enemies_All Auto Const Mandatory
RefCollectionAlias property Alias_CF_Enemies_Skirmish Auto Const Mandatory
RefCollectionAlias property Alias_CF_Enemies_Alpha Auto Const Mandatory
RefCollectionAlias property Alias_CF_Enemies_Beta Auto Const Mandatory
RefCollectionAlias property Alias_CF_Enemies_Gamma Auto Const Mandatory
RefCollectionAlias property Alias_CF_Enemies_Main Auto Const Mandatory
RefCollectionAlias property Alias_SD_Allies_All Auto Const Mandatory
RefCollectionAlias property Alias_SD_Allies_Skirmish Auto Const Mandatory
RefCollectionAlias property Alias_SD_Allies_Alpha Auto Const Mandatory
RefCollectionAlias property Alias_SD_Allies_Beta Auto Const Mandatory
RefCollectionAlias property Alias_SD_Allies_Gamma Auto Const Mandatory
RefCollectionAlias property Alias_SD_Allies_Main Auto Const Mandatory
RefCollectionAlias property Alias_SD_Enemies_All Auto Const Mandatory
RefCollectionAlias property Alias_SD_Enemies_Skirmish Auto Const Mandatory
RefCollectionAlias property Alias_SD_Enemies_Alpha Auto Const Mandatory
RefCollectionAlias property Alias_SD_Enemies_Beta Auto Const Mandatory
RefCollectionAlias property Alias_SD_Enemies_Gamma Auto Const Mandatory
RefCollectionAlias property Alias_SD_Enemies_Main Auto Const Mandatory
RefCollectionAlias Property Alias_CF_Captains_All Auto Const Mandatory
RefCollectionAlias Property Alias_CF_Enemies_Main_Reinforcements_1 Auto Const Mandatory
RefCollectionAlias Property Alias_CF_Enemies_Main_Reinforcements_2 Auto Const Mandatory
RefCollectionAlias Property Alias_SD_Allies_Main_SysDefFleet Auto Const
RefCollectionAlias Property Alias_SD_Enemies_Main_Reinforcements_1 Auto Const Mandatory
RefCollectionAlias Property Alias_SD_Enemies_Main_Reinforcements_2 Auto Const Mandatory

Scene property LC088_Space_CF_100_SkirmishStart Auto Const Mandatory
Scene property LC088_Space_CF_105_SkirmishComplete Auto Const Mandatory
Scene property LC088_Space_CF_120_AlphaStart Auto Const Mandatory
Scene property LC088_Space_CF_128_AlphaComplete Auto Const Mandatory
Scene property LC088_Space_CF_130_BetaStart Auto Const Mandatory
Scene property LC088_Space_CF_138_BetaComplete Auto Const Mandatory
Scene property LC088_Space_CF_140_GammaStart Auto Const Mandatory
Scene property LC088_Space_CF_148_GammaComplete Auto Const Mandatory
Scene property LC088_Space_CF_150_ReadyForMainBattle Auto Const Mandatory
Scene property LC088_Space_CF_160_MainBattleStart Auto Const Mandatory
Scene property LC088_Space_CF_165_VigilanceInvulnerable Auto Const Mandatory
Scene property LC088_Space_CF_170_VigilanceEscortsDefeated Auto Const Mandatory
Scene property LC088_Space_CF_180_VigilanceDefeated Auto Const Mandatory
Scene property LC088_Space_CF_190_BoardVigilance Auto Const Mandatory
Scene property LC088_Space_SD_200_SkirmishStart Auto Const Mandatory
Scene property LC088_Space_SD_205_SkirmishComplete Auto Const Mandatory
Scene property LC088_Space_SD_220_AlphaStart Auto Const Mandatory
Scene property LC088_Space_SD_228_AlphaComplete Auto Const Mandatory
Scene property LC088_Space_SD_230_BetaStart Auto Const Mandatory
Scene property LC088_Space_SD_238_BetaComplete Auto Const Mandatory
Scene property LC088_Space_SD_240_GammaStart Auto Const Mandatory
Scene property LC088_Space_SD_248_GammaComplete Auto Const Mandatory
Scene property LC088_Space_SD_260_MainBattleStart Auto Const Mandatory
Scene property LC088_Space_SD_270_CFDefendersDefeated Auto Const Mandatory
Scene property LC088_Space_SD_290_BoardKey Auto Const Mandatory
Scene Property LC088_Space_CF_175_VigilanceEscortsDefeated Auto Const Mandatory
Scene Property LC088_Space_CF_163_VigilanceInvulnerable Auto Const Mandatory
Scene Property LC088_Space_CF_165_Reinforcements1 Auto Const Mandatory
Scene Property LC088_Space_CF_170_Reinforcements2 Auto Const Mandatory
Scene Property LC088_Space_CF_122_AllyStart Auto Const Mandatory
Scene Property LC088_Space_CF_132_AllyStart Auto Const Mandatory
Scene Property LC088_Space_CF_142_AllyStart Auto Const Mandatory
Scene Property LC088_Space_CF_169_AllyStart Auto Const Mandatory
Scene Property LC088_Space_SD_225_BatteryDestroyed Auto Const Mandatory
Scene Property LC088_Space_SD_280_CFDefendersDefeated Auto Const Mandatory
Scene Property LC088_Space_SD_265_VigilanceArrives01 Auto Const Mandatory
Scene Property LC088_Space_SD_266_VigilanceArrives02 Auto Const Mandatory
Scene Property LC088_Space_SD_267_VigilanceArrives03 Auto Const Mandatory
Scene Property LC088_Space_SD_226_BatteryPhaseComplete Auto Const Mandatory

LC082_VigilanceQuestScript property LC082 Auto Const Mandatory
CF_PostQuestScript Property CF_Post Auto Const Mandatory
Quest property LC088_Vigilance Auto Const Mandatory
Quest property LC088_Key Auto Const Mandatory
Quest Property CF07 Auto Const Mandatory
Quest Property CF08_Fleet Auto Const Mandatory
Quest Property CF08_SysDef Auto Const Mandatory
Quest Property CFKey Auto Const Mandatory
Quest Property CF_Main Auto Const Mandatory

Faction property PlayerFaction Auto Const Mandatory
Faction property CrimeFactionCrimsonFleet Auto Const Mandatory
Faction property UCSysDefFaction Auto Const Mandatory

GlobalVariable property LC088_Space_CFSD01EvidenceCountForSquadAlpha Auto Const Mandatory
GlobalVariable property LC088_Space_CFSD01EvidenceCountForSquadBeta Auto Const Mandatory
GlobalVariable property LC088_Space_CFSD01EvidenceCountForSquadGamma Auto Const Mandatory

ActorValue property Health Auto Const Mandatory
ActorValue property DockingPermission Auto Const Mandatory
ActorValue property CFSD01EvidenceTotal Auto Const Mandatory
Spell property LC088_DefensiveBatteryRegenSpell Auto Const Mandatory
Spell property LC088_DefensiveBatteryFireProjectileSpell Auto Const Mandatory
Keyword property DisallowAsCombatTargetKeyword Auto Const Mandatory
Perk property LC088_Space_VigilanceDamageImmunityPerk Auto Const Mandatory

RefCollectionAlias Property Alias_KeyTurrets Auto Const Mandatory

ObjectReference Property LC088_KeyTurretsEnableMarkerRef Auto Const Mandatory
