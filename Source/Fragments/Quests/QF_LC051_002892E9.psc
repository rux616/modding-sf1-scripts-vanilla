;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC051_002892E9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
WwiseEvent_QST_RI07_Security_Alarm_Play.Play(Game.GetPlayer())

Game.GetPlayer().AddToFaction(LC051InfinityLTDPEnemyFaction)
Alias_GuardEnableMarker.getref().enable()

setstage(605)

Alias_RDEmployeesSafe.EvaluateAll()
Alias_OfficeEmployeesSafe.EvaluateAll()
Alias_MarketingEmployeesSafe.EvaluateAll()
Alias_ExecutiveEmployeesSafe.EvaluateAll()

Int GuardCount = Alias_RDGuards.GetCount()
int currentGuardIndex = 0

	While (currentGuardIndex < GuardCount)
		Alias_RDGuards.GetAt(currentGuardIndex).SetValue(Game.GetSuspiciousAV(), 1)
     		currentGuardIndex += 1
   	endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Play Audio FX
WwiseEvent_QST_RI07_Machine_Malfunction.Play(game.getplayer())
WwiseEvent_QST_RI07_Machine_Malfunction_Alarm.play(game.getplayer())

Alias_EmployeeEnableMarker.getref().disable()
Alias_Harper.GetRef().Disable()
Alias_Stanley.GetRef().Disable()
Alias_Angelo.GetRef().Disable()
Alias_Lucas.GetRef().Disable()
Alias_Faye.GetRef().Disable()
Alias_GuardEnableMarker.getref().enable()
Alias_GasEnableMarker.GetRef().Enable()

Int GuardCount = Alias_RDGuards.GetCount()
int currentGuardIndex = 0

	While (currentGuardIndex < GuardCount)
		Alias_RDGuards.GetAt(currentGuardIndex).SetValue(Game.GetSuspiciousAV(), 1)
     		currentGuardIndex += 1
   	endWhile

;Turn Security Turrets On
Int TurretCount = Alias_Turrets.GetCount()
int currentTurretIndex = 0

	While (currentTurretIndex < TurretCount)
		(Alias_Turrets.GetAt(currentTurretIndex)as actor).SetUnconscious(false)
     		currentTurretIndex += 1
   	endWhile

;Unlock and Open Drexler Door
Alias_DrexlerOfficeDoor.GetRef().Unlock()
Alias_DrexlerOfficeDoor.GetRef().SetOpen()

;DamagePipes
Int PipeCount = Alias_DamagedPipes.GetCount()
int currentPipeIndex = 0

	While (currentPipeIndex <  PipeCount)
		Alias_DamagedPipes.GetAt(currentPipeIndex).DamageObject(2000.0)
    		currentPipeIndex += 1
 	endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_ExplosionXMarker.getref().PlaceatMe(GrenadeLauncherExplosion)
Alias_NueroampSecuirtyDoor.getref().Setopen()
Actor Linkedguard = Alias_ExplosionXMarker.getref().GetLinkedRef() as actor

Linkedguard.kill()

;Make NPCs react

Alias_RDEmployeesSafe.EvaluateAll()

Int GuardCount = Alias_RDGuards.GetCount()
int currentGuardIndex = 0

	While (currentGuardIndex < GuardCount)
		Alias_RDGuards.GetAt(currentGuardIndex).SetValue(Game.GetSuspiciousAV(), 1)
     		currentGuardIndex += 1
   	endWhile

Alias_GeneratorAlarmSoundMarker.getref().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
LoadElevatorFloorScript floorScript = Alias_ElevFloorRD.GetRef() as LoadElevatorFloorScript
floorScript.SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
LoadElevatorFloorScript floorScript = Alias_ElevFloorOffice.GetRef() as LoadElevatorFloorScript
floorScript.SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
LoadElevatorFloorScript floorScript = Alias_ElevFloorMarketing.GetRef() as LoadElevatorFloorScript
floorScript.SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
LoadElevatorFloorScript floorScript = Alias_ElevFloorExecutive.GetRef() as LoadElevatorFloorScript
floorScript.SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
LoadElevatorFloorScript floorScript = Alias_ElevFloorRoof.GetRef() as LoadElevatorFloorScript
floorScript.SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
if !GetStageDone(10)
	Alias_RDEmployeesSafe.AddRefCollection(Alias_RDEmployeesTrespass)
	Alias_RDEmployeesTrespass.RemoveAll()
	Alias_RDEmployeesSafe.EvaluateAll()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0605_Item_00
Function Fragment_Stage_0605_Item_00()
;BEGIN CODE
Alias_RDEmployeesTrespass.AddRefCollection(Alias_RDEmployeesSafe)
Alias_RDEmployeesSafe.RemoveAll()
Alias_RDEmployeesTrespass.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
Alias_OfficeEmployeesSafe.AddRefCollection(Alias_OfficeEmployeesTrespass)
Alias_OfficeEmployeesTrespass.RemoveAll()
Alias_OfficeEmployeesSafe.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
LoadElevatorFloorScript floorScript = Alias_ElevFloorMarketing.GetRef() as LoadElevatorFloorScript
floorScript.SetAccessible(true)

Alias_MarketingEmployeesSafe.AddRefCollection(Alias_MarketingEmployeesTrespass)
Alias_MarketingEmployeesTrespass.RemoveAll()
Alias_MarketingEmployeesSafe.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
Alias_ExecutiveEmployeesSafe.AddRefCollection(Alias_ExecutiveEmployeesTrespass)
Alias_ExecutiveEmployeesTrespass.RemoveAll()
Alias_ExecutiveEmployeesSafe.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;RD
Alias_RDEmployeesSafe.AddRefCollection(Alias_RDEmployeesTrespass)
Alias_RDEmployeesTrespass.RemoveAll()
Alias_RDEmployeesSafe.EvaluateAll()

;Office
Alias_OfficeEmployeesSafe.AddRefCollection(Alias_OfficeEmployeesTrespass)
Alias_OfficeEmployeesTrespass.RemoveAll()
Alias_OfficeEmployeesSafe.EvaluateAll()

;Marketing
Alias_MarketingEmployeesSafe.AddRefCollection(Alias_MarketingEmployeesTrespass)
Alias_MarketingEmployeesTrespass.RemoveAll()
Alias_MarketingEmployeesSafe.EvaluateAll()

;Executive
Alias_ExecutiveEmployeesSafe.AddRefCollection(Alias_ExecutiveEmployeesTrespass)
Alias_ExecutiveEmployeesTrespass.RemoveAll()
Alias_ExecutiveEmployeesSafe.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
;RD
Alias_RDEmployeesTrespass.AddRefCollection(Alias_RDEmployeesSafe)
Alias_RDEmployeesSafe.RemoveAll()
Alias_RDEmployeesTrespass.EvaluateAll()

;Office
Alias_OfficeEmployeesTrespass.AddRefCollection(Alias_OfficeEmployeesSafe)
Alias_OfficeEmployeesSafe.RemoveAll()
Alias_OfficeEmployeesTrespass.EvaluateAll()

;Marketing
Alias_MarketingEmployeesTrespass.AddRefCollection(Alias_MarketingEmployeesSafe)
Alias_MarketingEmployeesSafe.RemoveAll()
Alias_MarketingEmployeesTrespass.EvaluateAll()

;Executive
Alias_ExecutiveEmployeesTrespass.AddRefCollection(Alias_ExecutiveEmployeesSafe)
Alias_ExecutiveEmployeesSafe.RemoveAll()
Alias_ExecutiveEmployeesTrespass.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; If gas was used, swap keywords so NPCs show up in regular clothes
RI_Support.SetStage(6020)

LoadElevatorFloorScript RDFloorScript = Alias_ElevFloorRD.GetRef() as LoadElevatorFloorScript
RDFloorScript.SetAccessible(True)
LoadElevatorFloorScript GenOFficeFloorScript = Alias_ElevFloorOffice.GetRef() as LoadElevatorFloorScript
GenOfficeFloorScript.SetAccessible(True)
LoadElevatorFloorScript MarketingFloorScript = Alias_ElevFloorMarketing.GetRef() as LoadElevatorFloorScript
MarketingFloorScript.SetAccessible(True)
LoadElevatorFloorScript ExecutiveFloorScript = Alias_ElevFloorExecutive.GetRef() as LoadElevatorFloorScript
ExecutiveFloorScript.SetAccessible(True)
LoadElevatorFloorScript RoofFloorScript = Alias_ElevFloorRoof.GetRef() as LoadElevatorFloorScript
RoofFloorScript.SetAccessible(True)

;RD
Alias_RDEmployeesSafe.AddRefCollection(Alias_RDEmployeesTrespass)
Alias_RDEmployeesTrespass.RemoveAll()
Alias_RDEmployeesSafe.EvaluateAll()

;Office
Alias_OfficeEmployeesSafe.AddRefCollection(Alias_OfficeEmployeesTrespass)
Alias_OfficeEmployeesTrespass.RemoveAll()
Alias_OfficeEmployeesSafe.EvaluateAll()

;Marketing
Alias_MarketingEmployeesSafe.AddRefCollection(Alias_MarketingEmployeesTrespass)
Alias_MarketingEmployeesTrespass.RemoveAll()
Alias_MarketingEmployeesSafe.EvaluateAll()

;Executive
Alias_ExecutiveEmployeesSafe.AddRefCollection(Alias_ExecutiveEmployeesTrespass)
Alias_ExecutiveEmployeesTrespass.RemoveAll()
Alias_ExecutiveEmployeesSafe.EvaluateAll()

Alias_Lucas.GetRef().Disable()
Alias_Faye.GetRef().Disable()

Alias_GasEnableMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Alias_EmployeeEnableMarker.GetRef().Disable()
Alias_PostQuestGuardDisableMarker.GetRef().Disable()
Alias_GuardEnableMarker.GetRef().Disable()
Alias_Harper.GetRef().Disable()
Alias_Stanley.GetRef().Disable()
Alias_Angelo.GetRef().Disable()
Alias_Lucas.GetRef().Disable()
Alias_Faye.GetRef().Disable()
(Alias_ExteriorElevator.GetRef() as LoadElevatorManagerScript).SetElevatorOperational(False)
LC051InfinityHQ.EnableFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TestGuard Auto Const Mandatory

ReferenceAlias Property Alias_GuardEnableMarker Auto Const Mandatory

RefCollectionAlias Property Alias_RDGuards Auto Const Mandatory

ReferenceAlias Property Alias_EmployeeEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_ElevFloorRD Auto Const Mandatory

ReferenceAlias Property Alias_ElevFloorOffice Auto Const Mandatory

ReferenceAlias Property Alias_ElevFloorMarketing Auto Const Mandatory

ReferenceAlias Property Alias_ElevFloorExecutive Auto Const Mandatory

ReferenceAlias Property Alias_TrespassTriggerRD Auto Const Mandatory

ReferenceAlias Property Alias_TrespassTriggerOffice Auto Const Mandatory

ReferenceAlias Property Alias_TrespassTriggerMarketing Auto Const Mandatory

ReferenceAlias Property Alias_TrespassTriggerExecutive Auto Const Mandatory

RefCollectionAlias Property Alias_Turrets Auto Const Mandatory

RefCollectionAlias Property Alias_MarketingEmployeesTrespass Auto Const Mandatory

RefCollectionAlias Property Alias_MarketingEmployeesSafe Auto Const Mandatory

Faction Property TestAustinFFactionInfinity Auto Const

Faction Property TestAustinFFactionInfinityPlayer Auto Const

RefCollectionAlias Property Alias_RDEmployeesTrespass Auto Const Mandatory

RefCollectionAlias Property Alias_RDEmployeesSafe Auto Const Mandatory

ReferenceAlias Property Alias_TrespassTriggerRD02 Auto Const Mandatory

RefCollectionAlias Property Alias_OfficeEmployeesTrespass Auto Const Mandatory

RefCollectionAlias Property Alias_OfficeEmployeesSafe Auto Const Mandatory

RefCollectionAlias Property Alias_ExecutiveEmployeesTrespass Auto Const Mandatory

RefCollectionAlias Property Alias_ExecutiveEmployeesSafe Auto Const Mandatory

WwiseEvent Property Wwise_Event_OBJ_Alarm_Starstation_Hostile Auto Const

ReferenceAlias Property Alias_ElevFloorRoof Auto Const Mandatory

Explosion Property GrenadeLauncherExplosion Auto Const

ReferenceAlias Property Alias_ExplosionXmarker Auto Const Mandatory

ReferenceAlias Property Alias_NueroampSecuirtyDoor Auto Const Mandatory

Faction Property LC051InfinityLTDPEnemyFaction Auto Const

ReferenceAlias Property Alias_DrexlerOfficeDoor Auto Const Mandatory

ReferenceAlias Property Alias_DamagedPipe Auto Const Mandatory

RefCollectionAlias Property Alias_DamagedPipes Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_RI07_Machine_Malfunction Auto Const

WwiseEvent Property WwiseEvent_QST_RI07_Machine_Malfunction_Alarm Auto Const

WwiseEvent Property WwiseEvent_QST_RI07_Security_Alarm_Play Auto Const

WwiseEvent Property WwiseEvent_QST_RI07_Security_Alarm_Stop Auto Const

ReferenceAlias Property Alias_Harper Auto Const Mandatory

ReferenceAlias Property Alias_Stanley Auto Const Mandatory

ReferenceAlias Property Alias_Angelo Auto Const Mandatory

ReferenceAlias Property Alias_ExteriorElevator Auto Const Mandatory

ReferenceAlias Property Alias_Lucas Auto Const Mandatory

ReferenceAlias Property Alias_Faye Auto Const Mandatory

ReferenceAlias Property Alias_PostQuestGuardDisableMarker Auto Const Mandatory

ReferenceAlias Property Alias_GasEnableMarker Auto Const Mandatory

WwiseEvent Property Wwise_Event_OBJ_Alarm_Generic_Play Auto Const

ReferenceAlias Property Alias_GeneratorAlarmSoundMarker Auto Const Mandatory

Quest Property RI_Support Auto Const Mandatory

ReferenceAlias Property Alias_RoofAccessDoor Auto Const Mandatory

Cell Property LC051InfinityHQ Auto Const Mandatory
