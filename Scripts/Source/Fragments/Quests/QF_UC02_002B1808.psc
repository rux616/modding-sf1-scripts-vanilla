;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC02_002B1808 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Start and finish UC01
UC01.Start()
UC01.SetStage(1000)

Game.GetPlayer().AddItem(TestVSWeapons)
Game.GetPlayer().MoveTo(DebugMarker01)

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

SetStage(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Start and finish UC01
UC01.Start()
UC01.SetStage(1000)

Game.GetPlayer().AddItem(TestVSWeapons)
SetObjectiveCompleted(100)
SetStage(200)
Game.GetPlayer().MoveTo(DebugMarker02)

SetStage(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Start and finish UC01
UC01.Start()
UC01.SetStage(1000)

Game.GetPlayer().AddItem(TestVSWeapons)
SetObjectiveCompleted(100)
SetStage(200)
SetStage(300)
UC02_300_HadrianAttractScene.Stop()
SetStage(310)
Game.GetPlayer().MoveTo(DebugMarker03)

SetStage(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Start and finish UC01
UC01.Start()
UC01.SetStage(1000)

Game.GetPlayer().AddItem(TestVSWeapons)
SetObjectiveCompleted(100)
SetStage(200)
SetStage(300)
UC02_300_HadrianAttractScene.Stop()
SetStage(310)
SetStage(410)
SetStage(420)
SetStage(500)
Game.GetPlayer().MoveTo(DebugMarker04)

SetStage(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
SetObjectiveCompleted(100)
SetStage(200)
Game.GetPlayer().MoveTo(DebugMarker05)

SetStage(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
SetStage(200)
SetStage(300)
SetStage(310)
SetStage(410)
SetStage(420)
SetStage(500)
SetStage(600)
SetStage(607)
Game.GetPlayer().MoveTo(DebugMarker04)
Utility.Wait(1.0)
UC02_600_HadrianRadioScene.Stop()
UC02_300_HadrianAttractScene.Stop()
SetObjectiveCompleted(100)

SetStage(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(TestVSWeapons)
UC01.SetStage(1000)
SetStage(200)
SetStage(300)
SetStage(310)
SetStage(410)
SetStage(420)
SetStage(500)
SetStage(700)
SetStage(740)
SetStage(750)
Game.GetPlayer().MoveTo(UC02_DebugMarker07)
Alias_Hadrian.GetRef().MoveTo(UC02_HadrianMarker_Scene750)
Utility.Wait(1.0)
UC02_600_HadrianRadioScene.Stop()
UC02_300_HadrianAttractScene.Stop()
SetObjectiveCompleted(100)
SetObjectiveCompleted(500)

SetStage(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()
PlayACT.AddPerk(BackgroundSoldier)
PlayACT.AddPerk(BackgroundCombatMedic)
PlayACT.AddPerk(BackgroundXenobiologist)
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
SetObjectiveDisplayed(100)
SetActive()

;Get the ship on the tarmac all set up
Alias_NATarmacShipEnableMarker.GetRef().Enable()

;Get Herath and the tech in place for their scene
Alias_ChiefHerath.GetRef().MoveTo(UC02_ChiefHerath_TeleportMarker)
Alias_ShipTech.GetRef().MoveTo(UC02_ChiefHerath_TeleportMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
UC02_090_HerathAttractScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_ShipTech.GetActorRef().EvaluatePackage()
Alias_ChiefHerath.GetActorRef().EvaluatePackage()
UC02_090_HerathAttractScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0129_Item_00
Function Fragment_Stage_0129_Item_00()
;BEGIN CODE
PUC02_DEBUG_CollectShipUpgrades.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Hadrian.GetRef().Enable()
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
ObjectReference PlayShip = Alias_PlayerShip.GetRef()
PlayShip.AddItem(Alias_Antennas.GetRef())
PlayShip.AddItem(LL_UC01_VanguardNewRecruitKit)
Alias_HadrianShipEnableMarker.GetRef().Enable()
Alias_TauCetiWeatherTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;WeatherThunderstormC01H050D015.SetActive(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
NPC_Terrormorph_Scream_WEF.Play(Alias_ObjMarker200.GetRef())

Utility.Wait(3.0)
if !GetStageDone(302)
  SetObjectiveCompleted(200)
  SetObjectiveDisplayed(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
if !GetStageDone(301)
  SetObjectiveCompleted(200)
  SetObjectiveCompleted(250)
  SetObjectiveDisplayed(300)
  UC02_300_HadrianAttractScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
if !GetStageDone(300)
  SetObjectiveCompleted(200)
  SetObjectiveCompleted(250)
  SetObjectiveDisplayed(300)
  UC02_301_HadrianAttractScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0302_Item_00
Function Fragment_Stage_0302_Item_00()
;BEGIN CODE
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0407_Item_00
Function Fragment_Stage_0407_Item_00()
;BEGIN CODE
UC_PlayerKnowsHadriansPast.Setvalue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0412_Item_00
Function Fragment_Stage_0412_Item_00()
;BEGIN CODE
SetStage(410)
SetStage(703)

if !GetStageDone(705)
  SetObjectiveCompleted(300)
  SetObjectiveDisplayed(699)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
UC02_HadrianKnowsPlayerIsVanguard.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(420)
SetStage(422)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
if GetStageDone(500)
  SetStage(599)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0599_Item_00
Function Fragment_Stage_0599_Item_00()
;BEGIN CODE
if !GetStageDone(700)
  SetObjectiveDisplayedAtTop(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE UC02_QuestScript
Quest __temp = self as Quest
UC02_QuestScript kmyQuest = __temp as UC02_QuestScript
;END AUTOCAST
;BEGIN CODE
if GetStageDone(500) && !GetStageDone(700)
  SetObjectiveCompleted(420)
  SetObjectiveDisplayed(430)
  UC02_600_HadrianRadioScene.Start()
endif

Alias_Terrormorph.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0601_Item_00
Function Fragment_Stage_0601_Item_00()
;BEGIN AUTOCAST TYPE UC02_QuestScript
Quest __temp = self as Quest
UC02_QuestScript kmyQuest = __temp as UC02_QuestScript
;END AUTOCAST
;BEGIN CODE
;Update the number of already activated powerboxes
kmyquest.SetUpPowerboxObjective()
SetObjectiveCompleted(605)
SetObjectiveCompleted(607)

if !GetStageDone(700)
  SetObjectiveDisplayed(601)
endif

if UC02_ScannerQuest.IsRunning()
  (UC02_ScannerQuest as UC02_ScannerQuestScript).DisplayDistanceMessage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0605_Item_00
Function Fragment_Stage_0605_Item_00()
;BEGIN CODE
SetObjectiveCompleted(420)
SetObjectiveCompleted(430)
SetObjectiveDisplayed(605)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0606_Item_00
Function Fragment_Stage_0606_Item_00()
;BEGIN CODE
;Make the Terrormorph a temp friend of the player so it doesn't immediately attack them.
if !GetStageDone(630) && !GetStageDone(700)
  Alias_TerrormorphTempFriendAlias.ForceRefTo(Alias_Terrormorph.GetRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0607_Item_00
Function Fragment_Stage_0607_Item_00()
;BEGIN AUTOCAST TYPE UC02_QuestScript
Quest __temp = self as Quest
UC02_QuestScript kmyQuest = __temp as UC02_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SealSecurityBldgDoors()

Actor TerREF = Alias_Terrormorph.GetActorRef()
TerREF.SetGhost(true)
TerREF.Enable()
TerREF.EvaluatePackage()

UC02_600_HadrianRadioScene.Stop()
UC02_607_TanksPrimed.Start()

SetObjectiveCompleted(605)
SetObjectiveDisplayed(607)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0608_Item_00
Function Fragment_Stage_0608_Item_00()
;BEGIN CODE
Alias_Terrormorph.GetActorRef().EvaluatePackage()

;Turn the lights off
Alias_SecurityOfficeEnableMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0609_Item_00
Function Fragment_Stage_0609_Item_00()
;BEGIN AUTOCAST TYPE UC02_QuestScript
Quest __temp = self as Quest
UC02_QuestScript kmyQuest = __temp as UC02_QuestScript
;END AUTOCAST
;BEGIN CODE
Actor TerREF = Alias_Terrormorph.GetActorRef()
TerREF.SetGhost(false)
TerREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
Alias_SignalTerminal.GetRef().Unlock()
SetObjectiveDisplayed(610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0611_Item_00
Function Fragment_Stage_0611_Item_00()
;BEGIN CODE
Alias_RevealCritter.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0612_Item_00
Function Fragment_Stage_0612_Item_00()
;BEGIN AUTOCAST TYPE UC02_QuestScript
Quest __temp = self as Quest
UC02_QuestScript kmyQuest = __temp as UC02_QuestScript
;END AUTOCAST
;BEGIN CODE
;Unlock all the doors
kmyquest.SealSecurityBldgDoors(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0615_Item_00
Function Fragment_Stage_0615_Item_00()
;BEGIN AUTOCAST TYPE UC02_QuestScript
Quest __temp = self as Quest
UC02_QuestScript kmyQuest = __temp as UC02_QuestScript
;END AUTOCAST
;BEGIN CODE
if !Alias_FuelTankObj.GetRef().IsDisabled()
  SetObjectiveDisplayed(615)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
if !GetStageDone(700)
  UC02_607_TanksPrimed.Start()
endif

SetObjectiveCompleted(610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN AUTOCAST TYPE UC02_QuestScript
Quest __temp = self as Quest
UC02_QuestScript kmyQuest = __temp as UC02_QuestScript
;END AUTOCAST
;BEGIN CODE
;Get the Terrormorph to stop being a friend of the player and local prey
Actor TerREF = Alias_Terrormorph.GetActorRef()
TerREF.SetGhost(false)
TerREF.EvaluatePackage()
Alias_TerrormorphTempFriendAlias.Clear()
Alias_PlayerTerrormorphFriendAlias.Clear()
Alias_TerrormorphPreyFriendAlias.Clear()

SetStage(599)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(601)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0655_Item_00
Function Fragment_Stage_0655_Item_00()
;BEGIN CODE
SetObjectiveCompleted(615)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0699_Item_00
Function Fragment_Stage_0699_Item_00()
;BEGIN CODE
UC02_700b_TerrormorphKilled_CompanionResponse.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
UC02_TrackerQuest.SetStage(1000)
UC02_607_TanksPrimed.Stop()
SetObjectiveCompleted(500)

if GetStageDone(500)
  SetObjectiveDisplayed(699)
endif

if !IsObjectiveCompleted(420)
  SetObjectiveDisplayed(420, false, false)
endif

if !IsObjectiveCompleted(601)
  SetObjectiveDisplayed(601, false, false)
endif

if IsObjectiveDisplayed(602)
  SetObjectiveDisplayed(602, false, false)
endif

if !IsObjectiveCompleted(605)
  SetObjectiveDisplayed(605, false, false)
endif

if !IsObjectiveCompleted(610)
  SetObjectiveDisplayed(610, false, false)
endif

if !IsObjectiveCompleted(615)
  SetObjectiveDisplayed(615, false, false)
endif

;This scene also manages Hadrian's call out after the Morph's dead
if !GetStageDone(699)
  UC02_700b_TerrormorphKilled_CompanionResponse.Start()
endif

;Get Hadrian in the right spot
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0705_Item_00
Function Fragment_Stage_0705_Item_00()
;BEGIN CODE
if GetStageDone(500) || GetStageDone(412)
  SetObjectiveCompleted(699)
  SetObjectiveDisplayed(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_TerrormorphCellSample.GetRef(), akOtherContainer = Alias_Hadrian.GetRef())
SetStage(710)

SetObjectiveCompleted(700)
SetObjectiveCompleted(300)
SetObjectiveDisplayed(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0741_Item_00
Function Fragment_Stage_0741_Item_00()
;BEGIN CODE
if GetStageDone(740) && !GetStageDone(750) && !UC02_700d_HeadingToScope.IsPlaying() 
  UC02_700d_HeadingToScope.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
SetObjectiveCompleted(710)
SetObjectiveDisplayed(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0752_Item_00
Function Fragment_Stage_0752_Item_00()
;BEGIN CODE
UC_PlayerKnows_Londinion.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0770_Item_00
Function Fragment_Stage_0770_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_HadrianGenetag.GetRef())

;Turn off the weather trigger
Alias_TauCetiWeatherTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
ObjectReference PlayREF = Game.GetPlayer()
PlayREF.AddItem(Alias_TerrormorphCellSample.GetRef())
PlayREF.AddItem(Credits, UC02_RewardCredits.GetValueInt())

SetObjectiveCompleted(750)
SetObjectiveDisplayed(800)

;Turn off Herath's ship back on the NA tarmac
Alias_NATarmacShipEnableMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0801_Item_00
Function Fragment_Stage_0801_Item_00()
;BEGIN CODE
Alias_Hadrian.GetRef().Disable()
Alias_HadrianShipEnableMarker.GetRef().Enable()

;Turn the lights back on in the security office
Alias_SecurityOfficeEnableMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
CF01.SetStage(205)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
UC03.Start()

;Give the player their uniform
Actor PlayACT = Game.GetPlayer()
PlayACT.AddItem(LL_Spacesuit_UCVanguard_LightArmored_FullSet_AnyQuality)

;Remove the antennas from the player's ship
ObjectReference PlayShip = Alias_PlayerShip.GetRef()
PlayShip.RemoveItem(Alias_Antennas.GetRef())

;Plug the Terrormorph cell sample from this quest into the correct alias on UC03
UC03QuestScript NextQuest = UC03 as UC03QuestScript
NextQuest.TerrormorphCellSample.ForceRefTo(Alias_TerrormorphCellSample.GetRef())
NextQuest.HadrianGenetag.ForceRefTo(Alias_HadrianGenetag.GetRef())

;Unlock the UC Vanguard ship components
UC02_UCShipComponentsUnlocked.SetValue(1)

;Achievement Unlocked
Game.AddAchievement(11)

;Turn off the weather trigger on Tau ceti
Alias_TauCetiWeatherTrigger.GetRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property PUC02_DEBUG_CollectShipUpgrades Auto Const Mandatory

Scene Property UC02_090_HerathAttractScene Auto Const Mandatory

Scene Property UC02_300_HadrianAttractScene Auto Const Mandatory

ReferenceAlias Property Alias_Hadrian Auto Const Mandatory

ReferenceAlias Property Alias_Terrormorph Auto Const Mandatory

Quest Property UC02_TrackerQuest Auto Const Mandatory

ObjectReference Property DebugMarker01 Auto Const

ObjectReference Property DebugMarker02 Auto Const

Scene Property UC02_700a_HeadingToTerrormorph Auto Const Mandatory

Explosion Property CarExplosion Auto Const

ObjectReference Property DebugMarker03 Auto Const

ReferenceAlias Property Alias_ExplosionSource Auto Const Mandatory

Scene Property UC02_700_TerrormorphDead Auto Const Mandatory

ObjectReference Property DebugMarker04 Auto Const

Scene Property UC02_600_HadrianRadioScene Auto Const Mandatory

LeveledItem Property TestVSWeapons Auto Const Mandatory

Message Property UC02_DEBUG_HadrianCantMove Auto Const

Quest Property UC03 Auto Const Mandatory

ReferenceAlias Property Alias_Antennas Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Scene Property UC02_610_PlayerTunedTrackingSystem Auto Const Mandatory

ObjectReference Property DebugMarker05 Auto Const

ReferenceAlias Property Alias_SignalTerminal Auto Const Mandatory

ReferenceAlias Property Alias_FuelTankObj Auto Const Mandatory

ReferenceAlias Property Alias_LurePathingTarget Auto Const Mandatory

RefCollectionAlias Property Alias_PowerBoxes Auto Const Mandatory

GlobalVariable Property UC02_PowerBoxesTotal Auto Const Mandatory

GlobalVariable Property UC02_PowerBoxesActivated Auto Const Mandatory

Scene Property UC02_301_HadrianAttractScene Auto Const Mandatory

GlobalVariable Property UC_PlayerKnowsHadriansPast Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

Scene Property UC02_700b_TerrormorphKilled_CompanionResponse Auto Const Mandatory

ReferenceAlias Property Alias_ShipTech Auto Const Mandatory

GlobalVariable Property UC02_HadrianKnowsPlayerIsVanguard Auto Const Mandatory

Scene Property UC02_607_TanksPrimed Auto Const Mandatory

ObjectReference Property TerrTeleMarker Auto Const

Message Property UC02_DEBUG_CombatPolish Auto Const Mandatory

ReferenceAlias Property Alias_HadrianGenetag Auto Const Mandatory

ReferenceAlias Property Alias_TerrormorphCellSample Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

Message Property UC02_DEBUG_TrackingTerminalBusted Auto Const Mandatory

Quest Property UC02_ScannerQuest Auto Const Mandatory

GlobalVariable Property UC02_RewardCredits Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ObjectReference Property UC02_DebugMarker07 Auto Const Mandatory

ObjectReference Property UC02_HadrianMarker_Scene750 Auto Const Mandatory

Quest Property UC01 Auto Const Mandatory

LeveledItem Property LL_UC01_VanguardNewRecruitKit Auto Const Mandatory

Quest Property CF01 Auto Const Mandatory

GlobalVariable Property DialogueCydonia_RedEyes Auto Const Mandatory

GlobalVariable Property UC02_UCShipComponentsUnlocked Auto Const Mandatory

ReferenceAlias Property Alias_TerrormorphTempFriendAlias Auto Const Mandatory

Perk Property BackgroundSoldier Auto Const Mandatory

Perk Property BackgroundXenobiologist Auto Const Mandatory

Perk Property BackgroundCombatMedic Auto Const Mandatory

Armor Property Spacesuit_UCVanguard_Helmet_Armored Auto Const Mandatory

Armor Property Spacesuit_UCVanguard_LightArmored Auto Const Mandatory

GlobalVariable Property UC_PlayerKnows_Londinion Auto Const Mandatory

WwiseEvent Property NPC_Terrormorph_Scream_WEF Auto Const Mandatory

Weather Property WeatherThunderstormC01H050D015 Auto Const Mandatory

ReferenceAlias Property Alias_PlayerTerrormorphFriendAlias Auto Const Mandatory

ReferenceAlias Property Alias_HadrianShipEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_NATarmacShipEnableMarker Auto Const Mandatory

ObjectReference Property UC03_TerrormorphSpawn_Spaceport Auto Const Mandatory

ReferenceAlias Property Alias_ChiefHerath Auto Const Mandatory

ObjectReference Property UC02_ChiefHerath_TeleportMarker Auto Const Mandatory

ReferenceAlias Property Alias_ObjMarker200 Auto Const Mandatory

ReferenceAlias Property Alias_TerrormorphPreyFriendAlias Auto Const Mandatory

ReferenceAlias Property Alias_RevealCritter Auto Const Mandatory

ReferenceAlias Property Alias_TauCetiWeatherTrigger Auto Const Mandatory

RefCollectionAlias Property Alias_SecurityBldgDoors Auto Const Mandatory

LeveledItem Property LL_Spacesuit_UCVanguard_LightArmored_FullSet_AnyQuality Auto Const Mandatory

ReferenceAlias Property Alias_SecurityOfficeEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_SecurityOfficeDoorCollision Auto Const Mandatory

Scene Property UC02_700d_HeadingToScope Auto Const Mandatory
