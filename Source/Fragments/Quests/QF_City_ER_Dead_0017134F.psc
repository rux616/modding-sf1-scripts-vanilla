;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_ER_Dead_0017134F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
DialogueEleosRetreat.SetStage(25)
DialogueEleosRetreat.SetStage(40)
DialogueEleosRetreat.SetStage(50)
Game.GetPlayer().Moveto(ER_Dead_DebugMarker01a)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(200)
Utility.Wait(1.0)
Game.GetPlayer().Moveto(ER_Dead_DebugMarker02a)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Actor KilACT = Alias_Kilman.GetActorRef()
KilACT.Enable()
SetStage(300)
Game.GetPlayer().Moveto(ER_Dead_DebugMarker03)
KilAct.Moveto(ER_Dead_DebugMarker_Kilman)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Alias_Petra.GetRef().Moveto(ER_Dead_Scene400Marker_Monika)
Alias_Sloan.GetRef().Moveto(ER_Dead_Scene400Marker_Monika)
Alias_Halftown.GetRef().Moveto(ER_Dead_Scene400Marker_Halftown)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Game.GetPlayer().AddPerk(TRAIT_Empath)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Kill the misc quest
if City_ER_Dead_Misc.IsRunning()
  City_ER_Dead_Misc.SetStage(1000)
endif

;Set the close out stage on DialogueEleos
DialogueEleosRetreat.SetStage(2100)

SetObjectiveDisplayed(100)
SetActive()

;Get the boss in the dungeon switched out
Alias_DungeonBoss.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor KilACT = Alias_Kilman.GetActorRef()
KilACT.MoveTo(Alias_CowerMarker.GetRef())
KilACT.MoveToNearestNavmeshLocation()
KilACT.Enable()

SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
Alias_Kilman.GetActorRef().EvaluatePackage()
City_ER_Dead_0205_Kilman_Attract.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0207_Item_00
Function Fragment_Stage_0207_Item_00()
;BEGIN CODE
Alias_Kilman.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Also, get Kilman out of his cower anim
SetStage(207)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE uc09questscript
Quest __temp = self as Quest
uc09questscript kmyQuest = __temp as uc09questscript
;END AUTOCAST
;BEGIN CODE
;Get Kilman behaving as a follower
SQ_FollowersScript myFollow = SQ_Followers as SQ_FollowersScript
Actor KilACT = Alias_Kilman.GetActorRef()
myFollow.SetRoleActive(KilACT)
myFollow.CommandFollow(KilACT)

;Get all the NPCs in their spots
kmyquest.GetNPCsInPlace()

SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
if !GetStageDone(400)
  City_ER_Dead_390_ConstWorkers_KilmanGreeting.Start()
endif

Alias_ConstructionWorkerF02.GetActorRef().EvaluatePackage()
Utility.Wait(0.5)
Alias_ConstructionWorkerM02.GetActorRef().EvaluatePackage()
Utility.Wait(0.25)
Alias_ConstructionWorkerF01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Turn off Kilman's follower behavior
;Get Kilman behaving as a follower
SQ_FollowersScript myFollow = SQ_Followers as SQ_FollowersScript
Actor KilACT = Alias_Kilman.GetActorRef()
Actor PlayACT = Game.GetPlayer()
myFollow.SetRoleInactive(KilACT)

;Teleport Kilman into place if he's not in the player's LOS or in the trigger
if !Alias_TriggerStage400.GetRef().IsInTrigger(KilAct) && !PlayACT.HasDetectionLOS(KilACT) && PlayAct.GetDistance(KilAct) >= 15
  KilACT.Moveto(City_ER_Dead_KilmanStage400_TeleportMarker)
endif

City_ER_Dead_0400_KilmanReturns.Start()
ER_Dead_KilmansReturned.SetValue(1)

SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
Alias_Petra.GetActorRef().EvaluatePackage()
Alias_Sloan.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_Halftown.GetActorRef().EvaluatePackage()
Alias_ConstructionWorkerM01.GetActorRef().EvaluatePackage()
Alias_Petra.GetActorRef().EvaluatePackage()
Alias_Kilman.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
ER_Ghost_BetterRewardUnlocked.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
City_ER_Ghost.Start()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property City_ER_Dead_Misc Auto Const Mandatory

Quest Property DialogueEleosRetreat Auto Const Mandatory

Message Property ER_DEBUG_Dead_PCMBusted Auto Const Mandatory

ReferenceAlias Property Alias_Kilman Auto Const Mandatory

Quest Property SQ_Followers Auto Const Mandatory

Scene Property City_ER_Dead_0400_KilmanReturns Auto Const Mandatory

ObjectReference Property ER_Dead_DebugMarker01 Auto Const Mandatory

ObjectReference Property ER_Dead_DebugMarker02a Auto Const Mandatory

ObjectReference Property ER_Dead_Scene400Marker_Kilman Auto Const Mandatory

Quest Property City_ER_Ghost Auto Const Mandatory

ReferenceAlias Property Alias_CaptiveMarker Auto Const Mandatory

ObjectReference Property ER_Dead_DebugMarker01a Auto Const Mandatory

Scene Property City_ER_Dead_390_ConstWorkers_KilmanGreeting Auto Const Mandatory

ReferenceAlias Property Alias_ConstructionWorkerM02 Auto Const Mandatory

ReferenceAlias Property Alias_ConstructionWorkerF02 Auto Const Mandatory

ReferenceAlias Property Alias_ConstructionWorkerF01 Auto Const Mandatory

Perk Property TRAIT_Empath Auto Const Mandatory

Scene Property City_ER_Dead_0205_Kilman_Attract Auto Const Mandatory

ObjectReference Property ER_Dead_DebugMarker03 Auto Const Mandatory

ObjectReference Property ER_Dead_DebugMarker_Kilman Auto Const Mandatory

ObjectReference Property ER_Dead_Scene400Marker_Monika Auto Const Mandatory

ReferenceAlias Property Alias_Petra Auto Const Mandatory

ReferenceAlias Property Alias_Sloan Auto Const Mandatory

ReferenceAlias Property Alias_Halftown Auto Const Mandatory

ReferenceAlias Property Alias_ConstructionWorkerM01 Auto Const Mandatory

ObjectReference Property ER_Dead_Scene400Marker_Halftown Auto Const Mandatory

GlobalVariable Property ER_Dead_KilmansReturned Auto Const Mandatory

GlobalVariable Property ER_Ghost_BetterReward Auto Const Mandatory

ReferenceAlias Property Alias_DungeonBoss Auto Const Mandatory

ReferenceAlias Property Alias_DungeonBossReplacement Auto Const Mandatory

ReferenceAlias Property Alias_CowerMarker Auto Const Mandatory

ObjectReference Property City_ER_Dead_KilmanStage400_TeleportMarker Auto Const Mandatory

ReferenceAlias Property Alias_TriggerStage400 Auto Const Mandatory

GlobalVariable Property ER_Ghost_BetterRewardUnlocked Auto Const Mandatory
