;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_MS02_0204E13A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;----------------------------- STAGE 0 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;----------------------------- STAGE 5 -----------------------------

;Start Quest

ShipChair.BlockActivation(True, True)

 ObjectReference Opal = Alias_Opal.GetRef()
 ObjectReference Sawyer = Alias_Sawyer.GetRef()

 Actor OpalAct = Alias_Opal.GetActorReference()
 Actor SawyerAct = Alias_Sawyer.GetActorReference()

  SawyerAct.SetEssential(True)
  OpalAct.SetEssential(True)

   

Opal.MoveTo(OpalAPMarker.GetRef())
Sawyer.MoveTo(SawyerAPMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
;----------------------------- DEBUG -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;----------------------------- STAGE 10 -----------------------------

;DEBUG: Teleport to Sawyer and Opal before party

ShipChair.BlockActivation(True, True)

 ObjectReference Opal = Alias_Opal.GetRef()
 ObjectReference Sawyer = Alias_Sawyer.GetRef()

Opal.MoveTo(OpalAPMarker.GetRef())
Sawyer.MoveTo(SawyerAPMarker.GetRef())

game.getplayer().moveto(pass1playerstartmarker)

;DEBUG: Stage Setup
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;----------------------------- STAGE 20 -----------------------------

;DEBUG: Teleport player to ship after drinking with Sawyer and Opal
;DEBUG: Stage Setup
 SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;----------------------------- STAGE 50 -----------------------------

;DEBUG: Teleport Player to ship
 ObjectReference PlayerCOCShipMarker = Alias_PlayerCOCShipMarker.GetRef()
   Game.GetPlayer().Moveto(PlayerCOCShipMarker)


ShipDecor.BlockActivation(True,True)

;DEBUG: Stage Setup
 SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;----------------------------- STAGE 60 -----------------------------

;DEBUG: Teleport Player to ship
 ObjectReference PlayerCOCShipMarker = Alias_PlayerCOCShipMarker.GetRef()
   Game.GetPlayer().Moveto(PlayerCOCShipMarker)


ShipDecor.BlockActivation(True,True)

;DEBUG: Stage Setup
 SetStage(480)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;----------------------------- STAGE 80 -----------------------------

;DEBUG: Teleport Player to ship
 ObjectReference PlayerCOCShipMarker = Alias_PlayerCOCShipMarker.GetRef()
   Game.GetPlayer().Moveto(PlayerCOCShipMarker)


ShipDecor.BlockActivation(True,True)

;DEBUG: Stage Setup
 SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;----------------------------- STAGE 90 -----------------------------

;DEBUG: Teleport Player to ship
 ObjectReference PlayerCOCShipMarker = Alias_PlayerCOCShipMarker.GetRef()
   Game.GetPlayer().Moveto(PlayerCOCShipMarker)


ShipDecor.BlockActivation(True,True)

;DEBUG: Stage Setup
 SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;----------------------------- STAGE 95 -----------------------------

;DEBUG: Teleport Player to ship
 ObjectReference PlayerCOCShipMarker = Alias_PlayerCOCShipMarker.GetRef()
   Game.GetPlayer().Moveto(PlayerCOCShipMarker)


ShipDecor.BlockActivation(True,True)

;DEBUG: Stage Setup
 SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0096_Item_00
Function Fragment_Stage_0096_Item_00()
;BEGIN CODE
;----------------------------- STAGE 96 -----------------------------

;DEBUG: Teleport Player to ship
 ObjectReference PlayerCOCShipMarker = Alias_PlayerCOCShipMarker.GetRef()
   Game.GetPlayer().Moveto(PlayerCOCShipMarker)


ShipDecor.BlockActivation(True,True)

;DEBUG: Stage Setup
 SetStage(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
;----------------------------- PHASE 1 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;----------------------------- STAGE 100 -----------------------------

;Stage Setup
SetStage(101)
FirstChair.BlockActivation(True, True)
APChair02.BlockActivation(True,True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
;----------------------------- STAGE 101 -----------------------------

SFFL_MS02_101.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;----------------------------- STAGE 150 -----------------------------
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN CODE
FirstChair.BlockActivation(False, False)

SetObjectiveCompleted(150)
SetObjectiveDisplayed(165)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0167_Item_00
Function Fragment_Stage_0167_Item_00()
;BEGIN CODE
SetObjectiveCompleted(165)


ObjectReference Opal = Alias_Opal.GetRef()
ObjectReference Sawyer = Alias_Sawyer.GetRef()

Opal.IgnoreFriendlyHits(True)
Sawyer.IgnoreFriendlyHits(True)

SawBase.SetEssential(true)
OpalBase.SetEssential(true)

SFFL_MS02_167.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
; Enable First Drink

Objectreference Drink01 = Alias_Drink01.GetRef()
Drink01.Enable()

SetObjectiveDisplayed(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170)

Objectreference Drink01 = Alias_Drink01.GetRef()

Drink01.Disable()

SFFL_MS02_0175.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
Objectreference Drink02 = Alias_Drink02.GetRef()
Drink02.Enable()

SetObjectiveDisplayed(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0185_Item_00
Function Fragment_Stage_0185_Item_00()
;BEGIN CODE
Objectreference Drink02 = Alias_Drink02.GetRef()
Drink02.Disable()

DrinkingIM.Apply(1)
Drink002.Play(Game.GetPlayer())
SetObjectiveCompleted(180)
SFFL_MS02_0185.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
Objectreference Drink03 = Alias_Drink03.GetRef()
Drink03.Enable()

SetObjectiveDisplayed(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
Objectreference Drink03 = Alias_Drink03.GetRef()
Drink03.Disable()

DrinkingIM.Apply(2)
Drink003.Play(Game.GetPlayer())
SetObjectiveCompleted(190)
SFFL_MS02_0195.Start()
Utility.Wait(7)
DrinkingIM.Apply(4)
Utility.Wait(7)
DrinkingIM.Apply(6)
Utility.Wait(6)
DrinkingIM.Apply(8)
Utility.Wait(2)
FadeOut.Apply()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0199_Item_00
Function Fragment_Stage_0199_Item_00()
;BEGIN CODE
;----------------------------- PHASE 2 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;----------------------------- STAGE 200 -----------------------------

 ObjectReference Opal = Alias_Opal.GetRef()
 ObjectReference Sawyer = Alias_Sawyer.GetRef()
 ObjectReference Opal02 = Alias_OpalParty.GetRef()
 ObjectReference Sawyer02 = Alias_SawyerParty.GetRef()





SecondDoor.SetOpen()

APChair02.BlockActivation(False, False)

ObjectReference SawyerShip = Alias_SawyersShip.GetRef()
SawyerShip.Enable()

DrinkingIM.Remove()

;Teleport Player, Opal, and Sawyer to the ship

 Actor OpalAct = Alias_Opal.GetActorReference()
 Actor SawyerAct = Alias_Sawyer.GetActorReference()

Opal.IgnoreFriendlyHits(False)
Sawyer.IgnoreFriendlyHits(False)

  OpalAct.ResetHealthAndLimbs()
  SawyerAct.ResetHealthAndLimbs()

  SawyerAct.SetEssential(False)
  OpalAct.SetEssential(False)

 ;Alias_SawyerParty.ForceRefTo(SawyerAct)
 ;Alias_OpalParty.ForceRefTo(OpalAct)

ShipDecor.BlockActivation(True,True)

ShipDoor.BlockActivation(True,True)

ExitDoor.BlockActivation(True, True)


 Actor Opal01 = Alias_Opal.GetActorRef()
 Actor Sawyer01 = Alias_Sawyer.GetActorRef()

 Opal01.SetProtected(False)
 Sawyer01.SetProtected(False)

Opal.MoveTo(OpalShipMarker)
Sawyer.MoveTo(SawyerShipMarker)

Alias_PartyNPCs.AddRef(Opal)
Alias_PartyNPCs.AddRef(Sawyer)

ObjectReference PlayerCOCShipMarker = Alias_PlayerCOCShipMarker.GetRef()

Game.GetPlayer().Moveto(PlayerCOCShipMarker)

ObjectReference Com = Alias_Companion.GetRef()

Com.MoveTo(CompanionMarker)

WakeUp01.Play(Game.GetPlayer())

FadeIn.Apply(1)

DrinkingIM.Apply(1)

SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
MusicMarker.Enable()
Cheer.Play(Game.GetPlayer())
DanceMarker01.Enable()
DanceMarker02.Enable()
DanceMarker03.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;----------------------------- STAGE 210 -----------------------------

;Random number to force greet Opal or Sawyer

If (GetStageDone(660) == 0)

Int OpalOrSawyerInt = Utility.RandomInt(1,2)

OpalOrSawyer.SetValue(OpalOrSawyerInt)
;Sawyer's Scene
if (OpalOrSawyer.GetValue() == 1)
SFFL_MS02_0210A_SAWYER.Start()
EndIf

;Opal's Scene
if (OpalOrSawyer.GetValue() == 2)
SFFL_MS02_0210B_OPAL.Start()
EndIf

EndIf

 ObjectReference Opal = Alias_Opal.GetRef()
 ObjectReference Sawyer = Alias_Sawyer.GetRef()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
setstage(252)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;----------------------------- STAGE 250 -----------------------------

SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)
SetStage(252)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0299_Item_00
Function Fragment_Stage_0299_Item_00()
;BEGIN CODE
;----------------------------- PHASE 3 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;----------------------------- STAGE 300 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0455_Item_00
Function Fragment_Stage_0455_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(455)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
;----------------------------- STAGE 470 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
;----------------------------- STAGE 475 -----------------------------

SFFL_MS02_475.start()

SetObjectiveDisplayed(475)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
;----------------------------- STAGE 480 -----------------------------

if (IsObjectiveDisplayed(200) == 1)
SetObjectiveFailed(200)
EndIf
if (IsObjectiveDisplayed(475) == 1)
SetObjectiveCompleted(475)
EndIf

SetObjectiveDisplayed(480)


CooperFightMarker.Enable()
SadieFightMarker.Enable()

SFFL_MS02_480.Start()

SetStage(499)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0485_Item_00
Function Fragment_Stage_0485_Item_00()
;BEGIN CODE
MusicMarker.Disable()
DanceMarker01.Disable()
DanceMarker02.Disable()
DanceMarker03.Disable()
DanceMarker04.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;----------------------------- STAGE 500 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0599_Item_00
Function Fragment_Stage_0599_Item_00()
;BEGIN CODE
;----------------------------- PHASE 4 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;----------------------------- STAGE 600 -----------------------------

If isObjectiveDisplayed(200)
  SetObjectiveFailed(200)
EndIf


If isObjectiveDisplayed(252)
  SetObjectiveFailed(252)
EndIf


If isObjectiveDisplayed(455)
  SetObjectiveFailed(455)
EndIf

If isObjectiveDisplayed(475)
  SetObjectiveFailed(475)
EndIf

If isObjectiveDisplayed(480)
  SetObjectiveFailed(480)
EndIf

If isObjectiveDisplayed(950)
  SetObjectiveFailed(950)
EndIf

;Party turns against the Player
Actor Guest01 = Alias_PartyGuest01.GetActorRef()
Actor Guest02 = Alias_PartyGuest02.GetActorRef()
Actor Guest03 = Alias_PartyGuest03.GetActorRef()
Actor Guest04 = Alias_PartyGuest04.GetActorRef()
Actor Opal = Alias_Opal.GetActorRef()
Actor Cooper = Alias_Cooper.GetActorRef()
Actor Sawyer = Alias_Sawyer.GetActorRef()
Actor Wren = Alias_Wren.GetActorRef()
Actor Sadie = Alias_Sadie.GetActorRef()

Cooper.SetProtected(False)
Wren.SetProtected(False)
Opal.SetProtected(False)
Sawyer.SetProtected(False)
Sadie.SetProtected(False)

Cooper.RemoveFromFaction(PartyFaction)
Cooper.Addtofaction(EnemyFaction)
Sawyer.RemoveFromFaction(PartyFaction)
Sawyer.Addtofaction(EnemyFaction)
Wren.RemoveFromFaction(PartyFaction)
Wren.Addtofaction(EnemyFaction)
Sadie.RemoveFromFaction(PartyFaction)
Sadie.Addtofaction(EnemyFaction)
Opal.RemoveFromFaction(PartyFaction)
Opal.Addtofaction(EnemyFaction)
Guest01.RemoveFromFaction(PartyFaction)
Guest01.Addtofaction(EnemyFaction)
Guest02.RemoveFromFaction(PartyFaction)
Guest02.Addtofaction(EnemyFaction)
Guest03.RemoveFromFaction(PartyFaction)
Guest03.Addtofaction(EnemyFaction)
Guest04.RemoveFromFaction(PartyFaction)
Guest04.Addtofaction(EnemyFaction)

Wren.StartCombat(Game.GetPlayer())
Sadie.StartCombat(Game.GetPlayer())
Cooper.StartCombat(Game.GetPlayer())
Sawyer.StartCombat(Game.GetPlayer())
Opal.StartCombat(Game.GetPlayer())
Guest01.StartCombat(Game.GetPlayer())
Guest02.StartCombat(Game.GetPlayer())
Guest03.StartCombat(Game.GetPlayer())
Guest04.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
;Stop Combat Alarm

Alias_PartyNPCs.StopCombat()
Alias_PartyNPCs.StopCombatAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;----------------------------- STAGE 650 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
Actor Opal = Alias_OpalParty.GetActorReference()
Actor Sawyer = Alias_SawyerParty.GetActorReference()

If isObjectiveDisplayed(200)
  SetObjectiveFailed(200)
EndIf


If isObjectiveDisplayed(252)
  SetObjectiveFailed(252)
EndIf


If isObjectiveDisplayed(455)
  SetObjectiveFailed(455)
EndIf

If isObjectiveDisplayed(475)
  SetObjectiveFailed(475)
EndIf

If isObjectiveDisplayed(480)
  SetObjectiveFailed(480)
EndIf

If isObjectiveDisplayed(950)
  SetObjectiveFailed(950)
EndIf

;Add an actor ref for each party member
;Then make a section for them that is combat target or killer
Actor Cooper = Alias_Cooper.GetActorReference()
Actor Sadie = Alias_Sadie.GetActorReference()
Actor Wren = Alias_Wren.GetActorReference()
Actor PG1 = Alias_PartyGuest01.GetActorReference()
Actor PG2 = Alias_PartyGuest02.GetActorReference()
Actor PG3 = Alias_PartyGuest03.GetActorReference()
Actor PG4 = Alias_PartyGuest04.GetActorReference()

;OPAL

if (Opal.getcombattarget() == Game.GetPlayer())
SetStage(600)
EndIf
if (Opal.GetKiller() == Game.GetPlayer())
SetStage(600)
EndIf

;SAWYER

if (Sawyer.getcombattarget() == Game.GetPlayer())
SetStage(600)
EndIf
if (Sawyer.GetKiller() == Game.GetPlayer())
SetStage(600)
EndIf

;COOPER

if (Cooper.getcombattarget() == Game.GetPlayer())
SetStage(600)
EndIf
if (Cooper.GetKiller() == Game.GetPlayer())
SetStage(600)
EndIf

;SADIE

if (Sadie.getcombattarget() == Game.GetPlayer())
SetStage(600)
EndIf
if (Sadie.GetKiller() == Game.GetPlayer())
SetStage(600)
EndIf

;WREN

if (Wren.getcombattarget() == Game.GetPlayer())
SetStage(600)
EndIf
if (Wren.GetKiller() == Game.GetPlayer())
SetStage(600)
EndIf

;PARTY GUEST 01

if (PG1.getcombattarget() == Game.GetPlayer())
SetStage(600)
EndIf
if (PG1.GetKiller() == Game.GetPlayer())
SetStage(600)
EndIf

;PARTY GUEST 02

if (PG2.getcombattarget() == Game.GetPlayer())
SetStage(600)
EndIf
if (PG2.GetKiller() == Game.GetPlayer())
SetStage(600)
EndIf

;PARTY GUEST 03

if (PG3.getcombattarget() == Game.GetPlayer())
SetStage(600)
EndIf
if (PG3.GetKiller() == Game.GetPlayer())
SetStage(600)
EndIf

;PARTY GUEST 04

if (PG4.getcombattarget() == Game.GetPlayer())
SetStage(600)
EndIf
if (PG4.GetKiller() == Game.GetPlayer())
SetStage(600)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;----------------------------- STAGE 800 -----------------------------

If isObjectiveDisplayed(200)
  SetObjectiveFailed(200)
EndIf


If isObjectiveDisplayed(252)
  SetObjectiveFailed(252)
EndIf


If isObjectiveDisplayed(455)
  SetObjectiveFailed(455)
EndIf

If isObjectiveDisplayed(475)
  SetObjectiveFailed(475)
EndIf

If isObjectiveDisplayed(480)
  SetObjectiveFailed(480)
EndIf

If isObjectiveDisplayed(950)
  SetObjectiveFailed(950)
EndIf

SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0899_Item_00
Function Fragment_Stage_0899_Item_00()
;BEGIN CODE
;----------------------------- PHASE 5 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
;----------------------------- STAGE 900 -----------------------------

SawyerShipCell.EnableFastTravel()

If (IsObjectiveDisplayed(250) == 0)

SetObjectiveDisplayed(250)

EndIf


ShipDecor.BlockActivation(False, False)
ShipChair.BlockActivation(false, false)
ExitDoor.BlockActivation(false, false)
ShipDoor.BlockActivation(false, false)
ShipDoor.SetLockLevel(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
;----------------------------- STAGE 920 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
;----------------------------- STAGE 950 -----------------------------


if (IsObjectiveDisplayed(480) == 1)
SetObjectiveCompleted(480)
EndIf

if (IsObjectiveDisplayed(455) == 1)
SetObjectiveCompleted(455)
EndIf

CooperFightMarker.Disable()
SadieFightMarker.Disable()

SetObjectiveDisplayed(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0952_Item_00
Function Fragment_Stage_0952_Item_00()
;BEGIN CODE
; Remove Opal's Note from player inventory

Game.GetPlayer().RemoveItem(OpalNote, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0955_Item_00
Function Fragment_Stage_0955_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0960_Item_00
Function Fragment_Stage_0960_Item_00()
;BEGIN CODE
;----------------------------- STAGE 960 -----------------------------
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0975_Item_00
Function Fragment_Stage_0975_Item_00()
;BEGIN CODE
;----------------------------- STAGE 975 -----------------------------

Utility.Wait(1)

FadeOut.Apply()

MusicMarker.Disable()

;Move Player back to Anchorpoint

Game.GetPlayer().MoveTo(AnchorpointMarker)
Utility.Wait(1)
Fadeout.Remove()
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Alias_PartyNpcs.DisableAll()

ObjectReference Opal = Alias_Opal.GetRef()

Opal.Disable()

ShipDoor.BlockActivation(False, False)

Utility.Wait(1)

SFFL_MS02_0975_COMPANION.Start()

Utility.Wait(4)

SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
;----------------------------- END QUEST -----------------------------

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PlayerCOCShipMarker Auto Const

ObjectReference Property Pass1PlayerStartMarker Auto Const

ObjectReference Property StartTable Auto Const

ReferenceAlias Property Alias_Opal Auto Const

ReferenceAlias Property Alias_Sawyer Auto Const

Idle Property Drink Auto Const

Scene Property SFFL_MS02_167 Auto Const

Scene Property SFFL_MS02_101 Auto Const

ImageSpaceModifier Property DrinkingIM Auto Const

ObjectReference Property OpalShipMarker Auto Const

ObjectReference Property SawyerShipMarker Auto Const

Scene Property SFFL_MS02_475 Auto Const

Scene Property SFFL_MS02_480 Auto Const

ReferenceAlias Property Alias_PartyGuest01 Auto Const

ReferenceAlias Property Alias_PartyGuest02 Auto Const

ReferenceAlias Property Alias_PartyGuest03 Auto Const

ReferenceAlias Property Alias_PartyGuest04 Auto Const

ReferenceAlias Property Alias_Cooper Auto Const

ReferenceAlias Property Alias_Sadie Auto Const

ReferenceAlias Property Alias_Wren Auto Const

Faction Property enemyFaction Auto Const

Faction Property PartyFaction Auto Const

ObjectReference Property ShipChair Auto Const

Message Property SFFL_MS02_LeaveMessage Auto Const

Book Property OpalNote Auto Const

ReferenceAlias Property OpalAPMarker Auto Const

ReferenceAlias Property SawyerAPMarker Auto Const

ReferenceAlias Property Alias_Drink01 Auto Const

ReferenceAlias Property Alias_Drink02 Auto Const

ReferenceAlias Property Alias_Drink03 Auto Const

Scene Property SFFL_MS02_0175 Auto Const

Scene Property SFFL_MS02_0185 Auto Const

Scene Property SFFL_MS02_0195 Auto Const

ObjectReference Property AnchorpointMarker Auto Const

ObjectReference Property MusicMarker Auto Const

WwiseEvent Property Cheer Auto Const

WwiseEvent Property Drink001 Auto Const

WwiseEvent Property Drink002 Auto Const

WwiseEvent Property Drink003 Auto Const

WwiseEvent Property WakeUp01 Auto Const

ObjectReference Property ExitDoor Auto Const

ObjectReference Property DanceMarker01 Auto Const

ObjectReference Property DanceMarker02 Auto Const

ObjectReference Property ShipDecor Auto Const

ObjectReference Property DanceMarker03 Auto Const

ObjectReference Property DanceMarker04 Auto Const

ImageSpaceModifier Property DrinkingIM02 Auto Const

ImageSpaceModifier Property FadeIn Auto Const

ImageSpaceModifier Property FadeOut Auto Const

ReferenceAlias Property Alias_SawyersShip Auto Const Mandatory

ObjectReference Property CompanionMarker Auto Const

ReferenceAlias Property Alias_companion Auto Const Mandatory

ObjectReference Property SadieFightMarker Auto Const

ObjectReference Property CooperFightMarker Auto Const

Scene Property SFFL_MS02_0975_COMPANION Auto Const

GlobalVariable Property OpalOrSawyer Auto Const

ObjectReference Property ShipDoor Auto Const

ObjectReference Property FirstChair Auto Const

Actor Property OpalActor Auto Const

Scene Property SFFL_MS02_0210A_SAWYER Auto Const

Scene Property SFFL_MS02_0210B_OPAL Auto Const

ObjectReference Property SecondDoor Auto Const

Cell Property SawyerShipCell Auto Const

ReferenceAlias Property Alias_SawyerParty Auto Const

ReferenceAlias Property Alias_OpalParty Auto Const

RefCollectionAlias Property Alias_PartyNPCs Auto Const Mandatory

ReferenceAlias Property Alias_Terminal Auto Const Mandatory

ObjectReference Property ExitDoor02 Auto Const

ObjectReference Property APChair02 Auto Const

ActorBase Property OpalBase Auto Const

ActorBase Property SawBase Auto Const
