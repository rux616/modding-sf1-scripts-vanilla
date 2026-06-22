;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC03_0029D04C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
ObjectReference HadREF = Alias_Hadrian.GetRef()
SetStage(100)
Game.GetPlayer().MoveTo(Debugmarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Debugmarker02)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Debugmarker03)
SetStage(400)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Debugmarker03)
SetStage(400)
SetStage(442)
SetStage(500)
SetStage(510)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
Game.GetPlayer().MoveTo(Debugmarker05)
SetStage(400)
SetStage(440)
SetStage(442)
SetStage(500)
SetStage(510)
SetStage(600)
SetObjectiveCompleted(100)
SetObjectiveCompleted(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
ObjectReference PlayREF = Game.GetPlayer()
PlayREF.AddItem(TestVSWeapons)
PlayREF.MoveTo(Debugmarker07)
SetStage(899)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
ObjectReference PlayREF = Game.GetPlayer()
Alias_Marcus.GetRef().Moveto(UC04_Percival_TeleportMarker_Stage943)
PlayREF.AddItem(TestVSWeapons)
PlayREF.MoveTo(Debugmarker03)

SetStage(942)
Utility.Wait(2.0)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
ObjectReference HadREF = Alias_Hadrian.GetRef()
HadREF.Enable()
ObjectReference PlayREF = Game.GetPlayer()
PlayREF.AddItem(TestVSWeapons)
PlayREF.MoveTo(Debugmarker02)
SetStage(950)
SetStage(990)
SetStage(1000)
SetObjectiveCompleted(100)
SetObjectiveCompleted(940)
Utility.Wait(1.0)
HadREF.Moveto(HadrianTeleportMarker940)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Game.GetPlayer().Moveto(UC03_DebugMarker06a)
Utility.Wait(3.0)
SetStage(810)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
Actor PA = Game.GetPlayer()
PA.AddPerk(Intimidation)
PA.AddPerk(BackgroundIndustrialist)
PA.AddPerk(BackgroundCombatMedic)
PA.AddPerk(BackgroundXenobiologist)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Change the name of the abandoned mines
Alias_DeepMines.ForceLocationTo(Alias_LC028RedDevilMinesLocation.GetLocation())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DialogueCydonia_RedEyes.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(300)
Alias_Andy.GetRef().Enable()
Alias_LaserCutter.GetRef().Enable()
Alias_EmployeeExitKey.GetRef().Enable()

;Enable hematite for quest purposes and setting up quest item status
Alias_HematiteObj.GetRef().EnableNoWait()
(Alias_Player as UC03_PlayerAliasScript).RegisterPlayerForBloodstoneCollection()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
Alias_Oktai.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
UC_PlayerKnows_RedDevils.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
if !GetStageDone(850)
  SetObjectiveDisplayed(400)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
UC03_410_AndyShoutsScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
UC03_420_LouAttractScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(430)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0442_Item_00
Function Fragment_Stage_0442_Item_00()
;BEGIN CODE
;if GetStageDone(500)
;  SetObjectiveCompleted(430)
;  SetObjectiveDisplayed(500)
;  SetObjectiveDisplayed(501)
;endif

;And set the stage to unlock Jakob's terminal entry in the
;Trade Authority user terminal
Setstage(330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0443_Item_00
Function Fragment_Stage_0443_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Digipick, 5)
;if GetStageDone(500) 
;  if Game.GetPlayer().GetItemCount(UC03_CydoniaUtilityKey) <= 0
;    SetObjectiveDisplayed(503)
;    SetObjectiveDisplayed(500, true, true)
;  endif
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0445_Item_00
Function Fragment_Stage_0445_Item_00()
;BEGIN CODE
; Also set the stage to let the player mark they've learned about the Red Devils
SetStage(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0447_Item_00
Function Fragment_Stage_0447_Item_00()
;BEGIN CODE
;Also tag the player as having used a "good guy" path with Lou
SetStage(438)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0503_Item_00
Function Fragment_Stage_0503_Item_00()
;BEGIN CODE
SetObjectiveCompleted(503)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
SetObjectiveCompleted(430)
SetObjectiveDisplayed(501)
SetObjectiveDisplayedAtTop(500)
Utility.Wait(2.0)
UC03_510_CambridgeAttractScene.Start()
SetObjectiveDisplayed(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0521_Item_00
Function Fragment_Stage_0521_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Drink_Any)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayedAtTop(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(510)

;If the player's already killed the Spacer boss
;advance the quest
if !UC03_DeepMinesSupportQuest.GetStageDone(100)
  SetObjectiveDisplayed(600)
else
  SetStage(800)
  SetObjectiveDisplayed(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
if !GetStageDone(850) && !GetStageDone(890) && GetStageDone(510)
  SetObjectiveCompleted(501)
  SetObjectiveDisplayed(500, true, true)
  SetObjectiveDisplayed(502)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, UC03_JakobsDebtNewValue_00.GetValueInt())
SetObjectiveCompleted(502)

if !IsObjectiveCompleted(600)
  SetObjectiveDisplayed(600, false, false)
endif

if !IsObjectiveCompleted(800)
  SetObjectiveDisplayed(800, false, false)
endif

if !IsObjectiveCompleted(810)
  SetObjectiveDisplayed(810, false, false)
endif

if !IsObjectiveCompleted(811)
  SetObjectiveDisplayed(811, false, false)
endif

if !IsObjectiveCompleted(820)
  SetObjectiveDisplayed(820, false, false)
endif

if !IsObjectiveCompleted(825)
  SetObjectiveDisplayed(825, false, false)
endif

if !IsObjectiveCompleted(830)
  SetObjectiveDisplayed(830, false, false)
endif

if !IsObjectiveCompleted(835)
  SetObjectiveDisplayed(835, false, false)
endif

if !IsObjectiveCompleted(840)
  SetObjectiveDisplayed(840, false, false)
endif

if !IsObjectiveCompleted(845)
  SetObjectiveDisplayed(845, false, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
if GetStageDone(600) && !GetStageDone(750) && !GetStageDone(890)
  SetObjectiveCompleted(600)
  SetObjectiveDisplayed(500, true, true)
  SetObjectiveDisplayed(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
UC03_810_CambridgeCommsScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0811_Item_00
Function Fragment_Stage_0811_Item_00()
;BEGIN CODE
Alias_LaserCutter.Clear()
SetObjectiveCompleted(811)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0815_Item_00
Function Fragment_Stage_0815_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)

if !GetStageDone(750)

  Actor Player = Game.GetPlayer()

  if Player.GetItemCount(InorgUniqueHematite) < 1
    SetObjectiveDisplayed(500, true, true)
    SetObjectiveDisplayed(810)  

    if Player.GetItemCount(Cutter) < 1
      SetObjectiveDisplayed(811)
    endif
  else
    Player.RemoveItem(InorgUniqueHematite, 1, absilent = true)
    Player.AddAliasedItem(InorgUniqueHematite, Alias_HematiteQuestItem, 1, absilent = true)
    SetStage(820)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
Alias_LaserCutter.Clear()

if !GetStageDone(750)
  Alias_ThresherTrigger.GetRef().Enable()
  SetObjectiveCompleted(810)
  SetObjectiveDisplayed(500, true, true)

  if !IsObjectiveCompleted(811)
    SetObjectiveDisplayed(811, false, false)
  endif

  SetObjectiveDisplayed(820)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0825_Item_00
Function Fragment_Stage_0825_Item_00()
;BEGIN CODE
if !GetStageDone(750)
  Alias_ThresherTrigger.GetRef().Disable()
  Alias_ThresherSoundSource.GetRef().Enable()
  Game.GetPlayer().RemoveItem(Alias_HematiteQuestItem.GetRef())
  SetObjectiveCompleted(820)
  SetObjectiveDisplayed(500, true, true)
  SetObjectiveDisplayed(830)
  UC03_825_Thresher_HematiteDeposited.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
if !GetStageDone(750)
  UC03_830_ThresherAnalysisSequence.Start()
  SetObjectiveCompleted(825)
  SetObjectiveDisplayed(500, true, true)
  SetObjectiveDisplayed(830)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0835_Item_00
Function Fragment_Stage_0835_Item_00()
;BEGIN CODE
if !GetStageDone(750)
  Alias_ThresherDataTrigger.GetRef().Enable()
  Alias_ThresherSoundSource.GetRef().Disable()
  SetObjectiveCompleted(830)
  SetObjectiveDisplayed(500, true, true)
  SetObjectiveDisplayed(835)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0840_Item_00
Function Fragment_Stage_0840_Item_00()
;BEGIN CODE
if !GetStageDone(750)
  Game.GetPlayer().AddItem(Alias_ResearchData.GetRef())
  Alias_ThresherDataTrigger.GetRef().Disable()
  SetObjectiveCompleted(835)
  SetObjectiveDisplayed(500, true, true)
  SetObjectiveDisplayed(840)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0843_Item_00
Function Fragment_Stage_0843_Item_00()
;BEGIN CODE
if !GetStageDone(890) && !GetStageDone(750)
  UC03_845_CambridgeResearchCollected.Start()
  SetObjectiveCompleted(840)

  if Game.GetPlayer().GetItemCount(UC03_DeepMineQuickExitKey) >= 1
    SetStage(845)
  else
    SetObjectiveDisplayed(500, true, true)
    SetObjectiveDisplayed(843)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0844_Item_00
Function Fragment_Stage_0844_Item_00()
;BEGIN CODE
ObjectReference DrillMM = Alias_DrillExitMarker.GetRef()
DrillMM.Enable()
DrillMM.AddToMapScanned(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0845_Item_00
Function Fragment_Stage_0845_Item_00()
;BEGIN CODE
if !GetStageDone(750)
  SetObjectiveCompleted(843)
  SetObjectiveDisplayed(500, true, true)
  SetObjectiveDisplayed(845)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
if !GetStageDone(750)

  ;Set the shutdown stage for the Hab Intercom activations
  SetStage(856)

  ;Unlock the player's access to making Cambridge's recipe
  Game.GetPlayer().SetValue(UC03_PlayerLearnedPickMeUpRecipe, 1.0)

  SetObjectiveCompleted(845)
  SetObjectiveDisplayed(850)

  if !IsObjectiveCompleted(500)
    SetObjectiveDisplayed(500, false, false)
  endif

  if !IsObjectiveCompleted(501)
    SetObjectiveDisplayed(501, false, false)
  endif

  if !IsObjectiveCompleted(502)
    SetObjectiveDisplayed(502, false, false)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()
PlayACT.RemoveItem(Alias_ResearchData.GetRef())

if GetStageDone(870)
  PlayACT.AddItem(LargeNegotiateReward, 1)
else
  PlayACT.AddItem(LL_Quest_Reward_Credits_Misc_01_Small, 1)
endif
UC03_JakobsDebtAmount.SetValue(0)
SetObjectiveCompleted(850)

; UC03 result: Mines might be reopening
UC03_Result.SetValue(1)
SetStage(890)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0880_Item_00
Function Fragment_Stage_0880_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, UC03_JakobsDebtAmount.GetValueInt())
SetStage(890)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0890_Item_00
Function Fragment_Stage_0890_Item_00()
;BEGIN CODE
;Set the shutdown stage for the Hab Intercom activations
SetStage(856)

SetObjectiveCompleted(500)

if !IsObjectiveCompleted(501)
  SetObjectiveDisplayed(501, false, false)
endif

if !IsObjectiveCompleted(502)
  SetObjectiveDisplayed(502, false, false)
endif

if !IsObjectiveCompleted(503)
  SetObjectiveDisplayed(503, false, false)
endif

if !IsObjectiveCompleted(510)
  SetObjectiveDisplayed(510, false, false)
endif

if !IsObjectiveCompleted(600)
  SetObjectiveDisplayed(600, false, false)
endif

if !IsObjectiveCompleted(800)
  SetObjectiveDisplayed(800, false, false)
endif

if !IsObjectiveCompleted(810)
  SetObjectiveDisplayed(810, false, false)
endif

if !IsObjectiveCompleted(811)
  SetObjectiveDisplayed(811, false, false)
endif

if !IsObjectiveCompleted(820)
  SetObjectiveDisplayed(820, false, false)
endif

if !IsObjectiveCompleted(825)
  SetObjectiveDisplayed(825, false, false)
endif

if !IsObjectiveCompleted(830)
  SetObjectiveDisplayed(830, false, false)
endif

if !IsObjectiveCompleted(835)
  SetObjectiveDisplayed(835, false, false)
endif

if !IsObjectiveCompleted(840)
  SetObjectiveDisplayed(840, false, false)
endif

if !IsObjectiveCompleted(845)
  SetObjectiveDisplayed(845, false, false)
endif

if !IsObjectiveCompleted(850)
  SetObjectiveDisplayed(850, false, false)
endif

SetObjectiveDisplayed(890)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0891_Item_00
Function Fragment_Stage_0891_Item_00()
;BEGIN CODE
if !GetStageDone(895)
  UC03_891_DrillDoorActivated.Start()
  SetObjectiveDisplayed(900, false, false)
  SetObjectiveDisplayed(891)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0895_Item_00
Function Fragment_Stage_0895_Item_00()
;BEGIN CODE
SetObjectiveCompleted(891)
if !IsObjectiveDisplayed(900)
  SetObjectiveDisplayed(900)
endif

Alias_DrillExit.GetRef().Unlock()
UC03_895_DoorAccessRestored.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0899_Item_00
Function Fragment_Stage_0899_Item_00()
;BEGIN CODE
SetObjectiveCompleted(430)
SetObjectiveCompleted(890)
SetObjectiveDisplayed(900)

Game.GetPlayer().AddItem(UC03_DeepMineDrillKey)

if GetStageDone(442) && !GetStageDone(750)
  SetStage(750)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
UC03_900_JakobAttractScene.Start()
Alias_Marcus.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0901_Item_00
Function Fragment_Stage_0901_Item_00()
;BEGIN CODE
Alias_Marcus.GetActorRef().EvaluatePackage()

;Move Hadrian in advance of QT stage at 942 to avoid odd placement
ObjectReference HadREF = Alias_Hadrian.GetRef()
HadREF.MoveTo(DebugMarker03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0905_Item_00
Function Fragment_Stage_0905_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_TerrormorphCellSample.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(910)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
Alias_RedHQMainDoor.GetRef().Unlock()
Alias_Marcus.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(900)
SetObjectiveDisplayed(920)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0930_Item_00
Function Fragment_Stage_0930_Item_00()
;BEGIN CODE
UC03_930_MarcusInsideScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0939_Item_00
Function Fragment_Stage_0939_Item_00()
;BEGIN CODE
;Stop having Percival be a follower
Actor JakobRef = Alias_Marcus.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(JakobRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0940_Item_00
Function Fragment_Stage_0940_Item_00()
;BEGIN CODE
Alias_Marcus.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0942_Item_00
Function Fragment_Stage_0942_Item_00()
;BEGIN CODE
;Unlock the main elevator and give the player keys to the joint
Game.GetPlayer().AddItem(UC03_RedDevilsHQKey)
DialogueRedDevilsHQ.SetStage(7)

;Make Percival a follower
Actor PA = Alias_Marcus.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleActive(PA, true)
(SQ_Followers as SQ_FollowersScript).CommandFollow(PA)

;Get Hadrian in place
Actor HadREF = Alias_Hadrian.GetActorRef()
HadREF.MoveTo(DebugMarker03)
HadRef.Enable()
HadRef.EvaluatePackage()

;Enable Hadrian's Ship
Alias_HadrianShip.TryToEnable()

;Turn on her combat dialogue
UC_Hadrian_ECCombatDialogueActive.SetValue(1)

;Turn on the Red Devils HQ map marker and mark it accessible on the star map
ObjectReference MMRef = Alias_RedDevilsHQMapMarker.GetRef()
MMRef.Enable()
MMREf.SetMarkerVisibleOnStarMap(true)
MMREf.SetMarkerDiscovered()

SetObjectiveCompleted(920)
SetObjectiveDisplayed(942)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0943_Item_00
Function Fragment_Stage_0943_Item_00()
;BEGIN CODE
;Stop having Percival be a follower
Actor JakobRef = Alias_Marcus.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(JakobRef)

if !Game.GetPlayer().HasDetectionLOS(JakobRef)
  JakobRef.Moveto(DebugMarker03)
endif

JakobRef.EvaluatePackage()
UC03_940b_HadrianJakobScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0945_Item_00
Function Fragment_Stage_0945_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0949_Item_00
Function Fragment_Stage_0949_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetObjectiveCompleted(942)
SetObjectiveDisplayed(950)

Alias_Hadrian.GetActorRef().EvaluatePackage()
Alias_Marcus.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0955_Item_00
Function Fragment_Stage_0955_Item_00()
;BEGIN CODE
UC_PlayerKnows_HadriansPast_Xenowarfare.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0956_Item_00
Function Fragment_Stage_0956_Item_00()
;BEGIN CODE
UC03_PlayerKnows_TerrormorphProjectFailed.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0957_Item_00
Function Fragment_Stage_0957_Item_00()
;BEGIN CODE
UC_PlayerKnows_ArmisticeArchives.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0960_Item_00
Function Fragment_Stage_0960_Item_00()
;BEGIN CODE
SetObjectiveCompleted(950)
SetObjectiveDisplayed(960)

Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0961_Item_00
Function Fragment_Stage_0961_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0970_Item_00
Function Fragment_Stage_0970_Item_00()
;BEGIN CODE
UC03_970_MarcusAnalyzesSample.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN CODE
SetObjectiveCompleted(940)
SetObjectiveDisplayed(980)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
UC_PlayerKnows_ArmisticeArchives.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0995_Item_00
Function Fragment_Stage_0995_Item_00()
;BEGIN CODE
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Turn off the crew spawner in NA
Alias_NewAtlantisCrewSpawner.GetRef().Disable()

;Turn off the spacers if they haven't been turned off already
if !UC03_DeepMinesSupportQuest.GetStageDone(200)
  UC03_DeepMinesSupportQuest.SetStage(200)
endif

;If the player got the mines up and running again, set the global to make
;Pick-Me-Up and Hematite available at UC vendors
if GetStageDone(860)
  UC03_BloodstoneAvailable.SetValue(1)

  ;Also, get the state change turned on in the mines
  Alias_RedDevilsMinePostQuestEnableMarker.GetRef().Enable()
endif

;Set the starborn actor value for this quest
Game.GetPlayer().SetValue(UC03_Starborn_QuestCompleted, 1.0)

;If the player didn't turn it on early, add the "Drill Exit Marker" to their map now
SetStage(844)

;Make sure Percival's not still a follower one last time
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(Alias_Marcus.GetActorRef())

UC04.Start()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1015_Item_00
Function Fragment_Stage_1015_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
;This scene no longer exists
;UC03_1050_OktaiCollectsContract.Start()
SetObjectiveCompleted(1000)
SetObjectiveCompleted(1010)
SetObjectiveDisplayed(1050)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1050)
SetObjectiveDisplayed(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
UC04.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Hadrian Auto Const Mandatory

ReferenceAlias Property Alias_Andy Auto Const Mandatory

Scene Property UC03_590_HadrianRequestsPlayersHelp Auto Const Mandatory

Scene Property UC03_700_CambridgeRadioScene Auto Const Mandatory

Scene Property UC03_890_HadrianSpotsDevilsHQ Auto Const Mandatory

Scene Property UC03_900_MarcusAndHadrian Auto Const Mandatory

ObjectReference Property HadrianTeleportMarkerScene900 Auto Const Mandatory

ReferenceAlias Property Alias_Marcus Auto Const Mandatory

Scene Property UC03_930_MarcusInsideScene Auto Const Mandatory

Scene Property UC03_970_MarcusAnalyzesSample Auto Const Mandatory

Scene Property UC03_750_CambridgeWrapUp Auto Const Mandatory

MiscObject Property InorgUniqueBloodstone Auto Const Mandatory

Quest Property UC04 Auto Const

ObjectReference Property HadTeleportMarker01 Auto Const

ObjectReference Property DebugMarker01 Auto Const

Scene Property UC03_510_AndyHadrianLouIntro Auto Const Mandatory

ObjectReference Property HadrianTeleStage500 Auto Const

ObjectReference Property DebugMarker02 Auto Const

ObjectReference Property HadTeleportMarker02 Auto Const

ObjectReference Property DebugMarker03 Auto Const

ObjectReference Property HadTeleportMarker05 Auto Const

ObjectReference Property DebugMarker05 Auto Const

LeveledItem Property TestVSWeapons Auto Const Mandatory

ObjectReference Property DebugMarker07 Auto Const

ObjectReference Property DebugMarker08 Auto Const

ObjectReference Property HadrianTeleportMarker940 Auto Const

ReferenceAlias Property Alias_Oktai Auto Const Mandatory

GlobalVariable Property UC_PlayerKnows_RedDevils Auto Const Mandatory

Scene Property UC03_410_AndyShoutsScene Auto Const Mandatory

Scene Property UC03_420_LouAttractScene Auto Const Mandatory

MiscObject Property Credits Auto Const

Scene Property UC03_510_CambridgeAttractScene Auto Const Mandatory

ReferenceAlias Property Alias_TerrormorphCellSample Auto Const Mandatory

Scene Property UC03_900_JakobAttractScene Auto Const Mandatory

GlobalVariable Property UC_PlayerKnows_HadriansPast_Xenowarfare Auto Const Mandatory

Quest Property UC03_DeepMinesQuest Auto Const Mandatory

Scene Property UC03_810_CambridgeCommsScene Auto Const Mandatory

Weapon Property Cutter Auto Const Mandatory

ReferenceAlias Property Alias_LaserCutter Auto Const Mandatory

MiscObject Property InorgUniqueHematite Auto Const Mandatory

ReferenceAlias Property Alias_ThresherTrigger Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_HematiteQuestItem Auto Const Mandatory

Scene Property UC03_825_Thresher_HematiteDeposited Auto Const Mandatory

Scene Property UC03_830_ThresherAnalysisSequence Auto Const Mandatory

ReferenceAlias Property Alias_ThresherDataTrigger Auto Const Mandatory

Scene Property UC03_845_CambridgeResearchCollected Auto Const Mandatory

Message Property UC03_DEBUG_TradeAuthorityVaultDoesntExist Auto Const Mandatory

Key Property UC03_CydoniaUtilityKey Auto Const Mandatory

ReferenceAlias Property Alias_ResearchData Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtAmount Auto Const Mandatory

Key Property UC03_DeepMineDrillKey Auto Const Mandatory

ReferenceAlias Property Alias_RedHQMainDoor Auto Const Mandatory

ActorValue Property UC03_PlayerLearnedPickMeUpRecipe Auto Const Mandatory

GlobalVariable Property UC03_Reward_OktaiFindersFee Auto Const Mandatory

GlobalVariable Property UC03_Reward_OktaiFindersFee_Better Auto Const Mandatory

GlobalVariable Property UC03_Result Auto Const Mandatory

ReferenceAlias Property Alias_NewAtlantisCrewSpawner Auto Const Mandatory

ReferenceAlias Property Alias_ResearchDataSpawn Auto Const Mandatory

Key Property UC03_RedDevilsHQKey Auto Const Mandatory

ObjectReference Property HadrianTeleportMarker940a Auto Const Mandatory

ObjectReference Property JakobTeleportMarker943 Auto Const

Scene Property UC03_940a_HadrianLouJakobScene Auto Const Mandatory

ReferenceAlias Property Alias_TriggerScene410 Auto Const Mandatory

LeveledItem Property LL_Drink_Any Auto Const Mandatory

ObjectReference Property JakobDisSceneMarker Auto Const

GlobalVariable Property UC_PlayerKnows_ArmisticeArchives Auto Const Mandatory

GlobalVariable Property DialogueCydonia_RedEyes Auto Const Mandatory

ReferenceAlias Property Alias_RedDevilsHQMapMarker Auto Const Mandatory

GlobalVariable Property UC03_BloodstoneAvailable Auto Const Mandatory

ObjectReference Property UC04_Percival_TeleportMarker_Stage943 Auto Const Mandatory

ReferenceAlias Property Alias_Trigger943 Auto Const Mandatory

MiscObject Property Digipick Auto Const Mandatory

Key Property UC03_DeepMineQuickExitKey Auto Const Mandatory

Scene Property UC03_891_DrillDoorActivated Auto Const Mandatory

Scene Property UC03_895_DoorAccessRestored Auto Const Mandatory

ReferenceAlias Property Alias_DrillExit Auto Const Mandatory

Perk Property Intimidation Auto Const Mandatory

Perk Property BackgroundXenobiologist Auto Const Mandatory

Perk Property BackgroundCombatMedic Auto Const Mandatory

Perk Property BackgroundIndustrialist Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory

Scene Property UC03_940b_HadrianJakobScene Auto Const Mandatory

ReferenceAlias Property Alias_TriggerSixthCircleInterior Auto Const Mandatory

ActorValue Property UC03_Starborn_QuestCompleted Auto Const Mandatory

ReferenceAlias Property Alias_DrillExitMarker Auto Const Mandatory

ObjectReference Property UC03_DebugMarker06a Auto Const Mandatory

GlobalVariable Property UC03_PlayerKnows_TerrormorphProjectFailed Auto Const Mandatory

GlobalVariable Property UC_Hadrian_ECCombatDialogueActive Auto Const Mandatory

ReferenceAlias Property Alias_RedDevilsMinePostQuestEnableMarker Auto Const Mandatory

Quest Property UC03_DeepMinesSupportQuest Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_00 Auto Const Mandatory

LocationAlias Property Alias_DeepMines Auto Const Mandatory

LocationAlias Property Alias_LC028RedDevilMinesLocation Auto Const Mandatory

ReferenceAlias Property Alias_ThresherSoundSource Auto Const Mandatory

ReferenceAlias Property Alias_HadrianShip Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Misc_02_Medium Auto Const Mandatory

Quest Property DialogueRedDevilsHQ Auto Const Mandatory

ReferenceAlias Property Alias_HematiteObj Auto Const Mandatory

LeveledItem Property LargeNegotiateReward Auto Const

ReferenceAlias Property Alias_EmployeeExitKey Auto Const Mandatory
