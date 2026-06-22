;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update03_002292CC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
CF08_Fleet_Misc.SetStage(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN CODE
COM_Quest_Barrett_Commitment.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_03
Function Fragment_Stage_0000_Item_03()
;BEGIN CODE
CF02.SetStage(508)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_04
Function Fragment_Stage_0000_Item_04()
;BEGIN CODE
(Com_Companion_Barrett as COM_CompanionQuestScript).StartPersonalQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_05
Function Fragment_Stage_0000_Item_05()
;BEGIN CODE
FFNewAtlantis02Misc.SetObjectiveSkipped(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_06
Function Fragment_Stage_0000_Item_06()
;BEGIN CODE
ObjectReference StyxRef = Alias_StyxClean.GetRef()

if FFNeonZ03.GetStageDone(200)
    Alias_FCNeonStyx.GetRef().DisableNoWait()
    Alias_FCNeonStyx.ForceRefTo(StyxRef)
elseif FFNeonZ03.IsRunning()
    Alias_StyxPost.ForceRefto(StyxRef)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_07
Function Fragment_Stage_0000_Item_07()
;BEGIN CODE
if Alias_MQ301GravDriveDoor.GetRef().GetOpenState() == 3
	Alias_MQ301GravDriveDoor.GetRef().SetOpen()
endif

if Alias_MQ301GravDriveAnimHelper.GetRef().GetOpenState() == 3
	Alias_MQ301GravDriveAnimHelper.GetRef().SetOpen()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_08
Function Fragment_Stage_0000_Item_08()
;BEGIN CODE
ObjectReference RestrictedDoor = Alias_MS02FacilityRestrictedTerminal.GetRef().GetLinkedRef()

if RestrictedDoor.GetOpenState() == 3
	RestrictedDoor.SetOpen()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_09
Function Fragment_Stage_0000_Item_09()
;BEGIN CODE
SE_AC01.SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_10
Function Fragment_Stage_0000_Item_10()
;BEGIN CODE
OE_KT_EmergencyRepairs.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_11
Function Fragment_Stage_0000_Item_11()
;BEGIN CODE
PlayerSkills_Magazines.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_12
Function Fragment_Stage_0000_Item_12()
;BEGIN CODE
if !Game.GetPlayer().IsInLocation(EnemyShipInteriorLocation.GetLocation())
    BE_Objective.SetStage(255)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_13
Function Fragment_Stage_0000_Item_13()
;BEGIN CODE
Alias_Computers.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_14
Function Fragment_Stage_0000_Item_14()
;BEGIN CODE
;Kick off Hadrian's restart scene
UC02.SetStage(741)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_15
Function Fragment_Stage_0000_Item_15()
;BEGIN CODE
if !CREW_EliteCrew_Lin.GetStageDone(1)
    CREW_EliteCrew_Lin.SetStage(1)
endif

if !CREW_EliteCrew_Heller.GetStageDone(1)
    CREW_EliteCrew_Heller.SetStage(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_16
Function Fragment_Stage_0000_Item_16()
;BEGIN CODE
; If the quest is running, force Frankie into her new furniture
; so she's close enough to the door to start her scene.
Actor Frankie = Alias_RI05Frankie.GetActorRef()
Frankie.MoveToFurniture(Alias_RI05FrankieFurniture.GetRef())
Frankie.EvaluatePackage()

; If the player already interacted with the door
; and has not successfully gotten inside the hideout,
; set stage 650 that displays the objective to find a way inside and
; points the player to the rooftop entrance.
If RI05.GetStageDone(625) && !RI05.GetStageDone(650) && !RI05.GetStageDone(660)
   RI05.SetStage(650)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_17
Function Fragment_Stage_0000_Item_17()
;BEGIN CODE
; If quest is running and player has activated the interview chair,
; but the interview scene hasn't started, 
; they're probably control locked near by, 
; so set stage 400 to start the interview scene.
RI01.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_18
Function Fragment_Stage_0000_Item_18()
;BEGIN CODE
; Handling for if RI07 didn't start after RI06.
If RI06.IsCompleted() && !RIR06.IsRunning() && !RI07.IsCompleted() && !RI07.IsRunning()
   RI07.SetStage(100)
EndIf

; Handling for if RI07 didn't start after RIR06.
If RIR06.GetStageDone(10000) && !RI07.IsCompleted() && !RI07.IsRunning()
   RI07.SetStage(200)
EndIf

; Handling for if RI08 didn't start.
If RI07.IsCompleted() && !RI08.IsCompleted() && !RI08.IsRunning()
   RI08.SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_19
Function Fragment_Stage_0000_Item_19()
;BEGIN CODE
if MQ401.GetStageDone(415)
    Alias_Sarah.GetRef().RemoveKeyword(COM_PreventStoryGateScenes)
endif

if MQ401.GetStageDone(425)
    Alias_Andreja.GetRef().RemoveKeyword(COM_PreventStoryGateScenes)
endif

if MQ401.GetStageDone(445)
    Alias_Barrett.GetRef().RemoveKeyword(COM_PreventStoryGateScenes)
endif

if MQ401.GetStageDone(455)
    Alias_Sam.GetRef().RemoveKeyword(COM_PreventStoryGateScenes)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_20
Function Fragment_Stage_0000_Item_20()
;BEGIN CODE
SE_ZW08.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_21
Function Fragment_Stage_0000_Item_21()
;BEGIN CODE
RI07.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_22
Function Fragment_Stage_0000_Item_22()
;BEGIN CODE
;if on Player's save the Predator has flown off the grid, kill.
;On future saves the Predator will change packages before this happens

Actor[] PredatorRef = Alias_OE_AustinF_PAM_Predators.GetActorArray()

int i = 0

while i < PredatorRef.Length
    if PredatorRef[i].GetDistance(Game.GetPlayer()) > 25
        PredatorRef[i].Kill()
    endif
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_23
Function Fragment_Stage_0000_Item_23()
;BEGIN CODE
;If UC04 is still running...
;And the attack is active... (stage 425)
;And we haven't finished with Yumi, yet... (stage 910)
;Teleport him back to his scene marker...

Alias_SgtYumi.GetRef().Moveto(UC04_OfficerYumi_Scene700Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_24
Function Fragment_Stage_0000_Item_24()
;BEGIN CODE
Alias_NeuroampOperatingTable.GetRef().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_25
Function Fragment_Stage_0000_Item_25()
;BEGIN CODE
Alias_CoeMainDoor.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_26
Function Fragment_Stage_0000_Item_26()
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()

if !PlayACT.HasPerk(UCR04_HarvestSamplePerk)
  PlayACT.AddPerk(UCR04_HarvestSamplePerk)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_27
Function Fragment_Stage_0000_Item_27()
;BEGIN CODE
Alias_UC04LodgeBlockingTriggers.EnableAll()

RefCollectionAlias LodgeTriggers = (UC04 as UC04_QuestScript).LodgeDoorTriggers
if LodgeTriggers.GetCount() <= 0
  LodgeTriggers.RefillAlias()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_28
Function Fragment_Stage_0000_Item_28()
;BEGIN CODE
;At stage 200 of FFNeonZ03 he is disabled and replaced with a new actor

;If styx is dead (before FFNeonZ03 stage 200), resurrect and resest his position. 
if Alias_NeonStyx.GetActorRef().IsDead() == 1 && FFNeonZ03.GetStageDone(200) == 0
  Alias_NeonStyx.GetActorRef().Resurrect()
  Alias_NeonStyx.GetActorRef().Reset()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_29
Function Fragment_Stage_0000_Item_29()
;BEGIN CODE
;Unlock Strikers door and set new lock level if door is closed after reset

if city_neon_gang01.GetStageDone(200) == 1 && Alias_StrikersDoor.GetRef().GetLockLevel() == 255 
   Alias_StrikersDoor.GetRef().Unlock()
   Alias_StrikersDoor.GetRef().SetLockLevel(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_30
Function Fragment_Stage_0000_Item_30()
;BEGIN CODE
CF07_Stage010_Delgado_IntroScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_31
Function Fragment_Stage_0000_Item_31()
;BEGIN CODE
ObjectReference ShipServicesRef = Alias_NeonShipServices.GetRef()
ObjectReference ChairRef = ShipServicesRef.GetLinkedRef()
ObjectReference LandingMarkerRef = ShipServicesRef.GetLinkedRef(LinkShipLandingMarker01)
SpaceshipReference PlayerShip = Alias_SQ_PlayerShip.GetShipRef()

if ShipServicesRef.GetDistance(ChairRef) > 20
    ShipServicesRef.MoveTo(ChairRef)
endif

if PlayerShip.GetDistance(LandingMarkerRef) > 20
    PlayerShip.MoveTo(LandingMarkerRef)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_32
Function Fragment_Stage_0000_Item_32()
;BEGIN CODE
ObjectReference PKINRef = ScientistDoorPackin_MS01.GetRef()
ObjectReference DoorRef = ScientistDoorPackin.GetRef()
if PKINRef == None
    ScientistDoorPackin_MS01.ForceRefTo(DoorRef)
endif

;Give papyrus time to fill the alias before unlocking the doors
;In case alias is filled and doors are still locked, moving out of if statement
Utility.Wait(1)
(MS01 as MS01Script).LockDoors(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_33
Function Fragment_Stage_0000_Item_33()
;BEGIN CODE
Alias_LodgeBed.GetRef().BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_34
Function Fragment_Stage_0000_Item_34()
;BEGIN CODE
UC06.SetStage(440)
UC06.SetStage(441)
Alias_OrlaseCabinDoor.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_35
Function Fragment_Stage_0000_Item_35()
;BEGIN CODE
COM_Quest_SarahMorgan_Q01.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_36
Function Fragment_Stage_0000_Item_36()
;BEGIN CODE
if (UC04.GetStageDone(589) || UC04.GetStageDone(592)) && (UC04.GetStageDone(588) || UC04.GetStageDone(591))  && (UC04.GetStageDone(587) || UC04.GetStageDone(593)) && (UC04.GetStageDone(603) || UC04.GetStageDone(602))
  UC04.SetStage(590)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_37
Function Fragment_Stage_0000_Item_37()
;BEGIN CODE
ObjectReference MarkerRef = Alias_UC01_TualaMarker.GetRef()
ObjectReference TualaRef = Alias_Tuala.GetRef()

if TualaRef.GetDistance(MarkerRef) > 20
     TualaRef.MoveTo(MarkerRef)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_38
Function Fragment_Stage_0000_Item_38()
;BEGIN CODE
UC07.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_39
Function Fragment_Stage_0000_Item_39()
;BEGIN CODE
ObjectReference VaultDoorRef = Alias_AAVaultDoor.GetRef()
VaultDoorRef.Unlock()
VaultDoorRef.Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_40
Function Fragment_Stage_0000_Item_40()
;BEGIN CODE
ObjectReference DoorRef = Alias_VaruunMainDoor.GetRef()
DoorRef.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_41
Function Fragment_Stage_0000_Item_41()
;BEGIN CODE
Alias_FSECodeMachineRoomDoor.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_42
Function Fragment_Stage_0000_Item_42()
;BEGIN CODE
; Update RI07 alias to new furniture
ObjectReference DavidFurniture = (Alias_DavidBarronFurniture.GetRef())
Actor David = Alias_DavidBarron.GetActorRef()

RI07Alias_DavidFurniture.ForceRefTo(DavidFurniture)

; If player is on RI07 Stage 1800, move David to his furniture.
if RI07.GetStageDone(1800) && !RI07.GetStageDone(1900)
	David.MoveToFurniture(Alias_DavidBarronFurniture.GetRef())
endif

David.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_43
Function Fragment_Stage_0000_Item_43()
;BEGIN CODE
;Unlock safe
ObjectReference CF06Safe = Alias_CF06_Safe.GetRef()
CF06Safe.SetLockLevel(0)
CF06Safe.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_44
Function Fragment_Stage_0000_Item_44()
;BEGIN CODE
Actor CaptainRef = Alias_Captain.GetActorRef()
Actor RakeRef = Alias_Rake.GetActorRef()

if !CaptainRef.IsDead()
    CaptainRef.EvaluatePackage()
endif

if !RakeRef.IsDead()
    RakeRef.EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_45
Function Fragment_Stage_0000_Item_45()
;BEGIN CODE
;Remove bounty on CF
CrimeFactionCrimsonFleet.SetCrimeGold(0)
CrimeFactionCrimsonFleet.SetCrimeGoldViolent(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_46
Function Fragment_Stage_0000_Item_46()
;BEGIN CODE
Alias_RI04EbbsideDoor.ForceRefIfEmpty(Alias_EbbsideDoor.GetRef())
Alias_RI04VentQTPrimitive.ForceRefIfEmpty(Alias_VentQTPrimitive.GetRef())
Alias_RI04VentExitQTPrimitive.ForceRefIfEmpty(Alias_VentExitQTPrimitive.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_47
Function Fragment_Stage_0000_Item_47()
;BEGIN CODE
Alias_Barrett_Q01_Door_LockEntry01.GetRef().Unlock()
Alias_Barrett_Q01_Door_LockEntry.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_48
Function Fragment_Stage_0000_Item_48()
;BEGIN CODE
LC051InfinityHQ.EnableFastTravel()
Alias_GuardEnableMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_49
Function Fragment_Stage_0000_Item_49()
;BEGIN CODE
ObjectReference oTarg = Alias_DoorPragmatists.GetRef()
oTarg.Lock(FALSE)
oTarg.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_50
Function Fragment_Stage_0000_Item_50()
;BEGIN CODE
MS03_Juno.SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_51
Function Fragment_Stage_0000_Item_51()
;BEGIN CODE
(MS01 as MS01Script).LockDoors(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_52
Function Fragment_Stage_0000_Item_52()
;BEGIN CODE
; Move Nina, Angelo, and Stanley in case they aren't in Infinity LTD.
Actor Nina = Alias_Nina.GetActorRef()
Actor Angelo = Alias_Angelo.GetActorRef()
Actor Stanley = Alias_Stanley.GetActorRef()
ObjectReference InfinityMarker = Alias_InfinityLobbyQS.GetRef()
ObjectReference InfinityNinaMarker = Alias_InfinityLTDNinaMarker.GetRef()
Location InfinityLocation = Alias_Location_InfinityLTD.GetLocation()

If RI02.GetStageDone(10000) && !RI07.GetStageDone(1800)
   If !Nina.IsInLocation(InfinityLocation) && !Nina.IsDead()
      Nina.MoveTo(InfinityNinaMarker)
      Nina.EvaluatePackage()
   EndIf
   If !Angelo.IsInLocation(InfinityLocation) && !Angelo.IsDead()
      Angelo.MoveTo(InfinityMarker)
      Angelo.EvaluatePackage()
   EndIf
EndIf
If RI03.GetStageDone(10000) && !RI07.GetStageDone(1800)
   If !Stanley.IsInLocation(InfinityLocation) && !Stanley.IsDead()
      Stanley.MoveTo(InfinityMarker)
      Stanley.EvaluatePackage()
   EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_53
Function Fragment_Stage_0000_Item_53()
;BEGIN CODE
Alias_CF07_LegacyShip.GetShipRef().SetValue(DockingPermission, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_54
Function Fragment_Stage_0000_Item_54()
;BEGIN CODE
Actor F01ACT = Alias_UC04_Thrall_F01.GetActorRef()
Actor F02ACT = Alias_UC04_Thrall_F02.GetActorRef()
Actor M01ACT = Alias_UC04_Thrall_M01.GetActorRef()
Actor M02ACT = Alias_UC04_Thrall_M02.GetActorRef()

if F01ACT.IsEnabled() && F01ACT.IsBleedingOut()
  UC04.SetStage(608)
endif

if F02ACT.IsEnabled() && F02ACT.IsBleedingOut()
  UC04.SetStage(609)
endif

if M01ACT.IsEnabled() && M01ACT.IsBleedingOut()
  UC04.SetStage(607)
endif

if M02ACT.IsEnabled() && M02ACT.IsBleedingOut()
  UC04.SetStage(606)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_55
Function Fragment_Stage_0000_Item_55()
;BEGIN CODE
Alias_Kaiser.GetRef().AddItem(Ammo777mm, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_56
Function Fragment_Stage_0000_Item_56()
;BEGIN CODE
;if UC08 stage 100 is done and cell reset locked doors
Alias_CacheDoors.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_57
Function Fragment_Stage_0000_Item_57()
;BEGIN CODE
Alias_Ryleigh.GetActorRef().Resurrect()
MQ105.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_58
Function Fragment_Stage_0000_Item_58()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)
SpaceshipReference Ship01Ref = Alias_Zealot_Wave1_Ship01.GetShipReference()
SpaceshipReference Ship02Ref = Alias_Zealot_Wave1_Ship02.GetShipReference()
SpaceshipReference Ship03Ref = Alias_Zealot_Wave1_Ship03.GetShipReference()
SpaceshipReference JaedaShipRef = Alias_Jaeda_Ship.GetShipRef()

if Ship01Ref == None
    Ship01Ref = JaedaShipRef.PlaceShipAtMe(LvlShip_COM_Quest_Andreja_VaruunShip01, abInitiallyDisabled = true, akAliasToFill = AndrejaZealotShipAlias01)
    Ship01Ref.MoveNear(JaedaShipRef)
endif
if Ship02Ref == None
    Ship02Ref = JaedaShipRef.PlaceShipAtMe(LvlShip_COM_Quest_Andreja_VaruunShip01, abInitiallyDisabled = true, akAliasToFill = AndrejaZealotShipAlias02)
    Ship02Ref.MoveNear(JaedaShipRef)
endif
if Ship03Ref == None
    Ship03Ref = JaedaShipRef.PlaceShipAtMe(LvlShip_COM_Quest_Andreja_VaruunShip01, abInitiallyDisabled = true, akAliasToFill = AndrejaZealotShipAlias03)
    Ship03Ref.MoveNear(JaedaShipRef)
endif

if Com_Quest_Andreja_q01.GetStageDone(130)
    Ship01Ref.EnableWithGravJump()
    utility.wait(0.4)
    Ship02Ref.EnableWithGravJump()
    utility.wait(0.2)
    Ship03Ref.EnableWithGravJump()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_59
Function Fragment_Stage_0000_Item_59()
;BEGIN CODE
MQ_Temple_Subscript MQT_01 = MQ_TempleQuest_01 as MQ_Temple_Subscript

if MQT_01.IsRunning() && MQT_01.AnomalyLocation.GetLocation() == none
  MQT_01.RefillAnomalyOE()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_60
Function Fragment_Stage_0000_Item_60()
;BEGIN CODE
MQ_Temple_Subscript MQT_FF = MQ_TempleQuest_Freeform as MQ_Temple_Subscript
MQ_Temple_Subscript MQT_FF_00 = MQ_TempleQuest_Freeform00 as MQ_Temple_Subscript
MQ_Temple_Subscript MQT_FF_01 = MQ_TempleQuest_Freeform01 as MQ_Temple_Subscript
MQ_Temple_Subscript MQT_FF_02 = MQ_TempleQuest_Freeform02 as MQ_Temple_Subscript
MQ_Temple_Subscript MQT_FF_03 = MQ_TempleQuest_Freeform03 as MQ_Temple_Subscript

if MQT_FF.IsRunning() && MQT_FF.AnomalyLocation.GetLocation() == none
  MQT_FF.RefillAnomalyOE()
endif

if MQT_FF_00.IsRunning() && MQT_FF_00.AnomalyLocation.GetLocation() == none
  MQT_FF_00.RefillAnomalyOE()
endif

if MQT_FF_01.IsRunning() && MQT_FF_01.AnomalyLocation.GetLocation() == none
  MQT_FF_01.RefillAnomalyOE()
endif

if MQT_FF_02.IsRunning() && MQT_FF_02.AnomalyLocation.GetLocation() == none
  MQT_FF_02.RefillAnomalyOE()
endif

if MQT_FF_03.IsRunning() && MQT_FF_03.AnomalyLocation.GetLocation() == none
  MQT_FF_03.RefillAnomalyOE()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_61
Function Fragment_Stage_0000_Item_61()
;BEGIN CODE
Alias_Hadrian.GetRef().AddItem(AmmoLaser, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_62
Function Fragment_Stage_0000_Item_62()
;BEGIN CODE
ObjectReference YasinRef = Alias_Yasin.GetRef()
if !YasinRef.Is3DLoaded()
    YasinRef.DisableNoWait()
    YasinRef.EnableNoWait()
endif
if UC08.IsCompleted() && !UC09.GetStageDone(100)
    UC09.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_63
Function Fragment_Stage_0000_Item_63()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CF08_Fleet_Misc Auto Const Mandatory

Quest Property COM_Quest_Barrett_Commitment Auto Const Mandatory

Quest Property CF02 Auto Const Mandatory

COM_CompanionQuestScript Property Com_Companion_Barrett Auto Const Mandatory

Quest Property FFNewAtlantis02Misc Auto Const Mandatory

ReferenceAlias Property Alias_StyxClean Auto Const Mandatory

ReferenceAlias Property Alias_FCNeonStyx Auto Const Mandatory

Quest Property FFNeonZ03 Auto Const Mandatory

ReferenceAlias Property Alias_StyxPost Auto Const Mandatory

ReferenceAlias Property Alias_MQ301GravDriveDoor Auto Const

ReferenceAlias Property Alias_MQ301GravDriveAnimHelper Auto Const

ReferenceAlias Property Alias_MS02FacilityRestrictedTerminal Auto Const

Quest Property SE_AC01 Auto Const Mandatory

Quest Property OE_KT_EmergencyRepairs Auto Const Mandatory

Quest Property PlayerSkills_Magazines Auto Const Mandatory

LocationAlias Property EnemyShipInteriorLocation Auto Const Mandatory

Quest Property BE_Objective Auto Const Mandatory

RefCollectionAlias Property Alias_Computers Auto Const Mandatory

Quest Property UC02 Auto Const Mandatory

Quest Property CREW_EliteCrew_Lin Auto Const Mandatory

Quest Property CREW_EliteCrew_Heller Auto Const Mandatory

Quest Property RI05 Auto Const Mandatory

ReferenceAlias Property Alias_RI05Frankie Auto Const Mandatory

ReferenceAlias Property Alias_RI05FrankieFurniture Auto Const Mandatory

Quest Property RI01 Auto Const Mandatory

Quest Property MQ401 Auto Const Mandatory

ReferenceAlias Property Alias_Sarah Auto Const Mandatory

ReferenceAlias Property Alias_Sam Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

Keyword Property COM_PreventStoryGateScenes Auto Const Mandatory

Quest Property RI06 Auto Const Mandatory

Quest Property RI07 Auto Const Mandatory

Quest Property RI08 Auto Const Mandatory

Quest Property RIR06 Auto Const Mandatory

Quest Property SE_ZW08 Auto Const Mandatory

Quest Property OE_AustinF_PredatorsAttackMiners Auto Const Mandatory

RefCollectionAlias Property Alias_OE_AustinF_PAM_Predators Auto Const Mandatory

ReferenceAlias Property Alias_SgtYumi Auto Const Mandatory

Quest Property UC04 Auto Const Mandatory

ObjectReference Property UC04_OfficerYumi_Scene700Marker Auto Const Mandatory

ReferenceAlias Property Alias_NeuroampOperatingTable Auto Const Mandatory

ReferenceAlias Property Alias_CoeMainDoor Auto Const Mandatory

Perk Property UCR04_HarvestSamplePerk Auto Const Mandatory

RefCollectionAlias Property Alias_UC04LodgeBlockingTriggers Auto Const Mandatory

ReferenceAlias Property Alias_NeonStyx Auto Const Mandatory

Quest Property City_Neon_Gang01 Auto Const Mandatory

Scene Property CF07_Stage010_Delgado_IntroScene Auto Const Mandatory

Keyword Property LinkShipLandingMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_SQ_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_NeonShipServices Auto Const Mandatory

ReferenceAlias Property ScientistDoorPackin Auto Const Mandatory

Quest Property MS01 Auto Const Mandatory

ReferenceAlias Property ScientistDoorPackin_MS01 Auto Const Mandatory

ReferenceAlias Property Alias_LodgeBed Auto Const Mandatory

Quest Property UC06 Auto Const Mandatory

ReferenceAlias Property Alias_StrikersDoor Auto Const Mandatory

Quest Property COM_Quest_SarahMorgan_Q01 Auto Const Mandatory

ReferenceAlias Property Alias_Tuala Auto Const Mandatory

ReferenceAlias Property Alias_UC01_TualaMarker Auto Const Mandatory

Quest Property UC07 Auto Const Mandatory

ReferenceAlias Property Alias_AAVaultDoor Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC05_Unlock_Door_Success_Play Auto Const Mandatory

ReferenceAlias Property Alias_VaruunMainDoor Auto Const Mandatory

ReferenceAlias Property Alias_FSECodeMachineRoomDoor Auto Const Mandatory

ReferenceAlias Property Alias_DavidBarron Auto Const Mandatory

ReferenceAlias Property Alias_DavidBarronFurniture Auto Const Mandatory

ReferenceAlias Property Alias_CF06_Safe Auto Const Mandatory

ReferenceAlias Property Alias_OrlaseCabinDoor Auto Const Mandatory


ReferenceAlias Property Alias_Captain Auto Const Mandatory

ReferenceAlias Property Alias_Rake Auto Const Mandatory

Faction Property CrimeFactionCrimsonFleet Auto Const Mandatory

ReferenceAlias Property Alias_EbbsideDoor Auto Const Mandatory

ReferenceAlias Property Alias_VentQTPrimitive Auto Const Mandatory

ReferenceAlias Property Alias_RI04EbbsideDoor Auto Const Mandatory

ReferenceAlias Property Alias_RI04VentQTPrimitive Auto Const Mandatory

ReferenceAlias Property Alias_RI04VentExitQTPrimitive Auto Const Mandatory

ReferenceAlias Property Alias_VentExitQTPrimitive Auto Const Mandatory

ReferenceAlias Property Alias_Barrett_Q01_Door_LockEntry01 Auto Const Mandatory

ReferenceAlias Property Alias_Barrett_Q01_Door_LockEntry Auto Const

Cell Property LC051InfinityHQ Auto Const Mandatory

ReferenceAlias Property Alias_GuardEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_DoorPragmatists Auto Const Mandatory

Quest Property MS03_Juno Auto Const Mandatory

ReferenceAlias Property Alias_Nina Auto Const Mandatory

ReferenceAlias Property Alias_Angelo Auto Const Mandatory

ReferenceAlias Property Alias_Stanley Auto Const Mandatory

ReferenceAlias Property Alias_InfinityLobbyQS Auto Const Mandatory

LocationAlias Property Alias_Location_InfinityLTD Auto Const Mandatory

Quest Property RI02 Auto Const Mandatory

Quest Property RI03 Auto Const Mandatory

ReferenceAlias Property Alias_InfinityLTDNinaMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF07_LegacyShip Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

ReferenceAlias Property Alias_UC04_Thrall_F01 Auto Const Mandatory

ReferenceAlias Property Alias_UC04_Thrall_F02 Auto Const Mandatory

ReferenceAlias Property Alias_UC04_Thrall_M01 Auto Const Mandatory

ReferenceAlias Property Alias_UC04_Thrall_M02 Auto Const Mandatory

Ammo Property Ammo777mm Auto Const Mandatory

ReferenceAlias Property Alias_Kaiser Auto Const Mandatory

RefCollectionAlias Property Alias_CacheDoors Auto Const Mandatory

ReferenceAlias Property Alias_Ryleigh Auto Const Mandatory

Quest Property MQ105 Auto Const Mandatory

ReferenceAlias Property RI07Alias_DavidFurniture Auto Const

ReferenceAlias Property Alias_Zealot_Wave1_Ship01 Auto Const Mandatory

ReferenceAlias Property Alias_Zealot_Wave1_Ship02 Auto Const Mandatory

ReferenceAlias Property Alias_Zealot_Wave1_Ship03 Auto Const Mandatory

ReferenceAlias Property Alias_Jaeda_Ship Auto Const Mandatory

SpaceshipBase Property LvlShip_COM_Quest_Andreja_VaruunShip01 Auto Const Mandatory

ReferenceAlias Property AndrejaZealotShipAlias01 Auto Const Mandatory

ReferenceAlias Property AndrejaZealotShipAlias02 Auto Const Mandatory

ReferenceAlias Property AndrejaZealotShipAlias03 Auto Const Mandatory

Quest Property COM_Quest_Andreja_Q01 Auto Const Mandatory

Quest Property MQ_TempleQuest_01 Auto Const Mandatory

Quest Property MQ_TempleQuest_Freeform Auto Const Mandatory

Quest Property MQ_TempleQuest_Freeform00 Auto Const Mandatory

Quest Property MQ_TempleQuest_Freeform01 Auto Const Mandatory

Quest Property MQ_TempleQuest_Freeform02 Auto Const Mandatory

Quest Property MQ_TempleQuest_Freeform03 Auto Const Mandatory

Ammo Property AmmoLaser Auto Const Mandatory

ReferenceAlias Property Alias_Hadrian Auto Const Mandatory

ReferenceAlias Property Alias_Yasin Auto Const Mandatory

Quest Property UC08 Auto Const Mandatory

Quest Property UC09 Auto Const Mandatory
