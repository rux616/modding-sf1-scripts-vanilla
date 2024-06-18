;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC05_001F0267 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Alias_Player.GetRef().MoveTo(FC05_PT1)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
; Set in change location quest script when players reaches Porrima III

SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)

; enable Jade
Alias_Jade.GetRef().Enable()
Alias_AutumnMacMillan.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Start Autumn's walk to table scene
FC05_AutumnPathToTableScene.Start()

SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
if Alias_Player.GetActorRef().GetFurnitureUsing() == Alias_PlayerChair.GetRef()
  SetStage(500)
  FC05_AutumnPathToTableScene.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Enable Jade
Alias_Jade.GetRef().Enable()

; Start Jade's scene to walk to the table
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(200)
  SetObjectiveCompleted(200)
endif

SetObjectiveCompleted(300)
SetObjectiveDisplayed(350)

; Start Jade's scene
FC05_JadeStage500Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(350)
SetObjectiveDisplayed(400)

;Add the player to the alias so they can't run FFRedMileR01 
;while running the Red Mile here
Alias_PlayerRunningRedMile.ForceRefTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
PlayerMetMeiDevine.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

PlayerMetMeiDevine.SetValue(1)

FC05_MeiAnnounceRunScene.Start()

Alias_StageLightsEnableMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
Alias_StageLightsEnableMarker.GetReference().Enable()
FC05_MeiRulesScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

;Open Starting door
Alias_DoorLightsEnableMarker.GetRef().Enable()
Alias_RedMileStartingDoor.GetRef().SetOpen(True)
;Turn off stage lights
Alias_StageLightsEnableMarker.GetRef().Disable()

Alias_MeiDevine.GetActorRef().BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_01
Function Fragment_Stage_0800_Item_01()
;BEGIN AUTOCAST TYPE ffredmiler01questscript
Quest __temp = self as Quest
ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
;END AUTOCAST
;BEGIN CODE
;Clean up existing creatures, spawn new ones
kmyQuest.SpawnCreatures(0)

;Disable Fast Travel while the player is running the course
kmyQuest.RMDisableFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
; Used to condition out dialogue
; This stage should never be set
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE ffredmiler01questscript
Quest __temp = self as Quest
ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(900)

; Play Mei's scene directing the player to the stash
FC05_MeiSpeakerScene.Start()

;Spawn new creatures after the Player hits the button
kmyQuest.SpawnCreatures(1)

; DEPRECATED
; Open the stash room door
;Alias_StashRoomDoor.GetRef().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN AUTOCAST TYPE ffredmiler01questscript
Quest __temp = self as Quest
ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
;END AUTOCAST
;BEGIN CODE
Alias_MeiDevine.GetActorRef().EvaluatePackage()

;Reenable Fast Travel after the player finishes their Red Mile run.
kmyQuest.RMEnableFastTravel()

;Turn off door lights
Alias_DoorLightsEnableMarker.GetRef().Disable()

;Update the value tracking how many times the player has run the Red Mile
;and updates the count for DialogueRedMile as well.
PlayerCompletedRedMile.Mod(1)
DialogueRedMile.UpdateCurrentInstanceGlobal(PlayerCompletedRedMile)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN AUTOCAST TYPE ffredmiler01questscript
Quest __temp = self as Quest
ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)

;Changes the text for the FFRedMileR01Misc Objective
If FFRedMileR01Misc.IsRunning() && FFRedMileR01Misc.GetStageDone(110)
	FFRedMileR01Misc.SetStage(120)
EndIf

;Remove the player from the alias so they can run FFRedMileR01
Alias_PlayerRunningRedMile.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1201_Item_00
Function Fragment_Stage_1201_Item_00()
;BEGIN CODE
If FFRedMileR01Misc.IsRunning() && !FFRedMileR01Misc.GetStageDone(1000)
  FFRedMileR01Misc.SetObjectiveDisplayed(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
Alias_AutumnMacMillan.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
;FC05_MarcoShipEnableMarker.Enable()

Alias_MarcoStarshipMapMarker.GetRef().AddToMapScanned(true)
Alias_MarcoStarshipMapMarker.GetRef().SetMarkerVisibleOnStarMap(True)
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1605_Item_00
Function Fragment_Stage_1605_Item_00()
;BEGIN CODE
; Set in change location quest script when players reaches Codos

SetObjectiveCompleted(1200)
SetObjectiveDisplayed(1400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1610_Item_00
Function Fragment_Stage_1610_Item_00()
;BEGIN CODE
;tell the doorman to evaluate his package so he doesn't forcegreet

Alias_MarcoDoorman.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1650_Item_00
Function Fragment_Stage_1650_Item_00()
;BEGIN CODE
FC05_GuardWelcomeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_00
Function Fragment_Stage_1700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1400)
SetObjectiveDisplayed(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1705_Item_00
Function Fragment_Stage_1705_Item_00()
;BEGIN CODE
; Start the confrontation with Marco scene
FC05_MarcoScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1710_Item_00
Function Fragment_Stage_1710_Item_00()
;BEGIN CODE
Alias_MarcoGraziani.GetActorRef().EvaluatePackage()

; Move the companion into the room
Alias_Companion.GetRef().MoveTo(FC05_PTMarco)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1760_Item_00
Function Fragment_Stage_1760_Item_00()
;BEGIN CODE
Alias_Player.GetActorRef().AddItem(Credits, NPCDemandMoney_Medium.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1770_Item_00
Function Fragment_Stage_1770_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1500)
SetObjectiveCompleted(1600)

Alias_Player.GetActorRef().AddItem(Alias_MarcoSlate.GetRef())

SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN CODE
; Add player to Marco enemy faction

Alias_Player.GetActorRef().AddToFaction(FC05_MarcoEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1900_Item_00
Function Fragment_Stage_1900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1500)
SetObjectiveDisplayed(1600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1600)
SetObjectiveDisplayed(1700)

; increment encrypted slate AV
Alias_Player.GetReference().ModValue(FC_EncryptedSlatesCollectedAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; set the quest completion actor value
Alias_Player.GetActorRef().SetValue(FC05_Completed, 1)

; Remove the slate
Alias_Player.GetActorRef().RemoveItem(Alias_MarcoSlate.GetRef())

; Start FC07 if FC06 has been completed
;if (FC06.IsCompleted())
; FC07.Start()
;endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Jade Auto Const Mandatory

Scene Property FC05_JadeStage500Scene Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ObjectReference Property FC05_PT1 Auto Const Mandatory

Scene Property FC05_AutumnPathToTableScene Auto Const Mandatory

Scene Property FC05_MeiAnnounceRunScene Auto Const Mandatory

Scene Property FC05_MeiRulesScene Auto Const Mandatory

Scene Property FC05_MeiSpeakerScene Auto Const Mandatory

ReferenceAlias Property Alias_StashRoomDoor Auto Const Mandatory

Faction Property FC05_MarcoEnemyFaction Auto Const Mandatory

ObjectReference Property FC05_MarcoShipEnableMarker Auto Const Mandatory

ActorValue Property FC_EncryptedSlatesCollectedAV Auto Const Mandatory

Quest Property FC_EncryptedSlateQuest Auto Const Mandatory

ReferenceAlias Property Alias_MeiDevine Auto Const Mandatory

ReferenceAlias Property Alias_AutumnMacMillan Auto Const Mandatory

ReferenceAlias Property Alias_MarcoGraziani Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_MarcoSlate Auto Const Mandatory

Scene Property FC05_GuardWelcomeScene Auto Const Mandatory

ReferenceAlias Property Alias_MarcoStarshipMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_MarcoDoorman Auto Const

Quest Property FFRedMileR01Misc Auto Const Mandatory

ReferenceAlias Property Alias_PlayerRunningRedMile Auto Const Mandatory

ReferenceAlias Property Alias_StageLightsEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_RedMileStartingDoor Auto Const Mandatory

ReferenceAlias Property Alias_DoorLightsEnableMarker Auto Const Mandatory

ActorValue Property FC05_Completed Auto Const Mandatory

Scene Property FC05_MarcoScene Auto Const Mandatory

GlobalVariable Property PlayerCompletedRedMile Auto Const Mandatory

Quest Property DialogueRedMile Auto Const Mandatory

ReferenceAlias Property Alias_PlayerChair Auto Const Mandatory

GlobalVariable Property PlayerMetMeiDevine Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Medium Auto Const Mandatory

ObjectReference Property FC05_PTMarco Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory
