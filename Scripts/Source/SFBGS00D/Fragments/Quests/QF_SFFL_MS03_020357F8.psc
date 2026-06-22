;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_MS03_020357F8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SFFL_AnchorpointZ01.CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(0)
Game.GetPlayer().MoveTo(Alias_SFFL_MS03_StartQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(50)
SetStage(100)
SetStage(110)
Game.GetPlayer().MoveTo(Alias_SFFL_MS03_YuraQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(50)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(150)
SetStage(200)
Game.GetPlayer().MoveTo(Alias_SFFL_MS03_AtkaHouseQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(50)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(150)
SetStage(200)
SetStage(300)
SetStage(310)
SetStage(400)
SetStage(405)
;SetStage(410)
;SetStage(420)
;SetStage(430)
;SetStage(440)
;SetStage(450)
SetStage(500)
SetStage(505)
SetStage(510)
SetStage(600)
SetStage(610)
SetStage(1000)
SetStage(1010)
SetStage(1100)
Game.GetPlayer().MoveTo(Alias_SFFL_MS03_HideoutQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(50)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(150)
SetStage(200)
SetStage(300)
SetStage(310)
SetStage(400)
SetStage(405)
;SetStage(410)
;SetStage(420)
;SetStage(430)
;SetStage(440)
;SetStage(450)
SetStage(500)
SetStage(505)
SetStage(510)
SetStage(600)
SetStage(610)
SetStage(1000)
SetStage(1010)
SetStage(1100)
SetStage(1120)
SetStage(1200)
Game.GetPlayer().MoveTo(Alias_SFFL_MS03_RomanQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(50)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(150)
SetStage(200)
SetStage(300)
SetStage(310)
SetStage(400)
SetStage(405)
;SetStage(410)
;SetStage(420)
;SetStage(430)
;SetStage(440)
;SetStage(450)
SetStage(500)
SetStage(505)
SetStage(510)
SetStage(600)
SetStage(610)
SetStage(1000)
SetStage(1010)
SetStage(1100)
SetStage(1120)
SetStage(1200)
SetStage(1201)
SetStage(1220)
SetStage(1230)
SetStage(1270)
SetStage(1272)
SetStage(1280)
SetStage(1290)
SetStage(1300)
Game.GetPlayer().MoveTo(Alias_SFFL_MS03_MilliQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(50)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(150)
SetStage(200)
SetStage(300)
SetStage(310)
SetStage(400)
SetStage(405)
;SetStage(410)
;SetStage(420)
;SetStage(430)
;SetStage(440)
;SetStage(450)
SetStage(500)
SetStage(505)
SetStage(510)
SetStage(600)
SetStage(610)
SetStage(1000)
SetStage(1010)
SetStage(1100)
SetStage(1120)
SetStage(1200)
SetStage(1201)
SetStage(1220)
SetStage(1230)
SetStage(1270)
SetStage(1272)
SetStage(1280)
SetStage(1290)
SetStage(1300)
SetStage(1310)
SetStage(3000)
Game.GetPlayer().MoveTo(Alias_SFFL_MS03_AtkaHouseQS.GetRef())
Alias_Milli.GetRef().MoveTo(Alias_SFFL_MS03_AtkaHouseQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(50)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(150)
SetStage(200)
SetStage(300)
SetStage(310)
SetStage(400)
SetStage(405)
;SetStage(410)
;SetStage(420)
;SetStage(430)
;SetStage(440)
;SetStage(450)
SetStage(500)
SetStage(505)
SetStage(510)
SetStage(600)
SetStage(610)
SetStage(1000)
SetStage(1010)
SetStage(1100)
SetStage(1120)
SetStage(1200)
SetStage(1201)
SetStage(1220)
SetStage(1230)
SetStage(1270)
SetStage(1272)
SetStage(1280)
SetStage(1290)
SetStage(1300)
SetStage(1310)
SetStage(3000)
SetStage(3010)
SetStage(3100)
SetStage(3200)
SFFL_MS03_3100_Yura_AtkaScene.Stop()
Game.GetPlayer().MoveTo(Alias_SFFL_MS03_AtkaHouseQS.GetRef())
Alias_Milli.GetRef().MoveTo(Alias_MilliHouseTravelMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Actor Player = Game.GetPlayer()
Player.AddItem(Credits, 100000)
Player.AddItem(Digipick, 10)
Player.AddPerk(Skill_Theft)
Player.AddPerk(Skill_Security)
Player.AddPerk(Skill_Security)
Player.AddPerk(Skill_Security)
Player.AddPerk(Skill_Leadership)
Player.AddPerk(Skill_Intimidation)
Player.AddPerk(Skill_Persuasion)
Player.AddPerk(TRAIT_Empath)
Player.AddPerk(FactionFreestarCollectivePerk)
Player.AddPerk(FactionCrimsonFleetPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Actor Yura = Alias_Yura.GetActorRef()
Yura.MoveTo(Alias_YuraIntroFurniture.GetRef())
Yura.Enable()
Yura.EvaluatePackage()
Yura.AddItem(Alias_AtkasHouseKey.GetRef())

Alias_PlantActivator01.GetRef().BlockActivation(True, True)
Alias_PlantActivator02.GetRef().BlockActivation(True, True)
Alias_PlantActivator03.GetRef().BlockActivation(True, True)
Alias_PlantActivator04.GetRef().BlockActivation(True, True)

Alias_Intercom.GetRef().BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Yura.GetActorRef().EvaluatePackage()
SFFL_MS03_0100_Yura_CallOutScene.Start()
SFFL_MS03_MiscObjective.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SFFL_MS03_MiscObjective.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
SFFL_MS03_0100_Yura_IgnoredScene.Start()
Alias_Yura.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_AtkasHouseKey.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetStage(150)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SFFL_MS03_MiscObjective.SetStage(10000)
SetObjectiveDisplayed(200)
Alias_Yura.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
Alias_Yura.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetStage(400)
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
If !GetStageDone(450)
   SetObjectiveDisplayed(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
Alias_PlantActivator01.GetRef().BlockActivation(False, False)
Alias_PlantActivator02.GetRef().BlockActivation(False, False)
Alias_PlantActivator03.GetRef().BlockActivation(False, False)
Alias_PlantActivator04.GetRef().BlockActivation(False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
If GetStageDone(420) && GetStageDone(430) && GetStageDone(440)
   SetStage(450)
EndIf

Alias_PlantActivator01.GetRef().BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
If GetStageDone(410) && GetStageDone(430) && GetStageDone(440)
   SetStage(450)
EndIf

Alias_PlantActivator02.GetRef().BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
If GetStageDone(410) && GetStageDone(420) && GetStageDone(440)
   SetStage(450)
EndIf

Alias_PlantActivator03.GetRef().BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
If GetStageDone(410) && GetStageDone(420) && GetStageDone(430)
   SetStage(450)
EndIf

Alias_PlantActivator04.GetRef().BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
If !GetStageDone(600)
   SetObjectiveDisplayedAtTop(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(500, False, False)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetStage(1000)
Game.GetPlayer().SetValue(SFFL_MS03_Foreknowledge_KnowsPasswordAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
If GetStageDone(3250)
   SFFL_MS03_0100_Yura_MS03DoneRomanDeadScene.Start()
Else
   SFFL_MS03_0100_Yura_MS03DoneScene.Start()
   SFFL_MS03_MilliOutpostMessage.Show()
EndIf
Game.GetPlayer().SetValue(SFFL_MS03_Foreknowledge_CompletedQuestAV, 1)
Alias_Yura.GetActorRef().SetEssential(False)
Alias_Atka.GetActorRef().SetEssential(False)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(1000)

Actor RomanRef = Alias_Roman.GetActorRef()
RomanRef.MoveTo(Alias_RomanShelfFurniture.GetRef())
RomanRef.AddItem(Alias_EnclosureKey.GetRef())

Alias_HideoutDoor.GetRef().SetLockLevel(75)
Alias_Intercom.GetRef().BlockActivation(False, False)
Alias_Milli.GetActorRef().MoveTo(Alias_MilliEnclosureMarker.GetRef())
Alias_HangoutMapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1120_Item_00
Function Fragment_Stage_1120_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS03_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS03_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS03_QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_HideoutDoor.GetRef().Unlock()
Alias_Intercom.GetRef().BlockActivation(True, True)
SetStage(1200)
kmyQuest.SetCaptors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1130_Item_00
Function Fragment_Stage_1130_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS03_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS03_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS03_QuestScript
;END AUTOCAST
;BEGIN CODE
SetStage(5000)
SetStage(1300)
Alias_Intercom.GetRef().BlockActivation(True, True)
kmyQuest.SetHostile()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1140_Item_00
Function Fragment_Stage_1140_Item_00()
;BEGIN CODE
Alias_CaptorM01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, SFFL_MS03_RansomCredits.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1215_Item_00
Function Fragment_Stage_1215_Item_00()
;BEGIN CODE
SetStage(1220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1220_Item_00
Function Fragment_Stage_1220_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_EnclosureKey.GetRef())
SetStage(1280)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
SetStage(5000)
SetStage(1290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1265_Item_00
Function Fragment_Stage_1265_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, SFFL_MS03_PaymentCredits.GetValueInt())
SetStage(1220)
SetStage(1270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1270_Item_00
Function Fragment_Stage_1270_Item_00()
;BEGIN CODE
SFFL_MS03_PlayerAgreedToHelpRoman.SetValue(1)
SetStage(1272)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1271_Item_00
Function Fragment_Stage_1271_Item_00()
;BEGIN CODE
SFFL_MS03_PlayerGotRomanToTalkToYura.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1272_Item_00
Function Fragment_Stage_1272_Item_00()
;BEGIN CODE
SFFL_MS03_PlayerKnowsRomanLikesYura.SetValue(1)
Game.GetPlayer().SetValue(SFFL_MS03_Foreknowledge_KnowsRomanLikesYuraAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1280_Item_00
Function Fragment_Stage_1280_Item_00()
;BEGIN CODE
SetStage(1290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1290_Item_00
Function Fragment_Stage_1290_Item_00()
;BEGIN CODE
SetStage(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
If GetStageDone(1200)
   SetObjectiveCompleted(1200)
EndIf
SetObjectiveDisplayed(1300)
Alias_Milli.GetActorRef().SetValue(SpeedMult, 300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS03_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS03_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS03_QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_Milli.GetActorRef().EvaluatePackage()
SetStage(3000)
If IsObjectiveDisplayed(2100)
   SetObjectiveDisplayed(2100, False, False)
EndIf
SFFL_MS03_MilliMessage.Show()
kmyQuest.TrackPlayer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
If IsObjectiveDisplayed(1200) && !GetStageDone(1250)
   SetObjectiveFailed(1200)
EndIf

SetStage(1300)
SetStage(5000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2010_Item_00
Function Fragment_Stage_2010_Item_00()
;BEGIN CODE
SFFL_MS03_RomanDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2020_Item_00
Function Fragment_Stage_2020_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(2000)
   SetObjectiveCompleted(2000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(2100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2110_Item_00
Function Fragment_Stage_2110_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(2100)
   SetObjectiveCompleted(2100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2200_Item_00
Function Fragment_Stage_2200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2100)
SetObjectiveDisplayed(2200)
Alias_Milli.GetActorRef().SetValue(SpeedMult, 300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2210_Item_00
Function Fragment_Stage_2210_Item_00()
;BEGIN CODE
If Game.GetPlayer().GetItemCount(SFFL_MS03_MilliKey) < 1
   SetStage(2100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3000_Item_00
Function Fragment_Stage_3000_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS03_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS03_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS03_QuestScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(1300) ; Get Milli
   SetObjectiveCompleted(1300)
EndIf
If IsObjectiveDisplayed(2200) ; Get Milli
   SetObjectiveCompleted(2200)
EndIf
SetObjectiveDisplayed(3000)

Actor AtkaRef = Alias_Atka.GetActorRef()
Actor YuraRef = Alias_Yura.GetActorRef()

AtkaRef.MoveTo(Alias_AtkaHouseMarker.GetRef())
AtkaRef.Enable()
AtkaRef.EvaluatePackage()

YuraRef.MoveTo(Alias_YuraHouseMarker.GetRef())
YuraRef.Enable()
YuraRef.EvaluatePackage()

If IsObjectiveDisplayed(300)
   SetObjectiveFailed(300)
EndIf
If IsObjectiveDisplayed(400)
   SetObjectiveFailed(400)
EndIf

kmyQuest.CheckPlants()
Alias_PlantActivator01.GetRef().BlockActivation(True, True)
Alias_PlantActivator02.GetRef().BlockActivation(True, True)
Alias_PlantActivator03.GetRef().BlockActivation(True, True)
Alias_PlantActivator04.GetRef().BlockActivation(True, True)

Alias_FireEnableMarker.GetRef().Enable()
Alias_AtkasHouseDoor.GetRef().SetOpen(False)
Alias_Food.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3010_Item_00
Function Fragment_Stage_3010_Item_00()
;BEGIN CODE
Actor Milli = Alias_Milli.GetActorRef()
If Milli.GetDistance(Game.GetPlayer()) > 10
   Milli.MoveTo(Alias_MilliSceneMoveMarker.GetRef())
EndIf
Milli.EvaluatePackage()
SetStage(3100)
SFFL_MS03_3100_Yura_AtkaScene.Start()
SFFL_MS03_Support.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3100_Item_00
Function Fragment_Stage_3100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(3000)
SetObjectiveDisplayed(3100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3200_Item_00
Function Fragment_Stage_3200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(3100)
SetObjectiveDisplayed(3200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3260_Item_00
Function Fragment_Stage_3260_Item_00()
;BEGIN CODE
Actor Player = Game.GetPlayer()
If GetStageDone(450) && !GetStageDone(2010)
   Player.AddItem(Credits, 1000)
Else
   Player.AddItem(Credits, 800)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3270_Item_00
Function Fragment_Stage_3270_Item_00()
;BEGIN CODE
SFFL_MS03_Support.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4000_Item_00
Function Fragment_Stage_4000_Item_00()
;BEGIN CODE
SetObjectiveFailedIfNotCompleted(1200)
SetObjectiveFailedIfNotCompleted(1300)
SetObjectiveFailedIfNotCompleted(3000)
SetObjectiveFailedIfNotCompleted(3100)
SetObjectiveFailedIfNotCompleted(3200)
Alias_Yura.GetActorRef().SetEssential(False)
Alias_Atka.GetActorRef().SetEssential(False)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5000_Item_00
Function Fragment_Stage_5000_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS03_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS03_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS03_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetHostile()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Yura Auto Const Mandatory

Quest Property SFFL_MS03_MiscObjective Auto Const Mandatory

Scene Property SFFL_MS03_0100_Yura_CallOutScene Auto Const Mandatory

ReferenceAlias Property Alias_AtkasHouseKey Auto Const Mandatory

ReferenceAlias Property Alias_SFFL_MS03_StartQS Auto Const Mandatory

ReferenceAlias Property Alias_HideoutDoor Auto Const Mandatory

GlobalVariable Property SFFL_MS03_RansomCredits Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_EnclosureKey Auto Const Mandatory

ReferenceAlias Property Alias_Milli Auto Const Mandatory

Perk Property SFFL_MS03_MilliPerk Auto Const Mandatory

ReferenceAlias Property Alias_Atka Auto Const Mandatory

ReferenceAlias Property Alias_AtkaHouseMarker Auto Const Mandatory

ReferenceAlias Property Alias_YuraHouseMarker Auto Const Mandatory

Scene Property SFFL_MS03_3100_Yura_AtkaScene Auto Const Mandatory

ReferenceAlias Property Alias_PlantActivator01 Auto Const Mandatory

ReferenceAlias Property Alias_PlantActivator02 Auto Const Mandatory

ReferenceAlias Property Alias_PlantActivator03 Auto Const Mandatory

ReferenceAlias Property Alias_PlantActivator04 Auto Const Mandatory

ReferenceAlias Property Alias_PlantEnableMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_PlantEnableMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_PlantEnableMarker04 Auto Const Mandatory

Scene Property SFFL_MS03_0100_Yura_MS03DoneScene Auto Const Mandatory

ReferenceAlias Property Alias_YuraIntroFurniture Auto Const Mandatory

ActorValue Property SpeedMult Auto Const Mandatory

Scene Property SFFL_MS03_0100_Yura_IgnoredScene Auto Const Mandatory

ReferenceAlias Property Alias_SFFL_MS03_AtkaHouseQS Auto Const Mandatory

Quest Property SFFL_AnchorpointZ01 Auto Const Mandatory

ReferenceAlias Property Alias_SFFL_MS03_YuraQS Auto Const Mandatory

RefCollectionAlias Property Alias_Captors Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

GlobalVariable Property SFFL_MS03_PaymentCredits Auto Const Mandatory

ReferenceAlias Property Alias_SFFL_MS03_HideoutQS Auto Const Mandatory

ReferenceAlias Property Alias_SFFL_MS03_RomanQS Auto Const Mandatory

GlobalVariable Property SFFL_MS03_RomanDead Auto Const Mandatory

GlobalVariable Property SFFL_MS03_PlayerAgreedToHelpRoman Auto Const Mandatory

GlobalVariable Property SFFL_MS03_PlayerGotRomanToTalkToYura Auto Const Mandatory

GlobalVariable Property SFFL_MS03_PlayerKnowsRomanLikesYura Auto Const Mandatory

Perk Property Skill_Leadership Auto Const Mandatory

Perk Property Skill_Intimidation Auto Const Mandatory

Perk Property FactionFreestarCollectivePerk Auto Const Mandatory

Perk Property FactionCrimsonFleetPerk Auto Const Mandatory

MiscObject Property Digipick Auto Const Mandatory

Perk Property Skill_Theft Auto Const Mandatory

Perk Property Skill_Security Auto Const Mandatory

Quest Property SFFL_MS03_Support Auto Const Mandatory

Scene Property SFFL_MS03_0100_Yura_MS03DoneRomanDeadScene Auto Const Mandatory

MiscObject Property SFFL_MS03_Food Auto Const Mandatory

ActorValue Property SFFL_MS03_Foreknowledge_CompletedQuestAV Auto Const Mandatory

ActorValue Property SFFL_MS03_Foreknowledge_KnowsRomanLikesYuraAV Auto Const Mandatory

ReferenceAlias Property Alias_Intercom Auto Const Mandatory

ActorValue Property SFFL_MS03_Foreknowledge_KnowsPasswordAV Auto Const Mandatory

Key Property SFFL_MS03_MilliKey Auto Const Mandatory

ReferenceAlias Property Alias_SFFL_MS03_MilliQS Auto Const Mandatory

ReferenceAlias Property Alias_MilliHouseTravelMarker Auto Const Mandatory

Perk Property Skill_Persuasion Auto Const Mandatory

Perk Property TRAIT_Empath Auto Const Mandatory

Message Property SFFL_MS03_MilliMessage Auto Const Mandatory

ReferenceAlias Property Alias_Roman Auto Const Mandatory

ReferenceAlias Property Alias_RomanShelfFurniture Auto Const Mandatory

ReferenceAlias Property Alias_MilliEnclosureMarker Auto Const Mandatory

ReferenceAlias Property Alias_HangoutMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_PlantHealthy01 Auto Const Mandatory

ReferenceAlias Property Alias_PlantHealthy03 Auto Const Mandatory

ReferenceAlias Property Alias_PlantHealthy04 Auto Const Mandatory

ReferenceAlias Property Alias_PlantDead01 Auto Const Mandatory

ReferenceAlias Property Alias_PlantDead03 Auto Const Mandatory

ReferenceAlias Property Alias_PlantDead04 Auto Const Mandatory

ReferenceAlias Property Alias_CaptorM01 Auto Const Mandatory

ReferenceAlias Property Alias_FireEnableMarker Auto Const Mandatory

Message Property SFFL_MS03_MilliOutpostMessage Auto Const Mandatory

ReferenceAlias Property Alias_AtkasHouseDoor Auto Const Mandatory

ReferenceAlias Property Alias_Food Auto Const Mandatory

ReferenceAlias Property Alias_MilliSceneMoveMarker Auto Const Mandatory
