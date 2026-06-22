;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ104B_0001638D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ102.SetStage(1150)
MQ101.SetStage(1810)
Game.GetPlayer().moveto(MQ104BStart001)
Game.GetPlayer().additem(Credits, 1000)
Game.GetPlayer().AddPerk(OutpostEngineering)
Game.GetPlayer().AddPerk(InformationSystems)
Game.GetPlayer().AddPerk(TraitEmpath)
Game.GetPlayer().AddPerk(Medicine)
Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)

Alias_Lin.GetActorRef().moveto(MQ104BLinTravelMarker)
Alias_DoorToSensorArray.GetRef().Disable()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)

Game.GetPlayer().moveto(Alias_HellerCrashStartMarker.GetRef())
Game.GetPlayer().additem(Credits, 1000)
SetStage(5)
SetStage(110)
SetStage(115)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)

Game.GetPlayer().moveto(MQ104B_BarrettDungeonStart)
Game.GetPlayer().additem(Credits, 10000)
Game.GetPlayer().AddPerk(Medicine)
Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk)

;give player a ship
Frontier_ModularREF.moveto(MQ104BBarrettDungeonLandingMarker)
Frontier_ModularREF.setlinkedref(MQ104BBarrettDungeonLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)


SetStage(5)
SetStage(130)
SetStage(132)

MQ104B_BarrettCell_EnableMaker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Actor HellerREF = Alias_Heller.GetActorRef()

;allow landing at Vectera again
Alias_VecteraMapMarker.GetRef().Enable()

;set up the state change on Vectera
VecteraExteriorNPCEnableMarker001.Disable()
VecteraInteriorNPCEnableMarker.Disable()
HellerREF.moveto(Alias_HellerWoundedMArker.GetRef())
HellerREF.SetGhost()
HellerREF.AddtoFaction(CaptiveFaction)
Alias_Barrett.GetActorRef().moveto(MQ104B_BarrettMovetoMarker)

;make sure door to Barret dungeon is open
Alias_BarrettDungeonDoor.GetRef().Lock(False)

Alias_CommsComputer.GetRef().Enable()
Alias_CommsComputer.GetRef().BlockActivation(True, True)

Alias_Lin.GetActorRef().moveto(MQ104BLinTravelMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;make sure we set up the Vectera state change
SetStage(5)

;start Heller and Lin's base dialogue quest for dialogue needed when this quest isn't running
MQ104B_LinHeller_BaseDialogue.Start()

MQ104B_BarrettCell_EnableMaker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

MQ104B_001_LinScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
SetObjectiveDisplayedAtTop(30)

;enable trigger volume to repair computer
Alias_BrokenComputerTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

PlayerREF.RemoveItem(Power_Cell, 3)

SetObjectiveCompleted(30)
SetObjectiveCompleted(35)
SetObjectiveDisplayed(40)

ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef()

Alias_BrokenComputerTrigger.GetRef().Disable()
CommsComputerREF.BlockActivation(False, False)
CommsComputerREF.PlayAnimation("Play01")

;play sound
OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(35)

Alias_MedBenchTrigger.GetRef().Enable()
Alias_BotTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveCompleted(35)
SetObjectiveDisplayed(40)

ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef()

Alias_BrokenComputerTrigger.GetRef().Disable()
CommsComputerREF.BlockActivation(False, False)
CommsComputerREF.PlayAnimation("Play01")

;play sound
OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveCompleted(35)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

Alias_BrokenComputerTrigger.GetRef().Disable()

;give player the slate directly
Game.GetPlayer().addaliaseditem(MQ104BHellerBarrettSlate, Alias_FirstBarrettSlateQuestObject)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Power_Cell, 1)

If GetStageDone(80) && GetStageDone(70)
  SetStage(90)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
MQ104BVectera_MedBenchMSG02.Show()
Game.GetPlayer().AddItem(Power_Cell, 1)

If GetStageDone(60) && GetStageDone(80)
  SetStage(90)
EndIf

Alias_MedBenchTrigger.GetRef().Disable()

;play sound
OBJ_MQ104B_Power_Circuit.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
MQ104BVectera_RobotMSG02.Show()
Game.GetPlayer().AddItem(Power_Cell, 1)

If GetStageDone(60) && GetStageDone(70)
  SetStage(90)
EndIf

Alias_BotTrigger.GetRef().Disable()

;play sound
OBJ_MQ104B_Power_Circuit.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

SetObjectiveCompleted(30)
SetObjectiveCompleted(35)
SetObjectiveDisplayed(40)

ObjectReference CommsComputerREF = Alias_CommsComputer.GetRef()

Alias_BrokenComputerTrigger.GetRef().Disable()
CommsComputerREF.BlockActivation(False, False)
CommsComputerREF.PlayAnimation("Play01")

;play sound
OBJ_MQ104B_Computer_Repair.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetStage(30)

SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

Actor PlayerREF = Game.GetPlayer()
If PlayerREF.GetItemCount(MQ104BHellerBarrettSlate) == 0
  PlayerREF.AddItem(MQ104BHellerBarrettSlate)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(65)
SetObjectiveDisplayed(67)
SetObjectiveDisplayedAtTop(65)
LinEliteCrewQuest.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0112_Item_00
Function Fragment_Stage_0112_Item_00()
;BEGIN CODE
SetObjectiveCompleted(67)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
SetObjectiveCompleted(65)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
SetObjectiveCompleted(92)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Actor HellerREF = Alias_Heller.GetActorRef()

Game.GetPlayer().addaliaseditem(MQ104BPirateBarrettSlate, Alias_SecondBarrettSlateQuestObject)

HellerEliteCrewQuest.SetStage(1)
HellerREF.EvaluatePackage()
HellerREF.SetGhost(False)
HellerREF.RemoveFromFaction(CaptiveFaction)

;make sure quest advances if we skipped ahead
SetStage(100)
SetStage(110)
SetStage(115)
SetStage(120)

SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveCompleted(35)
SetObjectiveCompleted(50)
SetObjectiveCompleted(60)
SetObjectiveCompleted(80)
SetObjectiveDisplayed(85)
SetObjectiveDisplayed(92)
SetObjectiveDisplayedAtTop(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0131_Item_00
Function Fragment_Stage_0131_Item_00()
;BEGIN CODE
SetObjectiveCompleted(85)
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_00
Function Fragment_Stage_0132_Item_00()
;BEGIN CODE
SetObjectiveCompleted(85)
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
MQ104B_005_OutsideScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
MQ104B_005_OutsideScene.Stop()
MQ104B_006_BarrettScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
Game.GetPlayer().removeitem(credits, NPCDemandMoney_Large.GetValueInt())

SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
Actor MatsuraREF = Alias_Matsura.GetActorRef()
MatsuraREF.AddtoFaction(PlayerEnemyFaction)
Alias_MatsuraBodyguards.AddtoFaction(PlayerEnemyFaction)
MatsuraREF.StartCombat(Game.GetPlayer())

SetObjectiveDisplayed(105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
SetObjectiveCompleted(105)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)

;if we did this non-violently, disable the exterior hostiles
If GetStageDone(260) == 0
  MQ104B_EnableExteriorPiratesMarker.Disable()
EndIf

Actor BarrettREF = Alias_Barrett.GetActorRef()
BarrettREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
Actor BarrettREF = Alias_Barrett.GetActorRef()

;Barrett is now a temp passenger
(SQ_PlayerShip as SQ_PlayerShipScript).AddPassenger(BarrettREF)
BarrettREF.moveto(Alias_PlayerShipPassengerMarker.GetRef())
BarrettREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Actor BarrettREF = Alias_Barrett.GetActorRef()

;Barrett is no longer a passenger
(SQ_PlayerShip as SQ_PlayerShipScript).RemovePassenger(BarrettREF)
Passengers.RemoveRef(BarrettREF)
DisembarkingCrew.RemoveRef(BarrettREF)

BarrettREF.moveto(MQ104B_Lodge_MarkerBarrett01)

BarrettREF.evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(115)

Actor BarrettREF = Alias_Barrett.GetActorRef()

;Barrett is no longer a passenger
(SQ_PlayerShip as SQ_PlayerShipScript).RemovePassenger(BarrettREF)
Passengers.RemoveRef(BarrettREF)
DisembarkingCrew.RemoveRef(BarrettREF)

BarrettREF.moveto(MQ104B_Lodge_MarkerBarrett01)
BarrettREF.evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
MQ104B_014_LodgeScene.Start()

SetObjectiveCompleted(115)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)

Alias_Barrett.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0407_Item_00
Function Fragment_Stage_0407_Item_00()
;BEGIN CODE
Alias_Barrett.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
Actor BarrettREF = Alias_Barrett.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(BarrettREF)

;only make Barrett active if there is no locked in companion
If COM_PQ_LockedInCompanion.GetValueInt() > -1
  kmyquest.ShowHelpMessage("CompanionBlocked")
Else 
  (SQ_Companions as SQ_CompanionsScript).SetRoleActive(BarrettREF)
  BarrettREF.EvaluatePackage()
EndIf

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
Actor BarrettREF = Alias_Barrett.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(BarrettREF)

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;check if MQ105 should start
If MQ103.GetStageDone(2000) && MQ104A.GetStageDone(1000)
  MQ105.SetStage(10)
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;make sure Matsura is hostile
Actor MatsuraREF = Alias_Matsura.GetActorRef()
MatsuraREF.AddtoFaction(PlayerEnemyFaction)
Alias_MatsuraBodyguards.AddtoFaction(PlayerEnemyFaction)

;make sure Heller isn't ghosted
Alias_Heller.GetActorRef().SetGhost(false)

;run crew quests
LinEliteCrewQuest.SetStage(1)
HellerEliteCrewQuest.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property FFLodge01_001_OutsideScene Auto Const Mandatory

Scene Property FFLodge01_003_LodgeScene Auto Const Mandatory

ObjectReference Property MQ104BStart001 Mandatory Const Auto

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_Heller Auto Const Mandatory

Scene Property FFLodge01_002_BarrettScene Auto Const Mandatory

Message Property FFLodge01LodgeMSG Auto Const Mandatory

Quest Property MQ103 Auto Const Mandatory

Quest Property MQ104 Auto Const Mandatory

Quest Property MQ105 Auto Const Mandatory

ObjectReference Property VecteraExteriorNPCEnableMarker Auto Const Mandatory

ObjectReference Property VecteraInteriorNPCEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Lin Auto Const Mandatory

ReferenceAlias Property Alias_DoorToSensorArray Auto Const Mandatory

ObjectReference Property MQ104B_BarrettMovetoMarker Auto Const Mandatory

Message Property MQ104BVectera_MedBenchMSG02 Auto Const Mandatory

ReferenceAlias Property Alias_MedBenchTrigger Auto Const Mandatory

ReferenceAlias Property Alias_BotTrigger Auto Const Mandatory

ReferenceAlias Property Alias_CommsComputer Auto Const Mandatory

Message Property MQ104BVectera_RobotMSG02 Auto Const Mandatory

Book Property MQ104BHellerBarrettSlate Auto Const Mandatory

Book Property MQ104BPirateBarrettSlate Auto Const Mandatory

Scene Property MQ104B_005_OutsideScene Auto Const Mandatory

ReferenceAlias Property Alias_Matsura Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Scene Property MQ104B_015_LodgeScene Auto Const Mandatory

Quest Property MQ104A Auto Const Mandatory

Quest Property MQ104B_LinHeller_BaseDialogue Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

RefCollectionAlias Property Alias_MatsuraBodyguards Auto Const Mandatory

ReferenceAlias Property Alias_HellerWoundedMarker Auto Const Mandatory

ObjectReference Property MQ104B_BarrettDungeonStart Auto Const Mandatory

ReferenceAlias Property Alias_HellerCrashStartMarker Auto Const Mandatory

ReferenceAlias Property Alias_BarrettDungeonDoor Auto Const Mandatory

ObjectReference Property MQ104B_EnableExteriorPiratesMarker Auto Const Mandatory

Perk Property OutpostEngineering Auto Const Mandatory

Perk Property InformationSystems Auto Const Mandatory

Perk Property TraitEmpath Auto Const Mandatory

ReferenceAlias Property Alias_BrokenComputerTrigger Auto Const Mandatory

ReferenceAlias Property Alias_FirstBarrettSlateQuestObject Auto Const Mandatory

MiscObject Property Mfg_Power_Circuit Auto Const Mandatory

Scene Property MQ104B_001_LinScene Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Large Auto Const Mandatory

Scene Property MQ104B_014_LodgeScene Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

ObjectReference Property MQ104B_Lodge_MarkerBarrett01 Auto Const Mandatory

ObjectReference Property MQ104BLinTravelMarker Auto Const Mandatory

ObjectReference Property VecteraExteriorNPCEnableMarker001 Auto Const Mandatory

Scene Property MQ104B_006_BarrettScene Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory

Perk Property FactionCrimsonFleetPerk Auto Const Mandatory

Perk Property Medicine Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

Scene Property MQ104B_006d_MatsuraDeadScene Auto Const Mandatory

ReferenceAlias Property Alias_VecteraMapMarker Auto Const Mandatory

Quest Property LinEliteCrewQuest Auto Const

Quest Property HellerEliteCrewQuest Auto Const

ReferenceAlias Property Alias_SecondBarrettSlateQuestObject Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory

WwiseEvent Property OBJ_MQ104B_Computer_Repair Auto Const Mandatory

WwiseEvent Property OBJ_MQ104B_Power_Circuit Auto Const Mandatory

ObjectReference Property MQ104B_BarrettCell_EnableMaker Auto Const Mandatory

MiscObject Property Power_Cell Auto Const Mandatory

ObjectReference Property MQ104BBarrettDungeonLandingMarker Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const Mandatory

GlobalVariable Property COM_PQ_LockedInCompanion Auto Const Mandatory

RefCollectionAlias Property Passengers Auto Const

RefCollectionAlias Property DisembarkingCrew Auto Const

ReferenceAlias Property Alias_ArtifactCollection Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory
