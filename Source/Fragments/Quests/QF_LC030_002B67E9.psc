;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC030_002B67E9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Startup stage.

;Enable Delgado's ship.
Alias_DelgadosShip.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Set by: CF03 stage 40.

;Shift the map marker heading closer to the Lock's entrance.
Alias_MapMarker.GetRef().SetLinkedRef(Alias_MapMarkerHeadingClose.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set by: Stage 210, or CF03 quickstarts.

;Enable the enemies in the interior of the Lock.
Alias_InteriorEnemiesEnableMarker.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE lc030_questscript
Quest __temp = self as Quest
lc030_questscript kmyQuest = __temp as lc030_questscript
;END AUTOCAST
;BEGIN CODE
;Set by: CF03 stage 60.

;Enable the enemies in the interior of the Lock.
SetStage(20)
Utility.Wait(1)

;Trigger the first wave of the ambush.
(Alias_TransferChamberAmbushTrigger01.GetRef() as DefaultRefAmbushTrigger2).TriggerAmbush()

;And start the failsafe monitor.
kMyQuest.StartTransferChamberMonitor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0211_Item_00
Function Fragment_Stage_0211_Item_00()
;BEGIN CODE
;Set by: DefaultCounterQuestB, 2 Enemies Killed

;Trigger the second wave of the ambush.
(Alias_TransferChamberAmbushTrigger02.GetRef() as DefaultRefAmbushTrigger2).TriggerAmbush()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0212_Item_00
Function Fragment_Stage_0212_Item_00()
;BEGIN CODE
;Set by: DefaultCounterQuestC, 6 Enemies Killed

;Trigger the third wave of the ambush.
(Alias_TransferChamberAmbushTrigger03.GetRef() as DefaultRefAmbushTrigger2).TriggerAmbush()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Set by: DefaultCollectionAliasOnDeath on TransferEnemies collection.
;All enemies ion the Transfer Area have been killed.

;Allow CF03 to advance.
CF03.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;Set by: Quest script, CollapseCeiling

;Let CF03 know the ceiling has collapsed.
CF03.SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN AUTOCAST TYPE lc030_questscript
Quest __temp = self as Quest
lc030_questscript kmyQuest = __temp as lc030_questscript
;END AUTOCAST
;BEGIN CODE
;Set by: CF03 stage 100, after speaking to Mathis.

;Allow the player to activate the collapsing wall.
kMyQuest.UnblockCollapsingWallActivation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0269_Item_00
Function Fragment_Stage_0269_Item_00()
;BEGIN CODE
;Set by: Quest script OnActivate.

;Let CF03 know the wall has collapsed.
CF03.SetStage(105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
;Set by: CF03 stage 100.

;Delay briefly.
Utility.Wait(1)

;Enable the Offscreen Combat enemies.
Alias_TransferChamberOffscreenCombatEnemies.EnableAll()
Alias_TransferChamberOffscreenCombatEnemies.StartCombatAll(Alias_Delgado.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0279_Item_00
Function Fragment_Stage_0279_Item_00()
;BEGIN CODE
;Set by: CF03 stage 107.

;Swap the Generic Allies for their corpses.
Alias_GenericAlly01.TryToDisable()
Alias_GenericAlly02.TryToDisable()
Alias_GenericAlly01_Corpse.TryToEnable()
Alias_GenericAlly02_Corpse.TryToEnable()

;Kill the Offscreen Combat enemies.
Actor[] offscreenCombatEnemies = Alias_TransferChamberOffscreenCombatEnemies.GetArray() as Actor[]
int i = 0
While (i < offscreenCombatEnemies.Length)
     if (!offscreenCombatEnemies[i].IsDead())
          offscreenCombatEnemies[i].Kill()
     EndIf
     i = i + 1
EndWhile

;Move Delgado into position.
Actor delgadoRef = Alias_Delgado.GetActorRef()
delgadoRef.StopCombat()
delgadoRef.EvaluatePackage()
delgadoRef.MoveToPackageLocation()
delgadoRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
;Set by: CF03 stage 130.

;Open the doors.
int i = 0
While (i < Alias_TransferChamberSecurityDoors.GetCount())
     ObjectReference current = Alias_TransferChamberSecurityDoors.GetAt(i)
     current.SetOpen(True)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set by: CF03 stage 135, or quickstart.

;Delay to block this call until the player has exited the terminal.
Utility.Wait(0.1)

;Open the doors.
int i = 0
While (i < Alias_DBlockSecurityDoors.GetCount())
     ObjectReference current = Alias_DBlockSecurityDoors.GetAt(i)
     current.SetOpen(True)
     i = i + 1
EndWhile

;Start Mathis' callout scene.
CF03.SetStageNoWait(136)

;Turn on the lights.
LC030_LightsEnableMarker01Ref.Enable()
QST_CF03_FacilityPoweringUp_1.Play(LC030_LightsEnableMarker01Ref)
Utility.Wait(1.5)
LC030_LightsEnableMarker02Ref.Enable()
QST_CF03_FacilityPoweringUp_2.Play(LC030_LightsEnableMarker02Ref)
Utility.Wait(1.5)
LC030_LightsEnableMarker03Ref.Enable()
QST_CF03_FacilityPoweringUp_3.Play(LC030_LightsEnableMarker03Ref)
Utility.Wait(1.5)
LC030_LightsEnableMarker04Ref.Enable()
QST_CF03_FacilityPoweringUp_4.Play(LC030_LightsEnableMarker04Ref)
Utility.Wait(1.5)
QST_CF03_FacilityPowerOn_MachinesOn.Play(LC030_LightsEnableMarker04Ref)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0411_Item_00
Function Fragment_Stage_0411_Item_00()
;BEGIN CODE
;Set by: LC030_Lock_GuardPostTerminal_CellBlockControls Terminal

;Set the Fissure01 switch to Green.
(Alias_FissureSwitch_Section01.GetRef() as GenericSwitchScript).SetState("On")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0412_Item_00
Function Fragment_Stage_0412_Item_00()
;BEGIN CODE
;Set by: LC030_Lock_GuardPostTerminal_CellBlockControls Terminal

;Set the Fissure02 switch to Green.
(Alias_FissureSwitch_Section02.GetRef() as GenericSwitchScript).SetState("On")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0413_Item_00
Function Fragment_Stage_0413_Item_00()
;BEGIN CODE
;Set by: LC030_Lock_GuardPostTerminal_CellBlockControls Terminal

;Set the Fissure03 switch to Green.
(Alias_FissureSwitch_Section03.GetRef() as GenericSwitchScript).SetState("On")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0421_Item_00
Function Fragment_Stage_0421_Item_00()
;BEGIN CODE
;Set by: D-Block Section 01 Release Switch.

;Unlock and open the cells in Section 01.
QST_CF03_CellblockLiftLockdown_Switch_B.Play(Game.GetPlayer())
Alias_FissureCellDoors_Section01.SetOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0422_Item_00
Function Fragment_Stage_0422_Item_00()
;BEGIN CODE
;Set by: D-Block Section 02 Release Switch.

;Unlock and open the cells in Section 02.
QST_CF03_CellblockLiftLockdown_Switch_C.Play(Game.GetPlayer())
Alias_FissureCellDoors_Section02.SetOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0423_Item_00
Function Fragment_Stage_0423_Item_00()
;BEGIN CODE
;Set by: D-Block Section 03 Release Switch.

;Unlock and open the cells in Section 03.
QST_CF03_CellblockLiftLockdown_Switch_A.Play(Alias_FissureKryxCellDoor.GetRef())
Alias_FissureCellDoors_Section03.SetOpen(True)

;Update CF03.
CF03.SetStage(177)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
;Set by: CF03, stage 215.

;Trigger the barracks ambush.
(Alias_BarracksAmbushTrigger01.GetRef() as DefaultRefAmbushTrigger2).TriggerAmbush()
(Alias_BarracksAmbushTrigger02.GetRef() as DefaultRefAmbushTrigger2).TriggerAmbush()
(Alias_BarracksAmbushTrigger03.GetRef() as DefaultRefAmbushTrigger2).TriggerAmbush()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN AUTOCAST TYPE lc030_questscript
Quest __temp = self as Quest
lc030_questscript kmyQuest = __temp as lc030_questscript
;END AUTOCAST
;BEGIN CODE
;Called by: CF03 stage 230, or Stage 1000.

;Open the door out to the shuttle bay.
Alias_ShuttleBayWardensDoor.GetRef().SetOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0631_Item_00
Function Fragment_Stage_0631_Item_00()
;BEGIN AUTOCAST TYPE lc030_questscript
Quest __temp = self as Quest
lc030_questscript kmyQuest = __temp as lc030_questscript
;END AUTOCAST
;BEGIN CODE
;Called by: CF03 stage 270, or Stage 1000.

;Disable Delgado's ship.
Alias_DelgadosShip.TryToDisable()

;Open the Shuttle Bay Doors.
(Alias_ShuttleBayDoorManager.GetRef() as ShuttleBayDoorManagerScript).OpenShuttleBayDoors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN AUTOCAST TYPE lc030_questscript
Quest __temp = self as Quest
lc030_questscript kmyQuest = __temp as lc030_questscript
;END AUTOCAST
;BEGIN CODE
;Set by: CF03 stage 260.

;Trigger the shuttle bay ambush.
(Alias_ShuttleBayAmbushTrigger01.GetRef() as DefaultRefAmbushTrigger2).TriggerAmbush()

;Start the shuttle bay script monitor.
kMyQuest.StartShuttleBayMonitor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0641_Item_00
Function Fragment_Stage_0641_Item_00()
;BEGIN CODE
;Set by: DefaultCounterAliasColIncOnDeathC ShuttleBayEnemies, 2 dead.

;Trigger the second wave.
(Alias_ShuttleBayAmbushTrigger02.GetRef() as DefaultRefAmbushTrigger2).TriggerAmbush()

;Delay, then trigger the Queen with her SFX.
Utility.Wait(3)
QST_CF03_Stage7_AmbushQueen.Play(Alias_ShuttleBayGryllobaQueen.GetRef())
Utility.Wait(1.3)
(Alias_ShuttleBayAmbushTrigger03.GetRef() as DefaultRefAmbushTrigger2).TriggerAmbush()

;Then display QTs to the remaining enemies.
SetStage(642)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0642_Item_00
Function Fragment_Stage_0642_Item_00()
;BEGIN CODE
;Set by: Stage 641.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;Set by: DefaultCounterQuestA, all shuttle bay enemies killed.

;Allow CF03 to advance.
CF03.SetStage(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
;Set by: Player sits in Shuttle Pilot Seat
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN AUTOCAST TYPE lc030_questscript
Quest __temp = self as Quest
lc030_questscript kmyQuest = __temp as lc030_questscript
;END AUTOCAST
;BEGIN CODE
;Set by: Quest Script, OnLocationChanged, when the player leaves
;The Lock's location following the ceiling collapse.
CF03.SetStage(315)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE lc030_questscript
Quest __temp = self as Quest
lc030_questscript kmyQuest = __temp as lc030_questscript
;END AUTOCAST
;BEGIN CODE
;Set by: CF03, stage 320.

;For debug, set relevant prior stages.
SetStage(20)  ;Enable enemies.
SetStage(280) ;End security lockdown in Transfer Chamber.
SetStage(300) ;End security lockdown in D-Block. Turn on the lights.
SetStage(630) ;Open the Shuttle Bay Security Doors.
SetStage(631) ;Open the Shuttle Bay Doors.

;Set up the postquest enable state.
LC030_Postquest_ShuttleBaySwapEnableMarker.Enable()
LC030_Postquest_ShuttleBaySwapDisableMarker.Disable()

;Remove the forced weather override.
Alias_WeatherManager.TryToDisable()

;Remove Ignore Friendly Hits on quest NPCs.
kMyQuest.SetIgnoreFriendlyHitsOnAllies(False)

;Clean up.
kMyQuest.Cleanup()

;And shut down.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CF03 Auto Const Mandatory
Location Property LC030LockLocation Auto Const Mandatory

ReferenceAlias Property Alias_DelgadosShip Auto Const Mandatory

ReferenceAlias Property Alias_Delgado Auto Const Mandatory
ReferenceAlias Property Alias_GenericAlly01 Auto Const Mandatory
ReferenceAlias Property Alias_GenericAlly02 Auto Const Mandatory
ReferenceAlias Property Alias_GenericAlly01_Corpse Auto Const Mandatory
ReferenceAlias Property Alias_GenericAlly02_Corpse Auto Const Mandatory

ReferenceAlias Property Alias_InteriorEnemiesEnableMarker Auto Const Mandatory
ReferenceAlias Property Alias_TransferChamberAmbushTrigger01 Auto Const Mandatory
ReferenceAlias Property Alias_TransferChamberAmbushTrigger02 Auto Const Mandatory
ReferenceAlias Property Alias_TransferChamberAmbushTrigger03 Auto Const Mandatory
RefCollectionAlias Property Alias_TransferChamberOffscreenCombatEnemies Auto Const Mandatory
ReferenceAlias Property Alias_BarracksAmbushTrigger01 Auto Const Mandatory
ReferenceAlias Property Alias_BarracksAmbushTrigger02 Auto Const Mandatory
ReferenceAlias Property Alias_BarracksAmbushTrigger03 Auto Const Mandatory
RefCollectionAlias Property Alias_ShuttleBayEnemies_All Auto Const Mandatory
ReferenceAlias Property Alias_ShuttleBayAmbushTrigger01 Auto Const Mandatory
ReferenceAlias Property Alias_ShuttleBayAmbushTrigger02 Auto Const Mandatory
ReferenceAlias Property Alias_ShuttleBayAmbushTrigger03 Auto Const Mandatory
ReferenceAlias Property Alias_ShuttleBayGryllobaQueen Auto Const Mandatory

ObjectReference Property LC030_Postquest_ShuttleBaySwapEnableMarker Auto Const Mandatory
ObjectReference Property LC030_Postquest_ShuttleBaySwapDisableMarker Auto Const Mandatory

RefCollectionAlias Property Alias_TransferChamberSecurityDoors Auto Const Mandatory
RefCollectionAlias Property Alias_DBlockSecurityDoors Auto Const Mandatory

ObjectReference Property LC030_LightsEnableMarker01Ref Auto Const Mandatory
ObjectReference Property LC030_LightsEnableMarker02Ref Auto Const Mandatory
ObjectReference Property LC030_LightsEnableMarker03Ref Auto Const Mandatory
ObjectReference Property LC030_LightsEnableMarker04Ref Auto Const Mandatory

ReferenceAlias Property Alias_FissureSwitch_Section01 Auto Const Mandatory
ReferenceAlias Property Alias_FissureSwitch_Section02 Auto Const Mandatory
ReferenceAlias Property Alias_FissureSwitch_Section03 Auto Const Mandatory

RefCollectionAlias property Alias_FissureCellDoors_Section01 Auto Const Mandatory
RefCollectionAlias property Alias_FissureCellDoors_Section02 Auto Const Mandatory
RefCollectionAlias property Alias_FissureCellDoors_Section03 Auto Const Mandatory

ReferenceAlias Property Alias_ShuttleBayDoorManager Auto Const Mandatory
ReferenceAlias Property Alias_ShuttleBayWardensDoor Auto Const Mandatory

ReferenceAlias Property Alias_HomeShip Auto Const Mandatory
ReferenceAlias Property Alias_KeyPlayerDockingPort Auto Const Mandatory
Keyword Property SpaceshipStoredLink Auto Const Mandatory

WWiseEvent Property QST_CF03_FacilityPoweringUp_1 Auto Const Mandatory
WWiseEvent Property QST_CF03_FacilityPoweringUp_2 Auto Const Mandatory
WWiseEvent Property QST_CF03_FacilityPoweringUp_3 Auto Const Mandatory
WWiseEvent Property QST_CF03_FacilityPoweringUp_4 Auto Const Mandatory
WWiseEvent Property QST_CF03_FacilityPowerOn_MachinesOn Auto Const Mandatory
WWiseEvent Property QST_CF03_Stage7_AmbushQueen Auto Const Mandatory
WWiseEvent Property QST_CF03_CellblockLiftLockdown_Switch_A Auto Const Mandatory
WWiseEvent Property QST_CF03_CellblockLiftLockdown_Switch_B Auto Const Mandatory
WWiseEvent Property QST_CF03_CellblockLiftLockdown_Switch_C Auto Const Mandatory

ReferenceAlias Property Alias_WeatherManager Auto Const Mandatory

ReferenceAlias Property Alias_FissureKryxCellDoor Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

ReferenceAlias Property Alias_MapMarkerHeadingClose Auto Const Mandatory
