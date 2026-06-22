;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF03_0024EEF8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Full Debug Setup - No Flight

;Standard setup for all quickstarts.
SetStage(9)

;Specific setup for this quickstart.
SetStage(20)

;Move everyone into position.
LC030.MoveAlliesToPackageLocations()

;And move the player.
Game.GetPlayer().MoveTo(CF03PlayerStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Full Debug Setup - No Flight, After Terrain Traversal Sequence

;Standard setup for all quickstarts.
SetStage(9)

;Specific setup for this quickstart.
SetStage(40)

;Move everyone into position.
LC030.MoveAlliesToPackageLocations()

;And move the player.
Game.GetPlayer().MoveTo(CF03PlayerOuterDoorMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Full Debug Setup - No Flight, The Lock Interior

;Standard setup for all quickstarts.
SetStage(9)

;Specific setup for this quickstart.
SetStage(50)  ;Stage 50 already moves all of the actors into positiion.

;And move the player.
Game.GetPlayer().MoveTo(CF03PlayerInsideLockMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Full Debug Setup - No Flight, The Lock Interior

;Standard setup for all quickstarts.
SetStage(9)

;Specific setup for this quickstart.
SetStage(50)
SetStage(51)
CF03ActorsUseGroupTravelGlobal.SetValue(0)

;Move the player.
Game.GetPlayer().MoveTo(CF03PlayerStartInLock)

;Delay briefly to avoid a conflict with the ambush.
Utility.Wait(1)

;Move everyone else into position.
LC030.MoveAlliesToPackageLocations()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Full Debug Setup - Start at the Intake Room.

;Standard setup for all quickstarts.
SetStage(9)

;Specific setup for this quickstart.
SetStage(130)
SetStage(131)
LC030.SetStage(20)

;Begin Mathis follow
SQ_Followers.SetRoleActive(Alias_CF03_Mathis.GetActorRef())
SQ_Followers.CommandFollow(Alias_CF03_Mathis.GetActorRef())

;Move the player and Mathis.
Game.GetPlayer().MoveTo(CF03PlayerStartAtIntake)
Alias_CF03_Mathis.TryToMoveTo(CF03MathisStartAtIntake)
Alias_CF03_Mathis.TryToEvaluatePackage()

;Disable the generic Crimson Fleet actors.
Alias_CF03_GenericAlly01.TryToDisable()
Alias_CF03_GenericAlly02.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Full Debug Setup - Start at the Armory.

;Standard setup for all quickstarts.
SetStage(9)

;Specific setup for this quickstart.
SetStage(131)
SetStage(210)
LC030.SetStage(20)

;Begin Mathis follow
SQ_Followers.SetRoleActive(Alias_CF03_Mathis.GetActorRef())
SQ_Followers.CommandFollow(Alias_CF03_Mathis.GetActorRef())

;Move the player and Mathis.
Game.GetPlayer().MoveTo(CF03PlayerStartAtArmory)
Alias_CF03_Mathis.TryToMoveTo(CF03MathisStartAtArmory)
Alias_CF03_Mathis.TryToEvaluatePackage()

;Disable the generic Crimson Fleet actors.
Alias_CF03_GenericAlly01.TryToDisable()
Alias_CF03_GenericAlly02.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Full Debug Setup - Start at the Barracks.

;Standard setup for all quickstarts.
SetStage(9)

;Specific setup for this quickstart.
SetStage(131)
SetStage(210)
LC030.SetStage(20)

;Begin Mathis follow
SQ_Followers.SetRoleActive(Alias_CF03_Mathis.GetActorRef())
SQ_Followers.CommandFollow(Alias_CF03_Mathis.GetActorRef())

;Move the player and Mathis.
Game.GetPlayer().MoveTo(CF03PlayerStartAtBarracks)
Alias_CF03_Mathis.TryToMoveTo(CF03MathisStartAtBarracks)
Alias_CF03_Mathis.TryToEvaluatePackage()

;Disable the generic Crimson Fleet actors.
Alias_CF03_GenericAlly01.TryToDisable()
Alias_CF03_GenericAlly02.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Full Debug Setup - Start at the Warden's Office.

;Standard setup for all quickstarts.
SetStage(9)

;Specific setup for this quickstart.
SetStage(131)
SetStage(210)
LC030.SetStage(20)

;Begin Mathis follow
SQ_Followers.SetRoleActive(Alias_CF03_Mathis.GetActorRef())
SQ_Followers.CommandFollow(Alias_CF03_Mathis.GetActorRef())

;Move the player and Mathis.
Game.GetPlayer().MoveTo(CF03PlayerStartAtWarden)
Alias_CF03_Mathis.TryToMoveTo(CF03MathisStartAtWarden)
Alias_CF03_Mathis.TryToEvaluatePackage()

;Disable the generic Crimson Fleet actors.
Alias_CF03_GenericAlly01.TryToDisable()
Alias_CF03_GenericAlly02.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
;Full Debug Setup - Start at the Warden's Office.

;Standard setup for all quickstarts.
SetStage(9)

;Specific setup for this quickstart.
SetStage(131)
SetStage(222)
LC030.SetStage(20)

;Begin Mathis follow
SQ_Followers.SetRoleActive(Alias_CF03_Mathis.GetActorRef())
SQ_Followers.CommandFollow(Alias_CF03_Mathis.GetActorRef())

;Move the player and Mathis.
Game.GetPlayer().MoveTo(CF03PlayerShuttleStart)
Alias_CF03_Mathis.TryToMoveTo(CF03MathisShuttleStart)
Alias_CF03_Mathis.TryToEvaluatePackage()

;Disable the generic Crimson Fleet actors.
Alias_CF03_GenericAlly01.TryToDisable()
Alias_CF03_GenericAlly02.TryToDisable()

;Set BEScript landing ramp stage
SetStage(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
;Standard setup for all CF03 Quickstarts.

;-Set up the Vigilance
;-SetAlly to CF, SysDef, Key factions.
CF_Main.SetStage(1)

;Enable all of the allies.
SetStage(15)

;Start LC030.
LC030LockLocation.Reset()
LC030.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
ObjectReference LockMapMarkerRef = Alias_CF03_MapMarkerRef.GetRef()
LockMapMarkerRef.AddToMapScanned(True)
LockMapMarkerRef.SetRequiresScanning(False)
LC030.Start()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Full Debug Setup - Start at the Warden's Office.

;Standard setup for all quickstarts.
SetStage(9)

;Specific setup for this quickstart.
SetStage(131)
SetStage(223)
SetStage(270)
LC030.SetStage(20)

;Begin Mathis follow
SQ_Followers.SetRoleActive(Alias_CF03_Mathis.GetActorRef())
SQ_Followers.CommandFollow(Alias_CF03_Mathis.GetActorRef())

;Move the player and Mathis.
Game.GetPlayer().MoveTo(CF03PlayerShuttleStart)
Alias_CF03_Mathis.TryToMoveTo(CF03MathisShuttleStart)
Alias_CF03_Mathis.TryToEvaluatePackage()

;Disable the generic Crimson Fleet actors.
Alias_CF03_GenericAlly01.TryToDisable()
Alias_CF03_GenericAlly02.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
;Full Debug Setup - Start at the Intake Room.

;Standard setup for all quickstarts.
SetStage(9)

;Specific setup for this quickstart.
LC030.SetStage(413)
SetStage(176)

;Begin Mathis follow
SQ_Followers.SetRoleActive(Alias_CF03_Mathis.GetActorRef())
SQ_Followers.CommandFollow(Alias_CF03_Mathis.GetActorRef())

;Move the player and Mathis.
Game.GetPlayer().MoveTo(CF03_PlayerStartKryxCell)
Alias_CF03_Mathis.TryToMoveTo(CF03_MathisStartKryxCell)
Alias_CF03_Mathis.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
;Simulate Leaving the Lock
SetStage(10)
SetStage(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Move Mathis and Delgado to the Planet once Player undocked
Actor delgadoRef = Alias_CF03_Delgado.GetActorRef()
delgadoRef.Reset()
delgadoRef.MoveTo(CF03DelgadoStartMarker)
delgadoRef.EvaluatePackage()
Actor mathisRef = Alias_CF03_Mathis.GetActorRef()
mathisRef.Reset()
mathisRef.MoveTo(CF03MathisStartMarker)
mathisRef.EvaluatePackage()

;Enable the generic allies.
Alias_CF03_GenericAlly01.TryToEnable()
Alias_CF03_GenericAlly01.TryToEvaluatePackage()
Alias_CF03_GenericAlly02.TryToEnable()
Alias_CF03_GenericAlly02.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
;Triggered from CF_Main Stage 300
;Checks if any SysDef Objectives are active and kills them

If IsObjectiveDisplayed(410) == 1
   SetObjectiveDisplayed(410,0)
   SetStage(1000)
EndIf

If IsObjectiveDisplayed(420) == 1
   SetObjectiveDisplayed(420,0)
   SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;In case the undock doesn't take or fasttravel is used, fire off Stage 15
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;Calling evp on Delgado and Mathis first for GEN-498319
Alias_CF03_Delgado.GetActorRef().EvaluatePackage()
Alias_CF03_Mathis.GetActorRef().EvaluatePackage()
Utility.Wait(WaitTime)
LC030.EVPAllies()
LC030.StartExteriorMonitor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

;Update the Map Marker Heading.
LC030.SetStage(15)

;Evp here for SetStage 1 Debug Purposes
utility.wait(3)
Alias_CF03_Delgado.GetActorRef().EvaluatePackage()
Alias_CF03_Mathis.GetActorRef().EvaluatePackage()
Alias_CF03_GenericAlly01.GetActorRef().EvaluatePackage()
Alias_CF03_GenericAlly02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
LC030.EndExteriorMonitorNoWait()
LC030.RegisterForDelgadoUsingIDCardReader()
SetObjectiveCompleted(40)
SetObjectiveDisplayed(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0048_Item_00
Function Fragment_Stage_0048_Item_00()
;BEGIN CODE
;Set by: LC030's OnAnimationEvent.

Utility.Wait(0.45)

;Play the door animation (light change/sfx)
Alias_CF03_IDReader.GetRef().PlayAnimation("CardSwiped")

Utility.Wait(0.55)

;Play the Cracking Ice SFX.
QST_CF03_Stage1_DoorUnlock.Play(Alias_CF03_ExteriorDoor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStageNoWait(48)
SetObjectiveCompleted(45)
SetObjectiveDisplayed(50)
LC030TheLockDoorMainEntranceRef.Unlock()
LC030TheLockDoorMainEntranceRef.SetLockLevel(0)
utility.wait(1)
Alias_CF03_Delgado.GetActorRef().EvaluatePackage()
Alias_CF03_Mathis.GetActorRef().EvaluatePackage()
Alias_CF03_GenericAlly01.GetActorRef().EvaluatePackage()
Alias_CF03_GenericAlly02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
CF03_Stage040_Delgado_LockExtOutroScene.Stop()
LC030.MoveAlliesIntoLock()
Utility.Wait(8)
if (!GetStageDone(3))
     CF03_Stage050_StairsScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
;Ambush Completion Check
;Making sure Player/Mathis/Delgado has tripped the trigger

if GetStageDone(52) == 1 && GetStageDone(54) == 1 && GetStageDone(56) == 1
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0054_Item_00
Function Fragment_Stage_0054_Item_00()
;BEGIN CODE
;Ambush Completion Check
;Making sure Player/Mathis/Delgado has tripped the trigger

if GetStageDone(52) == 1 && GetStageDone(54) == 1 && GetStageDone(56) == 1
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0056_Item_00
Function Fragment_Stage_0056_Item_00()
;BEGIN CODE
;Ambush Completion Check
;Making sure Player/Mathis/Delgado has tripped the trigger

if GetStageDone(52) == 1 && GetStageDone(54) == 1 && GetStageDone(56) == 1
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

;Trigger hit, play mini-scene and trigger ambush
CF03_Stage060_Delgado_AttackScene.Start()
Alias_CF03_Delgado.GetActorRef().EvaluatePackage()
Alias_CF03_Mathis.GetActorRef().EvaluatePackage()
Alias_CF03_GenericAlly01.GetActorRef().EvaluatePackage()
Alias_CF03_GenericAlly02.GetActorRef().EvaluatePackage()

;Optional: For quickstart, just trigger the combat immediately.
;if (GetStageDone(3))
;     SetStage(65)
;EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0063_Item_00
Function Fragment_Stage_0063_Item_00()
;BEGIN CODE
;Play the Ambush Tunneling SFX
ObjectReference[] tunnelingSFXMarkerRefs = Alias_CF03_TAAmbushSFXMarkerRefCol.GetArray()
int i = 0
While (i < tunnelingSFXMarkerRefs.Length)
     QST_CF03_Stage3_Ambush.Play(tunnelingSFXMarkerRefs[i])
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;Fire off Ambush
LC030.SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;LD Call when Creatures Dead - Waiting
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
LC030.EVPAllies()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
LC030.EVPAllies()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0081_Item_00
Function Fragment_Stage_0081_Item_00()
;BEGIN CODE
Alias_CF03_Mathis.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
CF03_Stage080_Mathis_CollapseScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Alias_CF03_Mathis.GetActorRef().EvaluatePackage()
SetObjectiveDisplayed(80,0)
SetObjectiveDisplayed(90)

;Move Delgado into position in the Processing Room.
Alias_CF03_Delgado.TryToMoveTo(CF03DelgadoTransferAreaPAMarker)
Alias_CF03_Delgado.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
SetObjectiveDisplayed(80,1)

;Begin Mathis follow
SQ_Followers.SetRoleActive(Alias_CF03_Mathis.GetActorRef())
SQ_Followers.CommandFollow(Alias_CF03_Mathis.GetActorRef())

;Allow the player to activate the collapsing wall.
LC030.SetStage(260)

;Start the Offsceeen Combat out in the Transfer Area.
LC030.SetStage(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
CF03_Stage105_Mathis_WallPanelFallsCallout.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0107_Item_00
Function Fragment_Stage_0107_Item_00()
;BEGIN CODE
;Set by: Trigger in the stairway to the Control Room.

;Have LC030 shut down the offscreen combat, kill the generic allies,
;and get Delgado into position for the Intercom Scene.
LC030.SetStage(279)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(110)

;Start the intercom scene
CF03_Stage100_Delgado_PACallout.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
CF03_Stage100_Delgado_PACallout.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)

;Have LC030 unlock the security doors.
LC030.SetStage(280)

;Start the lockdown rescinded announcement.
CF03_Stage130_EndLockdown.Start()

;EVP Mathis and Delgado
Alias_CF03_Delgado.GetActorRef().EvaluatePackage()
Alias_CF03_Mathis.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0131_Item_00
Function Fragment_Stage_0131_Item_00()
;BEGIN CODE
;As a convenience, for quickstarts, make sure the ceiling collapse has occurred.
LC030.CollapseCeiling(True)

;When Delgado exits Transfer Area - Disable and Move him to next visible point
Alias_CF03_Delgado.GetActorRef().Disable()
Alias_CF03_Delgado.GetActorRef().MoveTo(CF03DelgadoShuttleOverlookMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_00
Function Fragment_Stage_0132_Item_00()
;BEGIN CODE
;Set by: Trigger in the Intake Office.

Actor playerRef = Game.GetPlayer()
Actor mathisRef = Alias_CF03_Mathis.GetActorRef()

;Catch Mathis up, if necessary.
if (!playerRef.HasDetectionLOS(mathisRef) && !playerRef.HasDetectionLOS(CF03MathisCatchupIntakeMarker) && (playerRef.GetDistance(mathisRef) > 8))
     mathisRef.MoveTo(CF03MathisCatchupIntakeMarker)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
;Set by: Intake Terminal, ending the lockdown in D-Block.

;Open the security door. Turn on the lights.
LC030.SetStageNoWait(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0136_Item_00
Function Fragment_Stage_0136_Item_00()
;BEGIN CODE
;Set by: LC030 stage 300, after opening the doors.

;Start Mathis' callout scene,
CF03_Stage135_Mathis_TowerCallout.Start()

;Make sure Delgado has moved ahead to the Guard Tower.
if (!GetStageDone(131))
     SetStage(131)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)
SetObjectiveDisplayed(140)

Alias_CF03_Mathis.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
;Catch Mathis up if needed.
Actor playerRef = Game.GetPlayer()
Actor mathisRef = Alias_CF03_Mathis.GetActorRef()
if (!playerRef.HasDetectionLOS(mathisRef) && !playerRef.HasDetectionLOS(CF03MathisTowerOverrideMarker) && (playerRef.GetDistance(mathisRef) > 8))
     mathisRef.MoveTo(CF03MathisTowerOverrideMarker)
EndIf

;Then start his scene.
CF03_Stage145_Mathis_TowerScenePreCallout.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140)
SetObjectiveDisplayed(150)

;Catch Mathis up if needed.
Actor playerRef = Game.GetPlayer()
Actor mathisRef = Alias_CF03_Mathis.GetActorRef()
if (!playerRef.HasDetectionLOS(mathisRef) && !playerRef.HasDetectionLOS(CF03MathisTowerTopOverrideMarker) && (playerRef.GetDistance(mathisRef) > 8))
     mathisRef.MoveTo(CF03MathisTowerTopOverrideMarker)
EndIf

;Stop Mathis Follow
SQ_Followers.SetRoleInactive(Alias_CF03_Mathis.GetActorRef())
mathisRef.StopCombat()
mathisRef.EvaluatePackage()

;Stop combat in the fissure area.
LC030.TryToStopCombatInFissure()
mathisRef.StopCombat()
mathisRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
Alias_CF03_Mathis.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(170)

Alias_CF03_Mathis.GetActorRef().EvaluatePackage()
;Begin Mathis follow
SQ_Followers.SetRoleActive(Alias_CF03_Mathis.GetActorRef())
SQ_Followers.CommandFollow(Alias_CF03_Mathis.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0171_Item_00
Function Fragment_Stage_0171_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(171)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0172_Item_00
Function Fragment_Stage_0172_Item_00()
;BEGIN CODE
CF03_Stage999_Mathis_OptionalCacheScene.Start()
SetObjectiveCompleted(171)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170)
if GetStageDone(176) == 0
SetObjectiveDisplayed(175)
endif

if GetStageDone(176) == 1
if GetStageDone(177) == 0
SetObjectiveDisplayed(176)
elseif GetStageDone(177) == 1
SetStage(180)
endif
endif

CF03_Stage180_Mathis_TowerCellCallout.Start()

if IsObjectiveDisplayed(150) == 1
SetObjectiveDisplayed(150,0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0176_Item_00
Function Fragment_Stage_0176_Item_00()
;BEGIN CODE
;Kryx Cell Was Located Already
if GetStageDone(175) == 1
SetObjectiveCompleted(175)
if GetStageDone(177) == 0
SetObjectiveDisplayed(176)
elseif GetStageDone(177) == 1
SetStage(180)
endif
endif

;If Mathis isn't following
if GetStageDone(170) == 0
SQ_Followers.SetRoleActive(Alias_CF03_Mathis.GetActorRef())
SQ_Followers.CommandFollow(Alias_CF03_Mathis.GetActorRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0177_Item_00
Function Fragment_Stage_0177_Item_00()
;BEGIN CODE
;Set by LC030, stage 423, after it unlocks the doors.
SetStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN AUTOCAST TYPE cf03questscript
Quest __temp = self as Quest
cf03questscript kmyQuest = __temp as cf03questscript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(170) == 1
SetObjectiveDisplayed(170,0)
EndIf
If IsObjectiveDisplayed(175) == 1
SetObjectiveCompleted(175)
EndIf
If IsObjectiveDisplayed(176) == 1
SetObjectiveCompleted(176)
EndIf
SetObjectiveDisplayed(180)

;Engage Timer for Quest Target Shift
kmyQuest.WaitQT()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0181_Item_00
Function Fragment_Stage_0181_Item_00()
;BEGIN CODE
;After timer is done - Move the QT by conditions
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0182_Item_00
Function Fragment_Stage_0182_Item_00()
;BEGIN CODE
CF03_Stage175_Mathis_CellCallout.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0183_Item_00
Function Fragment_Stage_0183_Item_00()
;BEGIN CODE
;Do the lamp enable/disable here - reveals the Dataslate
ObjectReference kryxSlateRef = Alias_CF03_KryxSlate.GetRef()
kryxSlateRef.Enable()
WwiseEvent_QST_CF03_PryOpenLamp.Play(kryxSlateRef)
Alias_CF03_DeskLamp.GetRef().Disable()
Alias_CF03_DeskLampDummy.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0185_Item_00
Function Fragment_Stage_0185_Item_00()
;BEGIN CODE
SetObjectiveCompleted(180)
SetObjectiveDisplayed(185)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveCompleted(185)
SetObjectiveDisplayed(190)

;Give the player Carter's locker code.
Game.GetPlayer().AddItem(LC030_LockerCode)
CF03_Stage191_Mathis_AfterLogCallout.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
SetObjectiveCompleted(190)
SetObjectiveDisplayed(195)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(195)
SetObjectiveDisplayed(200)

;Give the player the ventilation room terminal password.
Game.GetPlayer().AddItem(LC030_VentilationRoomPassword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Objective here points to Load Door to outside when inside Lock01
SetObjectiveCompleted(200)
SetObjectiveDisplayed(210)

;Enable Delgado in Shuttle Area
Alias_CF03_Delgado.GetActorRef().Enable()
Alias_CF03_Delgado.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0211_Item_00
Function Fragment_Stage_0211_Item_00()
;BEGIN CODE
;Set by: Trigger in Armory.

Actor playerRef = Game.GetPlayer()
Actor mathisRef = Alias_CF03_Mathis.GetActorRef()

;Catch Mathis up, if necessary.
if (!GetStageDone(212) && !playerRef.HasDetectionLOS(mathisRef) && (playerRef.GetDistance(mathisRef) > 8))
     if (!playerRef.HasDetectionLOS(CF03MathisCatchupArmoryMarker01))
          mathisRef.MoveTo(CF03MathisCatchupArmoryMarker01)
     ElseIf (!playerRef.HasDetectionLOS(CF03MathisCatchupArmoryMarker02))
          mathisRef.MoveTo(CF03MathisCatchupArmoryMarker02)
     EndIf
     mathisRef.StopCombat()
     mathisRef.EvaluatePackage()
EndIf

;Start the Armory scene.
if (!GetStageDone(214))
     CF03_Stage211_Mathis_ArmoryScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0212_Item_00
Function Fragment_Stage_0212_Item_00()
;BEGIN CODE
;Set by: Trigger in Armory.
;Just advances Mathis' scene.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0213_Item_00
Function Fragment_Stage_0213_Item_00()
;BEGIN CODE
;Set by: CF03_Stage211_Mathis_ArmoryScene, in scene, or on end.

;Clean out the weapon case.
ObjectReference weaponCaseRef = Alias_CF03_ArmoryWeaponCase.GetRef()
weaponCaseRef.Unlock()
weaponCaseRef.RemoveAllItems()
weaponCaseRef.BlockActivation(False, False)
Alias_CF03_ArmoryWeaponCaseCollision.GetRef().DisableNoWait()

;Equip Mathis with the MagStorm.
Actor mathisRef = Alias_CF03_Mathis.GetActorRef()
mathisRef.AddItem(CF03_LLI_MathisMagStorm)
mathisRef.AddItem(CF03_LLI_MathisMagStormAmmo)
mathisRef.EquipItem(MagStorm, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0214_Item_00
Function Fragment_Stage_0214_Item_00()
;BEGIN CODE
;Set by: Armory exit door ref script.

;Stop the Armory Scene if it was still running.
CF03_Stage211_Mathis_ArmoryScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
;Catch Mathis up if needed.
Actor playerRef = Game.GetPlayer()
Actor mathisRef = Alias_CF03_Mathis.GetActorRef()
if (!playerRef.HasDetectionLOS(mathisRef) && !playerRef.HasDetectionLOS(CF03MathisCatchupBarracksMarker) && (playerRef.GetDistance(mathisRef) > 8))
     mathisRef.MoveTo(CF03MathisCatchupBarracksMarker)
EndIf

;Start the rush.
LC030.SetStage(520)

;Play Mathis' scene.
CF03_Stage215_Mathis_BarracksCreatureRush.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0218_Item_00
Function Fragment_Stage_0218_Item_00()
;BEGIN CODE
if (!GetStageDone(219))
     CF03_Stage219_Delgado_WardenPACallout.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0219_Item_00
Function Fragment_Stage_0219_Item_00()
;BEGIN CODE
CF03_Stage219_Delgado_WardenPACallout.Stop()
CF03_Stage220_Mathis_WardenOfficeCallout.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(210)
SetObjectiveDisplayed(220)

;Kill Mathis Combat Alarms
Alias_CF03_Mathis.GetActorRef().StopCombat()
Alias_CF03_Mathis.GetActorRef().StopCombatAlarm()

;Make sure Mathis is in the Warden's Office with the player.
Actor mathisRef = Alias_CF03_Mathis.GetActorRef()
if (mathisRef.GetParentCell() == LC030Lock01)
     mathisRef.MoveTo(CF03MathisStartAtWarden)
EndIf

;End Mathis follow
SQ_Followers.SetRoleInactive(Alias_CF03_Mathis.GetActorRef())
Alias_CF03_Mathis.GetActorRef().EvaluatePackage()

;Play Mathis's Callout
Utility.Wait(3)
If GetStageDone(219) == 0
CF03_Stage220_Mathis_WardenOfficeCallout.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0222_Item_00
Function Fragment_Stage_0222_Item_00()
;BEGIN CODE
;If the Player does this, they are "cutting off" Mathis from being the Elite Crew
;This is handled in CF08_Fleet, Stage 1000
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0223_Item_00
Function Fragment_Stage_0223_Item_00()
;BEGIN CODE
;If the Player does this, Mathis will become an EC eventually
;This is handled in CF08_Fleet, Stage 1000
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
;Kicks Delgado into his final Lock Package
Alias_CF03_Delgado.GetActorRef().EvaluatePackage()
Alias_CF03_Mathis.GetActorRef().EvaluatePackage()

;Speak to Mathis
SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
;When Delgado exits Transfer Area - Disable and Move him to The Lock
Alias_CF03_Delgado.GetActorRef().Disable()
Alias_CF03_Delgado.GetActorRef().MoveTo(CF03DelgadoWrapUpMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
SetObjectiveCompleted(220)
SetObjectiveDisplayed(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_01
Function Fragment_Stage_0240_Item_01()
;BEGIN CODE
SetObjectiveCompleted(220)
SetObjectiveDisplayed(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(240)
SetObjectiveDisplayed(250)

;Begin Mathis follow
SQ_Followers.SetRoleActive(Alias_CF03_Mathis.GetActorRef())
SQ_Followers.CommandFollow(Alias_CF03_Mathis.GetActorRef())

;Open the Security Door out to the shuttle bay.
LC030.SetStage(630)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Set by: Trigger, Shuttle Bay Catwalk,
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
;Trigger the Shuttle Bay Ambush
LC030.SetStage(640)

Utility.Wait(1)
SetObjectiveCompleted(250)
SetObjectiveDisplayed(260)

;Emergency Override in Case Delgado Doesn't Complete Package
if GetStageDone(235) == 0
Alias_CF03_Delgado.GetActorRef().Disable()
Alias_CF03_Delgado.GetActorRef().MoveTo(CF03DelgadoWrapUpMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
;Open the Shuttle Bay doors
CF03_Stage270_ShuttleAnnounceScene.Start()
LC030.SetStage(631)

;For quickstarts, make sure BE_CF03_Shuttle is running
;before trying to open the landing bay doors.
int i = 0
int failsafe = 50
While ((i < failsafe) && (!BE_CF03_Shuttle.IsRunning()))
     Debug.Trace("Waiting")
     Utility.Wait(0.1)
     i = i + 1
EndWhile
BE_CF03_Shuttle.SetEnemyShipLandingRampsOpenState(True)
Alias_CF03_Shuttle.GetShipRef().RemoveKeyword(SpaceshipPreventRampOpenOnLanding)

SetObjectiveCompleted(260)
SetStage(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)
SetObjectiveDisplayed(310)

;Do All The Key Setup
Alias_CF03_Delgado.GetActorRef().Enable()
Alias_CF03_Delgado.GetActorRef().MoveTo(CF03DelgadoWrapUpMarker)
Alias_CF03_Delgado.GetActorRef().EvaluatePackage()
Alias_CF03_Naeva.GetActorRef().Enable()
Alias_CF03_Naeva.GetActorRef().MoveTo(CF03NaevaWrapUpMarker)
Alias_CF03_Naeva.GetActorRef().EvaluatePackage()

;DEBUG ONLY (UNCOMMENT FOR TESTING)
;Alias_CF03_Mathis.GetActorRef().MoveTo(CF03MathisWrapUpMarker)
;Alias_CF03_Mathis.GetActorRef().EvaluatePackage()
;End Mathis follow
;SQ_Followers.SetRoleInActive(Alias_CF03_Mathis.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
SetObjectiveCompleted(310)
SetObjectiveDisplayed(315)

;If the cache was never found, kill the objective
If IsObjectiveDisplayed(171) == 1
SetObjectiveDisplayed(171,0)
EndIf

;Give Mathis his helmet back.
Actor mathisRef = Alias_CF03_Mathis.GetActorRef()
if (mathisRef.GetItemCount(Spacesuit_CrimsonFleet_Assault_Helmet_NOTPLAYABLE) == 0)
     mathisRef.AddItem(Spacesuit_CrimsonFleet_Assault_Helmet_NOTPLAYABLE)
     mathisRef.SetOutfit(Outfit_Spacesuit_Elite_CF03_MathisCastillo, True)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveCompleted(315)
SetObjectiveDisplayed(320)

;Stop Mathis Follow and have him move to his final location
SQ_Followers.SetRoleInActive(Alias_CF03_Mathis.GetActorRef())
Alias_CF03_Mathis.GetActorRef().EvaluatePackage()

;Delete the shuttle. Swap back to the player's ship if needed. 
LC030.SwapOutShuttle()

;LC030 cleans up The Lock and shuts down at this point.
LC030.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CF03_KryxSlate.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0335_Item_00
Function Fragment_Stage_0335_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Weapon_Reward_CF03_Kryx)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
SetObjectiveCompleted(320)
SetObjectiveDisplayed(340)

;Get Naeva Moving to Last Nova and Del back to Sandbox
Alias_CF03_Delgado.GetActorRef().EvaluatePackage()
Alias_CF03_Naeva.GetActorRef().EvaluatePackage()
Alias_CF03_Mathis.GetRef().MoveTo(CF03MathisWrapUpMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
;Global Set for Ending
CrimsonFleetCaptainState_Mathis.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0364_Item_00
Function Fragment_Stage_0364_Item_00()
;BEGIN CODE
SetObjectiveCompleted(340)
If GetStageDone(365) == 1
SetStage(370)
ElseIf GetStageDone(365) == 0
SetObjectiveDisplayed(365)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0365_Item_00
Function Fragment_Stage_0365_Item_00()
;BEGIN CODE
If GetStageDone(364) == 0
;Do Nothing
ElseIf GetStageDone(364) == 1
SetStage(370)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(365) == 1
SetObjectiveCompleted(365)
EndIf
SetObjectiveDisplayed(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
if CF_SysDefShutdown.GetValue() == 0
SetObjectiveCompleted(370)
SetObjectiveDisplayed(410)

;Do All The Vigilance Setup
Alias_CF03_Kibwe.GetActorRef().Enable()
Alias_CF03_Kibwe.GetActorRef().MoveTo(CF03KibweWrapUpMarker)
Alias_CF03_Kibwe.GetActorRef().EvaluatePackage()
Alias_CF03_Toft.GetActorRef().Enable()
Alias_CF03_Toft.GetActorRef().MoveTo(CF03ToftWrapUpMarker)
Alias_CF03_Toft.GetActorRef().EvaluatePackage()
elseif CF_SysDefShutdown.GetValue() == 1
SetObjectiveCompleted(370)
SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
SetObjectiveCompleted(410)
SetObjectiveDisplayed(420)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Remove the force-equipped MagStorm on Mathis.
Alias_CF03_Mathis.GetActorRef().UnequipItem(MagStorm)

;Give Mathis his helmet back.
Actor mathisRef = Alias_CF03_Mathis.GetActorRef()
if (mathisRef.GetItemCount(Spacesuit_CrimsonFleet_Assault_Helmet_NOTPLAYABLE) == 0)
     mathisRef.AddItem(Spacesuit_CrimsonFleet_Assault_Helmet_NOTPLAYABLE)
     mathisRef.SetOutfit(Outfit_Spacesuit_Elite_CF03_MathisCastillo, True)
EndIf

if IsObjectiveDisplayed(420) == 1
SetObjectiveCompleted(420)
endif
;The Vigilance moves at the next opportunity.
LC082.UpdateVigilanceLocation("CF04")
CF04.SetStage(15)

;Reactive SE Timer
if GetStageDone(360)
    float currentGameTime = Utility.GetCurrentGameTime()
    SE_Player_FAB20_Timestamp.SetValue(currentGameTime + cooldownDays)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CF04 Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory

Scene Property CF03_Stage140_Mathis_TowerCallout Auto Const Mandatory

Scene Property CF03_Stage060_Delgado_AttackScene Auto Const Mandatory

Scene Property CF03_Stage135_Mathis_TowerCallout Auto Const Mandatory

Scene Property CF03_Stage180_Mathis_CellCallout Auto Const Mandatory

Scene Property CF03_Stage175_Mathis_CellCallout Auto Const Mandatory

ReferenceAlias Property Alias_CF03_Delgado Auto Const Mandatory

ReferenceAlias Property Alias_CF03_Mathis Auto Const Mandatory

ObjectReference Property CF03DelgadoShuttleOverlookMarker Auto Const Mandatory

ObjectReference Property CF03DelgadoWrapUpMarker Auto Const Mandatory

ObjectReference Property CF03NaevaWrapUpMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF03_Naeva Auto Const Mandatory

ReferenceAlias Property Alias_CF03_Toft Auto Const Mandatory

ReferenceAlias Property Alias_CF03_Kibwe Auto Const Mandatory

ObjectReference Property CF03ToftWrapUpMarker Auto Const Mandatory

ObjectReference Property CF03KibweWrapUpMarker Auto Const Mandatory

ObjectReference Property CF03DelgadoStartMarker Auto Const Mandatory

ObjectReference Property CF03MathisStartMarker Auto Const Mandatory

ObjectReference Property CF03MathisOuterDoorMarker01 Auto Const Mandatory

ObjectReference Property CF03DelgadoOuterDoorMarker01 Auto Const Mandatory

ObjectReference Property LC030TheLockDoorMainEntranceRef Auto Const Mandatory

ObjectReference Property CF03TempCollapseBlockerRef Auto Const Mandatory

ObjectReference Property CF03MathisTransferAreaMarker Auto Const Mandatory

ObjectReference Property CF03DelgadoTransferAreaMarker Auto Const Mandatory

Scene Property CF03_Stage180_Mathis_TowerCellCallout Auto Const Mandatory

ObjectReference Property CF03MathisWrapUpMarker Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property CrimsonFleetFaction Auto Const Mandatory

Faction Property UCSysDefFaction Auto Const Mandatory

LC030_QuestScript Property LC030 Auto Const Mandatory

Scene Property CF03_Stage100_Delgado_PACallout Auto Const Mandatory

GlobalVariable Property CF_SysDefShutdown Auto Const Mandatory

ObjectReference Property CF03ControlRoomExitDoorRef Auto Const Mandatory

Scene Property CF03_Stage145_Mathis_TowerScenePreCallout Auto Const Mandatory

Scene Property CF03_Stage220_Mathis_WardenOfficeCallout Auto Const Mandatory

ObjectReference Property CF03DelgadoTransferAreaPAMarker Auto Const Mandatory

ObjectReference Property CF03MathisInsideLockEntranceMarkerRef Auto Const Mandatory

ObjectReference Property CF03DelgadoInsideLockEntranceMarkerRef Auto Const Mandatory

LC082_VigilanceQuestScript Property LC082 Auto Const Mandatory

Key Property LC030_VentilationRoomPassword Auto Const Mandatory

Key Property LC030_LockerPasscode Auto Const Mandatory

Key Property LC030_LockerCode Auto Const Mandatory

Cell Property LC030Lock01 Auto Const Mandatory

SQ_FollowersScript Property SQ_Followers Mandatory Const Auto

ObjectReference Property CF03MathisTowerOverrideMarker Auto Const Mandatory

Scene Property CF03_Stage219_Delgado_WardenPACallout Auto Const Mandatory

Quest Property CFKey Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory

Scene Property CF03_Stage105_Mathis_WallPanelFallsCallout Auto Const Mandatory

ReferenceAlias Property Alias_CF03_GenericAlly01 Auto Const Mandatory

ReferenceAlias Property Alias_CF03_GenericAlly02 Auto Const Mandatory

ObjectReference Property CF03PlayerStartMarker Auto Const Mandatory

ObjectReference Property CF03PlayerOuterDoorMarker Auto Const Mandatory

ObjectReference Property CF03PlayerInsideLockMarkerRef Auto Const Mandatory

ObjectReference Property CF03PlayerStartInLock Auto Const Mandatory

ObjectReference Property CF03PlayerStartAtArmory Auto Const Mandatory

ObjectReference Property CF03MathisStartAtArmory Auto Const Mandatory

ObjectReference Property CF03MathisCatchupArmoryMarker01 Auto Const Mandatory

ObjectReference Property CF03MathisCatchupArmoryMarker02 Auto Const Mandatory

Scene Property CF03_Stage211_Mathis_ArmoryScene Auto Const Mandatory

ReferenceAlias Property Alias_CF03_ArmoryWeaponCase Auto Const

LeveledItem Property CF03_LLI_MathisMagStorm Auto Const Mandatory

LeveledItem Property CF03_LLI_MathisMagStormAmmo Auto Const Mandatory

ObjectReference Property CF03PlayerStartAtIntake Auto Const

ObjectReference Property CF03MathisStartAtIntake Auto Const

ObjectReference Property CF03MathisCatchupIntakeMarker Auto Const Mandatory

ObjectReference Property CF03PlayerStartAtBarracks Auto Const Mandatory

ObjectReference Property CF03MathisStartAtBarracks Auto Const Mandatory

ObjectReference Property CF03MathisCatchupBarracksMarker Auto Const Mandatory

Scene Property CF03_Stage215_Mathis_BarracksCreatureRush Auto Const Mandatory

ObjectReference Property CF03PlayerStartAtWarden Auto Const Mandatory

ObjectReference Property CF03MathisStartAtWarden Auto Const Mandatory

Weapon Property MagStorm Auto Const Mandatory

ObjectReference Property CF03PlayerShuttleStart Auto Const Mandatory

ObjectReference Property CF03MathisShuttleStart Auto Const Mandatory

Scene Property CF03_Stage085_Mathis_PostCollapseScene Auto Const Mandatory

Scene Property CF03_Stage050_StairsScene Auto Const Mandatory

ReferenceAlias Property Alias_CF03_Shuttle Auto Const Mandatory

ReferenceAlias Property Alias_CF03_TADelgadoIntercom Auto Const Mandatory

Scene Property CF03_Stage270_ShuttleAnnounceScene Auto Const Mandatory

ReferenceAlias Property Alias_CF03_DeskLamp Auto Const Mandatory

ReferenceAlias Property Alias_CF03_DeskLampDummy Auto Const Mandatory

ObjectReference Property CF03_PlayerStartKryxCell Auto Const Mandatory

ObjectReference Property CF03_MathisStartKryxCell Auto Const Mandatory

Scene Property CF03_Stage999_Mathis_OptionalCacheScene Auto Const Mandatory

Scene Property CF03_Stage191_Mathis_AfterLogCallout Auto Const Mandatory

GlobalVariable Property CF03ActorsUseGroupTravelGlobal Auto Const Mandatory

Scene Property CF03_Stage130_EndLockdown Auto Const Mandatory

ReferenceAlias Property Alias_CF03_IDReader Auto Const Mandatory

ReferenceAlias Property Alias_CF03_MapMarkerRef Auto Const Mandatory

Scene Property CF03_Stage040_Delgado_LockExtOutroScene Auto Const Mandatory

Scene Property CF03_Stage080_Mathis_CollapseScene Auto Const Mandatory

ReferenceAlias Property Alias_CF03_KryxSlate Auto Const Mandatory

ReferenceAlias Property Alias_CF03_ExteriorDoor Auto Const Mandatory

WwiseEvent Property QST_CF03_Stage1_DoorUnlock Auto Const Mandatory

WwiseEvent Property QST_CF03_Stage3_Ambush Auto Const Mandatory

GlobalVariable Property CrimsonFleetCaptainState_Mathis Auto Const Mandatory

RefCollectionAlias Property Alias_CF03_TAAmbushSFXMarkerRefCol Auto Const Mandatory

ObjectReference Property CF03_WardenExitDoorRef Auto Const Mandatory

BEScript Property BE_CF03_Shuttle Auto Const Mandatory

LeveledItem Property LL_Weapon_Reward_CF03_Kryx Auto Const Mandatory

ReferenceAlias Property Alias_CF03_ArmoryWeaponCaseCollision Auto Const Mandatory

Location Property LC030LockLocation Auto Const Mandatory

Keyword Property SpaceshipPreventRampOpenOnLanding Auto Const Mandatory

ObjectReference Property CF03MathisTowerTopOverrideMarker Auto Const Mandatory

GlobalVariable Property SE_Player_FAB20_Timestamp Auto Const Mandatory

Float Property cooldownDays Auto Const Mandatory

Armor Property Spacesuit_CrimsonFleet_Assault_Helmet_NOTPLAYABLE Auto Const Mandatory

Outfit Property Outfit_Spacesuit_Elite_CF03_MathisCastillo Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_CF03_PryOpenLamp Auto Const Mandatory

Float Property waitTime Auto Const Mandatory
