;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ202_00017CE7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
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
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(7)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(8)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(9)

Game.GetPlayer().moveto(MQ104AStart)

;player can now board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

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
MQ102.Stop()

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(7)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(8)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(9)

SetStage(10)
SetStage(20)
SetStage(30)
SetStage(50)

Game.GetPlayer().moveto(MQ202ScowStart)
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
MQ102.Stop()

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(7)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(8)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(9)

SetStage(10)
SetStage(20)
SetStage(30)
SetStage(60)

Game.GetPlayer().moveto(MQ202ScowStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;enable the scow and the map marker to it

ScowMapMarkerREF.Enable()

SpaceshipReference PetrovShipREF = Alias_PetrovShip.GetShipRef()
PetrovShipREF.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;place the appropriate Artifact in the Scow
ObjectReference PlacementREF = Alias_MQ202Artifact.GetRef()
ObjectReference AttachREF = Alias_ArtifactHolder.GetRef()
ObjectReference ArtifactREF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifactAndAttach(10, PlacementREF, AttachREF)
Alias_MQ202Artifact.ForceRefTo(ArtifactREF)
ArtifactREF.Enable()

Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()

;Constellation followers unavailable
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=AndrejaREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=BarrettREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=SamCoeREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=SarahMorganREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)

(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=AndrejaREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=BarrettREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=SamCoeREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=SarahMorganREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=VascoREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)

DismissedCrew.RemoveRef(AndrejaREF)
DismissedCrew.RemoveRef(BarrettREF)
DismissedCrew.RemoveRef(SamCoeREF)
DismissedCrew.RemoveRef(SarahMorganREF)
DisembarkingCrew.RemoveRef(AndrejaREF)
DisembarkingCrew.RemoveRef(BarrettREF)
DisembarkingCrew.RemoveRef(SamCoeREF)
DisembarkingCrew.RemoveRef(SarahMorganREF)

;if the Companion at-risk aliases are empty, fill them with defaults
If MQ00_CompanionAtLodge.GetActorRef() == None
  MQ00_CompanionAtLodge.ForceRefTo(SamCoeREF)
EndIf

If MQ00_CompanionAtEye.GetActorRef() == None
  MQ00_CompanionAtEye.ForceRefTo(SarahMorganREF)
EndIf

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("FollowerWarnAndreja")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_01
Function Fragment_Stage_0012_Item_01()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("FollowerWarnBarrett")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_02
Function Fragment_Stage_0012_Item_02()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("FollowerWarnSam")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_03
Function Fragment_Stage_0012_Item_03()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowHelpMessage("FollowerWarnSarah")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
MQCompanionLockedBailoutMSG.Show()

SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Message.ClearHelpMessages()

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;SF-13797 - re-confirm companions as inactive if personal quest done after MQ202 start, move to the Eye if assigned elsewhere

Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()

;move people if needed
If !AndrejaREF.IsInLocation(MQ201B_Marker_Andreja.GetCurrentLocation())
  AndrejaREF.moveto(MQ201B_Marker_Andreja)
EndIf

If !BarrettREF.IsInLocation(MQ201BMarker_Barrett.GetCurrentLocation())
  BarrettREF.moveto(MQ201BMarker_Barrett)
EndIf

If !SamCoeREF.IsInLocation(MQ201BMarker_Sam.GetCurrentLocation())
  SamCoeREF.moveto(MQ201BMarker_Sam)
EndIf

If !CoraCoeREF.IsInLocation(MQ201BMarker_Cora.GetCurrentLocation())
  CoraCoeREF.moveto(MQ201BMarker_Cora)
EndIf

If !SarahMorganREF.IsInLocation(MQ201B_Marker_Sarah.GetCurrentLocation())
  SarahMorganREF.moveto(MQ201B_Marker_Sarah)
EndIf

;Constellation followers unavailable
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=AndrejaREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=BarrettREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=SamCoeREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Companions as SQ_CompanionsScript).SetRoleInactive(ActorToUpdate=SarahMorganREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)

(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=AndrejaREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=BarrettREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=SamCoeREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=SarahMorganREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=VascoREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)

DismissedCrew.RemoveRef(AndrejaREF)
DismissedCrew.RemoveRef(BarrettREF)
DismissedCrew.RemoveRef(SamCoeREF)
DismissedCrew.RemoveRef(SarahMorganREF)
DisembarkingCrew.RemoveRef(AndrejaREF)
DisembarkingCrew.RemoveRef(BarrettREF)
DisembarkingCrew.RemoveRef(SamCoeREF)
DisembarkingCrew.RemoveRef(SarahMorganREF)

;SF-13797 - resume normal companion lock

;Companion who will be at the Lodge in MQ204 is forced to come with you for MQ202
Actor CompanionAtLodgeREF = MQ00_CompanionAtLodge.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleActive(CompanionAtLodgeREF)
(SQ_Companions as SQ_CompanionsScript).LockInCompanion(CompanionAtLodgeREF as CompanionActorScript, True, CustomMessage = MQ202CompanionLockInMSG, TextReplaceActivator = COM_MQ202_TxtReplace_QuestName_Any)
CompanionAtLodgeREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
SetObjectiveDisplayedAtTop(30)
SetObjectiveDisplayed(32)
SetObjectiveDisplayed(34)

SpaceshipReference PetrovShipREF = Alias_PetrovShip.getshipRef()
PetrovShipREF.SetNoBleedoutRecovery()
PetrovShipREF.EnablePartRepair(ShipSystemEngineHealth, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0033_Item_00
Function Fragment_Stage_0033_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(32)
SetObjectiveDisplayed(34, abDisplayed=False)
SetObjectiveDisplayed(30, abforce=True)

Game.GetPlayer().addtoFaction(MQ202PetrovBoardingFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(32, abDisplayed=False)

SpaceshipReference PetrovShipREF = Alias_PetrovShip.GetShipReference()

PetrovShipREF.AddtoFaction(PlayerEnemyFaction)
PetrovShipREF.StartCombat(Alias_PlayerShip.GetShipReference())

;don't let the ship recover from engines disabled
PetrovShipREF.EnablePartRepair(SpaceshipEngineHealth, false)

;make sure player is no longer friends
Game.GetPlayer().RemoveFromFaction(MQ202PetrovBoardingFaction)

SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(32, abDisplayed=False)
SetObjectiveDisplayed(34, abDisplayed=False)
SetObjectiveDisplayed(40)
SetObjectiveDisplayedAtTop(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MQ202_003a_TaoXun_HostileScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;petrov ship no longer hostile
SpaceshipReference PetrovShipREF = Alias_PetrovShip.GetShipReference()

PetrovShipREF.RemoveFromFaction(PlayerEnemyFaction)
PetrovShipREF.AddtoFaction(PlayerAllyFaction)
PetrovShipREF.SetValue(Aggression, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
Actor TaoXunREF = Alias_TaoXun.GetActorRef()
Actor PlayerREF = Game.GetPlayer()

PlayerREF.AddtoFaction(MQ202PetrovEnemyFaction)
PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
PlayerREF.RemoveFromFaction(MQ202PetrovBoardingFaction)
TaoXunREF.StartCombat(PlayerREF)

SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
MQ202_003b_TaoXun_PeacefulScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(32, abDisplayed=False)
SetObjectiveDisplayed(34, abDisplayed=False)
SetObjectiveDisplayed(40)
SetObjectiveDisplayedAtTop(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
MQ202_004_PetrovScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0213_Item_00
Function Fragment_Stage_0213_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Small.GetValueInt())

SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0214_Item_00
Function Fragment_Stage_0214_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Small.GetValueInt())
Game.GetPlayer().additem(LC012Scow_ZooPassword)

SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Medium.GetValueInt())

;Bounty Hunters are now allies
Actor BullREF = Alias_BountyHunter_Bull.GetActorRef()
Actor ErinSeptemberREF = Alias_BountyHunter_ErinSeptember.GetActorRef()
Actor RaptorREF = Alias_BountyHunter_Raptor.GetActorRef()

BullREF.RemoveFromFaction(MQ202PetrovFaction)
BullREF.AddtoFaction(PlayerAllyFaction)
ErinSeptemberREF.RemoveFromFaction(MQ202PetrovFaction)
ErinSeptemberREF.AddtoFaction(PlayerAllyFaction)
RaptorREF.RemoveFromFaction(MQ202PetrovFaction)
RaptorREF.AddtoFaction(PlayerAllyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0217_Item_00
Function Fragment_Stage_0217_Item_00()
;BEGIN CODE
Actor BullREF = Alias_BountyHunter_Bull.GetActorRef()
Actor ErinSeptemberREF = Alias_BountyHunter_ErinSeptember.GetActorRef()
Actor RaptorREF = Alias_BountyHunter_Raptor.GetActorRef()
Actor PlayerREF = Game.GetPlayer()

BullREF.RemoveFromFaction(PlayerAllyFaction)
BullREF.addtoFaction(MQ202PetrovFaction)
ErinSeptemberREF.RemoveFromFaction(PlayerAllyFaction)
ErinSeptemberREF.addtoFaction(MQ202PetrovFaction)
RaptorREF.RemoveFromFaction(PlayerAllyFaction)
RaptorREF.addtoFaction(MQ202PetrovFaction)

BullREF.StartCombat(PlayerREF)
ErinSeptemberREF.StartCombat(PlayerREF)
RaptorREF.StartCombat(PlayerREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
SetObjectiveDisplayedAtTop(50)
SetObjectiveDisplayed(52)
SetObjectiveDisplayed(54)
SetObjectiveDisplayed(56)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0236_Item_00
Function Fragment_Stage_0236_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveCompleted(52)
SetObjectiveDisplayed(54, abDisplayed=False)
SetObjectiveDisplayed(56, abDisplayed=False)

SetObjectiveDisplayed(50, abForce=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
MQ202_006_PetrovEscortScene.Start()

;make sure Vault guards don't aggro
Game.GetPlayer().addtoFaction(MQ202PetrovGuardsFriendsFaction)

SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(52, abDisplayed=False)
SetObjectiveDisplayed(54, abDisplayed=False)
SetObjectiveDisplayed(56, abDisplayed=False)
SetObjectiveDisplayed(57)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0242_Item_00
Function Fragment_Stage_0242_Item_00()
;BEGIN CODE
Alias_ArtifactHolder.GetRef().Activate(Alias_CaptainPetrov.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0245_Item_00
Function Fragment_Stage_0245_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(52, abDisplayed=False)
SetObjectiveDisplayed(54, abDisplayed=False)
SetObjectiveDisplayed(56, abDisplayed=False)
SetObjectiveDisplayed(200, abDisplayed=False)
SetObjectiveDisplayed(210, abDisplayed=False)
SetObjectiveDisplayed(220, abDisplayed=False)
SetObjectiveDisplayed(230, abDisplayed=False)
SetObjectiveDisplayed(250, abDisplayed=False)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE mq202_questscript
Quest __temp = self as Quest
mq202_questscript kmyQuest = __temp as mq202_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckPetrov()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_01
Function Fragment_Stage_0250_Item_01()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
SetObjectiveDisplayedAtTop(50)
SetObjectiveDisplayed(52, abdisplayed=false)
SetObjectiveDisplayed(54)
SetObjectiveDisplayed(56)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
Alias_VaultDoor.GetRef().SetOpen()
SetStage(290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
SetObjectiveCompleted(57)
SetObjectiveDisplayed(60)

SetStage(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_MQ202Artifact.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveCompleted(50)
SetObjectiveCompleted(52)
SetObjectiveCompleted(54)
SetObjectiveCompleted(56)
SetObjectiveCompleted(57)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Alias_ArtifactCollection.getRef().Enable()

MQ202_006_PetrovEscortScene.Stop()

;if Petrov hasn't been subdued, alarm goes off
If GetStageDone(410) == 0
  Alias_AlarmSoundMarker.GetRef().Enable()
  PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
  PlayerREF.addtoFaction(MQ202PetrovEnemyFaction)
  Alias_CaptainPetrov.GetActorRef().StartCombat(PlayerREF)
  ;Alias_LockVaultActivator.GetRef().Activate(PlayerREF) ; trigger doors
EndIf

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(10)

;add bounty
CrimeFactionUC.ModCrimeGold(500)
MQ202BountyMSG.Show()

;make sure collection is enabled
ArmillaryMountSwapEnableMarker.DisableNoWait()

SetObjectiveCompleted(50)
SetObjectiveCompleted(52)
SetObjectiveCompleted(54)
SetObjectiveCompleted(56)
SetObjectiveCompleted(57)
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE mq202_questscript
Quest __temp = self as Quest
mq202_questscript kmyQuest = __temp as mq202_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckPetrov()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
Actor PetrovREF = Alias_CaptainPetrov.GetActorRef()

;make sure Vault guards don't aggro
Game.GetPlayer().addtoFaction(MQ202PetrovGuardsFriendsFaction)

;Petrov no longer essential
PetrovREF.RestoreValue(Health, 9999)
PetrovREF.SetEssential(False)
PetrovREF.SetNoBleedoutRecovery(False)

;petrov ship no longer hostile
SpaceshipReference PetrovShipREF = Alias_PetrovShip.GetShipReference()

PetrovShipREF.RemoveFromFaction(PlayerEnemyFaction)
PetrovShipREF.AddtoFaction(PlayerAllyFaction)
PetrovShipREF.SetValue(Aggression, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
SetStage(410)
SetStage(290)

Alias_VaultDoor.GetRef().SetOpen()

Actor PlayerREF = Game.GetPlayer()
If (PlayerREF.GetItemCount(MQ202VaultKey) == 0) && (GetStageDone(310) == 0)
  PlayerREF.additem(MQ202VaultKey)
EndIF

Alias_CaptainPetrov.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
Actor PlayerREF=Game.GetPlayer()
Actor PetrovREF=Alias_CaptainPetrov.GetActorRef()

SetStage(410)

;clear temporary ally state
PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
PlayerREF.RemoveFromFaction(MQ202PetrovBoardingFaction)
PlayerREF.RemoveFromFaction(MQ202PetrovFaction)

PlayerREF.AddtoFaction(MQ202PetrovEnemyFaction)
PetrovREF.StartCombat(PlayerREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(250, abDisplayed=False)
SetObjectiveDisplayed(100)

;player can destroy the scow
SpaceshipReference PetrovShipREF = Alias_PetrovShip.GetShipReference()
PetrovShipREF.SetEssential(False)

;cleanup alarm sound and encounter quest
Alias_AlarmSoundMarker.GetRef().Disable()

;MQ204 needs to be up and running for the player's return
MQ204.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
SpaceshipReference PetrovShipREF = Alias_PetrovShip.GetShipReference()
PetrovShipREF.AddtoFaction(PlayerEnemyFaction)
PetrovShipREF.SetEssential(False)
PetrovShipREF.SetValue(Aggression, 1)

Actor PlayerREF = Game.GetPlayer()
PlayerREF.RemoveFromFaction(MQ202PetrovGuardsFriendsFaction)
PlayerREF.RemoveFromFaction(MQ202PetrovFaction)
PlayerREF.AddtoFaction(MQ202PetrovEnemyFaction)

Actor PetrovREF = Alias_CaptainPetrov.GetActorRef()
PetrovREF.SetEssential(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveCompleted(210)
SetObjectiveDisplayed(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveCompleted(210)
SetObjectiveCompleted(220)
SetObjectiveDisplayed(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveCompleted(210)
SetObjectiveCompleted(220)
SetObjectiveCompleted(230)
SetStage(245)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)

Alias_ZooCreatures.RemoveFromFaction(MQ202PetrovFaction)
Alias_ZooCreatures.AddtoFaction(PlayerAllyFaction)
Alias_ZooCreatures.AddtoFaction(MQ202PetrovEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
MQ204.SetStage(60)

; Light In The Darkness (RAD02) - queued for interview
RAD02.SetStage(200)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;make sure Artifact remains a quest object
MQ00_MQ202ArtifactHolder.ForceRefTo(Alias_MQ202Artifact.GetRef())

;make sure Scow is now hostile
SpaceshipReference PetrovShipREF = Alias_PetrovShip.GetShipReference()
PetrovShipREF.AddtoFaction(PlayerEnemyFaction)
PetrovShipREF.SetEssential(False)
PetrovShipREF.SetValue(Aggression, 1)

Actor PlayerREF = Game.GetPlayer()
PlayerREF.AddtoFaction(MQ202PetrovEnemyFaction)

Actor PetrovREF = Alias_CaptainPetrov.GetActorRef()
PetrovREF.SetEssential(False)

;reset Eye state
MQ201BSparksEnableMarker_Andreja.DisableNoWait()
MQ201BSparksEnableMarker_Barrett.DisableNoWait()
MQ201BSparksEnableMarker_Sam.DisableNoWait()
MQ201BSparksEnableMarker_Sarah.DisableNoWait()
MQ201B_Eye_EnableMarker.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CaptainPetrov Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Quest Property MQ202 Auto Const Mandatory

Quest Property MQ204 Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

ObjectReference Property MQ104AStart Auto Const Mandatory

Scene Property MQ202_002_ScowScene Auto Const Mandatory

Scene Property MQ202_003a_TaoXun_HostileScene Auto Const Mandatory

Scene Property MQ202_004_PetrovScene Auto Const Mandatory

Scene Property MQ202_006_PetrovEscortScene Auto Const Mandatory

ReferenceAlias Property Alias_TaoXun Auto Const Mandatory

ReferenceAlias Property Alias_VaultDoor Auto Const Mandatory

ReferenceAlias Property Alias_AlarmSoundMarker Auto Const Mandatory

Faction Property MQ202PetrovFaction Auto Const Mandatory

ReferenceAlias Property Alias_Vladimir Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

ObjectReference Property MQ106_BarrettMarker01 Auto Const Mandatory

ObjectReference Property MQ106_VladimirMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactCollection Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

Quest Property MQ201 Auto Const Mandatory

ReferenceAlias Property Alias_PetrovShip Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

Faction Property MQ202PetrovBoardingFaction Auto Const Mandatory

Scene Property MQ202_003b_TaoXun_PeacefulScene Auto Const Mandatory

ReferenceAlias Property Alias_MQ202Artifact Auto Const Mandatory

ReferenceAlias Property MQ00_MQ202ArtifactHolder Auto Const

Faction Property MQ202PetrovEnemyFaction Auto Const Mandatory

ObjectReference Property MQ202ScowStart Auto Const Mandatory

Key Property MQ202VaultKey Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactHolder Auto Const Mandatory

ReferenceAlias Property MQ00_CompanionAtLodge Auto Const

ReferenceAlias Property MQ00_CompanionAtEye Auto Const

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory

Quest Property RAD02 Auto Const Mandatory

Faction Property MQ202PetrovGuardsFriendsFaction Auto Const Mandatory

ReferenceAlias Property Alias_LockVaultActivator Auto Const Mandatory

Scene Property MQ202_008_Petrov_BleedoutScene Auto Const Mandatory

ActorValue Property SpaceshipEngineHealth Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

Message Property MQ202BountyMSG Auto Const Mandatory

Key Property LC012Scow_ZooPassword Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Medium Auto Const Mandatory

ReferenceAlias Property Alias_BountyHunter_Bull Auto Const Mandatory

ReferenceAlias Property Alias_BountyHunter_ErinSeptember Auto Const Mandatory

ReferenceAlias Property Alias_BountyHunter_Raptor Auto Const Mandatory

LocationAlias Property Alias_ScowShipLocation Auto Const Mandatory

Faction Property PlayerAllyFaction Auto Const Mandatory

ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const Mandatory

RefCollectionAlias Property Alias_ZooCreatures Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

Message Property MQ202CompanionLockInMSG Auto Const Mandatory

Message Property MQCompanionLockedBailoutMSG Auto Const Mandatory

ObjectReference Property MQ201B_Eye_EnableMarker Auto Const Mandatory

ObjectReference Property MQ201BSparksEnableMarker_Andreja Auto Const Mandatory

ObjectReference Property MQ201BSparksEnableMarker_Barrett Auto Const Mandatory

ObjectReference Property MQ201BSparksEnableMarker_Sam Auto Const Mandatory

ObjectReference Property MQ201BSparksEnableMarker_Sarah Auto Const Mandatory

ObjectReference Property ScowMapMarkerREF Auto Const Mandatory

Quest Property SQ_Crew Auto Const Mandatory

ReferenceAlias Property Alias_Vasco Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

Perk Property MQ202ScowReduceDamage Auto Const Mandatory

RefCollectionAlias Property DismissedCrew Auto Const

RefCollectionAlias Property DisembarkingCrew Auto Const

ActorValue Property ShipSystemEngineHealth Auto Const Mandatory

Activator Property COM_MQ202_TxtReplace_QuestName_Any Auto Const Mandatory

ReferenceAlias Property Alias_CoraCoe Auto Const Mandatory

ObjectReference Property MQ201B_Marker_Andreja Auto Const Mandatory

ObjectReference Property MQ201BMarker_Barrett Auto Const Mandatory

ObjectReference Property MQ201BMarker_Cora Auto Const Mandatory

ObjectReference Property MQ201BMarker_Sam Auto Const Mandatory

ObjectReference Property MQ201B_Marker_Sarah Auto Const Mandatory
