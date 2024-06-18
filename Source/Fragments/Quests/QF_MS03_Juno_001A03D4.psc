;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS03_Juno_001A03D4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;kill the ryujin ship
Alias_RyujinShip.GetShipRef().Kill()

;set the agents as essential
Alias_RyujinOperative1.GetActorReference().SetEssential(True)
Alias_RyujinOperative2.GetActorReference().SetEssential(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Player.GetActorReference().AddPerk(MS03_JunoActivationPromptPerk)
SetObjectiveCompleted(10)
MS03_Juno_Space_PostCombat.Start()
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
debug.Trace(self + ": Stage 101")

;FAST FORWARD THROUGH PREVIOUS STAGES
SetStage(10)

;STOP SCENES
((self as quest) as DebugStopAllScenesQuestScript).StopAllScenes()

;SET CURRENT STATE / STAGE
Alias_EclipticShips.KillAll()
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
MS03_Juno_Arrival.Start()
SetObjectiveDisplayed(110)

JunoActivationVolume.BlockActivation(true,true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0111_Item_00
Function Fragment_Stage_0111_Item_00()
;BEGIN CODE
debug.Trace(self + ": Stage 111")

;FAST FORWARD THROUGH PREVIOUS STAGES
SetStage(10)
SetStage(101)

;STOP SCENES
((self as quest) as DebugStopAllScenesQuestScript).StopAllScenes()

;SET CURRENT STATE / STAGE
Game.GetPlayer().MoveTo(Alias_InsideShipStartMarker.GetReference())
Alias_PlayerShip.GetShipReference().InstantDock(Alias_JunoShip.GetShipReference())
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0112_Item_00
Function Fragment_Stage_0112_Item_00()
;BEGIN CODE
Juno00.PlayAnimation("Play01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(200)

;telling ryujin operatives to evaluate package
Alias_RyujinOperative2.GetActorRef().EvaluatePackage()
Alias_RyujinOperative1.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
debug.Trace(self + ": Stage 201")

;FAST FORWARD THROUGH PREVIOUS STAGES
SetStage(10)
SetStage(101)
SetStage(111)

;STOP SCENES
((self as quest) as DebugStopAllScenesQuestScript).StopAllScenes()

;SET CURRENT STATE / STAGE
Game.GetPlayer().MoveTo(Alias_SceneStartMarker.GetReference())
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Alias_Player.GetActorReference().AddPerk(MS03_JunoActivationPromptPerk)

SetObjectiveCompleted(200)

;commenting this out since player no longer is able to place control board outside of dialogue
;SetObjectiveDisplayed(300)

;give the player the control board
Alias_RyujinOperative1.GetRef().RemoveItem(Alias_ControlBoard.GetRef())
Game.GetPlayer().AddItem(Alias_ControlBoard.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
debug.Trace(self + ": Stage 301")

;FAST FORWARD THROUGH PREVIOUS STAGES
SetStage(10)
SetStage(101)
SetStage(111)
SetStage(201)

;STOP SCENES
((self as quest) as DebugStopAllScenesQuestScript).StopAllScenes()

;SET CURRENT STATE / STAGE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(350)

;Change ship name to "Juno"
Alias_JunoMysteriousName.ForceRefTo(None)

JunoActivationVolume.BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0351_Item_00
Function Fragment_Stage_0351_Item_00()
;BEGIN CODE
debug.Trace(self + ": Stage 351")

;FAST FORWARD THROUGH PREVIOUS STAGES
SetStage(10)
SetStage(101)
SetStage(111)
SetStage(201)
SetStage(301)

;STOP SCENES
((self as quest) as DebugStopAllScenesQuestScript).StopAllScenes()

;SET CURRENT STATE / STAGE
SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;remove invulnerability from Ryujin agents
Alias_RyujinOperative1.GetActorReference().SetEssential(False)
Alias_RyujinOperative2.GetActorReference().SetEssential(False)
Alias_RyujinOperative1.GetActorReference().SetGhost(False)
Alias_RyujinOperative2.GetActorReference().SetGhost(False)

SetObjectiveCompleted(350)
SetObjectiveDisplayed(352)
SetObjectiveDisplayed(355)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0356_Item_00
Function Fragment_Stage_0356_Item_00()
;BEGIN CODE
debug.Trace(self + ": Stage 356")

;FAST FORWARD THROUGH PREVIOUS STAGES
SetStage(10)
SetStage(101)
SetStage(111)
SetStage(201)
SetStage(301)
SetStage(351)

;STOP SCENES
((self as quest) as DebugStopAllScenesQuestScript).StopAllScenes()

;SET CURRENT STATE / STAGE
SetStage(355)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveSkipped(300)
SetObjectiveCompleted(355)
SetStage(550)

;setting ryujin peeps back to essential
Alias_RyujinOperative1.GetActorReference().SetEssential(true)
Alias_RyujinOperative2.GetActorReference().SetEssential(true)

;Removing control board from player inventory
Game.GetPlayer().RemoveItem(Alias_ControlBoard.GetRef())
Alias_RyujinOperative1.GetActorRef().AddItem(Alias_ControlBoard.GetRef())

;set the ryujin operatives as ghost so they can't turn hostile
Alias_RyujinOperative1.GetActorReference().SetGhost(true)
Alias_RyujinOperative2.GetActorReference().SetGhost(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN CODE
debug.Trace(self + ": Stage 401")

;FAST FORWARD THROUGH PREVIOUS STAGES
SetStage(10)
SetStage(101)
SetStage(111)
SetStage(201)
SetStage(301)
SetStage(351)
SetStage(356)


;STOP SCENES
((self as quest) as DebugStopAllScenesQuestScript).StopAllScenes()

;SET CURRENT STATE / STAGE
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
if GetStageDone(420) ;killed other one too
   SetStage(490)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
if GetStageDone(410) ;killed other one too
   SetStage(490)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
SetObjectiveCompleted(355)
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0491_Item_00
Function Fragment_Stage_0491_Item_00()
;BEGIN CODE
debug.Trace(self + ": Stage 491")

;FAST FORWARD THROUGH PREVIOUS STAGES
SetStage(10)
SetStage(101)
SetStage(111)
SetStage(201)
SetStage(301)
SetStage(351)
SetStage(356)

;STOP SCENES
((self as quest) as DebugStopAllScenesQuestScript).StopAllScenes()

;SET CURRENT STATE / STAGE
Alias_RyujinOperative1.TryToKill()
Alias_RyujinOperative2.TryToKill()
SetStage(490)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_Player.GetActorReference().RemovePerk(MS03_JunoActivationPromptPerk)
SetObjectiveCompleted(300)
SetObjectiveCompleted(352)
;SetObjectiveSkipped(355)
SetObjectiveDisplayed(500)

if IsObjectiveDisplayed(350)
  SetObjectiveDisplayed(350,0)
endif

;set Ryujin peeps to be essential again, add player to their faction
Game.GetPlayer().AddToFaction(RyujinFaction)
Alias_RyujinOperative1.GetActorReference().SetEssential(true)
Alias_RyujinOperative2.GetActorReference().SetEssential(true)
Alias_RyujinOperative1.GetActorReference().IgnoreFriendlyHits(true)
Alias_RyujinOperative2.GetActorReference().IgnoreFriendlyHits(true)

;Remove control board from player inventory
Game.GetPlayer().RemoveItem(Alias_ControlBoard.GetRef())

;set outcome global variable value to 1 (Juno goes insane)
MS03Outcome.SetValue(1)

;block activation on juno
Juno00.BlockActivation(true,true)

;turn off screens
;Juno00.PlayAnimation("Play00")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0501_Item_00
Function Fragment_Stage_0501_Item_00()
;BEGIN CODE
debug.Trace(self + ": Stage 501")

;FAST FORWARD THROUGH PREVIOUS STAGES
SetStage(10)
SetStage(101)
SetStage(111)
SetStage(201)
SetStage(301)
SetStage(351)
SetStage(356)

;STOP SCENES
((self as quest) as DebugStopAllScenesQuestScript).StopAllScenes()

;SET CURRENT STATE / STAGE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetObjectiveSkipped(300)
SetObjectiveDisplayed(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveCompleted(550)
SetObjectiveDisplayed(600)

if IsObjectiveDisplayed(350)
  SetObjectiveDisplayed(350, 0)
endif

;unlock the door 
JunoDoor.Unlock()
JunoDoor.SetOpen()

;display objective and make ryujin people passengers if you were able to convince them
if GetStageDone(400)
  SetObjectiveDisplayed(400)
  kmyquest.AddPassenger(Alias_RyujinOperative1)
  kmyquest.AddPassenger(Alias_RyujinOperative2)
endif

;block activation on Juno
Juno00.BlockActivation(true,true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0601_Item_00
Function Fragment_Stage_0601_Item_00()
;BEGIN CODE
debug.Trace(self + ": Stage 401")

;FAST FORWARD THROUGH PREVIOUS STAGES
SetStage(10)
SetStage(101)
SetStage(111)
SetStage(201)
SetStage(301)
SetStage(351)
SetStage(356)
SetStage(401)

;STOP SCENES
((self as quest) as DebugStopAllScenesQuestScript).StopAllScenes()

;SET CURRENT STATE / STAGE
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)

;set docking permissions on Juno
Alias_JunoShip.GetShipRef().SetValue(DockingPermission, 4)

MS03_Juno_JumpAway_Switchboard.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)

;remove ghost and essential status from Juno_ship
Alias_Junoship.GetShipRef().SetGhost(false)
Alias_Junoship.GetShipRef().IsEssential(false)

;Juno "jumps away" back to holding cell:
SpaceshipReference shipRef = Alias_JunoShip.GetShipReference()
shipRef.DisableWithGravJump()
shipRef.MoveTo(Alias_JunoHoldingCellMarker.GetReference())

if GetStageDone(400) == false
	;complete quest:
	setStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)

;complete quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;if not delivering passengers, shut down now
if GetStageDone(400) == false
   SetStage(9999)
endif
;otherwise wait for the DefaultPassengerQuestScript to set the shutdown stage

;Reactive SE
float currentGameTime = Utility.GetCurrentGameTime()
SE_Player_FAB19a_Timestamp.SetValue(currentGameTime + cooldownDays)
SE_Player_FAB19b_Timestamp.SetValue(currentGameTime + cooldownDays)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN CODE
;disable ryujin operatives
Alias_RyujinOperative1.GetActorRef().Disable()
Alias_RyujinOperative2.GetActorRef().Disable()

;shutdown quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MS03_Juno_Arrival Auto Const Mandatory

Scene Property MS03_Juno_Space_PostCombat Auto Const Mandatory

ReferenceAlias Property Alias_RyujinOperative1 Auto Const Mandatory

ReferenceAlias Property Alias_RyujinOperative2 Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Perk Property MS03_JunoActivationPromptPerk Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_RyujinShip Auto Const Mandatory

ReferenceAlias Property Alias_JunoMysteriousName Auto Const Mandatory

RefCollectionAlias Property Alias_EclipticShips Auto Const Mandatory

ReferenceAlias Property Alias_InsideShipStartMarker Auto Const Mandatory

Scene Property MS03_Space_Initial Auto Const Mandatory

ReferenceAlias Property Alias_SceneStartMarker Auto Const Mandatory

ReferenceAlias Property Alias_JunoShip Auto Const Mandatory

ReferenceAlias Property Alias_JunoHoldingCellMarker Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Scene Property MS03_Juno_JumpAway_Switchboard Auto Const Mandatory

ReferenceAlias Property Alias_ControlBoard Auto Const Mandatory

GlobalVariable Property MS03Outcome Auto Const

ObjectReference Property SoundMarkerEnabler Auto Const

WwiseEvent Property JunoShutdownEvent Auto Const

ObjectReference Property Juno00 Auto Const

ActorValue Property DockingPermission Auto Const

ObjectReference Property JunoActivationVolume Auto Const

ObjectReference Property JunoDoor Auto Const

Faction Property RyujinFaction Auto Const

GlobalVariable Property SE_Player_FAB19a_Timestamp Auto Const Mandatory

Float Property cooldownDays Auto Const Mandatory

GlobalVariable Property SE_Player_FAB19b_Timestamp Auto Const Mandatory
