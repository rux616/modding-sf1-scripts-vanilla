;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC06_001F0266 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_Player.GetActorRef().AddItem(Credits, 500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; This quest is started in stage 2000 of quest FC04

SetActive()
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)

FC06_ClinicSystemsDisrupted.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Set at the end of Ben's first scene

SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Start walk and talk scene
FC06_BenWalkAndTalkScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Set when Ben's walk and talk scene travel package completes

; Start scene between Ben and Ari
FC06_BenAriScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Set at the end of Ben and Ari's scene together

Alias_BenArmistead.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; Set at the end of Ari's first greet scene

FC06_AriWalkToTerminal.Start()

SetObjectiveCompleted(300)
SetObjectiveDisplayed(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
; Set at the end of Ari's scene to travel to his terminal

FC06_AriSearchRecords.Start()

SetObjectiveCompleted(310)
SetObjectiveDisplayed(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
; Set at the end of Ari's scene to search the patient records

SetObjectiveCompleted(320)
SetObjectiveDisplayed(330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
Alias_AriMiller.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(350)

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Set at the end of Ari's first scene

SetObjectiveCompleted(330)
SetObjectiveDisplayed(400)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
SetObjectiveCompleted(350)
SetObjectiveDisplayed(400, false)
SetObjectiveDisplayed(500, false)
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
Setstage(700)

; Give the player bribe credits
int CreditAmountSmall = NPCDemandMoney_Small.GetValue() as int
int CreditAmountLarge = NPCDemandMoney_Large.GetValue() as int

if GetStageDone(760)
  Alias_PLayer.GetActorRef().AddItem(credits, CreditAmountLarge)
else
  Alias_PLayer.GetActorRef().AddItem(credits, CreditAmountSmall)
endIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0580_Item_00
Function Fragment_Stage_0580_Item_00()
;BEGIN CODE
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Set somehow

SetObjectiveCompleted(400)

if GetStageDone(700)
  SetStage(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Set somehow
SetObjectiveCompleted(500)

if GetStageDone(600)
  SetStage(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Set in stages 600 and 700

SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_01
Function Fragment_Stage_0900_Item_01()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_02
Function Fragment_Stage_0900_Item_02()
;BEGIN CODE
SetObjectiveCompleted(600)

SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_03
Function Fragment_Stage_0900_Item_03()
;BEGIN CODE
SetObjectiveCompleted(600)

SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
Alias_PrivacyWingGuard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetStage(1050)

if IsObjectiveDisplayed(650) == True
  SetStage(1100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0975_Item_00
Function Fragment_Stage_0975_Item_00()
;BEGIN CODE
SetStage(1050)

if IsObjectiveDisplayed(650) == True
  SetStage(1100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_Player.GetActorRef().AddItem(Alias_PrivacyWingKeycard.GetRef())

SetStage(1050)
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
; Used as a dialogue condirtion with Ari
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(600)
  SetObjectiveCompleted(600)
endif

SetObjectiveCompleted(650)
SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(700, false)
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1175_Item_00
Function Fragment_Stage_1175_Item_00()
;BEGIN CODE
SetStage(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1325_Item_00
Function Fragment_Stage_1325_Item_00()
;BEGIN CODE
FC06_ClinicSystemsDisrupted.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1340_Item_00
Function Fragment_Stage_1340_Item_00()
;BEGIN CODE
; Complete all previous objectives
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveCompleted(300)
SetObjectiveCompleted(310)
SetObjectiveCompleted(320)
SetObjectiveCompleted(330)
SetObjectiveCompleted(350)
SetObjectiveCompleted(400)
SetObjectiveCompleted(500)
SetObjectiveCompleted(600)
SetObjectiveCompleted(650)
SetObjectiveCompleted(700)
SetObjectiveCompleted(800)
SetObjectiveCompleted(900)
SetObjectiveCompleted(950)

Alias_MayasHideoutMapMarker.GetRef().Enable()

SetStage(1350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(975)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(975)
SetObjectiveDisplayed(1000)

; Add map marker for the asteroid base
Alias_MayasHideoutMapMarker.GetRef().AddToMapScanned()

;Enable Maya's ship at the station
Alias_ClinicShip.GetRef().Enable()

;Allow the player to board the Station
Game.GetPlayer().addtoFaction(FC06_MayaCruzBoardingFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1402_Item_00
Function Fragment_Stage_1402_Item_00()
;BEGIN CODE
FC06_MayaCruzPAGreetingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1405_Item_00
Function Fragment_Stage_1405_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1025)

Actor MayaCruz = Alias_MayaCruz.GetActorRef()

MayaCruz.SetNoBleedoutRecovery(true)
MayaCruz.AllowBleedoutDialogue(true)
MayaCruz.RemoveFromFaction(PlayerEnemyFaction)
MayaCruz.RemoveFromFaction(LC056MayaCruzFaction)
MayaCruz.AddToFaction(PlayerFriendFaction)
MayaCruz.IgnoreFriendlyHits()
MayaCruz.StopCombat()

; Stop combat on the companion so they don't shoot Maya (513817)
Alias_Companion.GetActorRef().StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1410_Item_00
Function Fragment_Stage_1410_Item_00()
;BEGIN CODE
Actor MayaCruz = Alias_MayaCruz.GetActorRef()

MayaCruz.RemoveFromFaction(PlayerFriendFaction)
MayaCruz.SetNoBleedoutRecovery(False)
MayaCruz.ResetHealthAndLimbs()
MayaCruz.IgnoreFriendlyHits(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1425_Item_00
Function Fragment_Stage_1425_Item_00()
;BEGIN CODE
; Give the player the dataslate
Alias_PLayer.GetActorRef().AddItem(Alias_MayaEncryptedDataslate.GetRef())

SetStage(1600)

Alias_MayaCruz.GetActorRef().SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1440_Item_00
Function Fragment_Stage_1440_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1025)
SetObjectiveDisplayed(1050)

Actor MayaCruz = Alias_MayaCruz.GetActorRef()

MayaCruz.AllowBleedoutDialogue(false)
MayaCruz.SetEssential(false)
MayaCruz.AddToFaction(PlayerEnemyFaction)
MayaCruz.StartCombat(Alias_Player.GetActorRef())
MayaCruz.ResetHealthAndLimbs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1450_Item_00
Function Fragment_Stage_1450_Item_00()
;BEGIN CODE
; Set from OnDeath script on Maya's alias

SetObjectiveCompleted(1050)

SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1025)
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)

; increment encrypted slate AV
Alias_Player.GetReference().ModValue(FC_EncryptedSlatesCollectedAV, 1)

; Start the encrypted slate quest if not already running
If !FC_EncryptedSlateQuest.IsRunning()
  FC_EncryptedSlateQuest.Start()
endif

;Set elevator to accessible so player can leave that way. 
LoadElevatorFloorScript floorScript = Alias_LC056_LoadElevatorController.GetRef() as LoadElevatorFloorScript
floorScript.SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Start the post-quest is Maya Cruz ia still alive
if ALias_MayaCruz.GetActorRef().IsDead() == False
  FC06Post.Start()
endif

; Remove the slate
Alias_PLayer.GetActorRef().RemoveItem(Alias_MayaEncryptedDataslate.GetRef())

; set the quest completion actor value
Alias_Player.GetActorRef().SetValue(FC06_Completed, 1)

;Achievement Unlocked
Game.AddAchievement(15)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property FC06_BenWalkAndTalkScene Auto Const Mandatory

Scene Property FC06_BenAriScene Auto Const Mandatory

ObjectReference Property FC06_PT1 Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_PrivacyWingKeycard Auto Const Mandatory

ActorValue Property FC_EncryptedSlatesCollectedAV Auto Const Mandatory

Quest Property FC_EncryptedSlateQuest Auto Const Mandatory

ReferenceAlias Property Alias_MayaEncryptedDataslate Auto Const Mandatory

ReferenceAlias Property Alias_MayaCruz Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

GlobalVariable Property FC06_ClinicSystemsDisrupted Auto Const Mandatory

ObjectReference Property FC06_MayasHideoutMapMarkerRef Auto Const Mandatory

Scene Property FC06_MayaCruzPAGreetingScene Auto Const Mandatory

ReferenceAlias Property Alias_PrivacyWingGuard Auto Const Mandatory

ReferenceAlias Property Alias_VIPWingDoor Auto Const Mandatory

Scene Property FC06_AriWalkToTerminal Auto Const Mandatory

Scene Property FC06_AriSearchRecords Auto Const Mandatory

ReferenceAlias Property Alias_AriMiller Auto Const Mandatory

Key Property FC06_ClinicVIPWingKeycard Auto Const Mandatory

ActorValue Property FC06_Completed Auto Const Mandatory

ReferenceAlias Property Alias_ClinicShip Auto Const Mandatory

Faction Property FC06_MayaCruzBoardingFaction Auto Const

Faction Property LC056MayaCruzFaction Auto Const Mandatory

Quest Property FC06Post Auto Const Mandatory

ReferenceAlias Property Alias_MayasHideoutMapMarkerRef Auto Const Mandatory

ReferenceAlias Property Alias_MayasHideoutMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_BenArmistead Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Large Auto Const Mandatory

ReferenceAlias Property Alias_LC056_LoadElevatorController Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory
