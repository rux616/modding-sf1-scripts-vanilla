;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI03_0029EB12 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_TestStartRef.GetRef())

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_SimonMarker.GetRef())

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)

SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_SimonMarker.GetRef())

SetStage(300)
SetStage(400)
SetStage(600)
SetStage(650)
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()
Alias_UlaruOfficeDoor.GetRef().Lock(False)
Alias_UlaruOfficeDoor.GetRef().SetOpen()
SetStage(1100)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_Ularu.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()
SetStage(360)
SetStage(500)
SetStage(525)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
RI03_SpaceEncounter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()
SetStage(120)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.MoveTo(Alias_TestStartRef.GetRef())
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()
SetStage(1000)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_SimonMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetActive()
Alias_Stanley.GetRef().MoveTo(Alias_StanleyMarker.GetRef())
Alias_StanleyTerminal.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_TestStartRef.GetRef())
Alias_Ularu.GetRef().MoveTo(Alias_UlaruOfficeSceneMarker.GetRef())

SetStage(120)
SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
LC044.SetStage(1000)
SetObjectiveDisplayed(100)
RIR05.Stop()

Alias_UlaruChairSwapMarker.GetRef().Disable()

Alias_Ularu.GetRef().MoveTo(Alias_UlaruOfficeSceneMarker.GetRef())
Alias_Genevieve.GetRef().MoveTo(Alias_GenevieveOfficeWaitMarker.GetRef())

ObjectReference DoorRef = Alias_UlaruOfficeDoor.GetRef()
DoorRef.SetOpen(False)
DoorRef.Lock(True)
DoorRef.SetLockLevel(254)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
RI03_100_Maeve_CalloutScene.Start()

SetObjectiveDisplayed(100, False, False)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)

SetStage(125)

Alias_Imogene.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
Alias_UlaruOfficeDoor.GetRef().Lock(False)
Alias_UlaruOfficeDoor.GetRef().SetOpen()

If !GetStageDone(130)
     RI03_100_Ularu_OfficeScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)
Alias_Genevieve.GetActorRef().EvaluatePackage()
Alias_Ularu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
Alias_Ularu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_Imogene.GetActorRef().EvaluatePackage()
Alias_Imogene.GetActorRef().SayCustom(RI03_SayCustom_ImogeneToUlaru_Keyword)

SetStage(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
Alias_Imogene.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)
SetObjectiveDisplayed(170)

Actor StanleyRef = Alias_Stanley.GetActorRef()
StanleyRef.SetCrimeFaction(CrimeFactionUC)
StanleyRef.MoveTo(Alias_StanleyMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170)
SetObjectiveDisplayed(200)

Actor StanleyRef = Alias_Stanley.GetActorRef()
StanleyRef.SetCrimeFaction(CrimeFactionUC)
StanleyRef.MoveTo(Alias_StanleyMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200, False, False)
SetObjectiveDisplayed(300, False, False)
SetObjectiveDisplayed(400, False, False)
SetObjectiveDisplayed(500, False, False)
SetObjectiveDisplayed(525, False, False)
SetObjectiveDisplayed(550, False, False)
SetObjectiveDisplayed(600, False, False)
SetObjectiveDisplayed(700, False, False)

If !GetStageDone(800)
     SetStage(710)
EndIf

RI03_SimonDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0229_Item_00
Function Fragment_Stage_0229_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, RI03_Simon_AndrejaCredits.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, RI03_Simon_LessCredits.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0231_Item_00
Function Fragment_Stage_0231_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, RI03_Simon_Credits.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0232_Item_00
Function Fragment_Stage_0232_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, RI03_Simon_MoreCredits.GetValueInt())
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

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
RI03_SpaceEncounter.Start()
Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 4)
Utility.Wait(3)
RI03_350_Malai_HailingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0361_Item_00
Function Fragment_Stage_0361_Item_00()
;BEGIN CODE
RI03_PlayerMentionsSimon.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
SetStage(400)
Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveCompleted(500)
SetObjectiveDisplayed(400)

; Set Malai's ship to be hostile
RI03_SpaceEncounter.SetStage(200)
Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
If !GetStageDone(700) && Game.GetPlayer().GetItemCount(LL_Weapon_Reward_RI03_Ember) == 0
     Debug.Trace(Self + "RI03: Passed conditions")
     Alias_MalaiShip.GetShipRef().AddAliasedItem(LL_Weapon_Reward_RI03_Ember, Alias_MalaiGun)
     SetStage(450)
Else
     Debug.Trace(Self + "RI03: Failed conditions")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
If GetStageDone(550)
     SetObjectiveCompleted(550)
EndIf
SetStage(600)

RI03_MalaiDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(525)
Alias_MalaiShip.GetShipRef().SetValue(DockingPermission, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
If !GetStageDone(410)
     SetObjectiveDisplayed(550)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300) ; Find Malai Liskova
If GetStageDone(400) && Alias_MalaiShip.GetShipRef().IsDead()
     SetObjectiveCompleted(400) ; Kill Malai Liskova - Ship
Else
     SetObjectiveDisplayed(400, False, False)
EndIf
If GetStageDone(500)
     SetObjectiveCompleted(500) ; Talk to Malai Liskova
EndIf
If GetStageDone(525)
     SetObjectiveCompleted(525) ; Board Malai's Ship
EndIf
If GetStageDone(550)
     SetObjectiveCompleted(550) ; Kill Malai Liskova - NPC
EndIf
SetObjectiveDisplayed(600) ; Retrieve Malai's Gun for Simon

If GetStageDone(430)
     SetStage(620)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
If !GetStageDone(650) && !GetStageDone(450)
     SetStage(550)
EndIf

Actor MalaiRef = Alias_Malai.GetActorRef()
MalaiRef.SetValue(Aggression, 2)
MalaiRef.AddToFaction(PlayerEnemyFaction)
MalaiRef.StartCombat(Game.GetPlayer())

Alias_MalaiShipTurrets.SetUnconscious(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
Alias_Malai.GetRef().AddAliasedItem(LL_Weapon_Reward_RI03_Ember, Alias_MalaiGun)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_MalaiGun.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

If GetStageDone(400)
     SetObjectiveCompleted(400)
EndIf
If GetStageDone(500)
     SetObjectiveCompleted(500)
EndIf
If GetStageDone(525)
     SetObjectiveCompleted(525)
EndIf
If GetStageDone(550)
     SetObjectiveCompleted(550)
EndIf

Actor PlayerRef = Game.GetPlayer()

If PlayerRef.GetItemCount(RI03_Eon_MalaiLiskovaGun) == 0
     PlayerRef.AddItem(Alias_MalaiGun.GetRef(), abSilent = False)
EndIf

BE_RI03.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
If GetStageDone(730) && GetStageDone(740)
     SetObjectiveCompleted(710)
     SetStage(800)
     SetStage(900)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN CODE
If GetStageDone(720) && GetStageDone(740)
     SetObjectiveCompleted(710)
     SetStage(800)
     SetStage(900)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN CODE
If GetStageDone(720) && GetStageDone(730)
     SetObjectiveCompleted(710) 
     SetStage(800)
     SetStage(900)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
If !GetStageDone(700)
     SetObjectiveCompleted(200)
Else
     SetObjectiveCompleted(700)
EndIf
SetStage(800)
SetStage(900)

; Give items
ObjectReference MyPlayer = Game.GetPlayer()

MyPlayer.AddItem(Alias_StanleyFile.GetRef())
MyPlayer.AddItem(Alias_StanleyAudio.GetRef())
MyPlayer.AddItem(Alias_DataDisk.GetRef())

If GetStageDone(700)
     Alias_MalaiGun.Clear()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
If GetStageDone(950)
     SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)
If GetStageDone(850)
     SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN AUTOCAST TYPE ri_crimetrackingquestscript
Quest __temp = self as Quest
ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1300)
RI04.SetStage(100)
kmyQuest.AddFinalValues()
Game.GetPlayer().SetValue(RI03_Foreknowledge_MetUlaruAV, 1)
Game.GetPlayer().SetValue(RI03_Foreknowledge_KnowsProjectDominionAV, 1)

; Cleanup: Remove Simon if he's still there and move Stanley
; back to Infinity LTD, and disable his terminal.
Actor StanleyRef = Alias_Stanley.GetActorRef()
StanleyRef.RemoveFromFaction(CrimeFactionUC)
StanleyRef.SetCrimeFaction(None)
StanleyRef.MoveTo(Alias_InfinityLTDMarker.GetRef())
StanleyRef.EvaluatePackage()

Alias_Simon.GetRef().Disable()
Alias_StanleyTerminal.GetRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1000)
Alias_UlaruChairSwapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
RI03_PlayerMetStanley.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1070_Item_00
Function Fragment_Stage_1070_Item_00()
;BEGIN CODE
SetStage(1080)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1080_Item_00
Function Fragment_Stage_1080_Item_00()
;BEGIN CODE
Alias_Stanley.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE RI03_QuestScript
Quest __temp = self as Quest
RI03_QuestScript kmyQuest = __temp as RI03_QuestScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(200)
     SetObjectiveDisplayed(200, False, False)
EndIf
If IsObjectiveDisplayed(300)
     SetObjectiveDisplayed(300, False, False)
EndIf
If IsObjectiveDisplayed(400)
     SetObjectiveDisplayed(400, False, False)
EndIf
If IsObjectiveDisplayed(500)
     SetObjectiveDisplayed(500, False, False)
EndIf
If IsObjectiveDisplayed(525)
     SetObjectiveDisplayed(525, False, False)
EndIf
If IsObjectiveDisplayed(550)
     SetObjectiveDisplayed(550, False, False)
EndIf
If IsObjectiveDisplayed(600)
     SetObjectiveDisplayed(600, False, False)
EndIf
If IsObjectiveDisplayed(700)
     SetObjectiveDisplayed(700, False, False)
EndIf
If IsObjectiveDisplayed(710)
     SetObjectiveDisplayed(710, False, False)
EndIf
If IsObjectiveDisplayed(1000)
     SetObjectiveCompleted(1000)
EndIf

If IsObjectiveDisplayed(800)
     SetObjectiveDisplayed(800, false, false)
EndIf

If IsObjectiveDisplayed(900)
     SetObjectiveDisplayed(900, false, false)
EndIf

SetObjectiveDisplayed(1100)

ObjectReference PlayerRef = Game.GetPlayer()

PlayerRef.RemoveItem(Alias_DataDisk.GetRef(), abSilent=True)
PlayerRef.AddItem(Alias_SlateProjectDominion.GetRef(), abSilent=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
Alias_Ularu.GetRef().AddItem(Alias_SlateProjectDominion.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)

Alias_Ularu.GetActorRef().EvaluatePackage()
Alias_MasakoOfficeDoor.GetRef().Lock(False)
Alias_Ularu.GetRef().RemoveItem(Alias_SlateProjectDominion.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
RI03_1200_Masako_MeetingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1200)
SetObjectiveDisplayed(1300)

Alias_Masako.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
Alias_Masako.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN AUTOCAST TYPE ri_crimetrackingquestscript
Quest __temp = self as Quest
ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddFinalValues()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_StanleyFile Auto Const Mandatory

ReferenceAlias Property Alias_StanleyAudio Auto Const Mandatory

ReferenceAlias Property Alias_DataDisk Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Malai Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Quest Property RI01 Auto Const Mandatory

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

Scene Property RI03_350_Malai_HailingScene Auto Const Mandatory

GlobalVariable Property RI03_TESTHailGlobal Auto Const Mandatory

ReferenceAlias Property Alias_MalaiGun Auto Const Mandatory

Scene Property RI03_100_Ularu_OfficeScene Auto Const Mandatory

ReferenceAlias Property Alias_TESTStartRef Auto Const Mandatory

Scene Property RI03_1200_Masako_MeetingScene Auto Const Mandatory

ReferenceAlias Property Alias_SlateProjectDominion Auto Const Mandatory

Quest Property RI03_SpaceEncounter Auto Const Mandatory

ReferenceAlias Property Alias_MalaiShip Auto Const Mandatory

Keyword Property RI03_SayCustom_ImogeneToUlaru_Keyword Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_StanleyAccessCard Auto Const Mandatory

ReferenceAlias Property Alias_Stanley Auto Const Mandatory

ReferenceAlias Property Alias_StanleyMarker Auto Const Mandatory

GlobalVariable Property RI03_PlayerMentionsSimon Auto Const Mandatory

Quest Property RIR05 Auto Const Mandatory

Quest Property RI04 Auto Const Mandatory

ReferenceAlias Property Alias_UlaruOfficeDoor Auto Const Mandatory

ReferenceAlias Property Alias_Genevieve Auto Const Mandatory

ReferenceAlias Property Alias_GenevieveOfficeSceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_UlaruOfficeSceneMarker Auto Const Mandatory

Scene Property RI03_100_Maeve_CalloutScene Auto Const Mandatory

GlobalVariable Property RI03_PlayerMetStanley Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

ReferenceAlias Property Alias_SimonMarker Auto Const Mandatory

Weapon Property RI03_Eon_MalaiLiskovaGun Auto Const Mandatory

Quest Property RI01_JobAdRadio Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

GlobalVariable Property RI03_StanleyBribe Auto Const Mandatory

GlobalVariable Property RI03_Simon_Credits Auto Const Mandatory

GlobalVariable Property RI03_Simon_MoreCredits Auto Const Mandatory

GlobalVariable Property RI03_Simon_AndrejaCredits Auto Const Mandatory

GlobalVariable Property RI03_Simon_LessCredits Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

ActorValue Property RI03_Foreknowledge_MetUlaruAV Auto Const Mandatory

ActorValue Property RI03_Foreknowledge_KnowsProjectDominionAV Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

ReferenceAlias Property Alias_GenevieveOfficeWaitMarker Auto Const Mandatory

LeveledItem Property LL_Weapon_Reward_RI03_Ember Auto Const Mandatory

GlobalVariable Property RI03_MalaiDead Auto Const Mandatory

RefCollectionAlias Property Alias_MalaiShipTurrets Auto Const Mandatory

ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const Mandatory

ReferenceAlias Property Alias_InfinityLTDMarker Auto Const Mandatory

ReferenceAlias Property Alias_StanleyTerminal Auto Const Mandatory

ReferenceAlias Property Alias_Simon Auto Const Mandatory

ReferenceAlias Property Alias_UlaruChairSwapMarker Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

Faction Property RI03_MalaiBoardingFaction Auto Const Mandatory

GlobalVariable Property RI03_SimonDead Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

Quest Property BE_RI03 Auto Const Mandatory
