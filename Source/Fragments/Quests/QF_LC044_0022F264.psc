;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC044_0022F264 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
LC044Jail.Start()
CrowdDisableRyujin.SetValue(1)
RI04SettlementNPCEnableMarker.Disable()
Alias_ExecutiveGenericNPCs.GetRef().Disable()
Alias_Masako.GetRef().Disable()
Alias_Ularu.GetRef().Disable()
Alias_Imogene.GetRef().Disable()
Alias_Camden.GetRef().Disable()
Alias_Yuko.GetRef().Disable()
Alias_LobbyGuardEnableMarker.GetRef().Disable()

Alias_FC_Neon_CT_CityLife_Encounter04Enable.GetRef().Disable()
Alias_FC_Neon_CT_CityLife_Encounter05Enable.GetRef().Disable()
Alias_FC_Neon_CT_CityLife_Encounter06Enable.GetRef().Disable()
Alias_FC_Neon_CT_CityLife_Encounter07Enable.GetRef().Disable()

; Adding wait to make sure all NPCs are disabled before shutting
; down elevators and enabling guard NPCs.

Utility.Wait(5)

;Lock Elevator for all floors
(Alias_ElevatorManager.getref() as LoadElevatorManagerScript).SetElevatorOperational(false)

; Make sure the door on subsidiary floor is unlocked.
Alias_DoorFloor02.GetRef().Lock(False, True)

; Make vent doors/hatches interactable
Alias_VentDoors.BlockActivation(False, False)
Alias_HoldingCellDoor.GetRef().BlockActivation(False, False)
(RI_Support as RI_RadiantSupportQuestScript).UnlockVentDoors()

; Lock Masako and Camden's doors
Alias_CamdenOfficeDoor.GetRef().Lock(True)
Alias_CamdenOfficeDoor.GetRef().SetLockLevel(25)
Alias_MasakoOfficeDoor.GetRef().Lock(True)
Alias_MasakoOfficeDoor.GetRef().SetLockLevel(100)

Alias_LobbyGuardEnableMarker.GetRef().Enable()

RI04GuardEnableMarker.enable()

Alias_AllGuardsTrespass.AddRefCollection(Alias_AllGuardsSafe)
Alias_AllGuardsSafe.RemoveAll()
Alias_AllGuardsTrespass.EvaluateAll()

;release Robot from Pod
(Alias_RobotBoss.getref() as RobotPodScript).WakeRobotFromPod()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Lock Elevator for all floors
(Alias_ElevatorManager.getref() as LoadElevatorManagerScript).SetElevatorOperational(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Alias_AllGuardsTrespass.EvaluateAll()
LC044Jail.SetStage(27)
Alias_AllGuardsSafe.AddRefCollection(Alias_AllGuardsTrespass)
Alias_AllGuardsTrespass.RemoveAll()
Alias_AllGuardsSafe.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_AllGuardsTrespass.EvaluateAll()
Alias_AllGuardsSafe.AddRefCollection(Alias_AllGuardsTrespass)
Alias_AllGuardsTrespass.RemoveAll()
Alias_AllGuardsSafe.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
Alias_AllGuardsTrespass.AddRefCollection(Alias_AllGuardsSafe)
Alias_AllGuardsSafe.RemoveAll()
Alias_AllGuardsTrespass.EvaluateAll()

Game.GetPlayer().AddToFaction(LC044RyujinGuardEnemeyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
LC044Jail.Stop()
CrowdDisableRyujin.SetValue(0)
RI04GuardEnableMarker.disable()
RI04SettlementNPCEnableMarker.enable()
Alias_ExecutiveGenericNPCs.GetRef().Enable()
Alias_Masako.GetRef().Enable()
Alias_Ularu.GetRef().Enable()
Alias_Imogene.GetRef().Enable()
Alias_Camden.GetRef().Enable()
Alias_Yuko.GetRef().Enable()
Alias_RobotBoss.Clear()

;Unlock Elevator for all floors
(Alias_ElevatorManager.getref() as LoadElevatorManagerScript).SetElevatorOperational(true)

Debug.Trace(self + "LC044 Stage 20 set")
If !FC_Neon_CT_CityLife_Encounter04.GetStageDone(100)
Debug.Trace(self + "Check passed for stage 100 NOT being done")
     Alias_FC_Neon_CT_CityLife_Encounter04Enable.GetRef().Enable()
EndIf
If !FC_Neon_CT_CityLife_Encounter05.GetStageDone(100)
Debug.Trace(self + "Check passed for stage 100 NOT being done")
     Alias_FC_Neon_CT_CityLife_Encounter05Enable.GetRef().Enable()
EndIf
If !FC_Neon_CT_CityLife_Encounter06.GetStageDone(100)
     Alias_FC_Neon_CT_CityLife_Encounter06Enable.GetRef().Enable()
EndIf
If !FC_Neon_CT_CityLife_Encounter07.GetStageDone(100)
     Alias_FC_Neon_CT_CityLife_Encounter07Enable.GetRef().Enable()
EndIf

Alias_VentDoors.BlockActivation(True, True)
Alias_HoldingCellDoor.GetRef().BlockActivation(True, True)
(RI_Support as RI_RadiantSupportQuestScript).LockVentDoors()

; Unlock Masako and Camden's doors
Alias_CamdenOfficeDoor.GetRef().Lock(False)
Alias_MasakoOfficeDoor.GetRef().Lock(False)

; Turn lights back on
alias_LightsEnableMarkerFloor03.getref().disable()
alias_LightsEnableMarkerFloor03Construction.getref().enable()
alias_LightsEnableMarkerFloor04.getref().disable()
alias_LightsEnableMarkerFloor05.getref().disable()
alias_LightsEnableMarkerFloor06.getref().disable()

;return Robot to Pod
(Alias_RobotBoss.getref() as RobotPodScript).SendRobotToPod()
if Alias_RobotBoss.getactorref().IsDead()
	Alias_RobotBoss.getactorref().disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
LoadElevatorFloorScript floorScript = Alias_ElevFloor03.GetRef() as LoadElevatorFloorScript
floorScript.SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Alias_DoorFloor02.GetRef().Lock(False, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
LoadElevatorFloorScript floorScript = Alias_ElevFloor04.GetRef() as LoadElevatorFloorScript
floorScript.SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
LoadElevatorFloorScript floorScript = Alias_ElevFloor05.GetRef() as LoadElevatorFloorScript
floorScript.SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
LoadElevatorFloorScript floorScript = Alias_ElevFloor06.GetRef() as LoadElevatorFloorScript
floorScript.SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;CraneRotationHelper.SetAnimationVariableFloat("Position", 0.58)
;CraneRotationHelper.SetAnimationVariableFloat("Speed", 0.05)
;CraneRotationHelper.PlayAnimation("Rotate_Short")

CraneRotationHelper.PlayAnimation("Play01")
QST_RI04_CraneMove.Play(Alias_CraneSound.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
alias_LightsEnableMarkerFloor03.getref().enable()
alias_LightsEnableMarkerFloor03Construction.getref().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
alias_LightsEnableMarkerFloor04.getref().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
alias_LightsEnableMarkerFloor05.getref().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
alias_LightsEnableMarkerFloor06.getref().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetStage(100)
SetStage(200)
SetStage(300)
SetStage(350)
SetStage(400)
SetStage(500)
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Alias_InfinityOfficeEnableMarker.GetRef().Enable()
Alias_InfinityConstructionEnableMarker.GetRef().Disable()
Alias_Nina.GetRef().MoveTo(Alias_NinaRyujinMarker.GetRef())

(Alias_ElevatorManager.GetRef() as LoadElevatorManagerScript).SetFloorNames(LC044LoadElevatorFloorNames_PostQuest)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property RI04GuardEnableMarker Auto Const

Faction Property LC044RyujinGuardCrimeFaction Auto Const

Cell Property LC044RyujinIndustriesHQ Auto Const

ObjectReference Property RI04SettlementNPCEnableMarker Auto Const

ReferenceAlias Property Alias_ElevFloor03 Auto Const Mandatory

ReferenceAlias Property Alias_ElevFloor04 Auto Const Mandatory

ReferenceAlias Property Alias_ElevFloor05 Auto Const Mandatory

ReferenceAlias Property Alias_ElevFloor06 Auto Const Mandatory

Faction Property LC044RyujinGuardEnemeyFaction Auto Const

RefCollectionAlias Property Alias_AllGuardsTrespass Auto Const Mandatory

RefCollectionAlias Property Alias_AllGuardsSafe Auto Const Mandatory

Float Property Speed Auto Const

ObjectReference Property CraneRotationHelper Auto Const

ReferenceAlias Property Alias_Masako Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

ReferenceAlias Property Alias_Camden Auto Const Mandatory

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

ReferenceAlias Property Alias_DoorFloor02 Auto Const Mandatory

ObjectReference Property OfficeConstructionEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Nina Auto Const Mandatory

ReferenceAlias Property Alias_NinaRyujinMarker Auto Const Mandatory

ReferenceAlias Property Alias_Yuko Auto Const Mandatory

ReferenceAlias Property Alias_ElevFloor01 Auto Const Mandatory

ReferenceAlias Property Alias_ElevFloor02 Auto Const Mandatory

ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter04Enable Auto Const Mandatory

ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter06Enable Auto Const Mandatory

ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter07Enable Auto Const Mandatory

Quest Property FC_Neon_CT_CityLife_Encounter04 Auto Const Mandatory

Quest Property FC_Neon_CT_CityLife_Encounter06 Auto Const Mandatory

Quest Property FC_Neon_CT_CityLife_Encounter07 Auto Const Mandatory

ObjectReference Property RI04LightEnableMarker Auto Const

Quest Property LC044Jail Auto Const

ReferenceAlias Property Alias_LightsEnableMarkerFloor03 Auto Const Mandatory

ReferenceAlias Property Alias_LightsEnableMarkerFloor04 Auto Const Mandatory

ReferenceAlias Property Alias_LightsEnableMarkerFloor05 Auto Const Mandatory

ReferenceAlias Property Alias_LightsEnableMarkerFloor06 Auto Const Mandatory

RefCollectionAlias Property Alias_VentDoors Auto Const Mandatory

ReferenceAlias Property Alias_HoldingCellDoor Auto Const Mandatory

ReferenceAlias Property Alias_CamdenOfficeDoor Auto Const Mandatory

ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const Mandatory

ReferenceAlias Property Alias_ElevatorManager Auto Const Mandatory

Message Property LC044LoadElevatorFloorNames_PostQuest Auto Const Mandatory

GlobalVariable Property RI06_Track_PlayerWitholdsClinicNames Auto Const Mandatory

Quest Property RI_Support Auto Const Mandatory

ReferenceAlias Property Alias_LightsEnableMarkerFloor03Construction Auto Const Mandatory

ReferenceAlias Property Alias_InfinityConstructionEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_InfinityOfficeEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_ExecutiveGenericNPCs Auto Const Mandatory

ReferenceAlias Property Alias_RobotBoss Auto Const Mandatory

WwiseEvent Property QST_RI04_CraneMove Auto Const

ReferenceAlias Property Alias_CraneSound Auto Const Mandatory

ReferenceAlias Property Alias_LobbyGuardEnableMarker Auto Const Mandatory

GlobalVariable Property CrowdDisableRyujin Auto Const Mandatory

ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter05Enable Auto Const Mandatory

Quest Property FC_Neon_CT_CityLife_Encounter05 Auto Const Mandatory
