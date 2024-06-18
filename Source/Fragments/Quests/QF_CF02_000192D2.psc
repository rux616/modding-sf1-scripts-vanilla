;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF02_000192D2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(0)

SetStage(100)
Actor PlayerRef = Game.GetPlayer()
int i = 0
While i < DebugPerks.Length
    PlayerRef.AddPerk(DebugPerks[i])
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(0)
SetObjectiveCompleted(100)
SetStage(700)
Alias_CF02_PlayerShip.GetRef().AddItem(Alias_CF02_MedicalSupplies.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(0)

SetObjectiveCompleted(100)
SetStage(450)
SetObjectiveCompleted(610)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(0)

SetObjectiveCompleted(100)
SetStage(450)
SetObjectiveCompleted(610)
SetStage(1200)
alias_CF02_MarineEscort.GetRef().Enable()
Game.GetPlayer().MoveTo(Alias_CF02_TheVigilanceStart.GetRef())
Alias_CF02_Kibwe.GetRef().MoveTo(Alias_CF02_KibweMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE defaultquestchangelocationscript
Quest __temp = self as Quest
defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript
;END AUTOCAST
;BEGIN CODE
;Prep the Key and the Vigilance for debug play
DialogueCFTheKey.Start()
CF_Main.SetStage(0)

SetObjectiveCompleted(100)
SetObjectiveCompleted(1500)
SetStage(1700)
if !GetStageDone(9)
    Game.GetPlayer().MoveTo(Alias_CF02_TheKeyStart.GetRef())
endif
CFKey.SetStage(100)
LC082.SetStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(0)

Game.GetPlayer().MoveTo(LC088_Quickstart_Voss)
CFKey.SetStage(100)
SetObjectiveCompleted(100)
Alias_CF02_Naeva.GetRef().MoveTo(Alias_CF02_NaevaToShinyaMarker.GetRef())
DialogueCFTheKey.SetStage(103)
SetStage(1855)
SetStage(1900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)

Game.GetPlayer().MoveTo(Alias_CF02_DelgadoQS.GetRef())
CFKey.SetStage(200)
LC082.SetStage(12)
SetObjectiveCompleted(100)
SetStage(2000)

Alias_CF02_Naeva.GetRef().MoveTo(Alias_CF02_NaevaToDelgadoMarker.GetRef())
DialogueCFTheKey.SetStage(103)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Alias_CF02_PlayerShip.GetRef().AddItem(Alias_CF02_MedicalSupplies.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Game.GetPlayer().AddPerk(FactionUnitedColoniesSysDefPerk)
Setstage(300)
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
DialogueCFTheKey.SetStage(3)
CF02_1900_Shinya_ChairScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_CF02_EnceladusOrbit.GetLocation().AddKeyword(LocTypeSENotAllowed)
SetStage(100)

Alias_CF02_OpsGuard03.GetActorRef().AddToFaction(CF_TheKey_GenericNPCFaction)
Alias_CF02_OpsGuard04.GetActorRef().AddToFaction(CF_TheKey_GenericNPCFaction)
Alias_CF02_OpsGuard05.GetActorRef().AddToFaction(CF_TheKey_GenericNPCFaction)
Alias_JasmineClashChair.GetRef().SetFactionOwner(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(0)
SetStage(100)
SetStage(200)
SetStage(300)
SetObjectiveCompleted(100)
SetStage(400)
SetStage(450)
SetStage(700)
SetStage(800)
SetObjectiveCompleted(610)
SetStage(1000)
alias_CF02_MarineEscort.GetRef().Enable()
Alias_CF02_Kibwe.GetRef().MoveTo(Alias_CF02_KibweMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
SpaceshipReference RaganaRef = Alias_CF02_TheRaganaShip.GetShipRef()
RaganaRef.SetGhost(true)
RaganaRef.DisableWithTakeOfforLanding()
kmyquest.CF02_Layer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
SpaceshipReference RaganaRef = Alias_CF02_TheRaganaShip.GetShipRef()
RaganaRef.SetGhost(true)
RaganaRef.DisableWithTakeOfforLanding()
kmyquest.CF02_Layer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
CFKey.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_CF02_Naeva.GetRef().MoveTo(Alias_CF02_NaevaTourTeleportMarker.GetRef())
CF02_1800_Naeva_Tour00StartScene.Stop()
CF02_1810_Naeva_Tour01JasmineScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
;Triggered from CF_Main Stage 300
;Checks if any SysDef Objectives are active and kills them

If IsObjectiveDisplayed(1100) == 1
   SetObjectiveDisplayed(1100,0)
   SetStage(1500)
EndIf

If IsObjectiveDisplayed(1150) == 1
   SetObjectiveDisplayed(1150,0)
   SetStage(1500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_CF_CriminalProfiles)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Alias_Reaver.GetRef().DisableNoWait()
Alias_MauraderFurniture.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
Alias_CF02_NaevaOrbitMapMarker.GetRef().Enable()

ObjectReference NaevaShipRef = Alias_CF02_NaevaShip.GetRef()
NaevaShipRef.EnableNoWait()
NaevaShipRef.SetValue(Aggression, 0)

DialogueUCVigilance.SetStage(115)
CFKey_TerminalQuest.Start()
Alias_CF02_EuropaOrbit.GetLocation().AddKeyword(LocTypeSENotAllowed)
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

CF02_110_Naeva_HailScene.Start()
SpaceshipReference NaevaShip = Alias_CF02_NaevaShip.GetShipRef()
NaevaShip.SetValue(DockingPermission, 4)
NaevaShip.SetGhost(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0299_Item_00
Function Fragment_Stage_0299_Item_00()
;BEGIN CODE
if Alias_CF02_TheRaganaShip.GetShipRef() == None
    Alias_CF02_TheRaganaShip.ForceRefTo(Alias_CF02_Enceladus_ArrivalMarker.GetRef().PlaceShipNearMe(CF02_TheRaganaShip))
endif

Alias_CF02_TheRaganaShip.GetShipRef().AddItem(Alias_CF02_MedicalSupplies.GetRef())
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

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
Location EncOrbit = Alias_CF02_EnceladusOrbit.GetLocation()
if Alias_CF02_PlayerShip.GetShipRef().IsInLocation(EncOrbit) 
    SetStage(310)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0309_Item_00
Function Fragment_Stage_0309_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CF02_Layer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CF02_Layer = InputEnableLayer.Create()

kmyquest.CF02_Layer.EnableMenu(false)
kmyquest.CF02_Layer.EnableFastTravel(false)
kmyquest.CF02_Layer.EnableGravJump(false)
kmyquest.CF02_Layer.EnableFarTravel(false)

SetObjectiveCompleted(300)
SetObjectiveDisplayed(310)

if Alias_CF02_TheRaganaShip.GetShipRef() == None
   Alias_CF02_TheRaganaShip.ForceRefTo(Alias_CF02_Enceladus_ArrivalMarker.GetRef().PlaceShipNearMe(CF02_TheRaganaShip))
endif

CF02_Ragana_SpaceEncounter.Start()

SpaceshipReference RaganaShipRef = Alias_CF02_TheRaganaShip.GetShipRef()

RaganaShipRef.MoveNear(Alias_CF02_PlayerShip.GetShipRef())
RaganaShipRef.EnableWithGravJump()
RaganaShipRef.AddItem(Alias_CF02_MedicalSupplies.GetRef())
RaganaShipRef.SetValue(SpaceshipCrew, 5)
SetStage(400)
SetStage(500)

Utility.Wait(2)
CF02_0310_Ragana_HailScene.Start()

CF02_Ragana_SpeechChallenge01.Start()
CF02_Ragana_SpeechChallenge02.Start()
CF02_Ragana_SpeechChallenge03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
CF02_0310_Ragana_HailScene.Stop()
kmyquest.CF02_Layer.Delete()
SetStage(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(310)
SetObjectiveDisplayed(500)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0404_Item_00
Function Fragment_Stage_0404_Item_00()
;BEGIN CODE
SetStage(440)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
SetObjectiveFailed(600)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500, false, false)
SetObjectiveDisplayed(600)
SetObjectiveDisplayed(605)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, CF02SuppliesValue.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
Setstage(610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveFailed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveCompleted(605)
if !GetStageDone(690)
    SetObjectiveDisplayed(610)
endif

float[] offsets = new float[6]
offsets[1] = -5

Alias_CF02_TheRaganaShip.GetRef().PlaceAtMe(CF02_MedicalSuppliesContainer, akOffsetValues=offsets, akAliasToFill=Alias_CF02_CargoContainer)
Alias_CF02_CargoContainer.GetRef().AddItem(Alias_CF02_MedicalSupplies.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0468_Item_00
Function Fragment_Stage_0468_Item_00()
;BEGIN CODE
CF02_0400_Ragana_AcceptHailScene_Action03_Choice05.Send()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
SpaceshipReference RaganaRef = Alias_CF02_TheRaganaShip.GetShipRef()

RaganaRef.SetValue(DockingPermission, 0)
RaganaRef.EvaluatePackage()
SetObjectiveDisplayed(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_CF02_MedicalSupplies.GetRef())
SetObjectiveFailed(600)
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0508_Item_00
Function Fragment_Stage_0508_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CF02_Layer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0509_Item_00
Function Fragment_Stage_0509_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CF02_Layer = InputEnableLayer.Create()

kmyquest.CF02_Layer.EnableFastTravel(false)
kmyquest.CF02_Layer.EnableGravJump(false)
kmyquest.CF02_Layer.EnableFarTravel(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveSkipped(600)
SetObjectiveSkipped(605)
SetObjectiveSkipped(550)

if !GetStageDone(520)
    SetObjectiveDisplayed(501)
endif

Alias_CF02_TheRaganaShip.GetRef().SetValue(DockingPermission, 3)
CF02_Ragana_SpaceEncounter.SetStage(200)

;Temporarily removing escort to see how it plays
;alias_CF02_RaganaEscort.GetShipRef().StartCombat(alias_CF02_playership.GetShipRef())

if !GetStageDone(509)
    kmyquest.CF02_Layer.Delete()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveCompleted(501)
SetObjectiveSkipped(605)
SetObjectiveCompleted(606)
SetObjectiveDisplayed(600, false, false)
CF02_0600_Companion_CommentScene.Start()
Setstage(700)

if BE_CF02_Ragana_BoardingQuest.GetStageDone(60)
    Alias_CF02_TheRaganaShip.GetRef().SetValue(SpaceshipCrew, 0)
endif

CF_Main.SetStage(250)
kmyquest.CF02_Layer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(610)

float[] offsets = new float[6]
offsets[1] = -5

Alias_CF02_TheRaganaShip.GetRef().PlaceAtMe(CF02_MedicalSuppliesContainer, akOffsetValues=offsets, akAliasToFill=Alias_CF02_CargoContainer)
Alias_CF02_CargoContainer.GetRef().AddItem(Alias_CF02_MedicalSupplies.GetRef())
Alias_CF02_CargoContainer.GetRef().AddItem(LL_Aid_Any_Leveled, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveSkipped(605)
Setstage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
SetObjectiveCompleted(610)
If GetStageDone(450) || GetStageDone(420)
    SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveFailed(501)
Alias_CF02_EnceladusOrbit.GetLocation().RemoveKeyword(LocTypeSENotAllowed)

alias_CF02_NaevaShip.GetRef().Enable()

SetObjectiveDisplayed(700)

CF02_600_Companion_CommentScene.Start()

kmyquest.CF02_Layer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN CODE
SpaceshipReference PlayerShipRef = alias_CF02_PlayerShip.GetShipRef()
SpaceshipReference NaevaShipRef = Alias_CF02_NaevaShip.GetRef() as SpaceshipReference

NaevaShipRef.BlockActivation(true, true)
SpaceshipReference Ship01Ref = NaevaShipRef.PlaceShipNearMe(LvlShip_Ecliptic_A_Fighter, 0, 2000, 0, 4, false, false, true, true, Alias_CF02_EclipticShips)
SpaceshipReference Ship02Ref = Ship01Ref.PlaceShipNearMe(LvlShip_Ecliptic_A_Fighter, 0, 4000, 0, 4, false, false, true, true, Alias_CF02_EclipticShips) 
SpaceshipReference Ship03Ref = Ship02Ref.PlaceShipNearMe(LvlShip_Ecliptic_A_Fighter, 0, 8000, 0, 4, false, false, true, true, Alias_CF02_EclipticShips)

Ship01Ref.EnableWithGravJump()
Ship02Ref.EnableWithGravJump()
Ship03Ref.EnableWithGravJump()

CF02_0700_Naeva_CallForHelp.Start()

SetObjectiveSkipped(501)
SetObjectiveFailed(400)
SetObjectiveFailed(500)
SetObjectiveFailed(550)
SetObjectiveFailed(610)

SetObjectiveCompleted(700)
SetObjectiveDisplayed(750)

NaevaShipRef.SetGhost(false)
NaevaShipRef.SetValue(DockingPermission, 4)


if GetStageDone(480)
    SetStage(450)
endif

if GetStageDone(450) && !GetStageDone(520) && !BE_CF02_Ragana_BoardingQuest.GetStageDone(50)
    (LC082 as LC082_brigquestscript).AddPrisoner(Alias_CF02_JustinRake.GetActorRef(),6)
endif

Alias_CF02_EclipticShips.SetValue(Aggression, 2)
Alias_CF02_EclipticShips.StartCombatAll(alias_CF02_PlayerShip.GetShipRef())
BE_CF02_Ragana_BoardingQuest.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN CODE
Alias_CF02_MedicalSupplies.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
SetObjectiveCompleted(750)
SetObjectiveDisplayed(800)
SpaceshipReference NaevaShipRef = Alias_CF02_NaevaShip.GetShipRef()

NaevaShipRef.SetGhost(true)
NaevaShipRef.BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0755_Item_00
Function Fragment_Stage_0755_Item_00()
;BEGIN CODE
SetObjectiveCompleted(750)
SetObjectiveCompleted(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CF02_MedicalSupplies.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CF02_MedicalSupplies.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits,CF02SuppliesValue.GetValueInt())
SetObjectiveCompleted(740)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
;Quest is holding for Player to gather up some cash

SetObjectiveDisplayed(740)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
ObjectReference DoorRef = Alias_CargoBayDoor.GetRef()

DoorRef.SetOpen(False)
DoorRef.SetLockLevel(254)
DoorRef.Lock(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0998_Item_00
Function Fragment_Stage_0998_Item_00()
;BEGIN CODE
Alias_TheKey.GetShipRef().SetValue(DockingPermission, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Alias_TheKey.GetShipRef().SetValue(DockingPermission, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2000)

Alias_ComTriggerKey.EnableAll()

LC030LockLocation.Reset()
CF03.SetStage(10)
Alias_CF02_KibweFurniture01.GetRef().DisableNoWait()
alias_CF02_MarineEscort.GetRef().DisableNoWait()
Game.GetPlayer().AddItem(Clothes_CrimsonFleet_SpacePirate_02)
DialogueCFTheKey.SetStage(10)

;Achievement for Completing Quest
Game.AddAchievement(20)

Alias_JasmineClashChair.GetRef().SetFactionOwner(None)

CF02_Ragana_SpeechChallenge01.Stop()
CF02_Ragana_SpeechChallenge02.Stop()
CF02_Ragana_SpeechChallenge03.Stop()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1000)
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveCompleted(900)

CF_Main.SetStage(10)
Alias_CF02_NaevaOrbitMapMarker.GetRef().Disable()
Alias_CF02_NaevaShip.GetShipRef().DisableWithGravJump()

Alias_CF02_EuropaOrbit.GetLocation().RemoveKeyword(LocTypeSENotAllowed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_02
Function Fragment_Stage_1000_Item_02()
;BEGIN CODE
SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)
alias_CF02_MarineEscort.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1150)
SetObjectiveDisplayed(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1195_Item_00
Function Fragment_Stage_1195_Item_00()
;BEGIN CODE
CF02_1200_Kibwe_ReportScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1150)

Alias_CF02_Kibwe.GetActorRef().SnapIntoInteraction(Alias_CF02_KibweFurniture01.GetRef())
Alias_CF02_Toft.GetRef().MoveTo(Alias_CF02_ToftMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1200)
SetObjectiveDisplayed(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN AUTOCAST TYPE defaultquestchangelocationscript
Quest __temp = self as Quest
defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1200)
SetObjectiveCompleted(1400)
SetObjectiveDisplayed(1500)

;Adding Player to Docking, CF Faction, add CF Perk
CF_Main.SetStage(10)
Alias_CF02_TheKeyMapMarker.GetRef().AddToMapScanned(True)
Alias_CF02_TheKeyMapMarker.GetRef().SetMarkerVisibleOnStarMap(True)
SetStage(998)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1500)
SetObjectiveDisplayed(1600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_01
Function Fragment_Stage_1600_Item_01()
;BEGIN CODE
SetObjectiveCompleted(750)
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_00
Function Fragment_Stage_1700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1500)
SetObjectiveCompleted(1600)
SetObjectiveDisplayed(1700)

Alias_DockingBayActor01.GetActorRef().SetGhost(true)
Alias_DockingBayActor02.GetActorRef().SetGhost(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1795_Item_00
Function Fragment_Stage_1795_Item_00()
;BEGIN CODE
DialogueCFTheKey.SetStage(105)
DialogueCFTheKey.SetStage(106)

ObjectReference DoorRef = Alias_CargoBayDoor.GetRef()

DoorRef.SetLockLevel(0)
DoorRef.Lock(False)
DoorRef.SetOpen(True)

Alias_DockingBayActor01.GetActorRef().SetGhost(false)
Alias_DockingBayActor02.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1796_Item_00
Function Fragment_Stage_1796_Item_00()
;BEGIN CODE
DialogueCFTheKey_EstablishingScene.Stop()
DialogueCFTheKey.SetStage(103)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1700)
SetObjectiveDisplayed(1800)

Alias_ComTriggerKey.DisableAll()

Actor NaevaRef = Alias_CF02_Naeva.GetActorRef()

CF02_1700_Naeva_KeyIntroScene.Stop()
NaevaRef.EvaluatePackage()
CF02_1800_Naeva_Tour00StartScene.Start()
Alias_CF02_Mathis.GetRef().MoveTo(Alias_CF02_MathisMarker.GetRef())
ObjectReference GuardRef = Alias_CF02_OpsGuard05.GetRef()
GuardRef.MoveTo(GuardRef.GetLinkedRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1815_Item_00
Function Fragment_Stage_1815_Item_00()
;BEGIN CODE
Alias_CF02_Naeva.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1855_Item_00
Function Fragment_Stage_1855_Item_00()
;BEGIN CODE
CF02_1850_Naeva_Tour06ShinyaScene.Stop()
Alias_CF02_Naeva.GetActorRef().EvaluatePackage()

If Game.GetPlayer().GetDistance(Alias_CF02_Shinya.GetRef()) < 3
    CF02_1900_Shinya_IntroScene.Start()
endif
SetStage(1900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1860_Item_00
Function Fragment_Stage_1860_Item_00()
;BEGIN CODE
CF02_1860_Naeva_DoorAnnouncementScene.Start()
CFKey.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1870_Item_00
Function Fragment_Stage_1870_Item_00()
;BEGIN CODE
Alias_CF02_OpsGuard05.GetActorRef().EvaluatePackage()
Alias_CF02_Jasmine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1875_Item_00
Function Fragment_Stage_1875_Item_00()
;BEGIN CODE
Alias_CF02_Shinya.GetActorRef().SnapIntoInteraction(Alias_CF02_ShinyaChair.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1876_Item_00
Function Fragment_Stage_1876_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CF02_Layer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1885_Item_00
Function Fragment_Stage_1885_Item_00()
;BEGIN CODE
CF02_1885_Naeva_CalloutScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1890_Item_00
Function Fragment_Stage_1890_Item_00()
;BEGIN CODE
Alias_CF02_Naeva.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1895_Item_00
Function Fragment_Stage_1895_Item_00()
;BEGIN CODE
CF02_1895_Naeva_Tour11DelgadoIntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1898_Item_00
Function Fragment_Stage_1898_Item_00()
;BEGIN CODE
;Actor NaevaRef = Alias_CF02_Naeva.GetActorRef()
;NaevaRef.MoveTo(Alias_CF02_NaevaToOperationsMarker01.GetRef())
;NaevaRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1899_Item_00
Function Fragment_Stage_1899_Item_00()
;BEGIN AUTOCAST TYPE cf02_layerscript
Quest __temp = self as Quest
cf02_layerscript kmyQuest = __temp as cf02_layerscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CF02_Layer = InputEnableLayer.Create()

kmyquest.CF02_Layer.DisablePlayerControls(abMovement = false, abMenu = true, abActivate = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1900_Item_00
Function Fragment_Stage_1900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1800)
SetObjectiveDisplayed(1900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1900)
SetObjectiveDisplayed(2000)
SetStage(1860)
DialogueCFTheKey.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CF02_Ragana_SpaceEncounter Auto Const Mandatory

ReferenceAlias Property Alias_CF02_MedicalSupplies Auto Const Mandatory

ReferenceAlias Property Alias_CF02_TheRaganaShip Auto Const Mandatory

ReferenceAlias Property Alias_CF02_NaevaDelgadoSceneTrigger Auto Const Mandatory

ReferenceAlias Property Alias_CF02_NaevaOperationsSceneTrigger Auto Const Mandatory

Scene Property CF02_110_Naeva_HailScene Auto Const Mandatory

Scene Property CF02_310_Ragana_HailScene Auto Const Mandatory

MiscObject Property CF02_MedicalSupplies Auto Const Mandatory

ReferenceAlias Property Alias_CF02_CargoContainer Auto Const Mandatory

Container Property CF02_MedicalSuppliesContainer Auto Const Mandatory

ReferenceAlias Property Alias_CF02_NaevaOrbitMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF02_Naeva Auto Const Mandatory

ReferenceAlias Property Alias_CF02_NaevaIntroMarker Auto Const Mandatory

Scene Property CF02_1800_Naeva_Tour00StartScene Auto Const Mandatory

ReferenceAlias Property Alias_CF02_NaevaToElevator Auto Const Mandatory

Scene Property CF02_1810_Naeva_Tour01JasmineScene Auto Const Mandatory

Scene Property CF02_1830_Naeva_Tour03ZuriScene Auto Const Mandatory

ReferenceAlias Property Alias_CF02_JasmineSpeaker Auto Const Mandatory

Scene Property CF02_1840_Naeva_Tour04TradeAuthorityScene Auto Const Mandatory

Scene Property CF02_1845_Naeva_Tour05ClinicScene Auto Const Mandatory

Scene Property CF02_1850_Naeva_Tour06ShinyaScene Auto Const Mandatory

ReferenceAlias Property Alias_CF02_JasmineAnnouncementSceneTrigger Auto Const Mandatory

Scene Property CF02_1860_Naeva_DoorAnnouncementScene Auto Const Mandatory

ReferenceAlias Property Alias_CF02_TheKeyStart Auto Const Mandatory

Scene Property CF02_1820_Naeva_Tour02DepotScene Auto Const Mandatory

Quest Property CFKey Auto Const Mandatory

ReferenceAlias Property Alias_CF02_NaevaToDelgadoMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF02_NaevaUpperElevatorMarker Auto Const Mandatory

Scene Property CF02_1895_Naeva_Tour11DelgadoIntroScene Auto Const Mandatory

Quest Property CF03 Auto Const Mandatory

Scene Property CF02_600_Companion_CommentScene Auto Const Mandatory

ReferenceAlias Property Alias_CF02_TheVigilanceStart Auto Const Mandatory

Quest Property LC082 Auto Const Mandatory

Scene Property CF02_1885_Naeva_CalloutScene Auto Const Mandatory

ReferenceAlias Property Alias_CF02_Mathis Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_CF02_NaevaToShinyaMarker Auto Const Mandatory

Faction Property CrimsonFleetFaction Auto Const Mandatory

Faction Property UCSysDefFaction Auto Const Mandatory

ReferenceAlias Property Alias_CF02_NaevaShip Auto Const

ReferenceAlias Property alias_CF02_MarineEscort Auto Const

LeveledItem Property LL_Loot_Mfg_Any_Same_Stack Auto Const Mandatory

Quest Property DialogueCFTheKey Auto Const Mandatory

ObjectReference Property LC088_Quickstart_Voss Auto Const Mandatory

SpaceshipBase Property LvlShip_Ecliptic_A_Fighter Mandatory Const Auto

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_CF02_Aludra Auto Const Mandatory

ReferenceAlias Property Alias_CF02_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_CF02_RaganaEscort Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory

ReferenceAlias Property Alias_CF02_Delgado Auto Const Mandatory

ReferenceAlias Property Alias_CF02_TheKeyMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF02_DelgadoQS Auto Const Mandatory

Scene Property CF02_0600_Companion_CommentScene Auto Const Mandatory

LeveledItem Property LL_Aid_Any_Leveled Auto Const Mandatory

Scene Property CF02_0700_Naeva_CallForHelp Auto Const Mandatory

RefCollectionAlias Property Alias_CF02_EclipticShips Auto Const Mandatory

ObjectReference Property CF02_NaevaTeleportMarkerREF Auto Const Mandatory

ReferenceAlias Property Alias_CF02_JustinRake Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

Keyword Property BE_CF02_RaganaShipKeyword Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

Quest Property BE_CF02_Ragana_BoardingQuest Auto Const Mandatory

Quest Property CF02_Ragana_SpeechChallenge01 Auto Const Mandatory

Quest Property CF02_Ragana_SpeechChallenge02 Auto Const Mandatory

Quest Property CF02_Ragana_SpeechChallenge03 Auto Const Mandatory

Quest Property CF02_Ragana_SpeechChallenge04 Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_CF02_ShinyaChair Auto Const Mandatory

ReferenceAlias Property Alias_CF02_Shinya Auto Const Mandatory

GlobalVariable Property CF02SuppliesValue Auto Const Mandatory

GlobalVariable Property CF02RaganaValue Auto Const Mandatory

Scene Property CF02_1700_Naeva_KeyIntroScene Auto Const Mandatory

Perk[] Property DebugPerks Auto Const Mandatory

ReferenceAlias Property Alias_CF02_TheVigilanceShip Auto Const Mandatory

ReferenceAlias Property Alias_CF02_KibweFurniture01 Auto Const Mandatory

ReferenceAlias Property Alias_CF02_Kibwe Auto Const Mandatory

ReferenceAlias Property Alias_CF02_Toft Auto Const Mandatory

ReferenceAlias Property Alias_CF02_ToftMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF02_KibweMarker Auto Const Mandatory

Perk Property FactionUnitedColoniesSysDefPerk Auto Const Mandatory

Quest Property DialogueUCVigilance Auto Const Mandatory

Keyword Property LocTypeSENotAllowed Auto Const Mandatory

LocationAlias Property Alias_CF02_EnceladusOrbit Auto Const Mandatory

ReferenceAlias Property Alias_CF02_NaevaToOperationsMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_CF02_DelgadoStanding Auto Const Mandatory

Scene Property DialogueCFTheKey_EstablishingScene Auto Const Mandatory

ReferenceAlias Property Alias_CF08_NaevaSurrenderWaitMarker Auto Const Mandatory

ReferenceAlias Property Alias_SysDefPatrolLink Auto Const Mandatory

ReferenceAlias Property Alias_MarinePatrol Auto Const Mandatory

ReferenceAlias Property Alias_SysDefRecruit Auto Const Mandatory

ReferenceAlias Property Alias_SysDefHallway Auto Const Mandatory

Armor Property Clothes_CrimsonFleet_SpacePirate_02 Auto Const Mandatory

Scene Property CF02_1900_Shinya_ChairScene Auto Const Mandatory

LeveledItem Property LL_CF_CriminalProfiles Auto Const Mandatory

Quest Property CFKey_TerminalQuest Auto Const Mandatory

ReferenceAlias Property Alias_CF02_NaevaTourTeleportMarker Auto Const Mandatory

RefCollectionAlias Property Alias_ComTriggerKey Auto Const Mandatory

ReferenceAlias Property Alias_CF02_Enceladus_ArrivalMarker Auto Const Mandatory

Scene Property CF02_0310_Ragana_HailScene Auto Const Mandatory

Scene Property CF02_1900_Shinya_IntroScene Auto Const Mandatory

ReferenceAlias Property Alias_CF02_MathisMarker Auto Const Mandatory

ReferenceAlias Property Alias_Reaver Auto Const Mandatory

ReferenceAlias Property Alias_MauraderFurniture Auto Const Mandatory

SpaceshipBase Property CF02_TheRaganaShip Auto Const Mandatory

ReferenceAlias Property Alias_CargoBayDoor Auto Const Mandatory

Location Property LC030LockLocation Auto Const Mandatory

Scene Property CF02_1200_Kibwe_ReportScene Auto Const Mandatory

ReferenceAlias Property Alias_DockingBayActor01 Auto Const Mandatory

ReferenceAlias Property Alias_DockingBayActor02 Auto Const Mandatory

ReferenceAlias Property Alias_CF02_OpsGuard01 Auto Const Mandatory

ReferenceAlias Property Alias_CF02_OpsGuard02 Auto Const Mandatory

ReferenceAlias Property Alias_CF02_OpsGuard03 Auto Const Mandatory

ReferenceAlias Property Alias_CF02_OpsGuard04 Auto Const Mandatory

ReferenceAlias Property Alias_CF02_OpsGuard05 Auto Const Mandatory

Faction Property CF_TheKey_GenericNPCFaction Auto Const Mandatory

AffinityEvent Property CF02_0400_Ragana_AcceptHailScene_Action03_Choice05 Auto Const Mandatory

ReferenceAlias Property Alias_JasmineClashChair Auto Const Mandatory

LocationAlias Property Alias_CF02_EuropaOrbit Auto Const Mandatory

ReferenceAlias Property Alias_CF02_Jasmine Auto Const Mandatory

ReferenceAlias Property Alias_TheKey Auto Const Mandatory
