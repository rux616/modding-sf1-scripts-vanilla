;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ106_00021BEF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ102.CompleteQuest()
MQ102.Stop()
MQ105.SetStage(920)

;setup armillary
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(0)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(18)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(3)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(4)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(5)
(Alias_ArtifactCollection.GetRef().GetLinkedRef() as ArmillaryScript).DebugSetArtifactAdded(6)

;enable relevant actors
Alias_Barrett.GetActorRef().Enable()
Alias_Barrett.GetActorRef().moveto(MQHoldingCellCenterMarker)

Alias_WalterStroud.GetActorRef().moveto(Game.GetPlayer())


;make Walter a passenger
Actor WalterStroudREF = Alias_WalterStroud.GetActorRef()

(SQ_PlayerShip as SQ_PlayerShipScript).AddPassenger(WalterStroudREF)

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

SetStage(200)

;enable relevant actors
Alias_Barrett.GetActorRef().Enable()
Alias_Barrett.GetActorRef().moveto(MQHoldingCellCenterMarker)

Game.GetPlayer().moveto(LodgeStartMarker)

SetStage(220)
SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE mq106script
Quest __temp = self as Quest
mq106script kmyQuest = __temp as mq106script
;END AUTOCAST
;BEGIN CODE
;disable fast travel and saving
Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=False)
kmyquest.MQ106EnableLayer = InputEnableLayer.Create()
kmyquest.MQ106EnableLayer.DisablePlayerControls()
kmyquest.MQ106EnableLayer.EnableFastTravel(False)
kmyquest.MQ106EnableLayer.EnableGravJump(False)
kmyquest.MQ106EnableLayer.EnableFarTravel(False)

SpaceshipReference HelixREF = Alias_StarbornEmissaryShip.GetShipRef()
SpaceshipReference PlayerShipREF = Alias_PlayerShip.GetShipRef()
HelixREF.Reset() ;reset level
HelixREF.MoveNear(playerShipRef, 1, 0, 0)
HelixREF.SetGhost()
HelixREF.EnableWithGravJump()

;early hunter scenes are invalid
MQ_HunterPreMQ106.SetStageNoWait(1000)

MQ106_001_StarbornScene01.Start()

;play music
MUSGenesisStingerStarbornAppear.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
MQ105.SetStage(2000)

SetObjectiveDisplayed(10)
SetObjectiveDisplayed(20)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)

SpaceshipReference EmissaryShipREF = Alias_StarbornEmissaryShip.GetShipReference()
EmissaryShipREF.DisableWithGravJump()
EmissaryShipREF.SetGhost(False)
Utility.Wait(3.0)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE mq106script
Quest __temp = self as Quest
mq106script kmyQuest = __temp as mq106script
;END AUTOCAST
;BEGIN CODE
;Enable fast travel again
Game.SetInChargen(abDisableSaving=False, abDisableWaiting=False, abShowControlsDisabledMessage=False)
kmyquest.MQ106EnableLayer.EnableFastTravel(True)
kmyquest.MQ106EnableLayer.EnableGravJump(True)
kmyquest.MQ106EnableLayer.EnableFarTravel(False)
kmyquest.MQ106EnableLayer = None

(MQ105 as MQ105Script).MQ105EnableLayer=None

MQ105.SetStageNoWait(1100)

SetObjectiveDisplayed(10, abDisplayed=False)
SetObjectiveDisplayed(20, abDisplayed=False)
SetObjectiveDisplayed(25)

SpaceshipReference StarbornShipREF = Alias_StarbornEmissaryShip.GetShipReference()

StarbornShipREF.SetGhost(False)
StarbornShipREF.AddPerk(MQ106HelixReduceDamage)
Utility.Wait(5)
StarbornShipREF.AddtoFaction(PlayerEnemyFaction)
StarbornShipREF.StartCombat(Alias_PlayerShip.GetShipReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE mq106script
Quest __temp = self as Quest
mq106script kmyQuest = __temp as mq106script
;END AUTOCAST
;BEGIN CODE
kmyquest.MQ106EnableLayer = None
(MQ105 as MQ105Script).MQ105EnableLayer=None

MQ105.SetStageNoWait(1100)

SetObjectiveCompleted(10)

Game.GetPlayer().removeitem(Alias_MQ105Artifact.GetRef())
MQ106_SurrenderedArtifact.SetValueInt(1)

SpaceshipReference EmissaryShipREF = Alias_StarbornEmissaryShip.GetShipReference()
EmissaryShipREF.SetGhost(False)
EmissaryShipREF.DisableWithGravJump()
Utility.Wait(3.0)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_StarbornEmissaryShip.GetShipRef().DisableWithGravJump()
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE mq106script
Quest __temp = self as Quest
mq106script kmyQuest = __temp as mq106script
;END AUTOCAST
;BEGIN CODE
SpaceshipReference HelixREF = Alias_StarbornEmissaryShip.GetShipRef()

HelixREF.SetGhost(false)
HelixREF.DisableNoWait()

;Enable fast travel again
Game.SetInChargen(abDisableSaving=False, abDisableWaiting=False, abShowControlsDisabledMessage=False)
kmyquest.MQ106EnableLayer.EnableFastTravel(True)
kmyquest.MQ106EnableLayer.EnableGravJump(True)
kmyquest.MQ106EnableLayer.EnableFarTravel(True)
kmyquest.MQ106EnableLayer = None
(MQ105 as MQ105Script).MQ105EnableLayer=None
MQ105.SetStageNoWait(1100)

;make sure the guard ships are enabled
Alias_VoliiGuardShip01.GetRef().EnableNoWait()
Alias_VoliiGuardShip02.GetRef().EnableNoWait()
VoliiAlphaTrafficManagerREF.EnableNoWait()

If GetStageDone(90)
  MQ106_004_AftermathScene_NGPlus.Start()
Else
  MQ106_004_AftermathScene.Start()
  SetObjectiveCompleted(10)
  SetObjectiveCompleted(20)
  SetObjectiveCompleted(25)
  SetObjectiveDisplayed(30)
EndIf

;make sure collection is available
ArmillaryMountSwapEnableMarker.DisableNoWait()

;make sure Vladimir is at the Lodge
Actor VladimirREF = Alias_VladimirSall.GetActorRef()
VladimirREF.Disable()
VladimirREF.moveto(MQ106VladimirFurnitureREF)
VladimirREF.Enable()

;Remove music
MUSGenesisStingerStarbornAppear.Remove()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(25)
SetObjectiveDisplayed(30)

;make sure Noel is at the Lodge
Actor NoelREF = Alias_Noel.GetActorRef()
NoelREF.Disable()
NoelREF.EvaluatePackage()
NoelRef.Enable()
NoelREF.MovetoPackageLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;make Walter no longer a passenger
Actor WalterStroudREF = Alias_WalterStroud.GetActorRef()

(SQ_PlayerShip as SQ_PlayerShipScript).RemovePassenger(WalterStroudREF)
WalterStroudREF.moveto(MQ_LodgeEntranceMoveMarker)
WalterStroudREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
;warp Walter inside
Actor WalterStroudREF = Alias_WalterStroud.GetactorRef()

(SQ_PlayerShip as SQ_PlayerShipScript).RemovePassenger(WalterStroudREF)
WalterStroudREF.moveto(MQ_LodgeEntranceMoveMarker)
WalterStroudREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
MQ106_005b_MoveEveryoneScene.Start()
;MQ106_005_LodgeScene.Start()

SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0302_Item_00
Function Fragment_Stage_0302_Item_00()
;BEGIN CODE
If !MQ106_006_LodgeScene.IsPlaying()
  MQ106_006_LodgeScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
Alias_LodgeDisplay.GetRef().PlayAnimation("Play01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;if the player still has the Artifact point them to the collection
If GetStageDone(110) == 0
  SetStage(505)
Else
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
SetObjectiveCompleted(45)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE mq106script
Quest __temp = self as Quest
mq106script kmyQuest = __temp as mq106script
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

;start quests
MQ201.SetStageNoWait(10)

;clear the input layer
kmyquest.MQ106EnableLayer=None

;Send Affinity Event
float currentGameTime = Utility.GetCurrentGameTime()
float cooldownTime = (currentGameTime + COM_WantsToTalk_CooldownDays.GetValue())
int i = 0
while i < Alias_Companions.Length
    Alias_Companions[i].GetActorRef().SetValue(COM_WantsToTalk_MQ106_Cooldown, cooldownTime) 
    i += 1
endwhile
COM_WantsToTalkEvent_MQ106.Send()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;Remove music
MUSGenesisStingerStarbornAppear.Remove()

;make sure the guard ships are enabled
Alias_VoliiGuardShip01.GetRef().Enable()
Alias_VoliiGuardShip02.GetRef().Enable()

;make sure Helix is gone
SpaceshipReference HelixREF = Alias_StarbornEmissaryShip.GetShipRef()

HelixREF.SetGhost(false)
HelixREF.RemovePerk(MQ106HelixReduceDamage)
HelixREF.DisableNoWait()

;quest failsafe timer
(MQ00 as MQ00QuestScript).StartMQ201FailsafeTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ106_001_StarbornScene01 Auto Const Mandatory

Scene Property MQ106_004_AftermathScene Auto Const Mandatory

Scene Property MQ106_005_LodgeScene Auto Const Mandatory

Quest Property MQ105 Auto Const Mandatory

Quest Property MQ201 Auto Const Mandatory

Quest Property MQ202 Auto Const Mandatory

Quest Property MQ203 Auto Const Mandatory

ReferenceAlias Property Alias_SarahMorgan Auto Const Mandatory

ReferenceAlias Property Alias_WalterStroud Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

GlobalVariable Property MQ106_SurrenderedArtifact Auto Const Mandatory

ReferenceAlias Property Alias_StarbornEmissaryShip Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ReferenceAlias Property Alias_MQ105Artifact Auto Const Mandatory

Scene Property MQ106_005b_MoveEveryoneScene Auto Const Mandatory

ObjectReference Property MQHoldingCellCenterMarker Auto Const Mandatory

ReferenceAlias Property Alias_Collection Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_HelixMoveMarker Auto Const Mandatory

Scene Property MQ106_004_AftermathScene_NGPlus Auto Const Mandatory

ObjectReference Property MQ_LodgeEntranceMoveMarker Auto Const Mandatory

ObjectReference Property LodgeStartMarker Auto Const Mandatory

MusicType Property MUSGenesisStingerStarbornAppear Auto Const Mandatory

Quest Property MQ_HunterPreMQ106 Auto Const Mandatory

ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_VladimirSall Auto Const Mandatory

ObjectReference Property MQ106VladimirFurnitureREF Auto Const Mandatory

ReferenceAlias Property Alias_VoliiGuardShip01 Auto Const Mandatory

ReferenceAlias Property Alias_VoliiGuardShip02 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeDisplay Auto Const Mandatory

ReferenceAlias Property Alias_Noel Auto Const Mandatory

Perk Property MQ106HelixReduceDamage Auto Const Mandatory

Location Property VoliiStationLocation Auto Const Mandatory

Keyword Property SQ_TrafficManagerHeavy_LocType Auto Const Mandatory

ObjectReference Property VoliiAlphaTrafficManagerREF Auto Const Mandatory

AffinityEvent Property COM_WantsToTalkEvent_MQ106 Auto Const Mandatory

ReferenceAlias Property Alias_ArtifactCollection Auto Const Mandatory

ReferenceAlias[] Property Alias_Companions Auto Const Mandatory

GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const Mandatory

ActorValue Property COM_WantsToTalk_MQ106_Cooldown Auto Const Mandatory

Scene Property MQ106_006_LodgeScene Auto Const Mandatory

Quest Property MQ00 Auto Const Mandatory
