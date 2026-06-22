;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COM_Quest_SarahMorgan_Q01_002C7C11 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Debug Setup

;Make Sarah a Companion
SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference())
Alias_Sarah.GetActorRef().MoveTo(Game.GetPlayer())

;Setup Admiral Logan
Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker)

SetStage(10)
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Debug Setup start on Cassiopeia

;Make Sarah a Companion
SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference())

;Setup Admiral Logan
Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker)

;Push Quest Ahead
SetStage(10)
SetStage(20)
SetStage(23)
SetStage(25)
COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
SetStage(30)
SetStage(40)
SetStage(50)
utility.wait(1)
Game.GetPlayer().MoveTo(COM_SMSQ01_PlanetStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Debug Setup start 

;Make Sarah a Companion
SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference())

;Setup Admiral Logan
Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker)

;Push Quest Ahead
SetStage(10)
SetStage(20)
SetStage(23)
SetStage(25)
COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
SetStage(30)
SetStage(40)
SetStage(50)
SetStage(60)
utility.wait(1)
Game.GetPlayer().MoveTo(COM_SMSQ01_FirstCrashsiteMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Debug Setup start 

;Make Sarah a Companion
SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference())

;Setup Admiral Logan
Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker)

;Push Quest Ahead
SetStage(10)
SetStage(20)
SetStage(23)
SetStage(25)
COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
SetStage(30)
SetStage(40)
SetStage(50)
SetStage(60)
SetStage(70)
SetStage(80)
SetStage(90)
SetStage(100)
SetStage(110)
SetStage(120)
utility.wait(1)
Game.GetPlayer().MoveTo(COM_SMSQ01_SecondCrashsiteMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Debug Setup start 

;Make Sarah a Companion
SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference())

;Setup Admiral Logan
Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker)

;Push Quest Ahead
SetStage(10)
SetStage(20)
SetStage(23)
SetStage(25)
COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
SetStage(30)
SetStage(40)
SetStage(50)
SetStage(60)
SetStage(70)
SetStage(80)
SetStage(90)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop()
COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop()
utility.wait(1)
Game.GetPlayer().MoveTo(COM_SMSQ01_GravesMarker)
Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_SarahSceneMarker)
Alias_Sarah.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Debug Setup start 

;Make Sarah a Companion
SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference())

;Setup Admiral Logan
Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker)

;Push Quest Ahead
SetStage(10)
SetStage(20)
SetStage(23)
SetStage(25)
COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
SetStage(30)
SetStage(40)
SetStage(50)
SetStage(60)
SetStage(70)
SetStage(80)
SetStage(90)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(170)
COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop()
COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop()
utility.wait(1)
Game.GetPlayer().MoveTo(COM_SMSQ01_SonaCampMarker)
Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_SarahSceneMarker)
Alias_Sarah.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;Setup Admiral Logan
Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker)
Alias_AdmiralLogan.GetActorRef().EvaluatePackage()
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Debug Setup start 

;Make Sarah a Companion
SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference())

;Setup Admiral Logan
Alias_AdmiralLogan.GetActorRef().MoveTo(COM_SMQ01_LoganOfficeMarker)

;Push Quest Ahead
SetStage(10)
SetStage(20)
SetStage(23)
SetStage(25)
COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
SetStage(30)
SetStage(40)
SetStage(50)
SetStage(60)
SetStage(70)
SetStage(80)
SetStage(90)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(170)
SetStage(178)
SetStage(180)
SetStage(185)
SetStage(195)
SetStage(198)
COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop()
COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop()
utility.wait(1)
Game.GetPlayer().MoveTo(COM_SMQ01_OverlookFastMarker)
Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_OverlookFastMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
;Debug Setup start 

;Make Sarah a Companion
SQ_Companions.SetRoleActive(Alias_Sarah.GetActorReference())

;Push Quest Ahead
SetStage(10)
SetStage(20)
SetStage(23)
SetStage(25)
COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Stop()
SetStage(30)
SetStage(40)
SetStage(50)
SetStage(60)
SetStage(70)
SetStage(80)
SetStage(90)
SetStage(100)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(170)
SetStage(178)
SetStage(180)
SetStage(185)
SetStage(195)
SetStage(198)
SetStage(205)
SetStage(210)
SetStage(220)
SetStage(230)
COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Stop()
COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene.Stop()
utility.wait(1)
Game.GetPlayer().MoveTo(COM_SMQ01_PlayerFastMemorial)
Alias_Sarah.GetActorReference().MoveTo(COM_SMQ01_SarahFastMemorial)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;"lock in" companion to prevent player dismissing them:
SQ_Companions.LockInCompanion(Alias_Sarah.GetActorReference() as CompanionActorScript, TextReplaceActivator = COM_PQ_TxtReplace_QuestName_Sarah)

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;stage set by *Player Alias* DefaultAliasOnLocationChange - conditions check to make sure Sarah is current companion
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;Admiral Logan Placement and Trigger Handling
COM_SQ01_LoganStartTriggerRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
;Release Sarah from Follow
;SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference())
;Alias_Sarah.GetActorRef().EvaluatePackage()

;Fire Starting Scene when Player enters office with Sarah
;If Sarah is too far away, move her to the player
if Alias_Sarah.GetRef().GetDistance(Game.GetPlayer()) > 10
Alias_Sarah.GetRef().MoveTo(COM_SMQ01_SarahWarpMarker)
endif

COM_Quest_SarahMorgan_Q01_Stage020_LoganScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;Return Sarah to follow
SQ_Followers.SetRoleActive(Alias_Sarah.GetActorReference())

Alias_Sarah.GetActorRef().EvaluatePackage()

;Enable initial landing marker
COM_SMQ01FirstMMRef.Enable()
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

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

;Toggle Sarah's waiting capability to "off"
COM_SMQ01_WaitToggle.SetValue(1)
SQ_Followers.CommandFollow(Alias_Sarah.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

;If Player already in Volume when first scene ends, make sure it triggers
CF04CrashSiteTriggerRef.Disable()
Utility.Wait(2)
CF04CrashSiteTriggerRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)

If GetStageDone(85) == 0
SetObjectiveDisplayed(80)
ElseIf GetStageDone(85) == 1
SetObjectiveDisplayed(90)
EndIf

;Set Waiting toggle to "on"
COM_SMQ01_WaitToggle.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(80) == 1
SetObjectiveCompleted(80)
EndIf
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)
LC070.SetStage(20)

If IsObjectiveDisplayed(70) == 1
SetObjectiveDisplayed(70,0)
EndIf

If IsObjectiveDisplayed(80) == 1
SetObjectiveDisplayed(80,0)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)

COM_SQ01CrashSite02Marker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;Comment Scene
COM_Quest_SarahMorgan_Q01_Stage130_CrashSiteArrival.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(140)

;Fire off Sona's initial scene
COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble.Start()

;Release Sarah from Follow
SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference())
Alias_Sarah.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
;Allows greeting scene to be available if Player backs out

;Clean up used trigger
COM_SMQ01_Stage140TriggerRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
UpdateCurrentInstanceGlobal(COM_SMQ01_GenetagsCollected)
SetObjectiveDisplayed(160)

;If Nine Genetags Already Collected, Spawn Boss
(Alias_Player as COM_SMQ01_AliasScript).SpawnBossOrEnd()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN CODE
LC125.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
SetObjectiveDisplayed(170)

;Setup New Trigger
COM_SMQ01_Stage170TriggerRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
;Fire off scene
COM_Quest_SarahMorgan_Q01_Stage175_SarahPostGraveyard.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0178_Item_00
Function Fragment_Stage_0178_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170)
SetObjectiveDisplayed(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetObjectiveCompleted(175)
SetObjectiveDisplayed(180)
SetObjectiveDisplayed(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0185_Item_00
Function Fragment_Stage_0185_Item_00()
;BEGIN CODE
SetObjectiveCompleted(180)
SetObjectiveDisplayed(190,0)
COM_SQ01_SonaStayed.SetValue(1)
SetStage(195)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveCompleted(190)
SetObjectiveDisplayed(180,0)
COM_SQ01_SonaLeft.SetValue(1)
SetStage(195)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
SetObjectiveCompleted(190)
SetObjectiveDisplayed(195)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_01
Function Fragment_Stage_0195_Item_01()
;BEGIN CODE
SetObjectiveCompleted(190)
SetObjectiveDisplayed(195)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0198_Item_00
Function Fragment_Stage_0198_Item_00()
;BEGIN CODE
SetObjectiveCompleted(195)
SetObjectiveDisplayed(198)

;Get Sona Moving
Alias_Sona.GetActorRef().EvaluatePackage()

;Return Sarah to follow
SQ_Followers.SetRoleActive(Alias_Sarah.GetActorReference())

;Disable creatures so Sona doesn't get attacked
LC125.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(198)

;Release Sarah from Follow
SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference())
Alias_Sarah.GetActorRef().EvaluatePackage()

COM_SMQ01_Stage200_SarahOverlookStartScene.Start()

;Disable Sona for the "ride" to Jemison
If COM_SQ01_SonaLeft.GetValue() == 1
;Alias_Sona.GetActorRef().Disable()
kmyquest.AddPassenger(Alias_Sona)
Alias_Sona.GetActorRef().AddToFaction(ConstellationFaction)
Alias_Sona.GetActorRef().SetFactionRank(ConstellationFaction, 0)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(210)

;Return Sarah to follow
SQ_Followers.SetRoleActive(Alias_Sarah.GetActorReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(210)
SetObjectiveDisplayed(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
;Remove Genetags
Game.GetPlayer().RemoveItem(Alias_Genetag01.GetRef())
Game.GetPlayer().RemoveItem(Alias_Genetag02.GetRef())
Game.GetPlayer().RemoveItem(Alias_Genetag03.GetRef())
Game.GetPlayer().RemoveItem(Alias_Genetag04.GetRef())
Game.GetPlayer().RemoveItem(Alias_Genetag05.GetRef())
Game.GetPlayer().RemoveItem(Alias_Genetag06.GetRef())
Game.GetPlayer().RemoveItem(Alias_Genetag07.GetRef())
Game.GetPlayer().RemoveItem(Alias_Genetag08.GetRef())
Game.GetPlayer().RemoveItem(Alias_Genetag09.GetRef())
Game.GetPlayer().RemoveItem(Alias_Genetag10.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0226_Item_00
Function Fragment_Stage_0226_Item_00()
;BEGIN CODE
If COM_SQ01_SonaLeft.GetValue() == 1
Alias_Sona.GetActorRef().MoveTo(Lodge_RoomMarker_SarahMorgan)
Alias_Sona.GetActorRef().Enable()
Alias_Sona.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(220)
SetObjectiveDisplayed(226)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(220) == 1
SetObjectiveCompleted(220)
EndIf
If IsObjectiveDisplayed(226) == 1
SetObjectiveCompleted(226)
EndIf
SetObjectiveDisplayed(230)

;Enable the Marker in NA
COM_SMQ01_SarahMemorialTriggerRef.Enable()

;PQ Sona Starts
COM_Quest_SarahMorgan_Q01_Post.SetStage(10)
Alias_Sona.GetActorRef().EvaluatePackage()

;Robot at CWM
UC_NA_MemorialBot_Ref.Disable()

;Waterfall Marker Disable
COM_SQ01_RailMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0232_Item_00
Function Fragment_Stage_0232_Item_00()
;BEGIN CODE
;Release Sarah from Follow
SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference())
Alias_Sarah.GetActorRef().EvaluatePackage()

COM_SMQ01_Stage232_ApproachMemorialScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
SetObjectiveCompleted(230)
SetObjectiveDisplayed(235)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
SetObjectiveCompleted(235)
SetObjectiveDisplayed(240)

;Enable the Trigger
COM_SMQ01_RomanceTriggerRef.Enable()

;Begin Sarah Follow
SQ_Followers.SetRoleActive(Alias_Sarah.GetActorRef())
SQ_Followers.CommandFollow(Alias_Sarah.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(240)
SetObjectiveDisplayed(250)

;Release Sarah from Follow
SQ_Followers.SetRoleInactive(Alias_Sarah.GetActorReference())
Alias_Sarah.GetActorRef().EvaluatePackage()

;Play scene based in COM Quest
COM_SarahMorgan_System_RomanceScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)
Actor SarahMorganREF = Alias_Sarah.GetActorReference()

;"release the lock" companion to allow player dismissing them:
;don't do this if MQ102 has her locked
If MQ102_SarahLockedInCND.IsTrue(SarahMorganREF)
  ;do nothing
Else
  SQ_Companions.LockInCompanion(SarahMorganREF as CompanionActorScript, LockedIn = false)
EndIf

;New Game Plus Support
Game.GetPlayer().SetValue(COM_Quest_SarahMorgan_Q01_Complete_AV, 1)

;tell the Companion quest that the personal quest is finished
(Alias_Sarah.GetActorReference() as CompanionActorScript).COM_CompanionQuest.FinishedPersonalQuest()

;Robot at CWM
UC_NA_MemorialBot_Ref.Enable()

;Waterfall Marker Enable
COM_SQ01_RailMarker.Enable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN CODE
SetObjectiveCompleted(250)
Actor SarahMorganREF = Alias_Sarah.GetActorReference()

;"release the lock" companion to allow player dismissing them:
;don't do this if MQ102 has her locked
If MQ102_SarahLockedInCND.IsTrue(SarahMorganREF)
  ;do nothing
Else
  SQ_Companions.LockInCompanion(SarahMorganREF as CompanionActorScript, LockedIn = false)
EndIf

;New Game Plus Support
Game.GetPlayer().SetValue(COM_Quest_SarahMorgan_Q01_Complete_AV, 1)

;tell the Companion quest that the personal quest is finished
(Alias_Sarah.GetActorReference() as CompanionActorScript).COM_CompanionQuest.FinishedPersonalQuest()

;Robot at CWM
UC_NA_MemorialBot_Ref.Enable()

;Waterfall Marker Enable
COM_SQ01_RailMarker.Enable()

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

ObjectReference Property COM_SQ01_LoganStartTriggerRef Auto Const Mandatory

ReferenceAlias Property Alias_Sarah Auto Const Mandatory

ReferenceAlias Property Alias_Sona Auto Const Mandatory

ReferenceAlias Property Alias_AdmiralLogan Auto Const Mandatory

ObjectReference Property COM_SMQ01_LoganOfficeMarker Auto Const Mandatory

sq_companionsscript Property SQ_Companions Auto Const Mandatory

Scene Property COM_Quest_SarahMorgan_Q01_Stage020_LoganScene Auto Const Mandatory

ObjectReference Property COM_SMQ01_PowerConduitRef Auto Const Mandatory

ObjectReference Property COM_SMQ01_Stage140TriggerRef Auto Const Mandatory

ObjectReference Property COM_SMQ01_Stage170TriggerRef Auto Const Mandatory

sq_followersscript Property SQ_Followers Auto Const Mandatory

Scene Property COM_Quest_SarahMorgan_Q01_Stage140_SonaPreamble Auto Const Mandatory

Scene Property COM_Quest_SarahMorgan_Q01_Stage175_SarahPostGraveyard Auto Const Mandatory

Scene Property COM_SarahMorgan_System_RomanceScene Auto Const Mandatory

ObjectReference Property COM_SMQ01_SarahMemorialTriggerRef Auto Const Mandatory

ObjectReference Property COM_SMQ01_RomanceTriggerRef Auto Const Mandatory

Quest Property LC125 Auto Const

ObjectReference Property COM_SQ01CrashSite02Marker Auto Const Mandatory

ObjectReference Property COM_SMSQ01_PlanetStartMarker Auto Const Mandatory

ObjectReference Property COM_SMSQ01_FirstCrashsiteMarker Auto Const Mandatory

ObjectReference Property COM_SMSQ01_SecondCrashsiteMarker Auto Const Mandatory

ObjectReference Property COM_SMSQ01_SonaCampMarker Auto Const Mandatory

Scene Property COM_Quest_SarahMorgan_Q01_Stage145_SonaMainScene Auto Const Mandatory

Scene Property COM_Quest_SarahMorgan_Q01_Stage130_CrashSiteArrival Auto Const Mandatory

ObjectReference Property COM_SMSQ01_GravesMarker Auto Const Mandatory

ObjectReference Property COM_SMQ01_SarahSceneMarker Auto Const Mandatory

GlobalVariable Property COM_SQ01_SarahSceneReady Auto Const Mandatory

GlobalVariable Property COM_SQ01_SonaStayed Auto Const Mandatory

GlobalVariable Property COM_SQ01_SonaLeft Auto Const Mandatory

ObjectReference Property Lodge_RoomMarker_SarahMorgan Auto Const Mandatory

Quest Property COM_Quest_SarahMorgan_Q01_Post Auto Const Mandatory

Outfit Property Outfit_SMQ01_Sona_Clean Auto Const Mandatory

Outfit Property Outfit_SMQ01_Sona_Dirty Auto Const Mandatory

WwiseEvent Property OBJ_Powercell_Power_Up_WEF Auto Const Mandatory

Quest Property LC070 Auto Const

ActorValue Property COM_Quest_SarahMorgan_Q01_Complete_AV Auto Const Mandatory

GlobalVariable Property COM_SMQ01_GenetagsCollected Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ObjectReference Property CF04CrashSiteTriggerRef Auto Const Mandatory

Faction Property ConstellationFaction Auto Const Mandatory

Scene Property COM_SMQ01_Stage200_SarahDecided Auto Const Mandatory

ObjectReference Property COM_SMQ01_OverlookFastMarker Auto Const Mandatory

Scene Property COM_SMQ01_Stage200_SarahOverlookStartScene Auto Const Mandatory

Scene Property COM_SMQ01_Stage232_ApproachMemorialScene Auto Const Mandatory

ObjectReference Property COM_SMQ01_PlayerFastMemorial Auto Const Mandatory

ObjectReference Property COM_SMQ01_SarahFastMemorial Auto Const Mandatory

ObjectReference Property UC_NA_MemorialBot_Ref Auto Const Mandatory

ReferenceAlias Property Alias_Genetag01 Auto Const Mandatory

ReferenceAlias Property Alias_Genetag02 Auto Const Mandatory

ReferenceAlias Property Alias_Genetag03 Auto Const Mandatory

ReferenceAlias Property Alias_Genetag04 Auto Const Mandatory

ReferenceAlias Property Alias_Genetag05 Auto Const Mandatory

ReferenceAlias Property Alias_Genetag06 Auto Const Mandatory

ReferenceAlias Property Alias_Genetag07 Auto Const Mandatory

ReferenceAlias Property Alias_Genetag08 Auto Const Mandatory

ReferenceAlias Property Alias_Genetag09 Auto Const Mandatory

ReferenceAlias Property Alias_Genetag10 Auto Const Mandatory

ConditionForm Property COM_Quest_SarahMorgan_Q01_SarahLockInCND Auto Const Mandatory

ConditionForm Property MQ102_SarahLockedInCND Auto Const Mandatory

ObjectReference Property COM_SMQ01FirstMMRef Auto Const Mandatory

ObjectReference Property COM_SQ01_RailMarker Auto Const Mandatory

Activator Property COM_PQ_TxtReplace_QuestName_Sarah Auto Const Mandatory

GlobalVariable Property COM_SMQ01_WaitToggle Auto Const Mandatory

ObjectReference Property COM_SMQ01_SarahWarpMarker Auto Const Mandatory
