;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF08_SysDef_001B41D0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
DialogueCFTheKey.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_CF08_SysDef_Mathis.GetActorRef().SetEssential(false)

;Remove bounty on CF
CrimeFactionCrimsonFleet.SetCrimeGold(0)
CrimeFactionCrimsonFleet.SetCrimeGoldViolent(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Take the Data Core from the player.
Game.GetPlayer().RemoveItem(Alias_DataCoreFull.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
CF08_SysDef_Stage030_Ikande_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
CF08_SysDef_Stage520_Ikande_OutroPre.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
CF08_SysDef_Stage030_Ikande_IntroScene_Action05_Choice01.Send()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE defaultquestchangelocationscript
Quest __temp = self as Quest
defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)

;Start misc quest
CF08_SysDef_Misc.Start()

;Enable and move actors into position
ObjectReference IkandeMarkerRef = Alias_CF08_SysDef_IkandeBriefingMarker.GetRef()

Alias_CF08_SysDef_Ikande.GetRef().MoveTo(IkandeMarkerRef)
Alias_CF08_SysDef_Toft.GetRef().MoveTo(Alias_CF08_SysDef_ToftBriefingMarker.GetRef())

;Stop Key terminal random entries
CFKey_TerminalQuest.Stop()
Alias_ComTriggerKey.DisableAll()
DialogueCFTheKey.SetStage(20)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
FFKeyZ01.SetStage(66)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_02
Function Fragment_Stage_0010_Item_02()
;BEGIN CODE
FFKeyZ01MiscObjective.SetStage(66)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_03
Function Fragment_Stage_0010_Item_03()
;BEGIN CODE
FFKeyZ02.SetStage(66)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_04
Function Fragment_Stage_0010_Item_04()
;BEGIN CODE
If MB_Piracy01Far_CFR01.IsRunning()
    MB_Piracy01Far_CFR01.FailAllObjectives()
    MB_Piracy01Far_CFR01.SetStage(200)
endif

If MB_Piracy02Far_CFR01.IsRunning()
    MB_Piracy02Far_CFR01.FailAllObjectives()
    MB_Piracy02Far_CFR01.SetStage(200)
endif

If MB_Piracy03Far_CFR01.IsRunning()
    MB_Piracy03Far_CFR01.FailAllObjectives()
    MB_Piracy03Far_CFR01.SetStage(200)
endif

If MB_Smuggle01_CFR02.IsRunning()
    MB_Smuggle01_CFR02.FailAllObjectives()
    MB_Smuggle01_CFR02.SetStage(200)
endif

If MB_Smuggle01_CFR0200.IsRunning()
    MB_Smuggle01_CFR0200.FailAllObjectives()
    MB_Smuggle01_CFR0200.SetStage(200)
endif

If MB_Smuggle01_CFR0201.IsRunning()
    MB_Smuggle01_CFR0201.FailAllObjectives()
    MB_Smuggle01_CFR0201.SetStage(200)
endif

If MB_Steal01Far_CFR03.IsRunning()
    MB_Steal01Far_CFR03.FailAllObjectives()
    MB_Steal01Far_CFR03.SetStage(200)
endif

If MB_Steal02Far_CFR03.IsRunning()
    MB_Steal02Far_CFR03.FailAllObjectives()
    MB_Steal02Far_CFR03.SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

Alias_AlarmStation.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Disable flavor scene actors

CF08_SysDef_Misc.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
LC088_Space.SetStage(210)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
CF08_SysDef_Stage030_Ikande_IntroScene.Stop()

;And add it to the Analyzer.
LC088_Space.InsertDataCore(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
if (GetStage() == 315)
     SetObjectiveDisplayed(100,0)
     SetObjectiveDisplayed(105)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0316_Item_00
Function Fragment_Stage_0316_Item_00()
;BEGIN CODE
if (GetStage() == 316)
     SetObjectiveCompleted(105)
     SetObjectiveDisplayed(100,1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
if (GetStage() == 320)
     SetObjectiveDisplayed(100,0)
     SetObjectiveDisplayed(110)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
if (GetStage() == 330)
     SetObjectiveCompleted(110)
     SetObjectiveDisplayed(100,1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
if (GetStage() == 340)
    SetObjectiveDisplayed(100,0)
    SetObjectiveDisplayed(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0345_Item_00
Function Fragment_Stage_0345_Item_00()
;BEGIN CODE
if (GetStage() == 345)
     SetObjectiveDisplayed(125)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0349_Item_00
Function Fragment_Stage_0349_Item_00()
;BEGIN CODE
SetObjectiveFailed(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
if (GetStage() == 350)
     SetObjectiveCompleted(120)
     SetObjectiveDisplayed(100,1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0358_Item_00
Function Fragment_Stage_0358_Item_00()
;BEGIN CODE
;Remove Delgado ghost status
Alias_CF08_Sysdef_Delgado.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(130)

;Start Speech Challenge Quest
CF08_SpeechChallenge_Delgado.Start()
Alias_CF08_Sysdef_Delgado.GetActorRef().SetGhost(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(130)
SetObjectiveDisplayed(140)
SetObjectiveDisplayed(150)

Alias_CF_AlarmBattlePrep.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
SetObjectiveDisplayed(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140)
SetObjectiveCompleted(170)
SetStage(420)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(180)

;Remove Delgado ghost status
Alias_CF08_Sysdef_Delgado.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
;Disperse soldiers in celebration
CF08_SysDef_Misc.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveCompleted(180)
SetObjectiveDisplayed(185)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0435_Item_00
Function Fragment_Stage_0435_Item_00()
;BEGIN CODE
SetObjectiveCompleted(185)
SetObjectiveDisplayed(188)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0437_Item_00
Function Fragment_Stage_0437_Item_00()
;BEGIN CODE
SetObjectiveCompleted(188)
SetStage(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
SetObjectiveCompleted(125)
Alias_CF08_SysDef_VossSurrenderMarker.GetRef().EnableNoWait()
Actor VossRef = Alias_CF08_SysDef_Voss.GetActorRef()
VossRef.SetEssential(true)
VossRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
;If Player changes Loc from the Key - check if the bomb was deactivated
;If Player ignored it, Shinya kills himself before he can be arrested
If GetStageDone(440) == 0
;Do Exploding Shinya Stuff
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0495_Item_00
Function Fragment_Stage_0495_Item_00()
;BEGIN CODE
CF08_SysDef_Misc.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(130) == 1
SetObjectiveCompleted(130)
EndIf
if IsObjectiveDisplayed(140) == 1
SetObjectiveCompleted(140)
EndIf
SetObjectiveDisplayed(190)

;Make sure NPCs are in place
Actor KibweRef = Alias_CF08_SysDef_Ikande.GetActorRef()
Actor ToftRef = Alias_CF08_SysDef_Toft.GetActorRef()

KibweRef.MoveTo(Alias_CF08_Kibwe_EndMarker.GetRef())
KibweRef.EvaluatePackage()
ToftRef.MoveTo(Alias_CF08_Toft_EndMarker.GetRef())
ToftRef.EvaluatePackage()

CF08_SysDef_Misc.SetStage(50)

Alias_CF_AlarmBattlePrep.DisableAll()
Alias_AlarmStation.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetObjectiveCompleted(190)
SetObjectiveDisplayed(200)
Alias_CF_AlarmBattlePrep.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Queue up SSNN news story
RAD02.SetStage(700)

SetObjectiveCompleted(200)

;Speech Challenge Stop
CF08_SpeechChallenge_Delgado.Stop()

;New Game Plus Support
Game.GetPlayer().SetValue(CF08_SysDefComplete_AV, 1)

;Unlock Player Room
CF08_PlayerRoomDoorRef.Lock(false)

;MQ305 Variable
MQ305_CF_SysDefEnding.SetValue(1)

;Dispersal
CF08_SysDef_Misc.SetStage(200)

;Send Affinity Event
float currentGameTime = Utility.GetCurrentGameTime()
float cooldownTime = (currentGameTime + COM_WantsToTalk_CooldownDays.GetValue())
int i = 0
while i < Alias_Companions.Length
    Alias_Companions[i].GetActorRef().SetValue(COM_WantsToTalk_CrimsonFleet_Cooldown, cooldownTime) 
    i += 1
endwhile
COM_WantsToTalkEvent_CrimsonFleet.Send()

;Cooldown on SE to prevent it from spinning up too soon
SE_Player_ZW11_Timestamp.SetValue(currentGameTime + cooldownDays)
SE_Player_ZW12_Timestamp.SetValue(currentGameTime + cooldownDays)

;Achievement for Completing Quest
Game.AddAchievement(22)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property LC088 Auto Const Mandatory

LC088_SpaceQuestScript Property LC088_Space Auto Const Mandatory

Quest Property DialogueCFTheKey Auto Const Mandatory

ObjectReference Property CF08_SysDef_Kibwe_BriefingMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF08_SysDef_Ikande Auto Const Mandatory

ObjectReference Property CF08_SysDef_Toft_BriefingMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF08_SysDef_Toft Auto Const Mandatory

Quest Property RAD02 Auto Const Mandatory

ActorValue Property CF08_SysDefComplete_AV Auto Const Mandatory

ReferenceAlias Property Alias_CF08_SysDef_ToftBriefingMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF08_SysDef_IkandeBriefingMarker Auto Const Mandatory

Quest Property CF08_SysDef_Misc Auto Const Mandatory

ReferenceAlias Property Alias_DataCoreFull Auto Const Mandatory

Quest Property CF08_SpeechChallenge_Delgado Auto Const Mandatory

ReferenceAlias Property Alias_CF08_Toft_EndMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF08_Kibwe_EndMarker Auto Const Mandatory

ObjectReference Property CF08_PlayerRoomDoorRef Auto Const Mandatory

GlobalVariable Property MQ305_CF_SysDefEnding Auto Const Mandatory

Quest Property CFKey_TerminalQuest Auto Const Mandatory

Quest Property CF_Key_Home_CaptainsQuarters_Misc Auto Const Mandatory

RefCollectionAlias Property Alias_ComTriggerKey Auto Const Mandatory

ReferenceAlias Property Alias_CF08_SysDef_Mathis Auto Const Mandatory

Scene Property CF08_SysDef_Stage030_Ikande_IntroScene Auto Const Mandatory

Scene Property CF08_SysDef_Stage520_Ikande_OutroPre Auto Const Mandatory

LocationAlias Property Alias_StationTheKeyInteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_CF08_SysDef_Delgado Auto Const Mandatory
ReferenceAlias Property Alias_AlarmStation Auto Const Mandatory

RefCollectionAlias Property Alias_CF_AlarmBattlePrep Auto Const Mandatory

ReferenceAlias Property Alias_CF08_SysDef_Voss Auto Const Mandatory

ReferenceAlias Property Alias_CF08_SysDef_VossSurrenderMarker Auto Const Mandatory

Quest Property FFKeyZ01 Auto Const Mandatory

Quest Property FFKeyZ01MiscObjective Auto Const Mandatory

Quest Property FFKeyZ02 Auto Const Mandatory

Quest Property MB_Piracy01Far_CFR01 Auto Const Mandatory

Quest Property MB_Piracy02Far_CFR01 Auto Const Mandatory

Quest Property MB_Piracy03Far_CFR01 Auto Const Mandatory

Quest Property MB_Smuggle01_CFR02 Auto Const Mandatory

Quest Property MB_Smuggle01_CFR0200 Auto Const Mandatory

Quest Property MB_Smuggle01_CFR0201 Auto Const Mandatory

Quest Property MB_Steal01Far_CFR03 Auto Const Mandatory

Quest Property MB_Steal02Far_CFR03 Auto Const Mandatory

AffinityEvent Property COM_WantsToTalkEvent_CrimsonFleet Auto Const Mandatory

AffinityEvent Property CF08_SysDef_Stage030_Ikande_IntroScene_Action05_Choice01 Auto Const Mandatory

Float Property cooldownDays Auto Const Mandatory

GlobalVariable Property SE_Player_ZW11_Timestamp Auto Const Mandatory

GlobalVariable Property SE_Player_ZW12_Timestamp Auto Const Mandatory

ReferenceAlias[] Property Alias_Companions Auto Const Mandatory

GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const Mandatory

ActorValue Property COM_WantsToTalk_CrimsonFleet_Cooldown Auto Const Mandatory

Faction Property CrimeFactionCrimsonFleet Auto Const Mandatory
