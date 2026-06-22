;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC02_002944B8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Complete FC01
FC01.SetStage(2000)

game.GetPlayer().moveto(FC02_PT1)
Alias_DanielBlake.GetRef().MoveTo(FC02_BlakeReadingBookMarker)

;give player a ship
Frontier_ModularREF.moveto(AkilaCityShipLandingMarker)
Frontier_ModularREF.setlinkedref(AkilaCityShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Set at quest start

SetActive()
SetObjectiveDisplayed(100)

;disable intro scene trigger and have Mikaela and Waylon evaluate packages
Alias_WFIntroTrigger.GetRef().Disable()
Alias_Waylon.GetActorRef().EvaluatePackage()
Alias_Molly.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; Set at end of dialogue in action 3 of Emma's greet scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
; Set at the end of Emma's Greet01 scene

SetObjectiveCompleted(100)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
; Set from the starting stages of the 4 ranger mission board quests
; Conditions the appearance of the QT on the mission terminal
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
; Set from the completion stages of the 4 ranger mission board quests

SetObjectiveCompleted(150)
SetObjectiveDisplayed(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Set in Emma's TL01 scene in action 3 top option.

; Add the player to the Freestar Ranger faction
Alias_Player.GetActorRef().AddToFaction(FreestarRangerFaction)

SetObjectiveCompleted(180)
SetObjectiveDisplayed(200)

FC02_EmmaWalktoHannahScene.Start()

Alias_DanielBlake.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
; The handoff scene is now started from the last info of 
; FC02_EmmaReportToBlakeScene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
; Set at the end of Blake and Emma's first scene

SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Set in phase 3 oF BlakeGreet01 scene

; Give the player a badge and ranger sidearm
Alias_Player.GetActorRef().AddItem(Alias_DeputyBadge.GetRef(), 1)
Alias_Player.GetActorRef().AddItem(LL_Weapon_FreestarRangersSidearm, 1)
Alias_Player.GetActorRef().AddItem(Clothes_Ranger_Vested_Deputy, 1)
Alias_Player.GetActorRef().AddItem(Clothes_Ranger_Hat_Deputy, 1)
; Add deputy uniform
; Add spacesuit

; Promote the player to Deputy rank
Alias_Player.GetActorRef().SetValue(FreestarRangerRank, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Set in end data of Emma's handoff to Hannah scene

SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
; Set in end data on Hannah's Greet01 scene

Alias_Hannah.GetActorRef().EvaluatePackage()

SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Set in stage 320

SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;SetObjectiveDisplayed(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0417_Item_00
Function Fragment_Stage_0417_Item_00()
;BEGIN CODE
Alias_Hannah.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
; Set when the player enters FC02_SetStage420Trigger at the AKila City starport

;FC02_HannahBoardShipScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DefaultFollowerToggleQuestScript
Quest __temp = self as Quest
DefaultFollowerToggleQuestScript kmyQuest = __temp as DefaultFollowerToggleQuestScript
;END AUTOCAST
;BEGIN CODE
; Set in BlakeGreet01 scene

SetObjectiveCompleted(250)
SetObjectiveDisplayed(500)

; Emma starts following the player
FC02_EmmaFollowing.SetValue(1)

kmyquest.CheckConditions()

Alias_DanielBlake.GetActorRef().EvaluatePackage()

;Emma becomes a passenger
Actor EmmaWilcoxREF = Alias_Emma.GetActorRef()
(SQ_PlayerShip as SQ_PlayerShipScript).AddPassenger(EmmaWilcoxREF)

; Enable the Ruffians' camp clutter and bootprints.
; (The rufians themselves get enabled in stage 800)
Alias_FC02_BanditCamp_EnableMarker.GetRef().Enable()
FC02_BootprintEnableMarker.Enable()
Alias_BanditTracksA.GetReference().Enable()
Alias_BanditTracksB.GetReference().Enable()
Alias_BanditTracksC.GetReference().Enable()
Alias_BanditTracksD.GetReference().Enable()
Alias_BanditTracksE.GetReference().Enable()

;Move Mikaela to a marker so the player will see her wave package when they arrive
Alias_Molly.GetActorRef().MoveTo(Alias_MikaelaStage500Marker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; Temp debug stage

Alias_Player.GetRef().MoveTo(FC02_TempPlayerStage600Marker)
Alias_Hannah.GetRef().MoveTo(FC02_TempHannahStage600Marker)
Alias_Molly.GetRef().MoveTo(FC02_MaryStage600PackageMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Set from player alias change location script

SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

; Helga is no longer a passenger
Actor HelgaDubrayREF = Alias_Hannah.GetActorRef()
(SQ_PlayerShip as SQ_PlayerShipScript).RemovePassenger(HelgaDubrayREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
; Set from script on FC02_Stage610Trigger ref

FC02_MikaelaFlagDownScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0615_Item_00
Function Fragment_Stage_0615_Item_00()
;BEGIN CODE
Alias_Emma.GetReference().MoveTo(FC03_PT1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
; Set at the end of Molly's greeting line in her greet01 scene
; Conditions her forcegreet package

Alias_Molly.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Set in Action 3, first reponse in Molly's greet 01 scene

; Enable the ruffian NPCs
FC02_RuffiansEnableMarkerRef.Enable()

; Move the Job's Done slate to the bandit leader
Alias_RuffianLeader.GetActorRef().AddItem(Alias_Slate.GetRef())

SetObjectiveCompleted(600)
SetObjectiveDisplayed(800)

FC02_HannahStartTrackingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer())
Utility.Wait(0.5)
FC02_BanditTracksActivatorA_MSG.Show()

FC02_HelgaTrackingComment01Scene.Start()

; Disable the activator
Alias_BanditTracksA.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer())
Utility.Wait(0.5)
FC02_BanditTracksActivatorB_MSG.Show()

FC02_HelgaTrackingComment02Scene.Start()

; Disable the activator
Alias_BanditTracksB.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0840_Item_00
Function Fragment_Stage_0840_Item_00()
;BEGIN CODE
WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer())
Utility.Wait(0.5)
FC02_BanditTracksActivatorC_MSG.Show()

FC02_HelgaTrackingComment03Scene.Start()

; Disable the activator
Alias_BanditTracksC.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer())
Utility.Wait(0.5)
FC02_BanditTracksActivatorD_MSG.Show()

FC02_HelgaTrackingComment04Scene.Start()

; Disable the activator
Alias_BanditTracksD.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
FC02_EmmaTrackingComment06Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
FC02_EmmaTrackingComment07Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
FC02_EmmaTrackingComment08Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
FC02_BanditChatterScene.Start()

if IsObjectiveDisplayed(800)
  SetObjectiveCompleted(800)
  SetObjectiveDisplayed(1000)
endif

(FC02_Ruffian02Ref as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0970_Item_00
Function Fragment_Stage_0970_Item_00()
;BEGIN CODE
Alias_RuffianLeader.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Set when player activates bandit tracks activator E

WwiseEvent_QST_FC02_InvestigateTracks.Play(Game.GetPlayer())
Utility.Wait(0.5)
FC02_BanditTracksActivatorE_MSG.Show()

FC02_HelgaTrackingComment05Scene.Start()

; Disable the activator
Alias_BanditTracksE.GetReference().Disable()

SetObjectiveCompleted(800)
SetObjectiveDisplayed(1000)

(FC02_Ruffian02Ref as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
; If Emma is more than 30 units away, teleport her to camp

if Alias_Player.GetActorRef().GetDistance(Alias_Emma.GetRef()) > 30
  Alias_Emma.GetRef().MoveTo(FC02_EmmaMoveToCampMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1025_Item_00
Function Fragment_Stage_1025_Item_00()
;BEGIN CODE
; Set if the player asks the "ruffians" who they are
; The player heard the mercs reference their uniorm and badge
; Used in the debriefing scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
; Add the player to the ruffian enemy faction
Alias_Player.GetActorRef().AddToFaction(FC02_RuffianEnemyFaction)

SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1050)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; Set from script on AllRuffians alias when the last one is dead

FC02_HelgaRuffiansDeadScene.Start()

SetObjectiveCompleted(1000)
SetObjectiveCompleted(1050)

if !GetStageDOne(1400)
  SetObjectiveDisplayed(1075)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN AUTOCAST TYPE DefaultFollowerToggleQuestScript
Quest __temp = self as Quest
DefaultFollowerToggleQuestScript kmyQuest = __temp as DefaultFollowerToggleQuestScript
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(1000)
  SetObjectiveDisplayed(1000, false)
endif

; Enable Emma's sandbox camp search
FC02_EmmaSandboxCampGlobal.SetValue(1)

; Emma stops following the player
FC02_EmmaFollowing.SetValue(0)

kmyquest.CheckConditions()

SetObjectiveCompleted(1075)
SetObjectiveDisplayed(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
; Set from container change script on slate alias

if IsObjectiveDisplayed(1075)
  SetObjectiveDisplayed(1075, false)
endif

SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
; Set from on read script on slate alias

if IsObjectiveDisplayed(1075)
  SetObjectiveDisplayed(1075, false)
endif

SetObjectiveCompleted(1300)
SetObjectiveDisplayed(1400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN AUTOCAST TYPE DefaultFollowerToggleQuestScript
Quest __temp = self as Quest
DefaultFollowerToggleQuestScript kmyQuest = __temp as DefaultFollowerToggleQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1400)

; Stop Emma's sandbox camp search
FC02_EmmaSandboxCampGlobal.SetValue(0)

; Emma starts following the player
FC02_EmmaFollowing.SetValue(1)

kmyquest.CheckConditions()

if GetStageDone(630) == True
  SetObjectiveDisplayed(1500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
;Set at the end of Molly's final thank you scene

; TODO Make Hannah board the player's ship
; TODO 3rd Pass SetObjectieDisplayed(1600)

SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1900_Item_00
Function Fragment_Stage_1900_Item_00()
;BEGIN CODE
; Complete the objective to talk to Mikaela
SetObjectiveCompleted(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE DefaultFollowerToggleQuestScript
Quest __temp = self as Quest
DefaultFollowerToggleQuestScript kmyQuest = __temp as DefaultFollowerToggleQuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

; allow access to FCR mission board
MissionBoardAccessAllowed_FCR.SetValue(1)

; Emma stops following the player
FC02_EmmaFollowing.SetValue(0)

kmyquest.CheckConditions()

; Add the perk indicating the player is a Ranger
Game.GetPlayer().AddPerk(FactionFreestarCollectivePerk)

; set the quest completion actor value
Alias_Player.GetActorRef().SetValue(FC02_Completed, 1)

; Stop the boarding encounter quest
FC02_BE_Quest.SetStage(1000)

; Start the next quest
FC03.Start()

;Achievement Unlocked
Game.AddAchievement(14)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property FC02_PT1 Auto Const Mandatory

Scene Property FC02_EmmaWalktoHannahScene Auto Const Mandatory

Scene Property FC02_EmmaHandoffToHannahScene Auto Const Mandatory

ReferenceAlias Property Alias_Hannah Auto Const Mandatory

ObjectReference Property FC02_HannahWaitNearShipMarker Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ObjectReference Property FC02_TempPlayerStage600Marker Auto Const Mandatory

ObjectReference Property FC02_TempHannahStage600Marker Auto Const Mandatory

ReferenceAlias Property Alias_Molly Auto Const Mandatory

ObjectReference Property FC02_MaryStage600PackageMarker Auto Const Mandatory

Scene Property FC02_HannahStartTrackingScene Auto Const Mandatory

ObjectReference Property FC02_RuffiansEnableMarkerRef Auto Const Mandatory

ObjectReference Property FC02_PT4 Auto Const Mandatory

ObjectReference Property FC02_PT4_HannahMarker Auto Const Mandatory

Scene Property FC02_HannaConcludeScene Auto Const Mandatory

ObjectReference Property FC02_PT2 Auto Const Mandatory

ObjectReference Property FC02_SetStage420Trigger Auto Const Mandatory

Message Property FC02_BanditTracksActivatorA_MSG Auto Const Mandatory

Message Property FC02_BanditTracksActivatorB_MSG Auto Const Mandatory

Message Property FC02_BanditTracksActivatorC_MSG Auto Const Mandatory

Message Property FC02_BanditTracksActivatorD_MSG Auto Const Mandatory

Message Property FC02_BanditTracksActivatorE_MSG Auto Const Mandatory

Faction Property FreestarRangerFaction Auto Const Mandatory

ReferenceAlias Property Alias_BanditTracksE Auto Const Mandatory

Faction Property FC02_RuffianEnemyFaction Auto Const Mandatory

Quest Property FC03 Auto Const Mandatory

Scene Property FC02_MikaelaFlagDownScene Auto Const Mandatory

Key Property TEMP_FreestarRangerBadge_Deputy Auto Const Mandatory

Scene Property FC02_HelgaTrackingComment01Scene Auto Const Mandatory

Scene Property FC02_HelgaTrackingComment02Scene Auto Const Mandatory

Scene Property FC02_HelgaTrackingComment03Scene Auto Const Mandatory

Scene Property FC02_HelgaTrackingComment04Scene Auto Const Mandatory

Scene Property FC02_HelgaTrackingComment05Scene Auto Const Mandatory

Scene Property FC02_HelgaRuffiansDeadScene Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property AkilaCityShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

ObjectReference Property FC_PTRockDoor Auto Const Mandatory

GlobalVariable Property MissionBoardAccessAllowed_FCR Auto Const Mandatory

Perk Property FactionFreestarCollectivePerk Auto Const Mandatory

ReferenceAlias Property Alias_Emma Auto Const Mandatory

Quest Property FC01 Auto Const Mandatory

Scene Property FC02_EmmaReportToBlakeScene Auto Const Mandatory

Scene Property FC02_EmmaTrackingComment06Scene Auto Const Mandatory

Scene Property FC02_EmmaTrackingComment07Scene Auto Const Mandatory

Scene Property FC02_EmmaTrackingComment08Scene Auto Const Mandatory

ReferenceAlias Property Alias_Chest Auto Const Mandatory

ReferenceAlias Property Alias_Slate Auto Const Mandatory

Quest Property FC02_BE_Quest Auto Const Mandatory

ReferenceAlias Property Alias_WFIntroTrigger Auto Const Mandatory

ReferenceAlias Property Alias_Waylon Auto Const Mandatory

ReferenceAlias Property Alias_MikaelaStage500Marker Auto Const Mandatory

ReferenceAlias Property Alias_MissionTerminal Auto Const Mandatory

ActorValue Property FreestarRangerRank Auto Const Mandatory

ReferenceAlias Property Alias_FC02_BanditCamp_EnableMarker Auto Const Mandatory

Scene Property FC02_BanditChatterScene Auto Const Mandatory

ActorValue Property FC02_Completed Auto Const Mandatory

Armor Property Clothes_Ranger_Vested_Deputy Auto Const Mandatory

ObjectReference Property FC02_BootprintEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Ruffian01 Auto Const Mandatory

ObjectReference Property FC02_EmmaMoveToCampMarker Auto Const Mandatory

GlobalVariable Property FC02_EmmaSandboxCampGlobal Auto Const Mandatory

Armor Property Clothes_Ranger_Hat_Deputy Auto Const Mandatory

GlobalVariable Property FC02_EmmaFollowing Auto Const Mandatory

ReferenceAlias Property Alias_BanditTracksA Auto Const Mandatory

ReferenceAlias Property Alias_BanditTracksD Auto Const Mandatory

ReferenceAlias Property Alias_BanditTracksC Auto Const Mandatory

ReferenceAlias Property Alias_BanditTracksB Auto Const Mandatory

ReferenceAlias Property Alias_RuffianLeader Auto Const Mandatory

ObjectReference Property FC02_Ruffian02Ref Auto Const Mandatory

ReferenceAlias Property Alias_DanielBlake Auto Const Mandatory

LeveledItem Property LL_Weapon_FreestarRangersSidearm Auto Const Mandatory

MiscObject Property FreeStarDeputyBadge Auto Const Mandatory

ReferenceAlias Property Alias_DeputyBadge Auto Const Mandatory

ObjectReference Property FC02_BlakeReadingBookMarker Auto Const Mandatory

ObjectReference Property FC03_PT1 Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_FC02_InvestigateTracks Auto Const Mandatory
