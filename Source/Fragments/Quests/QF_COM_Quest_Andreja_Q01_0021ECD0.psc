;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COM_Quest_Andreja_Q01_0021ECD0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Update Andreja's Companion quest to skip intro dialogue
COM_Companion_Andreja.SetStage(100)

;Stop quest MQ104a to prevent blocking hellos from interfering
MQ104a.Stop()

;Make Andreja a Companion
SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference())
Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Update Andreja's Companion quest to skip intro dialogue
COM_Companion_Andreja.SetStage(100)

;Stop quest MQ104a to prevent blocking hellos from interfering
MQ104a.Stop()

;Make Andreja the active companion
SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference())

;Set Stages
SetStage(10)
SetStage(20)
utility.wait(1)
Game.GetPlayer().MoveTo(Alias_AkilaTestMarker.GetReference())
Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Update Andreja's Companion quest to skip intro dialogue
COM_Companion_Andreja.SetStage(100)

;Stop quest MQ104a to prevent blocking hellos from interfering
MQ104a.Stop()

;Make Andreja the active companion
SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference())

;Advance Stages to this point in quest
SetStage(10)
SetStage(20)
SetStage(25)
SetStage(30)
SetStage(31)
SetStage(40)
SetStage(45)
SetStage(50)
utility.wait(1)
Game.GetPlayer().MoveTo(Alias_ErvinTestMarker.GetReference())
Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer())

;disallow Wait command for Andreja
COM_AndrejaQ01_WaitToggle.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Update Andreja's Companion quest to skip intro dialogue
COM_Companion_Andreja.SetStage(100)

;Stop quest MQ104a to prevent blocking hellos from interfering
MQ104a.Stop()

;Make Andreja the active companion
SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference())

;Advance Stages to this point in quest
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(31)
SetStage(40)
SetStage(45)
SetStage(50)
SetStage(55)
SetStage(60)
SetStage(70)
SetStage(75)
SetStage(80)
SetStage(85)
utility.wait(1)
Game.GetPlayer().MoveTo(Alias_DenTestMarker.GetReference())
Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Update Andreja's Companion quest to skip intro dialogue
COM_Companion_Andreja.SetStage(100)

;Stop quest MQ104a to prevent blocking hellos from interfering
MQ104a.Stop()

;Make Andreja the active companion
SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference())

;Advance Stages to this point in quest
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(31)
SetStage(40)
SetStage(45)
SetStage(50)
SetStage(55)
SetStage(60)
SetStage(70)
SetStage(75)
SetStage(80)
SetStage(85)
SetStage(90)
SetStage(100)
;SetStage(110)
;SetStage(120)
utility.wait(1)
Game.GetPlayer().MoveTo(Alias_DenTestMarker.GetReference())
Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Andreja.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Update Andreja's Companion quest to skip intro dialogue
COM_Companion_Andreja.SetStage(100)

;Stop quest MQ104a to prevent blocking hellos from interfering
MQ104a.Stop()

;Make Andreja the active companion
SQ_Companions.SetRoleActive(Alias_Andreja.GetActorReference())

;Advance Stages to this point in quest
SetStage(10)
SetStage(20)
;SetStage(25)
SetStage(30)
SetStage(31)
SetStage(40)
SetStage(45)
SetStage(50)
SetStage(55)
SetStage(60)
SetStage(70)
SetStage(75)
SetStage(80)
SetStage(85)
SetStage(90)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(170)
SetStage(300)
SetStage(305)

;stop any running scenes started through quest stages
COM_Quest_Andreja_Q01_Stage120_JaedaHailingScene.Stop()
COM_Quest_Andreja_Q01_Stage140_JaedaHail02.Stop()
COM_Quest_Andreja_Q01_Scene11_RaisaAndrejaScene.Stop()

utility.wait(1)
Game.GetPlayer().MoveTo(Alias_StationTestMarker.GetReference())
Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;"lock in" companion to prevent player dismissing them:
SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as CompanionActorScript, TextReplaceActivator = COM_PQ_TxtReplace_QuestName_Andreja)

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;make sure Aggie hasn't wandered off
Alias_Aggie.GetRef().MoveTo(Alias_Aggies_AndrejaMarker.GetRef())
Alias_Aggie.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_Andreja.GetActorReference().EvaluatePackage()

;If Andreja's fallen behind, and isn't in LOS, move her to her mark
if Game.GetPlayer().HasDirectLOS(Alias_Andreja.GetReference())==0
if Game.GetPlayer().GetDistance(Alias_Andreja.GetReference()) > 20
Alias_Andreja.GetReference().MoveTo(Alias_Aggies_AndrejaMarker.GetReference())
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0029_Item_00
Function Fragment_Stage_0029_Item_00()
;BEGIN CODE
Alias_Andreja.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
Alias_Andreja.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(45)
;flag map marker for target location to be visible on starmap
Alias_ErenCampMapMarker.GetReference().SetMarkerVisibleOnStarMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(45)
SetObjectiveDisplayed(50)

;disallow Wait command for Andreja
COM_AndrejaQ01_WaitToggle.SetValue(1)
SQ_Followers.CommandFollow(Alias_Andreja.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(50)
SetObjectiveDisplayed(50,0)
endif
if IsObjectiveDisplayed(55)
SetObjectiveCompleted(55)
endif

SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(55)
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
COM_Quest_Andreja_Q01_Scene06_AndrejaStage70Ervin.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(75)

;if player already picked up the slate, advance the stage
if Game.GetPlayer().GetItemCount(Alias_Eren_Slate.GetReference()) > 0
SetStage(80)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(75)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(85)

;DEBUG
COM_Quest_Andreja_Q01_Scene06_AndrejaStage70Ervin.Stop()

;re-allow Wait command for Andreja
COM_AndrejaQ01_WaitToggle.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0089_Item_00
Function Fragment_Stage_0089_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_DenTestMarker.GetReference())
Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(85)
SetObjectiveDisplayed(90)
COM_Quest_Andreja_Q01_Stage090_AndrejaDenArrival.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;remove 50 credits from player
Game.GetPlayer().RemoveItem(Credits, (NPCDemandMoney_Small.GetValue() as int))

;update to stage 100
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)
Alias_Jaeda_Ship.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0109_Item_00
Function Fragment_Stage_0109_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_RaisaTestMarker.GetReference())
Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer())
utility.wait(5)
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(120)
COM_Quest_Andreja_JaedaFaction.SetAlly(PlayerFaction)
COM_Quest_Andreja_Q01_Stage120_JaedaHailingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(130)
SpaceshipReference Ship01Ref = Alias_Zealot_Wave1_Ship01.GetShipReference()
SpaceshipReference Ship02Ref = Alias_Zealot_Wave1_Ship02.GetShipReference()
SpaceshipReference Ship03Ref = Alias_Zealot_Wave1_Ship03.GetShipReference()
SpaceshipReference JaedaShipRef = Alias_Jaeda_Ship.GetShipRef()

if Ship01Ref == None
    Ship01Ref = JaedaShipRef.PlaceShipAtMe(LvlShip_COM_Quest_Andreja_VaruunShip01, abInitiallyDisabled = true, akAliasToFill = Alias_Zealot_Wave1_Ship01)
    Ship01Ref.MoveNear(JaedaShipRef)
endif
if Ship02Ref == None
    Ship02Ref = JaedaShipRef.PlaceShipAtMe(LvlShip_COM_Quest_Andreja_VaruunShip01, abInitiallyDisabled = true, akAliasToFill = Alias_Zealot_Wave1_Ship02)
    Ship02Ref.MoveNear(JaedaShipRef)
endif
if Ship03Ref == None
    Ship03Ref = JaedaShipRef.PlaceShipAtMe(LvlShip_COM_Quest_Andreja_VaruunShip01, abInitiallyDisabled = true, akAliasToFill = Alias_Zealot_Wave1_Ship03)
    Ship03Ref.MoveNear(JaedaShipRef)
endif

Ship01Ref.EnableWithGravJump()
utility.wait(0.4)
Ship02Ref.EnableWithGravJump()
utility.wait(0.2)
Ship03Ref.EnableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0131_Item_00
Function Fragment_Stage_0131_Item_00()
;BEGIN CODE
if GetStageDone(132) && GetStageDone(133)
SetStage(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0132_Item_00
Function Fragment_Stage_0132_Item_00()
;BEGIN CODE
if GetStageDone(131) && GetStageDone(133)
SetStage(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0133_Item_00
Function Fragment_Stage_0133_Item_00()
;BEGIN CODE
if GetStageDone(131) && GetStageDone(132)
SetStage(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)
SetObjectiveDisplayed(140)
COM_Quest_Andreja_Q01_Stage140_JaedaHail02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140)
SetObjectiveDisplayed(150)
;utility.wait(1)
;Update Jaeda's ship so player can dock
Alias_Jaeda_Ship.GetReference().SetValue(DockingPermission, 2)
Alias_Jaeda.GetActorReference().SetValue(Game.GetInvulnerableAV(),1)
Alias_Jaeda.GetActorReference().SetGhost(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(160)
COM_Quest_Andreja_Q01_Scene11_RaisaAndrejaScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
SetObjectiveDisplayed(170)
COM_Quest_Andreja_Q01_Stage170_JaedaShout.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
Alias_Zealot_Wave02_ShipCaptain.GetShipRef().EnableWithGravJump()
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
if IsObjectivedisplayeD(170)
SetObjectiveCompleted(170)
endif
if IsObjectiveDisplayed(200)
SetObjectiveCompleted(200)
endif
SetObjectiveDisplayed(220)
COM_Quest_Andreja_Q01_Scene12_ZealotStage210.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170)
SetObjectiveDisplayed(220)
;COM_Quest_Andreja_Q01_Scene12_2_RaisaShout.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetObjectiveCompleted(220)
SetObjectiveDisplayed(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(170)
SetObjectiveCompleted(170)
endif
SetObjectiveCompleted(220)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(305)
StationUCN48.SetGravityScale(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0306_Item_00
Function Fragment_Stage_0306_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_StationTestMarker.GetReference())
Alias_Andreja.GetActorRef().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(305)
SetObjectiveDisplayed(310)
Alias_Tomisar.GetActorReference().SetValue(Game.GetInvulnerableAV(),1)
Alias_Tomisar.GetActorReference().SetGhost(True)
COM_Quest_Andreja_Q01_Scene14_AndrejaStage310.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveCompleted(310)
SetObjectiveDisplayed(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
;utility.wait(0.2)
;SetStage(340)
;Alias_Andreja.GetActorReference().EvaluatePackage()
COM_Quest_Andreja_Q01_Stage330_Andreja.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0331_Item_00
Function Fragment_Stage_0331_Item_00()
;BEGIN CODE
;(Alias_Andreja as COM_Quest_AndrejaAliasScript).PanelAnimRegister()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
SetObjectiveCompleted(320)
SetObjectiveDisplayed(340)
Alias_StationDoor.GetReference().SetOpen()
COM_Quest_Andreja_Q01_Scene16_AndrejaTomisarStage340.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0342_Item_00
Function Fragment_Stage_0342_Item_00()
;BEGIN CODE
Alias_Tomisar.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SetObjectiveCompleted(340)
SetObjectiveDisplayed(360)

Alias_Tomisar.GetActorReference().SetValue(Game.GetInvulnerableAV(),0)
Alias_Tomisar.GetActorReference().SetGhost(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
SetObjectiveCompleted(360)
SetObjectiveDisplayed(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
SetObjectiveCompleted(370)
SetObjectiveDisplayed(375)
Alias_Tomisar.GetActorReference().SetEssential(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
Alias_Tomisar.GetActorReference().SetEssential(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0381_Item_00
Function Fragment_Stage_0381_Item_00()
;BEGIN CODE
SetObjectiveCompleted(370)
SetStage(400)
SetStage(500)
COM_Quest_Andreja_Q01_Stage381_TomisarBarks.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0385_Item_00
Function Fragment_Stage_0385_Item_00()
;BEGIN CODE
Alias_Tomisar.GetActorReference().SetEssential(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
;COM_Quest_Andreja_Q01_Scene19_AndrejaTomisarStage390.Start()
Alias_Tomisar.GetActorReference().SetEssential(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0399_Item_00
Function Fragment_Stage_0399_Item_00()
;BEGIN CODE
Alias_Andreja.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Update Objectives based on which state we were in
If IsObjectiveDisplayed(370)
SetObjectiveCompleted(370)
endif
If IsObjectiveDisplayed(375)
SetObjectiveCompleted(375)
endif
if GetStageDone(381)==0
SetObjectiveDisplayed(400)
endif


;If Player wasn't supposed to kill Tomisar, set additional stage and start scene
;if GetStageDone(375)
;do nothing
;else
;SetStage(399)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(400)
SetObjectiveCompleted(400)
endif
SetObjectiveDisplayed(500)
Alias_Andreja.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
Alias_Andreja.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;tell the Companion quest that the personal quest is finished
(Alias_Andreja.GetActorReference() as CompanionActorScript).COM_CompanionQuest.FinishedPersonalQuest()

;"release the lock" companion to allow player dismissing them:
SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as CompanionActorScript, LockedIn = false)

;New Game Plus Support
Game.GetPlayer().SetValue(COM_Quest_Andreja_Q01_Complete_AV, 1)


Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_20000_Item_00
Function Fragment_Stage_20000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Andreja Auto Const Mandatory

sq_companionsscript Property SQ_Companions Auto Const Mandatory

ReferenceAlias Property Alias_AkilaTestMarker Auto Const Mandatory



Scene Property COM_Quest_Andreja_Q01_Scene12_2_RaisaShout Auto Const Mandatory

ReferenceAlias Property Alias_StationDoor Auto Const Mandatory

ReferenceAlias Property Alias_DenTestMarker Auto Const Mandatory

ReferenceAlias Property Alias_RaisaTestMarker Auto Const Mandatory

ReferenceAlias Property Alias_ErvinTestMarker Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Scene06_AndrejaStage70Ervin Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Scene11_RaisaAndrejaScene Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Scene12_ZealotStage210 Auto Const Mandatory

ReferenceAlias Property Alias_StationTestMarker Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Scene14_AndrejaStage310 Auto Const Mandatory

Cell Property StationUCN48 Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Scene16_AndrejaTomisarStage340 Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Scene19_AndrejaTomisarStage390 Auto Const Mandatory

Quest Property COM_Companion_Andreja Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Stage120_JaedaHailingScene Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Stage140_JaedaHail02 Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property COM_Quest_Andreja_JaedaFaction Auto Const Mandatory

ReferenceAlias Property Alias_Jaeda_Ship Auto Const Mandatory

ReferenceAlias Property Alias_Tomisar Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Stage381_TomisarBarks Auto Const Mandatory

ReferenceAlias Property Alias_Zealot_Wave1_Ship01 Auto Const Mandatory

ReferenceAlias Property Alias_Zealot_Wave1_Ship02 Auto Const Mandatory

ReferenceAlias Property Alias_Zealot_Wave1_Ship03 Auto Const Mandatory

ReferenceAlias Property Alias_Eren_Slate Auto Const Mandatory

ReferenceAlias Property Alias_ErenCampMapMarker Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Stage170_JaedaShout Auto Const Mandatory

ReferenceAlias Property Alias_Zealot_Wave02_ShipCaptain Auto Const Mandatory

ReferenceAlias Property Alias_Aggies_AndrejaMarker Auto Const Mandatory

Quest Property MQ104A Auto Const Mandatory

ActorValue Property COM_Quest_Andreja_Q01_Complete_AV Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Stage090_AndrejaDenArrival Auto Const Mandatory

ReferenceAlias Property Alias_Aggie Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

Activator Property COM_PQ_TxtReplace_QuestName_Andreja Auto Const Mandatory

Scene Property COM_Quest_Andreja_Q01_Stage330_Andreja Auto Const Mandatory

GlobalVariable Property COM_AndrejaQ01_WaitToggle Auto Const Mandatory

sq_followersscript Property SQ_Followers Auto Const Mandatory

ReferenceAlias Property Alias_Jaeda Auto Const Mandatory

SpaceshipBase Property LvlShip_COM_Quest_Andreja_VaruunShip01 Auto Const
