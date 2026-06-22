;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI06_001A9560 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(20)
RI05.SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(100)

Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(100)
SetStage(120)
SetStage(200)

Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef())
Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef())
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     Alias_Camden.GetRef().MoveTo(Alias_CamdenIntroSceneMarker.GetRef())
EndIf

; Make sure Veena's office door is open so the player can
; hear the scene.
Alias_VeenaOfficeDoor.GetRef().SetOpen()
Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(300)
Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(400)
Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(100)
SetStage(120)
SetStage(130)
SetStage(200)
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     SetStage(410)
EndIf
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(100)
SetStage(120)
SetStage(130)
SetStage(200)
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     SetStage(410)
EndIf
SetStage(500)
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(120)
SetStage(130)
SetStage(200)
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     SetStage(410)
EndIf
SetStage(500)
SetStage(600)
SetStage(700)
SetStage(750)

Game.GetPlayer().MoveTo(Alias_CMOutpostTerminalQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(120)
SetStage(130)
SetStage(200)
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     SetStage(410)
EndIf
SetStage(500)
SetStage(600)
SetStage(700)
SetStage(750)
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(100)
SetStage(120)
SetStage(130)
SetStage(200)
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     SetStage(410)
EndIf
SetStage(500)
SetStage(600)
SetStage(610)
SetStage(700)
SetStage(710)
SetStage(750)
SetStage(751)
SetStage(755)
SetStage(760)
SetStage(850)
SetStage(860)
SetStage(900)

;Game.GetPlayer().AddToFaction(Ri06_SecureWingFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(100)
SetStage(120)
SetStage(130)
SetStage(200)
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     SetStage(410)
EndIf
SetStage(500)
SetStage(600)
SetStage(610)
SetStage(700)
SetStage(710)
SetStage(750)
SetStage(751)
SetStage(755)
SetStage(760)
SetStage(850)
SetStage(860)
SetStage(900)
SetStage(1000)

;Game.GetPlayer().AddToFaction(Ri06_SecureWingFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(100)
SetStage(120)
SetStage(130)
SetStage(200)
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     SetStage(410)
EndIf
SetStage(500)
SetStage(600)
SetStage(610)
SetStage(700)
SetStage(710)
SetStage(750)
SetStage(751)
SetStage(755)
SetStage(760)
SetStage(850)
SetStage(860)
SetStage(900)
SetStage(1000)
SetStage(1100)

;Game.GetPlayer().AddToFaction(Ri06_SecureWingFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(100)
SetStage(120)
SetStage(130)
SetStage(200)
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     SetStage(410)
EndIf
SetStage(500)
SetStage(600)
SetStage(610)
SetStage(700)
SetStage(710)
SetStage(750)
SetStage(751)
SetStage(755)
SetStage(760)
SetStage(850)
SetStage(860)
SetStage(900)
SetStage(1000)
SetStage(1100)
SetStage(1200)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_AriQS.GetRef())
;Game.GetPlayer().AddToFaction(Ri06_SecureWingFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(100)
SetStage(120)
SetStage(130)
SetStage(200)
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     SetStage(410)
EndIf
SetStage(500)
SetStage(600)
SetStage(610)
SetStage(700)
SetStage(710)
SetStage(750)
SetStage(751)
SetStage(755)
SetStage(760)
SetStage(850)
SetStage(860)
SetStage(900)
SetStage(1000)
SetStage(1100)
SetStage(1200)
SetStage(1300)
SetStage(1305)

Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_AriQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(1400)
Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef())
Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef())
Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(1600)
Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef())
Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef())
Game.GetPlayer().MoveTo(Alias_RI06StartMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
SetStage(20)
SetStage(100)
SetStage(120)
SetStage(130)
SetStage(200)
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     SetStage(410)
EndIf
SetStage(500)
SetStage(600)
SetStage(610)
SetStage(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
RI_Support.SetStage(3)
Alias_RothiciteShipment.GetRef().SetActorRefOwner(Alias_DrLane.GetActorRef())

Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddItem(Credits, 10000)
PlayerRef.AddItem(Drug_Aurora, 5)

Alias_Yuko.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)
Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef())
Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef())
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     Alias_Camden.GetRef().MoveTo(Alias_CamdenIntroSceneMarker.GetRef())
Else
     Alias_Camden.GetRef().Disable()
EndIf

; Make sure Veena's office door is open so the player can
; hear the scene.
Alias_VeenaOfficeDoor.GetRef().SetOpen()
;Alias_RothiciteShipment.GetRef().SetActorRefOwner(Alias_DrLane.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
RI06_0100_Masako_TriggeredScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_Masako.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Alias_Masako.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_CMOutpostKeyCamden.GetRef())
SetStage(820)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
If RI04_Track_PlayerStoleCamdenChoInfo.GetValue() == 0
     SetStage(410)
EndIF

If IsObjectiveDisplayed(400)
     SetObjectiveCompleted(400)
EndIf
If IsObjectiveDisplayed(100)
     SetObjectiveCompleted(100)
EndIf
If IsObjectiveDisplayed(200)
     SetObjectiveCompleted(200)
EndIf
SetObjectiveDisplayed(500)


Alias_CMOutpostMapMarker.GetRef().SetMarkerVisibleOnStarMap()
Alias_CMOutpostMapMarker.GetRef().AddToMapScanned(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveCompleted(600)

SetStage(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)

If GetStageDone(755)
     SetStage(900)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0751_Item_00
Function Fragment_Stage_0751_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(751)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0755_Item_00
Function Fragment_Stage_0755_Item_00()
;BEGIN CODE
SetStage(900)
SetStage(760)
SetObjectiveCompleted(751)
SetObjectiveCompleted(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN CODE
SetObjectiveCompleted(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0805_Item_00
Function Fragment_Stage_0805_Item_00()
;BEGIN CODE
Alias_CMOutpostTowerNPCsEnableMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(800)
     SetObjectiveCompleted(800)
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(800)
     SetObjectiveCompleted(800)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
SetObjectiveCompleted(850)
SetStage(700)
SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(900)

Alias_TheClinicMapMarker.GetRef().SetMarkerVisibleOnStarMap()
Alias_TheClinicMapMarker.GetRef().AddToMapScanned(True)
Alias_SecureWingDoor.GetRef().SetLockLevel(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction)

SetObjectiveCompleted(1600)

If RI05_Track_BayuDispleased.GetValue() == 0
     RI07.SetStage(100)
     RIR06_RadiantCount.SetValue(1) ; Set value to 1 if skipped here.
EndIf

Game.GetPlayer().SetValue(RI06_Foreknowledge_LucasDrexlerEvilAV, 1)

; Unlock Rothicite so it can now be seen in vendors.
RI_UnlockRothicite.SetValue(1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(900)
     SetObjectiveCompleted(900)
EndIf
If IsObjectiveDisplayed(1000)
     SetObjectiveCompleted(1000)
EndIf
If IsObjectiveDisplayed(1100)
     SetObjectiveCompleted(1100)
EndIf
SetObjectiveCompleted(1100)
SetObjectiveDisplayedAtTop(1200)
SetStage(1250)
Alias_SecureWingDoor.GetRef().SetLockLevel(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1210_Item_00
Function Fragment_Stage_1210_Item_00()
;BEGIN CODE
RI06_1200_Guard_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1220_Item_00
Function Fragment_Stage_1220_Item_00()
;BEGIN CODE
RI06_1220_SecureWing_TriggeredScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1221_Item_00
Function Fragment_Stage_1221_Item_00()
;BEGIN CODE
Alias_Sean.GetActorRef().EvaluatePackage()
Alias_DrLane.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1225_Item_00
Function Fragment_Stage_1225_Item_00()
;BEGIN CODE
Alias_Sean.GetActorRef().EvaluatePackage()
Alias_DrLane.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1230_Item_00
Function Fragment_Stage_1230_Item_00()
;BEGIN AUTOCAST TYPE ri06_questscript
Quest __temp = self as Quest
ri06_questscript kmyQuest = __temp as ri06_questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1200)

If GetStageDone(1280)
     SetStage(1400)
EndIf

kmyQuest.CheckForAccess(Alias_RothiciteShipment.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1235_Item_00
Function Fragment_Stage_1235_Item_00()
;BEGIN CODE
ObjectReference TerminalRef = Alias_DrLaneTerminal.GetRef()
TerminalRef.SetFactionOwner(PlayerFaction)
TerminalRef.Lock(False)
Alias_RothiciteShipment.GetRef().SetFactionOwner(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1236_Item_00
Function Fragment_Stage_1236_Item_00()
;BEGIN CODE
Alias_SecureWingDoor.GetRef().SetFactionOwner(PlayerFaction)

; Enable interior guard and disable exterior
Actor SecureWingGuardRef = Alias_Guard_SecureWing.GetActorRef()

If SecureWingGuardRef.IsDisabled()
     Alias_Guard.GetRef().Disable()
     SecureWingGuardRef.Enable()
     SecureWingGuardRef.EvaluatePackage()
EndIf

; Make sure player is not in the same faction as the other NPCs
Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction)

; Make the player an enemy and trespasser
RI06_SecureWingFaction.SetEnemy(PlayerFaction)
StationTheClinicSecureWing01.SetPublic(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1240_Item_00
Function Fragment_Stage_1240_Item_00()
;BEGIN CODE
RI06_1220_SecureWing_TriggeredScene.Stop()
Alias_Sean.GetActorRef().EvaluatePackage()
Alias_DrLane.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1245_Item_00
Function Fragment_Stage_1245_Item_00()
;BEGIN CODE
Alias_Sean.GetActorRef().EvaluatePackage()
Game.GetPlayer().StopCombatAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(1250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1257_Item_00
Function Fragment_Stage_1257_Item_00()
;BEGIN AUTOCAST TYPE ri06_questscript
Quest __temp = self as Quest
ri06_questscript kmyQuest = __temp as ri06_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SeanStartTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1258_Item_00
Function Fragment_Stage_1258_Item_00()
;BEGIN CODE
RI06_1258_Sean_CallSecurityScene.Start()
SetStage(1236)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1259_Item_00
Function Fragment_Stage_1259_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1259)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1260_Item_00
Function Fragment_Stage_1260_Item_00()
;BEGIN CODE
SetStage(1280)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1261_Item_00
Function Fragment_Stage_1261_Item_00()
;BEGIN AUTOCAST TYPE ri06_questscript
Quest __temp = self as Quest
ri06_questscript kmyQuest = __temp as ri06_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckForAccess(Alias_DrLaneTerminal.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1270_Item_00
Function Fragment_Stage_1270_Item_00()
;BEGIN CODE
SetStage(1235)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1271_Item_00
Function Fragment_Stage_1271_Item_00()
;BEGIN CODE
ObjectReference TerminalRef = Alias_DrLaneTerminal.GetRef()
TerminalRef.SetFactionOwner(PlayerFaction)
TerminalRef.Lock(False)
Alias_DrLane.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(1259)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1272_Item_00
Function Fragment_Stage_1272_Item_00()
;BEGIN AUTOCAST TYPE ri06_questscript
Quest __temp = self as Quest
ri06_questscript kmyQuest = __temp as ri06_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DrLaneStartTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1273_Item_00
Function Fragment_Stage_1273_Item_00()
;BEGIN CODE
RI06_1258_DrLane_CallSecurityScene.Start()
SetStage(1236)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1275_Item_00
Function Fragment_Stage_1275_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1259)
     SetObjectiveCompleted(1259)
EndIf
SetStage(1235)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1276_Item_00
Function Fragment_Stage_1276_Item_00()
;BEGIN CODE
Alias_DrLane.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1280_Item_00
Function Fragment_Stage_1280_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1250)

If GetStageDone(1230)
     SetStage(1400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1282_Item_00
Function Fragment_Stage_1282_Item_00()
;BEGIN CODE
SetStage(1235)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1283_Item_00
Function Fragment_Stage_1283_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, RI06_Extort.GetValueInt())
SetStage(1235)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1290_Item_00
Function Fragment_Stage_1290_Item_00()
;BEGIN CODE
RI06_SeanDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1295_Item_00
Function Fragment_Stage_1295_Item_00()
;BEGIN CODE
RI06_KendrickDead.SetValue(1)
If IsObjectiveDisplayed(1259)
     SetObjectiveDisplayed(1259, False, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1305_Item_00
Function Fragment_Stage_1305_Item_00()
;BEGIN CODE
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
SetStage(1394) ; Player found a way inside the secure wing
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1330_Item_00
Function Fragment_Stage_1330_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, RI06_Bribe.GetValueInt())
SetStage(1394) ; Player found a way inside the secure wing
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1340_Item_00
Function Fragment_Stage_1340_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Drug_Aurora, 1)
SetStage(1390)
SetStage(1394) ; Player found a way inside the secure wing
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1370_Item_00
Function Fragment_Stage_1370_Item_00()
;BEGIN CODE
Actor DrOsianRef = Alias_DrOsian.GetActorRef()

DrOsianRef.MoveTo(Alias_DrOsianSceneFurniture.GetRef())
DrOsianRef.EvaluatePackage()

Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1375_Item_00
Function Fragment_Stage_1375_Item_00()
;BEGIN CODE
RI06_1375_Guard_DrOsianScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1376_Item_00
Function Fragment_Stage_1376_Item_00()
;BEGIN CODE
Alias_DrOsian.GetActorRef().EvaluatePackage()
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1385_Item_00
Function Fragment_Stage_1385_Item_00()
;BEGIN CODE
SetStage(1390)
SetStage(1394) ; Player found a way inside the secure wing
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1390_Item_00
Function Fragment_Stage_1390_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_SecureWingAccessKey.GetRef())
If IsObjectiveDisplayed(1300)
     SetObjectiveCompleted(1300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1394_Item_00
Function Fragment_Stage_1394_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1300)
     SetObjectiveCompleted(1300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1395_Item_00
Function Fragment_Stage_1395_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1300)
     SetObjectiveCompleted(1300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(1300)
     SetObjectiveCompleted(1300)
EndIf

SetObjectiveCompleted(1200)
SetObjectiveDisplayed(1400)

If IsObjectiveDisplayed(1259)
     SetObjectiveDisplayed(1259, False, False)
EndIf


Alias_Masako.GetRef().MoveTo(Alias_MasakoIntroSceneMarker.GetRef())
Alias_Veena.GetRef().MoveTo(Alias_VeenaIntroSceneMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1400)
SetObjectiveDisplayed(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.RemoveItem(Alias_RothiciteShipmentPost.GetRef())
PlayerRef.RemoveItem(Alias_RothiciteShipment.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1500)
SetObjectiveDisplayed(1600)

If RI05_Track_BayuDispleased.GetValue() == 1 || RI05_Track_BayuDispleased.GetValue() == -1
     RIR06_QuestStartKeyword.SendStoryEvent()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1610_Item_00
Function Fragment_Stage_1610_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RI05_KumihoSlate, 99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1620_Item_00
Function Fragment_Stage_1620_Item_00()
;BEGIN CODE
RI06_Track_PlayerWitholdsClinicNames.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RI06StartMarker Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

ReferenceAlias Property Alias_Veena Auto Const Mandatory

ReferenceAlias Property Alias_Camden Auto Const Mandatory

ReferenceAlias Property Alias_MasakoIntroSceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_CamdenIntroSceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_VeenaIntroSceneMarker Auto Const Mandatory

Quest Property RI05 Auto Const Mandatory

ReferenceAlias Property Alias_CMOutpostKeyCamden Auto Const Mandatory

Key Property RI06_CMOutpostRC1AccessKey Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property RI06_Bribe Auto Const Mandatory

GlobalVariable Property RI04_Track_PlayerStoleCamdenChoInfo Auto Const Mandatory

Potion Property Drug_Aurora Auto Const Mandatory

ReferenceAlias Property Alias_SecureWingAccessKey Auto Const Mandatory

Scene Property RI06_1200_Guard_IntroScene Auto Const Mandatory

ReferenceAlias Property Alias_CMOutpostTerminalQS Auto Const Mandatory

ReferenceAlias Property Alias_CMOutpostMapMarker Auto Const Mandatory

Quest Property RIR06 Auto Const Mandatory

Scene Property RI06_0100_Masako_TriggeredScene Auto Const Mandatory

ReferenceAlias Property Alias_VeenaOfficeDoor Auto Const Mandatory

Scene Property RI06_1375_Guard_DrOsianScene Auto Const Mandatory

ReferenceAlias Property Alias_DrOsian Auto Const Mandatory

ReferenceAlias Property Alias_DrOsianSceneFurniture Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

Scene Property RI06_1220_SecureWing_TriggeredScene Auto Const Mandatory

ReferenceAlias Property Alias_TheClinicMapMarker Auto Const Mandatory

GlobalVariable Property RI05_Track_BayuDispleased Auto Const Mandatory

Quest Property RI07 Auto Const Mandatory

ReferenceAlias Property Alias_VeenaOfficeSceneTrigger Auto Const Mandatory

ReferenceAlias Property Alias_GuardSecureWingMoveTo Auto Const Mandatory

Scene Property RI06_1258_Sean_CallSecurityScene Auto Const Mandatory

Scene Property RI06_1258_DrLane_CallSecurityScene Auto Const Mandatory

ReferenceAlias Property Alias_AriQS Auto Const Mandatory

GlobalVariable Property RI06_Track_PlayerWitholdsClinicNames Auto Const Mandatory

GlobalVariable Property RI06_Extort Auto Const Mandatory

Faction Property RI06_SecureWingFaction Auto Const Mandatory

ObjectReference Property NewGameShipMarkerREF Auto Const Mandatory

SQ_PlayerShipScript Property SQ_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

ReferenceAlias Property Alias_RothiciteShipment Auto Const Mandatory

ReferenceAlias Property Alias_DrLane Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_Sean Auto Const Mandatory

ReferenceAlias Property Alias_DrLaneTerminal Auto Const Mandatory

Book Property RI05_KumihoSlate Auto Const Mandatory

ReferenceAlias Property Alias_Guard_SecureWing Auto Const Mandatory

Keyword Property RIR06_QuestStartKeyword Auto Const Mandatory

ActorValue Property RI06_Foreknowledge_LucasDrexlerEvilAV Auto Const Mandatory

GlobalVariable Property RI06_SeanDead Auto Const Mandatory

GlobalVariable Property RI06_KendrickDead Auto Const Mandatory

ReferenceAlias Property Alias_SecureWingDoor Auto Const Mandatory

ReferenceAlias Property Alias_Yuko Auto Const Mandatory

MiscObject Property RI06_RothiciteShipment Auto Const Mandatory

ReferenceAlias Property Alias_RothiciteShipmentPost Auto Const Mandatory

Cell Property StationTheClinicSecureWing01 Auto Const Mandatory

ReferenceAlias Property Alias_CMOutpostTowerNPCsEnableMarker Auto Const Mandatory

Quest Property RI_Support Auto Const Mandatory

GlobalVariable Property RI_UnlockRothicite Auto Const Mandatory

GlobalVariable Property RIR06_RadiantCount Auto Const Mandatory
