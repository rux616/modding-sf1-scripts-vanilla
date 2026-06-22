;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC05_002A39BC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Disable Yasin
Alias_ChiefYasin.GetRef().Disable()

;Enable Hadrian
Alias_Hadrian.GetRef().Enable()

Game.GetPlayer().MoveTo(DebugMarker01)

Alias_MinisterToNATDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Enable Hadrian
Alias_Hadrian.GetRef().Enable()

;Enable Radcliff
Alias_Radcliff.GetRef().Enable()

;Disable Yasin
Alias_ChiefYasin.GetRef().Disable()

Alias_MinisterToNATDoor.GetRef().Unlock()

SetStage(190)
SetStage(201)
SetStage(202)
SetStage(203)
SetStage(210)
SetStage(220)
SetStage(300)
Utility.Wait(1.0)
Game.GetPlayer().MoveTo(DebugMarker02)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Enable Hadrian
Alias_Hadrian.GetRef().Enable()

;Disable Yasin
Alias_ChiefYasin.GetRef().Disable()

Alias_MinisterToNATDoor.GetRef().Unlock()
UC05_FreestarResultGlobal.SetValue(1)

SetStage(190)
SetStage(450)
SetStage(495)
SetStage(300)
SetObjectiveCompleted(100)
Game.GetPlayer().MoveTo(DebugMarker10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Enable Hadrian
Alias_Hadrian.GetRef().Enable()

;Disable Yasin
Alias_ChiefYasin.GetRef().Disable()

Alias_MinisterToNATDoor.GetRef().Unlock()
UC05_FreestarResultGlobal.SetValue(1)

SetStage(190)
SetStage(450)
SetStage(495)
SetStage(300)
SetStage(500)
SetStage(510)
SetStage(520)
SetStage(540)
SetStage(600)
SetStage(700)

;Turn off all other hostiles
Alias_HostileAI.KillAll()

;Turn off new robots not in collection
Alias_PodRobot.GetActorRef().Kill()
Alias_PrayerCircle01.GetActorRef().Kill()
Alias_PrayerCircle02.GetActorRef().Kill()
Alias_PrayerCircle03.GetActorRef().Kill()

SetObjectiveCompleted(100)
SetObjectiveCompleted(300)
SetObjectiveCompleted(352)
SetObjectiveCompleted(510)
SetObjectiveCompleted(515)
Game.GetPlayer().MoveTo(DebugMarker11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Enable Hadrian
Alias_Hadrian.GetRef().Enable()

;Disable Yasin
Alias_ChiefYasin.GetRef().Disable()

Game.GetPlayer().AddItem(Alias_VaruunCodePiece.GetRef())
Game.GetPlayer().AddItem(Alias_FreestarCodePiece.GetRef())

Alias_MinisterToNATDoor.GetRef().Unlock()

SetStage(190)
SetStage(900)
SetObjectiveCompleted(100)
Game.GetPlayer().MoveTo(DebugMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
;Enable Hadrian
Alias_Hadrian.GetRef().Enable()

;Disable Yasin
Alias_ChiefYasin.GetRef().Disable()

Alias_MinisterToNATDoor.GetRef().Unlock()

SetStage(190)
SetStage(900)
SetStage(925)
SetStage(970)
SetObjectiveCompleted(100)
SetObjectiveCompleted(925)
SetObjectiveCompleted(900)
Game.GetPlayer().MoveTo(DebugMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_FSECodeMachine.GetRef().BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Radcliffe agrees to give player the code so we need to remove trespass
Alias_TrespassTrigger.GetRef().SetLinkedRef(None, UC05_FSE_TrespassLink)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_DeputyMacIntyre.GetActorRef().EvaluatePackage()

SetObjectiveDisplayed(100)

;Knock out all the shivas in the Va'ruun Embassy
Alias_VaruunSHIVAs.SetUnconscious()

Alias_FSECodeMachine.GetRef().BlockActivation(true, false)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
UC05_110_Hadrian_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE UC05_QuestScript
Quest __temp = self as Quest
UC05_QuestScript kmyQuest = __temp as UC05_QuestScript
;END AUTOCAST
;BEGIN CODE
UC04_MacIntyreIntro_Scene150.Start()

kmyquest.OpenShutters()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
Alias_DeputyMacIntyre.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(UC05_Freestar_EmbassyAccessCard)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0211_Item_00
Function Fragment_Stage_0211_Item_00()
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()
PlayACT.AddItem(Alias_FSE_SecurityNotation.GetRef())
PlayACT.AddItem(LL_Quest_Reward_Credits_Faction_03_Large, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(312)
  SetObjectiveCompleted(312)
endif

if GetStageDone(317)
  SetStage(381)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(UC05_Varuun_EmbassyAccessKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE UC04_ToggleHallScreens
Quest __temp = self as Quest
UC04_ToggleHallScreens kmyQuest = __temp as UC04_ToggleHallScreens
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayedAtTop(300)

;Get everyone in place in the FSE
Actor CamACT = Alias_CameronWhite.GetActorRef()
CamACT.Enable()
CamACT.Moveto(WhiteTeleportMarker)
CamACT.EvaluatePackage()
Actor RadACT = Alias_Radcliff.GetActorRef()
RadACT.Enable()
RadACT.EvaluatePackage()

;Turn on Bal'mor's intercom marker
Alias_IntercomSoundMarker.GetRef().Enable()

;Silently give player elevator key to Embassy
Game.GetPlayer().AddItem(UC05_Freestar_ElevatorKey, abSilent=true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0307_Item_00
Function Fragment_Stage_0307_Item_00()
;BEGIN CODE
if !GetStageDone(335)
  UC04_RadcliffIIntro_Scene300.Start()
endif

;Also turn MaleWorker04 back on in the Minister's hall
Alias_MASTWorkerMale04.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Alias_CameronWhite.GetActorRef().EvaluatePackage()
Utility.Wait(1.0)
Alias_FreestarGuard_RadcliffeOffice.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0317_Item_00
Function Fragment_Stage_0317_Item_00()
;BEGIN CODE
;if GetStageDone(320)
;  SetObjectiveFailed(300)
;endif

if !GetStageDone(349) && !GetStageDone(345)
    if !GetStageDone(340)
        SetObjectiveDisplayed(310)
        if !GetStageDone(370)
            SetObjectiveDisplayed(311)
        endif
    endif
    
  ;If the player was given the special package from MacIntyre
  if GetStageDone(211)
    if GetStageDone(215)
      SetStage(381)
    else
      SetObjectiveDisplayed(312)
    endif
  endif

  if !GetStageDone(320) && !GetStageDone(330)
    SetObjectiveDisplayed(300, true, true)
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0335_Item_00
Function Fragment_Stage_0335_Item_00()
;BEGIN CODE
;Also set stage 385, so the player's not directed up to the utility area
SetStage(385)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
if !IsObjectiveCompleted(300) && !IsObjectiveFailed(300)
  SetObjectiveDisplayed(300, false, false)
endif

if !IsObjectiveCompleted(310)
  SetObjectiveDisplayed(310, false, false)
endif

if !IsObjectiveCompleted(311)
  SetObjectiveDisplayed(311, false, false)
endif

if !IsObjectiveCompleted(312)
  SetObjectiveDisplayed(312, false, false)
endif

if !GetStageDone(448)
  SetObjectiveDisplayed(340)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0347_Item_00
Function Fragment_Stage_0347_Item_00()
;BEGIN CODE
SetStage(349)
SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0348_Item_00
Function Fragment_Stage_0348_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(348)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
;Player should no longer be trespassing in the code room
SetStage(40)

;Unlock the code machine room door in case the player waits
;And Radcliff goes through without them
Alias_FSECodeMachineRoomDoor.GetRef().Unlock()

UC04_RadcliffMain_Scene355_HeadToCodeMachine.Start()

;Set the Starborn foreknowledge AV here
Game.GetPlayer().SetValue(UC05_Foreknowledge_RadcliffWantsOversightAV, 1.0)

SetObjectiveCompleted(300)
SetObjectiveCompleted(351)

if IsObjectiveDisplayed(310)
  SetObjectiveDisplayed(310, false, false)
endif

if IsObjectiveDisplayed(311)
  SetObjectiveDisplayed(311, false, false)
endif

if IsObjectiveDisplayed(312)
  SetObjectiveDisplayed(312, false, false)
endif

if IsObjectiveDisplayed(370)
  SetObjectiveDisplayed(370, false, false)
endif

if IsObjectiveDisplayed(375)
  SetObjectiveDisplayed(375, false, false)
endif

SetObjectiveCompleted(340)
SetObjectiveDisplayed(350)

;Make player owner of the machine to prevent bounty
Alias_FSECodeMachine.GetRef().SetFactionOwner(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0351_Item_00
Function Fragment_Stage_0351_Item_00()
;BEGIN CODE
SetObjectiveCompleted(348)
SetObjectiveDisplayed(351)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0352_Item_00
Function Fragment_Stage_0352_Item_00()
;BEGIN CODE
SetStage(350)
Game.GetPlayer().AddItem(Credits, UC05_RadcliffBribeCredits.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0353_Item_00
Function Fragment_Stage_0353_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Weapon_Reward_UC05_Ambassador)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
SetObjectiveCompleted(311)
SetObjectiveDisplayed(370)
Alias_CameronWhite.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
SetObjectiveCompleted(370)
SetObjectiveDisplayed(375)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0377_Item_00
Function Fragment_Stage_0377_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Large.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(UC05_Freestar_UtilityAccessKey)
SetStage(379)

if !IsObjectiveDisplayed(310)
  SetObjectiveDisplayed(310)
endif

SetObjectiveCompleted(375)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0381_Item_00
Function Fragment_Stage_0381_Item_00()
;BEGIN CODE
SetStage(379)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0395_Item_00
Function Fragment_Stage_0395_Item_00()
;BEGIN CODE
;Radcliffe activates machine
ObjectReference CodeMachineRef = Alias_FSECodeMachine.GetRef()
ObjectReference Radcliff = Alias_Radcliff.GetRef()
CodeMachineRef.AddKeyword(BlockPlayerActivation)
CodeMachineRef.PlayAnimation("Play01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0396_Item_00
Function Fragment_Stage_0396_Item_00()
;BEGIN CODE
;Radcliffe activates machine grabbing the code
Alias_FSECodeMachine.GetRef().Activate(Alias_Radcliff.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0447_Item_00
Function Fragment_Stage_0447_Item_00()
;BEGIN CODE
SetStage(449)

if IsObjectiveDisplayed(311)
  SetObjectiveFailed(311)
endif

if IsObjectiveDisplayed(370)
  SetObjectiveFailed(370)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0448_Item_00
Function Fragment_Stage_0448_Item_00()
;BEGIN CODE
;Set the general "someone in the embassy was killed" stage
SetStage(449)

if !GetStageDone(450)
  if IsObjectiveDisplayed(300)
    SetObjectiveFailed(300)
  endif

  if IsObjectiveDisplayed(310)
    SetObjectiveFailed(310)
  endif

  if IsObjectiveDisplayed(311)
    SetObjectiveFailed(311)
  endif

  if IsObjectiveDisplayed(312)
    SetObjectiveFailed(312)
  endif

  if IsObjectiveDisplayed(340)
    SetObjectiveFailed(340)
  endif

  if IsObjectiveDisplayed(348)
    SetObjectiveFailed(348)
  endif

  if IsObjectiveDisplayed(350)
    SetObjectiveFailed(350)
  endif

  if IsObjectiveDisplayed(351)
    SetObjectiveFailed(351)
  endif

  SetObjectiveDisplayed(352)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0449_Item_00
Function Fragment_Stage_0449_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(311)
  SetObjectiveFailed(311)
endif

if IsObjectiveDisplayed(370)
  SetObjectiveFailed(370)
endif

if IsObjectiveDisplayed(375)
  SetObjectiveFailed(375)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveCompleted(301)
SetObjectiveCompleted(310)

if !IsObjectiveCompleted(311) && IsObjectiveDisplayed(311)
  SetObjectiveDisplayed(311, false, false)
endif

SetObjectiveCompleted(340)
SetObjectiveCompleted(350)
SetObjectiveCompleted(352)

Game.GetPlayer().AddItem(Alias_FreestarCodePiece.GetRef())

;Activate to remove the code piece and then block further activation
Alias_FSECodeMachine.GetRef().AddKeyword(BlockPlayerActivation)

;If the player already has the Va'ruun code piece
; direct them back to MacIntrye
if GetStageDone(810)
  SetStage(900)

;Otherwise, send them to Va'ruun
else
  SetObjectiveDisplayed(500)
endif

;Set the appropriate results global
if GetStageDone(350)
  ;Player made a deal with Radcliff - but how?
  if GetStageDone(345)
    ;Player blackmailed Radcliff
    UC05_FreestarResultGlobal.SetValue(2)
  elseif GetStageDone(320)
    ;Player convinced Radcliff to help
    UC05_FreestarResultGlobal.SetValue(1)
  else
    ;Player managed to find some other way to get the goods. We'll make this as a
    ; didn't interact
    UC05_FreestarResultGlobal.SetValue(3)
  endif
else
  ;Player got the code without making a deal with Radcliff
  UC05_FreestarResultGlobal.SetValue(3)
endif

;Check to see if the player escaped trouble through blackmail
;Did the player do something wrong during this sequence?
if GetStageDone(449) || UC05_PlayerCaughtSnoopingFSE.GetValue() >= 1

  ;Did the player use blackmail against Radcliff, secure her 
  ;agreement, then not kill her
  if GetStageDone(345) && GetStageDone(350) && !GetStageDone(448)
    UC05_PlayerEscapedTroubleThroughBlackmail.SetValue(1)
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0486_Item_00
Function Fragment_Stage_0486_Item_00()
;BEGIN CODE
Actor AmbushRobot = Alias_ModelA_Ambush07.GetActorRef()
AmbushRobot.SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0487_Item_00
Function Fragment_Stage_0487_Item_00()
;BEGIN CODE
Actor AmbushRobot = Alias_ModelA_Ambush04.GetActorRef()
AmbushRobot.SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0488_Item_00
Function Fragment_Stage_0488_Item_00()
;BEGIN CODE
Alias_BoxRobot.GetRef().PlaceAtMe(UC05_HavokExplosion)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0489_Item_00
Function Fragment_Stage_0489_Item_00()
;BEGIN CODE
;Enable and push robot down stairs

ObjectReference RobotRef = Alias_RobotStairs.GetRef()
RobotRef.EnableNoWait()
RobotRef.ApplyHavokImpulse(0.0, -2.0, 0.5, 3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
Alias_PrayerCircle01.GetActorRef().SetUnconscious(false)
Alias_PrayerCircle02.GetActorRef().SetUnconscious(false)
Alias_PrayerCircle03.GetActorRef().SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0491_Item_00
Function Fragment_Stage_0491_Item_00()
;BEGIN CODE
Alias_CubicleRobot01.GetActorRef().SetUnconscious(false)
Alias_CubicleRobot02.GetActorRef().SetUnconscious(false)
Alias_CubicleRobot03.GetActorRef().SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0492_Item_00
Function Fragment_Stage_0492_Item_00()
;BEGIN CODE
ObjectReference RobotRef = Alias_FallingRobot.GetRef()
ObjectReference MarkerRef = Alias_FallingRobotMarker.GetRef()
WwiseEvent_QST_UC05_JumpScare_RobotFalling_Leaves.Play(MarkerRef)
Utility.Wait(0.5)

RobotRef.MoveTo(MarkerRef)
RobotRef.SetAngle(180, 180, 180)
RobotRef.ApplyHavokImpulse(-1.0, 0.0, 0.0, 0.5)
Alias_UC05_DustSpillMSTT.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0493_Item_00
Function Fragment_Stage_0493_Item_00()
;BEGIN CODE
Actor AmbushRobot = Alias_ModelA_Ambush06.GetActorRef()
AmbushRobot.SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0494_Item_00
Function Fragment_Stage_0494_Item_00()
;BEGIN CODE
Actor AmbushRobot = Alias_ModelA_Ambush05.GetActorRef()
AmbushRobot.SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0496_Item_00
Function Fragment_Stage_0496_Item_00()
;BEGIN CODE
Alias_ModelA_Ambush01.GetActorRef().SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0497_Item_00
Function Fragment_Stage_0497_Item_00()
;BEGIN CODE
Alias_ModelA_Ambush02.GetActorRef().SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0498_Item_00
Function Fragment_Stage_0498_Item_00()
;BEGIN CODE
Alias_ModelA_Ambush03.GetActorRef().SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN CODE
Actor AmbushRobot = Alias_ModelA_Ambush00.GetActorRef()
AmbushRobot.SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
UC05_500_Balmor_IntroIntercom.Start()
SetObjectiveDisplayed(501)
SetObjectiveDisplayed(500, false, false)
(Alias_PodRobot.GetRef() as RobotPodScript).SendRobottoPod()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN AUTOCAST TYPE UC05_QuestScript
Quest __temp = self as Quest
UC05_QuestScript kmyQuest = __temp as UC05_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateActiveIntercom(self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0507_Item_00
Function Fragment_Stage_0507_Item_00()
;BEGIN CODE
UC05_507_CodinPowerScene.Start()
SetObjectiveCompleted(501)
SetObjectiveDisplayed(507)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
;Player ignored intercom and went straight for the power switch
SetObjectiveCompleted(501)
SetStage(505)
SetStage(507)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_01
Function Fragment_Stage_0510_Item_01()
;BEGIN AUTOCAST TYPE UC05_QuestScript
Quest __temp = self as Quest
UC05_QuestScript kmyQuest = __temp as UC05_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.IncrementIntercomState()

ObjectReference DoorRef = Alias_VaruunMainDoor.GetRef()
WwiseEvent_OBJ_Server_Room_Unlock_Door.Play(DoorRef)
DoorRef.Unlock()

;Kick on first set of lights
Alias_VEPowerSwitchEnableMarker01.GetRef().Enable()

SetObjectiveCompleted(501)
SetObjectiveCompleted(507)
SetObjectiveDisplayed(510, false, false)
SetObjectiveDisplayed(515)

UC05_507_BalmorPowerScene.Stop()
UC05_510_FirstPowerSwitchThrown.Start()

WwiseEvent_OBJ_Server_Room_Light_Switch_Power_On.Play(Alias_VaruunPowerSwitch01.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN AUTOCAST TYPE UC05_QuestScript
Quest __temp = self as Quest
UC05_QuestScript kmyQuest = __temp as UC05_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateActiveIntercom(self, true)
Utility.Wait(0.5)
SetObjectiveCompleted(515)
SetObjectiveDisplayed(510)
SetStage(499)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0518_Item_00
Function Fragment_Stage_0518_Item_00()
;BEGIN CODE
;Disable on load if switch already hit once
Alias_VenomTreeHaze_Group01.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0519_Item_00
Function Fragment_Stage_0519_Item_00()
;BEGIN CODE
;Save off the active intercom into a new alias to run the scene on
Alias_SecondIntercom.ForceRefTo(Alias_ActiveIntercom.GetRef())
debug.trace("Playing scene: " + UC05_519_SecondIntercomTriggered + " on intercom:" + Alias_SecondIntercom.GetRef())
UC05_519_SecondIntercomTriggered.Start()

SetObjectiveDisplayed(510, false, false)
SetObjectiveDisplayed(519)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN AUTOCAST TYPE UC05_QuestScript
Quest __temp = self as Quest
UC05_QuestScript kmyQuest = __temp as UC05_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(519)
SetObjectiveDisplayed(510)
kmyquest.IncrementIntercomState()
kmyquest.UpdateActiveIntercom(self, true, Alias_VaruunPowerSwitch02, 510)

;Kick on first set of lights
WwiseEvent_OBJ_Server_Room_Light_Switch_Power_On.Play(Alias_VaruunPowerSwitch02.GetRef())
Alias_VEPowerSwitchEnableMarker02.GetRef().Enable()

if !GetStageDone(540)
  UC05_520_BalmorPowerBoxScene02.Start()
else
  UC05_540_BalmorPowerBoxScene03.Start()
endif

;Power up robot
(Alias_PodRobot.GetRef() as RobotPodScript).WakeRobotFromPod()

;Play sfx when switch is hit
Utility.Wait(LightDelay)
int instance1 = WwiseEvent_OBJ_Server_Room_Power_On_A_Vent_LP.Play(Alias_VentSoundMarker02.GetRef())

;Play animation on haze
kmyQuest.RemoveHaze(1)

Utility.Wait(VentDelay)
WwiseEvent.StopInstance(instance1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0529_Item_00
Function Fragment_Stage_0529_Item_00()
;BEGIN CODE
;Jira 312771 - Remove this and get these guys built into the intercom system
SetObjectiveDisplayed(510, false, false)
SetObjectiveDisplayed(529)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN AUTOCAST TYPE UC05_QuestScript
Quest __temp = self as Quest
UC05_QuestScript kmyQuest = __temp as UC05_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(529)
SetObjectiveDisplayed(510)
kmyquest.IncrementIntercomState()
kmyquest.UpdateActiveIntercom(self, true, Alias_VaruunPowerSwitch03, 520)

;Kick on last set of lights
Alias_VEPowerSwitchEnableMarker03.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0538_Item_00
Function Fragment_Stage_0538_Item_00()
;BEGIN CODE
;Disable on load if switch already hit once
Alias_VenomTreeHaze_Group02.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0539_Item_00
Function Fragment_Stage_0539_Item_00()
;BEGIN CODE
;Save off the active intercom into a new alias to run the scene on
Alias_ThirdIntercom.ForceRefTo(Alias_ActiveIntercom.GetRef())
debug.trace("Playing scene: " + UC05_539_ThirdIntercomTriggered + " on intercom:" + Alias_SecondIntercom.GetRef())
UC05_539_ThirdIntercomTriggered.Start()

SetObjectiveDisplayed(510, false, false)
SetObjectiveDisplayed(539)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN AUTOCAST TYPE UC05_QuestScript
Quest __temp = self as Quest
UC05_QuestScript kmyQuest = __temp as UC05_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(539)
SetObjectiveDisplayed(510)
kmyquest.UpdateActiveIntercom(self, true, Alias_VaruunPowerSwitch04, 520)

;Turn on lights
Alias_VEPowerSwitchEnableMarker03.GetRef().Enable()

if GetStageDone(520)
  UC05_540_BalmorPowerBoxScene03.Start()
endif

;Play sfx when switch is hit
WwiseEvent_OBJ_Server_Room_Light_Switch_Power_On.Play(Alias_VaruunPowerSwitch04.GetRef())
Utility.Wait(LightDelay)
int instance4 = WwiseEvent_OBJ_Server_Room_Power_On_A_Vent_LP.Play(Alias_VaruunPowerSwitch04.GetRef())

;Play animation on haze
kmyQuest.RemoveHaze(2)

Utility.Wait(VentDelay)
WwiseEvent.StopInstance(instance4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE UC05_QuestScript
Quest __temp = self as Quest
UC05_QuestScript kmyQuest = __temp as UC05_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.IncrementIntercomState()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Alias_VEMasterEnableMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
ObjectReference BaseDoorREF = Alias_VaruunBasementDoor.GetRef()
BaseDoorRef.Unlock()
UC05_Codin_LoopingIntercom.Stop()
UC05_Codin_Warning.Start()
SetObjectiveCompleted(510)
SetObjectiveDisplayed(650)

;Wake up the shivas in the Va'ruun Embassy
Alias_VaruunSHIVAs.SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0655_Item_00
Function Fragment_Stage_0655_Item_00()
;BEGIN CODE
SetObjectiveCompleted(650)
SetObjectiveDisplayed(655)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Actor CodinACT = Alias_Codin.GetActorRef()
CodinACT.Enable()
Alias_VaruunSafeRoomDoor.GetRef().Unlock()

SetObjectiveCompleted(650)
SetObjectiveCompleted(655)
SetObjectiveDisplayed(695)

;Turn off all other hostiles
Actor[] myRobots = Alias_HostileAI.GetActorArray()

int i = 0
while i < myRobots.Length
    myRobots[i].SetUnconscious(true)
    i += 1
endwhile

;Turn off new robots not in collection
Alias_PodRobot.GetActorRef().SetUnconscious(true)
Alias_PrayerCircle01.GetActorRef().SetUnconscious(true)
Alias_PrayerCircle02.GetActorRef().SetUnconscious(true)
Alias_PrayerCircle03.GetActorRef().SetUnconscious(true)

Alias_VaruunCodeMachine.GetRef().BlockActivation(true, false)

SetStage(701)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0701_Item_00
Function Fragment_Stage_0701_Item_00()
;BEGIN CODE
Alias_Codin.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0705_Item_00
Function Fragment_Stage_0705_Item_00()
;BEGIN CODE
;Turn on Bal'mor's intercom marker
Alias_IntercomSoundMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
UC05_Codin_Intro_Scene710.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
SetObjectiveCompleted(695)
SetObjectiveDisplayed(710)
Alias_Codin.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0725_Item_00
Function Fragment_Stage_0725_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(725)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0748_Item_00
Function Fragment_Stage_0748_Item_00()
;BEGIN CODE
Actor CodACT = Alias_Codin.GetActorRef()
CodACT.AddtoFaction(PlayerEnemyFaction)
CodACT.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0749_Item_00
Function Fragment_Stage_0749_Item_00()
;BEGIN CODE
UC05_AndrejaBalmorDiscussedPlayer.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0780_Item_00
Function Fragment_Stage_0780_Item_00()
;BEGIN CODE
SetObjectiveFailed(725)
SetObjectiveCompleted(730)
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0790_Item_00
Function Fragment_Stage_0790_Item_00()
;BEGIN CODE
if !IsObjectiveCompleted(695)
  SetObjectiveFailed(695)
endif

if !IsObjectiveCompleted(700)
  SetObjectiveFailed(700)
endif 

if !IsObjectiveCompleted(710)
  SetObjectiveFailed(710)
endif

if !IsObjectiveCompleted(725)
  SetObjectiveFailed(725)
endif

if !IsObjectiveCompleted(730)
  SetObjectiveFailed(730)
endif

if !IsObjectiveCompleted(790)
  SetObjectiveDisplayed(790)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0795_Item_00
Function Fragment_Stage_0795_Item_00()
;BEGIN CODE
Alias_VaruunCodeMachine.GetRef().PlayAnimation("Play01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0796_Item_00
Function Fragment_Stage_0796_Item_00()
;BEGIN CODE
SetObjectiveCompleted(710)
SetObjectiveDisplayedAtTop(500)
UC05_796_Balmor_CollectCodePiece.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0798_Item_00
Function Fragment_Stage_0798_Item_00()
;BEGIN CODE
SetStage(799)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0799_Item_00
Function Fragment_Stage_0799_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_VaruunCodePiece.GetRef())
SetObjectiveDisplayed(730, false, false)
SetStage(800)
SetStage(810)

;Check to see if our companion during the scene was Andreja
;If so, set a var to unlock things in her scene
ObjectReference CompREF = Alias_Companion.GetRef()
ObjectReference AndrejaREF = Alias_Andreja.GetRef()

;If so, and she's close enough, set the appropriate global
if CompRef != none && AndrejaREF != none && CompRef == AndrejaRef && CompRef.GetDistance(Game.GetPlayer()) <= COM_InterjectionDistance.GetValue()
  UC05_AndrejaPresentForBalmorDiscussion.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(790)

if !GetStageDone(790)
  SetObjectiveCompleted(710)
endif

if !GetStageDone(799)
  SetObjectiveCompleted(730)  
  SetObjectiveDisplayed(800)
endif

Alias_VaruunCodeMachine.GetRef().BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveCompleted(800)
Game.GetPlayer().AddItem(Alias_VaruunCodePiece.GetRef())
Alias_VaruunCodeMachine.GetRef().AddKeyword(BlockPlayerActivation)

;If the player already has the Va'ruun code piece
; direct them back to MacIntrye
if GetStageDone(450)
  SetStage(900)
endif

;Mark off the results global
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE UC04_ToggleHallScreens
Quest __temp = self as Quest
UC04_ToggleHallScreens kmyQuest = __temp as UC04_ToggleHallScreens
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(900)

;Turn on the City Life post-morph attack scene
pUC_NA_CL_PostTerrormorphAttackScene.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0915_Item_00
Function Fragment_Stage_0915_Item_00()
;BEGIN CODE
UC05_FreestarObserversAccepted.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0925_Item_00
Function Fragment_Stage_0925_Item_00()
;BEGIN AUTOCAST TYPE UC04_ToggleHallScreens
Quest __temp = self as Quest
UC04_ToggleHallScreens kmyQuest = __temp as UC04_ToggleHallScreens
;END AUTOCAST
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()
PlayACT.AddItem(UC05_ArmisticeArchiveAccessCard)
PlayACT.AddItem(Alias_UCCodePiece.GetRef())
SetObjectiveCompleted(900)
SetObjectiveDisplayed(925)

;Turn off the screens in the Minister's hall
kmyquest.UpdateHallScreens(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0930_Item_00
Function Fragment_Stage_0930_Item_00()
;BEGIN CODE
UC05_930_ArchiveScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0935_Item_00
Function Fragment_Stage_0935_Item_00()
;BEGIN CODE
SetObjectiveCompleted(925)
SetObjectiveDisplayed(930)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0940_Item_00
Function Fragment_Stage_0940_Item_00()
;BEGIN CODE
UC05_940_ArchiveMonitorInstructions.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetObjectiveCompleted(930)
SetObjectiveDisplayed(950)
Alias_VaruunCodeReceptacle.GetRef().RemoveKeyword(BlockPlayerActivation)
Alias_FreestarCodeReceptacle.GetRef().RemoveKeyword(BlockPlayerActivation)
Alias_UCCodeReceptacle.GetRef().RemoveKeyword(BlockPlayerActivation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0952_Item_00
Function Fragment_Stage_0952_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_UCCodePiece.GetRef())

;If the player has inserted all the other pieces, proceed
if GetStageDone(956) && GetStageDone(954)
  SetStage(960)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0954_Item_00
Function Fragment_Stage_0954_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_FreestarCodePiece.GetRef())

;If the player has inserted all the other pieces, proceed
if GetStageDone(952) && GetStageDone(956)
  SetStage(960)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0956_Item_00
Function Fragment_Stage_0956_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_VaruunCodePiece.GetRef())

;If the player has inserted all the other pieces, proceed
if GetStageDone(952) && GetStageDone(954)
  SetStage(960)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0960_Item_00
Function Fragment_Stage_0960_Item_00()
;BEGIN CODE
SetObjectiveCompleted(950)
SetObjectiveDisplayed(960)

ObjectReference VaultDoorRef = Alias_AAVaultDoor.GetRef()
WwiseEvent_QST_UC05_Unlock_Door_Success_Play.Play(VaultDoorRef)
VaultDoorRef.Unlock()
VaultDoorRef.Activate(Alias_UC02_DefenseSystem.GetRef())
UC05_960_CodesVerified.Start()

;Starborn UC04 - tag the player with having successfully opened the Archives
Game.GetPlayer().SetValue(UC04_Foreknowledge_OpenedArchivesAV, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0965_Item_00
Function Fragment_Stage_0965_Item_00()
;BEGIN CODE
;Backup enable and teleport failsafe for Hadrian

ObjectReference HadrianRef = Alias_Hadrian.GetRef()
if HadrianRef.IsDisabled()
    HadrianRef.EnableNoWait()
endif
if HadrianRef.GetDistance(HadrianTeleportMarker) > 5
    HadrianRef.MoveTo(HadrianTeleportMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0970_Item_00
Function Fragment_Stage_0970_Item_00()
;BEGIN CODE
SetObjectiveCompleted(960)
SetObjectiveDisplayed(970)

Game.GetPlayer().AddItem(Alias_TerrormorphData.GetRef())

;Get Hadrian into place
ObjectReference HadrianRef = Alias_Hadrian.GetRef()
HadrianRef.EnableNoWait()
HadrianRef.MoveTo(HadrianTeleportMarker)

;Disable activator
Alias_Cabinet18.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0972_Item_00
Function Fragment_Stage_0972_Item_00()
;BEGIN CODE
ObjectReference AADoor = Alias_AAVaultDoor.GetRef()
Alias_AAVaultDoor.GetRef().SetOpen(false)
AADoor.Lock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0975_Item_00
Function Fragment_Stage_0975_Item_00()
;BEGIN CODE
UC05_970_CodinHadrianAttract.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN CODE
SetObjectiveCompleted(970)
SetObjectiveDisplayed(980)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0982_Item_00
Function Fragment_Stage_0982_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_TerrormorphData.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0985_Item_00
Function Fragment_Stage_0985_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().EvaluatePackage()

;Direct the player to follow MacInytre
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
Alias_MAST_EmergencyDoor.GetRef().Lock(false)
Alias_DeputyMacIntyre.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(980)
SetObjectiveDisplayed(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0997_Item_00
Function Fragment_Stage_0997_Item_00()
;BEGIN CODE
UC05_PlayerIsUCCitizen.SetValue(1)
Actor PlayACT = Game.GetPlayer()
PlayACT.AddItem(UC05_PlayerCitizenshipID01)
PlayACT.AddPerk(UC_CitizenVendorDiscount_Rank01)

UC05_Realty_Misc.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Save out whether the player caused an incident or not
;NOTE: If the player did get in trouble in the Embassy and then
;blackmailed Radcliff, it'll clear up the incident

if (UC05_PlayerCaughtSnoopingFSE.GetValue() >= 1 || GetStageDone(449)) && (!GetStageDone(345) && !GetStageDone(350))
    UC05_PlayerCausedIncident.SetValue(1)
endif

;Turn on Hadrian's sandboxing at RDHQ
UC05_HadrianSandboxing_PostUC05.SetValue(1)

;Get her ship turned on
Alias_HadrianShip_RHQ.GetRef().Enable()

;Cheif Yasin now gets turned on in the first part of UC06, while the player's on a different floor.


;Player's in the UC now. Tag them with the dialogue option
Game.GetPlayer().AddPerk(FactionUnitedColoniesPerk)

;Silently revoke Player access to Embassy
Game.GetPlayer().RemoveItem(UC05_Freestar_ElevatorKey, abSilent=true)

UC06.Start()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property UC04_MacIntyreIntro_Scene150 Auto Const Mandatory

ReferenceAlias Property Alias_DeputyMacIntyre Auto Const Mandatory

Message Property UC04_DEBUG_DataslatesDontWork Auto Const Mandatory

Scene Property UC04_RadcliffIIntro_Scene300 Auto Const Mandatory

ObjectReference Property DebugMarker01 Auto Const Mandatory

ObjectReference Property DebugMarker02 Auto Const

ObjectReference Property DebugMarker10 Auto Const

Message Property UC05_DEBUG_Powerswitch01 Auto Const Mandatory

ReferenceAlias Property Alias_VaruunMainDoor Auto Const Mandatory

ReferenceAlias Property Alias_VaruunBasementDoor Auto Const Mandatory

Scene Property UC05_Codin_Warning Auto Const Mandatory

ReferenceAlias Property Alias_VaruunSafeRoomDoor Auto Const Mandatory

ReferenceAlias Property Alias_Codin Auto Const Mandatory

Scene Property UC05_Codin_Intro_Scene710 Auto Const Mandatory

Scene Property UC05_Codin_LoopingIntercom Auto Const Mandatory

Message Property UC05_DEBUG_CodinGameplayMessage Auto Const Mandatory

Key Property UC05_CodeMachineKey_Varuun Auto Const Mandatory

Book Property UC05_FreestarArchivalCode Auto Const Mandatory

ReferenceAlias Property Alias_FreestarDossier Auto Const Mandatory

ReferenceAlias Property Alias_FreestarCodePiece Auto Const Mandatory

ReferenceAlias Property Alias_VaruunCodePiece Auto Const Mandatory

ReferenceAlias Property Alias_UCCodePiece Auto Const Mandatory

Scene Property UC05_930_ArchiveScene Auto Const Mandatory

Scene Property UC05_960_CodesVerified Auto Const Mandatory

ReferenceAlias Property Alias_TerrormorphData Auto Const Mandatory

Scene Property UC05_970_CodinHadrianAttract Auto Const Mandatory

ObjectReference Property HadrianTeleportMarker Auto Const Mandatory

ReferenceAlias Property Alias_Hadrian Auto Const Mandatory

ReferenceAlias Property Alias_CameronWhite Auto Const Mandatory

ReferenceAlias Property Alias_Radcliff Auto Const Mandatory

ObjectReference Property WhiteTeleportMarker Auto Const Mandatory

Key Property UC05_CodeMachineKey_Freestar Auto Const Mandatory

Scene Property UC05_507_CodinPowerScene Auto Const Mandatory

Message Property UC05_DEBUG_Powerswitch02 Auto Const Mandatory

Quest Property UC06 Auto Const Mandatory

Weapon Property UC05_Reward_Regulator Auto Const Mandatory

Key Property UC05_Freestar_UtilityAccessKey Auto Const Mandatory

ReferenceAlias Property Alias_VaruunPowerSwitch02 Auto Const Mandatory

ReferenceAlias Property Alias_VaruunPowerSwitch03 Auto Const Mandatory

ReferenceAlias Property Alias_VaruunPowerSwitch04 Auto Const Mandatory

Scene Property UC05_500_Balmor_IntroIntercom Auto Const Mandatory

ReferenceAlias Property Alias_VEPowerSwitchEnableMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_VEPowerSwitchEnableMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_VEPowerSwitchEnableMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_VEMasterEnableMarker Auto Const Mandatory

Scene Property UC05_510_FirstPowerSwitchThrown Auto Const Mandatory

Book Property UC05_FreestarSecurityWarning Auto Const Mandatory

ReferenceAlias Property Alias_FSE_SecurityNotation Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property UC05_PlayerIsUCCitizen Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Large Auto Const Mandatory

ReferenceAlias Property Alias_AAVaultDoor Auto Const Mandatory

ReferenceAlias Property Alias_IntercomSoundMarker Auto Const Mandatory

Perk Property UC_CitizenVendorDiscount_Rank01 Auto Const Mandatory

GlobalVariable Property UC05_FreestarResultGlobal Auto Const Mandatory

GlobalVariable Property UC05_VaruunResultGlobal Auto Const Mandatory

GlobalVariable Property UC05_PlayerCausedIncident Auto Const Mandatory

GlobalVariable Property UC05_PlayerCaughtSnoopingFSE Auto Const Mandatory

Key Property UC05_Freestar_EmbassyAccessCard Auto Const Mandatory

Key Property UC05_Varuun_EmbassyAccessKey Auto Const Mandatory

Message Property UC05_DEBUG_AccessingListeningDevice Auto Const Mandatory

Scene Property UC04_RadcliffMain_Scene355_HeadToCodeMachine Auto Const Mandatory

RefCollectionAlias Property Alias_VaruunSHIVAs Auto Const Mandatory

GlobalVariable Property UC05_PlayerEscapedTroubleThroughBlackmail Auto Const Mandatory

Key Property UC05_ArmisticeArchiveAccessCard Auto Const Mandatory

ReferenceAlias Property Alias_MinisterToNATDoor Auto Const Mandatory

Scene Property UC05_520_BalmorPowerBoxScene02 Auto Const Mandatory

Scene Property UC05_540_BalmorPowerBoxScene03 Auto Const Mandatory

Scene Property UC05_940_ArchiveMonitorInstructions Auto Const Mandatory

ReferenceAlias Property Alias_UC02_DefenseSystem Auto Const Mandatory

Key Property UC05_PlayerCitizenshipID01 Auto Const Mandatory

GlobalVariable Property UC05_HadrianSandboxing_PostUC05 Auto Const Mandatory

Message Property UC05_DEBUG_EnterVenomTreeRoom Auto Const Mandatory

ReferenceAlias Property Alias_ChiefYasin Auto Const Mandatory

Scene Property UC05_519_SecondIntercomTriggered Auto Const Mandatory

Scene Property UC05_539_ThirdIntercomTriggered Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Perk Property FactionUnitedColoniesPerk Auto Const Mandatory

GlobalVariable Property UC05_FreestarObserversAccepted Auto Const Mandatory

ActorValue Property UC04_Foreknowledge_OpenedArchivesAV Auto Const Mandatory

Scene Property UC05_110_Hadrian_IntroScene Auto Const Mandatory

GlobalVariable Property UC05_AndrejaBalmorDiscussedPlayer Auto Const Mandatory

GlobalVariable Property UC05_AndrejaPresentForBalmorDiscussion Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

GlobalVariable Property COM_InterjectionDistance Auto Const Mandatory

Scene Property UC05_796_Balmor_CollectCodePiece Auto Const Mandatory

ActorValue Property UC05_Foreknowledge_RadcliffWantsOversightAV Auto Const Mandatory

ReferenceAlias Property Alias_SecondIntercom Auto Const Mandatory

ReferenceAlias Property Alias_ThirdIntercom Auto Const Mandatory

ReferenceAlias Property Alias_ActiveIntercom Auto Const Mandatory

ReferenceAlias Property Alias_VaruunIntercom01 Auto Const Mandatory

Scene Property UC05_507_BalmorPowerScene Auto Const Mandatory

Quest Property UC05_Realty_Misc Auto Const Mandatory

WwiseEvent Property OBJ_Server_Room_Light_Switch_Power_On_Play Auto Const Mandatory

Quest Property pUC_NA_CL_PostTerrormorphAttackScene Auto Const Mandatory

ReferenceAlias Property Alias_FSECodeMachine Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property FreestarEmbassyFaction Auto Const Mandatory

ReferenceAlias Property Alias_ModelA_Ambush01 Auto Const Mandatory

ReferenceAlias Property Alias_ModelA_Ambush02 Auto Const Mandatory

ReferenceAlias Property Alias_ModelA_Ambush03 Auto Const Mandatory

WwiseEvent Property WwiseEvent_OBJ_Server_Room_Light_Switch_Power_On Auto Const Mandatory

WwiseEvent Property WwiseEvent_OBJ_Server_Room_Power_On_A_Vent_LP Auto Const Mandatory

ReferenceAlias Property Alias_VaruunPowerSwitch01 Auto Const Mandatory

Float Property LightDelay Auto Const Mandatory

Float Property VentDelay Auto Const Mandatory

RefCollectionAlias Property Alias_HostileAI Auto Const Mandatory

ReferenceAlias Property Alias_VentSoundMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_VentSoundMarker04 Auto Const Mandatory

ReferenceAlias Property Alias_Cabinet18 Auto Const Mandatory

WwiseEvent Property WwiseEvent_OBJ_Server_Room_Unlock_Door Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC05_Unlock_Door_Success_Play Auto Const Mandatory

ReferenceAlias Property Alias_ModelA_Ambush04 Auto Const Mandatory

ReferenceAlias Property Alias_ModelA_Ambush05 Auto Const Mandatory

ReferenceAlias Property Alias_ModelA_Ambush06 Auto Const Mandatory

ReferenceAlias Property Alias_PodRobot Auto Const Mandatory

Keyword Property BlockPlayerActivation Auto Const Mandatory

ReferenceAlias Property Alias_VaruunCodeMachine Auto Const Mandatory

LeveledItem Property LL_Weapon_Reward_UC05_Ambassador Auto Const Mandatory

ReferenceAlias Property Alias_HadrianShip_RHQ Auto Const Mandatory

ReferenceAlias Property Alias_FallingRobot Auto Const Mandatory

ReferenceAlias Property Alias_CubicleRobot01 Auto Const Mandatory

ReferenceAlias Property Alias_CubicleRobot02 Auto Const Mandatory

ReferenceAlias Property Alias_CubicleRobot03 Auto Const Mandatory

ReferenceAlias Property Alias_PrayerCircle01 Auto Const Mandatory

ReferenceAlias Property Alias_PrayerCircle02 Auto Const Mandatory

ReferenceAlias Property Alias_PrayerCircle03 Auto Const Mandatory

ReferenceAlias Property Alias_FallingRobotMarker Auto Const Mandatory

ReferenceAlias Property Alias_VaruunCodeReceptacle Auto Const Mandatory

ReferenceAlias Property Alias_FreestarCodeReceptacle Auto Const Mandatory

ReferenceAlias Property Alias_UCCodeReceptacle Auto Const Mandatory

Key Property UC05_Freestar_ElevatorKey Auto Const Mandatory

ReferenceAlias Property Alias_RobotStairs Auto Const Mandatory

ReferenceAlias Property Alias_UC05_DustSpillMSTT Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC05_JumpScare_RobotFalling_Leaves Auto Const Mandatory

Explosion Property UC05_HavokExplosion Auto Const Mandatory

ReferenceAlias Property Alias_BoxRobot Auto Const Mandatory

ReferenceAlias Property Alias_BoxRobot01 Auto Const Mandatory

ObjectReference Property DebugMarker11 Auto Const Mandatory

ReferenceAlias Property Alias_MAST_EmergencyDoor Auto Const Mandatory

ReferenceAlias Property Alias_MASTWorkerMale04 Auto Const Mandatory

GlobalVariable Property UC05_RadcliffBribeCredits Auto Const Mandatory

RefCollectionAlias Property Alias_VenomTreeHaze_Group01 Auto Const Mandatory

RefCollectionAlias Property Alias_VenomTreeHaze_Group02 Auto Const Mandatory

ReferenceAlias Property Alias_FreestarGuard_RadcliffeOffice Auto Const Mandatory

ReferenceAlias Property Alias_ModelA_Ambush00 Auto Const Mandatory

ReferenceAlias Property Alias_ModelA_Ambush07 Auto Const Mandatory

ReferenceAlias Property Alias_TrespassTrigger Auto Const Mandatory

Keyword Property UC05_FSE_TrespassLink Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Faction_03_Large Auto Const Mandatory

ReferenceAlias Property Alias_FSECodeMachineRoomDoor Auto Const Mandatory
