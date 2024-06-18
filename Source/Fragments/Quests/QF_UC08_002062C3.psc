;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC08_002062C3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(19)

;Get Jakob in the right place and sandboxing
UC04_JakobSandboxing_PostUC03.SetValue(1)
Alias_Jakob.GetRef().MoveTo(UC07_JakobTeleportMarker)

;Get Hadrian turned on and in the right place
UC05_HadrianSandboxing_PostUC05.SetValue(1)
Actor HadREF = Alias_Hadrian.GetActorRef()

;Get Kaiser in place
Alias_Kaiser.GetActorRef().MoveTo(UC08_PostStage150_KaiserMarker)

Game.GetPlayer().Moveto(UC08_DebugMarker01)

Utility.Wait(1.0)

HadREF.MoveTo(UC07_HadrianTeleportMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(19)

SetStage(110)
SetStage(150)

Game.GetPlayer().Moveto(UC08_DebugMarker02)

SetObjectiveCompleted(100)

Utility.Wait(1.0)
UC08_110_Hadrian_ThePlan_Main.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(19)

SetStage(110)
SetStage(150)
SetStage(160)
SetStage(165)
SetStage(175)
SetStage(200)

UC08_160_FrontGateGuard_Hustle.Stop()
UC08_165_FrontGateGuard_Direction.Stop()

Game.GetPlayer().Moveto(UC08_DebugMarker02a)

Alias_Kaiser.GetRef().Moveto(UC08_KaiserMarker_Scene150)
Alias_Hadrian.GetRef().Moveto(UC08_HadrianMarker_Scene150)
Alias_Jakob.GetRef().Moveto(UC08_JakobMarker_Scene150)

SetObjectiveCompleted(100)
SetObjectiveCompleted(150)

Utility.Wait(1.0)
UC08_110_Hadrian_ThePlan_Main.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(19)

SetStage(110)
SetStage(150)
SetStage(171)
SetStage(175)
SetStage(200)
SetStage(250)
SetStage(256)

Game.GetPlayer().Moveto(UC08_DebugMarker03)

Alias_Kaiser.GetRef().Moveto(UC08_KaiserMarker_Scene250)
Alias_Hadrian.GetRef().Moveto(UC08_HadrianMarker_Scene250)
Alias_Jakob.GetRef().Moveto(UC08_JakobMarker_Scene150)

SetObjectiveCompleted(100)
SetObjectiveCompleted(150)

Utility.Wait(1.0)
UC08_110_Hadrian_ThePlan_Main.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
SetStage(19)

SetStage(110)
SetStage(150)
SetStage(171)
SetStage(175)
SetStage(200)
SetStage(250)
SetStage(290)
SetStage(300)
SetStage(330)
SetStage(331)
UC08_330_HadrianJakob_SampleOneAcquired.Stop()
Alias_AcelesPlantThralls.KillAll()
Game.GetPlayer().Moveto(UC08_DebugMarker07)

kmyquest.CatchUpFollowers()
Alias_Jakob.GetRef().Moveto(UC08_JakobMarker_Scene150)

SetObjectiveCompleted(100)
SetObjectiveCompleted(150)
SetObjectiveCompleted(300)
SetObjectiveCompleted(330)

Utility.Wait(1.0)
UC08_110_Hadrian_ThePlan_Main.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
SetStage(19)

SetStage(110)
SetStage(150)
SetStage(171)
SetStage(175)
SetStage(200)
SetStage(250)
SetStage(290)
SetStage(300)
SetStage(330)
SetStage(335)
SetStage(345)
UC08_330_HadrianJakob_SampleOneAcquired.Stop()
SetStage(350)
SetStage(360)
SetStage(365)
SetStage(369)
UC08_360_HadrianKaiserJakob_SampleThreeScene.Stop()
Alias_TrainyardTerrormorphs.KillAll()
SetStage(370)

Game.GetPlayer().Moveto(UC08_DebugMarker05)

kmyquest.CatchUpFollowers()
Alias_Jakob.GetRef().Moveto(UC08_JakobMarker_Scene150)

SetObjectiveCompleted(100)
SetObjectiveCompleted(150)
SetObjectiveCompleted(300)
SetObjectiveCompleted(330)
SetObjectiveCompleted(369)

Utility.Wait(1.0)
UC08_110_Hadrian_ThePlan_Main.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
SetStage(19)

SetStage(110)
SetStage(150)
SetStage(171)
SetStage(175)
SetStage(200)
SetStage(250)
SetStage(290)
SetStage(300)
SetStage(330)
SetStage(335)
SetStage(345)
UC08_330_HadrianJakob_SampleOneAcquired.Stop()
SetStage(350)
SetStage(360)
SetStage(365)
SetStage(369)
UC08_360_HadrianKaiserJakob_SampleThreeScene.Stop()
Alias_TrainyardTerrormorphs.KillAll()
SetStage(370)
SetStage(385)
Alias_TrainyardTerrormorphs.KillAll()

Game.GetPlayer().Moveto(UC08_DebugMarker06)

kmyquest.CatchUpFollowers()
Alias_Jakob.GetRef().Moveto(UC08_JakobMarker_Scene150)

SetObjectiveCompleted(100)
SetObjectiveCompleted(150)
SetObjectiveCompleted(300)
SetObjectiveCompleted(330)
SetObjectiveCompleted(369)

Utility.Wait(1.0)
UC08_110_Hadrian_ThePlan_Main.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
SetStage(19)

SetStage(110)
SetStage(150)
SetStage(175)
SetStage(200)
SetStage(250)
SetStage(300)
SetStage(330)
UC08_330_HadrianJakob_SampleOneAcquired.Stop()
SetStage(350)
SetStage(355)
SetStage(360)
UC08_360_HadrianKaiserJakob_SampleThreeScene.Stop()
SetStage(370)
SetStage(385)
SetStage(420)
SetStage(425)
SetStage(430)
SetStage(450)
Alias_TrainyardTerrormorphs.KillAll()

Game.GetPlayer().Moveto(UC08_DebugMarker07)

kmyquest.CatchUpFollowers()
Alias_Jakob.GetRef().Moveto(UC08_JakobMarker_Scene150)
Alias_TransformedTerrormorph.GetRef().Moveto(UC08_TransformedTerrormorphTeleportMarker)

SetObjectiveCompleted(100)
SetObjectiveCompleted(300)
SetObjectiveCompleted(369)
SetObjectiveCompleted(370)
Utility.Wait(1.0)
UC08_110_Hadrian_ThePlan_Main.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Alias_TransformedTerrormorph.GetRef().Moveto(UC08_TransformedTerrormorphTeleportMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
SetStage(19)

SetStage(110)
SetStage(150)
SetStage(171)
SetStage(175)
SetStage(200)
SetStage(250)
SetStage(290)
SetStage(300)
SetStage(330)
SetStage(335)
SetStage(345)
UC08_330_HadrianJakob_SampleOneAcquired.Stop()
SetStage(350)
SetStage(360)
SetStage(365)
SetStage(369)
UC08_360_HadrianKaiserJakob_SampleThreeScene.Stop()
Alias_TrainyardTerrormorphs.KillAll()
SetStage(370)
SetStage(385)
Alias_TrainyardTerrormorphs.KillAll()

SetStage(490)
SetStage(500)
SetStage(510)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(630)
UC08_600_HadrianThrowsPower.Stop()

Game.GetPlayer().Moveto(UC08_DebugMarker15)

kmyquest.CatchUpFollowers()
Alias_Jakob.GetRef().Moveto(UC08_JakobMarker_Scene150)
Alias_Kaiser.GetActorRef().MoveToPackageLocation()

SetObjectiveCompleted(100)
SetObjectiveCompleted(150)
SetObjectiveCompleted(300)
SetObjectiveCompleted(330)
SetObjectiveCompleted(369)
SetObjectiveCompleted(370)
SetObjectiveCompleted(490)
SetObjectiveCompleted(500)
SetObjectiveCompleted(510)

Utility.Wait(1.0)
UC08_110_Hadrian_ThePlan_Main.Stop()

;Turn off Hadrian's combat dialogue
UC_Hadrian_ECCombatDialogueActive.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Game.GetPlayer().Moveto(UC08_DebugMarker11)
Alias_Hadrian.GetRef().MoveTo(UC08_DebugMarker11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
SetStage(19)

SetStage(110)
SetStage(150)
SetStage(171)
SetStage(175)
SetStage(200)
SetStage(250)
SetStage(290)
SetStage(300)
SetStage(330)
SetStage(335)
SetStage(345)
UC08_330_HadrianJakob_SampleOneAcquired.Stop()
SetStage(350)
SetStage(360)
SetStage(365)
SetStage(369)
UC08_360_HadrianKaiserJakob_SampleThreeScene.Stop()
UC08_371_JakobHadrianKaiser_ScanTwo.Stop()
Alias_TrainyardTerrormorphs.KillAll()
SetStage(370)
SetStage(385)
Alias_TrainyardTerrormorphs.KillAll()

SetStage(490)
SetStage(500)

Game.GetPlayer().Moveto(UC08_DebugMarker11)

kmyquest.CatchUpFollowers()
Alias_Jakob.GetRef().Moveto(UC08_JakobMarker_Scene150)

SetObjectiveCompleted(100)
SetObjectiveCompleted(150)
SetObjectiveCompleted(300)
SetObjectiveCompleted(330)
SetObjectiveCompleted(369)
SetObjectiveCompleted(370)
SetObjectiveCompleted(490)
Utility.Wait(1.0)
UC08_110_Hadrian_ThePlan_Main.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
SetStage(19)

SetStage(110)
SetStage(150)
SetStage(171)
SetStage(175)
SetStage(200)
SetStage(250)
SetStage(290)
SetStage(300)
SetStage(330)
SetStage(335)
SetStage(345)
UC08_330_HadrianJakob_SampleOneAcquired.Stop()
SetStage(350)
SetStage(360)
SetStage(365)
SetStage(369)
UC08_360_HadrianKaiserJakob_SampleThreeScene.Stop()
UC08_110_Hadrian_ThePlan_Main.Stop()
Alias_TrainyardTerrormorphs.KillAll()
SetStage(370)
SetStage(385)
Alias_TrainyardTerrormorphs.KillAll()

SetStage(490)
SetStage(500)
SetStage(510)
SetStage(530)
SetStage(533)
SetStage(535)
SetStage(600)
SetStage(610)
SetStage(620)
SetStage(630)
UC08_600_HadrianThrowsPower.Stop()

Game.GetPlayer().Moveto(UC08_DebugMarker02)

kmyquest.CatchUpFollowers()
Alias_Jakob.GetActorRef().MoveToPackageLocation()

SetObjectiveCompleted(100)
SetObjectiveCompleted(150)
SetObjectiveCompleted(300)
SetObjectiveCompleted(330)
SetObjectiveCompleted(369)
SetObjectiveCompleted(370)
SetObjectiveCompleted(490)
SetObjectiveCompleted(513)
SetObjectiveCompleted(530)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
UC04_ConvincedYasin.SetValue(1)
Alias_Agent.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(UC03_RedDevilsHQKey, abSilent=true)
DialogueRedDevilsHQ.SetStage(7)

;give player a ship
Frontier_ModularREF.moveto(RDHQShipLandingMarker)
Frontier_ModularREF.setlinkedref(RDHQShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

;Give the player some guns
Game.GetPlayer().AddItem(TestVSWeapons, abSilent = true)

;Turn on Hadrian and Kaiser
Actor HadACT = Alias_Hadrian.GetActorRef()
Actor KaiACT = Alias_Kaiser.GetActorRef()

HadACT.Enable()
KaiACT.Enable()

;Turn on Hadrian's Vae Victis' reveal scene
UC07_HadrianVVRevealQuest.Start()

;Add the perks for the custom lines in here
Actor PlayACT = Game.GetPlayer()
PlayACT.AddPerk(BackgroundSoldier)
PlayACT.AddPerk(BackgroundXenobiologist)
PlayACT.AddPerk(BackgroundCyberrunner)

;Turn on Hadrian's combat dialogue
UC_Hadrian_ECCombatDialogueActive.SetValue(1)

;Get RHQ in the right state
DialogueRedDevilsHQ.SetStage(10)
DialogueRedDevilsHQ.SetStage(20)

;Turn on the Queen Battle support quest
UC08_QueenBattle.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
SetActive()

;Block activation on the security reboot system
Alias_SecurityRebootButton.GetRef().BlockActivation(true, true)

;Mark up the Transformed Terrormorph to be ghosted
;Ghosting gets cleaned up in the morph's alias script
Alias_TransformedTerrormorph.GetActorRef().SetGhost(true)

;Unlock all the cache doors
Alias_CacheDoors.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0116_Item_00
Function Fragment_Stage_0116_Item_00()
;BEGIN CODE
Alias_RHQAceles.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayedAtTop(150)

if !DialogueRedDevilsHQ.GetStageDone(600)
  SetObjectiveDisplayed(151)
endif

;Give the player the map marker to Londinion
FB441BaseMapMarker.AddToMapScanned()

;Give the player access to collecting all the items there
Game.GetPlayer().AddToFaction(UC08_FB441OwnerFaction)

;Turn on the guard using the range
UC08_TolimanGuard_UseRange.SetValue(1)
Actor GuardACT = Alias_RangeGuard.GetActorRef()
GuardACT.EvaluatePackage()
GuardACT.MovetoPackageLocation()


;Turn on all the gear
Alias_AntiXenoHelmet.GetRef().Enable()
Alias_AntiXenoPack.GetRef().Enable()
Alias_AntiXenoSuit.GetRef().Enable()
Alias_AntiXenoWeapon.GetRef().Enable()

;Turn on the agent
if UC04_ConvincedYasin.GetValue() >= 1.0
  Alias_Agent.GetRef().Enable()
endif

;Turn on the Queen Battle Support quest
UC08_QueenBattle.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0151_Item_00
Function Fragment_Stage_0151_Item_00()
;BEGIN CODE
if DialogueRedDevilsHQ.GetStageDone(600)
  SetObjectiveCompleted(151)
else
  SetObjectiveDisplayed(151, false, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
UC08_160_FrontGateGuard_Hustle.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN CODE
UC08_160_FrontGateGuard_Hustle.Stop()
UC08_165_FrontGateGuard_Direction.Start()

SetObjectiveCompleted(150)
SetObjectiveDisplayed(165)

;Close out Gualter's obj if it hasn't been already
SetStage(151)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0166_Item_00
Function Fragment_Stage_0166_Item_00()
;BEGIN CODE
UC08_TolimanGuard_UseRange.SetValue(0)
Alias_RangeGuard.TryToEvaluatePackage()
Alias_CommanderHatoum.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0171_Item_00
Function Fragment_Stage_0171_Item_00()
;BEGIN CODE
Actor HadACT = Alias_Hadrian.GetActorRef()
Actor JakACT = Alias_Jakob.GetActorRef()
Actor KaiACT = Alias_Kaiser.GetActorRef()

HadACT.SetOutfit(Outfit_Spacesuit_UCMarine_NoHelmet, true)
HadACT.SetValue(ActorShouldShowSpacesuitCosmetic_AV, 1.0)
HadACT.SetValue(ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV, 1.0)
JakACT.SetOutfit(UC08_Outfit_Percival_WinterGear)

HadAct.Moveto(UC08_HadrianTeleportMarker_Stage171)
JakAct.Moveto(UC08_PercyTeleportMarker_Stage171)
KaiAct.Moveto(UC08_KaiserTeleportMarker_Stage171)
HadAct.EvaluatePackage()
JakAct.EvaluatePackage()
KaiAct.EvaluatePackage()

;Turn on their ship as well
Alias_HadrianShip.GetRef().Enable()

;And turn off the one at RHQ
Alias_HadriansShip_RHQ.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
Alias_Kaiser.GetActorRef().EvaluatePackage()
Alias_CommanderHatoum.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(165)
SetObjectiveDisplayed(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0181_Item_00
Function Fragment_Stage_0181_Item_00()
;BEGIN CODE
SetStage(256)

if !GetStageDone(178)
  Alias_Kaiser.GetRef().Moveto(UC08_KaiserTeleportMarker_Stage176)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(175)
SetObjectiveDisplayed(250)

if !GetStageDone(250)
  SetObjectiveDisplayed(200)
endif

Alias_Jakob.GetActorRef().EvaluatePackage()
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
if GetStageDone(220) && GetStageDone(230) && GetStageDone(240) && (Alias_Agent.GetREF().IsDisabled() || GetStageDone(245))
  SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
if GetStageDone(210) && GetStageDone(230) && GetStageDone(240) && (Alias_Agent.GetREF().IsDisabled() || GetStageDone(245))
  SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
if GetStageDone(220) && GetStageDone(210) && GetStageDone(240) && (Alias_Agent.GetREF().IsDisabled() || GetStageDone(245))
  SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
if GetStageDone(220) && GetStageDone(230) && GetStageDone(210) && (Alias_Agent.GetREF().IsDisabled() || GetStageDone(245))
  SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0245_Item_00
Function Fragment_Stage_0245_Item_00()
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()
PlayACT.AddItem(LL_Weapon_Reward_UC08_X989)
PlayACT.AddItem(Ammo777mm, 1000)
Alias_Agent.GetActorRef().EvaluatePackage()

if GetStageDone(220) && GetStageDone(230) && GetStageDone(210) && GetStageDone(240)
  SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
if !GetStageDone(290)
  SetObjectiveCompleted(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
ObjectReference Trig255 = Alias_TriggerStage255.GetRef()
if Trig255.IsInTrigger(Alias_Kaiser.GetRef()) && Trig255.IsInTrigger(Alias_CommanderHatoum.GetRef())
  UC08_180_KaiserHatoum_CodeHandoff.Start()
else
  SetStage(256)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0256_Item_00
Function Fragment_Stage_0256_Item_00()
;BEGIN CODE
Alias_Kaiser.GetActorRef().EvaluatePackage()
Alias_CommanderHatoum.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
if !IsObjectiveCompleted(200) && IsObjectiveDisplayed(200)
  SetObjectiveDisplayed(200, false, false)
endif

;Turn off Hadrian's combat dialogue
UC_Hadrian_ECCombatDialogueActive.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0291_Item_00
Function Fragment_Stage_0291_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().AddPerk(UC08_HadrianDamageIncrease)
UC08_HadrianDamageIncreased.Show()
SetStage(290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0295_Item_00
Function Fragment_Stage_0295_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)
SetObjectiveDisplayed(295)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
;Unlock the front gate and the swtich
Alias_AirlockSwitch.GetRef().BlockActivation(false, false)
Alias_FrontAirlock.GetRef().BlockActivation(false, false)

SetObjectiveCompleted(250)
SetObjectiveCompleted(295)
SetObjectiveDisplayed(300)

;Have Kaiser and Hadrian follow the player into the city
kmyquest.ToggleFollowerState(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
UC08_310_HadrianJakob_PointOne.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0311_Item_00
Function Fragment_Stage_0311_Item_00()
;BEGIN CODE
QST_UC08_TowerPing.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

if Alias_AcelesPlantThralls.GetCount() <= 0
  Utility.Wait(2.0)

  if GetStageDone(314)
    SetStage(316)
  endif
else
  if GetStageDone(318)
    UC08_318_Hadrian_MoreThralls.Start()

    if !GetStageDone(329)
      SetObjectiveDisplayed(315, false, false)
      SetObjectiveDisplayed(318)
    endif
  else 
    SetObjectiveDisplayedAtTop(315)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0316_Item_00
Function Fragment_Stage_0316_Item_00()
;BEGIN CODE
UC08_320_KaiserHadrian_ApproachAcelesPlant.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0317_Item_00
Function Fragment_Stage_0317_Item_00()
;BEGIN CODE
if !GetStageDone(318)
  UC08_317_Hadrian_1stThrall.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0318_Item_00
Function Fragment_Stage_0318_Item_00()
;BEGIN CODE
if GetStageDone(315)
  UC08_318_Hadrian_MoreThralls.Start()

  if !GetStageDone(329)
    SetObjectiveDisplayed(315, false, false)
    SetObjectiveDisplayed(318)
  endif
else
  SetStage(315)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
if GetStageDone(315)
  UC08_320_KaiserHadrian_ApproachAcelesPlant.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
SetObjectiveCompleted(318)
SetObjectiveDisplayed(320)
SetObjectiveDisplayed(325)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0329_Item_00
Function Fragment_Stage_0329_Item_00()
;BEGIN CODE
if !GetStageDone(325)
  UC08_317_Hadrian_1stThrall.Stop()
  UC08_318_Hadrian_MoreThralls.Stop()
  UC08_320_KaiserHadrian_ApproachAcelesPlant.Stop()
  UC08_331_KaiserHadrian_FindAcelesSamples.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0331_Item_00
Function Fragment_Stage_0331_Item_00()
;BEGIN CODE
SetObjectiveCompleted(315)
SetObjectiveCompleted(320)
SetObjectiveCompleted(325)
SetObjectiveDisplayed(331)
SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0333_Item_00
Function Fragment_Stage_0333_Item_00()
;BEGIN CODE
UC08_333_Hadrian_AggroTrainyardMorphs.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0335_Item_00
Function Fragment_Stage_0335_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ToggleFollowerState(0)

SetObjectiveCompleted(300)
SetObjectiveCompleted(315)
SetObjectiveDisplayed(330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0336_Item_00
Function Fragment_Stage_0336_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
SetObjectiveCompleted(330)
SetObjectiveDisplayed(340)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0342_Item_00
Function Fragment_Stage_0342_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0345_Item_00
Function Fragment_Stage_0345_Item_00()
;BEGIN CODE
;This'll leave the follower's behavior off in stage 350
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
;Get the sample in the container
Alias_AceleSampleContainer.GetRef().AddItem(Alias_AcelesSampleOneINV.GetRef())
Alias_AceleSampleContainerBeta.GetRef().AddItem(Alias_AcelesSampleTwoINV.GetRef())
Alias_AceleSampleContainerGamma.GetRef().AddItem(Alias_AcelesSampleGammaINV.GetRef())

;Turn on all the containers
Alias_ContainerDoors.BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0365_Item_00
Function Fragment_Stage_0365_Item_00()
;BEGIN CODE
;Clear quest object status from the Manifests
UC08_SupportQuest.SetStage(100)

SetObjectiveCompleted(350)
if !IsObjectiveCompleted(355)
  SetObjectiveDisplayed(355, false, false)
endif

SetObjectiveDisplayed(365)

if UC08_HadrianKaiserFollowingPlayer.GetValueInt() >= 1
  SetStage(366)
  UC08_365_KaiserHadrian_SampleCollected.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0367_Item_00
Function Fragment_Stage_0367_Item_00()
;BEGIN CODE
;If Hadrian was present for the sample collection, just head straight into the next scene
if GetStageDone(366)
  UC08_366_Hadrian_GiveKaiserSample.Start()

;Otherwise, direct the player to check in with her
else
  SetObjectiveCompleted(365)
  SetObjectiveDisplayed(367)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0369_Item_00
Function Fragment_Stage_0369_Item_00()
;BEGIN CODE
SetObjectiveCompleted(365)
if IsObjectiveDisplayed(367)
  SetObjectiveCompleted(367)
endif
SetObjectiveDisplayed(369)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ToggleFollowerState(1)

SetObjectiveCompleted(365)
SetObjectiveCompleted(367)
SetObjectiveCompleted(369)
SetObjectiveCompleted(371)
SetObjectiveDisplayed(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0371_Item_00
Function Fragment_Stage_0371_Item_00()
;BEGIN CODE
SetObjectiveCompleted(369)
SetObjectiveDisplayed(371)

Game.GetPlayer().RemoveItem(Alias_AcelesSampleOneINV.GetRef())
UC08_371_JakobHadrianKaiser_ScanTwo.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0372_Item_00
Function Fragment_Stage_0372_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_AcelesSampleOneINV.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
if GetStageDone(376) && GetStageDone(377)
  SetStage(378)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0376_Item_00
Function Fragment_Stage_0376_Item_00()
;BEGIN CODE
if GetStageDone(375) && GetStageDone(377)
  SetStage(378)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0377_Item_00
Function Fragment_Stage_0377_Item_00()
;BEGIN CODE
if GetStageDone(376) && GetStageDone(375)
  SetStage(378)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0378_Item_00
Function Fragment_Stage_0378_Item_00()
;BEGIN CODE
SetObjectiveCompleted(331)

UC08_378_Hadrian_AllSamplesCollected.Start()
if Alias_Hadrian.GetActorRef().IsInCombat() || Alias_Kaiser.GetActorRef().IsInCombat()
  SetStage(381)
else
  SetStage(382)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0379_Item_00
Function Fragment_Stage_0379_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CatchUpFollowers()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
Alias_UndergroundHeatleeches.EnableAll()

UC08_380_Kaiser_UnlockDoor.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0381_Item_00
Function Fragment_Stage_0381_Item_00()
;BEGIN CODE
;Make sure the collection hasn't already been emptied
if Alias_TrainyardTerrormorphs.GetCount() > 0
  SetObjectiveDisplayed(381)
else
  SetStage(382)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0382_Item_00
Function Fragment_Stage_0382_Item_00()
;BEGIN CODE
;Get Kaiser in his "Social Immune" alias
Alias_KaiserSocialImmune.ForceRefTo(Alias_Kaiser.GetRef())

SetObjectiveCompleted(381)
SetObjectiveDisplayed(369)

if GetStageDone(381)
  UC08_382_Hadrian_HandOverSamples.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0383_Item_00
Function Fragment_Stage_0383_Item_00()
;BEGIN CODE
SetObjectiveCompleted(369)
SetObjectiveDisplayed(383)

Actor PlayACT = Game.GetPlayer()
PlayAct.RemoveItem(Alias_AcelesSampleOneINV.GetRef())
PlayAct.RemoveItem(Alias_AcelesSampleTwoINV.GetRef())
PlayAct.RemoveItem(Alias_AcelesSampleGammaINV.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0384_Item_00
Function Fragment_Stage_0384_Item_00()
;BEGIN CODE
WwiseEvent_QST_UC08_Robot_Remote_Unlock.Play(Alias_Kaiser.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0385_Item_00
Function Fragment_Stage_0385_Item_00()
;BEGIN CODE
SetObjectiveCompleted(383)
SetObjectiveDisplayed(370)

Alias_UndergroundDoor.GetRef().Unlock()
Alias_UndergroundDoor.GetRef().BlockActivation(false, false)
Alias_UndergroundDoorInt.GetRef().BlockActivation(false, false)

;Turn on the Heatleeches
Alias_UndergroundHeatleeches.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0386_Item_00
Function Fragment_Stage_0386_Item_00()
;BEGIN CODE
UC08_379_PercivalKaiser_IntoTheTunnels_Combat.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
UC08_400_HadrianKaiser_LazarusPlant.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
Alias_UndergroundHeatleeches.EvaluateAll()

UC08_405_Hadrian_HeatLeeches.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ToggleFollowerState(0)

UC08_400_HadrianKaiser_LazarusPlant.Stop()
UC08_405_Hadrian_HeatLeeches.Stop()
UC08_410_Hadrian_BloomingPlant.Start()

Alias_Hadrian.GetActorRef().EvaluatePackage()
Alias_Kaiser.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0412_Item_00
Function Fragment_Stage_0412_Item_00()
;BEGIN CODE
Actor TLAct = Alias_TransformationLeech.GetActorRef()
TLAct.Enable()
TLAct.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0413_Item_00
Function Fragment_Stage_0413_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ToggleLazPlants(Alias_TransformationLazarusPlants)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
SetObjectiveCompleted(370)
SetObjectiveDisplayed(415)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
Actor TLAct = Alias_TransformationLeech.GetActorRef()
TLAct.EvaluatePackage()

Actor TTREF = Alias_TransformedTerrormorph.GetActorRef()
;TTREF.MoveTo(Alias_TransformMorphSpawn.GetRef())
;TTREF.EvaluatePackage()
TTREF.AddItem(Alias_TTCellSample.GetRef())

;Turn off the agent
Actor AgentACT = Alias_Agent.GetActorRef()
if AgentACT.IsEnabled()
  AgentACT.Disable()
endif

;Trigger the music stinger
MUSGenesisStingerDread4TerrormorphTransform.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0424_Item_00
Function Fragment_Stage_0424_Item_00()
;BEGIN CODE
Alias_TransformedTerrormorph.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
Alias_TransformedTerrormorph.GetActorRef().EvaluatePackage()

;Direct the player to speak to Hadrian
SetStage(426)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0426_Item_00
Function Fragment_Stage_0426_Item_00()
;BEGIN CODE
SetObjectiveCompleted(415)
SetObjectiveDisplayed(426)

Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0427_Item_00
Function Fragment_Stage_0427_Item_00()
;BEGIN CODE
PlayerKnows_HeatLeeches.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0429_Item_00
Function Fragment_Stage_0429_Item_00()
;BEGIN CODE
WwiseEvent_QST_UC08_Robot_Remote_Unlock.Play(Alias_Kaiser.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
Alias_TransformRoomDoor.GetRef().BlockActivation(false, false)
Alias_TransformRoomDoor.GetRef().Unlock()
Alias_Hadrian.GetActorRef().EvaluatePackage()
Alias_Kaiser.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
;Clear the TT from its alias to allow it to become hostile to the player and crew.
;Alias_NonHostileTT.Clear()

;Clear Kaiser from his "Social immune" alias
Alias_KaiserSocialImmune.Clear()

;Make everyone followers of the player again
kmyquest.ToggleFollowerState(1)

kmyquest.EVPFollowers()

SetObjectiveCompleted(415)
SetObjectiveCompleted(426)
SetObjectiveDisplayed(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
UC08_460_Hadrian_CheerOnDeadTT.Start()
SetObjectiveCompleted(450)

if !GetStageDone(465)
  SetObjectiveDisplayed(460)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0465_Item_00
Function Fragment_Stage_0465_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
UC08_460_Hadrian_CheerOnDeadTT.Stop()
UC08_465_HadrianKaiser_HandOverSample.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
SetObjectiveCompleted(460)
SetObjectiveDisplayed(470)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_TTCellSample.GetRef())

SetObjectiveCompleted(470)
SetObjectiveDisplayed(480)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
SetObjectiveCompleted(480)
SetObjectiveDisplayed(490)

;Have Kaiser cease being a follower and get him in his own scene
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(Alias_Kaiser.GetActorRef(), false)

;Turn on trigger 495 (in case the player and crew are already inside it)
Alias_TriggerStage495.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_Kaiser.GetActorRef().EvaluatePackage()

Alias_SecurityOfficeDoor.GetRef().BlockActivation(false, false)
Alias_SecurityOfficeDoor.GetRef().Unlock()

SetObjectiveCompleted(490)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
UC08_510_Hadrian_UtilityPanel.Start()

;Have Hadrian cease being a follower
Actor HadACT = Alias_Hadrian.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(HadACT, false)
HadACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0507_Item_00
Function Fragment_Stage_0507_Item_00()
;BEGIN CODE
;Disable the power box
Alias_PortUtilityControls.GetRef().BlockActivation(true, true)

;Unblock activation on the security reboot system
ObjectReference ButtonREF = Alias_SecurityRebootButton.GetRef()
ButtonREF.BlockActivation(false, false)

;Kick the lights back on
QST_UC08_UtilityControlFail.Play(ButtonRef)
Alias_SecurityOfficeEnableMarker.GetRef().Disable()

SetObjectiveCompleted(500)
SetObjectiveDisplayed(507)

UC08_507_PowerRestoredScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0508_Item_00
Function Fragment_Stage_0508_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
SetObjectiveCompleted(507)
SetObjectiveDisplayed(510)

UC08_510_Hadrian_UtilityPanel.Stop()
UC08_507_PowerRestoredScene.Stop()

;Block activation on the security reboot system again
ObjectReference ButtonRef = Alias_SecurityRebootButton.GetRef()
ButtonRef.BlockActivation(true, true)
QST_UC08_ResetButtonReboot.Play(ButtonRef)

;Kick off the "power on" scene
UC08_600_HadrianThrowsPower.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0513_Item_00
Function Fragment_Stage_0513_Item_00()
;BEGIN CODE
UC08_513_HadrianKaiser_UnlockDoor.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN CODE
;Turn on the queen
Actor TQACT = Alias_TerrormorphQueen.GetActorRef()
TQACT.Enable()
TQACT.SetNoBleedoutRecovery(true)
TQAct.AddItem(Alias_TMSampleOneINV.GetRef())

;Enable her ambush trigger
Alias_TriggerStage521.GetRef().Enable()

ObjectReference gateREF = Alias_Spaceportgate.Getref()
gateREF.Unlock()
gateREF.SetOpen()

;Have Kaiser resume being a follower
(SQ_Followers as SQ_FollowersScript).SetRoleActive(Alias_Kaiser.GetActorRef(), false)

SetObjectiveCompleted(513)
SetObjectiveDisplayed(515)

;Turn on the spaceport map marker
Alias_SpaceportMapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0521_Item_00
Function Fragment_Stage_0521_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(515, false, false)

if !GetStageDone(530)
  UC08_QueenBattle.SetStage(95)
  SetObjectiveDisplayedAtTop(525)
  Actor QRef = Alias_TerrormorphQueen.GetRef() as Actor
  NPC_Terrormorph_Scream_WEF.Play(QRef)
  QRef.StartCombat(Game.GetPlayer())
  Alias_Hadrian.GetActorRef().StartCombat(QRef)
  UC08_525_Hadrian_QueenAggro.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0526_Item_00
Function Fragment_Stage_0526_Item_00()
;BEGIN CODE
if !GetStageDone(530)
  SetObjectiveDisplayed(526)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0528_Item_00
Function Fragment_Stage_0528_Item_00()
;BEGIN CODE
;Have the beast howl
QST_UC08_Terrormorph_Queen_Death_Scream.Play(Alias_TerrormorphQueen.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0529_Item_00
Function Fragment_Stage_0529_Item_00()
;BEGIN CODE
SetObjectiveCompleted(526)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
;Get the Anomaly Battle into its shut down state
UC08_QueenBattle.SetStage(900)

if IsObjectiveDisplayed(515)
  SetObjectiveDisplayed(515, false, false)
endif

SetObjectiveCompleted(525)

if !GetStageDone(529)
  SetObjectiveDisplayed(526, false, false)
endif
SetObjectiveDisplayed(530)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0531_Item_00
Function Fragment_Stage_0531_Item_00()
;BEGIN CODE
UC08_531_Hadrian_HandOverFinalSample.Start()
SetObjectiveCompleted(530)
SetObjectiveDisplayed(531)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0532_Item_00
Function Fragment_Stage_0532_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_TMSampleOneINV.GetRef())

;Turn Hadrian's combat dialogue back on
UC_Hadrian_ECCombatDialogueActive.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0533_Item_00
Function Fragment_Stage_0533_Item_00()
;BEGIN CODE
SetObjectiveCompleted(531)
SetObjectiveDisplayed(660)
SetStage(660)

Alias_Kaiser.GetActorRef().EvaluatePackage()
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0535_Item_00
Function Fragment_Stage_0535_Item_00()
;BEGIN CODE
UC08_535_Kaiser_ExitUnlocked.Start()
Utility.Wait(2.0)
Alias_SpaceportExit.GetRef().Unlock()
SetStage(660)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
UC08_540_Hadrian_SpaceportDamage.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
UC08_550_HadrianKaiser_SealedChamber.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(530, false, false)
SetObjectiveDisplayed(560)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
UC08_570_Hadrian_UtilityPanel.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0580_Item_00
Function Fragment_Stage_0580_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(560, false, false)
SetObjectiveDisplayed(580)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN CODE
SetObjectiveCompleted(580)
SetObjectiveDisplayed(590)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
UC08_600_HadrianThrowsPower.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0605_Item_00
Function Fragment_Stage_0605_Item_00()
;BEGIN CODE
Alias_PortUtilityControls.GetRef().Activate(Alias_Hadrian.GetActorRef())

;GEN-343287 - Pull this once we get the actual assets in
UC08_DEBUG_PortPowerRestored.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0615_Item_00
Function Fragment_Stage_0615_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0617_Item_00
Function Fragment_Stage_0617_Item_00()
;BEGIN CODE
Alias_RecorderTrigger.GetRef().Enable()
SetObjectiveCompleted(510)
SetObjectiveCompleted(610)
SetObjectiveDisplayed(617)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
Alias_RecorderTrigger.GetRef().Disable()
Game.GetPlayer().AddItem(Alias_VVAudioLog.GetRef())

SetObjectiveCompleted(617)
SetObjectiveDisplayed(620)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0624_Item_00
Function Fragment_Stage_0624_Item_00()
;BEGIN CODE
UC07_HadrianVVRevealQuest.SetStage(200)
SetStage(623)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
;Have Hadrian resume being a follower
Actor HadACT = Alias_Hadrian.GetActorRef()
HadACT.AddKeyword(SQ_Followers_UseFollowPlayerCustom)
(SQ_Followers as SQ_FollowersScript).SetRoleActive(HadACT, false)

SetObjectiveCompleted(620)
SetObjectiveDisplayed(513)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
UC08_640_Kaiser_PopChamber.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0645_Item_00
Function Fragment_Stage_0645_Item_00()
;BEGIN CODE
ObjectReference DoorREF = Alias_FinalSampleDoor.GetRef()
DoorREF.Unlock()
DoorRef.Activate(Alias_Kaiser.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(630)
SetObjectiveDisplayed(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
;Get Jakob in the right spot
Actor JakobACT = Alias_Jakob.GetActorRef()
JakobACT.EvaluatePackage()
JakobACT.MoveTo(PercivalFinalSceneMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0665_Item_00
Function Fragment_Stage_0665_Item_00()
;BEGIN CODE
UC07_HadrianKnowsVVLives.SetValue(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(660)
SetObjectiveDisplayed(700)

;Turn off Kaiser/Hadrian following the player
Actor HadACT = Alias_Hadrian.GetActorRef()
Actor KaiACT = Alias_Kaiser.GetActorRef()
HadACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
KaiACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(HadACT, false)
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(KaiACT, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
ObjectReference PlayREF = Game.GetPlayer()
PlayREF.RemoveItem(Alias_AcelesSampleOneINV.GetRef())
PlayREF.RemoveItem(Alias_AcelesSampleTwoINV.GetRef())
PlayREF.RemoveItem(Alias_TMSampleOneINV.GetRef())
PlayREF.RemoveItem(Alias_TMSampleTwoINV.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE uc08questscript
Quest __temp = self as Quest
uc08questscript kmyQuest = __temp as uc08questscript
;END AUTOCAST
;BEGIN CODE
;Turn off Kaiser/Hadrian following the player
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(Alias_Hadrian.GetActorRef(), false)
(SQ_Followers as SQ_FollowersScript).SetRoleInactive(Alias_Kaiser.GetActorRef(), false)

;Tag Kaiser to get to start sandboxing
UC09_KaiserSandboxing_PostUC08.SetValue(1)

UC09.Start()

;Get the VV tape handed off to UC09 to keep it a quest item
(UC09 as UC09QuestScript).EmergencyRecording.ForceRefTo(Alias_VVAudioLog.GetRef())

;Close all the doors again
ObjectReference gateREF = Alias_Spaceportgate.Getref()
gateREF.Lock()
gateREF.SetOpen(false)

;Clear Hadrian's perk
if Alias_Hadrian.GetActorRef().HasPerk(UC08_HadrianDamageIncrease)
  Alias_Hadrian.GetActorRef().RemovePerk(UC08_HadrianDamageIncrease)
endif

;If the post-Terrormorph City Life scene hasn't wrapped up yet, kill it now
if !UC_NA_CL_PostTerrormorphAttackScene.GetStageDone(1000)
  UC_NA_CL_PostTerrormorphAttackScene.SetStage(999)
endif

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property UC08_100_Hadrian_WalkIntoMainRoom Auto Const Mandatory

Key Property UC03_RedDevilsHQKey Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property RDHQShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

GlobalVariable Property UC04_JakobSandboxing_PostUC03 Auto Const Mandatory

ObjectReference Property UC07_JakobTeleportMarker Auto Const Mandatory

GlobalVariable Property UC05_HadrianSandboxing_PostUC05 Auto Const Mandatory

ReferenceAlias Property Alias_Hadrian Auto Const Mandatory

ReferenceAlias Property Alias_Jakob Auto Const Mandatory

ObjectReference Property UC07_HadrianTeleportMarker Auto Const Mandatory

LeveledItem Property TestVSWeapons Auto Const Mandatory

ObjectReference Property UC08_DebugMarker01 Auto Const Mandatory

ObjectReference Property UC08_DebugMarker02 Auto Const Mandatory

ObjectReference Property UC08_JakobMarker_Scene150 Auto Const Mandatory

ObjectReference Property UC08_HadrianMarker_Scene150 Auto Const Mandatory

ObjectReference Property UC08_KaiserMarker_Scene150 Auto Const Mandatory

ReferenceAlias Property Alias_Kaiser Auto Const Mandatory

ReferenceAlias Property Alias_AntiXenoHelmet Auto Const Mandatory

ReferenceAlias Property Alias_AntiXenoPack Auto Const Mandatory

ReferenceAlias Property Alias_AntiXenoSuit Auto Const Mandatory

ReferenceAlias Property Alias_AntiXenoWeapon Auto Const Mandatory

Message Property UC08_DEBUG_RadarSweepSound Auto Const Mandatory

Scene Property UC08_310_HadrianJakob_PointOne Auto Const Mandatory

ReferenceAlias Property Alias_AcelesSampleOne Auto Const Mandatory

ReferenceAlias Property Alias_AcelesSampleOneINV Auto Const Mandatory

Scene Property UC08_330_HadrianJakob_SampleOneAcquired Auto Const Mandatory

ReferenceAlias Property Alias_SupplyCache01 Auto Const Mandatory

RefCollectionAlias Property Alias_SupplyCaches Auto Const Mandatory

ReferenceAlias Property Alias_TMSampleOneACT Auto Const Mandatory

ReferenceAlias Property Alias_TMSampleOneINV Auto Const Mandatory

Scene Property UC08_360_HadrianKaiserJakob_SampleThreeScene Auto Const Mandatory

Scene Property UC08_380_Kaiser_UnlockDoor Auto Const Mandatory

ReferenceAlias Property Alias_UndergroundDoor Auto Const Mandatory

Scene Property UC08_400_HadrianKaiser_LazarusPlant Auto Const Mandatory

Scene Property UC08_405_Hadrian_HeatLeeches Auto Const Mandatory

Scene Property UC08_410_Hadrian_BloomingPlant Auto Const Mandatory

Message Property UC08_DEBUG_TerrormorphTransformation Auto Const Mandatory

Message Property UC08_DEBUG_HeatLeechesScatter Auto Const Mandatory

ReferenceAlias Property Alias_TransformedTerrormorph Auto Const Mandatory

ObjectReference Property UC08_TransformedTerrormorphTeleportMarker Auto Const Mandatory

ReferenceAlias Property Alias_TTCellSample Auto Const Mandatory

Scene Property UC08_465_HadrianKaiser_HandOverSample Auto Const Mandatory

ReferenceAlias Property Alias_TMSampleTwoACT Auto Const Mandatory

ReferenceAlias Property Alias_TMSampleTwoINV Auto Const Mandatory

Scene Property UC08_520_KaiserHadrian_Queen Auto Const Mandatory

ReferenceAlias Property Alias_TerrormorphQueen Auto Const Mandatory

Scene Property UC08_540_Hadrian_SpaceportDamage Auto Const Mandatory

Scene Property UC08_550_HadrianKaiser_SealedChamber Auto Const Mandatory

Scene Property UC08_570_Hadrian_UtilityPanel Auto Const Mandatory

ReferenceAlias Property Alias_PortUtilityControls Auto Const Mandatory

Message Property UC08_DEBUG_PortPowerRestored Auto Const Mandatory

Scene Property UC08_600_HadrianThrowsPower Auto Const Mandatory

Message Property UC08_DEBUG_HadrianSceneVariant Auto Const Mandatory

ReferenceAlias Property Alias_AcelesSampleTwoAct Auto Const Mandatory

ReferenceAlias Property Alias_AcelesSampleTwoINV Auto Const Mandatory

ReferenceAlias Property Alias_FinalSampleDoor Auto Const Mandatory

Scene Property UC08_660_HadrianJakob_ReturnToBase Auto Const Mandatory

ObjectReference Property UC08_DebugMarker03 Auto Const Mandatory

ObjectReference Property UC08_KaiserMarker_Scene250 Auto Const Mandatory

ObjectReference Property UC08_HadrianMarker_Scene250 Auto Const Mandatory

ObjectReference Property UC08_DebugMarker04 Auto Const Mandatory

ReferenceAlias Property Alias_TransformationRoomDoor Auto Const Mandatory

ReferenceAlias Property Alias_TransformRoomDoor Auto Const Mandatory

ObjectReference Property UC08_DebugMarker05 Auto Const Mandatory

ReferenceAlias Property Alias_AirlockGate Auto Const Mandatory

ObjectReference Property UC08_DebugMarker06 Auto Const Mandatory

ObjectReference Property UC08_DebugMarker07 Auto Const Mandatory

RefCollectionAlias Property Alias_TrainyardTerrormorphs Auto Const Mandatory

ReferenceAlias Property Alias_TransformMorphSpawn Auto Const Mandatory

Scene Property UC08_500_HadrianKaiserJakob_ThirdSample Auto Const Mandatory

Scene Property UC08_525_Hadrian_QueenAggro Auto Const Mandatory

Scene Property UC08_530_Hadrian_BackToTheSample Auto Const Mandatory

ObjectReference Property UC08_DebugMarker11 Auto Const Mandatory

ObjectReference Property UC08_DebugMarker13 Auto Const Mandatory

Scene Property UC08_640_Kaiser_PopChamber Auto Const Mandatory

Scene Property UC08_367_JakobHadrianKaiser_ScanThree Auto Const Mandatory

ReferenceAlias Property Alias_NonHostileTT Auto Const Mandatory

Quest Property UC07_HadrianVVRevealQuest Auto Const Mandatory

Scene Property UC08_160_FrontGateGuard_Hustle Auto Const Mandatory

Scene Property UC08_165_FrontGateGuard_Direction Auto Const Mandatory

ObjectReference Property UC08_HadrianTeleportMarker_Stage171 Auto Const Mandatory

ObjectReference Property UC08_PercyTeleportMarker_Stage171 Auto Const Mandatory

ObjectReference Property UC08_KaiserTeleportMarker_Stage171 Auto Const Mandatory

ReferenceAlias Property Alias_CommanderHatoum Auto Const Mandatory

Scene Property UC08_180_KaiserHatoum_CodeHandoff Auto Const Mandatory

Scene Property UC08_320_KaiserHadrian_ApproachAcelesPlant Auto Const Mandatory

Scene Property UC08_330_KaiserHadrianPercival_FindTheManifest Auto Const Mandatory

ReferenceAlias Property Alias_AceleSampleContainer Auto Const Mandatory

GlobalVariable Property UC08_HadrianKaiserFollowingPlayer Auto Const Mandatory

Scene Property UC08_365_KaiserHadrian_SampleCollected Auto Const Mandatory

Message Property UC08_DEBUG_TransmitUnlockSound Auto Const Mandatory

ReferenceAlias Property Alias_TriggerStage495 Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory

ReferenceAlias Property Alias_SecurityOfficeDoor Auto Const Mandatory

Scene Property UC08_510_Hadrian_UtilityPanel Auto Const Mandatory

ReferenceAlias Property Alias_SpaceportGate Auto Const Mandatory

Scene Property UC08_535_Kaiser_ExitUnlocked Auto Const Mandatory

ReferenceAlias Property Alias_SpaceportExit Auto Const Mandatory

GlobalVariable Property UC07_HadrianKnowsVVLives Auto Const Mandatory

Scene Property UC08_366_Hadrian_GiveKaiserSample Auto Const Mandatory

Scene Property UC08_371_JakobHadrianKaiser_ScanTwo Auto Const Mandatory

Scene Property UC08_513_HadrianKaiser_UnlockDoor Auto Const Mandatory

RefCollectionAlias Property Alias_UndergroundHeatleeches Auto Const Mandatory

Quest Property UC08_SupportQuest Auto Const Mandatory

ObjectReference Property FB441BaseMapMarker Auto Const Mandatory

ObjectReference Property UC08_PostStage150_KaiserMarker Auto Const Mandatory

ObjectReference Property UC08_DebugMarker02a Auto Const Mandatory

ObjectReference Property UC08_KaiserTeleportMarker_Stage176 Auto Const Mandatory

RefCollectionAlias Property Alias_ContainerDoors Auto Const Mandatory

ReferenceAlias Property Alias_AcelesDoor Auto Const Mandatory

ReferenceAlias Property Alias_FrontAirlock Auto Const Mandatory

ReferenceAlias Property Alias_AirlockSwitch Auto Const Mandatory

Scene Property UC08_460_Hadrian_CheerOnDeadTT Auto Const Mandatory

Perk Property BackgroundSoldier Auto Const Mandatory

Perk Property BackgroundXenobiologist Auto Const Mandatory

Perk Property BackgroundProfessor Auto Const Mandatory

Perk Property BackgroundCyberRunner Auto Const Mandatory

Message Property UC08_DEBUG_BouncingQueen Auto Const Mandatory

ObjectReference Property UC08_DebugMarker15 Auto Const Mandatory

Quest Property UC09 Auto Const Mandatory

GlobalVariable Property UC09_KaiserSandboxing_PostUC08 Auto Const Mandatory

ReferenceAlias Property Alias_HadrianShip Auto Const Mandatory

GlobalVariable Property PlayerKnows_HeatLeeches Auto Const Mandatory

Perk Property UC08_HadrianDamageIncrease Auto Const Mandatory

Message Property UC08_HadrianDamageIncreased Auto Const Mandatory

Scene Property UC08_317_Hadrian_1stThrall Auto Const Mandatory

Scene Property UC08_318_Hadrian_MoreThralls Auto Const Mandatory

Scene Property UC08_331_KaiserHadrian_FindAcelesSamples Auto Const Mandatory

ReferenceAlias Property Alias_AceleSampleContainerBeta Auto Const Mandatory

ReferenceAlias Property Alias_AceleSampleContainerGamma Auto Const Mandatory

ReferenceAlias Property Alias_AcelesSampleGammaINV Auto Const Mandatory

Scene Property UC08_378_Hadrian_AllSamplesCollected Auto Const Mandatory

Scene Property UC08_382_Hadrian_HandOverSamples Auto Const Mandatory

GlobalVariable Property UC04_ConvincedYasin Auto Const Mandatory

ReferenceAlias Property Alias_Agent Auto Const Mandatory

Ammo Property Ammo777mm Auto Const Mandatory

Scene Property UC08_507_PowerRestoredScene Auto Const Mandatory

ReferenceAlias Property Alias_SecurityRebootButton Auto Const Mandatory

ReferenceAlias Property Alias_RecorderTrigger Auto Const Mandatory

GlobalVariable Property UC_Hadrian_ECCombatDialogueActive Auto Const Mandatory

ReferenceAlias Property Alias_VVAudioLog Auto Const Mandatory

Scene Property UC08_531_Hadrian_HandOverFinalSample Auto Const Mandatory

Scene Property UC08_530_Hadrian_CollectSample Auto Const Mandatory

Scene Property UC08_379_PercivalKaiser_IntoTheTunnels_Combat Auto Const Mandatory

Quest Property DialogueRedDevilsHQ Auto Const Mandatory

ReferenceAlias Property Alias_TriggerStage255 Auto Const Mandatory

Scene Property UC08_110_Hadrian_ThePlan_Main Auto Const Mandatory

RefCollectionAlias Property Alias_AcelesPlantThralls Auto Const Mandatory

ReferenceAlias Property Alias_UndergroundDoorInt Auto Const Mandatory

GlobalVariable Property UC08_TolimanGuard_UseRange Auto Const Mandatory

Quest Property UC08_QueenBattle Auto Const Mandatory

ReferenceAlias Property Alias_TriggerStage521 Auto Const Mandatory

WwiseEvent Property NPC_Terrormorph_Scream_WEF Auto Const Mandatory

ReferenceAlias Property Alias_TransformationLeech Auto Const Mandatory

Quest Property UC_NA_CL_PostTerrormorphAttackScene Auto Const Mandatory

LeveledItem Property LL_Weapon_Reward_UC08_X989 Auto Const Mandatory

ReferenceAlias Property Alias_HadriansShip_RHQ Auto Const Mandatory

ReferenceAlias Property Alias_RangeGuard Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC08_Door_Remote_Unlock Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock_Fail Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC08_Robot_Remote_Unlock Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock Auto Const Mandatory

Outfit Property Outfit_Spacesuit_UCMarine_NoHelmet Auto Const Mandatory

Outfit Property Outfit_Clothes_Colonist_CroppedVest_01 Auto Const Mandatory

ReferenceAlias Property Alias_RHQAceles Auto Const Mandatory

Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const Mandatory

Scene Property UC08_333_Hadrian_AggroTrainyardMorphs Auto Const Mandatory

WwiseEvent Property QST_UC08_Terrormorph_Queen_Death_Scream Auto Const Mandatory

RefCollectionAlias Property Alias_TransformationLazarusPlants Auto Const Mandatory

Faction Property UC08_FB441OwnerFaction Auto Const Mandatory

ReferenceAlias Property Alias_SecurityOfficeEnableMarker Auto Const Mandatory

WwiseEvent Property QST_UC08_UtilityControlFail Auto Const Mandatory

WwiseEvent Property QST_UC08_ResetButtonReboot Auto Const Mandatory

WwiseEvent Property QST_UC08_TowerPing Auto Const Mandatory

ReferenceAlias Property Alias_SpaceportMapMarker Auto Const Mandatory

ActorValue Property ActorShouldShowSpacesuitCosmetic_AV Auto Const Mandatory

ActorValue Property ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV Auto Const Mandatory

MusicType Property MUSGenesisStingerDread4TerrormorphTransform Auto Const Mandatory

RefCollectionAlias Property Alias_CacheDoors Auto Const Mandatory

Outfit Property UC08_Outfit_Percival_WinterGear Auto Const Mandatory

ReferenceAlias Property Alias_KaiserSocialImmune Auto Const Mandatory

ObjectReference Property PercivalFinalSceneMarker Auto Const Mandatory
