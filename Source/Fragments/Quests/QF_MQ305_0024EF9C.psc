;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ305_0024EF9C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)


;give player some materials to build the armillary mount
Game.GetPlayer().addITem(Mfg_Structural_Frame, 12)
Game.GetPlayer().additem(MQAllArtifacts)
;make sure player can board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

Int iRomance = MQ305_MSG_Romance.Show()
If iRomance == 0
  Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1)
  Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1)
  Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1)
  Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==1
  Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==2
  Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==3
  Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==4
  Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1)
EndIf
Utility.Wait(0.1)

Int ButtonPressed = TestMQ206AMSG.Show()
If ButtonPressed == 0
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.getActorRef())
  Alias_SarahMorgan.getActorRef().KillEssential()
  Alias_SarahMorgan.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFSarahMorgan)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) 
ElseIf ButtonPressed == 1
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.getActorRef())
  Alias_SamCoe.getActorRef().KillEssential()
  Alias_SamCoe.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMSamCoe)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) 
ElseIf ButtonPressed == 2
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.getActorRef())
  Alias_Andreja.getActorRef().KillEssential()
  Alias_Andreja.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFAndreja)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_Andreja.GetValueInt())
ElseIf ButtonPressed == 3
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.getActorRef())
  Alias_Barrett.getActorRef().KillEssential()
  Alias_Barrett.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMBarrett)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) 
EndIf
Utility.Wait(0.1)

int iCFEnding = MQ305_MSG_CF.Show()
If iCFEnding == 0
  MQ305_CF_SysDefEnding.SetValueInt(1)
ElseIf iCFEnding == 1
  MQ305_CF_PirateEnding.SetValueInt(1)
EndIf
Utility.Wait(0.1)

int iFSCEnding = MQ305_MSG_FSC.Show()
If iFSCEnding==0
  MQ305_FSC_RonHopeKilled.SetValueInt(1)
ElseIf iFSCEnding==1
  MQ305_FSC_RonHopeBribeAccepted.SetValueInt(1)
ElseIf iFSCEnding==2
  MQ305_FSC_RonHopeJailed.SetValueInt(1)
EndIf
Utility.Wait(0.1)

int iRIEnding = MQ305_MSG_RI.Show()
IF iRIEnding == 0
  MQ305_RI_NeuroampPromoted.SetValueInt(1)
ElseIf iRIEnding == 1
  MQ305_RI_NeuroampNotPromoted.SetValueInt(1)
EndIf
Utility.Wait(0.1)

int iUCEnding = MQ305_MSG_UC.Show()
If iUCEnding==0
  MQ305_UC_PlagueEnding.SetValueInt(1)
ElseIf iUCEnding==1
  MQ305_UC_AcelesEnding.SetValueInt(1)
EndIf

Utility.Wait(0.1)
int iStarbornEnding = MQ305_MSG_Starborn.Show()
If iStarbornEnding == 0
  MQ302_SidedWithChoice.SetValueInt(0)
ElseIf iStarbornEnding == 1
  MQ302_SidedWithChoice.SetValueInt(1)
ElseIf iStarbornEnding == 2
  MQ302_SidedWithChoice.SetValueInt(2)
EndIf


Alias_SamCoe.GetActorRef().AddtoFaction(AvailableCompanionFaction)
Alias_Andreja.GetActorRef().AddtoFaction(AvailableCompanionFaction)
Com_SamCoeRecruited.SetValue(1)

Alias_Barrett.GetActorRef().moveto(LodgeStartMarker)

Alias_EmissaryShip.GetRef().Enable()
Alias_HunterShip.GetRef().Enable()

;move the Hunter and Emissary onboard
Alias_Emissary.GetActorRef().moveto(MQ303EmissaryMarker01)
Alias_Hunter.GetActorRef().moveto(MQ303_StarbornHunterMarker01)

MQ206C.SetStage(1000)
SetStage(10)

MQ304_PostQuestDialogue.Start()
MQ303.SetStage(210)

Game.ShowRaceMenu()

Utility.wait(0.1)

Game.GetPlayer().moveto(LodgeStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;MQ101Debug.SetValueInt(2)
;MQ101.SetStage(1800)
;MQ102.CompleteQuest()

Int iRomance = MQ305_MSG_Romance.Show()
If iRomance == 0
  Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1)
  Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1)
  Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1)
  Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==1
  Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==2
  Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==3
  Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==4
  Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1)
EndIf
Utility.Wait(0.1)

Int ButtonPressed = TestMQ206AMSG.Show()
If ButtonPressed == 0
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.getActorRef())
  Alias_SarahMorgan.getActorRef().KillEssential()
  Alias_SarahMorgan.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFSarahMorgan)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) 
ElseIf ButtonPressed == 1
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.getActorRef())
  Alias_SamCoe.getActorRef().KillEssential()
  Alias_SamCoe.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMSamCoe)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) 
ElseIf ButtonPressed == 2
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.getActorRef())
  Alias_Andreja.getActorRef().KillEssential()
  Alias_Andreja.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFAndreja)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_Andreja.GetValueInt())
ElseIf ButtonPressed == 3
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.getActorRef())
  Alias_Barrett.getActorRef().KillEssential()
  Alias_Barrett.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMBarrett)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) 
EndIf
Utility.Wait(0.1)

int iCFEnding = MQ305_MSG_CF.Show()
If iCFEnding == 0
  MQ305_CF_SysDefEnding.SetValueInt(1)
ElseIf iCFEnding == 1
  MQ305_CF_PirateEnding.SetValueInt(1)
EndIf
Utility.Wait(0.1)

int iFSCEnding = MQ305_MSG_FSC.Show()
If iFSCEnding==0
  MQ305_FSC_RonHopeKilled.SetValueInt(1)
ElseIf iFSCEnding==1
  MQ305_FSC_RonHopeBribeAccepted.SetValueInt(1)
ElseIf iFSCEnding==2
  MQ305_FSC_RonHopeJailed.SetValueInt(1)
EndIf
Utility.Wait(0.1)

int iRIEnding = MQ305_MSG_RI.Show()
IF iRIEnding == 0
  MQ305_RI_NeuroampPromoted.SetValueInt(1)
ElseIf iRIEnding == 1
  MQ305_RI_NeuroampNotPromoted.SetValueInt(1)
EndIf
Utility.Wait(0.1)

int iUCEnding = MQ305_MSG_UC.Show()
If iUCEnding==0
  MQ305_UC_PlagueEnding.SetValueInt(1)
ElseIf iUCEnding==1
  MQ305_UC_AcelesEnding.SetValueInt(1)
ElseIf iUCEnding == 2
  MQ305_UC_SterilizationEnding.SetValueInt(1)
EndIf

Utility.Wait(0.1)
int iStarbornEnding = MQ305_MSG_Starborn.Show()
If iStarbornEnding == 0
  MQ302_SidedWithChoice.SetValueInt(0)
ElseIf iStarbornEnding == 1
  MQ302_SidedWithChoice.SetValueInt(1)
ElseIf iStarbornEnding == 2
  MQ302_SidedWithChoice.SetValueInt(2)
EndIf

Game.ShowRaceMenu()

Utility.Wait(0.1)

Game.GetPlayer().moveto(UnityMovetoMarker)

(SQ_ENV as SQ_ENV_AfflictionsScript).CureAllAfflictions()
Game.GetPlayer().ResetHealthAndLimbs()

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ102.CompleteQuest()

Int iRomance = MQ305_MSG_Romance.Show()
If iRomance == 0
  Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1)
  Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1)
  Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1)
  Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==1
  Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==2
  Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==3
  Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1)
Elseif iRomance==4
  Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1)
EndIf
Utility.Wait(0.1)

Int ButtonPressed = TestMQ206AMSG.Show()
If ButtonPressed == 0
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.getActorRef())
  Alias_SarahMorgan.getActorRef().KillEssential()
  Alias_SarahMorgan.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFSarahMorgan)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) 
ElseIf ButtonPressed == 1
  MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.getActorRef())
  Alias_SamCoe.getActorRef().KillEssential()
  Alias_SamCoe.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMSamCoe)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) 
ElseIf ButtonPressed == 2
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.getActorRef())
  Alias_Andreja.getActorRef().KillEssential()
  Alias_Andreja.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFAndreja)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_Andreja.GetValueInt())
ElseIf ButtonPressed == 3
  MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.getActorRef())
  Alias_Barrett.getActorRef().KillEssential()
  Alias_Barrett.getActorRef().disable()
  Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMBarrett)
  MQ_CompanionDead.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) 
EndIf
Utility.Wait(0.1)

int iCFEnding = MQ305_MSG_CF.Show()
If iCFEnding == 0
  MQ305_CF_SysDefEnding.SetValueInt(1)
ElseIf iCFEnding == 1
  MQ305_CF_PirateEnding.SetValueInt(1)
EndIf
Utility.Wait(0.1)

int iFSCEnding = MQ305_MSG_FSC.Show()
If iFSCEnding==0
  MQ305_FSC_RonHopeKilled.SetValueInt(1)
ElseIf iFSCEnding==1
  MQ305_FSC_RonHopeBribeAccepted.SetValueInt(1)
ElseIf iFSCEnding==2
  MQ305_FSC_RonHopeJailed.SetValueInt(1)
EndIf
Utility.Wait(0.1)

int iRIEnding = MQ305_MSG_RI.Show()
IF iRIEnding == 0
  MQ305_RI_NeuroampPromoted.SetValueInt(1)
ElseIf iRIEnding == 1
  MQ305_RI_NeuroampNotPromoted.SetValueInt(1)
EndIf
Utility.Wait(0.1)

int iUCEnding = MQ305_MSG_UC.Show()
If iUCEnding==0
  MQ305_UC_PlagueEnding.SetValueInt(1)
ElseIf iUCEnding==1
  MQ305_UC_AcelesEnding.SetValueInt(1)
EndIf

Utility.Wait(0.1)
int iStarbornEnding = MQ305_MSG_Starborn.Show()
If iStarbornEnding == 0
  MQ302_SidedWithChoice.SetValueInt(0)
ElseIf iStarbornEnding == 1
  MQ302_SidedWithChoice.SetValueInt(1)
ElseIf iStarbornEnding == 2
  MQ302_SidedWithChoice.SetValueInt(2)
EndIf

Game.ShowRaceMenu()
Utility.Wait(0.1)

Game.GetPlayer().moveto(UnityMovetoMarker)
Game.SetCharGenHUDMode(1) ;hide HUD
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().moveto(UnityMovetoMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;make sure player can build the armillary
MQAlllowArmillaryGravDrive.SetValueInt(1)

SetObjectiveDisplayed(30)
SetObjectiveDisplayedAtTop(30)

If MQ401_SkipMQ.GetValueInt() == 0
  SetObjectiveDisplayed(50)
EndIf

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
SpaceshipReference PlayerShipREF = Alias_PlayerShip.GetShipRef()

;set the player's grav-drive to be unpowered and lock AI allocation
;AI Allocation is unlocked when the Armillary RefAlias changes
PlayerShipREF.LockPowerAllocation(3, -1, True)
PlayerShipREF.SetPartPower(3, -1, 0)

MQ305JumpToUnityMSG.Show()

Utility.Wait(0.1)

SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(60)
SetObjectiveDisplayedAtTop(60)
SetObjectiveDisplayed(70)

kmyquest.UpdateFriendTalkCount() ;update count in case Sam is dead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckFriendUnityTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0053_Item_00
Function Fragment_Stage_0053_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckFriendUnityTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0054_Item_00
Function Fragment_Stage_0054_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckFriendUnityTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckFriendUnityTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0056_Item_00
Function Fragment_Stage_0056_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckFriendUnityTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0057_Item_00
Function Fragment_Stage_0057_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckFriendUnityTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0058_Item_00
Function Fragment_Stage_0058_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckFriendUnityTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0059_Item_00
Function Fragment_Stage_0059_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckFriendUnityTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckFriendUnityTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckFriendUnityTalks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.LockPlayerControlsUnity()

SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveCompleted(60)
SetObjectiveCompleted(70)
SetObjectiveCompleted(80)

;if Sam is dead, Cora dissappears
If Alias_SamCoe.GetActorRef().IsDead()
  Alias_CoraCoe.GetActorRef().Disable()
EndIf

;Hunter dissappears if he's not dead
Actor HunterREF = Alias_Hunter.GetActorRef()
If !HunterREF.IsDead()
  HunterREF.Disable()
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.CheckMultipleRomance()
MQ305_002_Unity_01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
MQ305InitialCollisionEnableMarker.DisableNoWait()

MQ305_002_Unity_04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
kmyquest.EnableUnityEndScenes()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0207_Item_00
Function Fragment_Stage_0207_Item_00()
;BEGIN CODE
MQ305_002_Unity_06.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
MQ305ReturnFromUnityMSG.Show()

SetObjectiveCompleted(90)
SetObjectiveDisplayed(120)
SetObjectiveDisplayedatTop(120)

;if Kill Aquilus quest was running, shut it down
IF MQ304b.IsRunning()
  If MQ304b.GetStageDone(10)
     MQ304b.Setstage(1300)
  Else
     MQ304b.Stop()
  EndIf
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
MQ305_002_Unity_04.Stop()
MQ305_002_Unity_05.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE mq305script
Quest __temp = self as Quest
mq305script kmyQuest = __temp as mq305script
;END AUTOCAST
;BEGIN CODE
;Achievement Unlocked
Game.AddAchievement(10)

CompleteAllObjectives()
kmyquest.EnterUnity()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Emissary Auto Const Mandatory

ObjectReference Property UnityMovetoMarker Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

Message Property MQ305_MSG_Romance Auto Const Mandatory

ActorValue Property COM_IsRomantic Auto Const Mandatory

Message Property MQ305_MSG_CF Auto Const Mandatory

GlobalVariable Property MQ305_CF_SysDefEnding Auto Const Mandatory

GlobalVariable Property MQ305_CF_PirateEnding Auto Const Mandatory

Message Property MQ305_MSG_FSC Auto Const Mandatory

GlobalVariable Property MQ305_FSC_RonHopeBribeAccepted Auto Const Mandatory

GlobalVariable Property MQ305_FSC_RonHopeJailed Auto Const Mandatory

GlobalVariable Property MQ305_FSC_RonHopeKilled Auto Const Mandatory

Message Property MQ305_MSG_RI Auto Const Mandatory

GlobalVariable Property MQ305_RI_NeuroampNotPromoted Auto Const Mandatory

GlobalVariable Property MQ305_RI_NeuroampPromoted Auto Const Mandatory

Message Property MQ305_MSG_UC Auto Const Mandatory

GlobalVariable Property MQ305_UC_AcelesEnding Auto Const Mandatory

GlobalVariable Property MQ305_UC_PlagueEnding Auto Const Mandatory

Quest Property MQ206C Auto Const Mandatory

Message Property MQ305JumpToUnityMSG Auto Const Mandatory

ReferenceAlias Property Alias_CoraCoe Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

ReferenceAlias Property MQ00_CompanionWhoDies Auto Const

VoiceType Property NPCFSarahMorgan Auto Const Mandatory

VoiceType Property NPCMSamCoe Auto Const Mandatory

VoiceType Property NPCFAndreja Auto Const Mandatory

VoiceType Property NPCMBarrett Auto Const Mandatory

Message Property TestMQ206AMSG Auto Const Mandatory

ObjectReference Property LodgeStartMarker Auto Const Mandatory

ObjectReference Property TestMQ303Marker01 Auto Const Mandatory

ObjectReference Property MQ303_StarbornHunterMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_HunterShip Auto Const Mandatory

ReferenceAlias Property Alias_EmissaryShip Auto Const Mandatory

ReferenceAlias Property Alias_Hunter Auto Const Mandatory

Quest Property MQ304_PostQuestDialogue Auto Const Mandatory

Quest Property MQ303 Auto Const Mandatory

Faction Property AvailableCompanionFaction Auto Const Mandatory

GlobalVariable Property COM_SamCoeRecruited Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

ObjectReference Property MQ303EmissaryMarker01 Auto Const Mandatory

MiscObject Property Mfg_Structural_Frame Auto Const Mandatory

LeveledItem Property MQAllArtifacts Auto Const Mandatory

Scene Property MQ305_002_Unity_01 Auto Const Mandatory

Scene Property MQ305_002_Unity_04 Auto Const Mandatory

Message Property MQ305_MSG_Starborn Auto Const Mandatory

GlobalVariable Property MQ302_SidedWithChoice Auto Const Mandatory

Scene Property MQ305_Unity_01b Auto Const Mandatory

ReferenceAlias Property Alias_UnityChair Auto Const Mandatory

ReferenceAlias Property Alias_UnityDoor Auto Const Mandatory
ObjectReference Property ScorpiusOborumMarker Auto Const Mandatory

ObjectReference Property HelixOborumMarker Auto Const Mandatory

ObjectReference Property MQ207_EmissaryMarker01 Auto Const Mandatory

ObjectReference Property MQ207_HunterMarker01 Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const

Message Property MQ305ReturnFromUnityMSG Auto Const Mandatory

Quest Property SQ_ENV Auto Const Mandatory

GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipArmillary Auto Const Mandatory

GlobalVariable Property MQ305_UC_SterilizationEnding Auto Const Mandatory

ObjectReference Property MQ305InitialCollisionEnableMarker Auto Const Mandatory

Scene Property MQ305_002_Unity_05 Auto Const Mandatory

Scene Property MQ305_002_Unity_06 Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

GlobalVariable Property MQ_CompanionDead Auto Const Mandatory

GlobalVariable Property COM_CompanionID_Andreja Auto Const Mandatory

GlobalVariable Property COM_CompanionID_Barrett Auto Const Mandatory

GlobalVariable Property COM_CompanionID_SamCoe Auto Const Mandatory

GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const Mandatory

Quest Property MQ304b Auto Const Mandatory

GlobalVariable Property MQ401_SkipMQ Auto Const Mandatory
