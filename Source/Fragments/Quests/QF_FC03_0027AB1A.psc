;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC03_0027AB1A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Debug stage

;give player a ship
Frontier_ModularREF.moveto(SettleWaggonerFarm_ShipLandingMarkerRef)
Frontier_ModularREF.setlinkedref(SettleWaggonerFarm_ShipLandingMarkerRef, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

; Complete the preceeding quests
FC01.SetStage(2000)
FC01_Postquest.SetStage(2000)
FC02.SetStage(2000)

; Add the player to the Freestar Ranger faction
Alias_Player.GetActorRef().AddToFaction(FreestarRangerFaction)

; Move player & actors into position
Alias_Player.GetRef().MoveTo(FC03_PT1)
Alias_Hannah.GetRef().MoveTo(FC03_PT1_Hannah)
Alias_Blake.GetRef().MoveTo(FC03_DebriefScene_BlakeMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Set at quest start

SetActive()
SetObjectiveDisplayed(100)

; Lock Hope office door
Alias_HopeOfficeDoor.GetRef().Lock()
Alias_HopeOfficeDoor.GetRef().SetLockLevel(255)

; Set Nia's injured global to control her dialogue
NiaKaluIsInjured.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Set from change location alias script A on player alias

SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Debug stage
; TODO Remove in final pass

Alias_Hannah.GetRef().MoveTo(FC03_PT2_Hannah)
Alias_Player.GetRef().MoveTo(FC03_PT2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Set at the end of Blake and Carson first debriefing scene

; evp Blake
Alias_Blake.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
; Set in stage 310

; Move Emma to the debnrief scene
Alias_Hannah.GetRef().MoveTo(FC03_EmmaDebriefMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; Set in the first line of Blake's forcegreet scene

; Move Emma into the scene
SetStage(305)

; evp Blake
Alias_Blake.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Set at the end of Blake's forcegreet scene

; evp Blake
Alias_Blake.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(300)
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Set at the end of Diego's greet scene

SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Set at the end of Blake's greet 02 scene

; evp Emma
Alias_Emma.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(600)
SetObjectiveDisplayed(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Set at the end of Blake's Greet 03 scene

Alias_Player.GetActorRef().RemoveItem(Alias_JobsDoneSlate.GetRef())

; Enable and damage Nia's ship
Alias_NiaKaluShip.GetRef().Enable()
Alias_NiaKaluShip.GetShipRef().EnablePartRepair(Health, false)
float fBlastDamage03 = Alias_NiaKaluShip.GetShipRef().GetBaseValue(Health) * 0.8
Alias_NiaKaluShip.GetShipRef().DamageValue(Health, fBlastDamage03)
Alias_Nia.GetActorRef().SetRestrained()

; Move Nia to her ship
Alias_Nia.GetRef().MoveTo(FC03_NiaWoundedMarkerRef)

SetObjectiveCompleted(200)
SetObjectiveDisplayed(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1025_Item_00
Function Fragment_Stage_1025_Item_00()
;BEGIN CODE
; Set when the player changes location to Polvo orbit post stage 

; Start Nia distress call scene
FC03_NiaDistressCallScene.Start()

; Set global to prevent scanning scene from interrupting Nia scene
SQ_GuardShipsWaitToScan.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1030_Item_00
Function Fragment_Stage_1030_Item_00()
;BEGIN CODE
SQ_GuardShipsWaitToScan.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
; Set at the end of Nia's distress call scene

SetObjectiveCompleted(850)
SetObjectiveDisplayed(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; Set when player changes location into Nia's ship

SetObjectiveCompleted(950)
SetObjectiveDisplayed(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
; Not used

Alias_Nia.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1160_Item_00
Function Fragment_Stage_1160_Item_00()
;BEGIN CODE
; Set at the end of Nia's greet on the ship scene

SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1050)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1162_Item_00
Function Fragment_Stage_1162_Item_00()
;BEGIN CODE
; Check for other repairs, set stage 1170 if all done
if GetStageDone(1164) && GetStageDone(1166)
  SetStage(1170)
endif

; Prevent further activation of this repair panel
Alias_RepairPanel01.GetRef().BlockActivation(true, true)

; Disable the damage fx on the panel
Alias_RepairPanel01_FX.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1164_Item_00
Function Fragment_Stage_1164_Item_00()
;BEGIN CODE
; Check for other repairs, set stage 1170 if all done
if GetStageDone(1162) && GetStageDone(1166)
  SetStage(1170)
endif

; Prevent further activation of this repair panel
Alias_RepairPanel02.GetRef().BlockActivation(true, true)

; Disable the damage fx on the panel
Alias_RepairPanel02_FX.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1166_Item_00
Function Fragment_Stage_1166_Item_00()
;BEGIN CODE
; Check for other repairs, set stage 1170 if all done
if GetStageDone(1162) && GetStageDone(1164)
  SetStage(1170)
endif

; Prevent further activation of this repair panel
Alias_RepairPanel03.GetRef().BlockActivation(true, true)

; Disable the damage fx on the panel
Alias_RepairPanel03_FX.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1170_Item_00
Function Fragment_Stage_1170_Item_00()
;BEGIN CODE
; Set when final repair is done

if IsObjectiveDisplayed(1000)
  SetObjectiveDisplayed(1000, false)
endif

if IsObjectiveDisplayed(1050)
  SetObjectiveCompleted(1050)
endif

SetObjectiveDisplayed(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1180_Item_00
Function Fragment_Stage_1180_Item_00()
;BEGIN CODE
; Set in phase 5 of FC03_NiaGreetRepairsDoneScene

SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1182_Item_00
Function Fragment_Stage_1182_Item_00()
;BEGIN CODE
; Start up the space encounter quest
FC03_SpaceEncounterQuest.Start()

SetObjectiveCompleted(1110)
SetObjectiveDisplayed(1125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1185_Item_00
Function Fragment_Stage_1185_Item_00()
;BEGIN CODE
; Set in script when the player returns to their ship after stage 1180
; Tells Nia's ship to land at HopeTech
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1190_Item_00
Function Fragment_Stage_1190_Item_00()
;BEGIN CODE
; Set when final outlaw ship dies

SetObjectiveCompleted(1125)
SetObjectiveDisplayed(1130)

; Start Nia's ship landing scene
FC03_NiaShipLandingScene.Start()

; EVP Nia's ship
Alias_NiaKaluShip.GetActorRef().EvaluatePackage()

; Move Nia to HopeTech
Alias_Nia.GetRef().MoveTo(FC03_NiaWaitMarker)

; Move Nia's ship to HopeTown landing pad
Alias_NiaKaluShip.GetRef().MoveTo(HopetownLandingMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1192_Item_00
Function Fragment_Stage_1192_Item_00()
;BEGIN CODE
; Set when the player changes location to HopeTown after stage 1190

; Remove the grav immunity keyword from Nia
Alias_Nia.GetActorRef().RemoveKeyword(Artifact_GravImmune)
Alias_Nia.GetActorRef().SetRestrained(False)

; Remove Nia's injured dialogue control global
; Set Nia's injured global to control her dialogue
NiaKaluIsInjured.SetValue(0)

SetObjectiveCompleted(1130)
SetObjectiveDisplayed(1150)

;Move Brigit and Hope to Hope's office for her scene
Alias_Birgit.GetRef().MoveTo(FC03_Birgit_St1300Marker)
Alias_Ron.GetRef().MoveTo(FC03_Ron_St1400Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1195_Item_00
Function Fragment_Stage_1195_Item_00()
;BEGIN CODE
Alias_Nia.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
; Start Nia's walk and talk scene
FC03_NiaWalkTalkScene.Start()

; Unlock Hope office door
Alias_HopeOfficeDoor.GetRef().Unlock()
Alias_HopeOfficeDoor.GetRef().SetOpen(False)

SetObjectiveCompleted(1150)
SetObjectiveDisplayed(1170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
; Set at the end of Nia's walk and talk scene
; The trigger is in HopeTech on the factory floor

FC03_HopeIntroScene.Start()

; EVP Cosette
Alias_Cosette.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
; Set in phase 7, action 9 of Ron Hope intro scene
; Conditions Birgit's packages

; evp Birgit and Nia
Alias_Birgit.GetActorRef().EvaluatePackage()
Alias_Nia.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
; Set at the end of the Hope intro scene

; EVP to push Ron Hope into forcegreet
Alias_Ron.GetActorRef().EvaluatePackage()

; Re-enable the Polvo SysDef guard ships
Alias_GuardShips.EnableAll()

SetObjectiveCompleted(1170)
SetObjectiveDisplayed(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
; Set at the end of Hope's greet 01 scene

;FC03_CosetteInterruptScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1550_Item_00
Function Fragment_Stage_1550_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1200)
SetObjectiveDisplayed(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
; Set at the end of Cosette's interrupting scene

SetObjectiveCompleted(1300)
SetObjectiveDisplayed(1400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_00
Function Fragment_Stage_1700_Item_00()
;BEGIN CODE
; Set in the question loop of Nia's last scene
; Give the player some ammo
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
; Set when Nia's final dialogue scene completes

CompleteAllObjectives()

; set the quest completion actor value
Alias_Player.GetActorRef().SetValue(FC03_Completed, 1)

; Start next quest
FC04.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Blake Auto Const Mandatory

ObjectReference Property FC03_DebriefScene_BlakeMarker Auto Const Mandatory

ReferenceAlias Property Alias_Hannah Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ObjectReference Property FC03_PT1 Auto Const Mandatory

ObjectReference Property FC03_PT1_Hannah Auto Const Mandatory

ObjectReference Property FC03_PT2_Hannah Auto Const Mandatory

ReferenceAlias Property Alias_Emma Auto Const Mandatory

Key Property FC03_ArmoryLockerKey Auto Const Mandatory

Scene Property FC03_HopeIntroScene Auto Const Mandatory

Scene Property FC03_CosetteInterruptScene Auto Const Mandatory

Quest Property FC01 Auto Const Mandatory

ObjectReference Property FC03_PT2 Auto Const Mandatory

Quest Property FC04 Auto Const Mandatory

ReferenceAlias Property Alias_Birgit Auto Const Mandatory

ReferenceAlias Property Alias_Ron Auto Const Mandatory

Scene Property FC03_ConcludeDebriefing Auto Const Mandatory

Scene Property FC03_NiaDistressCallScene Auto Const Mandatory

ReferenceAlias Property Alias_NiaKaluShip Auto Const Mandatory

Message Property FC03_RepairMSG Auto Const Mandatory

ObjectReference Property FC03_Nia_St1300SceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_Nia Auto Const Mandatory

ReferenceAlias Property Alias_Cosette Auto Const Mandatory

ReferenceAlias Property Alias_HopeOfficeDoor Auto Const Mandatory

ObjectReference Property FC03_NiaWoundedMarkerRef Auto Const Mandatory

Quest Property FC03_SpaceEncounterQuest Auto Const Mandatory

LocationAlias Property Alias_HopeTechLocation Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

ObjectReference Property SettleWaggonerFarm_ShipLandingMarkerRef Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

LocationAlias Property Alias_NiaKaluShipLocation Auto Const Mandatory

ObjectReference Property FC03_StartQuestTriggerRef Auto Const Mandatory

Quest Property FC01_PostQuest Auto Const Mandatory

Quest Property FC02 Auto Const Mandatory

ObjectReference Property FC03_EmmaDebriefMarker Auto Const Mandatory

Scene Property FC03_NiaShipLandingScene Auto Const Mandatory

Scene Property FC03_NiaWalkTalkScene Auto Const Mandatory

ObjectReference Property FC03_Birgit_St1300Marker Auto Const Mandatory

ObjectReference Property FC03_NiaWaitMarker Auto Const Mandatory

ObjectReference Property FC03_Ron_St1400Marker Auto Const Mandatory

Faction Property FreestarRangerFaction Auto Const Mandatory

RefCollectionAlias Property Alias_GuardShips Auto Const Mandatory

ActorValue Property FC03_Completed Auto Const Mandatory

GlobalVariable Property NiaKaluIsInjured Auto Const Mandatory

ObjectReference Property HopetownLandingMarker_NonPlayer Auto Const Mandatory

ObjectReference Property HopetownLandingMarker Auto Const Mandatory

ReferenceAlias Property Alias_RepairPanel01 Auto Const Mandatory

ReferenceAlias Property Alias_RepairPanel02 Auto Const Mandatory

ReferenceAlias Property Alias_RepairPanel03 Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

ReferenceAlias Property Alias_JobsDoneSlate Auto Const Mandatory

ReferenceAlias Property Alias_RepairPanel03_FX Auto Const Mandatory

ReferenceAlias Property Alias_RepairPanel02_FX Auto Const Mandatory

ReferenceAlias Property Alias_RepairPanel01_FX Auto Const Mandatory

Keyword Property Artifact_GravImmune Auto Const Mandatory

GlobalVariable Property SQ_GuardShipsWaitToScan Auto Const Mandatory
