;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ204_002C6D74 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.getActorRef()
Actor AndrejaREF = Alias_Andreja.getActorRef()
Actor BarrettREF = Alias_Barrett.getActorRef()
Actor CompanionLodgeREF
Actor CompanionEyeREF

;setup armillary
(Alias_ArtifactCollectionTrigger.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollectionTrigger.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollectionTrigger.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollectionTrigger.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollectionTrigger.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollectionTrigger.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollectionTrigger.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)
(Alias_ArtifactCollectionTrigger.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(7)
(Alias_ArtifactCollectionTrigger.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(8)
(Alias_ArtifactCollectionTrigger.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(9)


Int ButtonPressed = TestMQ204MSG.Show()
If ButtonPressed == 0
  CompanionLodgeREF = SarahMorganREF
ElseIf ButtonPressed == 1
  CompanionLodgeREF = SamCoeREF
ElseIf ButtonPressed == 2
  CompanionLodgeREF = AndrejaREF
ElseIf ButtonPressed == 3
  CompanionLodgeREF = BarrettREF 
EndIf

Utility.Wait(0.1)

ButtonPressed = TestMQ204MSG02.Show()
If ButtonPressed == 0
  CompanionEyeREF = SarahMorganREF
ElseIf ButtonPressed == 1
  CompanionEyeREF = SamCoeREF
ElseIf ButtonPressed == 2
  CompanionEyeREF = AndrejaREF
ElseIf ButtonPressed == 3
  CompanionEyeREF = BarrettREF 
EndIf

Utility.Wait(0.1)

While CompanionLodgeREF == CompanionEyeREF 
  ButtonPressed = TestMQ204MSG02.Show()
  If ButtonPressed == 0
    CompanionEyeREF = SarahMorganREF
  ElseIf ButtonPressed == 1
    CompanionEyeREF = SamCoeREF
  ElseIf ButtonPressed == 2
    CompanionEyeREF = AndrejaREF
  ElseIf ButtonPressed == 3
    CompanionEyeREF = BarrettREF 
  EndIf
  Utility.Wait(0.1)
EndWhile

;lock in companion
MQ00_CompanionAtLodge.ForceRefTo(CompanionLodgeREF)
MQ00_CompanionAtEye.ForceRefTo(CompanionEyeREF)
(SQ_Companions as SQ_CompanionsScript).SetRoleActive(CompanionLodgeREF)
(SQ_Companions as SQ_CompanionsScript).LockInCompanion(CompanionLodgeREF as CompanionActorScript, True, MQ204CompanionLockInMSG)

MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()
MQ102.Stop()

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

;make sure collection is enabled
ArmillaryMountSwapEnableMarker.DisableNoWait()

Game.Getplayer().moveto(LodgeStartMarker)
Game.GetPlayer().addtoFaction(ConstellationFaction)
Game.GetPlayer().additem(LodgeKey)

;player can now board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

MQ202.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ102.CompleteQuest()
MQ102.Stop()

Game.GetPlayer().addtoFaction(ConstellationFaction)
Game.Getplayer().moveto(LodgeStartMarker)

;player can now board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().moveto(MQ204_NA_PlayerMarker)
Actor HunterREF = Alias_TheHunter.GetActorRef()
HunterREF.Moveto(MQ204_NA_HunterMarker)
HunterREF.AddtoFaction(PlayerEnemyFaction)
;player can now board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()
MQ102.Stop()

Game.Getplayer().moveto(EyeMarker)
Game.GetPlayer().addtoFaction(ConstellationFaction)
Game.GetPlayer().additem(LodgeKey)

SetStage(100)
SetStage(135)
SetStage(140)
SetObjectiveCompleted(90)
SetStage(145)

;player can now board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

MQ204A_012d_InShip.Stop()

Actor SavedCompanionREF = MQ00_CompanionWhoLives.GetActorRef()
;track which companion was saved in a global
If SavedCompanionREF == Alias_Andreja.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_Andreja.GetValueInt())
ElseIf SavedCompanionREF == Alias_Barrett.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) 
ElseIf SavedCompanionREF == Alias_SamCoe.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) 
ElseIf SavedCompanionREF == Alias_SarahMorgan.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) 
EndIf

MQ00_CompanionWhoDies.GetActorRef().ChangeAnimFaceArchetype(AnimFaceArchetypeEyesClosed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()
MQ102.Stop()

SetStage(70)
SetStage(400)
SetStage(420)
SetStage(440)
SetStage(450)
SetStage(460)

Actor SavedCompanionREF = MQ00_CompanionWhoLives.GetActorRef()
;track which companion was saved in a global
If SavedCompanionREF == Alias_Andreja.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_Andreja.GetValueInt())
ElseIf SavedCompanionREF == Alias_Barrett.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) 
ElseIf SavedCompanionREF == Alias_SamCoe.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) 
ElseIf SavedCompanionREF == Alias_SarahMorgan.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) 
EndIf

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

Game.Getplayer().moveto(LodgeStartMarker)
Game.GetPlayer().addtoFaction(ConstellationFaction)
Game.GetPlayer().additem(LodgeKey)

;player can now board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

MQ00_CompanionWhoDies.GetActorRef().ChangeAnimFaceArchetype(AnimFaceArchetypeEyesClosed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.getActorRef()
Actor AndrejaREF = Alias_Andreja.getActorRef()
Actor BarrettREF = Alias_Barrett.getActorRef()
Actor CompanionLodgeREF
Actor CompanionEyeREF

CompanionLodgeREF = SarahMorganREF
CompanionEyeREF = SamCoeREF

;lock in companion
MQ00_CompanionAtLodge.ForceRefTo(CompanionLodgeREF)
MQ00_CompanionAtEye.ForceRefTo(CompanionEyeREF)
(SQ_Companions as SQ_CompanionsScript).SetRoleActive(CompanionLodgeREF)
(SQ_Companions as SQ_CompanionsScript).LockInCompanion(CompanionLodgeREF as CompanionActorScript, True, MQ204CompanionLockInMSG)

MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()
MQ102.Stop()

;give player a ship
Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker)
Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

;make sure collection is enabled
ArmillaryMountSwapEnableMarker.DisableNoWait()

Game.Getplayer().moveto(LodgeStartMarker)
Game.GetPlayer().addtoFaction(ConstellationFaction)
Game.GetPlayer().additem(LodgeKey)

;player can now board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

SetStage(6)
SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor HunterREF = Alias_TheHunter.GetActorRef()
Actor PlayerREF = Game.GetPlayer()
Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor VladimirREF = Alias_Vladimir.GetActorRef()

;player cannot go to the Eye until later
PlayerREF.RemoveFromFaction(EyeBoardingFaction)

;if the Companion at-risk aliases are empty, fill them with defaults
If MQ00_CompanionAtLodge.GetActorRef() == None
  MQ00_CompanionAtLodge.ForceRefTo(SamCoeREF)
EndIf

If MQ00_CompanionAtEye.GetActorRef() == None
  MQ00_CompanionAtEye.ForceRefTo(SarahMorganREF)
EndIf

;setup the Lodge basement door
MQ204BasementDoorEnableMarker.Disable()

;setup Eye state
MQ204EyeAttackEnableMarker.EnableNoWait()

;disable the spaceport ship if the spaceport marker is used by another quest
If FFNewAtlantis05.IsRunning() || CF05.IsRunning()
  Alias_SpaceportShip.GetRef().DisableNoWait()
EndIf

;make sure the interior door in the Lodge is unlocked
Alias_LodgeInteriorDoor.GetRef().Lock(false)

;the Pre-MQ106 Hunter should be disabled
Alias_PreMQ106Hunter.GetActorRef().Disable()

;make sure table display is correct
Alias_LodgeDisplay.GetRef().PlayAnimation("Play02")

;shut down any Lodge quests
FFLodge01.SetStage(200)
FFLodge02.Stop()
FFLodge03.Stop()

;if Sona is at the Lodge, disable her until the quest is over
If COM_SQ01_SonaLeft.GetValueInt() == 1
  Alias_Sona.GetActorRef().DisableNoWait()
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor VladimirREF = Alias_Vladimir.GetActorRef()
Actor WalterREF = Alias_WalterStroud.GetActorRef()
Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()
Actor NoelREF = Alias_Noel.GetActorRef()
Actor CompanionAtEyeREF = MQ00_CompanionAtEye.GetActorRef() 
Actor CompanionAtLodgeREF = MQ00_CompanionAtLodge.GetActorRef() 

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
DismissedCrew.RemoveRef(VascoREF)
DisembarkingCrew.RemoveRef(AndrejaREF)
DisembarkingCrew.RemoveRef(BarrettREF)
DisembarkingCrew.RemoveRef(SamCoeREF)
DisembarkingCrew.RemoveRef(SarahMorganREF)
DisembarkingCrew.RemoveRef(VascoREF)

;failsafe move actors when player enters Lodge
If CompanionAtLodgeREF != AndrejaREF
  kmyquest.MQ204MoveActor(AndrejaREF, EyeMarker)
Else
  kmyquest.MQ204MoveActor(AndrejaREF, LodgeStartMarker)
EndIf

If CompanionAtLodgeREF != SarahMorganREF
  kmyquest.MQ204MoveActor(SarahMorganREF, EyeMarker)
Else
  kmyquest.MQ204MoveActor(SarahMorganREF, LodgeStartMarker)
EndIf

If CompanionAtLodgeREF != BarrettREF 
  kmyquest.MQ204MoveActor(BarrettREF, EyeMarker)
Else
  kmyquest.MQ204MoveActor(BarrettREF, LodgeStartMarker)
EndIf

If CompanionAtLodgeREF != SamCoeREF 
  kmyquest.MQ204MoveActor(SamCoeREF, EyeMarker)
Else
  kmyquest.MQ204MoveActor(SamCoeREF, LodgeStartMarker)
EndIf

If CompanionAtLodgeREF != SamCoeREF 
  kmyquest.MQ204MoveActor(CoraCoeREF, EyeMarker)
Else
  kmyquest.MQ204MoveActor(CoraCoeREF, LodgeStartMarker)
EndIf

kmyquest.MQ204MoveActor(VladimirREF, EyeMarker)
kmyquest.MQ204MoveActor(WalterREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(MatteoREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(VascoREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(NoelREF, LodgeStartMarker)

AndrejaREF.SetValue(CrewReassignDisabled, 1)
BarrettREF.SetValue(CrewReassignDisabled, 1)
SamCoeREF.SetValue(CrewReassignDisabled, 1)
SarahMorganREF.SetValue(CrewReassignDisabled, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
kmyquest.MQ204EnableLayer = InputEnableLayer.Create()
kmyquest.MQ204EnableLayer.EnableFastTravel(False)
kmyquest.MQ204EnableLayer.EnableGravJump(False)

Alias_LodgeFrontDoor.GetRef().BlockActivation()
Alias_LodgeRoofDoor.GetRef().BlockActivation()
ObjectReference SecretDoorREF = Alias_LodgeSecretDoor.GetRef()
SecretDoorREF.BlockActivation()
SecretDoorREF.Lock()
SecretDoorREF.SetLockLevel(254)

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

MQ204A_004_NoelAmbient.Start()

;make sure table display is correct
Alias_LodgeDisplay.GetRef().PlayAnimation("Play02")

SetStage(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
;Constellation followers are now unavailable

MQ202.SetStage(1000)
SetObjectiveDisplayed(50)

;set Lodge actors to be afraid
MQ00_CompanionAtLodge.GetActorRef().ChangeAnimFaceArchetype(AnimFaceArchetypeAfraid)
Alias_MatteoKhatri.GetActorRef().ChangeAnimFaceArchetype(AnimFaceArchetypeAfraid)
Alias_Noel.GetActorRef().ChangeAnimFaceArchetype(AnimFaceArchetypeAfraid)
Alias_WalterStroud.GetActorRef().ChangeAnimFaceArchetype(AnimFaceArchetypeAfraid)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
;prepare Armillary animations
Alias_Armillary.GetRef().PlayAnimation("Collect")

MQ204A_004_NoelAmbient.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0067_Item_00
Function Fragment_Stage_0067_Item_00()
;BEGIN CODE
;fire Armillary animations
Alias_Armillary.GetRef().PlayAnimation("Activate")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0068_Item_00
Function Fragment_Stage_0068_Item_00()
;BEGIN CODE
MQ204A_008b_WalterGrabbed.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
MQ204A_008_NoelPackUp.Start()

SetObjectiveCompleted(50)
SetObjectiveDisplayed(55)
SetObjectiveDisplayedAtTop(55)
SetObjectiveDisplayed(60)

;dismiss companion
Actor CompanionAtLodgeREF = MQ00_CompanionAtLodge.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleInActive(CompanionAtLodgeREF)
CompanionAtLodgeREF.EvaluatePackage()

;dismiss Vasco
Actor VascoREF = Alias_Vasco.GetActorRef()
(SQ_Followers as SQ_FollowersScript).SetRoleInActive(VascoREF)
VascoREF.EvaluatePackage()

;ghost Noel
Actor NoelREF = Alias_Noel.GetActorRef()
NoelREF.SetGhost()

;everyone takes up defensive positions
NoelREF.EvaluatePackage()
Alias_WalterStroud.GetActorRef().EvaluatePackage()
Alias_SamCoe.GetActorRef().EvaluatePackage()
Alias_CoraCoe.GetActorRef().EvaluatePackage()
Alias_SarahMorgan.GetActorRef().EvaluatePackage()
Alias_Barrett.GetActorRef().EvaluatePackage()
Alias_Andreja.GetActorRef().EvaluatePackage()
Alias_MatteoKhatri.GetActorRef().EvaluatePackage()

;disallow CF01 special arrest dialogue
MQ204_TurnOffCF01Arrest.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
MQ204A_008a_NoelPackUp.Stop()
MQ204A_007_ActivateDoor.Start()
Alias_LodgeFrontDoor.GetRef().BlockActivation(False)
Alias_LodgeRoofDoor.GetRef().BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
MQ204A_008a_NoelPackUp.Stop()

Actor WalterREF = Alias_WalterStroud.GetActorRef()
Actor HunterREF = Alias_TheHunter.GetActorRef()

WalterREF.SetGhost()
WalterREF.BlockActivation()

HunterREF.Disable()
HunterREF.SetGhost()
HunterREF.moveto(MQ204HunterArrivesMarker)
HunterREF.EvaluatePackage()
HunterREF.Enable()
HunterREF.AddSpell(MQ204HunterInvisibility)

SetObjectiveDisplayed(55, abdisplayed=false)
SetObjectiveDisplayed(80)

MUSGenesisStingerDread1Small.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
MQ204A_008b_WalterChoking.Stop()

MUSGenesisStingerDread1Small.Remove()
MUSGenesisStingerStarbornAppearC.Add()

Actor HunterREF = Alias_TheHunter.GetActorRef()
HunterREF.RemoveSpell(MQ204HunterInvisibility)
WwiseEvent_QST_MQ204_Starborn_VoidForm_End.Play(HunterREF)

Actor WalterREF = Alias_WalterStroud.GetActorRef()
kmyquest.SetActorRecovered(WalterREF)

Actor CompanionLodgeREF = MQ00_CompanionAtLodge.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()
Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()

;set up group follow for later escape sequence
WalterREF.SetGroupFaction(MQ204RunningGroupFaction)
CompanionLodgeREF.SetGroupFaction(MQ204RunningGroupFaction)
VascoREF.SetGroupFaction(MQ204RunningGroupFaction)
MatteoREF.SetGroupFaction(MQ204RunningGroupFaction)

SetObjectiveDisplayed(60, abdisplayed=false)
SetObjectiveDisplayed(55, abdisplayed=false)
SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)

;companion at Eye will die
Actor CompanionAtEyeREF = MQ00_CompanionAtEye.GetActorRef()
MQ00_CompanionWhoDies.ForceRefTo(CompanionAtEyeREF)
MQ00_CompanionWhoLives.ForceRefTo(CompanionLodgeREF)

kmyquest.SetDeathFurnitureKeywords(akVictim=CompanionAtEyeREF, akSurvivor=CompanionLodgeREF, akfurniture=MQ204_EyeDeathMarker)

MQ204EyeCompanionDeadEnableMarker.EnableNoWait()

;set face on dying companion
CompanionAtEyeREF.ChangeAnimFaceArchetype(AnimFaceArchetypeEyesClosed)

;block the Lodge Doors and the doors in the Well
ObjectReference FrontDoorREF = Alias_LodgeFrontDoor.GetRef()
ObjectReference RoofDoorREF = Alias_LodgeRoofDoor.GetRef()
ObjectReference FrontDoorExtREF = Alias_LodgeFrontDoorExterior.GetRef()
ObjectReference RoofDoorExtREF = Alias_LodgeRoofDoorExterior.GetRef()

FrontDoorREF.BlockActivation()
FrontDoorREF.Lock()
FrontDoorREF.SetLockLevel(254)
RoofDoorREF.BlockActivation()
RoofDoorREF.Lock()
RoofDoorREF.SetLockLevel(254)
FrontDoorExtREF.BlockActivation()
FrontDoorExtREF.Lock()
FrontDoorExtREF.SetLockLevel(254)
RoofDoorExtREF.BlockActivation()
RoofDoorExtREF.Lock()
RoofDoorExtREF.SetLockLevel(254)

;If Sam is NOT the companion at the Lodge, then he's injured on the Eye for the Cora scene
If MQ00_CompanionAtLodge.GetActorRef() != Alias_SamCoe.GetActorRef()
  SetStage(322)
EndIf

;guard ships orbitting jemison are disabled
JemisonGuardShipsEnableMarker.DisableNoWait()

;shutdown any guard ship quests that may be running
SQ_GuardShips.Stop()
SQ_GuardShips00.Stop()
SQ_GuardShips01.Stop()

; Well barricades up
MQ204_BarricadeEnableMarker.EnableNoWait()

; Restrict elevator travel from the Well
LoadElevatorManagerScript wellElevatorManagerToMAST = Alias_WellElevatorManagerToMAST.GetRef() as LoadElevatorManagerScript
wellElevatorManagerToMAST.SetElevatorOperational(false)

LoadElevatorFloorScript wellElevatorFloorWaterfall = Alias_WellElevatorFloor_Waterfall.GetRef() as LoadElevatorFloorScript
wellElevatorFloorWaterfall.SetAccessible(false)


Actor SavedCompanionREF = MQ00_CompanionWhoLives.GetActorRef()
;track which companion was saved in a global
If SavedCompanionREF == Alias_Andreja.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_Andreja.GetValueInt())
ElseIf SavedCompanionREF == Alias_Barrett.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) 
ElseIf SavedCompanionREF == Alias_SamCoe.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) 
ElseIf SavedCompanionREF == Alias_SarahMorgan.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) 
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
MQ204A_008b_WalterGrabbed.Stop()
MQ204A_008c_WalterChoking.Stop()
MQ204A_009_HunterArrives.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
Actor TheHunterREF = Alias_TheHunter.GetActorRef()
Actor PlayerREF = Game.GetPlayer()
Actor WalterREF = Alias_WalterStroud.GetActorRef()

;turn off crime
Game.SetPlayerReportCrime(False)

WalterREF.SetGhost(False)
TheHunterREF.AddSpell(abAIPower_MoonForm_Hunter)
TheHunterREF.SetGhost(False)
TheHunterREF.AddtoFaction(PlayerEnemyFaction)
TheHunterREF.StartCombat(PlayerREF)
TheHunterREF.EvaluatePackage()

If GetStageDone(100)
  MQ204A_010_ArtifactPackUp.Start()
EndIf

PlayerREF.addtoFaction(MQ204UCAllyFaction)

;New Atlantis warning signs up
UC04_Spaceport_WarningSign_EnableMarker.Disable()

MQ204_WellEnableState.DisableNoWait()

WalterREF.BlockActivation(False)

MUSGenesisCombatBoss_MQ204_A_Hunter.Add() ;add combat music

;CF05 handling - if CF05 running MQ204 spaceship will be enabled in stage 703 to ensure event order is correct
If CF05.GetStageDone(500) && !CF05.GetStageDone(721)
  CF05.SetStage(703)
else
   Alias_SpaceportShip.GetShipRef().EnableNoWait()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Actor NoelREF = Alias_Noel.GetActorRef()
ObjectReference ArmillaryREF = Alias_ArtifactCollectionTrigger.GetRef() 
ArmillaryREF.BlockActivation(True, True)
(ArmillaryREF as ArmillaryScript).PackupArmillary(NoelREF)
Alias_Armillary.GetRef().DisableNoWait()

;unlock the secret door
MQ204SecretDoorREF.BlockActivation(False, False)
MQ204SecretDoorREF.SetFactionOwner(ConstellationFaction)
MQ204SecretDoorREF.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
MQ204A_011b_EveryoneRuns.Start()

SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_Noel.GetActorRef().EvaluatePackage()
Alias_TheHunter.GetActorRef().EvaluatePackage()

SetStage(115)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0127_Item_00
Function Fragment_Stage_0127_Item_00()
;BEGIN CODE
MQ204A_011_NoelRuns.Stop()
MQ204A_011b_EveryoneRuns.Stop()

Alias_Noel.GetActorRef().Moveto(MQ204_NoelWellEscort_Marker)
Alias_WalterStroud.GetActorRef().moveto(MQ204_RunMarker_Walter02)
Alias_CompanionAtLodge.GetActorRef().moveto(MQ204_RunMarker_Companion02)
Alias_Vasco.GetActorRef().moveto(MQ204_RunMarker_Vasco02)
Alias_MatteoKhatri.GetActorRef().moveto(MQ204_RunMarker_Matteo02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0127_Item_01
Function Fragment_Stage_0127_Item_01()
;BEGIN CODE
Alias_CoraCoe.GetActorRef().Moveto(MQ204_RunMarker_Cora02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(105)

Alias_Noel.GetActorRef().EvaluatePackage()
Alias_MatteoKhatri.GetActorRef().EvaluatePackage()
Alias_WalterStroud.GetActorRef().EvaluatePackage()
Alias_Vasco.GetActorRef().EvaluatePackage()
Alias_CompanionAtLodge.GetActorRef().EvaluatePackage()
MQ204A_012b_InCity.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_00
Function Fragment_Stage_0132_Item_00()
;BEGIN CODE
Alias_Noel.GetActorRef().Moveto(MQ204NoelRuntoSpaceport)
Alias_WalterStroud.GetActorRef().moveto(MQ204_RunMarker_Walter03)
Alias_CompanionAtLodge.GetActorRef().moveto(MQ204_RunMarker_Companion03)
Alias_Vasco.GetActorRef().moveto(MQ204_RunMarker_Vasco03)
Alias_MatteoKhatri.GetActorRef().moveto(MQ204_RunMarker_Matteo03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_01
Function Fragment_Stage_0132_Item_01()
;BEGIN CODE
Alias_CoraCoe.GetActorRef().moveto(MQ204_RunMarker_Cora03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0134_Item_00
Function Fragment_Stage_0134_Item_00()
;BEGIN CODE
Alias_Noel.GetActorRef().EvaluatePackage()
Alias_MatteoKhatri.GetActorRef().EvaluatePackage()
Alias_WalterStroud.GetActorRef().EvaluatePackage()
Alias_Vasco.GetActorRef().EvaluatePackage()
Alias_CompanionAtLodge.GetActorRef().EvaluatePackage()

MQ204A_012b_InCity.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
;disable Vasco since he can't be allowed in the ship
Actor VascoREF = Alias_Vasco.GetActorRef()
VascoREF.Disable()

;make sure player can board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

Actor CompanionAtLodgeREF = MQ00_CompanionAtLodge.GetActorRef()
ObjectReference PassengerMarkerREF = Alias_PlayerPassengerMarker.GetRef()
Actor VladimirREF = Alias_Vladimir.GetActorRef()
Actor WalterREF = Alias_WalterStroud.GetActorRef()
Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
Actor NoelREF = Alias_Noel.GetActorRef()

kmyquest.MQ204MoveActor(CompanionAtLodgeREF, PassengerMarkerREF)
kmyquest.MQ204MoveActor(WalterREF, PassengerMarkerREF)
kmyquest.MQ204MoveActor(MatteoREF, PassengerMarkerREF)
kmyquest.MQ204MoveActor(NoelREF, PassengerMarkerREF)

SetObjectiveCompleted(100)
SetObjectiveCompleted(105)
SetObjectiveDisplayed(110)

MQ204A_011b_EveryoneRuns.Stop()
MQ204A_012c_Spaceport.Stop()
MQ204A_012c_InShip.Start()

;swap clutter state in Lodge to post-attack
MQ204LodgeAttackClutterEnableMarker.Enable()

;reset group faction after escape sequence
WalterREF.SetGroupFaction(None)
CompanionAtLodgeREF.SetGroupFaction(None)
VascoREF.SetGroupFaction(None)
MatteoREF.SetGroupFaction(None)

;also make sure stage 136 was set
SetStage(136)

;disable spaceport ship that just exists to takeoff
Alias_SpaceportShip.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_01
Function Fragment_Stage_0135_Item_01()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
kmyquest.MQ204MoveActor(Alias_CoraCoe.GetActorRef(), Alias_PlayerPassengerMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0136_Item_00
Function Fragment_Stage_0136_Item_00()
;BEGIN CODE
Alias_Noel.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
MQ204A_012d_InShip.Stop()

SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor VladimirREF = Alias_Vladimir.GetActorRef()
Actor WalterREF = Alias_WalterStroud.GetActorRef()
Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()
Actor NoelREF = Alias_Noel.GetActorRef()

Actor CompanionWhoLivesREF = MQ00_CompanionWhoLives.GetActorRef()
Actor CompanionWhoDiesREF = MQ00_CompanionWhoDies.GetActorRef()
Actor CompanionAtLodgeREF = MQ00_CompanionAtLodge.GetActorRef() 

kmyquest.MQ204MoveActor(VladimirREF, EyeMarker)

;failsafe move actors when player enters Lodge
If CompanionAtLodgeREF != AndrejaREF
  kmyquest.MQ204MoveActor(AndrejaREF, EyeMarker)
EndIf

If CompanionAtLodgeREF != SarahMorganREF
  kmyquest.MQ204MoveActor(SarahMorganREF, EyeMarker)
EndIf

If CompanionAtLodgeREF != BarrettREF 
  kmyquest.MQ204MoveActor(BarrettREF, EyeMarker)
EndIf

If CompanionAtLodgeREF != SamCoeREF 
  kmyquest.MQ204MoveActor(SamCoeREF, EyeMarker)
EndIf

CompanionAtLodgeREF.moveto(EyeMarker)

CompanionWhoLivesREF.BlockActivation(True, True) ;make sure player cannot activate them and interrupt

;ghost actors who need to be in special furniture
CompanionWhoLivesREF.SetGhost(True)
CompanionWhoDiesREF.SetGhost(True)

;Set up the actors on the Eye who have been attacked but won't die
kmyquest.SetActorHunterAttacked(VladimirREF)
If (CompanionWhoDiesREF == AndrejaREF) || (CompanionWhoLivesREF == AndrejaREF)
  ;do nothing
Else
  kmyquest.SetActorHunterAttacked(AndrejaREF)
EndIf

If (CompanionWhoDiesREF == BarrettREF) || (CompanionWhoLivesREF == BarrettREF)
  ;do nothing
Else
  kmyquest.SetActorHunterAttacked(BarrettREF)
EndIf

If (CompanionWhoDiesREF == SamCoeREF) || (CompanionWhoLivesREF == SamCoeREF)
  ;do nothing
Else
  kmyquest.SetActorHunterAttacked(SamCoeREF)
EndIf

If (CompanionWhoDiesREF == SarahMorganREF) || (CompanionWhoLivesREF == SarahMorganREF)
  ;do nothing
Else
  kmyquest.SetActorHunterAttacked(SarahMorganREF)
EndIf

SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
MQ204A_013_HunterScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0152_Item_00
Function Fragment_Stage_0152_Item_00()
;BEGIN CODE
Actor HunterREF = Alias_TheHunter.GetActorRef()
Actor PlayerREF = Game.GetPlayer()
HunterREF.EvaluatePackage()
HunterREF.StartCombat(PlayerREF, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0153_Item_00
Function Fragment_Stage_0153_Item_00()
;BEGIN CODE
MQ204A_013_HunterScene01.Stop()
MQ204A_013_HunterScene01b.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0154_Item_00
Function Fragment_Stage_0154_Item_00()
;BEGIN CODE
Actor HunterREF = Alias_TheHunter.GetActorRef()
Actor PlayerREF = Game.GetPlayer()
HunterREF.EvaluatePackage()
HunterREF.StartCombat(PlayerREF, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN CODE
MQ204A_013_HunterScene01.Stop()
MQ204A_013_HunterScene01b.Stop()
MQ204A_013_HunterScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0157_Item_00
Function Fragment_Stage_0157_Item_00()
;BEGIN CODE
Actor HunterREF = Alias_TheHunter.GetActorRef()
Actor PlayerREF = Game.GetPlayer()
HunterREF.EvaluatePackage()
HunterREF.StartCombat(PlayerREF, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(140)

Actor VladimirREF = Alias_Vladimir.GetActorRef()
VladimirREF.EvaluatePackage()
;VladimirREF.Moveto(MQ204_Stage200EyeMarker_Vladimir)

;move Noel
Alias_Noel.GetActorRef().moveto(MQ204_Stage200EyeMarker_Noel)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
MQ204A_016_ReturnScene.Start()

SetObjectiveCompleted(140)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef()

DeadCompanionREF.BlockActivation(True, True)
DeadCompanionREF.SetUnconscious()
DeadCompanionREF.SetValue(COM_IsRomantic, 0) ;make sure you're no longer considered romantic with this companion
DeadCompanionREF.SetValue(COM_IsCommitted, 0)
Game.RemoveFromAvailableCrew(DeadCompanionREF)

;track which companion died in a global
If DeadCompanionREF == AndrejaREF
  MQ_CompanionDead.SetValueInt(COM_CompanionID_Andreja.GetValueInt())

  If COM_Quest_Andreja_Q01.IsRunning()
    COM_Quest_Andreja_Q01.SetStage(20000) ;fail companion quest
  EndIf

  If COM_Companion_Andreja.IsObjectiveDisplayed(10)
    COM_Companion_Andreja.SetObjectiveDisplayed(10, False, False)
  EndIf

ElseIf DeadCompanionREF == BarrettREF
  MQ_CompanionDead.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) 

  If COM_Quest_Barrett_Q01.IsRunning()
    COM_Quest_Barrett_Q01.SetStage(20000) ;fail companion quest
  EndIf

  If COM_Quest_Barrett_Q02.IsRunning()
    COM_Quest_Barrett_Q02.SetStage(20000) ;fail companion quest
  EndIf

  If COM_Companion_Barrett.IsObjectiveDisplayed(900)
    COM_Companion_Barrett.SetObjectiveDisplayed(900, False, False)
  EndIf

ElseIf DeadCompanionREF == SamCoeREF
  MQ_CompanionDead.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) 

  If COM_Quest_SamCoe_Q01.IsRunning()
    COM_Quest_SamCoe_Q01.SetStage(20000) ;fail companion quest
  EndIf

  If COM_Companion_SamCoe.IsObjectiveDisplayed(10)
    COM_Companion_SamCoe.SetObjectiveDisplayed(10, False, False)
  EndIf

  If COM_Companion_SamCoe.IsObjectiveDisplayed(798)
    COM_Companion_SamCoe.SetObjectiveDisplayed(798, False, False)
  EndIf

  If COM_Companion_SamCoe.IsObjectiveDisplayed(801)
    COM_Companion_SamCoe.SetObjectiveDisplayed(801, False, False)
  EndIf

  If COM_Companion_SamCoe.IsObjectiveDisplayed(802)
    COM_Companion_SamCoe.SetObjectiveDisplayed(802, False, False)
  EndIf

ElseIf DeadCompanionREF == SarahMorganREF
  MQ_CompanionDead.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) 

  If COM_Quest_SarahMorgan_Q01.IsRunning()
    COM_Quest_SarahMorgan_Q01.SetStage(20000) ;fail companion quest
  EndIf

  If COM_Companion_SarahMorgan.IsObjectiveDisplayed(10)
    COM_Companion_SarahMorgan.SetObjectiveDisplayed(10, False, False)
  EndIf

EndIf

;companion who lives follows you again
Actor CompanionWhoLivesREF = MQ00_CompanionWhoLives.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).SetRoleActive(CompanionWhoLivesREF)
(SQ_Companions as SQ_CompanionsScript).LockInCompanion(CompanionWhoLivesREF as CompanionActorScript, True, MQ204CompanionLockInMSG)
CompanionWhoLivesREF.EvaluatePackage()
CompanionWhoLivesREF.BlockActivation(False, False)
CompanionWhoLivesREF.SetGhost(False)

  if AndrejaRef != DeadCompanionREF
    AndrejaREF.SetValue(CrewReassignDisabled, 0)
  endif
  if BarrettREF != DeadCompanionREF
    BarrettREF.SetValue(CrewReassignDisabled, 0)
  endif
  if SamCoeREF != DeadCompanionREF
    SamCoeREF.SetValue(CrewReassignDisabled, 0)
  endif
  if SarahMorganREF != DeadCompanionREF
    SarahMorganREF.SetValue(CrewReassignDisabled, 0)
  endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor VladimirREF = Alias_Vladimir.GetActorRef()
VladimirREF.SetActivateTextOverride(None)
VladimirREF.EvaluatePackage()

;track if player found everyone
kmyquest.CheckEyeActors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef()
Actor LivesCompanionREF = MQ00_CompanionWhoLives.GetActorRef()
Actor AndrejaREF = Alias_Andreja.GetActorRef()

;if this is the companion that dies or the companion that lives, advance quest
If DeadCompanionREF == AndrejaREF
  SetStage(300)
ElseIf LivesCompanionREF == AndrejaREF
  SetStage(440)
EndIf

;track if player found everyone
kmyquest.RescuedActor(AndrejaREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef()
Actor LivesCompanionREF = MQ00_CompanionWhoLives.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()

;if this is the companion that dies or the companion that lives, advance quest
If DeadCompanionREF == BarrettREF
  SetStage(300)
ElseIf LivesCompanionREF == BarrettREF
  SetStage(440)
EndIf

;track if player found everyone
kmyquest.RescuedActor(BarrettREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0322_Item_00
Function Fragment_Stage_0322_Item_00()
;BEGIN CODE
;prepare variant scene if sam will die
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
If MQ00_CompanionWhoDies.GetActorRef() == SamCoeREF
  SetStage(324)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
;play variant scene based on whether Sam dies or is just injured
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
If MQ00_CompanionWhoDies.GetActorRef() == SamCoeREF
  MQ204A_030a_DeathCoraScene.Start()
ElseIf Alias_Companion.GetActorRef() != SamCoeREF
  MQ204A_020a_MedstimSam.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef()
Actor LivesCompanionREF = MQ00_CompanionWhoLives.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor CoraREF = Alias_CoraCoe.GetActorRef()

;if this is the companion that dies or the companion that lives, advance quest
If DeadCompanionREF == SamCoeREF
  Game.GetPlayer().SetValue(MQ204SamDied, 1)
  SetStage(300)
ElseIf LivesCompanionREF == SamCoeREF
  SetStage(440)
EndIf

;track if player found everyone
kmyquest.RescuedActor(SamCoeREF)

;clear Cora overrides
CoraREF.SetGhost(False)
CoraREF.SetActivateTextOverride(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef()
Actor LivesCompanionREF = MQ00_CompanionWhoLives.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()

;if this is the companion that dies or the companion that lives, advance quest
If DeadCompanionREF == SarahMorganREF
  SetStage(300)
ElseIf LivesCompanionREF == SarahMorganREF
  SetStage(440)
EndIf

;track if player found everyone
kmyquest.RescuedActor(SarahMorganREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
MatteoREF.SetActivateTextOverride(None)
MatteoREF.SetGhost(False)

kmyquest.CheckLodgeActors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor WalterREF = Alias_WalterStroud.GetActorRef()
WalterREF.SetActivateTextOverride(None)
WalterREF.SetGhost(False)

kmyquest.CheckLodgeActors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor VascoREF = Alias_Vasco.GetActorRef()
kmyquest.SetActorRecovered(VascoREF)
VascoREF.SetActivateTextOverride(None)
VascoREF.SetGhost(False)

kmyquest.CheckLodgeActors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
;If we're on the Lodge path, update quest
If GetStageDone(100)
  SetStage(170)
EndIf

;If we're on the Eye path, update quest
If GetStageDone(400)
  SetStage(450)
EndIF

Alias_Vladimir.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
kmyquest.MQ204EnableLayer = None ;player can travel to Eye

;make sure player can board the Eye
Game.GetPlayer().addtoFaction(EyeBoardingFaction)

SetObjectiveDisplayed(55, abDisplayed=False)
SetObjectiveDisplayed(80, abDisplayed=False)
SetObjectiveDisplayed(60, abForce=True)

;block the Lodge Doors
ObjectReference FrontDoorREF = Alias_LodgeFrontDoor.GetRef()
ObjectReference RoofDoorREF = Alias_LodgeRoofDoor.GetRef()
ObjectReference FrontDoorExtREF = Alias_LodgeFrontDoorExterior.GetRef()
ObjectReference RoofDoorExtREF = Alias_LodgeRoofDoorExterior.GetRef()

FrontDoorREF.BlockActivation()
FrontDoorREF.Lock()
FrontDoorREF.SetLockLevel(254)
RoofDoorREF.BlockActivation()
RoofDoorREF.Lock()
RoofDoorREF.SetLockLevel(254)
FrontDoorExtREF.BlockActivation()
FrontDoorExtREF.Lock()
FrontDoorExtREF.SetLockLevel(254)
RoofDoorExtREF.BlockActivation()
RoofDoorExtREF.Lock()
RoofDoorExtREF.SetLockLevel(254)

MQ204A_007_ActivateDoor.Stop()

;companion at Lodge will die
Actor CompanionAtLodgeREF = MQ00_CompanionAtLodge.GetActorRef()
Actor CompanionAtEyeREF = MQ00_CompanionAtEye.GetActorRef()
MQ00_CompanionWhoDies.ForceRefTo(CompanionAtLodgeREF)
MQ00_CompanionWhoLives.ForceRefTo(CompanionAtEyeREF)

MQ204LodgeCompanionDeadEnableMarker.EnableNoWait()

kmyquest.SetDeathFurnitureKeywords(akVictim=CompanionAtLodgeREF, akSurvivor=CompanionAtEyeREF, akFurniture=MQ204LodgeDeathMarker)

;set face on dying companion
CompanionAtLodgeREF.ChangeAnimFaceArchetype(AnimFaceArchetypeEyesClosed)

;put Hunter back
Alias_TheHunter.GetActorRef().Moveto(MQHoldingCellCenterMarker)

;if Sam is the companion at the Lodge, then he's injured at the Lodge for the Cora scene
If MQ00_CompanionAtLodge.GetActorRef() == Alias_SamCoe.GetActorRef()
  SetStage(323)
EndIf

;If Sam is NOT the companion at the Lodge, then he's injured on the Eye for the Cora scene
If MQ00_CompanionAtLodge.GetActorRef() != Alias_SamCoe.GetActorRef()
  SetStage(322)
EndIf

;Lodge Clutter state is post-attack
MQ204LodgeAttackClutterEnableMarker.Enable()

Actor SavedCompanionREF = MQ00_CompanionWhoLives.GetActorRef()
;track which companion was saved in a global
If SavedCompanionREF == Alias_Andreja.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_Andreja.GetValueInt())
ElseIf SavedCompanionREF == Alias_Barrett.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) 
ElseIf SavedCompanionREF == Alias_SamCoe.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) 
ElseIf SavedCompanionREF == Alias_SarahMorgan.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) 
EndIf

MQ204A_004_NoelAmbient.Stop()
MQ204A_008b_WalterGrabbed.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor VladimirREF = Alias_Vladimir.GetActorRef()
Actor WalterREF = Alias_WalterStroud.GetActorRef()
Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()
Actor NoelREF = Alias_Noel.GetActorRef()
Actor CompanionAtLodgeREF = MQ00_CompanionAtLodge.GetActorRef()

If CompanionAtLodgeREF == AndrejaREF
  ;do nothing
Else
  kmyquest.MQ204MoveActor(AndrejaREF, EyeMarker)
EndIf

If CompanionAtLodgeREF == BarrettREF
  ;do nothing
Else
  kmyquest.MQ204MoveActor(BarrettREF, EyeMarker)
EndIf

If CompanionAtLodgeREF == SamCoeREF
  ;do nothing
Else
  kmyquest.MQ204MoveActor(SamCoeREF, EyeMarker)
  kmyquest.MQ204MoveActor(CoraCoeREF, EyeMarker)
EndIf

If CompanionAtLodgeREF == SarahMorganREF
  ;do nothing
Else
  kmyquest.MQ204MoveActor(SarahMorganREF, EyeMarker)
EndIf

kmyquest.MQ204MoveActor(VladimirREF, EyeMarker)

SetStage(420)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
Actor CompanionWhoLivesREF = MQ00_CompanionWhoLives.GetActorRef()
CompanionWhoLivesREF.EvaluatePackage()

Alias_CoraCoe.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(300)

Actor NoelREF = Alias_Noel.GetActorRef()

NoelREF.Disable()
NoelREF.Moveto(MQ204_NoelHidingMarker)
NoelREF.EvaluatePackage()
NoelREF.Enable()

ObjectReference ArmillaryREF = Alias_ArtifactCollectionTrigger.GetRef() 
(ArmillaryREF as ArmillaryScript).PackupArmillary(NoelREF)
Alias_Armillary.GetRef().DisableNoWait()
ArmillaryREF.BlockActivation(True, True)

;unlock the Lodge Doors
ObjectReference FrontDoorREF = Alias_LodgeFrontDoor.GetRef()
ObjectReference RoofDoorREF = Alias_LodgeRoofDoor.GetRef()
ObjectReference FrontDoorExtREF = Alias_LodgeFrontDoorExterior.GetRef()
ObjectReference RoofDoorExtREF = Alias_LodgeRoofDoorExterior.GetRef()


FrontDoorREF.BlockActivation(False)
FrontDoorREF.Lock(False)
FrontDoorREF.SetLockLevel(0)
RoofDoorREF.BlockActivation(False)
RoofDoorREF.Lock(False)
RoofDoorREF.SetLockLevel(0)
FrontDoorExtREF.BlockActivation(False)
FrontDoorExtREF.Lock(False)
FrontDoorExtREF.SetLockLevel(0)
RoofDoorExtREF.BlockActivation(False)
RoofDoorExtREF.Lock(False)
RoofDoorExtREF.SetLockLevel(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0455_Item_00
Function Fragment_Stage_0455_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor CompanionAtEyeREF = MQ00_CompanionAtEye.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
ObjectReference PassengerMarkerREF = Alias_PlayerPassengerMarker.GetRef()

kmyquest.MQ204MoveActor(CompanionAtEyeREF, PassengerMarkerREF)

If CompanionAtEyeREF == SamCoeREF
  kmyquest.MQ204MoveActor(CoraCoeREF, PassengerMarkerREF)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor VladimirREF = Alias_Vladimir.GetActorRef()
Actor WalterREF = Alias_WalterStroud.GetActorRef()
Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()
Actor NoelREF = Alias_Noel.GetActorRef()
Actor CompanionWhoLivesREF = MQ00_CompanionWhoLives.GetActorRef()
Actor CompanionWhoDiesREF = MQ00_CompanionWhoDies.GetActorRef()

kmyquest.MQ204EnableLayer = InputEnableLayer.Create()
kmyquest.MQ204EnableLayer.EnableFastTravel(False)
kmyquest.MQ204EnableLayer.EnableGravJump(False)

SetObjectiveCompleted(300)
SetObjectiveDisplayed(310)

;Well Barricades up
MQ204_BarricadeEnableMarker.Enable()

; Restrict elevator travel from the Well
LoadElevatorManagerScript wellElevatorManagerToMAST = Alias_WellElevatorManagerToMAST.GetRef() as LoadElevatorManagerScript
wellElevatorManagerToMAST.SetElevatorOperational(false)

LoadElevatorFloorScript wellElevatorFloorWaterfall = Alias_WellElevatorFloor_Waterfall.GetRef() as LoadElevatorFloorScript
wellElevatorFloorWaterfall.SetAccessible(false)

;ghost actors who need to be in special furniture
CompanionWhoLivesREF.EvaluatePackage()
CompanionWhoLivesREF.BlockActivation(True, True)
CompanionWhoLivesREF.SetGhost(True)
CompanionWhoDiesREF.SetGhost(True)

CompanionWhoLivesREF.moveto(LodgeStartMarker)
kmyquest.MQ204MoveActor(CompanionWhoDiesREF, MQ204LodgeDeathNearMarker) 
If CompanionWhoDiesREF == SamCoeREF
  kmyquest.MQ204MoveActor(CoraCoeREF, LodgeStartMarker)
EndIf

kmyquest.MQ204MoveActor(WalterREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(MatteoREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(VascoREF, LodgeStartMarker)

;put Vasco in bleedout
kmyquest.SetActorInBleedOut(VascoREF)

kmyquest.SetActorHunterAttacked(MatteoREF)
kmyquest.SetActorHunterAttacked(VascoREF)
kmyquest.SetActorHunterAttacked(WalterREF)

;make sure Walter is activateable
WalterREF.SetGhost(False)
WalterREF.BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
SetObjectiveCompleted(310)
SetObjectiveDisplayed(320)

;unlock the secret door
MQ204SecretDoorREF.BlockActivation(False, False)
MQ204SecretDoorREF.SetFactionOwner(ConstellationFaction)
MQ204SecretDoorREF.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Game.StopDialogueCamera()

;prevent player from fast travelling
kmyquest.MQ204EnableLayer.EnableFastTravel(False)
kmyquest.MQ204EnableLayer.EnableGravJump(False)
kmyquest.MQ204EnableLayer.EnableFarTravel(False)

;block doors
MQ204DoortoLodgeREF.BlockActivation()
MQ204DoortoLodgeREF.Lock()
MQ204DoortoLodgeREF.SetLockLevel(254)

;guard ships orbitting jemison are disabled
JemisonGuardShipsEnableMarker.DisableNoWait()

;shutdown any guard ship quests that may be running
SQ_GuardShips.Stop()
SQ_GuardShips00.Stop()
SQ_GuardShips01.Stop()

;ghost Noel
Actor NoelREF = Alias_Noel.GetActorRef()
NoelREF.SetGhost()

;MQ204A_036b_EveryoneRuns.Start()

;Hunter enters combat
SetStage(105)

;if we somehow skipped rescuing people, then advance forward
SetStage(310)
SetStage(320)
SetStage(330)
SetStage(340)
SetStage(470)

SetObjectiveCompleted(320)
SetObjectiveDisplayed(330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0485_Item_00
Function Fragment_Stage_0485_Item_00()
;BEGIN CODE
Actor HunterREF = Alias_TheHunter.GetActorRef()
HunterREF.RemoveSpell(MQ204HunterInvisibility)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0487_Item_00
Function Fragment_Stage_0487_Item_00()
;BEGIN CODE
Alias_Noel.GetActorRef().Moveto(MQ204NoelRuntoSpaceport)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0488_Item_00
Function Fragment_Stage_0488_Item_00()
;BEGIN CODE
Alias_Noel.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
MQ204A_037_PlayerInShip.Start()

SetObjectiveCompleted(330)
SetObjectiveDisplayed(340)

;disable spaceport ship that just exists to takeoff
Alias_SpaceportShip.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_01
Function Fragment_Stage_0490_Item_01()
;BEGIN CODE
Alias_CoraCoe.GetActorRef().moveto(Alias_PlayerPassengerMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0492_Item_00
Function Fragment_Stage_0492_Item_00()
;BEGIN CODE
SetObjectiveCompleted(340)
SetObjectiveDisplayed(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0495_Item_00
Function Fragment_Stage_0495_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor NoelREF = Alias_Noel.GetActorRef()
kmyquest.MQ204MoveActor(NoelREF, EyeMarker)

Alias_Vladimir.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(350)
SetObjectiveDisplayed(360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
MQAlllowArmillaryGravDrive.SetValueInt(1)
Alias_HomeShipArmillaryScreenTrigger.GetRef().Enable()

SetObjectiveCompleted(150)
SetObjectiveCompleted(360)
SetObjectiveDisplayed(500)
SetObjectiveDisplayedAtTop(500)
SetObjectiveDisplayed(510)

;give player the Artifacts
kmyquest.PlayerReceivesArtifacts()

;add required components for workshop
Game.GetPlayer().additem(Mfg_Tier01_Structural_Frame, 2)

;make sure Vasco is enabled and in the Lodge if we disabled him before
Actor VascoREF = Alias_Vasco.GetActorRef()
If VascoREF.IsDisabled()
  VascoREF.EvaluatePackage()
  VascoREF.Moveto(LodgeStartMarker)
  VascoREF.Enable()
EndIf

MQ204ArmillaryBuildMSG.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=False)
kmyquest.MQ204EnableLayer.DisablePlayerControls()

;Scorpius arrives
SpaceshipReference ScorpiusREF = Alias_TheScorpius.GetShipReference()
SpaceshipReference PlayerShipREF = Alias_PlayerShip.GetShipReference()
ScorpiusREF.SetGhost()
ScorpiusREF.MoveNear(playerShipRef, 1, 0, 0)
ScorpiusREF.EnableWithGravJump()

MQ204A_052_ScorpiusScene.Start()

MUSGenesisStingerStarbornAppearC.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Actor TheHunterREF = Alias_TheHunter.GetActorRef()

;turn off combat music
MUSGenesisStingerStarbornAppearC.Remove()
MUSGenesisCombatBoss_MQ204_A_Hunter.Remove()

;player is no longer allied to guards
PlayerREF.RemoveFromFaction(MQ204UCAllyFaction)

;turn on crime
Game.SetPlayerReportCrime()

;Hunter is no longer Hostile
TheHunterREF.RemoveFromFaction(PlayerEnemyFaction)
PlayerREF.StopCombatAlarm()
TheHunterREF.Disable()

;Well Barricads off
MQ204_BarricadeEnableMarker.DisableNoWait()

;Restore normal elevator behavior in the Well
LoadElevatorManagerScript wellElevatorManagerToMAST = Alias_WellElevatorManagerToMAST.GetRef() as LoadElevatorManagerScript
wellElevatorManagerToMAST.SetElevatorOperational(true)

LoadElevatorFloorScript wellElevatorFloorWaterfall = Alias_WellElevatorFloor_Waterfall.GetRef() as LoadElevatorFloorScript
wellElevatorFloorWaterfall.SetAccessible(true)

;Scorpius jumps away
SpaceshipReference ScorpiusREF = Alias_TheScorpius.GetShipReference()
ScorpiusREF.SetGhost(False)
ScorpiusREF.DisableWithGravJumpNoWait()

;let player fast travel again
Game.SetInChargen(abDisableSaving=False, abDisableWaiting=False, abShowControlsDisabledMessage=False)
kmyquest.MQ204EnableLayer.EnableFastTravel(True)
kmyquest.MQ204EnableLayer.EnableGravJump(True)
kmyquest.MQ204EnableLayer.EnableFarTravel(True)
kmyquest.MQ204EnableLayer = None

;turn off map marker so you can't immediately fast travel
NewAtlantisMapMarkerLodge.DisableNoWait()
NewAtlantisMapMarkerCommercialDistrict.DisableNoWait()
NewAtlantisMapMarkerWestEnd.DisableNoWait()
NewAtlantisMapMarkerEmbassy.DisableNoWait()
NewAtlantisMapMarkerResidentialDistrict.DisableNoWait()

;unblock doors
;unlock the Lodge Doors
ObjectReference FrontDoorREF = Alias_LodgeFrontDoor.GetRef()
ObjectReference RoofDoorREF = Alias_LodgeRoofDoor.GetRef()
ObjectReference FrontDoorExtREF = Alias_LodgeFrontDoorExterior.GetRef()
ObjectReference RoofDoorExtREF = Alias_LodgeRoofDoorExterior.GetRef()


FrontDoorREF.BlockActivation(False)
FrontDoorREF.Lock(False)
FrontDoorREF.SetLockLevel(0)
RoofDoorREF.BlockActivation(False)
RoofDoorREF.Lock(False)
RoofDoorREF.SetLockLevel(0)
FrontDoorExtREF.BlockActivation(False)
FrontDoorExtREF.Lock(False)
FrontDoorExtREF.SetLockLevel(0)
RoofDoorExtREF.BlockActivation(False)
RoofDoorExtREF.Lock(False)
RoofDoorExtREF.SetLockLevel(0)

MQ204DoortoLodgeREF.BlockActivation(False)
MQ204DoortoLodgeREF.Lock(False)
MQ204DoortoLodgeREF.SetLockLevel(0)

;if on the Eye path, Noel tells you to go to the Eye
If GetStageDone(480)
  SetStage(492)
EndIf

;start postquest dialogue
MQ204xPostQuest.Start()

;reset New Atlantis to clean up any bodies

;un ghost Noel
Actor NoelREF = Alias_Noel.GetActorRef()
NoelREF.SetGhost(False)

;set up the New Atlantis Handler quest
MQ204_NA_StateChangeHandler.SetStageNoWait(10)

;allow CF01 special arrest dialogue
MQ204_TurnOffCF01Arrest.SetValueInt(0)

;re-enable guard ships
JemisonGuardShipsEnableMarker.EnableNoWait()

;make sure player can land on Jemison
NewAtlantisMapMarkerLodge.EnableFastTravel(True)
NewAtlantisMapMarkerCommercialDistrict.EnableFastTravel(True)
NewAtlantisMapMarkerWestEnd.EnableFastTravel(True)
NewAtlantisMapMarkerEmbassy.EnableFastTravel(True)
NewAtlantisMapMarkerResidentialDistrict.EnableFastTravel(True)
NewAtlantisMapMarkerSpaceport.EnableFastTravel(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveCompleted(510)
SetObjectiveDisplayed(520)

;make sure the Companion who dies is dead and disabled
Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef()
DeadCompanionREF.KillEssential()
DeadCompanionREF.Disable()
MQ204EyeCompanionDeadEnableMarker.DisableNoWait()
MQ204LodgeCompanionDeadEnableMarker.DisableNoWait()

MQ204ArmillaryAttackMSG.Show()

;allow CF01 special arrest dialogue
MQ204_TurnOffCF01Arrest.SetValueInt(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor AndrejaREF = Alias_Andreja.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SamCoeREF = Alias_SamCoe.GetActorRef()
Actor CoraCoeREF = Alias_CoraCoe.GetActorRef()
Actor SarahMorganREF = Alias_SarahMorgan.GetActorRef()
Actor VladimirREF = Alias_Vladimir.GetActorRef()
Actor WalterREF = Alias_WalterStroud.GetActorRef()
Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
Actor VascoREF = Alias_Vasco.GetActorRef()
Actor NoelREF = Alias_Noel.GetActorRef()

;failsafe move everyone
kmyquest.MQ204MoveActor(AndrejaREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(BarrettREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(SamCoeREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(CoraCoeREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(SarahMorganREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(WalterREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(MatteoREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(VascoREF, LodgeStartMarker)
kmyquest.MQ204MoveActor(NoelREF, LodgeStartMarker)

;guard ships orbitting jemison are re-enabled
JemisonGuardShipsEnableMarker.EnableNoWait()
MQ206B.Start()

;turn on map markers
NewAtlantisMapMarkerLodge.EnableNoWait()
NewAtlantisMapMarkerCommercialDistrict.EnableNoWait()
NewAtlantisMapMarkerWestEnd.EnableNoWait()
NewAtlantisMapMarkerEmbassy.EnableNoWait()
NewAtlantisMapMarkerResidentialDistrict.EnableNoWait()

;misc objective to companion's possessions
MQMisc02.SetStage(10)

MQ204A_051_LodgeReturnScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
SetObjectiveCompleted(520)
SetObjectiveDisplayed(530)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
MQ204A_060_HunterGoneScene.Start()

;turn on crime
Game.SetPlayerReportCrime()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
If (MQ201B.GetStageDone(2000) == False) && (MQ404.GetStageDone(100) == False)
  MQ206A.SetStage(5)
EndIf

CompleteAllObjectives()

Actor SavedCompanionREF = MQ00_CompanionWhoLives.GetActorRef()
;track which companion was saved in a global
If SavedCompanionREF == Alias_Andreja.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_Andreja.GetValueInt())
ElseIf SavedCompanionREF == Alias_Barrett.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) 
ElseIf SavedCompanionREF == Alias_SamCoe.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) 
ElseIf SavedCompanionREF == Alias_SarahMorgan.GetActorRef()
  MQ_CompanionSaved.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) 
EndIf

;Send Affinity Event
float currentGameTime = Utility.GetCurrentGameTime()
float cooldownTime = (currentGameTime + COM_WantsToTalk_CooldownDays.GetValue())
int i = 0
while i < Alias_Companions.Length
    Alias_Companions[i].GetActorRef().SetValue(COM_WantsToTalk_MQ204_Cooldown, cooldownTime) 
    i += 1
endwhile
COM_WantsToTalkEvent_MQ204.Send()

;Achievement Unlocked
Game.AddAchievement(6)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE mq204script
Quest __temp = self as Quest
mq204script kmyQuest = __temp as mq204script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

PlayerREF.AddtoFaction(EyeBoardingFaction)

;guard ships orbitting jemison are re-enabled
JemisonGuardShipsEnableMarker.EnableNoWait()

;turn on crime
Game.SetPlayerReportCrime()

;make sure music is off
MUSGenesisCombatBoss_MQ204_A_Hunter.Remove()

;turn on map markers
NewAtlantisMapMarkerLodge.EnableNoWait()
NewAtlantisMapMarkerCommercialDistrict.EnableNoWait()
NewAtlantisMapMarkerWestEnd.EnableNoWait()
NewAtlantisMapMarkerEmbassy.EnableNoWait()
NewAtlantisMapMarkerResidentialDistrict.EnableNoWait()

;New Atlantis warning signs off
UC04_Spaceport_WarningSign_EnableMarker.EnableNoWait()

;player is no longer allied to UC guards and citizens
PlayerREF.RemoveFromFaction(MQ204UCAllyFaction)

;unlock the Lodge Doors
ObjectReference FrontDoorREF = Alias_LodgeFrontDoor.GetRef()
ObjectReference RoofDoorREF = Alias_LodgeRoofDoor.GetRef()
ObjectReference FrontDoorExtREF = Alias_LodgeFrontDoorExterior.GetRef()
ObjectReference RoofDoorExtREF = Alias_LodgeRoofDoorExterior.GetRef()

FrontDoorREF.BlockActivation(False)
FrontDoorREF.Lock(False)
FrontDoorREF.SetLockLevel(0)
RoofDoorREF.BlockActivation(False)
RoofDoorREF.Lock(False)
RoofDoorREF.SetLockLevel(0)
FrontDoorExtREF.BlockActivation(False)
FrontDoorExtREF.Lock(False)
FrontDoorExtREF.SetLockLevel(0)
RoofDoorExtREF.BlockActivation(False)
RoofDoorExtREF.Lock(False)
RoofDoorExtREF.SetLockLevel(0)

MQ204DoortoLodgeREF.BlockActivation(False)
MQ204DoortoLodgeREF.Lock(False)
MQ204DoortoLodgeREF.SetLockLevel(0)

;make sure the Companion who dies is dead and disabled
Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef()
DeadCompanionREF.KillEssential()
DeadCompanionREF.Disable()

;make sure Walter's bleedout values are reset
Actor WalterREF = Alias_WalterStroud.GetActorRef()
kmyquest.SetActorRecovered(WalterREF)

;same with Vasco
Actor VascoREF = Alias_Vasco.GetActorRef()
kmyquest.SetActorRecovered(VascoREF)

;remove spells and perks from the Hunter
Actor HunterREF = Alias_TheHunter.GetActorRef()
HunterREF.RemoveSpell(MQ204HunterInvisibility)

;change back anim faces
Actor MatteoREF = Alias_MatteoKhatri.GetActorRef()
Actor VladimirREF = Alias_Vladimir.GetActorRef()
Actor BarrettREF = Alias_Barrett.GetActorRef()
Actor SarahREF = Alias_SarahMorgan.GetActorRef()
Actor SamREF = Alias_SamCoe.GetActorRef()
Actor CoraREF = Alias_CoraCoe.GetActorRef()
Actor NoelREF = Alias_Noel.GetActorRef()
Actor AndrejaREF = Alias_Andreja.GetActorRef()

If DeadCompanionREF != AndrejaREF
  (SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(ActorToUpdate=AndrejaREF, DisplayMessageIfChanged=False)
EndIf

If DeadCompanionREF != BarrettREF
  (SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(ActorToUpdate=BarrettREF, DisplayMessageIfChanged=False)
EndIf

If DeadCompanionREF != SamREF
  (SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(ActorToUpdate=SamREF, DisplayMessageIfChanged=False)
EndIf

If DeadCompanionREF != SarahREF
  (SQ_Companions as SQ_CompanionsScript).SetRoleAvailable(ActorToUpdate=SarahREF, DisplayMessageIfChanged=False)
EndIf

(SQ_Crew as SQ_CrewScript).SetRoleAvailable(ActorToUpdate=VascoREF, DisplayMessageIfChanged=False)

WalterREF.ChangeAnimFaceArchetype(None)
MatteoREF.ChangeAnimFaceArchetype(None)
VladimirREF.ChangeAnimFaceArchetype(None)
BarrettREF.ChangeAnimFaceArchetype(None)
SarahREF.ChangeAnimFaceArchetype(None)
SamREF.ChangeAnimFaceArchetype(None)
CoraREF.ChangeAnimFaceArchetype(None)
NoelREF.ChangeAnimFaceArchetype(None)
AndrejaREF.ChangeAnimFaceArchetype(None)

WalterREF.SetActivateTextOverride(None)
MatteoREF.SetActivateTextOverride(None)
VladimirREF.SetActivateTextOverride(None)
BarrettREF.SetActivateTextOverride(None)
SarahREF.SetActivateTextOverride(None)
SamREF.SetActivateTextOverride(None)
CoraREF.SetActivateTextOverride(None)
NoelREF.SetActivateTextOverride(None)
AndrejaREF.SetActivateTextOverride(None)

;unghost Noel
NoelREF.SetGhost(False)

;companion is no longer locked in
Actor CompanionWhoLivesREF = MQ00_CompanionWhoLives.GetActorRef()
(SQ_Companions as SQ_CompanionsScript).LockInCompanion(CompanionWhoLivesREF as CompanionActorScript, False, MQ204CompanionLockInOverMSG)

;allow CF01 special arrest dialogue
MQ204_TurnOffCF01Arrest.SetValueInt(0)

MQ204_WellEnableState.EnableNoWait()

Alias_TheScorpius.GetShipRef().SetGhost(False)

;if Sona is at the Lodge, re-enable her
If COM_SQ01_SonaLeft.GetValueInt() == 1
  Alias_Sona.GetActorRef().EnableNoWait()
EndIF

kmyQuest.MQ204EnableLayer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property LodgeStartMarker Auto Const Mandatory

ReferenceAlias Property Alias_Vladimir Auto Const Mandatory

ObjectReference Property MQ106_VladimirMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_SamCoe Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

ObjectReference Property MQ106_SamMarker01 Auto Const Mandatory

Scene Property MQ204A_004_NoelAmbient Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

ObjectReference Property MQ204EyeMovetoMarker Auto Const Mandatory

ReferenceAlias Property Alias_LodgeFrontDoor Auto Const Mandatory

Scene Property MQ204A_007_ActivateDoor Auto Const Mandatory

Scene Property MQ204A_008_NoelPackUp Auto Const Mandatory

ObjectReference Property MQ204HunterArrivesMarker Auto Const Mandatory

ReferenceAlias Property Alias_TheHunter Auto Const Mandatory

Scene Property MQ204A_009_HunterArrives Auto Const Mandatory

Scene Property MQ204A_010_HunterBleedout Auto Const Mandatory

Scene Property MQ204A_012_Tunnel Auto Const Mandatory

Message Property MQ204MedStimMSG Auto Const Mandatory

Scene Property MQ204A_014_Vladimir Auto Const Mandatory

Scene Property MQ204A_016_ReturnScene Auto Const Mandatory

ActorValue Property MQ204UCGuard Auto Const Mandatory

ReferenceAlias Property Alias_Noel Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Scene Property MQ204A_031_MedstimSarah Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

ObjectReference Property MQ204_NoelHidingMarker Auto Const Mandatory

ReferenceAlias Property MQ00_CompanionAtLodge Auto Const

ReferenceAlias Property MQ00_CompanionAtEye Auto Const

Scene Property MQ204A_010_ArtifactPackUp Auto Const Mandatory

Scene Property MQ204A_012b_InCity Auto Const Mandatory

ReferenceAlias Property MQ00_CompanionWhoDies Auto Const

ReferenceAlias Property Alias_CompanionAtEye Auto Const Mandatory

ReferenceAlias Property Alias_CompanionAtLodge Auto Const Mandatory

ReferenceAlias Property Alias_WalterStroud Auto Const Mandatory

ReferenceAlias Property Alias_CoraCoe Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_Vasco Auto Const Mandatory

ReferenceAlias Property Alias_MatteoKhatri Auto Const Mandatory

ReferenceAlias Property Alias_LodgeRoofDoor Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

ObjectReference Property NewAtlantisShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

ReferenceAlias Property MQ00_CompanionWhoLives Auto Const

Quest Property MQ206B Auto Const Mandatory

Scene Property MQ204A_051_LodgeReturnScene Auto Const Mandatory

Faction Property ConstellationFaction Auto Const Mandatory

Scene Property MQ204A_012c_InShip Auto Const Mandatory

Scene Property MQ204A_015a_CoraScene Auto Const Mandatory

Quest Property MQ202 Auto Const Mandatory

Quest Property MQ206A Auto Const Mandatory

ObjectReference Property MQ101_PlayerMarker01 Auto Const Mandatory

ObjectReference Property MQ204_NA_HunterMarker Auto Const Mandatory

ObjectReference Property MQ204_NA_PlayerMarker Auto Const Mandatory

GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const Mandatory

GlobalVariable Property COM_CompanionID_SamCoe Auto Const Mandatory

GlobalVariable Property COM_CompanionID_Barret Auto Const Mandatory

GlobalVariable Property COM_CompanionID_Andreja Auto Const Mandatory

GlobalVariable Property MQ_CompanionDead Auto Const Mandatory

GlobalVariable Property COM_CompanionID_Barrett Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

Spell Property MQ204HunterInvisibility Auto Const Mandatory

Faction Property CurrentCompanionFaction Auto Const Mandatory

Scene Property MQ204A_031_MedstimAndreja Auto Const Mandatory

Scene Property MQ204A_031_MedstimBarrett Auto Const Mandatory

Scene Property MQ204A_031_MedstimMatteo Auto Const Mandatory

Scene Property MQ204A_030a_DeathCoraScene Auto Const Mandatory

Scene Property MQ204A_020a_MedstimSam Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

Quest Property SQ_Companions Auto Const Mandatory

Scene Property MQ204A_052_ScorpiusScene Auto Const Mandatory

ReferenceAlias Property Alias_TheScorpius Auto Const Mandatory

ObjectReference Property MQ204ScorpiusMarker Auto Const Mandatory

ObjectReference Property MQ204_Stage200EyeMarker_Noel Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactCollectionTrigger Auto Const Mandatory

Faction Property AvailableCompanionFaction Auto Const Mandatory

Scene Property MQ204A_037_PlayerInShip Auto Const Mandatory

Quest Property MQ204xPostQuest Auto Const Mandatory

ObjectReference Property MQ204Start Auto Const Mandatory

ObjectReference Property JemisonGuardShipsEnableMarker Auto Const Mandatory

Scene Property MQ204A_008a_NoelPackUp Auto Const Mandatory

Key Property LodgeKey Auto Const Mandatory

ObjectReference Property MQ204LodgeAttackClutterEnableMarker Auto Const Mandatory

ObjectReference Property MQ204BasementDoorEnableMarker Auto Const Mandatory

Key Property MQ204WellKey Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory

Scene Property MQ204A_011b_EveryoneRuns Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

ObjectReference Property EyeMarker Auto Const Mandatory

ObjectReference Property MQ204SecretDoorREF Auto Const Mandatory

Spell Property abAIPower_MoonForm_Hunter Auto Const Mandatory

Perk Property crModIncomingDamage00 Auto Const Mandatory

Scene Property MQ204A_012c_Spaceport Auto Const Mandatory

Scene Property MQ204A_013_HunterScene01 Auto Const Mandatory

Scene Property MQ204A_013_HunterScene02 Auto Const Mandatory

ObjectReference Property MQ204DoortoLodgeREF Auto Const Mandatory

Faction Property UCSecurityFaction Auto Const Mandatory

ObjectReference Property UC04_Spaceport_WarningSign_EnableMarker Auto Const Mandatory

Scene Property MQ204A_013_HunterScene01b Auto Const Mandatory

ObjectReference Property MQ204_BarricadeEnableMarker Auto Const Mandatory

MusicType Property MUSGenesisStingerDread1Small Auto Const Mandatory

ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const Mandatory

ObjectReference Property MQ204EyeAttackEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_LodgeFrontDoorExterior Auto Const Mandatory

ReferenceAlias Property Alias_LodgeRoofDoorExterior Auto Const Mandatory

ObjectReference Property MQHoldingCellCenterMarker Auto Const Mandatory

Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const Mandatory

LeveledItem Property MQ204HunterReward Auto Const Mandatory

Scene Property MQ204A_060_HunterGoneScene Auto Const Mandatory

ActorValue Property MQ204SamDied Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipInventory Auto Const Mandatory

MiscObject Property Mfg_Tier01_Structural_Frame Auto Const Mandatory

Faction Property EyeBoardingFaction Auto Const Mandatory

Message Property TestMQ204MSG Auto Const Mandatory

Message Property TestMQ204MSG02 Auto Const Mandatory

Faction Property MQ204RunningGroupFaction Auto Const Mandatory

Keyword Property AnimFaceArchetypeAfraid Auto Const Mandatory

Message Property MQ204ArmillaryAttackMSG Auto Const Mandatory

Keyword Property AnimFaceArchetypeDying Auto Const Mandatory

Scene Property MQ204A_008b_WalterChoking Auto Const Mandatory

ReferenceAlias Property Alias_SpaceportShip Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory

Quest Property FFNewAtlantis05 Auto Const Mandatory

ObjectReference Property MQ204HunterWalterMarkerREF Auto Const Mandatory

Scene Property MQ204A_008b_WalterGrabbed Auto Const Mandatory

Quest Property SQ_Crew Auto Const Mandatory

Scene Property MQ204A_036b_EveryoneRuns Auto Const Mandatory

Scene Property MQ204A_012d_InShip Auto Const Mandatory

GlobalVariable Property MQ_CompanionSaved Auto Const Mandatory

ReferenceAlias Property Alias_LodgeInteriorDoor Auto Const Mandatory

Location Property CityNewAtlantisLocation Auto Const Mandatory

Location Property CityNewAtlantisWellLocation Auto Const Mandatory

GlobalVariable Property MQ204_TurnOffCF01Arrest Auto Const Mandatory

ReferenceAlias Property Alias_PreMQ106Hunter Auto Const Mandatory

Spell Property AbStarbornDeath Auto Const Mandatory

Spell Property AbStarbornTeleport Auto Const Mandatory

Message Property MQ204CompanionLockInMSG Auto Const Mandatory

Message Property MQ204CompanionLockInMidquestLodgeMSG Auto Const Mandatory

Message Property MQ204CompanionLockInMidquestEyeMSG Auto Const Mandatory

Message Property MQ204CompanionLockInOverMSG Auto Const Mandatory

Quest Property MQMisc02 Auto Const Mandatory

Spell Property ffStarbornTeleport Auto Const Mandatory

ReferenceAlias Property Alias_Armillary Auto Const Mandatory

ReferenceAlias Property Alias_LodgeDisplay Auto Const Mandatory

GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const Mandatory

Message Property MQ204ArmillaryBuildMSG Auto Const Mandatory

Quest Property MQ204_NA_StateChangeHandler Auto Const Mandatory

ObjectReference Property NewAtlantisMapMarkerLodge Auto Const Mandatory

ObjectReference Property NewAtlantisMapMarkerCommercialDistrict Auto Const Mandatory

ObjectReference Property NewAtlantisMapMarkerWestEnd Auto Const Mandatory

ObjectReference Property NewAtlantisMapMarkerEmbassy Auto Const Mandatory

ObjectReference Property NewAtlantisMapMarkerResidentialDistrict Auto Const Mandatory

MusicType Property MUSGenesisStingerStarbornAppearC Auto Const Mandatory

ObjectReference Property MQ204_WellEnableState Auto Const Mandatory

ObjectReference Property MQ204_NoelWellEscort_Marker Auto Const Mandatory

ObjectReference Property MQ204_RunMarker_Walter02 Auto Const Mandatory

ObjectReference Property MQ204_RunMarker_Companion02 Auto Const Mandatory

ObjectReference Property MQ204_RunMarker_Vasco02 Auto Const Mandatory

ObjectReference Property MQ204_RunMarker_Matteo02 Auto Const Mandatory

ObjectReference Property MQ204_RunMarker_Walter03 Auto Const Mandatory

ObjectReference Property MQ204_RunMarker_Matteo03 Auto Const Mandatory

ObjectReference Property MQ204_RunMarker_Companion03 Auto Const Mandatory

ObjectReference Property MQ204NoelRuntoSpaceport Auto Const Mandatory

ObjectReference Property MQ204_RunMarker_Vasco03 Auto Const Mandatory

Faction Property MQ204UCAllyFaction Auto Const Mandatory

Scene Property MQ204A_011_NoelRuns Auto Const Mandatory

ObjectReference Property MQ204_Stage200EyeMarker_Vladimir Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_HomeShipArmillaryScreenTrigger Auto Const Mandatory

ReferenceAlias Property Alias_WellElevatorManagerToMAST Auto Const Mandatory

ReferenceAlias Property Alias_WellElevatorFloor_Well Auto Const Mandatory

ReferenceAlias Property Alias_WellElevatorFloor_Waterfall Auto Const Mandatory

Keyword Property AnimFaceArchetypeEyesClosed Auto Const Mandatory

ObjectReference Property MQ204_RunMarker_Cora02 Auto Const Mandatory

ObjectReference Property MQ204_RunMarker_Cora03 Auto Const Mandatory

ReferenceAlias Property Alias_PlayerPassengerMarker Auto Const Mandatory

EffectShader Property Starborn_DeathShader Auto Const Mandatory

Quest Property COM_Quest_Andreja_Q01 Auto Const Mandatory

Quest Property COM_Quest_Barrett_Q01 Auto Const Mandatory

Quest Property COM_Quest_Barrett_Q02 Auto Const Mandatory

Quest Property COM_Quest_SamCoe_Q01 Auto Const Mandatory

Quest Property COM_Quest_SarahMorgan_Q01 Auto Const Mandatory

Quest Property FFLodge01 Auto Const Mandatory

Quest Property FFLodge02 Auto Const Mandatory

Quest Property FFLodge03 Auto Const Mandatory

ObjectReference Property MQ204LodgeDeathMarker Auto Const Mandatory

ObjectReference Property MQ204_EyeDeathMarker Auto Const Mandatory

MusicType Property MUSGenesisCombatBoss_MQ204_A_Hunter Auto Const Mandatory

Scene Property MQ204A_008c_WalterChoking Auto Const Mandatory

ObjectReference Property MQ204EyeCompanionDeadEnableMarker Auto Const Mandatory

ObjectReference Property MQ204LodgeCompanionDeadEnableMarker Auto Const Mandatory

ObjectReference Property MQ204LodgeDeathNearMarker Auto Const Mandatory

ReferenceAlias Property Alias_Sona Auto Const Mandatory

GlobalVariable Property COM_SQ01_SonaLeft Auto Const Mandatory

Quest Property MQ201B Auto Const Mandatory

Quest Property MQ404 Auto Const Mandatory

AffinityEvent Property COM_WantsToTalkEvent_MQ204 Auto Const Mandatory

ActorValue Property CrewReassignDisabled Auto Const Mandatory

RefCollectionAlias Property DismissedCrew Auto Const

RefCollectionAlias Property DisembarkingCrew Auto Const

WwiseEvent Property WwiseEvent_QST_MQ204_Starborn_VoidForm_End Auto Const Mandatory

Quest Property COM_Companion_SamCoe Auto Const Mandatory

Quest Property COM_Companion_SarahMorgan Auto Const Mandatory

Quest Property Com_Companion_Barrett Auto Const Mandatory

Quest Property COM_Companion_Andreja Auto Const Mandatory

ReferenceAlias[] Property Alias_Companions Auto Const Mandatory

GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const Mandatory

ActorValue Property COM_WantsToTalk_MQ204_Cooldown Auto Const Mandatory

ActorValue Property COM_IsRomantic Auto Const Mandatory

ActorValue Property COM_IsCommitted Auto Const Mandatory

ReferenceAlias Property Alias_LodgeSecretDoor Auto Const Mandatory

Quest Property SQ_GuardShips Auto Const Mandatory

Quest Property SQ_GuardShips00 Auto Const Mandatory

Quest Property SQ_GuardShips01 Auto Const Mandatory

ObjectReference Property NewAtlantisMapMarkerSpaceport Auto Const Mandatory
