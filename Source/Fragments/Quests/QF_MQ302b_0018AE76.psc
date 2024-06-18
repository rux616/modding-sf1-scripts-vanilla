;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ302b_0018AE76 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 0: Space

;Set any relevant prior stages.
;;None

;Move the player onto a ship and into space.
;'None' is the expected marker for the space quickstart.
kMyQuest.QuickstartTo(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 1: Bridge

;Move the player and allies.
kMyQuest.QuickstartTo(LC165_Quickstart_BridgeRef)

;Set any relevant prior stages.
SetStage(25)
SetStage(195)
SetStage(200)
SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 2: Courtyard

;Move the player and allies.
kMyQuest.QuickstartTo(LC165_Quickstart_CourtyardRef)

;Set any relevant prior stages.
SetStage(25)
SetStage(195)
SetStage(200)
SetStage(230)
SetStage(390)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 3: Entry

;Set any relevant prior stages.
;None

;Move the player and allies.
kMyQuest.QuickstartTo(LC165_Quickstart_EntryRef)

;Set stages related to the Ally.
SetStage(25)
SetStage(195)
SetStage(230)

;Move the ally, if any, to the player.
Actor allyRef = Alias_Ally.GetActorRef()
if (allyRef != None)
     allyRef.MoveTo(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 4: Engineering

;Set any relevant prior stages.
;None

;Move the player and allies.
kMyQuest.QuickstartTo(LC165_Quickstart_EngineeringRef)

;Set stages related to the Ally.
SetStage(25)
SetStage(195)
SetStage(230)

;Move the ally, if any, to the player.
Actor allyRef = Alias_Ally.GetActorRef()
if (allyRef != None)
     allyRef.MoveTo(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 5: Corridors

;Move the player and allies.
kMyQuest.QuickstartTo(LC165_Quickstart_CorridorsRef)

;Set any relevant prior stages.
SetStage(25)
SetStage(195)
SetStage(230)

;Move the ally, if any, to the player.
Actor allyRef = Alias_Ally.GetActorRef()
if (allyRef != None)
     allyRef.MoveTo(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 7: Elevator

;Move the player and allies.
kMyQuest.QuickstartTo(LC165_Quickstart_ElevatorRef)

;Set any relevant prior stages.
SetStage(25)
SetStage(195)
SetStage(230)

;Move the ally, if any, to the player.
Actor allyRef = Alias_Ally.GetActorRef()
if (allyRef != None)
     allyRef.MoveTo(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 8: Ruins

;Move the player and allies.
kMyQuest.QuickstartTo(LC165_Quickstart_RuinsRef)

;Set any relevant prior stages.
SetStage(25)
SetStage(195)
SetStage(230)
kMyQuest.QuickstartElevator02()

;Move the ally, if any, to the player.
Actor allyRef = Alias_Ally.GetActorRef()
if (allyRef != None)
     allyRef.MoveTo(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 9: Temple Interior

;Move the player and allies.
kMyQuest.QuickstartTo(LC165_Quickstart_TempleRef)

;Set any relevant prior stages.
SetStage(25)
SetStage(195)
SetStage(230)

;Move the ally, if any, to the player.
Actor allyRef = Alias_Ally.GetActorRef()
if (allyRef != None)
     allyRef.MoveTo(Game.GetPlayer())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE lc165spacequestscript
Quest __temp = self as Quest
lc165spacequestscript kmyQuest = __temp as lc165spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Start stage.

;Reset the location.
Alias_LC165BuriedTempleSpaceLocation.GetLocation().Reset()
Alias_LC165BuriedTempleLocation.GetLocation().Reset()

;Block landing on Masada III until the space encounter has finished.
Alias_MasadaIII_Surface.GetLocation().EnableSpaceTravel(Self, False)

;Swap the Enable and Map Markers for the Buried Temple.
Alias_BuriedTempleQuestDisableMarker.TryToDisable()
Alias_BuriedTempleQuestEnableMarker.TryToEnable()
Alias_BuriedTemplePrequestMapMarker.TryToDisable()
Alias_BuriedTempleMapMarker.TryToEnable()
Alias_ExteriorWeatherManagerInitial.TryToEnable()

;Start Emissary and Hunter Artifact Holder quests
MQ303.Start()
MQ304.Start()
MQ302c.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
;Set by: Quickstart
;Space Combat Testing Quickstart.

;Jump to the MQ302B Space Battle and skip the dialogue.
SetStage(0)
Alias_PlayerShip.GetShipRef().MoveTo(LC165_SpaceOriginMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Quickstart 13: Surface

;Move the player and allies.
kMyQuest.QuickstartTo(LC165_Quickstart_Surface)

;Set any relevant prior stages.
SetStage(25)
SetStage(195)
SetStage(200)
SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Startup Stage.
;The player is allied with the Emissary. The Hunter is your adversary.

;Set up aliases and factions.
Actor player = Game.GetPlayer()
player.AddToFaction(MQ_EmissaryAllyFaction)
Alias_Ally.ForceRefTo(Alias_Emissary.GetActorRef())
Alias_AllyShip.ForceRefTo(Alias_Helix.GetShipRef())
Alias_Adversary01.ForceRefTo(Alias_Hunter.GetActorRef())
Alias_Adversary01Ship.ForceRefTo(Alias_Scorpius.GetShipRef())

;Setup the Adversary Battle Stage data.
kMyQuest.SetupAdversaryBattleStageData()

;Display 'Go to Masada III'
SetObjectiveDisplayed(10)
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Startup Stage.
;The player is allied with the Hunter. The Emissary is your adversary.

;Set up aliases and factions.
Actor player = Game.GetPlayer()
player.AddToFaction(MQ_HunterAllyFaction)
Alias_Ally.ForceRefTo(Alias_Hunter.GetActorRef())
Alias_AllyShip.ForceRefTo(Alias_Scorpius.GetShipRef())
Alias_Adversary01.ForceRefTo(Alias_Emissary.GetActorRef())
Alias_Adversary01Ship.ForceRefTo(Alias_Helix.GetShipRef())

;Setup the Adversary Battle Stage data.
kMyQuest.SetupAdversaryBattleStageData()

;Display 'Go to Masada III'
SetObjectiveDisplayed(10)
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Startup Stage.
;The player has rejected both the Emissary and the Hunter.

;Set up aliases and factions.
Alias_Adversary01.ForceRefTo(Alias_Hunter.GetActorRef())
Alias_Adversary01Ship.ForceRefTo(Alias_Scorpius.GetShipRef())
Alias_Adversary02.ForceRefTo(Alias_Emissary.GetActorRef())
Alias_Adversary02Ship.ForceRefTo(Alias_Helix.GetShipRef())

;Setup the Adversary Battle Stage data.
kMyQuest.SetupAdversaryBattleStageData()

;Display 'Go to Masada III'
SetObjectiveDisplayed(10)
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 100, or Quickstarts

;Initialize the Adversary for the battle.
kMyQuest.InitAdversary()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Change Location script, PlayerShip alias.
;The player has jumped to Masada III Orbit.

;Lock the player's controls for the upcoming scene.
kMyQuest.SetPlayerControlsEnabled(False)

;Start the initial space dialogue scene.
if (GetStageDone(12))
     ;DEBUG: Skip the scene and proceed directly to combat.
     SetStage(105)
     SetStage(110)
ElseIf (GetStageDone(20))
     MQ302_100_Space_InitialConfrontHunter.Start()
ElseIf (GetStageDone(21))
     MQ302_100_Space_InitialConfrontEmissary.Start()
ElseIf (GetStageDone(22))
     MQ302_100_Space_InitialConfrontBoth.Start()
EndIf

;Wait until this point to add your adversary to the enemy faction.
SetStage(25)

;Update objectives.
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
;Set by: Space Start scenes, during scene.

;Set up the space battle.
((Self as Quest) as LC165SpaceQuestScript).SetupSpaceEncounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE lc165spacequestscript
Quest __temp = self as Quest
lc165spacequestscript kmyQuest = __temp as lc165spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Space Start scenes, on scene end.

;Lock the player's controls for the upcoming scene.
((kMyQuest as Quest) as LC165QuestScript).SetPlayerControlsEnabled(True)

;Start the battle.
kMyQuest.StartSpaceEncounter()

;Update objectives.
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE lc165spacequestscript
Quest __temp = self as Quest
lc165spacequestscript kmyQuest = __temp as lc165spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: InitialGenericShips alias script, when enough ships have
;been destroyed.

;Spawn the reinforcements, and enable player's ally if appropriate.
kMyQuest.SpawnSpaceEncounterReinforcements()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0131_Item_00
Function Fragment_Stage_0131_Item_00()
;BEGIN CODE
;Set by: Quest script's SpawnSpaceEncounterReinforcements,
;once all reinforcements have spawned.

;For now, just advance.
SetStage(182)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Set by: Quest script's SpawnSpaceEncounterReinforcements, after
;enabling the Ally ship.

;The player's ally joins the fight.
if (GetStageDone(20))
 MQ302_150_Space_AllyArrivesEmissary.Start()
ElseIf (GetStageDone(21))
 MQ302_150_Space_AllyArrivesHunter.Start()
EndIf

;Disable all other versions of the ships
TheHelixShipREF.DisableNoWait()
TheScorpiusShipREF.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0151_Item_00
Function Fragment_Stage_0151_Item_00()
;BEGIN CODE
;Set by: Ally arrival scene.

;Once all enemy ships have been defeated or driven off,
;and your ally, if any, has jumped in, advance.
if (GetStageDone(180) && GetStageDone(181) && GetStageDone(182) && \
    (GetStageDone(22) || GetStageDone(151)))
 SetStage(190)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
;Set by: Quest script's CheckForAdversaryRetreat.

;Trigger reinforcements at this point, if we need to.
SetStage(130)

;Once all enemy ships have been defeated or driven off,
;and your ally, if any, has jumped in, advance.
if (GetStageDone(180) && GetStageDone(181) && GetStageDone(182) && \
    (GetStageDone(22) || GetStageDone(151)))
 SetStage(190)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0181_Item_00
Function Fragment_Stage_0181_Item_00()
;BEGIN CODE
;Set by: InitialGenericShips alias script, all ships dead.

;Once all enemy ships have been defeated or driven off,
;and your ally, if any, has jumped in, advance.
if (GetStageDone(180) && GetStageDone(181) && GetStageDone(182) && \
    (GetStageDone(22) || GetStageDone(151)))
 SetStage(190)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0182_Item_00
Function Fragment_Stage_0182_Item_00()
;BEGIN CODE
;Set by: ReinforcementGenericShips alias script, all ships dead.

;Once all enemy ships have been defeated or driven off,
;and your ally, if any, has jumped in, advance.
if (GetStageDone(180) && GetStageDone(181) && GetStageDone(182) && \
    (GetStageDone(22) || GetStageDone(151)))
 SetStage(190)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN AUTOCAST TYPE lc165spacequestscript
Quest __temp = self as Quest
lc165spacequestscript kmyQuest = __temp as lc165spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stages 180/181/182, when the battle has ended.

;Delay briefly for timing.
if (GetStageDone(20) || GetStageDone(21))
     Utility.Wait(2)
EndIf

;Update objective.
SetObjectiveCompleted(30)

;Stop the battle music override.
kMyQuest.EndSpaceEncounter()

;The player's ally hails them.
if (GetStageDone(20))
     SetObjectiveDisplayed(40)
     MQ302_190_Space_PostBattleEmissaryAlly.Start()
ElseIf (GetStageDone(21))
     SetObjectiveDisplayed(40)
     MQ302_190_Space_PostBattleHunterAlly.Start()
Else
     ;If no ally, just proceed.
     SetStage(191)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0191_Item_00
Function Fragment_Stage_0191_Item_00()
;BEGIN CODE
;Set by: Post-battle scene completed (or skipped if no Ally).

;Update objective.
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

;Set up the surface and allow landing there.
SetStage(195)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN AUTOCAST TYPE lc165spacequestscript
Quest __temp = self as Quest
lc165spacequestscript kmyQuest = __temp as lc165spacequestscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 191, or quickstarts.

;Update Enable Markers.
LC165_QuestEnableMarkerRef.Enable()
LC165_QuestDisableMarkerRef.Disable()

;Disable your ally's ship.
SpaceshipReference allyShipRef = Alias_AllyShip.GetShipRef()
if (allyShipRef != None)
     allyShipRef.DisableWithTakeOffOrLandingNoWait()
EndIf

;Your Adversary's Ship enables landed on the landing pad.
SpaceshipReference adversaryShipRef = Alias_Adversary01Ship.GetShipRef()
adversaryShipRef.Disable()
adversaryShipRef.MoveTo(Alias_AdversaryShipLandingPadMarker.GetRef())
adversaryShipRef.Enable()

;Give the player the map marker to the Buried Temple.
Alias_BuriedTempleMapMarker.GetRef().AddToMap()

;Stop the battle music override.
kMyQuest.EndSpaceEncounter()

;Enable landing on Masada III.
Alias_MasadaIII_Surface.GetLocation().EnableSpaceTravel(Self, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set by: Change Location script, PlayerShip alias.

;Update objectives.
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, landing marker on surface.

;If you have an ally...
if (!GetStageDone(22) && !GetStageDone(230))
     ;Teleport your ally nearby.
     kMyQuest.StartAllyArrivalTimer()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Ally arrival scene, on begin, or 300/400 as a failsafe.

;If you have an ally:
if (!GetStageDone(22))
     ;Add your ally as a follower.
     Actor allyRef = Alias_Ally.GetActorRef()
     SQ_Followers.SetRoleActive(allyRef)
     allyRef.EvaluatePackage()
     allyRef.IgnoreFriendlyHits(True)

     int stage = GetStage()
     if (stage >= 400)
          kMyQuest.NoncombatTeleport(allyRef, LC165_Quickstart_CourtyardRef)
     ElseIf (stage >= 300)
          kMyQuest.NoncombatTeleport(allyRef, LC165_Quickstart_BridgeRef)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Set by: Trigger, approaching Bridge, if stage 230 completed.

;Play Ally's commentary scene.
if (GetStageDone(20))
     MQ302_192_Entrance_Emissary.Start()
ElseIf (GetStageDone(21))
     MQ302_192_Entrance_Hunter.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, Bridge.

;Start the Bridge Starborn Battle.
kMyQuest.StartStarbornBattle(Alias_StarbornBridge.GetActorRef())

;Failsafe: Make sure the player's ally has joined them.
SetStage(230)

;Update objective.
SetObjectiveCompleted(10)
SetObjectiveDisplayed(60, abDisplayed=False)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;Set by: Quest Script, after the Bridge Starborn teleports.

;Play the Parallel Self react scene.
MQ302_Battle_01_Bridge_ParallelSelfReact.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
;Set by: Quest Script, Bridge Battle Complete.

;Update objective.
SetObjectiveCompleted(70)
SetObjectiveDisplayed(60, abForce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, Courtyard. (If Stage 390 also set.)

;Start the Courtyard Starborn Battle.
kMyQuest.StartStarbornBattle(Alias_StarbornCourtyard.GetActorRef())

;Failsafe: Make sure the player's ally has joined them.
SetStage(230)

;Update objective.
SetObjectiveCompleted(10)
SetObjectiveDisplayed(60, abDisplayed=False)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;Set by: Quest script.

;Update objectives.
SetObjectiveDisplayed(81)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0411_Item_00
Function Fragment_Stage_0411_Item_00()
;BEGIN CODE
;Set by: Quest script.

;Update objectives.
SetObjectiveDisplayed(81, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
;Set by: Quest Script, Courtyard Battle Complete.

;Update objective.
SetObjectiveCompleted(80)
SetObjectiveCompleted(81)
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0491_Item_00
Function Fragment_Stage_0491_Item_00()
;BEGIN CODE
;Set by: Alias Script, Ecliptic Base Access Card, on container changed.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0495_Item_00
Function Fragment_Stage_0495_Item_00()
;BEGIN CODE
;Set by: Exterior ID Card Reader Script, OnActivate.

;Update objective.
SetObjectiveCompleted(90)
SetObjectiveDisplayed(60, abForce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set by: Trigger, just inside the base.

;Do some initial setup for the Vectera Memory.
ObjectReference drill = Alias_Vectera_Drill.GetRef()
drill.WaitFor3DLoad()
drill.PlayAnimation("Stage2")
ObjectReference wall = Alias_Vectera_Wall.GetRef()
wall.WaitFor3DLoad()
wall.PlayAnimation("Stage2")
;Alias_Vectera_Drill.TryToDisable()
;Alias_Vectera_Wall.TryToDisable()
Alias_Vectera_DrillHazardTrigger.TryToDisable()
Alias_Vectera_DrillCollision.TryToDisable()
Alias_Vectera_DrillNavcut.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
;Set by: Trigger, approaching the first anomaly.

;To support quickstarts, make sure the Entry stage was set.
SetStage(510)

;Play Ally scene.
if (GetStageDone(20))
 MQ302_194_ShiftTriggerScene_Emissary.Start()
ElseIf (GetStageDone(21))
 MQ302_194_ShiftTriggerScene_Hunter.Start()
EndIf

;Update objective.
SetObjectiveCompleted(10)
SetObjectiveDisplayed(60, abDisplayed=False)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Set by: Quest script, on shift to Vectera Memory.

;Enable actors.
Alias_MQ302bLin.TryToEnable()
Alias_MQ302bHeller.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
;Set by: Trigger, Vectera Memory.

;Start the Vectera memory scene.
MQ302_200_VecteraScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0565_Item_00
Function Fragment_Stage_0565_Item_00()
;BEGIN CODE
;Set by: MQ302_200_VecteraScene01, scene end.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
;Set by: CombatStateChanged Alias script, Lin or Heller.

Actor playerRef = Game.GetPlayer()
Actor linRef = Alias_MQ302bLin.GetActorRef()
Actor hellerRef = Alias_MQ302bHeller.GetActorRef()

linRef.AddToFaction(PlayerEnemyFaction)
linRef.StartCombat(playerRef)

hellerRef.AddToFaction(PlayerEnemyFaction)
hellerRef.StartCombat(playerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN CODE
;Set by: Quest script, on shift at end of Vectera Memory.

;Disable Lin and Heller.
Alias_MQ302bLin.TryToDisable()
Alias_MQ302bHeller.TryToDisable()

;Update objectives.
SetObjectiveCompleted(110)
SetObjectiveDisplayed(60, abForce=True)

;Play Ally scene.
if (GetStageDone(20))
     MQ302_196_ShiftTriggerComplete_Emissary.Start()
ElseIf (GetStageDone(21))
     MQ302_196_ShiftTriggerComplete_Hunter.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, Engineering Area.

;Start the Engineering Starborn Battle.
kMyQuest.StartStarbornBattle(Alias_StarbornFire.GetActorRef())

;Update objective.
SetObjectiveCompleted(10)
SetObjectiveDisplayed(60, abDisplayed=False)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0605_Item_00
Function Fragment_Stage_0605_Item_00()
;BEGIN CODE
;Set by: Quest script, the first time robot reactivation occurs.

;Play the robot callout scene.
MQ302_Battle_03_Engineering_RobotCallout.Start()

;Update objective.
if (!GetStageDone(606))
     SetObjectiveDisplayed(125)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0606_Item_00
Function Fragment_Stage_0606_Item_00()
;BEGIN CODE
;Set by: Quest script, when disabling the robots and/or turrets.

;Update objective.
if (IsObjectiveDisplayed(125))
     SetObjectiveCompleted(125)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0607_Item_00
Function Fragment_Stage_0607_Item_00()
;BEGIN CODE
;Set by: DefaultCollectionScript, when all of the turrets have been defeated.

;Update objective.
SetStage(606)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
;Set by: Engineering trigger, initial ledge.

;EVP the Fire Starborn when they reach the initial ledge.
Alias_StarbornFire.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN CODE
;Set by: Quest Script, Fire Starborn Dead.

;Engineering is complete when both Starborn are dead.
if (GetStageDone(680) && GetStageDone(681))
     SetStage(690)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0681_Item_00
Function Fragment_Stage_0681_Item_00()
;BEGIN CODE
;Set by: Quest Script, Ice Starborn Dead.

;Engineering is complete when both Starborn are dead.
if (GetStageDone(680) && GetStageDone(681))
     SetStage(690)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
;Set by: Stage 680/681, when both Starborn are dead.

;Update objective.
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0691_Item_00
Function Fragment_Stage_0691_Item_00()
;BEGIN CODE
;Set by: Engineering Key Alias Script, on container changed.

;Update objective.
SetObjectiveCompleted(130)
SetObjectiveDisplayed(60, abForce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0695_Item_00
Function Fragment_Stage_0695_Item_00()
;BEGIN CODE
;Set by: Engineering Exit Trigger

;Update objective.
if (!GetStageDone(606))
     SetObjectiveDisplayed(125,False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;Set by: Trigger, Corridors.

;Update objective.
SetObjectiveCompleted(10)
SetObjectiveDisplayed(60, abDisplayed=False)
SetObjectiveDisplayed(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;Set by: Quest script, on shift to Scow Memory.

;Enable actors.
MQ302b_ScowActorsEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN CODE
;Set by: Trigger, Scow Memory

;Start Petrov's scene.
MQ302_210_ScowScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0765_Item_00
Function Fragment_Stage_0765_Item_00()
;BEGIN CODE
;Set by: MQ302_210_ScowScene01, scene end.

;Immediately trigger the attack.
SetStage(770)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0770_Item_00
Function Fragment_Stage_0770_Item_00()
;BEGIN CODE
;Set by: Stage 765, or attacking anyone in the Scow (alias script).

Actor playerRef = Game.GetPlayer()
Actor petrovRef = Alias_MQ302bPetrov.GetActorRef()
Actor vadikRef = Alias_MQ302bVadik.GetActorRef()

Alias_MQ302bScowGuards.AddToFaction(PlayerEnemyFaction)
Alias_MQ302bScowGuards.StartCombatAll(playerRef)

PetrovRef.AddToFaction(PlayerEnemyFaction)
PetrovRef.StartCombat(playerRef)

VadikRef.AddToFaction(PlayerEnemyFaction)
VadikRef.StartCombat(playerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0780_Item_00
Function Fragment_Stage_0780_Item_00()
;BEGIN CODE
;Set by: Alias scripts, Petrov's Key or Petrov's Door

;Update objective.
SetObjectiveCompleted(145)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0790_Item_00
Function Fragment_Stage_0790_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, on shift at end of Scow Memory.

;Disable Scow Actors
MQ302b_ScowActorsEnableMarker.Disable()

;Update objective.
SetObjectiveCompleted(145)
SetObjectiveCompleted(150)
SetObjectiveDisplayed(60, abForce=True)

;Play Ally scene.
if (GetStageDone(20))
     MQ302_211_ShiftTriggerComplete02_Emissary.Start()
ElseIf (GetStageDone(21))
     MQ302_211_ShiftTriggerComplete02_Hunter.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Player activates Elevator Lift Button.

;Animate the Elevator Lift activator and play its SFX.
Alias_ElevatorActivator.GetRef().PlayAnimation("Play01")
kMyQuest.PlayInitialElevatorLeverSFX()

;Start Elevator Scene 1.
MQ302_215_ElevatorScene01.Start()

;Update objectives.
SetObjectiveCompleted(10)


;Set up the Eye Memory, since this animation has a long entry.

;Enable and wound the other you.
Actor otherYouRef = Alias_MQ302bOtherYou.GetActorRef()
otherYouRef.SetNoBleedoutRecovery(True)
otherYouRef.SetRestrained(True)
otherYouRef.DamageValue(Health, otherYouRef.GetValue(Health)-1)

;Make sure Other You has the right face type set.
otherYouRef.ChangeAnimFaceArchetype(AnimFaceArchetypeEyesClosed)

;Make sure Vladimir has the right archetype.
Actor vladimirRef = Alias_MQ302bVladimir.GetActorREF()
vladimirRef.ChangeAnimFaceArchetype(AnimFaceArchetypeSad)

;Make sure Vlad and Other You have right keywords.
if (Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 0 ;check player since other player will copy
  vladimirRef.AddKeyword(AnimArchetypeMQ204A_030_MaleReactsToMale)
  otherYouRef.AddKeyword(AnimArchetypeMQ204A_030_MaleReactsToMale)
Else
  vladimirRef.AddKeyword(AnimArchetypeMQ204A_030_MaleReactsToFemale)
  otherYouRef.AddKeyword(AnimArchetypeMQ204A_030_FemaleReactsToMale)
EndIf

otherYouRef.Disable()
otherYouRef.EvaluatePackage()
otherYouRef.Enable()

vladimirRef.Disable()
vladimirRef.EvaluatePackage()
vladimirRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
;Set by: Quest script, on shift to Eye Memory.

;Update objectives.
SetObjectiveDisplayed(60, abDisplayed=False)
SetObjectiveDisplayed(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0951_Item_00
Function Fragment_Stage_0951_Item_00()
;BEGIN CODE
;Set by: Quest script, after shift to Eye Memory.

;Stop Elevator Scene 1.
MQ302_215_ElevatorScene01.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0960_Item_00
Function Fragment_Stage_0960_Item_00()
;BEGIN CODE
;Set by: Trigger, Eye Memory

;Start Vladimir's scene.
MQ302_220_EyeScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0965_Item_00
Function Fragment_Stage_0965_Item_00()
;BEGIN CODE
;Set by: MQ302_220_EyeScene01

;"Kill" the alternate-player.
;just block activation since they'll be in the death furniture
Actor OtherYouREF = Alias_MQ302bOtherYou.GetActorRef()
OtherYouREF.BlockActivation(True, True)
OtherYouREF.SetUnconscious()
OtherYouREF.ChangeAnimFaceArchetype(AnimFaceArchetypeEyesClosed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0969_Item_00
Function Fragment_Stage_0969_Item_00()
;BEGIN CODE
;Set by: MQ302_220_EyeScene01

Actor VladimirREF = Alias_MQ302bVladimir.GetActorRef()
VladimirREF.SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0970_Item_00
Function Fragment_Stage_0970_Item_00()
;BEGIN CODE
;Set by: Alias script, Vladimir or Other Self

;End Vladimir's scene.
MQ302_220_EyeScene02.Stop()

;Make Vladimir hostile.
Actor VladimirREF = Alias_MQ302bVladimir.GetActorRef()
VladimirREF.RemoveFromFaction(ConstellationFaction)
VladimirREF.AddtoFaction(PlayerEnemyFaction)
VladimirREF.StartCombat(Game.GetPlayer())
VladimirREF.SetGhost(False)

;OtherYou just dies.
SetStage(965)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, on shift at end of Eye Memory.

;Disable Eye actors.
Alias_MQ302bVladimir.TryToDisable()
Alias_MQ302bOtherYou.TryToDisable()

;Update objectives.
SetObjectiveCompleted(190)
SetObjectiveDisplayed(60, abForce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0991_Item_00
Function Fragment_Stage_0991_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, on shift at end of Eye Memory.

;Start Elevator Scene 2.
MQ302_225_ElevatorScene02.Start()

;Wait for Elevator Scene 2 to finish setting up before returning.
While (!GetStageDone(992))
     Utility.Wait(0.05)
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0992_Item_00
Function Fragment_Stage_0992_Item_00()
;BEGIN CODE
;Set by: MQ302_225_ElevatorScene02, on setup.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, Ruins.

;Start the Ruins Starborn Battle.
kMyQuest.StartStarbornBattle(Alias_StarbornRuins.GetActorRef())

;Update objective.
SetObjectiveCompleted(10)
SetObjectiveDisplayed(60, abDisplayed=False)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1001_Item_00
Function Fragment_Stage_1001_Item_00()
;BEGIN CODE
;Set by: MQ302_Battle_05_Ruins_BattleStart
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1090_Item_00
Function Fragment_Stage_1090_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Ruins Starborn Alias Script, on death.

;Unseal the Ruins Temple Door.
kMyQuest.SetTempleDoorState(False, True)

;Update objectives.
SetObjectiveCompleted(200)
SetObjectiveDisplayed(60, abForce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger in Temple Interior.

;Set up the temple interior.
kMyQuest.InitTempleInterior()

;Update objectives.
SetObjectiveCompleted(10)
SetObjectiveDisplayed(60, abForce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger in Temple Interior.

;Lock the player's controls. They unlock in the scene end fragment.
kMyQuest.SetPlayerControlsEnabled(False)

;Start the Confrontation Scene.
if (GetStageDone(20))
     MQ302_310_ConfrontHunter.Start()
ElseIf (GetStageDone(21))
     MQ302_310_ConfrontEmissary.Start()
ElseIf (GetStageDone(22))
     MQ302_310_ConfrontBoth.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1120_Item_00
Function Fragment_Stage_1120_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ Confrontation Scenes, on dialogue choice.

;Start the battle.
kMyQuest.StartStarbornBattle(Alias_StarbornAdversary_Primary.GetActorRef())

;Update objectives.
SetObjectiveCompleted(10)
SetObjectiveDisplayed(60, abDisplayed=False)
if (GetStageDone(20)) ;hunter is the enemy
 SetObjectiveDisplayed(210)
ElseIf (GetStageDone(21)) ;Emissary is the enemy
 SetObjectiveDisplayed(220)
Else ;both are the enemy
 SetObjectiveDisplayed(225)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1122_Item_00
Function Fragment_Stage_1122_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Trigger the Artifact state change.
kMyQuest.SetArtifactStage(1)

;And start the ZeroG phase of the fight.
kMyQuest.StarbornAdversarySetZeroGActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1123_Item_00
Function Fragment_Stage_1123_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Trigger the Artifact state change.
kMyQuest.SetArtifactStage(2)

;Play the reaction warning comment.
MQ302_Battle_06_Adversary_ArtifactWarning.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1124_Item_00
Function Fragment_Stage_1124_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Make sure the warning scene finishes playing.
int failsafe = 0
While ((failsafe < 60) && (MQ302_Battle_06_Adversary_ArtifactWarning.IsPlaying()))
     failsafe = failsafe + 1
     Utility.Wait(0.5)
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1129_Item_00
Function Fragment_Stage_1129_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Trigger the Artifact surge.
kMyQuest.SetArtifactStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1130_Item_00
Function Fragment_Stage_1130_Item_00()
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Play arrival scene.
MQ302_Battle_06_Adversary_Lodge_Arrival.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1132_Item_00
Function Fragment_Stage_1132_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Trigger, Lodge.

;Trigger the Adversary's appearance in the Lodge.
kMyQuest.ForceAdversaryShift("Adversary_Lodge")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1137_Item_00
Function Fragment_Stage_1137_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Adversary Battle Update.

;Make sure prior stages were set.
;SetStage(1132)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1140_Item_00
Function Fragment_Stage_1140_Item_00()
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1147_Item_00
Function Fragment_Stage_1147_Item_00()
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Set the exit door accessible.
Alias_StarbornAdversary_NASAModule_ExitDoor.GetRef().SetDoorInaccessible(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1160_Item_00
Function Fragment_Stage_1160_Item_00()
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Make sure the dancers were enabled.
Alias_StarbornAdversary_Astral_Dancers.EnableAll()

;Open the elevator doors after a brief delay.
;This has to be done in a NoWait call to avoid a deadlock.
SetStageNoWait(1161)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1161_Item_00
Function Fragment_Stage_1161_Item_00()
;BEGIN CODE
;Set by: Stage 1161.

;Delay briefly for timing.
Utility.Wait(1)

;Open the Elevator door.
ObjectReference elevatorDoor = Alias_StarbornAdversary_Astral_EntryDoor.GetRef()
;TODO - Swap to correct SFX.
WwiseEvent_OBJSecurityScannerExitSuccess.Play(elevatorDoor)
elevatorDoor.SetOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1162_Item_00
Function Fragment_Stage_1162_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Adversary Battle Update, or trigger.

;Make sure prior stages were set.
;SetStage(1160)

;Trigger the Adversary's appearance in the Astral Lounge.
kMyQuest.ForceAdversaryShift("Adversary_Astral")

;Play the combat start scene.
MQ302_Battle_06_Adversary_Astral_CombatStart.Start()

;EVP all actors.
Alias_StarbornAdversary_Astral_RefsAll.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1167_Item_00
Function Fragment_Stage_1167_Item_00()
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Make sure prior stages were set.
;SetStage(1162)

;Set the exit door accessible.
Alias_StarbornAdversary_Astral_ExitDoor.GetRef().SetDoorInaccessible(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1170_Item_00
Function Fragment_Stage_1170_Item_00()
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Start the security alarm after a brief delay, then have the
;adversaries emerge a short while later.
;
;This has to be done in a NoWait call to avoid a deadlock.
SetStageNoWait(1171)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1171_Item_00
Function Fragment_Stage_1171_Item_00()
;BEGIN CODE
;Set by: Stage 1170.

;Delay briefly for effect.
Utility.Wait(1)

;Trigger the first security alarm.
(Alias_StarbornAdversary_Nishina_AlarmActivator01.GetRef() as DNLocalAlarmScript).TriggerAlarm()

;Then have the adversaries emerge.
SetStage(1172)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1172_Item_00
Function Fragment_Stage_1172_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stages 1171 or 1178.

;Delay briefly for effect.
Utility.Wait(6)

;Then have the adversaries teleport in.
kMyQuest.StarbornAdversaryTeleportInNishina()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1177_Item_00
Function Fragment_Stage_1177_Item_00()
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Open the exit door.
Alias_StarbornAdversary_Nishina_ExitDoor.GetRef().SetOpen(True)

;Start the security alarm, then have the adversaries emerge if
;they haven't yet.
;
;This has to be done in a NoWait call to avoid a deadlock.
SetStageNoWait(1178)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1178_Item_00
Function Fragment_Stage_1178_Item_00()
;BEGIN CODE
;Set by: Stage 1177.

;Trigger the second security alarm.
(Alias_StarbornAdversary_Nishina_AlarmActivator02.GetRef() as DNLocalAlarmScript).TriggerAlarm()

;Then have the adversaries emerge, if they haven't already.
SetStage(1172)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1180_Item_00
Function Fragment_Stage_1180_Item_00()
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Open the elevator doors after a brief delay.
;This has to be done in a NoWait call to avoid a deadlock.
SetStageNoWait(1181)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1181_Item_00
Function Fragment_Stage_1181_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Delay briefly for timing.
Utility.Wait(1)

;Open the Elevator doors.
;TODO - Swap to correct SFX.
WwiseEvent_OBJSecurityScannerExitSuccess.Play(Alias_StarbornAdversary_Slayton_EntryDoors.GetAt(0))
Alias_StarbornAdversary_Slayton_EntryDoors.SetOpen(True)

;Trigger the Adversary's appearance in Slayton.
kMyQuest.ForceAdversaryShift("Adversary_Slayton")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1190_Item_00
Function Fragment_Stage_1190_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, AdversaryBattleStageData.

;Update the Adversary actors.
kMyQuest.StarbornAdversaryUpdateAdversaryActors()

;Play the Museum scene.
MQ302_Battle_06_Adversary_Museum_Arrival.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1199_Item_00
Function Fragment_Stage_1199_Item_00()
;BEGIN CODE
;Set by: HunterDeath or EmissaryDeath scenes, on scene end.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Shifting script, after the final shift back to the Temple.
;OR Adversary surrenders in dialogue.

;TEMP - This should be done in 1199.
;Clean up the Adversary's boss battle scripting.
;Kill them if they didn't surrender.
bool adversarySurrendered = GetStageDone(1230)
kMyQuest.StarbornAdversaryEnd(adversarySurrendered)

;If the Adversary is now dead, Companion comments.
if (!GetStageDone(1230))
    if (GetStageDone(20)) ;hunter dead
         MQ302_320_Companion_HunterDead.Start()
    ElseIf (GetStageDone(21)) ; Emissary dead
         ;MQ302_320_Companion_EmissaryDead.Start()
         SetStage(1205)
    Else
         MQ302_320_Companion_BothDead.Start()
    EndIf
EndIf

;Start the postquest dialogue.
MQ304_PostQuestDialogue.Start()

;Update objectives.
SetObjectiveDisplayed(60, abDisplayed=False)
if (GetStageDone(20)) ;hunter is the enemy
     SetObjectiveCompleted(210)
     SetObjectiveDisplayed(230)
     SetObjectiveDisplayed(250)
ElseIf (GetStageDone(21)) ;Emissary is the enemy
     SetOBjectiveCompleted(220)
     SetObjectiveDisplayed(240)
     SetObjectiveDisplayed(260)
Else ;both are the enemy
     SetObjectiveCompleted(225)
     SetObjectiveDisplayed(230)
     SetObjectiveDisplayed(240)
EndIf

;Perform the rescue check after a brief delay.
SetStageNoWait(1201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1201_Item_00
Function Fragment_Stage_1201_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Stage 1201

;Brief delay.
Utility.Wait(3)

;Perform the rescue check.
kMyQuest.StarbornAdversaryRescueCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
;Set by: MQ Confrontation scene, speech challenge.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1220_Item_00
Function Fragment_Stage_1220_Item_00()
;BEGIN CODE
;Set by: MQ Confrontation scene, speech challenge.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1230_Item_00
Function Fragment_Stage_1230_Item_00()
;BEGIN CODE
;Set by: MQ Confrontation scene, speech challenge.

;Set the Battle End stage.
SetStage(1200)

;Your Adversary teleports away.
SetStageNoWait(1231)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1231_Item_00
Function Fragment_Stage_1231_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ302_310_Confront scenes, on surrender.

;Delay briefly for the camera switch.
Utility.Wait(1)

;Teleport the Adversary out and disable them.
if (GetStageDone(20))
     kMyQuest.StarbornAdversarySurrenderTeleport(MQ302_310_ConfrontHunter)
ElseIf (GetStageDone(21))
     kMyQuest.StarbornAdversarySurrenderTeleport(MQ302_310_ConfrontEmissary)
ElseIf (GetStageDone(22))
     kMyQuest.StarbornAdversarySurrenderTeleport(MQ302_310_ConfrontBoth)
EndIf

;Start peaceful end scenes.
if (GetStageDone(20)) ;hunter is the enemy
    SetStage(1240)
    MQ302_320_Companion_HunterPeacefulEnd.Start()
ElseIf (GetStageDone(21)) ;Emissary is the enemy
    SetStage(1250)
    MQ302_320_Companion_EmissaryPeacefulEnd.Start()
Else ;both are the enemy
    SetStage(1260)
    MQ302_320_Companion_BothPeacefulEnd.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1240_Item_00
Function Fragment_Stage_1240_Item_00()
;BEGIN CODE
;Set by: Ending scenes.

;Give the player the Artifacts.
MQ303.SetStage(150)

;enable post quest dialogue
MQ304_PostQuestDialogue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
;Set by: Ending scenes.

;Give the player the Artifacts.
MQ304.SetStage(150)

;enable post quest dialogue
MQ304_PostQuestDialogue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1260_Item_00
Function Fragment_Stage_1260_Item_00()
;BEGIN CODE
;Set by: Ending scenes.

;Give the player the Artifacts.
MQ303.SetStage(150)
MQ304.SetStage(150)

;enable post quest dialogue
MQ304_PostQuestDialogue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1280_Item_00
Function Fragment_Stage_1280_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: MQ Quest Script, after player obtains the other Artifacts.
;
;Both MQ303 and MQ304 check if the player 
;has all Artifacts from Hunter/Emissary, then set this stage.

;Expose the final Artifact and allow the player to take it.
kMyQuest.SetArtifactStageNoWait(5)

;Update objective.
SetObjectiveCompleted(230)
SetObjectiveCompleted(240)
SetObjectiveCompleted(250)
SetObjectiveCompleted(260)
SetObjectiveDisplayed(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1290_Item_00
Function Fragment_Stage_1290_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest script, player activates the Final Artifact Activator.

;Swap the weather manager in the exterior,
;so it's nice when you teleport outside.
Alias_ExteriorWeatherManagerInitial.TryToDisable()
Alias_ExteriorWeatherManagerFinal.TryToEnable()

;Start the Take Artifact scene.
kMyQuest.TakeFinalArtifact()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE lc165questscript
Quest __temp = self as Quest
lc165questscript kmyQuest = __temp as lc165questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Shifting Quest script, player teleports out of the Temple.

Actor HunterREF = Alias_Hunter.GetActorRef()
Actor EmissaryREF = Alias_Emissary.GetActorRef()
Actor PlayerREF = Game.GetPlayer()
Actor allyRef = Alias_Ally.GetActorRef()

;Ally stops following the player.
if (!GetStageDone(22))     
     SQ_Followers.SetRoleInactive(allyRef)
     allyRef.IgnoreFriendlyHits(False)
EndIf

;Hunter rides in your ship if Ally
If AllyRef == HunterRef
  (SQ_PlayerShip as SQ_PlayerShipScript).AddPassenger(HunterRef)
  HunterREF.EvaluatePackage()
EndIf

;Start cooldwon for Affinity convos
float currentGameTime = Utility.GetCurrentGameTime()
float cooldownTime = (currentGameTime + COM_WantsToTalk_CooldownDays.GetValue())
int i = 0
while i < Alias_Companions.Length
    Alias_Companions[i].GetActorRef().SetValue(COM_WantsToTalk_MQ305_Cooldown, cooldownTime) 
    i += 1
endwhile

;Set the Starborn actor value for who you killed
if HunterREF.IsDead() && EmissaryREF.IsDead()
     MQ_KilledHunter.SetValue(1)
     MQ_KilledEmissary.SetValue(1)
     PlayerREF.SetValue(MQ_Starborn_PreviousKill, 3)
ElseIf EmissaryREF.IsDead()
     MQ_KilledEmissary.SetValue(1)
     PlayerREF.SetValue(MQ_Starborn_PreviousKill, 2)
     COM_WantsToTalkEvent_MQ305.Send()
ElseIf HunterREF.IsDead()
     MQ_KilledHunter.SetValue(1)
     PlayerREF.SetValue(MQ_Starborn_PreviousKill, 1)
     COM_WantsToTalkEvent_MQ305.Send()
Else
     PlayerREF.SetValue(MQ_Starborn_PreviousKill, 0)
EndIf

;Unblock the Temple Doors.
kMyQuest.SetTempleDoorState(False, False)

;Start MQ305 and shut down MQ302A
MQ305.SetStage(10)
MQ302a.Stop()

;Call shutdown functions.
((Self as Quest) as LC165QuestScript).Cleanup()
((Self as Quest) as LC165ShiftingQuestScript).ShutdownShifting()

;Then shut down.
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2500_Item_00
Function Fragment_Stage_2500_Item_00()
;BEGIN CODE
;Set by: Stop stage.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property Alias_MasadaIII_Surface Auto Const Mandatory

ReferenceAlias property Alias_Companion Auto Const Mandatory
RefCollectionAlias property Alias_Followers Auto Const Mandatory
ReferenceAlias property Alias_Ally Auto Const Mandatory
ReferenceAlias property Alias_AllyShip Auto Const Mandatory
ReferenceAlias property Alias_Adversary01 Auto Const Mandatory
ReferenceAlias property Alias_Adversary01Ship Auto Const Mandatory
ReferenceAlias property Alias_Adversary02 Auto Const Mandatory
ReferenceAlias property Alias_Adversary02Ship Auto Const Mandatory
ReferenceAlias property Alias_Emissary Auto Const Mandatory
ReferenceAlias property Alias_Hunter Auto Const Mandatory
ReferenceAlias property Alias_Helix Auto Const Mandatory
ReferenceAlias property Alias_Scorpius Auto Const Mandatory
ReferenceAlias property Alias_StarbornBridge Auto Const Mandatory
ReferenceAlias property Alias_StarbornCourtyard Auto Const Mandatory
ReferenceAlias property Alias_StarbornFire Auto Const Mandatory
ReferenceAlias property Alias_StarbornIce Auto Const Mandatory
ReferenceAlias property Alias_StarbornRuins Auto Const Mandatory

ReferenceAlias Property Alias_EngineeringKey Auto Const Mandatory
ReferenceAlias Property Alias_ExteriorTowerLever Auto Const Mandatory
ReferenceAlias Property Alias_ExteriorDoor Auto Const Mandatory

ReferenceAlias Property Alias_Vectera_Drill Auto Const Mandatory
ReferenceAlias Property Alias_Vectera_Wall Auto Const Mandatory
ReferenceAlias Property Alias_Vectera_DrillHazardTrigger Auto Const Mandatory
ReferenceAlias Property Alias_Vectera_DrillCollision Auto Const Mandatory
ReferenceAlias Property Alias_Vectera_DrillNavcut Auto Const Mandatory

ObjectReference Property LC165_Quickstart_BridgeRef Auto Const Mandatory
ObjectReference Property LC165_Quickstart_CourtyardRef Auto Const Mandatory
ObjectReference Property LC165_Quickstart_EntryRef Auto Const Mandatory
ObjectReference Property LC165_Quickstart_EngineeringRef Auto Const Mandatory
ObjectReference Property LC165_Quickstart_CorridorsRef Auto Const Mandatory
ObjectReference Property LC165_Quickstart_UtilityRef Auto Const Mandatory
ObjectReference Property LC165_Quickstart_ElevatorRef Auto Const Mandatory
ObjectReference Property LC165_Quickstart_RuinsRef Auto Const Mandatory
ObjectReference Property LC165_Quickstart_TempleRef Auto Const Mandatory

Faction Property MQ_EmissaryAllyFaction Auto Const Mandatory
Faction Property MQ_HunterAllyFaction Auto Const Mandatory

Scene property MQ302_100_Space_InitialConfrontBoth Auto Const Mandatory
Scene property MQ302_100_Space_InitialConfrontEmissary Auto Const Mandatory
Scene property MQ302_100_Space_InitialConfrontHunter Auto Const Mandatory
Scene property MQ302_150_Space_AllyArrivesEmissary Auto Const Mandatory
Scene property MQ302_150_Space_AllyArrivesHunter Auto Const Mandatory
Scene property MQ302_190_Space_PostBattleEmissaryAlly Auto Const Mandatory
Scene property MQ302_190_Space_PostBattleHunterAlly Auto Const Mandatory
Scene property MQ302_192_Entrance_Emissary Auto Const Mandatory
Scene property MQ302_192_Entrance_Hunter Auto Const Mandatory
Scene property MQ302_194_ShiftTriggerScene_Emissary Auto Const Mandatory
Scene property MQ302_194_ShiftTriggerScene_Hunter Auto Const Mandatory
Scene property MQ302_196_ShiftTriggerComplete_Emissary Auto Const Mandatory
Scene property MQ302_196_ShiftTriggerComplete_Hunter Auto Const Mandatory
Scene property MQ302_200_VecteraScene01 Auto Const Mandatory
Scene property MQ302_200_VecteraScene02 Auto Const Mandatory
Scene property MQ302_210_ScowScene01 Auto Const Mandatory
Scene property MQ302_211_ShiftTriggerComplete02_Emissary Auto Const Mandatory
Scene property MQ302_211_ShiftTriggerComplete02_Hunter Auto Const Mandatory
Scene property MQ302_215_ElevatorScene01 Auto Const Mandatory
Scene property MQ302_220_EyeScene01 Auto Const Mandatory
Scene property MQ302_220_EyeScene02 Auto Const Mandatory
Scene property MQ302_225_ElevatorScene02 Auto Const Mandatory
Scene property MQ302_310_ConfrontBoth Auto Const Mandatory
Scene property MQ302_310_ConfrontEmissary Auto Const Mandatory
Scene property MQ302_310_ConfrontHunter Auto Const Mandatory
Scene property MQ302_320_Companion_BothDead Auto Const Mandatory
Scene property MQ302_320_Companion_BothPeacefulEnd Auto Const Mandatory
Scene property MQ302_320_Companion_EmissaryDead Auto Const Mandatory
Scene property MQ302_320_Companion_EmissaryPeacefulEnd Auto Const Mandatory
Scene property MQ302_320_Companion_HunterDead Auto Const Mandatory
Scene property MQ302_320_Companion_HunterPeacefulEnd Auto Const Mandatory
Scene property MQ302_400_EmissaryEnd Auto Const Mandatory
Scene property MQ302_400_HunterEnd Auto Const Mandatory
Scene property MQ302_Battle_01_Bridge_BattleStart Auto Const Mandatory
Scene property MQ302_Battle_01_Bridge_ParallelSelfReact Auto Const Mandatory
Scene property MQ302_Battle_02_Courtyard_MassReanimate01 Auto Const Mandatory
Scene property MQ302_Battle_02_Courtyard_MassReanimate02 Auto Const Mandatory
Scene property MQ302_Battle_02_Courtyard_MassReanimate03 Auto Const Mandatory
Scene property MQ302_Battle_03_Engineering_BattleStart Auto Const Mandatory
Scene property MQ302_Battle_03_Engineering_RobotCallout Auto Const Mandatory
Scene property MQ302_Battle_05_Ruins_BattleStart Auto Const Mandatory
Scene property MQ302_Battle_05_Ruins_TeleportReaction Auto Const Mandatory
Scene property MQ302_Battle_06_Adversary_ArtifactWarning Auto Const Mandatory
Scene property MQ302_Battle_06_Adversary_Astral_CombatStart Auto Const Mandatory
Scene property MQ302_Battle_06_Adversary_EmissaryDeath Auto Const Mandatory
Scene property MQ302_Battle_06_Adversary_HunterDeath Auto Const Mandatory
Scene property MQ302_Battle_06_Adversary_Locke_Arrival Auto Const Mandatory
Scene property MQ302_Battle_06_Adversary_Locke_Escaping Auto Const Mandatory
Scene property MQ302_Battle_06_Adversary_Lodge_Arrival Auto Const Mandatory
Scene property MQ302_Battle_06_Adversary_Museum_Arrival Auto Const Mandatory


Quest Property MQ303 Auto Const Mandatory
Quest Property MQ304 Auto Const Mandatory
Quest Property MQ305 Auto Const Mandatory
Quest property MQ304_PostQuestDialogue Auto Const Mandatory

ReferenceAlias Property Alias_MQ302bHeller Auto Const Mandatory

ReferenceAlias Property Alias_MQ302bLin Auto Const Mandatory

ObjectReference Property MQ302b_ScowActorsEnableMarker Auto Const Mandatory

RefCollectionAlias Property Alias_MQ302bScowGuards Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_MQ302bPetrov Auto Const Mandatory

ReferenceAlias Property Alias_MQ302bVadik Auto Const Mandatory

ReferenceAlias Property Alias_MQ302bVladimir Auto Const Mandatory

ReferenceAlias Property Alias_MQ302bOtherYou Auto Const Mandatory

ObjectReference Property LC165_AllyWaitForPlayerMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_BuriedTemplePrequestMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_BuriedTempleMapMarker Auto Const Mandatory

ObjectReference Property LC165_QuestEnableMarkerRef Auto Const Mandatory

ObjectReference Property LC165_QuestDisableMarkerRef Auto Const Mandatory

ObjectReference Property LC165_AllyMeetPlayerOnSurfaceRef Auto Const Mandatory

SQ_FollowersScript Property SQ_Followers Auto Const Mandatory

Faction Property LC165StarbornEnemyFaction Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

ReferenceAlias Property Alias_AdversaryShipLandingPadMarker Auto Const Mandatory

ReferenceAlias Property Alias_StarbornAdversary_Primary Auto Const Mandatory

ReferenceAlias Property Alias_StarbornAdversary_Astral_ExitDoor Auto Const Mandatory

ReferenceAlias Property Alias_StarbornAdversary_Astral_EntryDoor Auto Const Mandatory

WwiseEvent Property WwiseEvent_OBJSecurityScannerExitSuccess Auto Const Mandatory

ReferenceAlias Property Alias_StarbornAdversary_NASAModule_ExitDoor Auto Const Mandatory

RefCollectionAlias Property Alias_StarbornAdversary_Slayton_EntryDoors Auto Const Mandatory

ReferenceAlias Property Alias_StarbornAdversary_Nishina_AlarmActivator01 Auto Const Mandatory

ReferenceAlias Property Alias_StarbornAdversary_Nishina_AlarmActivator02 Auto Const Mandatory

ReferenceAlias Property Alias_StarbornAdversary_Nishina_ExitDoor Auto Const Mandatory

ReferenceAlias Property Alias_ElevatorActivator Auto Const Mandatory

Scene Property MQ302_191_Entrance_EmissaryJoin Auto Const Mandatory

Scene Property MQ302_191_Entrance_HunterJoin Auto Const Mandatory

ObjectReference Property LC165_SpaceOriginMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ObjectReference Property LC165_Quickstart_Surface Auto Const Mandatory

ReferenceAlias Property Alias_BuriedTempleQuestDisableMarker Auto Const Mandatory

ReferenceAlias Property Alias_BuriedTempleQuestEnableMarker Auto Const Mandatory

ActorValue Property MQ_Starborn_PreviousKill Auto Const Mandatory

Keyword Property AnimFaceArchetypeSad Auto Const Mandatory

LocationAlias Property Alias_LC165BuriedTempleSpaceLocation Auto Const Mandatory

LocationAlias Property Alias_LC165BuriedTempleLocation Auto Const Mandatory

ReferenceAlias Property Alias_ExteriorWeatherManagerInitial Auto Const Mandatory
ReferenceAlias Property Alias_ExteriorWeatherManagerFinal Auto Const Mandatory

Keyword Property AnimFaceArchetypeEyesClosed Auto Const Mandatory

Keyword Property AnimFaceArchetypeDying Auto Const Mandatory

RefCollectionAlias Property Alias_StarbornAdversary_Astral_Dancers Auto Const Mandatory

Keyword Property AnimArchetypeMQ204A_030_MaleReactsToMale Auto Const Mandatory

RefCollectionAlias Property Alias_StarbornBridge_ChargerTeleportPoints Auto Const Mandatory

Keyword Property AnimArchetypeMQ204A_030_MaleReactsToFemale Auto Const Mandatory

Keyword Property AnimArchetypeMQ204A_030_FemaleReactsToMale Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

Quest Property MQ302a Auto Const Mandatory

AffinityEvent Property COM_WantsToTalkEvent_MQ305 Auto Const Mandatory

GlobalVariable Property MQ_KilledEmissary Auto Const Mandatory

GlobalVariable Property MQ_KilledHunter Auto Const Mandatory

Quest Property MQ302c Auto Const Mandatory

ObjectReference Property TheHelixShipREF Auto Const Mandatory

ObjectReference Property TheScorpiusShipREF Auto Const Mandatory

RefCollectionAlias Property Alias_StarbornAdversary_Astral_RefsAll Auto Const Mandatory

ReferenceAlias[] Property Alias_Companions Auto Const Mandatory

GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const Mandatory

ActorValue Property COM_WantsToTalk_MQ305_Cooldown Auto Const Mandatory

Faction Property ConstellationFaction Auto Const Mandatory
