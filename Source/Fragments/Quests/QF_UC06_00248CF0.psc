;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC06_00248CF0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().Moveto(UC06_DebugMarker01)

;Give the player a ship
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(105)
UC06_90_VaeVictis_Attract.Stop()
SetStage(99)
SetStage(200)
Game.GetPlayer().Moveto(UC06_DebugMarker02)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetObjectiveCompleted(105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(99)
SetStage(105)
UC06_90_VaeVictis_Attract.Stop()
;Enable Orlase
Alias_OrlaseShip.GetRef().Enable()

SetStage(200)
SetStage(300)
Frontier_ModularREF.setlinkedref(none, SpaceshipEnabledLandingLink)
Frontier_ModularREF.moveto(UC06_SpaceBattleTeleportMarker)
Frontier_ModularREF.Enable()
Game.GetPlayer().Moveto(Frontier_ModularREF)

; Force a short wait so the fade out request isn't made while the loading menu is up
; (which would cause it to be bashed when the loading menu goes away and tells the
; fade menu to fade in)
debug.trace(self + "Wait 0.1 seconds")
Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)

TestMQ101HelperQuest.SetStage(10)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetObjectiveCompleted(105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(99)
SetStage(105)
UC06_90_VaeVictis_Attract.Stop()
SetStage(550)
Game.GetPlayer().AddItem(Alias_OrlaseID.GetRef())
Game.GetPlayer().Moveto(UC06_DebugMarker01)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetObjectiveCompleted(105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetStage(99)
SetStage(105)
UC06_90_VaeVictis_Attract.Stop()
SetStage(120)
SetStage(133)
SetStage(200)
Game.GetPlayer().Moveto(UC05_DebugMarker01)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetObjectiveCompleted(105)

;Give the player a ship
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Alias_OrlaseShip.GetRef().DamageValue(Health, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Alias_OrlaseShip.GetRef().MoveTo(Alias_PlayerShip.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
UC06_95_SS7Guard_PlayerApproachesDoor.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
Alias_VVChamberDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

;Unlock the player's access to Subsection Seven
(Alias_FloorManager.GetRef() as LoadElevatorFloorScript).SetAccessible(true)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
UC06_90_VaeVictis_Attract.Start()
SetObjectiveCompleted(100)
SetObjectiveDisplayed(105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(105)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
SetObjectiveCompleted(105)
SetObjectiveDisplayed(110)
UC06_100_VaeVictisIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_NamelessAlias.Clear()

SetObjectiveCompleted(105)
SetObjectiveCompleted(110)
SetObjectiveDisplayedAtTop(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0131_Item_00
Function Fragment_Stage_0131_Item_00()
;BEGIN CODE
;Set the var that the player knows this info know
SetStage(135)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0133_Item_00
Function Fragment_Stage_0133_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
UC_PlayerKnows_VVSurvivedExecution.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0136_Item_00
Function Fragment_Stage_0136_Item_00()
;BEGIN CODE
UC_PlayerKnows_HowVVFoundResearchTeam.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
if !GetStageDone(300)
  UC06_140_PlayerExitsVVChamber.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(105)
SetObjectiveCompleted(120)
SetObjectiveDisplayed(200)

if !IsObjectiveDisplayed(150)
  SetObjectiveDisplayed(150)
endif

;Get Chief Yasin re-enabled
Alias_ChiefYasin.GetRef().Enable()

;Move MacIntyre
Alias_MacIntyre.GetRef().MoveTo(Alias_MacIntyreSlateLookMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE uc06_questscript
Quest __temp = self as Quest
uc06_questscript kmyQuest = __temp as uc06_questscript
;END AUTOCAST
;BEGIN CODE
;Enable Orlase's ship and set unconscious until the player is 5000m or closer
SpaceshipReference OrlaseShipRef = Alias_OrlaseShip.GetShipRef()
OrlaseShipRef.Enable()
OrlaseShipRef.SetUnconscious(true)

;Turn on turrets and mines
Alias_EthereaMines.EnableAll()
kmyquest.PrepTurrets()
Alias_EthereaTurrets.EnableAll()

kmyquest.RegisterForShipItemCollection()

SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

;Trigger the EM weapon/ship tutorial
MQ_TutorialQuest.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SpaceshipReference OrlaseShipRef = Alias_OrlaseShip.GetShipRef()

OrlaseShipRef.SetUnconscious(false)
OrlaseShipRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
if !GetStageDone(500)
  if !IsObjectiveCompleted(150) && IsObjectiveDisplayed(150)
    SetObjectiveDisplayed(150, false, false)
  endif

  SetObjectiveCompleted(300)
  SetObjectiveDisplayedAtTop(400)
  SetObjectiveDisplayed(401)

  UC06_400_OrlaseGreetingScene.Start()

  ;Prevent Orlase from repairing his engines
  Alias_OrlaseShip.GetShipRef().EnablePartRepair(SpaceshipEngineHealth, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0403_Item_00
Function Fragment_Stage_0403_Item_00()
;BEGIN AUTOCAST TYPE uc06_questscript
Quest __temp = self as Quest
uc06_questscript kmyQuest = __temp as uc06_questscript
;END AUTOCAST
;BEGIN CODE
QST_Orlase_Ship_HostileTransmission_WEF.Play(Game.GetPlayer())
kmyquest.DeployTurrets()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
if !GetStageDone(500)
  SetObjectiveCompleted(401)
  SetObjectiveDisplayed(420)
  ;SetObjectiveDisplayed(400, false, false)
  ;SetObjectiveDisplayed(400, true, true)
endif

if !GetStageDone(430) && !GetStageDone(440)
  UC06_420_OrlaseEngineDisabled.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
if !GetStageDone(500)
  SetObjectiveCompleted(420)
  SetObjectiveDisplayed(430)
  ;SetObjectiveDisplayed(400, false, false)
  ;SetObjectiveDisplayed(400, true, true)

  ;Plant the ID on Orlase
  Alias_Orlase.GetRef().AddItem(Alias_OrlaseID.GetRef())

  ;Add the items to Orlase's Captain's Locker
  Alias_OrlaseCaptainLocker.GetRef().AddItem(LL_BE_ShipCaptainsLockerLoot_Small)
endif



UC06_430_OrlaseBoardingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN AUTOCAST TYPE uc06_questscript
Quest __temp = self as Quest
uc06_questscript kmyQuest = __temp as uc06_questscript
;END AUTOCAST
;BEGIN CODE
if !IsObjectiveCompleted(150) && IsObjectiveDisplayed(150)
  SetObjectiveDisplayed(150, false, false)
endif

SetObjectiveDisplayed(430, false, false)
SetObjectiveDisplayed(400, false, false)
SetObjectiveDisplayed(500)

;Make the ship no longer hostile to the player
SpaceshipReference OrlaseShip = Alias_OrlaseShip.GetShipRef()

if OrlaseShip.GetValue(SpaceshipCrew) > 0
  OrlaseShip.DamageValue(SpaceshipCrew, OrlaseShip.GetValue(SpaceshipCrew))
endif

;Disable all the turrets as well
kmyquest.DisableTurrets()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0441_Item_00
Function Fragment_Stage_0441_Item_00()
;BEGIN CODE
Alias_OrlaseCabinDoor.GetRef().Unlock()
Alias_OrlaseCabinDoor.GetRef().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0445_Item_00
Function Fragment_Stage_0445_Item_00()
;BEGIN CODE
if GetStageDone(440)
  SetObjectiveDisplayed(445)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
if !IsObjectiveCompleted(445) && IsObjectiveDisplayed(445)
  SetObjectiveDisplayed(445, false, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0451_Item_00
Function Fragment_Stage_0451_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(445)
  SetObjectiveCompleted(445)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE uc06_questscript
Quest __temp = self as Quest
uc06_questscript kmyQuest = __temp as uc06_questscript
;END AUTOCAST
;BEGIN CODE
;Close out the player's optional obj to speak to MacIntyre if
;if they haven't already done so
if !IsObjectiveCompleted(150) && IsObjectiveDisplayed(150)
  SetObjectiveDisplayed(150, false, false)
endif

if !IsObjectiveCompleted(401) && IsObjectiveDisplayed(401)
  SetObjectiveDisplayed(401, false, false)
endif

if !IsObjectiveCompleted(420) && IsObjectiveDisplayed(420)
  SetObjectiveDisplayed(420, false, false)
endif

if !IsObjectiveCompleted(430) && IsObjectiveDisplayed(430)
  SetObjectiveDisplayed(430, false, false)
endif

if !IsObjectiveCompleted(445) && IsObjectiveDisplayed(445)
  SetObjectiveDisplayed(445, false, false)
endif

;Disable all the turrets as well
kmyquest.DisableTurrets()

;Only update if the player hasn't already acquired Orlase's ID
if !GetStageDone(550)
  SetObjectiveCompleted(400)
  SetObjectiveDisplayed(500)

  ;Make sure Orlase isn't already dead
  if !GetStageDone(430) && !GetStageDone(440)
    UC06_500_OrlaseDeath.Start()
  endif

  Alias_OrlaseShip.GetRef().AddItem(Alias_OrlaseID.GetRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_OrlaseID.GetRef())

SetObjectiveCompleted(500)
SetObjectiveDisplayed(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0553_Item_00
Function Fragment_Stage_0553_Item_00()
;BEGIN CODE
UC_PlayerKnows_KaiserIsARobot.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
UC06_560_VV_ApproachTransfer.Start()

;Turn on the transfer sytem trigger
Alias_TransferSystemTrigger.GetRef().Enable()

SetObjectiveCompleted(550)
SetObjectiveDisplayed(560)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
;Turn off the transfer sytem trigger and take the ID from the player
Alias_TransferSystemTrigger.GetRef().Disable()

Game.GetPlayer().RemoveItem(Alias_OrlaseID.GetRef())

UC06_570_System_TransferAccepted.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0580_Item_00
Function Fragment_Stage_0580_Item_00()
;BEGIN CODE
Alias_VaeVictis.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(560)
SetObjectiveDisplayed(580)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Start up the "reveal" quest to allow the player to tell Hadrian about what they've learned
UC07_HadrianVVRevealQuest.Start()
UC07.Start()

;Achievement for completing quest
Game.AddAchievement(12)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NamelessAlias Auto Const Mandatory

Scene Property UC06_400_OrlaseGreetingScene Auto Const Mandatory

Scene Property UC06_500_OrlaseDeath Auto Const Mandatory

ReferenceAlias Property Alias_OrlaseShip Auto Const Mandatory

ReferenceAlias Property Alias_OrlaseID Auto Const Mandatory

ObjectReference Property UC06_SpaceBattleTeleportMarker Auto Const Mandatory

ObjectReference Property UC06_DebugMarker01 Auto Const Mandatory

ObjectReference Property UC06_DebugMarker02 Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

Quest Property TestMQ101HelperQuest Auto Const Mandatory

Scene Property UC06_90_VaeVictis_Attract Auto Const Mandatory

Scene Property UC06_420_OrlaseEngineDisabled Auto Const Mandatory

Message Property UC06_Debug_DebrisField Auto Const Mandatory

ObjectReference Property UC05_DebugMarker01 Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Message Property UC06_Debug_TroubleTravelingToDen Auto Const Mandatory

Message Property UC06_Debug_TravelingToOrlase Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

ReferenceAlias Property Alias_Orlase Auto Const Mandatory

Scene Property UC06_430_OrlaseBoardingScene Auto Const Mandatory

Key Property UC06_OrlaseCabinKey Auto Const Mandatory

Faction Property UC06_OrlaseFaction Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

GlobalVariable Property UC_PlayerKnows_KaiserIsARobot Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

GlobalVariable Property UC_PlayerKnows_VVSurvivedExecution Auto Const Mandatory

Quest Property UC07_HadrianVVRevealQuest Auto Const Mandatory

GlobalVariable Property UC_PlayerKnows_HowVVFoundResearchTeam Auto Const Mandatory

Scene Property UC06_100_VaeVictisIntro Auto Const Mandatory

Scene Property UC06_140_PlayerExitsVVChamber Auto Const Mandatory

Quest Property UC07 Auto Const Mandatory

ReferenceAlias Property Alias_OrlaseCabinDoor Auto Const Mandatory

ActorValue Property SpaceshipEngineHealth Auto Const Mandatory
ReferenceAlias Property Alias_FloorManager Auto Const Mandatory

Scene Property UC06_560_VV_ApproachTransfer Auto Const Mandatory

ReferenceAlias Property Alias_TransferSystemTrigger Auto Const Mandatory

ReferenceAlias Property Alias_VaeVictis Auto Const Mandatory

RefCollectionAlias Property Alias_EthereaMines Auto Const Mandatory

RefCollectionAlias Property Alias_EthereaTurrets Auto Const Mandatory

Scene Property UC06_95_SS7Guard_PlayerApproachesDoor Auto Const Mandatory

ReferenceAlias Property Alias_VVChamberDoor Auto Const Mandatory

Scene Property UC06_570_System_TransferAccepted Auto Const Mandatory

ReferenceAlias Property Alias_ChiefYasin Auto Const Mandatory

ReferenceAlias Property Alias_MacIntyre Auto Const Mandatory

ReferenceAlias Property Alias_MacIntyreSlateLookMarker Auto Const Mandatory

Quest Property MQ_TutorialQuest Auto Const Mandatory

WwiseEvent Property QST_Orlase_Ship_HostileTransmission_WEF Auto Const Mandatory

ReferenceAlias Property Alias_OrlaseCaptainLocker Auto Const Mandatory

LeveledItem Property LL_BE_ShipCaptainsLockerLoot_Small Auto Const Mandatory
