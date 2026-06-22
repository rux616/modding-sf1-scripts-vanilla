;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ101_00003448 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
;prevent player from saving
Game.SetInCharGen(True, False, False)
MQ101SaveOff.SetValueInt(1) ;set value to track that saving is off for MQ101QuestScript timer

Actor PlayerREF = Game.GetPlayer()
SpaceshipReference FrontierShipREF = Alias_BarrettShip.GetShipRef()

;set day so player appears on the lit side of the planet
GameDay.SetValue(8.0)

;make sure the player can't move
debug.trace(self + "New Game Start, disable player controls")

kmyquest.VSEnableLayer = InputEnableLayer.Create()
kmyquest.VSEnableLayer.DisablePlayerControls(abCamSwitch=True)

; remove all the player's stuff
PlayerREF.RemoveAllItems()

; give the player the right starting gear
PlayerREF.SetOutfit(Outfit_Starborn)
PlayerREF.AddPerk(StarbornSkillCheck)

; move the player so that New Game button puts him in the right place
debug.trace(self + "New Game Start, move player to marker")
MQPlayerStarbornShipREF.Reset()
MQPlayerStarbornShipREF.moveto(NewGameShipMarkerREF)
MQPlayerStarbornShipREF.Enable()
PlayerREF.moveto(MQPlayerStarbornShipREF)

;also give you the Frontier
Game.AddPlayerOwnedShip(FrontierShipREF)

;make sure starborn ship is registered
MQPlayerStarbornShipREF.SetValue(SpaceshipRegistration, 1)

;move Heller, Barrett, Lin
Alias_Barrett.GetActorRef().Moveto(MQ104B_LinSandbox_CenterMarker)
Alias_Lin.GetActorRef().moveto(MQ104B_LinSandbox_CenterMarker)
Alias_Heller.GetActorRef().moveto(MQ104B_LinSandbox_CenterMarker)

; Force a short wait so the fade out request isn't made while the loading menu is up
; (which would cause it to be bashed when the loading menu goes away and tells the
; fade menu to fade in)
debug.trace(self + "Wait 0.1 seconds")
Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)

;player can now move
kmyquest.VSEnableLayer.EnablePlayerControls()
kmyquest.VSEnableLayer.Delete()
kmyquest.VSEnableLayer = None

kmyQuest.StartInitTimer(setVascoAsCrew = false, moveVasco=false, setHomeShip=true)

;reset other faction perks
PlayerREF.RemovePerk(FactionUnitedColoniesVanguardPerk)
PlayerREF.RemovePerk(FactionCrimsonFleetPerk)
PlayerREF.RemovePerk(FactionRyujinIndustriesPerk)
PlayerREF.RemovePerk(FactionUnitedColoniesPerk)
PlayerREF.RemovePerk(FactionUnitedColoniesSysDefPerk)
PlayerREF.RemovePerk(FactionUnitedColoniesVanguardPerk)
PlayerREF.RemovePerk(FactionFreestarCollectivePerk)

SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
ObjectReference FrontierShipREF = Alias_BarrettShip.GetRef()

;set day so player appears on the lit side of the planet
GameDay.SetValue(8.0)

;make sure the player can't move
debug.trace(self + "New Game Start, disable player controls")

kmyquest.VSEnableLayer = InputEnableLayer.Create()
kmyquest.VSEnableLayer.DisablePlayerControls(abCamSwitch=True)

; remove all the player's stuff
PlayerREF.RemoveAllItems()

; give the player the right starting gear
PlayerREF.SetOutfit(Spacesuit_Miner_Outfit)

;add VS Weapons
PlayerREF.AddITem(TestVSWeapons)

; move the player so that New Game button puts him in the right place
debug.trace(self + "New Game Start, move player to marker")
FrontierShipREF.moveto(NewGameShipMarkerREF)
FrontierShipREF.Enable()
PlayerREF.moveto(FrontierShipREF)

; Force a short wait so the fade out request isn't made while the loading menu is up
; (which would cause it to be bashed when the loading menu goes away and tells the
; fade menu to fade in)
debug.trace(self + "Wait 0.1 seconds")
Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)

;snap the player into furniture, this is done in a helper quest that grabs the ship and pilot seat
TestMQ101HelperQuest.SetStage(10)

;player can now move
kmyquest.VSEnableLayer.EnablePlayerControls()
kmyquest.VSEnableLayer = None

;set Barrett's ship not have enough fuel to reach Jemison
;FrontierShipREF.DamageValue(SpaceshipGravJumpFuel, 50)

Actor VascoREF = Alias_Vasco.GetActorRef()

VascoREF.AddKeyword(SQ_ActorRoles_SuppressMessages)
VascoREF.Enable()
kmyQuest.StartInitTimer(setVascoAsCrew=true, moveVasco=true, setHomeShip=true)
;Utility.Wait(0.1)
;(SQ_PlayerShip as SQ_PlayerShipScript).LoadVascoInterior()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Actor LinREF = Alias_Lin.GetActorRef()
Actor HellerREF = Alias_Heller.GetActorRef()

;make sure the player can't move
debug.trace(self + "New Game Start, disable player controls")

kmyquest.VSEnableLayer = InputEnableLayer.Create()
kmyquest.VSEnableLayer.DisablePlayerControls(abCamSwitch=True, abSneaking=True, abRunning=True)
kmyquest.VSEnableLayer.EnableFastTravel(false)
kmyquest.VSEnableLayer.EnableHandscanner(false)

;prevent player from saving
Game.SetInCharGen(True, False, False)

; move the player so that New Game button puts him in the right place
debug.trace(self + "New Game Start, move player to marker")
PlayerREF.moveto(CharGenStartMarker)

;play opening music
;MUSGenesisSpecialCardTitleOpening.Add() ;play opening music

; Force a short wait so the fade out request isn't made while the loading menu is up
; (which would cause it to be bashed when the loading menu goes away and tells the
; fade menu to fade in)
debug.trace(self + "Wait 0.1 seconds")
Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

;hide HUD and crosshairs
Game.SetCharGenHUDMode(2)

PlayerREF.WaitFor3dLoad()
; remove all the player's stuff
ENV_AllowPlayerSuffocation.SetValue(0)
PlayerREF.RemoveAllItems()

; give the player the right starting gear
PlayerREF.EquipItem(Spacesuit_Miner, absilent=true)
PlayerREF.EquipItem(spacesuit_miner_helmet, absilent=true)
PlayerREF.EquipItem(spacesuit_miner_backpack_noboostpack, absilent=true)
PlayerREF.EquipItem(Clothes_GenWare_01, absilent=true)
ENV_AllowPlayerSuffocation.SetValue(1)

;make sure Heller and Lin don't have weapons during elevator ride
LinREF.RemoveItem(Crew_Elite_Sidestar)
HellerREF.RemoveItem(Crew_Elite_Cutter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_03
Function Fragment_Stage_0000_Item_03()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Actor LinREF = Alias_Lin.GetActorRef()
Actor HellerREF = Alias_Heller.GetActorRef()

kmyquest.VSEnableLayer = InputEnableLayer.Create()
kmyquest.VSEnableLayer.DisablePlayerControls(abCamSwitch=true)
kmyquest.VSEnableLayer.EnableFastTravel(false)

; remove all the player's stuff
PlayerREF.RemoveAllItems()

;move everyone
PlayerREF.moveto(MQ101_Scene05_MarkerPlayer)
HellerREF.moveto(MQ101_Scene05_MarkerHeller)
LinREF.moveto(MQ101_Scene05_MarkerLin)

Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

PlayerREF.WaitFor3DLoad()
HellerREF.WaitFor3DLoad()
LinREF.WaitFor3DLoad()


; give the player the right starting gear
PlayerREF.EquipItem(Spacesuit_Miner)
PlayerREF.EquipItem(spacesuit_miner_helmet)
PlayerREF.EquipItem(spacesuit_miner_backpack_noboostpack)
PlayerREF.EquipItem(Clothes_GenWare_01)
PlayerREF.AddItem(Cutter)

;remove helmets
LinREF.RemoveItem(Spacesuit_Miner_Helmet_Lin_NOTPLAYABLE, absilent=true)
HellerREF.RemoveItem(Spacesuit_Miner_Helmet_Orange_Heller_NOTPLAYABLE, absilent=true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_04
Function Fragment_Stage_0000_Item_04()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

kmyquest.VSEnableLayer.EnableFastTravel(false)

PlayerREF.moveto(TestBarrettScene)

; fade menu to fade in)
debug.trace(self + "Wait 0.1 seconds")
Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)

SetStage(155)
SetStage(170)

PlayerREF.WaitFor3DLoad()

; remove all the player's stuff
PlayerREF.RemoveAllItems()

; give the player the right starting gear
PlayerREF.EquipItem(Spacesuit_Miner, absilent=true)
PlayerREF.EquipItem(spacesuit_miner_helmet, absilent=true)
PlayerREF.EquipItem(spacesuit_miner_backpack_noboostpack, absilent=true)
PlayerREF.EquipItem(Clothes_GenWare_01, absilent=true)
PlayerREF.EquipItem(Cutter)

;simulate dialogue choices
Int Choice01 = MQ101DebugMSG01.Show()
If Choice01 == 1
  SetStage(65)
EndIf

Alias_Lin.GetActorRef().moveto(MQ101LinScene08Marker01)
Alias_Heller.GetActorRef().moveto(MQ101_Scene08_HellerLean)

Game.SetLocalTime(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_05
Function Fragment_Stage_0000_Item_05()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
ObjectReference FrontierShipREF = Alias_BarrettShip.GetRef()

;make sure the player can't move
debug.trace(self + "New Game Start, disable player controls")

kmyquest.VSEnableLayer = InputEnableLayer.Create()
kmyquest.VSEnableLayer.DisablePlayerControls(abCamSwitch=True)

;disable Barrett
Alias_Barrett.GetActorRef().Disable()

; remove all the player's stuff
PlayerREF.RemoveAllItems()

; give the player the right starting gear
PlayerREF.SetOutfit(Spacesuit_Miner_Outfit)

; move the player so that New Game button puts him in the right place
debug.trace(self + "New Game Start, move player to marker")
FrontierShipREF.moveto(NewGameLodgeMarker)
FrontierShipREF.Enable()
PlayerREF.moveto(FrontierShipREF)

; Force a short wait so the fade out request isn't made while the loading menu is up
; (which would cause it to be bashed when the loading menu goes away and tells the
; fade menu to fade in)
debug.trace(self + "Wait 0.1 seconds")
Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)

;snap the player into furniture, this is done in a helper quest that grabs the ship and pilot seat
TestMQ101HelperQuest.SetStage(10)

;player can now move
kmyquest.VSEnableLayer.EnablePlayerControls()
kmyquest.VSEnableLayer = None
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_06
Function Fragment_Stage_0000_Item_06()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

kmyquest.VSEnableLayer = InputEnableLayer.Create()
kmyquest.VSEnableLayer.EnableFastTravel(false)

; remove all the player's stuff
PlayerREF.RemoveAllItems()

; give the player the right starting gear
PlayerREF.SetOutfit(Spacesuit_Miner_Outfit)

PlayerREF.moveto(VecteraMineStarMarker)
Alias_Heller.GetActorRef().moveto(VecteraMineStarMarkerHeller)
Alias_Lin.GetActorRef().moveto(VecteraMineStarMarkerLin)

Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)

SetStage(8)

;disable the button to go back up
VecteraElevatorButtonREF.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_07
Function Fragment_Stage_0000_Item_07()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Actor VascoREF = Alias_Vasco.GetActorRef()
ObjectReference FrontierShipREF = Alias_BarrettShip.GetRef()

;make sure the player can't move
debug.trace(self + "New Game Start, disable player controls")

kmyquest.VSEnableLayer = InputEnableLayer.Create()
kmyquest.VSEnableLayer.DisablePlayerControls(abCamSwitch=True)

; remove all the player's stuff
PlayerREF.RemoveAllItems()

; give the player the right starting gear
PlayerREF.SetOutfit(Spacesuit_Miner_Outfit)

;add weapons
PlayerREF.AddITem(TestVSWeapons)

; move the player so that New Game button puts him in the right place
debug.trace(self + "New Game Start, move player to marker")

PlayerREF.moveto(MQ101_KreetQuickstart_Player)

; Force a short wait so the fade out request isn't made while the loading menu is up
; (which would cause it to be bashed when the loading menu goes away and tells the
; fade menu to fade in)
debug.trace(self + "Wait 0.1 seconds")
Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)

;player can now move
kmyquest.VSEnableLayer.EnablePlayerControls()
kmyquest.VSEnableLayer = None

;make sure Vasco is set to follow the player and objectives show
SetStage(500)
SetStage(510)
SetStage(605)
SetStage(610)
SetStage(615)

VascoREF.AddKeyword(SQ_ActorRoles_SuppressMessages)
VascoREF.moveto(MQ101_KreetQuickstart_Vasco)
VascoREF.Enable()
FrontierShipREF.moveto(MQ101KreetShipLandingMarkerREF)
FrontierShipREF.setlinkedref(MQ101KreetShipLandingMarkerREF)
FrontierShipREF.Enable()
kmyQuest.StartInitTimer(setVascoAsCrew=true, moveVasco=false, setHomeShip=true)

PlayerREF.WaitFor3dLoad()

Game.SetLocalTime(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_08
Function Fragment_Stage_0000_Item_08()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Actor VascoREF = Alias_Vasco.GetActorRef()
ObjectReference FrontierShipREF = Alias_BarrettShip.GetRef()

;make sure the player can't move
debug.trace(self + "New Game Start, disable player controls")

kmyquest.VSEnableLayer = InputEnableLayer.Create()
kmyquest.VSEnableLayer.DisablePlayerControls(abCamSwitch=True)

; remove all the player's stuff
PlayerREF.RemoveAllItems()

; give the player the right starting gear
PlayerREF.SetOutfit(Spacesuit_Miner_Outfit)

;add weapons
PlayerREF.AddITem(TestVSWeapons)

; move the player so that New Game button puts him in the right place
debug.trace(self + "New Game Start, move player to marker")

PlayerREF.moveto(VS_NewAtlantisStartMarker)

; Force a short wait so the fade out request isn't made while the loading menu is up
; (which would cause it to be bashed when the loading menu goes away and tells the
; fade menu to fade in)
debug.trace(self + "Wait 0.1 seconds")
Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)

;player can now move
kmyquest.VSEnableLayer.EnablePlayerControls()
kmyquest.VSEnableLayer = None

;make sure Vasco is set to follow the player and objectives show
SetStage(500)
SetStage(1310)

VascoREF.AddKeyword(SQ_ActorRoles_SuppressMessages)
VascoREF.EvaluatePackage()
VascoREF.moveto(VS_NewAtlantisVascoStartMarker)
VascoREF.Enable()

FrontierShipREF.moveto(NewAtlantisShipLandingMarker)
FrontierShipREF.setlinkedref(NewAtlantisShipLandingMarker)
FrontierShipREF.Enable()
kmyQuest.StartInitTimer(setVascoAsCrew = True, moveVasco=false, setHomeShip=true)

PlayerREF.WaitFor3dLoad()

Game.SetLocalTime(11.5)

;Vasco is now a temp follower
(SQ_Followers as SQ_FollowersScript).SetRoleActive(Alias_Vasco.GetActorRef())

VascoREF.AddKeyword(SQ_ActorRoles_SuppressMessages)
VascoREF.EvaluatePackage()
VascoREF.moveto(VS_NewAtlantisVascoStartMarker)
VascoREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_09
Function Fragment_Stage_0000_Item_09()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

kmyquest.VSEnableLayer = InputEnableLayer.Create()

PlayerREF.moveto(MQ101_PlayerQuickstart9Marker)
Alias_Heller.GetActorRef().moveto(MQ101DrillHellerMarker01)
Alias_Lin.GetActorRef().moveto(MQ101ArtifactLinMarker02)

Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)

;disable the button to go back up
VecteraElevatorButtonREF.Disable()

SetStage(5)
SetStage(30)

SetObjectiveDisplayed(30)


PlayerREF.WaitFor3DLoad()

; remove all the player's stuff
PlayerREF.RemoveAllItems()

; give the player the right starting gear
PlayerREF.EquipItem(Spacesuit_Miner, absilent=true)
PlayerREF.EquipItem(spacesuit_miner_helmet, absilent=true)
PlayerREF.EquipItem(spacesuit_miner_backpack_noboostpack, absilent=true)
PlayerREF.EquipItem(Clothes_GenWare_01, absilent=true)
PlayerREF.EquipItem(Cutter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_10
Function Fragment_Stage_0000_Item_10()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Actor LinREF = Alias_Lin.GetActorRef()
Actor HellerREF = Alias_Heller.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()

kmyquest.VSEnableLayer = InputEnableLayer.Create()
kmyquest.VSEnableLayer.EnableFastTravel(false)

PlayerREF.moveto(MQ101PlayerScene08Marker02)

; remove all the player's stuff
PlayerREF.RemoveAllItems()

; give the player the right starting gear
PlayerREF.EquipItem(Spacesuit_Miner, absilent=true)
PlayerREF.EquipItem(spacesuit_miner_helmet, absilent=true)
PlayerREF.EquipItem(spacesuit_miner_backpack_noboostpack, absilent=true)
PlayerREF.EquipItem(Clothes_GenWare_01, absilent=true)
PlayerREF.EquipItem(Cutter)

HellerREF.moveto(MQ101HellerScene08Marker02)
LinREF.moveto(MQ101LinScene08Marker02)
BarrettREF.moveto(MQ101BarrettScene08Marker02)
VascoREF.moveto(MQ101VascoScene08Marker02)

; fade menu to fade in)
debug.trace(self + "Wait 0.1 seconds")
Utility.Wait(0.1)
debug.trace(self + "Finish waiting. Fade the game in.")

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)

;enable Barrett's ship
Alias_BarrettShip.GetRef().SetLinkedRef(BarrettLandingMarkerREF, SpaceshipEnabledLandingLink)
Alias_BarrettShip.GetRef().EnableNoWait()

;make pirate ship land
SetStage(210)
SetStage(250)

PlayerREF.WaitFor3dLoad()

Game.SetLocalTime(10)
Game.SetCharGenHUDMode(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_11
Function Fragment_Stage_0000_Item_11()
;BEGIN CODE
;ghost Heller Lin and Barrett

Alias_Barrett.GetActorRef().SetGhost()
Alias_Lin.GetActorRef().SetGhost()
Alias_Heller.GetActorRef().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
MQ101MagicDoortoVectaraMine.PreloadTargetArea()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
VecteraElevatorButtonREF.Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(5)

kmyquest.ShowHelpMessage("Move")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_01
Function Fragment_Stage_0009_Item_01()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
;player can now move but cannot switch to third, sneak, fight, or access menu
Game.GetPlayer().ChangeAnimArchetype(AnimArchetypeFastWalk)
kmyquest.VSEnableLayer.EnablePlayerControls(abCamSwitch=False, abSneaking=false, abFighting=false, abmenu=false)
kmyquest.VSEnableLayer.EnableHandscanner(false)
kmyquest.VSEnableLayer.EnableSprinting(False)

;show HUD but not watch
Game.SetCharGenHUDMode(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
;handle player grabbing cutter early
If GetStageDone(20) == 0
  SetObjectiveCompleted(5)
  SetObjectiveDisplayed(10)
Else
  SetObjectiveCompleted(5)
  SetObjectiveDisplayed(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Alias_Bening.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Alias_Troy.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
Alias_Calvert.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

;turn on fighting
PlayerREF.ChangeAnimArchetype(AnimArchetypePlayer)
kmyquest.VSEnableLayer.EnablePlayerControls(abCamSwitch=False, abFighting=True, abmenu=false, abSneaking=false)
kmyquest.VSEnableLayer.EnableFastTravel(False)
kmyquest.VSEnableLayer.EnableHandscanner(False)
kmyquest.VSEnableLayer.EnableSprinting(True)

;handle objectives if the player does this early
If GetStageDone(10) == 1
  SetObjectiveCompleted(10)
  SetObjectiveDisplayed(20)
EndIf

PlayerREF.EquipItem(TestMQ101Drill, abSilent=true)
PlayerREF.DrawWeapon()

SetStage(22)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("LaserCutter")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
If GetStageDone(10) || GetStageDone(27)
  SetObjectiveCompleted(20)
  SetObjectiveDisplayed(25)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()
SetObjectiveCompleted(20)
SetObjectiveCompleted(25)

If IsObjectiveCompleted(5) == 1
  SetObjectiveDisplayed(30)
EndIf

;enable trigger
Alias_Stage35Trigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
;register for animation event on the driller
;so we can smoothly transition to the anim later
kmyquest.RegisterForDrill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0033_Item_00
Function Fragment_Stage_0033_Item_00()
;BEGIN CODE
;call anims
Alias_MineBoringMachine.GetRef().PlayAnimation("Stage2")
Alias_MineWallBreakable.GetRef().PlayAnimation("Stage2")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0037_Item_00
Function Fragment_Stage_0037_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
MQ101MagicDoortoVectaraExt.PreloadTargetArea()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;If Game.UsingGamePad()
;  Tutorial_Light_Gamepad_MSGBox.Show()
;Else
;  Tutorial_Light_MKB_MSGBox.Show()
;EndIf
;Utility.Wait(0.1)
kmyquest.ShowHelpMessage("Light")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
(MQ00 as MQ00QuestScript).PlayArtifactVisionNoWait()

Actor PlayerREF = Game.GetPlayer()

Utility.Wait(0.1)

;disable Artifact floaters and music
ArtifactNotYetTakenEnableMarker.DisableNoWait()

;move player
MQ101MagicDoortoVecteraExt.Activate(PlayerREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0046_Item_00
Function Fragment_Stage_0046_Item_00()
;BEGIN CODE
(MQ00 as MQ00QuestScript).PlayArtifactVision()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0048_Item_00
Function Fragment_Stage_0048_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;TEMP - remove music for video
;MUSGenesisStingerReveal1Short.add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0049_Item_00
Function Fragment_Stage_0049_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("ArtifactCutter")

SetObjectiveCompleted(40)
SetObjectiveDisplayed(42)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
;disable controls
kmyquest.VSEnableLayer.DisablePlayerControls(ablooking=True, abFavorites=true, abCamSwitch=True)

Actor PlayerREF=Game.GetPlayer()
Actor HellerREF = Alias_Heller.GetActorRef()
Actor LinREF = Alias_Lin.GetActorRef()

SetObjectiveCompleted(43)

;hide HUD
Game.SetCharGenHUDMode(1)

;clear laser drill alias so the cutter can stack with other cutters
Alias_LaserDrill.Clear()

;clear tutorials
Message.ClearHelpMessages()

;shut down any other scenes
MQ101_001b_MiningWalkScene.Stop()
MQ101_002_LinSupervisorScene.Stop()
MQ101_004_WallDownScene.Stop()

;preload the area if we haven't already
If GetStageDone(5) == 0
  SetStage(5)
EndIf

;safety check - pull Heller out of animflavor
HellerREF.ChangeAnimFlavor(None)

;remove helmets
LinREF.UnequipItem(Spacesuit_Miner_Helmet_Lin_NOTPLAYABLE, absilent=true)
HellerREF.UnequipItem(Spacesuit_Miner_Helmet_Orange_Heller_NOTPLAYABLE, absilent=true)

;re-equip weapons
LinREF.EquipItem(Crew_Elite_Sidestar)
HellerREF.EquipItem(Crew_Elite_Cutter)

;play animation
If PlayerREF.IsWeaponDrawn()
  Utility.Wait(1.0)
EndIf
PlayerREF.PlayIdle(IdleArtifactTouch)

;give the animation a second to play
Utility.Wait(4.0)

;next scene plays
MQ101_005_FaceGenScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()

SetObjectiveCompleted(42)
SetObjectiveDisplayed(43)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
; force time on Vectera
Game.SetLocalTime(8)

;disable the Artifact activator
Alias_ArtifactDeposit.GetRef().Disable()

VecteraInteriorNPCEnableMarker.DisableNoWait()

;heal player
PlayerREF.ResetHealthAndLimbs()

;play music
MUSGenesisSpecialChargenWakeUp.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN CODE
ObjectReference MedBenchREF = Alias_MedBench.GetRef()
;MedBenchREF.SetAnimationVariableFloat("AnimSpeed", 0.5)
MedBenchREF.PlayAnimation("Play01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0063_Item_00
Function Fragment_Stage_0063_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetUpChargen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
MQ101_006b_SandwhichScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
MQ101_006c_SlateScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

MQ101_005B_FaceGenComplete.Start()

;turn saving back on
Game.SetInCharGen(False, false, false)

;enable controls, except fast travel and handscanner
PlayerREF.ChangeAnimArchetype(AnimArchetypePlayer)
kmyquest.VSEnableLayer.EnablePlayerControls()
kmyquest.VSEnableLayer.EnableFastTravel(False)
kmyquest.VSEnableLayer.EnableHandscanner(False)
kmyquest.VSEnableLayer.EnableSprinting(True)

;play music
MUSGenesisSpecialChargenComplete.Add()

; Start up the TraitsQuest - now that the players has traits
TraitQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

;block airlock controls
Alias_VecteraAirlock01.GetRef().BlockActivation(True, True)
Alias_VecteraAirlock02.GetRef().BlockActivation(True, True)
Alias_VecteraAirlock03.GetRef().BlockActivation(True, True)

;update equipment
PlayerREF.removeItem(Clothes_GenWare_01, absilent=true)
PlayerREF.AddItem(Clothes_Miner_UtilitySuit, absilent=true)
PlayerREF.EquipItem(Clothes_Miner_UtilitySuit, absilent=true)
PlayerREF.AddItem(Clothes_Argos_Jumpsuit, absilent=true)

;enable controls, except fast travel and handscanner
PlayerREF.ChangeAnimArchetype(AnimArchetypePlayer)
kmyquest.VSEnableLayer.EnablePlayerControls()
kmyquest.VSEnableLayer.EnableFastTravel(False)
kmyquest.VSEnableLayer.EnableHandscanner(False)
kmyquest.VSEnableLayer.EnableSprinting(True)

;set HUD mode so everything shows but the Watch
Game.SetCharGenHUDMode(3)

;add medstims
PlayerREF.additem(MQ101Medstims, absilent=true)
PlayerREF.MarkItemAsFavorite(Aid_MedPack, aiSlot=9)
PlayerREF.UnEquipItem(spacesuit_miner_helmet, absilent=true)

;we no longer need the special transition doors
MQ101MagicDoortoVectaraExt.DisableNoWait()
MQ101MagicDoortoVectaraMine.DisableNoWait()

;turn saving back on
Game.SetInCharGen(False, false, false)
Game.RequestAutoSave()

SetStage(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_01
Function Fragment_Stage_0155_Item_01()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;tutorial for third person
kmyquest.ShowHelpMessage("TogglePOV")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_02
Function Fragment_Stage_0155_Item_02()
;BEGIN CODE
;start tutorial quest
MQ_TutorialQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0157_Item_00
Function Fragment_Stage_0157_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

PlayerREF.MarkItemAsFavorite(Aid_MedPack, aiSlot=9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveCompleted(45)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0161_Item_00
Function Fragment_Stage_0161_Item_00()
;BEGIN CODE
;block airlock controls
Alias_VecteraAirlock02.GetRef().BlockActivation(True, True)

;play music
MUSGenesisStingerReveal4PlayerExitsHab.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0163_Item_00
Function Fragment_Stage_0163_Item_00()
;BEGIN CODE
;keep player in airlock
Alias_VecteraAirlockCollision.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(50, False)
SetObjectiveDisplayed(60)

kmyquest.InventoryTutorial()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_01
Function Fragment_Stage_0165_Item_01()
;BEGIN CODE
SetStage(168)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0166_Item_00
Function Fragment_Stage_0166_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("Inventory02")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0168_Item_00
Function Fragment_Stage_0168_Item_00()
;BEGIN CODE
;allow airlock button to be pressed
Alias_VecteraAirlock02.GetRef().BlockActivation(False, False)

;Lin and Heller also put helmets on
Alias_Lin.GetActorRef().EquipItem(Spacesuit_Miner_Helmet_Lin_NOTPLAYABLE, absilent=true)
Alias_Heller.GetActorRef().EquipItem(Spacesuit_Miner_Helmet_Orange_Heller_NOTPLAYABLE, absilent=true)

;enable trigger to advance quest as you approach door to airlock
Alias_SetStageTrigger170.GetRef().Enable()

If GetStageDone(165)
  SetObjectiveCompleted(60)
  SetObjectiveDisplayed(50)
Else
  SetStage(169)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0168_Item_01
Function Fragment_Stage_0168_Item_01()
;BEGIN CODE
Message.ClearHelpMessages()
Tutorial_Inventory05.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;enable Barrett's ship
ObjectReference BarrettShipREF = Alias_BarrettShip.GetRef()
BarrettShipREF.SetLinkedRef(BarrettLandingMarkerREF, SpaceshipEnabledLandingLink)
BarrettShipREF.EnableNoWait()

;move Barrett and Vasco to be in the ship
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()
BarrettREF.Disable()
VascoREF.Disable()
BarrettREF.moveto(Alias_BarrettPilotChair.getRef())
;VascoREF.moveto(Alias_BarrettShip_LandDeck_RobotBay.GetRef())
BarrettREF.EnableNoWait()
VascoREF.EnableNoWait()

SetObjectiveDisplayed(60, abdisplayed=false)

;Play Wwise Event
WEF_MQ101_Exit_Airlock_Music_UnMute.Play(game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;enable the trigger volume
MQ101_BarrettFinishedLandingEnableMarker.Enable()

SetObjectiveCompleted(50)
SetObjectiveDisplayed(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
MQ101_006_DiscoveryArrivesScene.Stop()
MQ101_008_BarrettScene.Start()

;allow airlock controls again
Alias_VecteraAirlock01.GetRef().BlockActivation(False, False)
Alias_VecteraAirlock02.GetRef().BlockActivation(False, False)
Alias_VecteraAirlock03.GetRef().BlockActivation(False, False)
Alias_VecteraAirlockCollision.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0203_Item_00
Function Fragment_Stage_0203_Item_00()
;BEGIN CODE
;miners in the fight no longer essential
Alias_VecteraExteriorMiners.SetEssential(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
Alias_PirateLandingShip.GetRef().EnableNoWait()
MQ101ShipAlarmKlaxonREF.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;make sure ship is enabled
SetStage(205)

;make sure NPCs update packages
Alias_VecteraExteriorMiners.EvaluateAll()

;start music
MUSGenesisStingerDread3Long.add()

;monitor player Health
(Alias_Player as MQ101PlayerAliasScript).PirateCombatStarts()

SetObjectiveCompleted(40)
SetObjectiveCompleted(45)
SetObjectiveCompleted(50)
SetObjectiveCompleted(60)
SetObjectiveCompleted(65)
SetObjectiveDisplayed(70)
SetObjectiveDisplayedAtTop(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

SetObjectiveCompleted(75)

If PlayerREF.GetEquippedWeapon() != Cutter
  PlayerREF.EquipItem(Eon)
  PlayerREF.DrawWeapon()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
If Game.UsingGamePad()
  Tutorial_LowHealthMSG.Show()
Else
  Tutorial_LowHealthMSG_PC.Show()
EndIf

Utility.Wait(0.1)

kmyquest.ShowHelpMessage("MedPackFav")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveCompleted(45)
SetObjectiveCompleted(50)
SetObjectiveCompleted(60)
SetObjectiveCompleted(65)
SetObjectiveDisplayed(70)

;weapon tutorial
If Game.GetPlayer().GetEquippedWeapon() == Cutter
  kmyquest.ShowHelpMessage("LaserCutter")
Else
  kmyquest.ShowHelpMessage("RangedWeapon")
EndIf

Alias_Barrett.GetActorRef().EvaluatePackage()
Alias_Heller.GetActorRef().EvaluatePackage()
Alias_Lin.GetActorRef().EvaluatePackage()
Alias_Vasco.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Actor HellerREF = Alias_Heller.GetActorRef()
Actor LinREF = Alias_Lin.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()

;disable objective to grab weapon
SetObjectiveDisplayed(75, abdisplayed=false)

;also disable klaxon FX
MQ101ShipAlarmKlaxonREF.Disable()

MQ101_008C_BarrettPiratesArrive.Stop()

;make sure Barrett unequips his gun
;BarrettREF.UnequipItem(Companion_Eon)

;Heal everyone
;heal all vectera miners
Actor[] allActors = Alias_VecteraExteriorMiners.GetActorArray()
int icount = allActors.length
int iindex = 0
while (iindex < icount)
  AllActors[iindex].ResetHealthAndLimbs()
  iindex = iindex + 1
endwhile

;miners in the fight essential again
Alias_VecteraExteriorMiners.SetEssential()

HellerREF.ResetHealthAndLimbs()
LinREF.ResetHealthAndLimbs()
VascoREF.ResetHealthAndLimbs()
BarrettREF.ResetHealthAndLimbs()

;force update packages
HellerREF.EvaluatePackage()
LinREF.EvaluatePackage()
VascoREF.EvaluatePackage()
BarrettREF.EvaluatePackage()
Alias_VecteraExteriorMiners.EvaluateAll()

SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
If GetStageDone(300) == 0
  SetObjectiveCompleted(60)
  SetObjectiveCompleted(70)
  SetObjectiveDisplayed(75)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveCompleted(75)
SetObjectiveDisplayed(80)

;The Artifact placed in the world needs to be replaced with the correct Artifact for this playthrough
;spawn the correct Artifact at this spot, then refill RefAlias with spawned Artifact
ObjectReference ArtifactREF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(0, MQ101ArtifactSpawnMarker)
Alias_MQ101Artifact.ForceRefTo(ArtifactREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0302_Item_00
Function Fragment_Stage_0302_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
kmyquest.VSEnableLayer.DisablePlayerControls(abCamSwitch=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
kmyquest.VSEnableLayer.DisablePlayerControls(abCamSwitch=True, abLooking=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor PlayerREF = Game.GetPlayer()

;give player the Artifact
ObjectReference ArtifactREF = Alias_MQ101Artifact.GetRef()
ArtifactREF.Enable()
PlayerREF.Additem(ArtifactREF)

;Make the exterior load door accessible.
Alias_BarrettShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)

kmyquest.ShowHelpMessage("ExitDialogue")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_01
Function Fragment_Stage_0310_Item_01()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
kmyquest.VSEnableLayer.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Game.SetCharGenHUDMode(0)
Game.ShowCustomWatchAlert("bootup")

SetObjectiveCompleted(80)
SetObjectiveCompleted(85)
SetObjectiveDisplayed(90)

MQ101_011b_VascoEscort.Start()

kmyquest.AssignVascoAsCrew()

Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
MQ101_011b_VascoEscort.Stop()
MQ101_012_VascoShipScene.Start()

SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)

; Add contents to Captain's Locker, and then clear the alias
Alias_BarrettShipCaptainsLocker.GetRef().AddItem(BarrettShipCaptainsLockerContents)
Alias_BarrettShipCaptainsLocker.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("ShipTakeoff")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0345_Item_00
Function Fragment_Stage_0345_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()
MUSGenesisStingerFlightStart.Add()
MQ101_012_VascoShipScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Game.RequestAutoSave() ;GEN-509625

MQ101_013A_FlightScene.Start()

;clear old take-off tutorials
Message.ClearHelpMessages()

;start tutorial quest
MQ_TutorialQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_01
Function Fragment_Stage_0400_Item_01()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
;prevent player from leaving orbit
If kmyquest.VSEnableLayer == None
  kmyquest.VSEnableLayer = InputEnableLayer.Create()
EndIf
kmyquest.VSEnableLayer.EnableFastTravel(false)
kmyquest.VSEnableLayer.EnableGravJump(false)
kmyquest.VSEnableLayer.EnableFarTravel(false)

;player can only go to locations specified until quest ends
SNarion_PAnselon_MKreet_Orbit.DisableSpaceTravelToAllExcept(Self, true)
SNarion_PAnselon_MKreet_Surface.DisableSpaceTravelToAllExcept(Self, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_02
Function Fragment_Stage_0400_Item_02()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
SetStage(405)

;enable fast travel
kmyquest.VSEnableLayer.EnableFastTravel(True)
kmyquest.VSEnableLayer = None
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_03
Function Fragment_Stage_0400_Item_03()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
;enable fast travel
kmyquest.VSEnableLayer.EnableFastTravel(True)
kmyquest.VSEnableLayer = None
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_04
Function Fragment_Stage_0400_Item_04()
;BEGIN CODE
;Achievement Unlocked
Game.AddAchievement(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0403_Item_00
Function Fragment_Stage_0403_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(101)
SetObjectiveCompleted(102)
SetObjectiveCompleted(103)
SetObjectiveCompleted(104)
SetObjectiveCompleted(105)
SetObjectiveCompleted(106)

Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
MQ101SpaceEncounter01.Start()
kmyQuest.StopFlightTutorialScenes() ; failsafe
MQ101_013B_SpaceCombatScene.Start()

MUSGenesisCombat_MQ101SpaceBattle.Add() ;music

SetObjectiveCompleted(100)
SetObjectiveCompleted(101)
SetObjectiveCompleted(102)
SetObjectiveCompleted(103)
SetObjectiveCompleted(104)
SetObjectiveCompleted(105)
SetObjectiveCompleted(106)

SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0407_Item_00
Function Fragment_Stage_0407_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("ShipCombat")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0408_Item_00
Function Fragment_Stage_0408_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
MQ101_013d_ShieldsDownScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0419_Item_00
Function Fragment_Stage_0419_Item_00()
;BEGIN CODE
;check if we already have power
(Alias_PlayerShip as MQ101PlayerShipScript).CheckPowerToSystems()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SpaceshipReference PlayerShipREF = Alias_PlayerShip.GetShipRef()
;PlayerShipREF.LockPowerAllocation(2, -1)
PlayerShipREF.LockPowerAllocation(3, -1)

;PlayerShipREF.SetPartPower(2, -1, 0)
PlayerShipREF.SetPartPower(3, -1, 0)

if Game.UsingGamepad()
  Tutorial_ShipPower_MSGBox.Show()
else
  Tutorial_ShipPower_MSGBox_PC.Show()
endIf
Utility.Wait(0.1)
kmyquest.ShowHelpMessage("PowerAllocation")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_01
Function Fragment_Stage_0420_Item_01()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(101)
SetObjectiveDisplayed(102)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0421_Item_00
Function Fragment_Stage_0421_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;SetObjectiveDisplayed(103)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0422_Item_00
Function Fragment_Stage_0422_Item_00()
;BEGIN CODE
SetObjectiveCompleted(103)
;SetObjectiveDisplayed(104)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0423_Item_00
Function Fragment_Stage_0423_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(104)
;SetObjectiveDisplayed(105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0424_Item_00
Function Fragment_Stage_0424_Item_00()
;BEGIN CODE
SetObjectiveCompleted(105)
;SetObjectiveDisplayed(106)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0485_Item_00
Function Fragment_Stage_0485_Item_00()
;BEGIN CODE
;start combat encounter
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()
MQ101_014A_SecondCombatStarts.Start()

MUSGenesisCombat_MQ101SpaceBattle.Remove() ;music
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0492_Item_00
Function Fragment_Stage_0492_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
MQ101SpaceEncounter02.Start()

kmyquest.ShowHelpMessage("SpaceTargets")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0495_Item_00
Function Fragment_Stage_0495_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
MQ101_014A_SecondCombatStarts.Stop()
MQ101_014_SpaceCombatOverScene.Start()

SetObjectiveCompleted(110)

Message.ClearHelpMessages()

MUSGenesisCombat_MQ101SpaceBattle.Remove()

;enable travel
kmyquest.VSEnableLayer.EnableFarTravel(True)
kmyquest.VSEnableLayer.EnableFastTravel(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN CODE
SetObjectiveCompleted(110)
SetStage(900)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("StarMap01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_01
Function Fragment_Stage_0510_Item_01()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;handle the player going ahead
If GetStageDone(605) == 0
  SetObjectiveCompleted(110)
  SetObjectiveDisplayed(120)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_02
Function Fragment_Stage_0510_Item_02()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
kmyquest.StarMapTutorial()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(115)
kmyquest.ShowHelpMessage("ShipLoot")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetObjectiveCompleted(115)
Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
ObjectReference FrontierShipREF = Alias_BarrettShip.GetRef()
kmyquest.ShowHelpMessage("ShipRepair")

SetObjectiveDisplayed(117)

;if the ship is at perfect health, advance
Float ShipHealth = FrontierShipREF.GetValuePercentage(Health)
If ShipHealth >= 1
  SetStage(530)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
SetObjectiveCompleted(117)
Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0535_Item_00
Function Fragment_Stage_0535_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(118)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
SetObjectiveCompleted(118)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0605_Item_00
Function Fragment_Stage_0605_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
Message.ClearHelpMessages()

SetObjectiveCompleted(100)
SetObjectiveCompleted(101)
SetObjectiveCompleted(102)
SetObjectiveCompleted(103)
SetObjectiveCompleted(104)
SetObjectiveCompleted(105)
SetObjectiveCompleted(106)
SetObjectiveCompleted(110)
SetObjectiveCompleted(115)
SetObjectiveCompleted(117)
SetObjectiveCompleted(120)
SetObjectiveDisplayed(125)

kmyQuest.StopFlightTutorialScenes()
MQ101_014_SpaceCombatOverScene.Stop()
MQ101_016_KreetOrbitScene.Start()

;unload previous space encounters
MQ101SpaceEncounter01.Stop()
MQ101SpaceEncounter02.Stop()

;make sure tutorial quest is running
MQ_TutorialQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0606_Item_00
Function Fragment_Stage_0606_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("PlanetView")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0606_Item_01
Function Fragment_Stage_0606_Item_01()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
kmyquest.PlanetViewTutorial()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0607_Item_00
Function Fragment_Stage_0607_Item_00()
;BEGIN CODE
;set Kreet Time
Game.SetLocalTime(8)

MQ101_016_KreetOrbitScene.Stop()
Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0608_Item_00
Function Fragment_Stage_0608_Item_00()
;BEGIN CODE
Tutorial_PlanetLandingMSGBox.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;set Kreet Time
Game.SetLocalTime(8)

MQ101_016_KreetOrbitScene.Stop()
Message.ClearHelpMessages()

MQ101_017a_LandingScene.Start()

;Vasco is now a temp follower
(SQ_Followers as SQ_FollowersScript).SetRoleActive(Alias_Vasco.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0615_Item_00
Function Fragment_Stage_0615_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(125)
SetObjectiveDisplayed(130)
SetObjectiveDisplayedAtTop(130)

;kmyquest.ShowHelpMessage("ExitPilotChair")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
MQ101_017b_ExitRampScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
MQ101_017c_ApproachAliens.Start()

SetStage(627)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0627_Item_00
Function Fragment_Stage_0627_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;Tutorial_ScannerMSGBox.Show()
kmyquest.showhelpMessage("Monocle")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
MQ101_017d_ApproachOutpostScene02.Start()
;MQ101_017c_ApproachOutpostScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
MQ101_017e_InBaseScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0645_Item_00
Function Fragment_Stage_0645_Item_00()
;BEGIN CODE
MQ101_017g_SafeScene.Start()
SetObjectiveDisplayed(132)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0647_Item_00
Function Fragment_Stage_0647_Item_00()
;BEGIN CODE
SetObjectiveCompleted(132)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
MQ101_017f_Helium3Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0670_Item_00
Function Fragment_Stage_0670_Item_00()
;BEGIN CODE
;player is temporarily allies
Actor PlayerREF = Game.GetPlayer()
PlayerREF.AddtoFaction(LC003RoofFaction)
PlayerREF.addtofaction(LC003PirateBossFaction)
PlayerREF.StopCombatAlarm()

LC003_CafeteriaMarker.DisableNoWait()
LC003_Lab2Marker.DisableNoWait()
LC003_InteriorBaseActorEnableMarker.DisableNoWait()

LC003_RoofMarker001.Enable()

Alias_KreetGuardLeft.GetActorRef().Moveto(MQ101KreetBossTravelMarkerLeft)
Alias_KreetGuardRight.GetActorRef().Moveto(MQ101KreetBossTravelMarkerRight)
Alias_KreetBoss.GetActorRef().Moveto(MQ101KreetBossTravelMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN CODE
SetStage(670)

MQ101_018_CFCaptainScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
;make sure player is now enemy
Actor PlayerREF = Game.GetPlayer()
PlayerREF.RemoveFromFaction(LC003RoofFaction)
PlayerREF.RemoveFromFaction(LC003PirateBossFaction)
LC003RoofFaction.SetEnemy(PlayerFaction)
LC003PirateBossFaction.SetEnemy(PlayerFaction)
Alias_KreetBoss.GetActorRef().StartCombat(PlayerREF)

;enable second ship
DNMQ101_Kreet.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0695_Item_00
Function Fragment_Stage_0695_Item_00()
;BEGIN CODE
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
;player is no longer allies
Actor PlayerREF = Game.GetPlayer()
PlayerREF.RemoveFromFaction(LC003RoofFaction)
PlayerREF.RemoveFromFaction(LC003PirateBossFaction)

SetObjectiveCompleted(130)
SetObjectiveCompleted(135)
SetObjectiveDisplayed(137)
SetObjectiveDisplayed(132, abDisplayed=False)

kmyquest.FastTravelTutorial()

MQ101_019_EnoughFuelScene.Start()

LC003_CafeteriaMarker.EnableNoWait()
LC003_Lab2Marker.EnableNoWait()
LC003_InteriorBaseActorEnableMarker.EnableNoWait()

kmyquest.VSEnableLayer.EnableFarTravel(True)
kmyquest.VSEnableLayer.EnableFastTravel(True)
kmyquest.VSEnableLayer.EnableGravJump(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_01
Function Fragment_Stage_0900_Item_01()
;BEGIN CODE
;player can only go to locations specified until quest ends
SAlphaCentauri_PJemison_Orbit.DisableSpaceTravelToAllExcept(Self, true)
SAlphaCentauri_PJemison_Surface.DisableSpaceTravelToAllExcept(Self, true)
SNarion_PAnselon_MKreet_Orbit.DisableSpaceTravelToAllExcept(Self, true)
SNarion_PAnselon_MKreet_Surface.DisableSpaceTravelToAllExcept(Self, true)

;allow waypoint in case player ends up with worse grav drive
SBarnardsStar_PFrost_Orbit.DisableSpaceTravelToAllExcept(Self, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0930_Item_00
Function Fragment_Stage_0930_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(137)
SetObjectiveDisplayed(140)

MQ101_030_JumpAgainScene.Start()
; global used for conditions
MQProgress.SetValue(1)

;make sure Kreet quest is complete
DNMQ101_Kreet.SetStage(100)

Utility.Wait(3.0)
kmyquest.SetCourseTutorial()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(101)
SetObjectiveCompleted(102)
SetObjectiveCompleted(103)
SetObjectiveCompleted(104)
SetObjectiveCompleted(105)
SetObjectiveCompleted(106)
SetObjectiveCompleted(115)
SetObjectiveCompleted(117)
SetObjectiveCompleted(120)

kmyQuest.StopFlightTutorialScenes()
MQ101_014_SpaceCombatOverScene.Stop()

SetObjectiveCompleted(137)
SetObjectiveCompleted(140)
SetObjectiveDisplayed(160)

;MQ101_030b_ArriveAtJemisonScene.Start()

LC003_RoofMarker001.DisableNoWait() ;make sure roof NPCs on Kreet are gone
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1305_Item_00
Function Fragment_Stage_1305_Item_00()
;BEGIN CODE
Game.SetLocalTime(11.5)
;GameHour.SetValue(11.5)
;City_NA_Landing_ShipTechs.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(101)
SetObjectiveCompleted(102)
SetObjectiveCompleted(103)
SetObjectiveCompleted(104)
SetObjectiveCompleted(105)
SetObjectiveCompleted(106)
SetObjectiveCompleted(115)
SetObjectiveCompleted(117)
SetObjectiveCompleted(120)

SetObjectiveCompleted(160)
SetObjectiveDisplayed(170)
MQProgress.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1320_Item_00
Function Fragment_Stage_1320_Item_00()
;BEGIN CODE
;play music
MUSGenesisStingerReveal2Medium.Add()
;start NA City quest
City_NA_Aquilus01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1325_Item_00
Function Fragment_Stage_1325_Item_00()
;BEGIN CODE
MQ101_VascoShipServicesScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1330_Item_00
Function Fragment_Stage_1330_Item_00()
;BEGIN CODE
;Tutorial_City_MSGBox.Show()
;Utility.Wait(0.1)

MQ_TutorialQuest_Misc01.SetStage(10)
;MQ_TutorialQuest_Misc07.SetStage(10)
;MQ_TutorialQuest_Misc08.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1340_Item_00
Function Fragment_Stage_1340_Item_00()
;BEGIN CODE
Alias_ShipServicesNPC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
MQ101_034_OutsideLodgeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
MQ101_034_OutsideLodgeScene.Stop()
MQ101_034b_InsideLodgeScene.Start()
;MQ101_034C_MoveEveryoneScene.Start()

;Vasco no longer an "active" crew
;this will unassign him as general crew, and make him stop following the player as elite crew
;he will need to be "re-recuited" by player to serve as crew in the future
SQ_Crew.SetRoleInactive(Alias_Vasco.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_01
Function Fragment_Stage_1510_Item_01()
;BEGIN CODE
SetObjectiveCompleted(170)
SetObjectiveDisplayed(180)

;add player to faction so crime isn't an issue
Game.GetPlayer().addtofaction(ConstellationFaction)

;Ghost Actors
Alias_SarahMorgan.GetActorRef().SetGhost()
Alias_WalterStroud.GetActorRef().SetGhost()
Alias_Vasco.GetActorRef().SetGhost()
Alias_Matteo.GetActorRef().SetGhost()
Alias_Noel.GetActorRef().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
kmyquest.MQ101DisablePlayerControls()

MQ101_034b_InsideLodgeScene.Stop()
MQ101_034c_Stage1600Scene.Start()

;Vasco is now no longer a temp follower
(SQ_Followers as SQ_FollowersScript).SetRoleInActive(Alias_Vasco.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1605_Item_00
Function Fragment_Stage_1605_Item_00()
;BEGIN CODE
SetObjectiveCompleted(180)
SetObjectiveDisplayed(185)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1610_Item_00
Function Fragment_Stage_1610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(185)
SetObjectiveDisplayed(187)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1620_Item_00
Function Fragment_Stage_1620_Item_00()
;BEGIN CODE
ObjectReference TableREF = Alias_LodgeTableActivator.GetRef()
Alias_SarahMorgan.GetActorRef().EvaluatePackage()

;allow player to activate the table trigger
TableREF.Enable()

SetObjectiveCompleted(185)
SetObjectiveCompleted(187)
SetObjectiveDisplayed(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1630_Item_00
Function Fragment_Stage_1630_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
ObjectReference TableREF = Alias_LodgeTableActivator.GetRef()
ObjectReference MQ101ArtifactREF = Alias_MQ101Artifact.GetRef()
ObjectReference ArmillaryREF = Alias_Armillary.GetRef()

TableREF.Disable() ;player cannot activate table again
Game.GetPlayer().RemoveItem(MQ101ArtifactREF)

ArmillaryREF.PlayAnimation("Equip")

MQ101_039c_ArtifactsTogether03.Start()

SetObjectiveCompleted(190)
SetObjectiveDisplayed(195)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1635_Item_00
Function Fragment_Stage_1635_Item_00()
;BEGIN CODE
Alias_LodgeArtifact01.GetRef().DisableNoWait()
Alias_NoelArtifact01.GetRef().DisableNoWait()
Alias_NoelArtifact02.GetRef().DisableNoWait()

ObjectReference ArmillaryREF = Alias_Armillary.GetRef()
(ArmillaryREF as ArmillaryScript).MQ101ArmillaryComesTogether()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1660_Item_00
Function Fragment_Stage_1660_Item_00()
;BEGIN CODE
SetStage(1635)

SetObjectiveCompleted(195)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN CODE
Game.StopDialogueCamera()

Actor PlayerREF = Game.GetPlayer()
CompleteAllObjectives()

PlayerREF.AddtoFaction(ConstellationFaction)
PlayerREF.additem(LodgeKey)

MQ102.SetStageNoWait(10)

; After you complete this quest "Light in the Darkness" has a news story
RAD02.SetStageNoWait(100)

;Completing this quest starts up FFLodge01
FFLodge01.SetStageNoWait(10)

; If the player has the Kid Stuff trait - queue up the pointer
if (TraitKidStuff.IsRunning())
  TraitKidStuff.SetStageNoWait(25)
endif

; If the player has the Starter Home trait, queue up the quest
If ( Game.GetPlayer().HasPerk(PERK_StarterHome) )
  TraitStarterHome.SetStageNoWait(100)
Else
  TraitStarterHome.Stop()
EndIf

;Vasco recruitable
VascoEliteCrewQuest.SetStageNoWait(1)

;Achievement Unlocked
Game.AddAchievement(2)

;make sure Vasco is no longer tagged for special ship handling
MQ101VascoQuestFollower.SetValueInt(0)
Alias_Vasco.GetActorRef().SetPlayerTeammate(False)

;UnGhost Actors
Alias_SarahMorgan.GetActorRef().SetGhost(False)
Alias_WalterStroud.GetActorRef().SetGhost(False)
Alias_Vasco.GetActorRef().SetGhost(False)
Alias_Matteo.GetActorRef().SetGhost(False)
Alias_Noel.GetActorRef().SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1810_Item_00
Function Fragment_Stage_1810_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
MQ401.SetStage(10)

MQProgress.SetValue(2)

;start NA City quest
City_NA_Aquilus01.Start()

Game.RequestSave()

If Game.GetPlayer().GetValueInt(PlayerUnityTimesEntered) == 1
  Utility.Wait(3.0)
  Tutorial_NewGamePlusMSGBox.Show()
EndIf

;disable the Vectera mining collision
MQ101_BoringCollision.DisableNoWait()

;disable the Artifact activator
Alias_ArtifactDeposit.GetRef().DisableNoWait()

;disable Artifact floaters and music
ArtifactNotYetTakenEnableMarker.DisableNoWait()

VecteraInteriorNPCEnableMarker.DisableNoWait()

LC003_InteriorBaseActorEnableMarker.DisableNoWait()

;put drill in position
SetStage(33)

; Start up the TraitsQuest - now that the players has traits
TraitQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
; If the player has the Kid Stuff trait - queue up the pointer
if (TraitKidStuff.IsRunning())
  TraitKidStuff.SetStageNoWait(25)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN AUTOCAST TYPE mq101script
Quest __temp = self as Quest
mq101script kmyQuest = __temp as mq101script
;END AUTOCAST
;BEGIN CODE
;make sure scripted music is off
MUSGenesisCombat_MQ101SpaceBattle.Remove()

;re-enable space travel
SAlphaCentauri_PJemison_Orbit.DisableSpaceTravelToAllExcept(Self, false)
SAlphaCentauri_PJemison_Surface.DisableSpaceTravelToAllExcept(Self, false)
SNarion_PAnselon_MKreet_Orbit.DisableSpaceTravelToAllExcept(Self, false)
SNarion_PAnselon_MKreet_Surface.DisableSpaceTravelToAllExcept(Self, false)
SBarnardsStar_PFrost_Orbit.DisableSpaceTravelToAllExcept(Self, false)

;clear enable layers
kmyquest.VSEnableLayer.Delete()
kmyquest.VSEnableLayer = None

;Set player as having acquired the Artifact
If Game.GetPlayer().GetValue(PlayerUnityTimesEntered) == 0
  (StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(0)
  ;start tutorials
  MQ_TutorialQuest_Misc04.Start()
EndIf

;Vasco now shows regular crew messages
Alias_Vasco.GetActorRef().RemoveKeyword(SQ_ActorRoles_SuppressMessages)

;un-ghost everyone
Alias_Barrett.GetActorRef().SetGhost(False)
Alias_Lin.GetActorRef().SetGhost(False)
Alias_Heller.GetActorRef().SetGhost(False)
Alias_SarahMorgan.GetActorRef().SetGhost(False)
Alias_Noel.GetActorRef().SetGhost(False)
Alias_Matteo.GetActorRef().SetGhost(False)
Alias_WalterStroud.GetActorRef().SetGhost(False)

;start post-quest hellos
MQ101PostQuest.Start()

;clean up encounters
MQ101LandingEncounter01.Stop()
MQ101SpaceEncounter01.Stop()
MQ101SpaceEncounter02.Stop()
DNMQ101.Stop()

;add default outfits to Heller and Lin
Alias_Heller.GetActorRef().SetOutfit(Outfit_Elite_Heller)
Alias_Lin.GetActorRef().SetOutfit(Outfit_Elite_Lin)

;make sure Vasco is no longer tagged for special ship handling
MQ101VascoQuestFollower.SetValueInt(0)

LC003_RoofMarker001.DisableNoWait() ;make sure roof NPCs on Kreet are gone
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property CharGenStartMarker Auto Const Mandatory

Scene Property MQ101_005_FaceGenScene Auto Const Mandatory

Scene Property MQ101_006_DiscoveryArrivesScene Auto Const Mandatory

ReferenceAlias Property Alias_ForemanBrock Auto Const Mandatory

ReferenceAlias Property Alias_MQ101Artifact Auto Const Mandatory

ReferenceAlias Property MQ101Artifact Auto Const

Scene Property MQ101_008_BarrettScene Auto Const Mandatory

Scene Property MQ101_010_BarrettWoundedScene Auto Const Mandatory

Scene Property MQ101_013_SpaceScene Auto Const Mandatory

Scene Property MQ101_014_SpaceCombatOverScene Auto Const Mandatory

ObjectReference Property MQ101Scene10PlayerMarker01 Auto Const Mandatory

ObjectReference Property MQ101BerrettScene10Marker01 Auto Const Mandatory

ObjectReference Property MQ101VascoScene10Marker01 Auto Const Mandatory

ReferenceAlias Property Alias_Vasco Auto Const Mandatory

Scene Property MQ101_030_JumpAgainScene Auto Const Mandatory

Scene Property MQ101_034_DockedScene Auto Const Mandatory

Scene Property MQ101_035_SarahMorganScene Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

Quest Property MQ101PostQuest Auto Const Mandatory

Scene Property MQ101_012_VascoShipScene Auto Const Mandatory

ObjectReference Property MQ101MagicDoortoVectaraExt Auto Const Mandatory

ObjectReference Property MQ101MagicDoortoVectaraMine Auto Const Mandatory

ReferenceAlias Property Alias_Heller Auto Const Mandatory

ReferenceAlias Property Alias_Noel Auto Const Mandatory

ReferenceAlias Property Alias_Lin Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

Scene Property MQ101_002_LinSupervisorScene Auto Const Mandatory

Scene Property MQ101_004_WallDownScene Auto Const Mandatory

ReferenceAlias Property Alias_LaserDrill Auto Const Mandatory

ReferenceAlias Property Alias_PirateLandingShip Auto Const Mandatory

Weapon Property TestMQ101Drill Auto Const Mandatory

ReferenceAlias Property Alias_BarrettShip Auto Const Mandatory

Scene Property MQ101_012b_VascoAtStationScene Auto Const Mandatory

ReferenceAlias Property Alias_Stage35Trigger Auto Const Mandatory

ObjectReference Property VecteraElevatorButtonREF Auto Const Mandatory

Scene Property MQ101_001b_MiningWalkScene Auto Const Mandatory

Scene Property MQ101_001_MiningScene Auto Const Mandatory

ReferenceAlias Property Alias_MineBoringMachine Auto Const Mandatory

ReferenceAlias Property Alias_MineWallBreakable Auto Const Mandatory

Quest Property TestMQ101HelperQuest Auto Const Mandatory

Key Property FrontierShipKey Auto Const Mandatory

Scene Property MQ101_019_EnoughFuelScene Auto Const Mandatory

ObjectReference Property MQ101VascoScene08Marker01 Auto Const Mandatory

ObjectReference Property MQ101BarrettScene08Marker01 Auto Const Mandatory

ObjectReference Property MQ101LinDefenseMarker01 Auto Const Mandatory

Scene Property MQ101_017a_LandingScene Auto Const Mandatory

Scene Property MQ101_013A_FlightScene Auto Const Mandatory

Quest Property MQ101SpaceEncounter01 Auto Const Mandatory

Scene Property MQ101_013B_SpaceCombatScene Auto Const Mandatory

Quest Property MQ101SpaceEncounter02 Auto Const Mandatory

ObjectReference Property TestBarrettScene Auto Const Mandatory

Message Property MQ101DebugMSG01 Auto Const Mandatory

Quest Property DNMQ101 Auto Const

ObjectReference Property NewGameShipMarkerREF Auto Const Mandatory

ObjectReference Property NewGameLodgeMarker Auto Const Mandatory

Armor Property Spacesuit_Miner_Backpack Auto Const Mandatory

Armor Property Spacesuit_Miner_Helmet Auto Const Mandatory

ObjectReference Property VecteraMineStarMarker Auto Const Mandatory

ObjectReference Property VecteraMineStarMarkerHeller Auto Const Mandatory

ObjectReference Property VecteraMineStarMarkerLin Auto Const Mandatory

Scene Property MQ101_014A_SecondCombatStarts Auto Const Mandatory

ReferenceAlias Property Alias_Bening Auto Const Mandatory

ReferenceAlias Property Alias_Troy Auto Const Mandatory

Armor Property Spacesuit_Miner Auto Const Mandatory

LeveledItem Property MQ101LaserCutter Auto Const Mandatory

Outfit Property Spacesuit_Miner_Outfit Auto Const Mandatory

ObjectReference Property MQ101_Scene05_MarkerPlayer Auto Const Mandatory

ObjectReference Property MQ101_Scene05_MarkerHeller Auto Const Mandatory

ObjectReference Property MQ101_Scene05_MarkerLin Auto Const Mandatory

Scene Property MQ101_005B_FaceGenComplete Auto Const Mandatory

ReferenceAlias Property Alias_Matteo Auto Const Mandatory

MusicType Property MUSGenesisStingerDread3Long Auto Const Mandatory

MusicType Property MUSGenesisStingerReveal3Long Auto Const Mandatory

MusicType Property MUSGenesisStingerFlightStart Auto Const Mandatory

ObjectReference Property MQ101_BarrettFinishedLandingEnableMarker Auto Const Mandatory

ActorValue Property SpaceshipGravJumpFuel Auto Const Mandatory

GlobalVariable Property GameHour Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

ObjectReference Property MQ101_KreetQuickstart_Player Auto Const Mandatory

ObjectReference Property MQ101_KreetQuickstart_Vasco Auto Const Mandatory

ReferenceAlias Property Alias_WalterStroud Auto Const Mandatory

ObjectReference Property MQ101KreetShipLandingMarkerREF Auto Const Mandatory

Scene Property MQ101_017b_ExitRampScene Auto Const Mandatory

Scene Property MQ101_017c_ApproachOutpostScene Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

Scene Property MQ101_034b_InsideLodgeScene Auto Const Mandatory

ObjectReference Property VS_NewAtlantisVascoStartMarker Auto Const Mandatory

ObjectReference Property VS_NewAtlantisStartMarker Auto Const Mandatory

MusicType Property MUSGenesisStingerReveal1Short Auto Const Mandatory

Scene Property MQ101_030b_ArriveAtJemisonScene Auto Const Mandatory

Scene Property MQ101_017c_ApproachAliens Auto Const Mandatory

Scene Property MQ101_017e_InBaseScene Auto Const Mandatory

Scene Property MQ101_017f_Helium3Scene Auto Const Mandatory

Scene Property MQ101_016_KreetOrbitScene Auto Const Mandatory

ReferenceAlias Property Alias_Calvert Auto Const Mandatory

ObjectReference Property MQ101_PlayerQuickstart9Marker Auto Const Mandatory

ObjectReference Property MQ101Scene004HellerMarker02 Auto Const Mandatory

ObjectReference Property MQ101Scene004LinMarker01 Auto Const Mandatory

ObjectReference Property MQ101ArtifactLinMarker01 Auto Const Mandatory

ObjectReference Property MQ101_IsabelleHellerFurnitureREF Auto Const Mandatory

ReferenceAlias Property Alias_SetStageTrigger170 Auto Const Mandatory

ObjectReference Property BarrettLandingMarkerREF Auto Const Mandatory

ObjectReference Property MQ101HellerScene08Marker02 Auto Const Mandatory

ObjectReference Property MQ101LinScene08Marker02 Auto Const Mandatory

ObjectReference Property MQ101PlayerScene08Marker02 Auto Const Mandatory

ObjectReference Property MQ101BarrettScene08Marker02 Auto Const Mandatory

ObjectReference Property MQ101VascoScene08Marker02 Auto Const Mandatory

ObjectReference Property MQ101DrillHellerMarker01 Auto Const Mandatory

ObjectReference Property MQ101ArtifactLinMarker02 Auto Const Mandatory

Quest Property MQ101LandingEncounter01 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactDeposit Auto Const Mandatory

Scene Property MQ101_013c_ShipDamageTutorialScene Auto Const Mandatory

ReferenceAlias Property Alias_BarrettPilotChair Auto Const Mandatory

ReferenceAlias Property Alias_BarrettShipCrewMarker Auto Const Mandatory

ObjectReference Property MQ101LinScene08Marker01 Auto Const Mandatory

ObjectReference Property MQ101_Scene08_HellerLean Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Scene Property MQ101_008C_BarrettPiratesArrive Auto Const Mandatory

Armor Property Spacesuit_Miner_Helmet_Orange Auto Const Mandatory

MusicType Property MUSGenesisStingerReveal2Medium Auto Const Mandatory

MusicType Property MUSGenesisSpecialCardTitleOpening Auto Const Mandatory

LeveledItem Property TestVSWeapons Auto Const Mandatory

Weapon Property Cutter Auto Const Mandatory

ObjectReference Property MQ101BarrettScene10Marker01 Auto Const Mandatory

ObjectReference Property MQ101ShipAlarmKlaxonREF Auto Const Mandatory

Quest Property City_NA_Aquilus01 Auto Const Mandatory

ReferenceAlias Property Alias_BarrettShipDoor Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

MusicType Property MUSGenesisSpecialChargenComplete Auto Const Mandatory

Quest Property City_NA_Landing_ShipTechs Auto Const Mandatory

LocationAlias Property Alias_BarrettShip_ExteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_BarrettShip_LandDeck_RobotBay Auto Const Mandatory

Scene Property MQ101_006b_SandwhichScene Auto Const Mandatory

GlobalVariable Property GameDay Auto Const Mandatory

ReferenceAlias Property Alias_MedBench Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

ObjectReference Property MQ101_LGT_B Auto Const Mandatory

Quest Property PlayerShipQuest Auto Const Mandatory

GlobalVariable Property MQProgress Auto Const Mandatory

ReferenceAlias Property Alias_LodgeTableActivator Auto Const Mandatory

Scene Property MQ101_037_ReactToArtifactScene Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

LeveledItem Property MQ101Medstims Auto Const Mandatory

Scene Property MQ101_006c_SlateScene Auto Const Mandatory

Quest Property RAD02 Auto Const Mandatory

Key Property LodgeKey Auto Const Mandatory

ReferenceAlias Property Alias_Armillary Auto Const Mandatory

ReferenceAlias Property Alias_LodgeArtifact01 Auto Const Mandatory

sq_crewscript Property SQ_Crew Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipPilotSeat Auto Const Mandatory

Armor Property Spacesuit_Miner_Backpack_NoBoostPack Auto Const Mandatory

Potion Property Aid_MedPack Auto Const Mandatory

Outfit Property Outfit_Starborn Auto Const Mandatory

Keyword Property SQ_ActorRoles_SuppressMessages Auto Const Mandatory

ReferenceAlias Property Alias_DataSlate Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

ActorValue Property PlayerUnityTimesEntered Auto Const Mandatory

Quest Property MQ401 Auto Const Mandatory

ObjectReference Property MQ101_VascoMarker01 Auto Const Mandatory

Faction Property ConstellationFaction Auto Const Mandatory

Perk Property StarbornSkillCheck Auto Const Mandatory

Scene Property MQ101_011b_VascoEscort Auto Const Mandatory

ObjectReference Property MQ101ArtifactSpawnMarker Auto Const Mandatory

Scene Property MQ101_034c_Stage1600Scene Auto Const Mandatory

WwiseEvent Property WwiseEvent_AMBArtifactVisionA Auto Const Mandatory

LocationAlias Property Alias_BarrettShip_InteriorLocation Auto Const Mandatory

Quest Property FFLodge01 Auto Const Mandatory

SpaceshipReference Property MQPlayerStarbornShipREF Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

ObjectReference Property VecteraInteriorNPCEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_VecteraMapMarker Auto Const Mandatory

Quest Property VascoEliteCrewQuest Auto Const

Quest Property TraitKidStuff Auto Const
Quest Property TraitStarterHome Auto Const

ObjectReference Property MQ101MagicDoortoVecteraExt Auto Const Mandatory

Idle Property IdleExamineWatch Auto Const Mandatory

ReferenceAlias Property Alias_SpaceEncounter01_Ship02 Auto Const Mandatory

Idle Property IdleStop Auto Const Mandatory

Armor Property Clothes_Chronomark_Mq101 Auto Const Mandatory

Message Property MQ101TakeWatchMSG Auto Const Mandatory

Armor Property Clothes_Miner_Jumpsuit Auto Const Mandatory

Armor Property Clothes_GenWare_01 Auto Const Mandatory

MusicType Property MUSGenesisSpecialChargenWakeUp Auto Const Mandatory

WwiseEvent Property WEF_MQ101_Exit_Airlock_Music_UnMute Auto Const Mandatory

Weapon Property Eon Auto Const Mandatory

RefCollectionAlias Property Alias_VecteraExteriorMiners Auto Const Mandatory

Message Property Tutorial_LowHealthMSG Auto Const Mandatory

Message Property Tutorial_LowHealthMSG_PC Auto Const Mandatory

ReferenceAlias Property Alias_NoelArtifact01 Auto Const Mandatory

ReferenceAlias Property Alias_NoelArtifact02 Auto Const Mandatory

Quest Property MQ_TutorialQuest Auto Const Mandatory

Quest Property MQ_TutorialQuest_Misc01 Auto Const Mandatory

Quest Property MQ_TutorialQuest_Misc04 Auto Const Mandatory

Scene Property MQ101_017g_SafeScene Auto Const Mandatory

Location Property SNarion_PAnselon_MVectera_Surface Auto Const Mandatory

Location Property SNarion_PAnselon_MKreet Auto Const Mandatory

Location Property SAlphaCentauri_PJemison Auto Const Mandatory

Location Property SAlphaCentauri_PJemison_Orbit Auto Const Mandatory

Location Property SAlphaCentauri_PJemison_Surface Auto Const Mandatory

Location Property SNarion_PAnselon_MKreet_Surface Auto Const Mandatory

Location Property SNarion_PAnselon_MKreet_Orbit Auto Const Mandatory

Outfit Property Outfit_Elite_Heller Auto Const Mandatory

Outfit Property Outfit_Elite_Lin Auto Const Mandatory

Message Property Tutorial_Light_Gamepad_MSGBox Auto Const Mandatory

Message Property Tutorial_Light_MKB_MSGBox Auto Const Mandatory

Message Property Tutorial_Inventory_MKB_MSGBox Auto Const Mandatory

Message Property Tutorial_Inventory_MSGBox Auto Const Mandatory

Message Property Tutorial_ShipPower_MSGBox Auto Const Mandatory

Message Property Tutorial_ShipLowHealthMSG Auto Const Mandatory

Message Property Tutorial_ShipDamagedSystemMSG Auto Const Mandatory

Message Property Tutorial_ShipCombatMSG Auto Const Mandatory

Message Property Tutorial_ScannerMSGBox Auto Const Mandatory

Scene Property MQ101_034_OutsideLodgeScene Auto Const Mandatory

Message Property Tutorial_Boostpack_MSGBox Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Armor Property Clothes_Miner_UtilitySuit Auto Const Mandatory

Armor Property Clothes_Argos_Jumpsuit Auto Const Mandatory

Message Property Tutorial_City_MSGBox Auto Const Mandatory

Quest Property MQ_TutorialQuest_Misc07 Auto Const Mandatory

Quest Property MQ_TutorialQuest_Misc08 Auto Const Mandatory

Message Property Tutorial_StarMapKreet_MSGBox Auto Const Mandatory

Message Property Tutorial_PlanetMapKreet_MSGBox Auto Const Mandatory

Scene Property MQ101_017d_ApproachOutpostScene02 Auto Const Mandatory

ObjectReference Property LC003_RoofMarker001 Auto Const Mandatory

Faction Property LC003RoofFaction Auto Const Mandatory

ReferenceAlias Property Alias_KreetDigipick Auto Const Mandatory

ReferenceAlias Property Alias_KreetBoss Auto Const Mandatory

Scene Property MQ101_018_CFCaptainScene Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ObjectReference Property LC003_CafeteriaMarker Auto Const Mandatory

ObjectReference Property LC003_Lab2Marker Auto Const Mandatory

ObjectReference Property LC003_InteriorBaseActorEnableMarker Auto Const Mandatory

Idle Property IdleArtifactTouch Auto Const Mandatory

Scene Property MQ101_039c_ArtifactsTogether03 Auto Const Mandatory

Faction Property LC003PirateBossFaction Auto Const Mandatory

Weapon Property Crew_Elite_Sidestar Auto Const Mandatory

Weapon Property Crew_Elite_Cutter Auto Const Mandatory

ReferenceAlias Property Alias_BarrettShipSmallItemMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_BarrettShipSmallItemMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_BarrettShipSmallItemMarker03 Auto Const Mandatory

Book Property MQ101_BarrettAudioLog01new Auto Const Mandatory

Book Property MQ101_BarrettAudioLog02new Auto Const Mandatory

Book Property MQ101_BarrettAudioLog03new Auto Const Mandatory

Quest Property DNMQ101_Kreet Auto Const Mandatory

ReferenceAlias Property Alias_VecteraAirlock01 Auto Const Mandatory

ReferenceAlias Property Alias_VecteraAirlock02 Auto Const Mandatory

ReferenceAlias Property Alias_VecteraAirlock03 Auto Const Mandatory

ReferenceAlias Property Alias_VecteraAirlockCollision Auto Const Mandatory

Armor Property Spacesuit_Miner_Helmet_Lin_NOTPLAYABLE Auto Const Mandatory

Armor Property Spacesuit_Miner_Helmet_Orange_Heller_NOTPLAYABLE Auto Const Mandatory

Quest Property TraitQuest Auto Const Mandatory

Message Property Tutorial_NewGamePlusMSGBox Auto Const Mandatory

Scene Property MQ101_010_BarrettScene2 Auto Const Mandatory

Idle Property IdleTakeWatch Auto Const Mandatory

Scene Property MQ101_013d_ShieldsDownScene Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory

GlobalVariable Property MQ101VascoQuestFollower Auto Const Mandatory

Keyword Property AnimArchetypeFastWalk Auto Const Mandatory

Keyword Property AnimArchetypePlayer Auto Const Mandatory

Scene Property MQ101_VascoShipServicesScene Auto Const Mandatory

ReferenceAlias Property Alias_ShipServicesNPC Auto Const Mandatory

MusicType Property MUSGenesisStingerReveal4PlayerExitsHab Auto Const Mandatory

ObjectReference Property MQ101KreetBossTravelMarker Auto Const Mandatory

ObjectReference Property MQ101KreetBossTravelMarkerLeft Auto Const Mandatory

ObjectReference Property MQ101KreetBossTravelMarkerRight Auto Const Mandatory

ReferenceAlias Property Alias_KreetGuardLeft Auto Const Mandatory

ReferenceAlias Property Alias_KreetGuardRight Auto Const Mandatory

Quest Property MQ00 Auto Const Mandatory

Weapon Property Companion_Eon Auto Const Mandatory

MusicType Property MUSGenesisCombat_MQ101SpaceBattle Auto Const Mandatory

Message Property Tutorial_Inventory05 Auto Const Mandatory

Message Property Tutorial_ShipPower_MSGBox_PC Auto Const Mandatory

ObjectReference Property MQ104B_LinSandbox_CenterMarker Auto Const Mandatory

ObjectReference Property ArtifactNotYetTakenEnableMarker Auto Const Mandatory

GlobalVariable Property ENV_AllowPlayerSuffocation Auto Const Mandatory

LeveledItem Property BarrettShipCaptainsLockerContents Auto Const Mandatory

ReferenceAlias Property Alias_BarrettShipCaptainsLocker Auto Const Mandatory

Location Property SBarnardsStar_PFrost_Orbit Auto Const Mandatory

ObjectReference Property MQ101_BoringCollision Auto Const Mandatory

LocationAlias Property Alias_VectaraLocation Auto Const Mandatory

Perk Property FactionCrimsonFleetPerk Auto Const Mandatory

Perk Property FactionFreestarCollectivePerk Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

Perk Property FactionUnitedColoniesPerk Auto Const Mandatory

Perk Property FactionUnitedColoniesSysDefPerk Auto Const Mandatory

Perk Property FactionUnitedColoniesVanguardPerk Auto Const Mandatory

ActorValue Property SpaceshipRegistration Auto Const Mandatory

Message Property Tutorial_PlanetLandingMSGBox Auto Const Mandatory

GlobalVariable Property MQ101SaveOff Auto Const Mandatory

Perk Property PERK_StarterHome Auto Const Mandatory
