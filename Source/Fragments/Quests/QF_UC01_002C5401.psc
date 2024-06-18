;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC01_002C5401 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
UC01_DEBUG_TheStoryThusFar.Show()
SetStage(100)
Game.GetPlayer().MoveTo(DebugMarkerStage100)
UC01_100_TualaIntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetStage(200)
Game.GetPlayer().MoveTo(UC01_OrientDebugMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetStage(200)
SetStage(300)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetStage(200)
SetStage(300)
Game.GetPlayer().MoveTo(PrePilotExamDebugMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetStage(410)
UC01_410_PilotsEntranceScene.Stop()
SetStage(450)
Alias_PilotExamSeat.GetRef().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
UC01_ShipSim_PlayerKillCount.SetValue(3)
SetStage(600)
Game.GetPlayer().MoveTo(DebugMarkerStage100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetStage(200)
SetStage(310)
SetObjectiveCompleted(200)
Game.GetPlayer().MoveTo(DebugMarker07)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
UC01_ShipSimulatorHelperQuest.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

;Complete the misc quest if that's active
if UC_Tuala_Misc.GetStageDone(100)
  UC_Tuala_Misc.SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_CurrentOrientationTarget.ForceRefTo(Alias_OrientTarget01.GetRef())
UC01_200_RegistrationCompleteScene.Start()
Game.GetPlayer().AddItem(VanguardCourseElevatorKey, abSilent = true)
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
SetObjectiveDisplayedAtTop(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0299_Item_00
Function Fragment_Stage_0299_Item_00()
;BEGIN CODE
(Alias_QuickExitToMAST.GetRef() as LoadElevatorFloorScript).SetAccessible(true)
if !IsObjectiveCompleted(200)
  SetObjectiveDisplayed(200, false, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
if !IsObjectiveCompleted(200)
  SetObjectiveDisplayed(200, false, false)
endif

if !GetStageDone(400)
  ;UC01_301_PrepareForExamination.Start()
  SetObjectiveDisplayed(301)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0302_Item_00
Function Fragment_Stage_0302_Item_00()
;BEGIN CODE
SetObjectiveCompleted(301)

ObjectReference PlayREF = Game.GetPlayer()

PlayRef.Additem(LL_Grendel_Simple)
PlayRef.Additem(Ammo777mm, 100)
PlayRef.Additem(FragGrenade, 5)
PlayRef.Additem(Aid_MedPack, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0303_Item_00
Function Fragment_Stage_0303_Item_00()
;BEGIN CODE
if GetStageDone(302)
  SetStage(304)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0304_Item_00
Function Fragment_Stage_0304_Item_00()
;BEGIN CODE
SetObjectiveCompleted(301)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
if !GetStageDone(400)
  ;UC01_330a_BeaGreeting.Start() 
  SetObjectiveDisplayed(315)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0306_Item_00
Function Fragment_Stage_0306_Item_00()
;BEGIN CODE
SetObjectiveCompleted(315)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;UC01_310_AdaptabilityIntro.Start()
SetObjectiveCompleted(300)
UpdateCurrentInstanceGlobal(UC01_SectorReleaseCountActivated)
SetObjectiveDisplayed(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
if !GetStageDone(400)
  UC01_Adaptability_FoundASecretPath.Mod(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0331_Item_00
Function Fragment_Stage_0331_Item_00()
;BEGIN CODE
UC01_DEBUG_StealthFixes.Show()
;UC01_331_ApproachSectorBScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0345_Item_00
Function Fragment_Stage_0345_Item_00()
;BEGIN CODE
if !GetStageDone(400)
  UC01_Adaptability_FoundASecretPath.Mod(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0349_Item_00
Function Fragment_Stage_0349_Item_00()
;BEGIN CODE
if !GetStageDone(400)
  SetObjectiveFailed(340)
  SetObjectiveFailed(360)
  SetObjectiveFailed(370)
else
  SetStage(348)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;Actor PlayACT = Game.GetPlayer() as Actor
;PlayACT.AddToFaction(UC01_BeaEnemyFaction)
;Alias_Bea.GetActorRef().StartCombat(PlayACT)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
if !GetStageDone(370) && !GetStageDone(400)
  SetObjectiveDisplayed(360) 
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0362_Item_00
Function Fragment_Stage_0362_Item_00()
;BEGIN CODE
if GetStageDone(364) && GetStageDone(366)
  SetStage(370)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0364_Item_00
Function Fragment_Stage_0364_Item_00()
;BEGIN CODE
if GetStageDone(362) && GetStageDone(366)
  SetStage(370)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0366_Item_00
Function Fragment_Stage_0366_Item_00()
;BEGIN CODE
if GetStageDone(364) && GetStageDone(362)
  SetStage(370)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
if GetStageDone(360)
  SetObjectiveCompleted(360)
  SetObjectiveDisplayed(370)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0371_Item_00
Function Fragment_Stage_0371_Item_00()
;BEGIN CODE
SetObjectiveCompleted(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
;Alias_Bea.GetActorRef().EvaluatePackage()

if !GetStageDone(400)
  UC01_Adaptability_FoundASecretPath.Mod(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0395_Item_00
Function Fragment_Stage_0395_Item_00()
;BEGIN CODE
;This appears to be deprecated, commenting out
;ObjectReference BDoor = Alias_SectorBBlockingDoor.GetRef()
;UC01_330c_AccessGranted.Start()
;BDoor.SetOpen()

;Utility.Wait(2.0)

;Alias_Bea.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0399_Item_00
Function Fragment_Stage_0399_Item_00()
;BEGIN CODE
SetStage(401)

Alias_PilotsExamDoor.GetRef().Unlock()

SetObjectiveFailed(300)
SetObjectiveFailed(310)
If !IsObjectiveCompleted(301)
  SetObjectiveDisplayed(301, false, false)
endif
If !IsObjectiveCompleted(360)
  SetObjectiveDisplayed(360, false, false)
endif
If !IsObjectiveCompleted(370)
  SetObjectiveDisplayed(370, false, false)
endif
SetObjectiveDisplayed(400)

;The Sector B guards should no longer fight the player
;Game.GetPlayer().AddToFaction(UC01_SectorBFriendFaction)
;Alias_SectorBGuards.StopCombat()

;Get Bea back to where they should be
;Alias_Bea.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetStage(401)

Alias_PilotsExamDoor.GetRef().Unlock()

SetObjectiveCompleted(300)
SetObjectiveCompleted(310)
If !IsObjectiveCompleted(301)
  SetObjectiveDisplayed(301, false, false)
endif
If !IsObjectiveCompleted(360)
  SetObjectiveDisplayed(360, false, false)
endif
If !IsObjectiveCompleted(370)
  SetObjectiveDisplayed(370, false, false)
endif
SetObjectiveDisplayed(400)

;The Sector B guards should no longer fight the player
;Game.GetPlayer().AddToFaction(UC01_SectorBFriendFaction)
;Alias_SectorBGuards.StopCombat()

;Get Bea back to where they should be
;Alias_Bea.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
if !IsObjectiveCompleted(200)
  SetObjectiveDisplayed(200, false, false)
endif

SetObjectiveCompleted(300)
SetObjectiveCompleted(400)
SetObjectiveDisplayed(410)

Alias_PilotExamSeat.GetRef().BlockActivation(false, false)
UC01_410_PilotsEntranceScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
SetStage(420)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0599_Item_00
Function Fragment_Stage_0599_Item_00()
;BEGIN CODE
UC01_600_ReturntoTuala.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Make sure the Vanguard scene's all cleaned up if it hasn't cleaned itself up previously
if !UC_NA_CL_VanguardScene.GetStageDone(1000)
  UC_NA_CL_VanguardScene.SetStage(999)
endif

Alias_FromPilotExamDoor.GetRef().Unlock()
SetObjectiveCompleted(410)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0641_Item_00
Function Fragment_Stage_0641_Item_00()
;BEGIN CODE
UC01_ResultGlobal.SetValue(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0642_Item_00
Function Fragment_Stage_0642_Item_00()
;BEGIN CODE
UC01_ResultGlobal.SetValue(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0643_Item_00
Function Fragment_Stage_0643_Item_00()
;BEGIN CODE
UC01_ResultGlobal.SetValue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0644_Item_00
Function Fragment_Stage_0644_Item_00()
;BEGIN CODE
UC01_ResultGlobal.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0645_Item_00
Function Fragment_Stage_0645_Item_00()
;BEGIN CODE
UC01_ResultGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(650)

Alias_Tuala.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
SetObjectiveCompleted(650)
SetObjectiveDisplayed(660)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
Alias_Tuala.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0694_Item_00
Function Fragment_Stage_0694_Item_00()
;BEGIN CODE
Alias_Tuala.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()
PlayACT.AddToFaction(PlayerVanguardFaction)
PlayACT.AddPerk(FactionUnitedColoniesVanguardPerk)

;UC02/MQ204: If MQ204 state change is active, turn it off
if MQ204_NA_StateChangeHandler.IsRunning() && !MQ204_NA_StateChangeHandler.GetStageDone(100)
  MQ204_NA_StateChangeHandler.SetStage(100)
endif

UC02.Start()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property UC01_200_RegistrationCompleteScene Auto Const

ReferenceAlias Property Alias_CurrentOrientationTarget Auto Const Mandatory

ReferenceAlias Property Alias_OrientTarget01 Auto Const Mandatory

Scene Property UC01_300_ProceedToExam Auto Const Mandatory

GlobalVariable Property UC01_SectorReleaseCountActivated Auto Const Mandatory

ReferenceAlias Property Alias_MainExamDoor Auto Const Mandatory

ObjectReference Property UC01_OrientDebugMarker Auto Const Mandatory

ObjectReference Property DebugMarkerStage100 Auto Const

Scene Property UC01_100_TualaIntroScene Auto Const Mandatory

ObjectReference Property PrePilotExamDebugMarker Auto Const

ReferenceAlias Property Alias_PilotsExamDoor Auto Const Mandatory

Scene Property UC01_410_PilotsEntranceScene Auto Const Mandatory

ReferenceAlias Property Alias_PilotExamSeat Auto Const Mandatory

Scene Property UC01_600_ReturntoTuala Auto Const Mandatory

ReferenceAlias Property Alias_QuickExitToMAST Auto Const Mandatory

ReferenceAlias Property Alias_FromPilotExamDoor Auto Const Mandatory

LocationAlias Property Alias_PlayerBackgroundLoc Auto Const Mandatory

Location Property UC01_UnknownLocation Auto Const Mandatory

LeveledItem Property LL_Grendel_Simple Auto Const Mandatory

Ammo Property Ammo777mm Auto Const Mandatory

Weapon Property FragGrenade Auto Const Mandatory

Potion Property Aid_MedPack Auto Const Mandatory

Message Property UC01_DEBUG_StealthFixes Auto Const Mandatory

GlobalVariable Property UC01_Adaptability_FoundASecretPath Auto Const Mandatory

GlobalVariable Property UC01_ResultGlobal Auto Const Mandatory

ReferenceAlias Property Alias_Tuala Auto Const Mandatory

Message Property UC01_DEBUG_BeaWalkNotWorking Auto Const Mandatory

GlobalVariable Property UC01_ShipSim_PlayerKillCount Auto Const Mandatory

Quest Property UC02 Auto Const Mandatory

ObjectReference Property DebugMarker07 Auto Const

Message Property UC01_DEBUG_ApproachSectorA Auto Const Mandatory

Message Property UC01_DEBUG_TheStoryThusFar Auto Const Mandatory

Message Property UC01_DEBUG_Murals Auto Const Mandatory

Armor Property Spacesuit_UCVanguard_Body_LightArmored Auto Const Mandatory

Armor Property Spacesuit_UCVanguard_Helmet_Armored Auto Const Mandatory

Faction Property PlayerVanguardFaction Auto Const Mandatory

Quest Property UC01_ShipSimulatorHelperQuest Auto Const Mandatory

Perk Property FactionUnitedColoniesVanguardPerk Auto Const Mandatory

ReferenceAlias Property Alias_PilotExamEntranceTrigger Auto Const Mandatory

Message Property UC01_DEBUG_DontBug Auto Const Mandatory

Quest Property UC_Tuala_Misc Auto Const Mandatory

Quest Property UC_NA_CL_VanguardScene Auto Const Mandatory

Key Property VanguardCourseElevatorKey Auto Const Mandatory

Quest Property MQ204_NA_StateChangeHandler Auto Const Mandatory
