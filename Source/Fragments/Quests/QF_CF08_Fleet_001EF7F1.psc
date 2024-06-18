;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF08_Fleet_001EF7F1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
DialogueCFTheKey.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage()
Alias_CF08_Fleet_Delgado.GetActorRef().EvaluatePackage()
Alias_CF08_Fleet_Jazz.GetActorRef().EvaluatePackage()
CFSD01.SetObjectiveSkipped(100)
CFSD01.SetObjectiveSkipped(200)
CFSD01.SetObjectiveSkipped(300)
CFSD01.Stop()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;All ships destroyed - fire off hail from the Key
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;Start misc quest that handles unnamed actors
CF08_Fleet_Misc.Start()
Alias_CF08_Fleet_Delgado.GetRef().MoveTo(Alias_CF08_Fleet_DelgadoBriefingMarker01.GetRef())
Alias_CF08_Fleet_Naeva.GetRef().MoveTo(Alias_CF08_Fleet_NaevaWaitsMarker.GetRef())
Alias_CF_AlarmBattlePrep.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Start dialogue with Naeva

CF08_Fleet_Stage040_Naeva_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;Start misc actors running around
CF08_Fleet_Misc.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0048_Item_00
Function Fragment_Stage_0048_Item_00()
;BEGIN CODE
;Force scene start

CF08_Fleet_Stage045_DelgadoIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0049_Item_00
Function Fragment_Stage_0049_Item_00()
;BEGIN CODE
;Take the Data Core from the player.
Game.GetPlayer().RemoveItem(Alias_DataCoreFull.GetRef())

;And add it to the Analyzer.
LC088_Space.InsertDataCore(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage()

Alias_CF08_Fleet_Delgado.GetActorRef().SnapIntoInteraction(Alias_CF08_Fleet_DelgadoBriefingMarker04.GetRef())
Alias_CF08_Fleet_Jazz.GetActorRef().SnapIntoInteraction(Alias_CF08_Fleet_JasmineBriefingMarker01.GetRef())

CF08_Fleet_Misc.SetStage(10)

ObjectReference MathisSitRef = Alias_MathisSitMarker.GetRef()
Alias_CF08_Fleet_Mathis.GetActorRef().SnapIntoInteraction(MathisSitRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
;Induce new scene and disable temp furniture
CF08_Fleet_Stage045_DelgadoIntro.Stop()
CF08_Fleet_Stage050_Delgado_IntroScene.Start()
Alias_CF08_Fleet_Naeva.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
Alias_CF_AlarmBattlePrep.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;Delgado done speech, alarm sounds

Alias_CF08_Fleet_Delgado.GetActorRef().EvaluatePackage()
Alias_CF_AlarmBattlePrep.DisableAll()
Wwise_Event_OBJ_Alarm_Starstation_Hostile.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
SetObjectiveDisplayed(60)
SetObjectiveDisplayed(70)
LC088_Space.SetStage(110)

;Force stop scene in case packages cause it to linger
CF08_Fleet_Stage050_Delgado_IntroScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Set in LC088_Space Stage 129
SetObjectiveCompleted(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;Set in LC088_Space Stage 139
SetObjectiveCompleted(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
;Set in LC088_Space Stage 149
SetObjectiveCompleted(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveCompleted(60)
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
Alias_CF08_Fleet_Naeva.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)
SetStage(340)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
If ((LC088_Vigilance.GetStageDone(310) == 0) && (GetStageDone(350) == 0))
SetObjectiveDisplayed(140)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
if (!GetStageDone(370))
     SetObjectiveDisplayed(150,0)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
SetObjectiveDisplayed(190)
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
SetObjectiveDisplayed(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveCompleted(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
SetObjectiveCompleted(190)

;UC connection - setting a global to track that the player sided with CF
UC_PlayerSidedWithCF.SetValue(1)

;New Game Plus - Player now knows about Kibwe/Toft codes
Game.GetPlayer().SetValue(CF08_KibweKilled_AV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
CF08_Fleet_Stage520_Delgado_OutroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
SetObjectiveDisplayed(200)
;DON'T MOVE NAEVA HERE, or it breaks the surrender scene.
;Moving her in 520 instead.
;Alias_CF08_Fleet_Naeva.GetActorRef().MoveTo(CF08_Fleet_NaevaMarker_Breifing)
;Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage()
Alias_CF08_Fleet_Delgado.GetActorRef().MoveTo(CF08_Fleet_DelgadoMarker)
Alias_CF08_Fleet_Delgado.GetActorRef().EvaluatePackage()
Alias_CF08_Fleet_Jazz.GetActorRef().MoveTo(CF08_Fleet_JazzMarker_Briefing)
Alias_CF08_Fleet_Jazz.GetActorRef().EvaluatePackage()

;Set up misc actors
CF08_Fleet_Misc.SetStage(100)
Alias_CF_AlarmBattlePrep.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(210)

;If the surrender scene was still running, make sure to stop it.
;EVENTUALLY, we should do this when the Vigilance unloads, and
;move Kibwe and Toft to the brig at the same time.
LC088_1019_SurrenderScene.Stop()
LC088_1020_ExecutionScene.Stop()

;Move Naeva for the final scene.
Actor NaevaRef = Alias_CF08_Fleet_Naeva.GetActorRef()

If NaevaRef.IsDisabled()
    NaevaRef.EnableNoWait()
endif
NaevaRef.MoveTo(CF08_Fleet_NaevaMarker_Breifing)
NaevaRef.EvaluatePackage()


CF08_Fleet_Misc.SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
Alias_CF08_Fleet_Naeva.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0605_Item_00
Function Fragment_Stage_0605_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0615_Item_00
Function Fragment_Stage_0615_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(250,0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
SetObjectiveCompleted(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(260,0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0635_Item_00
Function Fragment_Stage_0635_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
SetObjectiveCompleted(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0645_Item_00
Function Fragment_Stage_0645_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(270,0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(280)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0655_Item_00
Function Fragment_Stage_0655_Item_00()
;BEGIN CODE
SetObjectiveCompleted(280)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(280,0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0665_Item_00
Function Fragment_Stage_0665_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0670_Item_00
Function Fragment_Stage_0670_Item_00()
;BEGIN CODE
SetObjectiveCompleted(290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0675_Item_00
Function Fragment_Stage_0675_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(290,0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
if (!GetStageDone(330))
     SetObjectiveDisplayed(130,0)
EndIf

if (!GetStageDone(350))
     SetObjectiveDisplayed(140,0)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Queue up SSNN news story
RAD02.SetStage(600)

SetObjectiveCompleted(210)
MathisEliteCrewQuest.SetStage(1)
Alias_CF08_Fleet_Mathis.GetActorRef().EvaluatePackage()
CF08_Fleet_Misc.SetStage(500)

;New Game Plus Support Fleet Global
Game.GetPlayer().SetValue(CF08_FleetComplete_AV, 1)

;MQ305 Variable
MQ305_CF_PirateEnding.SetValue(1)

;Achievement for Completing Quest
Game.AddAchievement(22)

;Refresh Jasmine's Ship Vendor Inventory
(Alias_CF08_Fleet_Jazz.GetRef() as ShipVendorScript).CheckForInventoryRefresh(bForceRefresh = true)

;Send Affinity Event
float currentGameTime = Utility.GetCurrentGameTime()
float cooldownTime = (currentGameTime + COM_WantsToTalk_CooldownDays.GetValue())
int i = 0
while i < Alias_Companions.Length
    Alias_Companions[i].GetActorRef().SetValue(COM_WantsToTalk_CrimsonFleet_Cooldown, cooldownTime) 
    i += 1
endwhile
COM_WantsToTalkEvent_CrimsonFleet.Send()

CF08_SpeechChallenge_Kibwe.Stop()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property LC088 Auto Const Mandatory

LC088_SpaceQuestScript Property LC088_Space Auto Const Mandatory

ReferenceAlias Property Alias_CF08_Fleet_Naeva Auto Const Mandatory

ReferenceAlias Property Alias_CF08_Fleet_Delgado Auto Const Mandatory

ReferenceAlias Property Alias_CF08_Fleet_Jazz Auto Const Mandatory

Quest Property DialogueCFTheKey Auto Const Mandatory

ObjectReference Property CF08_Fleet_NaevaMarker_Breifing Auto Const Mandatory

ObjectReference Property CF08_Fleet_DelgadoMarker Auto Const Mandatory

ObjectReference Property CF08_Fleet_JazzMarker_Briefing Auto Const Mandatory

Scene Property LC088_1019_SurrenderScene Auto Const Mandatory

Quest Property LC088_Vigilance Auto Const Mandatory

Quest Property MathisEliteCrewQuest Auto Const

GlobalVariable Property UC_PlayerSidedWithCF Auto Const Mandatory

Quest Property RAD02 Auto Const Mandatory

Quest Property CF08_Fleet_Misc Auto Const Mandatory

Scene Property CF08_Fleet_Stage045_DelgadoIntro Auto Const Mandatory

Scene Property CF08_Fleet_Stage050_Delgado_IntroScene Auto Const Mandatory

Scene Property CF08_Fleet_Stage040_Naeva_IntroScene Auto Const Mandatory

ReferenceAlias Property Alias_CF08_Fleet_DelgadoBriefingMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_CF08_Fleet_JasmineBriefingMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_CF08_Operations_Marker01 Auto Const Mandatory

WwiseEvent Property Wwise_Event_OBJ_Alarm_Starstation_Hostile Auto Const Mandatory

ActorValue Property CF08_FleetComplete_AV Auto Const Mandatory

ActorValue Property CF08_KibweKilled_AV Auto Const Mandatory

ReferenceAlias Property Alias_DataCoreFull Auto Const Mandatory

GlobalVariable Property MQ305_CF_PirateEnding Auto Const Mandatory

Quest Property CF_Key_Home_CaptainsQuarters_Misc Auto Const Mandatory

ReferenceAlias Property Alias_CF08_Fleet_Mathis Auto Const Mandatory

Scene Property LC088_1020_ExecutionScene Auto Const Mandatory

Scene Property CF08_Fleet_Stage520_Delgado_OutroScene Auto Const Mandatory

RefCollectionAlias Property Alias_CF_AlarmBattlePrep Auto Const Mandatory

ReferenceAlias Property Alias_MathisSitMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF08_Fleet_NaevaWaitsMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF08_Fleet_DelgadoBriefingMarker04 Auto Const Mandatory

Quest Property CFSD01 Auto Const Mandatory

AffinityEvent Property COM_WantsToTalkEvent_CrimsonFleet Auto Const Mandatory

ReferenceAlias[] Property Alias_Companions Auto Const Mandatory

GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const Mandatory

ActorValue Property COM_WantsToTalk_CrimsonFleet_Cooldown Auto Const Mandatory

Quest Property CF08_SpeechChallenge_Kibwe Auto Const Mandatory
