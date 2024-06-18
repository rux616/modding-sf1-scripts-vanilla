;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ105_002C1C9B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_Companion.ForceRefTo(Alias_TEMPSarahMorganCompanion.GetActorRef())
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

Game.GetPlayer().moveto(MQ101_PlayerMarker01)
Game.GetPlayer().AddPerk(BackgroundIndustrialist)
Game.GetPlayer().AddPerk(TraitNeonStreetRat)

SetStage(10)

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_WalterStroud.GetActorRef().moveto(MQ105_WalterNeonArriveMarker)
Game.GetPlayer().AddPerk(BackgroundIndustrialist)
Game.GetPlayer().AddPerk(TraitNeonStreetRat)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)

SetStage(20)
SetStage(30)

Game.GetPlayer().moveto(MQ105Debug1Marker)

;give player a ship
Frontier_ModularREF.moveto(NeonPlayerShipLandingMarkerRef)
Frontier_ModularREF.setlinkedref(NeonPlayerShipLandingMarkerRef, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().moveto(MQ105Debug2MarkerPlayer)
Game.GetPlayer().AddPerk(BackgroundIndustrialist)
Game.GetPlayer().AddPerk(TraitNeonStreetRat)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)

SetStage(10)
SetStage(17)
SetStage(20)
SetStage(30)
SetStage(40)
SetStage(45)
SetStage(50)
SetStage(52)
SetStage(55)
SetStage(60)
SetStage(70)
SetStage(95)
SetStage(100)
SetStage(110)
SetStage(200)
SetStage(210)
SetStage(215)
SetStage(217)
SetStage(220)
SetStage(300)
SetStage(305)
SetStage(310)
SetStage(320)
MQ105_001_IntroScene.Stop()
MQ105_003_StroudOfficeScene.Stop()
MQ105_004_IssaIntro.Stop()
MQ105_006_IssaWalterEavesdrop.Stop()

Alias_WalterStroud.GetActorRef().MoveTo(MQ105Debug2MarkerWalter)

;give player a ship
Frontier_ModularREF.moveto(NeonPlayerShipLandingMarkerRef)
Frontier_ModularREF.setlinkedref(NeonPlayerShipLandingMarkerRef, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN AUTOCAST TYPE mq105script
Quest __temp = self as Quest
mq105script kmyQuest = __temp as mq105script
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().moveto(MQ105_Debug3_PlayerMarker)
Game.GetPlayer().AddPerk(BackgroundIndustrialist)
Game.GetPlayer().AddPerk(TraitNeonStreetRat)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)

SetStage(570)

Alias_WalterStroud.GetActorRef().moveto(MQ105_Debug3_WalterMarker)

;Walter is now a Follower until the quest resolves
Actor WalterREF = Alias_WalterStroud.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleActive(WalterREF)
WalterREF.EvaluatePackage()


;give player a ship
Frontier_ModularREF.moveto(NeonPlayerShipLandingMarkerRef)
Frontier_ModularREF.setlinkedref(NeonPlayerShipLandingMarkerRef, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

;disable fast travel
kmyquest.MQ105EnableLayer = InputEnableLayer.Create()
kmyquest.MQ105EnableLayer.EnableFastTravel(False)
kmyquest.MQ105EnableLayer.EnableGravJump(False)
kmyquest.MQ105EnableLayer.EnableFarTravel(False)
kmyquest.MQ105EnableLayer.EnableTakeoff(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Game.GetPlayer().AddPerk(BackgroundIndustrialist)
Game.GetPlayer().AddPerk(TraitNeonStreetRat)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)

SetStage(20)
SetStage(30)
SetStage(40)
SetStage(45)
SetStage(50)
SetStage(55)
SetStage(60)
SetStage(70)

Game.GetPlayer().MoveTo(MQ105WalterSceneMarker02)

;give player a ship
Frontier_ModularREF.moveto(NeonPlayerShipLandingMarkerRef)
Frontier_ModularREF.setlinkedref(NeonPlayerShipLandingMarkerRef, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

Alias_WalterStroud.GetActorRef().moveto(MQ105_WalterStroudOfficeMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE mq105script
Quest __temp = self as Quest
mq105script kmyQuest = __temp as mq105script
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddPerk(BackgroundIndustrialist)
Game.GetPlayer().AddPerk(TraitNeonStreetRat)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)

SetStage(570)
SetObjectiveCompleted(160)
SetStage(700)
SetStage(720)

;give player a ship
Frontier_ModularREF.moveto(NeonPlayerShipLandingMarkerRef)
Frontier_ModularREF.setlinkedref(NeonPlayerShipLandingMarkerRef, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

;disable fast travel
kmyquest.MQ105EnableLayer = InputEnableLayer.Create()
kmyquest.MQ105EnableLayer.EnableFastTravel(False)
kmyquest.MQ105EnableLayer.EnableGravJump(False)
kmyquest.MQ105EnableLayer.EnableFarTravel(False)
kmyquest.MQ105EnableLayer.EnableTakeoff(False)

Game.GetPlayer().MoveTo(MQ105ExecFloorStart003)
Alias_WalterStroud.GetActorRef().MoveTo(Game.GetPlayer())
;Walter is now a Follower until the quest resolves
Actor WalterREF = Alias_WalterStroud.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleActive(WalterREF)
WalterREF.EvaluatePackage()

;move Musgrove unless he's already dead
If GetStageDone(410) == 0
  Actor MusgroveREF = Alias_Musgrove.GetActorRef()
  MusgroveRef.Disable()
  MusgroveREF.EvaluatePackage()
  MusgroveREF.moveto(Alias_MusgroveInjuredMarker.GetRef())
  MusgroveREF.SetValue(Health, 1)
  MusgroveREF.Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
MQ105_000_AttractScene.Start()
SetObjectiveDisplayed(10)
SetActive()

;Constellation intros must complete
DialogueUCTheLodge.SetStage(10)
DialogueUCTheLodge.SetStage(20)
DialogueUCTheLodge.SetStage(30)
DialogueUCTheLodge.SetStage(40)

;make sure the neon security guard isn't dead
Actor NeonSecurityREF = Alias_NeonSecurityF01.GetActorRef()
If NeonSecurityREF.IsDead()
  NeonSecurityREF.Resurrect()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
Alias_WalterStroud.GetActorRef().moveto(game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;make Walter a passenger
Actor WalterStroudREF = Alias_WalterStroud.GetActorRef()

(SQ_PlayerShip as SQ_PlayerShipScript).AddPassenger(WalterStroudREF)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;Walter is no longer a passenger
Actor WalterStroudREF = Alias_WalterStroud.GetActorRef()
(SQ_PlayerShip as SQ_PlayerShipScript).RemovePassenger(WalterStroudREF)
WalterStroudREF.moveto(MQ105_WalterNeonArriveMarker)
WalterStroudREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

Actor WalterREF = Alias_WalterStroud.GetActorRef()
WalterREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Actor WalterREF = Alias_WalterStroud.GetActorRef()
WalterREF.EvaluatePackage()
WalterREF.moveto(MQ105_WalterStroudOfficeMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_WalterStroud.GetActorRef().moveto(MQ105_WalterStroudOfficeMarker)

MQ105_003_StroudOfficeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
Alias_StroudEklundDoor.GetRef().SetOpen()
Alias_WalterStroud.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
MQ105_003_StroudOfficeScene.Stop()
MQ105_004_IssaIntro.Start()

SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
SetObjectiveDisplayed(70)

Game.GetPlayer().additem(Credits, 1000)

;start the Walter Issa eavesdrop scene
MQ105_006_IssaWalterEavesdrop.Start()

;enable Musgrove sleepcrate items
MQ105MusgroveSleepEnableMarker.EnableNoWait()
Alias_MusgroveNote01.GetRef().EnableNoWait()
Alias_MusgroveNote02.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
Game.GetPlayer().removeitem(credits, NPCDemandMoney_Medium.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveCompleted(65)

;advance quest if both branches are complete
If GetStageDone(210)
  SetStage(300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveCompleted(75)

;advance quest if both branches are complete
If GetStageDone(110)
  SetStage(300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0217_Item_00
Function Fragment_Stage_0217_Item_00()
;BEGIN CODE
Game.GetPlayer().removeitem(credits, NPCDemandMoney_Large.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0218_Item_00
Function Fragment_Stage_0218_Item_00()
;BEGIN CODE
Game.GetPlayer().removeitem(credits, NPCDemandMoney_Small.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;player also talked to Bartender
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(70)
     SetObjectiveDisplayed(70, False, False)
EndIf
If IsObjectiveDisplayed(75)
     SetObjectiveCompleted(75)
EndIf
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
Alias_WalterStroud.getactorRef().moveto(MQ105AstralLoungeMarkerWalter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)

;enable Musgrove
Actor MusgroveREF = Alias_Musgrove.GetActorRef()
MusgroveREF.Enable()
MusgroveREF.SetEssential(True) ;Musgrove can only be killed once the negotiation begins
MQ105BriefcaseStaticEnableMarker.Enable()

;Walter walks to the Astral Lounge
Alias_WalterStroud.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)

Alias_WalterStroud.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)

;Game.GetPlayer().additem(MQ105SlaytonLogoSlate)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)

Alias_Musgrove.GetActorRef().EvaluatePackage()
Alias_WalterStroud.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0342_Item_00
Function Fragment_Stage_0342_Item_00()
;BEGIN CODE
Actor MusgroveREF = Alias_Musgrove.GetActorRef()

MQ105MusgroveChairREF.Enable()

MusgroveREF.Disable()
MusgroveREF.EvaluatePackage()
MusgroveREF.Moveto(MQ105MusgroveChairREF)
MusgroveREF.Enable()

MQ105BriefcaseStaticEnableMarker.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)

Alias_WalterStroud.GetActorRef().EvaluatePackage()

;enable the table with briefcase
MQ105AstralLodgeTableEnableMarker.Enable()

;place the appropriate artifact
ObjectReference PlacementREF = Alias_MQ105Artifact.GetRef()
ObjectReference ArtifactREF = (StarbornTempleQuest as StarbornTempleQuestScript).PlaceArtifact(7, PlacementREF)
Alias_MQ105Artifact.ForceRefTo(ArtifactREF)
ArtifactREF.Enable()
ArtifactREF.BlockActivation(True, True)
ArtifactREF.SetScale(0.7)

SetStage(342)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0352_Item_00
Function Fragment_Stage_0352_Item_00()
;BEGIN CODE
;move Walter and Musgrove
Actor WalterStroudREF = Alias_WalterStroud.GetActorREF()
Actor MusgroveREF = Alias_Musgrove.GetActorRef()

WalterStroudREF.Disable()
WalterStroudREF.EvaluatePackage()
WalterStroudREF.Enable()
WalterStroudREF.Moveto(MQ105NegotiationRoomMarker)

MusgroveREF.Disable()
MusgroveREF.EvaluatePackage()
MusgroveREF.Moveto(MQ105NegotiationRoomMarker)
MusgroveREF.Enable()

;make sure room door is open and blocked
ObjectReference HackedDoorREF = Alias_AstraLoungeHackedDoor01.GetRef()
HackedDoorREF.SetOpen()
HackedDoorREF.BlockActivation(True, True)

SetStage(342)
SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
MQ105_013_Negotiation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0365_Item_00
Function Fragment_Stage_0365_Item_00()
;BEGIN CODE
MQ105_014_NegotiationBriefcase.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
MQ105_014_NegotiationBriefcase.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0377_Item_00
Function Fragment_Stage_0377_Item_00()
;BEGIN CODE
Alias_AstralLoungeBriefCase.GetRef().PlayAnimation("Open")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_MQ105Artifact.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
Alias_AstraLoungeHackedDoor01.GetRef().SetOpen(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;ObjectReference AstralLoungeDoorREF = Alias_AstraLoungeHackedDoor01.GetRef()
;AstralLoungeDoorREF.SetOpen(False)
;AstralLoungeDoorREF.BlockActivation(True, True)

;make sure the briefcase is open
Alias_AstralLoungeBriefcase.GetRef().PlayAnimation("Open")

Actor MusgroveREF = Alias_Musgrove.GetActorRef()
MusgroveREF.AddtoFaction(PlayerEnemyFaction)
MusgroveREF.SetGhost(False)
MusgroveREF.ChangeAnimFlavor(None)
MusgroveREF.SetValue(Aggression, 2)
MusgroveREF.StartCombat(Game.GetPlayer())
MusgroveREF.SetEssential(False)

SetObjectiveDisplayed(135)

;Walter is now a Follower until the quest resolves
Actor WalterREF = Alias_WalterStroud.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleActive(WalterREF)
WalterREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)
SetObjectiveCompleted(135)
SetObjectiveDisplayed(137)

ObjectReference AstralLoungeDoorREF = Alias_AstraLoungeHackedDoor01.GetRef()
AstralLoungeDoorREF.SetOpen(True)
AstralLoungeDoorREF.BlockActivation(False, False)

;player can take Artifact
Alias_MQ105Artifact.GetRef().BlockActivation(False, False)

;turn off blood decal in Slayton's office
MQ105MusgroveBloodSpatterEnableMarker.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_01
Function Fragment_Stage_0410_Item_01()
;BEGIN CODE
If GetStageDone(850) == 0
  MQ105_030_MusgroveDeadScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
;shove the Artifact into a Ref Alias so it's always a quest object
MQ00_MQ105ArtifactHolder.ForceRefTo(MQ105Artifact.GetRef())

Alias_MQ105Artifact.GetRef().BlockActivation(False, False)

;Set player as having acquired the Artifact
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(7)

;advance forward if Musgrove is dead
If GetStageDone(410)
  SetStage(500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_MQ105Artifact.GetRef())
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE mq105script
Quest __temp = self as Quest
mq105script kmyQuest = __temp as mq105script
;END AUTOCAST
;BEGIN CODE
;disable fast travel
kmyquest.MQ105EnableLayer = InputEnableLayer.Create()
kmyquest.MQ105EnableLayer.EnableFastTravel(False)
kmyquest.MQ105EnableLayer.EnableGravJump(False)
kmyquest.MQ105EnableLayer.EnableFarTravel(False)
kmyquest.MQ105EnableLayer.EnableTakeoff(False)

Actor SlaytonAgentREF = Alias_SlaytonAgentM01.GetActorRef()

MQ105_016_AfterNegotiation.Start()

;enable Slayton ambush
SlaytonAgentREF.Enable()

SetObjectiveCompleted(130)
SetObjectiveCompleted(137)
SetObjectiveDisplayed(140)

Actor MusgroveREF = Alias_Musgrove.GetActorRef()
MusgroveREF.EvaluatePackage()
MusgroveREF.ChangeAnimFlavor(None)
MusgroveREF.SetEssential(False)

;Walter is now a Follower
Actor WalterREF = Alias_WalterStroud.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleActive(WalterREF)
WalterREF.EvaluatePackage()

;make sure room door can be activated
ObjectReference HackedDoorREF = Alias_AstraLoungeHackedDoor01.GetRef()
HackedDoorREF.BlockActivation(False, False)

Actor IssaREF = Alias_IssaEklund.GetActorRef()
IssaREF.EvaluatePackage()
IssaREF.Moveto(MQ105IssaTradeTowerMarkerREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
Actor IssaREF = Alias_IssaEklund.GetactorRef()
Actor MusgroveREF = Alias_Musgrove.GetactorRef()

MQ105_016_AfterNegotiation.Stop()
MQ105_017_SlaytonAmbush.Start()

;Musgrove is gone
MusgroveREF.disable()

;move security
Alias_NeonSecurityF01.GetActorRef().moveto(MQ105AstralLoungeVIPSecurity01)

;also set up Issa for her scene later
IssaREF.EvaluatePackage()
IssaREF.Moveto(MQ105IssaTradeTowerMarkerREF)

;if player or Slayton Agent is in combat for some reason, then aggro agent
If Game.GetPlayer().IsInCombat() || Alias_SlaytonAgentM01.GetActorRef().IsInCombat()
  SetStage(520)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
Actor SlaytonAgentREF = Alias_SlaytonAgentM01.GetActorRef()

SlaytonAgentREF.SetCrimeFaction(None)
SlaytonAgentREF.RemoveFromFaction(CrimeFactionNeon)
SlaytonAgentREF.AddtoFaction(PlayerEnemyFaction)
SlaytonAgentREF.SetValue(Aggression, 2)
SlaytonAgentREF.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
Alias_SlaytonAgentM01.GetActorRef().EvaluatePackage()

SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
MQ105_018_SlaytonAgentAftermath.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
;Walter is stops Following
Actor WalterREF = Alias_WalterStroud.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleInActive(WalterREF)
WalterREF.EvaluatePackage()


MQ105_019_OutsideAstralLounge.Start()

SetObjectiveCompleted(140)
SetObjectiveDisplayed(150)

;disable actors we ne longer need
Alias_SlaytonAgentM01.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
;Walter is Following
Actor WalterREF = Alias_WalterStroud.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleActive(WalterREF)
WalterREF.EvaluatePackage()


SetObjectiveCompleted(150)
SetObjectiveDisplayed(160)

;move Musgrove unless he's already dead
If GetStageDone(410) == 0
  Actor MusgroveREF = Alias_Musgrove.GetActorRef()
  MusgroveRef.Disable()
  MusgroveREF.EvaluatePackage()
  MusgroveREF.moveto(Alias_MusgroveInjuredMarker.GetRef())
  MusgroveREF.SetValue(Health, 1)
  MusgroveREF.Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0580_Item_00
Function Fragment_Stage_0580_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
SetObjectiveDisplayed(170)

;Set Elevator in Slayton Operational
(Alias_ElevatorManager_LobbyMiddle.GetRef()  as LoadElevatorManagerScript).SetElevatorOperational(true)

;prep the first floor eavesdrop scenes
LC008_EavesdroppingScenes.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN CODE
MQ105SlaytonFirstFloorFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0592_Item_00
Function Fragment_Stage_0592_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0594_Item_00
Function Fragment_Stage_0594_Item_00()
;BEGIN CODE
SetObjectiveCompleted(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0595_Item_00
Function Fragment_Stage_0595_Item_00()
;BEGIN CODE
Game.GetPlayer().additem(MQ105SlaytonElevatorID, 1, false)

SetObjectiveCompleted(170)
SetOBjectiveDisplayed(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Game.GetPlayer().StopCombatAlarm()
Alias_WalterStroud.GetActorRef().StopCombatAlarm()

MQ105_023_SecondFloorScene.Start()

SetObjectiveCompleted(170)
SetObjectiveCompleted(175)
SetObjectiveCompleted(180)
SetObjectiveDisplayed(190)

;Set Elevator in Slayton Inoperational
(Alias_ElevatorManager_LobbyMiddle.GetRef()  as LoadElevatorManagerScript).SetElevatorOperational(false)

;turn off first floor actors and turn on second floor actors
MQ105_Slayton_FirstFloor_Actors.Disable()
MQ105_Slayton_SecondFloor_Actors.Enable()

;open the doors on the roof
MQ105SlaytonDoorToExteriorRoof.Unlock()

;player is enemy to the floor factions
MQ105SlaytonFirstFloorFaction.SetEnemy(PlayerFaction)
MQ105SlaytonSecondFloorFaction.SetEnemy(PlayerFaction)

;prep the second floor eavesdrop scenes
LC008_EavesdroppingScenes.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0602_Item_00
Function Fragment_Stage_0602_Item_00()
;BEGIN CODE
;force reftypes to be in altnerative elevator
Alias_SlaytonIntercom.ForceRefTo(MQ105SlaytonIntercomMarker02)

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(190)
SetObjectiveDisplayed(210)

MQ105_025_SavilleScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0615_Item_00
Function Fragment_Stage_0615_Item_00()
;BEGIN CODE
Alias_HackerSequenceDoor01.GetRef().SetOpen()
;Alias_HackerSequenceDoor02.GetRef().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
Alias_HackerSequenceDoor02.GetRef().SetOpen(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0621_Item_00
Function Fragment_Stage_0621_Item_00()
;BEGIN CODE
MQ105_025b_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0622_Item_00
Function Fragment_Stage_0622_Item_00()
;BEGIN CODE
MQ105_025c_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0623_Item_00
Function Fragment_Stage_0623_Item_00()
;BEGIN CODE
MQ105_025d_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0624_Item_00
Function Fragment_Stage_0624_Item_00()
;BEGIN CODE
MQ105_025d_HackerScene.Stop()
MQ105_025e_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
MQ105_025f_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0626_Item_00
Function Fragment_Stage_0626_Item_00()
;BEGIN CODE
Alias_HackerSequenceChoiceDoor.GetRef().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0627_Item_00
Function Fragment_Stage_0627_Item_00()
;BEGIN CODE
MQ105_025g_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0628_Item_00
Function Fragment_Stage_0628_Item_00()
;BEGIN CODE
MQ105_025h_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0629_Item_00
Function Fragment_Stage_0629_Item_00()
;BEGIN CODE
MQ105_025h_HackerScene.Stop()
MQ105_025i_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
MQ105_025j_HackkerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0631_Item_00
Function Fragment_Stage_0631_Item_00()
;BEGIN CODE
MQ105_025k_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0632_Item_00
Function Fragment_Stage_0632_Item_00()
;BEGIN CODE
Alias_HackerMaintenanceDoor.GetRef().SetOpen()
MQ105_025k_HackerScene.Stop()
MQ105_025l_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0633_Item_00
Function Fragment_Stage_0633_Item_00()
;BEGIN CODE
MQ105_025m_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0634_Item_00
Function Fragment_Stage_0634_Item_00()
;BEGIN CODE
MQ105_025n_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0635_Item_00
Function Fragment_Stage_0635_Item_00()
;BEGIN CODE
MQ105_025zzz_HackerScene_Exec.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;this bot is the one Hacker shuts down
Alias_DeadBot.ForceRefTo(Alias_TacticalBot01.GetActorRef())

MQ105_025y_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
;this bot is the one Hacker shuts down
Alias_DeadBot.ForceRefTo(Alias_TacticalBot02.GetActorRef())

MQ105_025y_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0670_Item_00
Function Fragment_Stage_0670_Item_00()
;BEGIN CODE
;this bot is the one Hacker shuts down
Alias_DeadBot.ForceRefTo(Alias_TacticalBot03.GetActorRef())

MQ105_025y_HackerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN CODE
Alias_DeadBot.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
MQ105_025a_HackerScene_Combat.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
MQ105_025z_HackerScene.Start()

MQ105NeonSlaytonExtEnableMarker.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
SetObjectiveCompleted(210)
SetObjectiveDisplayed(215)

;make sure roof actors are on 
MQ105NeonSlaytonExtEnableMarker.EnableNoWait()
;turn first floor actors back on
MQ105_Slayton_FirstFloor_Actors.EnableNoWait()
;make sure the player can enter the load door
LC008_LoadDoor_Rooftop.Lock(False)
LC008Slayton_LoadDoor_Rooftop.Lock(False)
Game.GetPlayer().Additem(MQ105SlaytonOfficeID, absilent=true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
SetObjectiveCompleted(210)
SetObjectiveCompleted(215)
SetObjectiveDisplayed(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
PlayerREF.StopCombatAlarm()

;elevator door shuts
Alias_ExecutiveElev01.GetRef().SetOpen(False)

;heal Walter
Alias_WalterStroud.GetactorRef().ResetHealthandLimbs()

MQ105_026_SlaytonScene.Start()

SetStage(720)

; Set Slayton's door to be owned by MQ105SlaytonBodyguardFaction so
; player can no longer use it.
Alias_NicolausDoor.GetRef().SetFactionOwner(MQ105SlaytonBodyguardFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
SetObjectiveCompleted(220)
SetObjectiveDisplayed(240)

MQ105_026c_WalterRespondScene.Start()

Alias_DoorToMusgroveInjured.GetRef().SetOpen()
Alias_DoorToMusgroveInjured01.GetRef().SetOpen()

Actor MusgroveREF = Alias_Musgrove.GetActorRef()
MusgroveREF.SetEssential(False)
MusgroveREF.SetCrimeFaction(None)
MusgroveREF.RemoveFromFaction(CrimeFactionNeon)

Alias_NicolausSlayton.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
SetStage(890)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0822_Item_00
Function Fragment_Stage_0822_Item_00()
;BEGIN CODE
SetStage(890)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0825_Item_00
Function Fragment_Stage_0825_Item_00()
;BEGIN CODE
SetObjectiveCompleted(240)
SetObjectiveDisplayed(242)
SetStage(895)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
Actor SlaytonREF = Alias_NicolausSlayton.GetActorRef()
SlaytonREF.AddtoFaction(PlayerEnemyFaction)
SlaytonREF.SetValue(Aggression, 1)
SlaytonREF.StartCombat(Game.GetPlayer())

Alias_SlaytonBodyguards.AddtoFaction(PlayerEnemyFaction)
Alias_SlaytonBodyguards.SetValue(Aggression, 1)
Alias_SlaytonBodyguards.StartCombatAll(Game.GetPlayer())

MQ105SlaytonFirstFloorFaction.SetEnemy(PlayerFaction)
MQ105SlaytonSecondFloorFaction.SetEnemy(PlayerFaction)

If GetStageDone(900) == 0
  SetObjectiveCompleted(220)
  SetObjectiveDisplayed(230)
EndIf

Alias_NicolausDoor.GetRef().SetLockLevel(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0890_Item_00
Function Fragment_Stage_0890_Item_00()
;BEGIN CODE
SetStage(895)
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0895_Item_00
Function Fragment_Stage_0895_Item_00()
;BEGIN CODE
;all first floor and second floor NPCs are no longer hostile
Actor PlayerREF = Game.GetPlayer()
PlayerREF.RemoveFromFaction(MQ105SlaytonEnemyFaction)
MQ105SlaytonFirstFloorFaction.SetAlly(PlayerFaction)
MQ105SlaytonSecondFloorFaction.SetAlly(PlayerFaction)

;make  sure first floor is open
Alias_FirstFloorGateDoor.getRef().SetOpen()

SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(215)
SetObjectiveCompleted(220)
SetObjectiveCompleted(230)
SetObjectiveCompleted(240)
SetObjectiveCompleted(242)
SetObjectiveDisplayed(250)

MQ105_031_SlaytonResolvedScene.Start()

;Set Elevator in Slayton Operational
(Alias_ElevatorManager_LobbyExec.GetRef()  as LoadElevatorManagerScript).SetElevatorOperational(true)

;doors open
;Alias_ExecutiveElev01.GetRef().SetOpen()
;Alias_ExitElevatorDoor01.GetRef().SetOpen()

; Set first floor door to be unlocked
Alias_FirstFloorDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0905_Item_00
Function Fragment_Stage_0905_Item_00()
;BEGIN CODE
;Set Elevator in Slayton Inoperational
;(Alias_ElevatorManager_LobbyExec.GetRef()  as LoadElevatorManagerScript).SetElevatorOperational(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN AUTOCAST TYPE mq105script
Quest __temp = self as Quest
mq105script kmyQuest = __temp as mq105script
;END AUTOCAST
;BEGIN CODE
;disable guard ships in orbit to prep for starborn scene
Alias_VoliiGuardShip01.GetRef().DisableNoWait()
Alias_VoliiGuardShip02.GetRef().DisableNoWait()
VoliiAlphaTrafficManagerREF.DisableNoWait()

;Slayton exterior is turned off
MQ105NeonSlaytonExtEnableMarker.DisableNoWait()

;make sure collection is enabled
ArmillaryMountSwapEnableMarker.DisableNoWait()

;lock the door back to Slayton's office
Alias_TradeTowerDoor.GetRef().Lock()
Game.GetPlayer().RemoveItem(MQ105SlaytonOfficeID, absilent=true)

;make sure takeoff is still off
kmyquest.MQ105EnableLayer.EnableTakeoff(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0915_Item_00
Function Fragment_Stage_0915_Item_00()
;BEGIN CODE
Alias_WalterStroud.GetActorRef().Moveto(Alias_PlayerShipPassengerMarker.GetRef())
Utility.Wait(0.1)
MQ105_032_WalterWrapUp.Start()
SetObjectiveCompleted(250)
SetObjectiveDisplayed(252)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0915_Item_01
Function Fragment_Stage_0915_Item_01()
;BEGIN CODE
Alias_WalterStroud.GetActorRef().Moveto(Alias_PlayerShipPassengerMarker.GetRef())
Utility.Wait(0.1)
MQ105_032_WalterWrapUp_Murder.Start()
SetObjectiveCompleted(250)
SetObjectiveDisplayed(252)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN AUTOCAST TYPE mq105script
Quest __temp = self as Quest
mq105script kmyQuest = __temp as mq105script
;END AUTOCAST
;BEGIN CODE
;take off works again
kmyquest.MQ105EnableLayer.EnableTakeoff()

VoliiAlphaTrafficManagerREF.DisableNoWait()

SetObjectiveCompleted(250)
SetObjectiveCompleted(252)
SetObjectiveDisplayed(255)

;make Walter a passenger
Actor WalterREF = Alias_WalterStroud.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleInActive(WalterREF, DisplayMessageIfChanged=False)
(SQ_PlayerShip as SQ_PlayerShipScript).AddPassenger(WalterREF)
WalterREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE mq105script
Quest __temp = self as Quest
mq105script kmyQuest = __temp as mq105script
;END AUTOCAST
;BEGIN CODE
;disable fast travel and saving
Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=False)
kmyquest.MQ105EnableLayer = InputEnableLayer.Create()
kmyquest.MQ105EnableLayer.DisablePlayerControls()
kmyquest.MQ105EnableLayer.EnableFastTravel(False)
kmyquest.MQ105EnableLayer.EnableGravJump(False)
kmyquest.MQ105EnableLayer.EnableFarTravel(False)

SetObjectiveCompleted(250)
SetObjectiveCompleted(255)
SetObjectiveDisplayed(260)

MQ106.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE mq105script
Quest __temp = self as Quest
mq105script kmyQuest = __temp as mq105script
;END AUTOCAST
;BEGIN CODE
kmyquest.MQ105EnableLayer = None
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;make sure the MQ105 Artifact is still a quest object
MQ105Artifact.ForceRefTo(Alias_MQ105Artifact.GetRef())

;if City_NA_Viewport01 has already been completed, set stage to allow Viewport02 to start
if City_NA_Viewport01.IsRunning() && City_NA_Viewport01.GetStageDone(1000)
City_NA_Viewport01.SetStage(1500)
endif

MQ105_PostQuestLodge.Start()

;Achievement Unlocked
Game.AddAchievement(4)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ105_001_IntroScene Auto Const Mandatory

Scene Property MQ105_002_NeonArrival Auto Const Mandatory

Scene Property MQ105_003_StroudOfficeScene Auto Const Mandatory

Scene Property MQ105_004_IssaIntro Auto Const Mandatory

Scene Property MQ105_013_Negotiation Auto Const Mandatory

Scene Property MQ105_014_NegotiationBriefcase Auto Const Mandatory

Scene Property MQ105_016_AfterNegotiation Auto Const Mandatory

Scene Property MQ105_017_SlaytonAmbush Auto Const Mandatory

Scene Property MQ105_018_SlaytonAgentAftermath Auto Const Mandatory

Scene Property MQ105_019_OutsideAstralLounge Auto Const Mandatory

Scene Property MQ105_023_SecondFloorScene Auto Const Mandatory

Scene Property MQ105_025_SavilleScene Auto Const Mandatory

Scene Property MQ105_026_SlaytonScene Auto Const Mandatory

Scene Property MQ105_032_WalterWrapUp Auto Const Mandatory

Scene Property MQ105_006_IssaWalterEavesdrop Auto Const Mandatory

ReferenceAlias Property Alias_Musgrove Auto Const Mandatory

ReferenceAlias Property Alias_MQ105Artifact Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_SlaytonAgentM01 Auto Const Mandatory

ReferenceAlias Property Alias_IssaEklund Auto Const Mandatory

ObjectReference Property MQ105IssaTradeTowerMarkerREF Auto Const Mandatory

ReferenceAlias Property Alias_Ryleigh Auto Const Mandatory

ReferenceAlias Property Alias_NicolausSlayton Auto Const Mandatory

RefCollectionAlias Property Alias_SlaytonBodyguards Auto Const Mandatory

ReferenceAlias Property Alias_MusgroveInjuredMarker Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

Scene Property MQ105_030_MusgroveDeadScene Auto Const Mandatory

Scene Property MQ105_031_SlaytonResolvedScene Auto Const Mandatory

ReferenceAlias Property Alias_WalterStroud Auto Const Mandatory

ObjectReference Property LodgeStartMarker Auto Const Mandatory

ObjectReference Property MQ101_PlayerMarker01 Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

ReferenceAlias Property Alias_JamesNewill Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

ReferenceAlias Property Alias_TEMPSarahMorganCompanion Auto Const Mandatory

ReferenceAlias Property MQ105Artifact Auto Const

Scene Property MQ105_026c_WalterRespondScene Auto Const Mandatory

ReferenceAlias Property Alias_HackerSequenceDoor01 Auto Const Mandatory

ReferenceAlias Property Alias_HackerSequenceDoor02 Auto Const Mandatory

Scene Property MQ105_025z_HackerScene Auto Const Mandatory

Scene Property MQ105_025b_HackerScene Auto Const Mandatory

ReferenceAlias Property Alias_DeadBot Auto Const Mandatory

ReferenceAlias Property Alias_TacticalBot01 Auto Const Mandatory

ReferenceAlias Property Alias_TacticalBot02 Auto Const Mandatory

ReferenceAlias Property Alias_TacticalBot03 Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

ObjectReference Property MQ105Debug1MarkerPlayer Auto Const Mandatory

ObjectReference Property MQ105Debug1MarkerWalter Auto Const Mandatory

ObjectReference Property MQ105Debug2MarkerPlayer Auto Const Mandatory

ObjectReference Property MQ105Debug2MarkerWalter Auto Const Mandatory

ObjectReference Property MQ105_Debug3_PlayerMarker Auto Const Mandatory

ObjectReference Property MQ105_Debug3_WalterMarker Auto Const Mandatory

Faction Property MQ105SlaytonFirstFloorFaction Auto Const Mandatory

Faction Property MQ105SlaytonSecondFloorFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Medium Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Large Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

Quest Property MQ106 Auto Const Mandatory

ReferenceAlias Property MQ00_MQ105ArtifactHolder Auto Const

Quest Property City_NA_Viewport02 Auto Const Mandatory

LocationAlias Property Alias_NeonTradeTowerLocation Auto Const Mandatory

Scene Property MQ105_025y_HackerScene Auto Const Mandatory

Scene Property MQ105_025c_HackerScene Auto Const Mandatory

Scene Property MQ105_025d_HackerScene Auto Const Mandatory

Scene Property MQ105_025e_HackerScene Auto Const Mandatory

Scene Property MQ105_025f_HackerScene Auto Const Mandatory

ReferenceAlias Property Alias_HackerSequenceChoiceDoor Auto Const Mandatory

Scene Property MQ105_025g_HackerScene Auto Const Mandatory

Scene Property MQ105_025h_HackerScene Auto Const Mandatory

Scene Property MQ105_025i_HackerScene Auto Const Mandatory

Scene Property MQ105_025j_HackkerScene Auto Const Mandatory

Scene Property MQ105_025k_HackerScene Auto Const Mandatory

ReferenceAlias Property Alias_HackerMaintenanceDoor Auto Const Mandatory

Scene Property MQ105_025l_HackerScene Auto Const Mandatory

Scene Property MQ105_025m_HackerScene Auto Const Mandatory

Scene Property MQ105_025n_HackerScene Auto Const Mandatory

Faction Property MQ105SlaytonFaction Auto Const Mandatory

Key Property MQ105SlaytonElevatorID Auto Const Mandatory

Faction Property MQ105SlaytonEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_DoorToMusgroveInjured Auto Const Mandatory

ObjectReference Property MQ105AstralLoungeMarkerWalter Auto Const Mandatory

ObjectReference Property MQ105ArtifactSpawnMarker Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

ReferenceAlias Property Alias_SlaytonIntercom Auto Const Mandatory

ObjectReference Property MQ105SlaytonIntercomMarker02 Auto Const Mandatory

Scene Property MQ105_025a_HackerScene_Combat Auto Const Mandatory

Perk Property TraitNeonStreetRat Auto Const Mandatory

Perk Property BackgroundIndustrialist Auto Const Mandatory

ObjectReference Property MQ105_Slayton_FirstFloor_Actors Auto Const Mandatory

ObjectReference Property MQ105_Slayton_SecondFloor_Actors Auto Const Mandatory

ReferenceAlias Property Alias_StroudEklundDoor Auto Const Mandatory

ObjectReference Property MQ105SlaytonDoorToExteriorRoof Auto Const Mandatory

ReferenceAlias Property Alias_DoorToMusgroveInjured01 Auto Const Mandatory

Scene Property MQ105_025zzz_HackerScene_Exec Auto Const Mandatory

ReferenceAlias Property Alias_ExecutiveElev01 Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory

Quest Property City_NA_Viewport01 Auto Const Mandatory

ObjectReference Property MQ105_WalterNeonArriveMarker Auto Const Mandatory

Scene Property MQ105_025y_HackerScene_Bots Auto Const Mandatory

ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_ExitElevatorDoor01 Auto Const Mandatory

ObjectReference Property MQ105AstralLodgeTableEnableMarker Auto Const Mandatory

ObjectReference Property MQ105Debug1Marker Auto Const Mandatory

ObjectReference Property MQ105WalterChairREF Auto Const Mandatory

ObjectReference Property MQ105MusgroveChairREF Auto Const Mandatory

ReferenceAlias Property Alias_NeonSecurityF01 Auto Const Mandatory

ReferenceAlias Property Alias_AstraLoungeHackedDoor01 Auto Const Mandatory

ObjectReference Property MQ105BriefcaseStaticEnableMarker Auto Const Mandatory

ObjectReference Property MQ105AstralLoungeVIPSecurity01 Auto Const Mandatory

ObjectReference Property NeonPlayerShipLandingMarkerRef Auto Const Mandatory

Faction Property LC165_Slayton_Faction Auto Const Mandatory

Faction Property MQ105SlaytonBodyguardFaction Auto Const Mandatory

ReferenceAlias Property Alias_FirstFloorGateDoor Auto Const Mandatory

ReferenceAlias Property Alias_TradeTowerDoor Auto Const Mandatory

Quest Property MQ105_PostQuestLodge Auto Const Mandatory

Book Property MQ105SlaytonLogoSlate Auto Const Mandatory

ReferenceAlias Property Alias_VoliiGuardShip01 Auto Const Mandatory

ReferenceAlias Property Alias_VoliiGuardShip02 Auto Const Mandatory

ObjectReference Property MQ105NeonSlaytonExtEnableMarker Auto Const Mandatory

ObjectReference Property MQ105MusgroveSleepEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_ElevatorManager_LobbyMiddle Auto Const Mandatory

ReferenceAlias Property Alias_ElevatorManager_LobbyExec Auto Const Mandatory

ObjectReference Property MQ105SlaytonRoofElevataorEnableMarker Auto Const Mandatory

Quest Property LC008_EavesdroppingScenes Auto Const Mandatory

ReferenceAlias Property Alias_AstralLoungeBriefcase Auto Const Mandatory

ObjectReference Property MQ105_WalterStroudOfficeMarker Auto Const Mandatory

ObjectReference Property LC008_LoadDoor_Rooftop Auto Const Mandatory

Key Property MQ105SlaytonOfficeID Auto Const Mandatory

ObjectReference Property LC008Slayton_LoadDoor_Rooftop Auto Const Mandatory

ObjectReference Property MQ105MusgroveAnimationREF Auto Const Mandatory

Faction Property CrimeFactionSlaytonExecutive Auto Const Mandatory

ObjectReference Property MQ105MusgroveBloodSpatterEnableMarker Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory

ObjectReference Property MQ105WalterSceneMarker02 Auto Const Mandatory

ObjectReference Property MQ105ExecFloorStart003 Auto Const Mandatory

ReferenceAlias Property Alias_NicolausDoor Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const Mandatory

Scene Property MQ105_032_WalterWrapUp_Murder Auto Const Mandatory

ReferenceAlias Property Alias_FirstFloorDoor Auto Const Mandatory

ObjectReference Property MQ105NegotiationRoomMarker Auto Const Mandatory

Location Property VoliiStationLocation Auto Const Mandatory

Keyword Property SQ_TrafficManagerHeavy_LocType Auto Const Mandatory

ObjectReference Property VoliiAlphaTrafficManagerREF Auto Const Mandatory

ReferenceAlias Property Alias_MusgroveNote01 Auto Const Mandatory

ReferenceAlias Property Alias_MusgroveNote02 Auto Const Mandatory

Scene Property MQ105_000_AttractScene Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactCollection Auto Const Mandatory

Quest Property DialogueUCTheLodge Auto Const Mandatory
