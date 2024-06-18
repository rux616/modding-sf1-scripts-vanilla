;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BF01_00009136 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Debug for Player Being Arrested - No SpaceFlight

Game.GetPlayer().AddItem(Credits,1000)
CF01_Stage10Temp_Message.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(205)
Utility.Wait(1)
Game.GetPlayer().AddItem(Credits,1000)
Game.GetPlayer().MoveTo(LC082_Quickstart_DockingPort)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Actor SysDef01 = Alias_Ops_Crew01.GetActorRef()
Actor SysDef02 = Alias_Ops_Crew02.GetActorRef()
Actor SysDef03 = Alias_Ops_Crew03.GetActorRef()
Actor SysDef04 = Alias_Ops_Crew04.GetActorRef()
Actor SysDef05 = Alias_Ops_Crew05.GetActorRef()

VigilanceMainActors.AddRef(SysDef01)
VigilanceMainActors.AddRef(SysDef02)
VigilanceMainActors.AddRef(SysDef03)
VigilanceMainActors.AddRef(SysDef04)
VigilanceMainActors.AddRef(SysDef05)

SysDef01.SetCrimeFaction(CrimeFactionUCSysDef)
SysDef02.SetCrimeFaction(CrimeFactionUCSysDef)
SysDef03.SetCrimeFaction(CrimeFactionUCSysDef)
SysDef04.SetCrimeFaction(CrimeFactionUCSysDef)
SysDef05.SetCrimeFaction(CrimeFactionUCSysDef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE CF01QuestScript
Quest __temp = self as Quest
CF01QuestScript kmyQuest = __temp as CF01QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)
;SC - Enable the Vigilance before moving the player.
LC082.UpdateVigilanceLocation("CF01")
;SC - Temporarily disable Fast Travel on the Vigilance.
LC082Vigilance01.EnableFastTravel(False)

;Connected to CFMQArrestHandler - Player was arrested, and fade-in sends them here
Alias_PlayerShip.GetShipRef().StopCombatAlarm()
Game.GetPlayer().StopCombatAlarm()

;Arrested docking and door locking handlers
LC082_InterrogationRoomDoorRef.Lock()
LC082_InterrogationRoomDoorRef.SetLockLevel(253)

;SetUpKibwe
Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweStartMarker)
Alias_CF01_Kibwe.GetActorRef().EvaluatePackage()

;SetUp Guards
Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage()
Alias_CF01_UCSGuard02.GetActorRef().EvaluatePackage()

;Block Elevator on Arrest Mode
LoadElevator_ProximityTrigger017.Disable()

;remove all contraband same as when player is arrested
kmyQuest.RemovePlayerContraband()

;clear enemy flag on crime faction
CrimeFactionUC.SetPlayerEnemy(false)

Actor[] waitingFollowers = SQ_Followers.AllFollowersWait(CF01_FollowerWaitMarker,IgnoreCurrentlyWaitingFollowers = false)
SQ_Followers.TeleportFollowers(CF01_FollowerWaitMarker, waitingFollowers)

;SetUp Player's Ship and Move Player
Game.GetPlayer().MoveTo(CF01PlayerStartMarker)
Game.GetPlayer().SnapIntoInteraction(CF01_InterrogationChairRef)
Game.GetPlayer().SetRestrained()


Utility.Wait(5)

Alias_HomeShip.TryToInstantDock(Alias_Vigilance)

SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Start the First Scene
CF01_Stage120_InitialGuardScene.Start()

;Release DialogueCrimeGuards control lock.
(DialogueCrimeGuards as CF01DialogueCrimeGuardsScript).EnablePlayerControlsAfterCF01Arrest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Alias_CF01_UCSGuard01.GetActorRef().Disable()
Alias_CF01_UCSGuard01.GetActorRef().MoveTo(CF01UCSGuard01AfterLtMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetStage(160)

;Reset UC Faction CrimeGold which wipes arrest
CrimeFactionUC.SetCrimeGold(0)
CrimeFactionUC.SetCrimeGoldViolent(0)
CrimeFactionUC.SetPlayerEnemy(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetStage(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;Arrested docking and door locking handlers
LC082_InterrogationRoomDoorRef.Unlock()
LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True)

;Allowing Kickout Starts - Player can initiate combat here and start
LC082.SetStage(200)

;Kick off Guard 1's Escort Sequence
Alias_CF01_UCSGuard01.GetActorRef().Enable()
Utility.Wait(1)
CF01_Stage165_UCSGuard01_EnterRoomScene.Start()

;Remove Player Restraint
Game.GetPlayer().SetRestrained(false)
SQ_Followers.AllFollowersFollow()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0166_Item_00
Function Fragment_Stage_0166_Item_00()
;BEGIN CODE
Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN AUTOCAST TYPE CF01QuestScript
Quest __temp = self as Quest
CF01QuestScript kmyQuest = __temp as CF01QuestScript
;END AUTOCAST
;BEGIN CODE
;Player will be moved back to the "ground" (jail marker)

;Remove Player Restraint
Game.GetPlayer().SetRestrained(false)
SQ_Followers.AllFollowersFollow()

kmyQuest.SendPlayerToJail()
Utility.Wait(10)
SetStage(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
;Done being moved to Cydonia

;Move Kibwe to Ops
Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweOpsMarker)
Alias_CF01_Kibwe.GetActorRef().EvaluatePackage()
LC082_InterrogationRoomDoorRef.Unlock()
LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True)

;Push Quest Ahead to Continue with Pirates Only!
SetStage(245)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
;Push Guard into Escort Package
Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage()
CF01_Stage180_UCSGuard01_EscortingScene.Start()

;Set Kibwe at Ops Position
CF01_Stage140_Kibwe_AcceptOfferScene.Stop()
Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweOpsMarker)
Alias_CF01_Kibwe.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0185_Item_00
Function Fragment_Stage_0185_Item_00()
;BEGIN CODE
;Guard Arrived at Last Location
Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
CF01_Stage185_UCSGuard01_EscortingSceneEnding.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(40)

;If Elevator Was Disabled, Enable
LoadElevator_ProximityTrigger017.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
;This stage only occurs when pointed from UC directly
;Player ready to dock and enter UC Vigilance
SetObjectiveDisplayed(30)

;Set Kibwe at Ops Position
Alias_CF01_Kibwe.GetActorRef().MoveTo(CF01KibweOpsMarker)
Alias_CF01_Kibwe.GetActorRef().EvaluatePackage()

;Enable the Vigilance.
LC082.UpdateVigilanceLocation("CF01")

;Move the Escort Guard
Alias_CF01_UCSGuard01.GetActorRef().MoveTo(CF01_AltMeet_UCGuard01Marker)
Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage()

;Open the doors inside the Vigilance so the player can get to
;the Operations Center.
LC082_OperationsCenterElevatorAccessDoorRef.SetOpen(True)
LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0206_Item_00
Function Fragment_Stage_0206_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(35)

;Allowing Kickout Starts - Player can initiate combat here and start
LC082.SetStage(200)

;Disable elevator until guard completes escort
LoadElevator_ProximityTrigger017.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0207_Item_00
Function Fragment_Stage_0207_Item_00()
;BEGIN CODE
SetObjectiveCompleted(35)
SetObjectiveDisplayed(36)

;Kickoff Escort and Scene
Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage()
CF01_Stage208_UCSoldier_AssignmentEscortScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0208_Item_00
Function Fragment_Stage_0208_Item_00()
;BEGIN CODE
;Guard Arrived at Last Location
Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0209_Item_00
Function Fragment_Stage_0209_Item_00()
;BEGIN CODE
CF01_Stage209_UCSoldier_AssignmentFinalScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Set at a trigger outside Operations or in docking area (depending on branch)
if IsObjectiveDisplayed(36) == 1
SetObjectiveCompleted(36)
endif
if GetStageDone(230) == 0
if IsObjectiveDisplayed(40) == 0
SetObjectiveDisplayed(40)
endif
endif

;For UC path, if elevator Was Disabled, Enable
if GetStageDone(205) == 1
LoadElevator_ProximityTrigger017.Enable()
endif

;Push Guard into Exit Package
Alias_CF01_UCSGuard01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0215_Item_00
Function Fragment_Stage_0215_Item_00()
;BEGIN CODE
CF_Main.SetStage(300)

Alias_CF01_Kibwe.GetActorRef().AddToFaction(PlayerEnemyFaction)
Alias_CF01_Kibwe.GetActorRef().SetValue(Aggression, 1)
Alias_CF01_Toft.GetActorRef().AddToFaction(PlayerEnemyFaction)
Alias_CF01_Toft.GetActorRef().SetValue(Aggression, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

Alias_CF01_Toft.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
;Combat has begun on the Vigilance
If IsObjectiveDisplayed(10)
SetObjectiveDisplayed(10,0)
EndIf
If IsObjectiveDisplayed(20)
SetObjectiveDisplayed(20,0)
EndIf
If IsObjectiveDisplayed(30)
SetObjectiveDisplayed(30,0)
EndIf
If IsObjectiveDisplayed(35)
SetObjectiveDisplayed(35,0)
EndIf
If IsObjectiveDisplayed(36)
SetObjectiveDisplayed(36,0)
EndIf
If IsObjectiveDisplayed(37)
SetObjectiveDisplayed(37,0)
EndIf
If IsObjectiveDisplayed(40)
SetObjectiveDisplayed(40,0)
EndIf
If IsObjectiveDisplayed(50)
SetObjectiveDisplayed(50,0)
EndIf
SetObjectiveDisplayed(52)

;Shutdown Stage Set on CF_Main in LC082 Stage 250

;Open the docking port door. Re-enable Fast Travel on the Vigilance.
LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True)
LC082Vigilance01.EnableFastTravel(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
;Player made it off of the Vigilance after starting combat - changeloc script handles it
SetObjectiveCompleted(52)
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0245_Item_00
Function Fragment_Stage_0245_Item_00()
;BEGIN CODE
;After saying "no" to Kibwe (after arrest) - SysDef is now an enemy
SetObjectiveCompleted(10)
CF_Main.SetStage(300)
SetStage(250)
LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True)
LC082Vigilance01.EnableFastTravel(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(54)

;The quest will hold until the Player visits Cydonia and runs into Sebastian
Alias_CF01_Sebastian.GetActorRef().Enable()
Alias_CF01_Sebastian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Alias_CF01_Sebastian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
;Player recieved the message from Naeva Mora
Game.GetPlayer().AddItem(Alias_CF01_InviteSlate.GetRef())
SetObjectiveCompleted(54)
SetObjectiveDisplayed(55)

;Enable Adler for this path
Alias_CF01_AdlerKemp.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Debug for Adler Kemp Section
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0309_Item_00
Function Fragment_Stage_0309_Item_00()
;BEGIN CODE
;Set by CF_Main stage 300, if the player starts combat on/with the
;Vigilance after stage 310 has been set. This just swaps the journal
;entry; the quest otherwise proceeds as before.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)

Game.GetPlayer().AddItem(Alias_CF01_AuroraSample.GetRef(),1)

;Open the door to the player's ship's docking port.
LC082_PlayerShipDockingPortAccessDoorRef.SetOpen(True)

;Ally the Player with SysDef
CF_Main.SetStage(20)

;Kick Off CFSD01
CFSD01.SetStage(5)

;Start SC Quest for Karl
CF01_KarlFielding_SpeechChallenges.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
;If Player was invited via the Slate, skip right to Adler
If GetStageDone(270) == 0
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
EndIf

If GetStageDone(270) == 1
SetObjectiveCompleted(60)
SetStage(340)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0336_Item_00
Function Fragment_Stage_0336_Item_00()
;BEGIN CODE
;Saorise Bribe Paid
Game.GetPlayer().RemoveItem(Credits,NPCDemandMoney_Small.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(70) == 1
SetObjectiveCompleted(70)
Endif
SetObjectiveDisplayed(80)

Alias_CF01_AdlerKemp.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_01
Function Fragment_Stage_0340_Item_01()
;BEGIN CODE
;Player read the message
SetObjectiveCompleted(55)
SetObjectiveDisplayed(80)

Alias_CF01_AdlerKemp.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0347_Item_00
Function Fragment_Stage_0347_Item_00()
;BEGIN CODE
;Remove Aurora Sample
Game.GetPlayer().RemoveItem(Alias_CF01_AuroraSample.GetRef(),1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)

Actor KarlRef = Alias_CF01_KarlFielding.GetActorRef()
KarlRef.Enable()
KarlRef.SetEssential(False)
KarlRef.SetProtected(True)

;Get Rid of Sebastian if he was enabled
Alias_CF01_Sebastian.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
;Karl has gone hostile
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)
Alias_CF01_KarlFielding.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0367_Item_00
Function Fragment_Stage_0367_Item_00()
;BEGIN CODE
SetStage(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(90)
SetObjectiveCompleted(90)
endif
if IsObjectiveDisplayed(100)
SetObjectiveCompleted(100)
endif
SetObjectiveDisplayed(110)

;Add credits if Karl SC success
if GetStageDone(365) == 1
Game.GetPlayer().AddItem(Credits,CF01_KarlDebt.GetValueInt())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
;Pay Adler Karl's Debt
Game.GetPlayer().RemoveItem(Credits,CF01_KarlDebt.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Clean up Karl
Actor KarlRef = Alias_CF01_KarlFielding.GetActorRef()
KarlRef.Disable()

SetObjectiveCompleted(110)
CF02.SetStage(10)

;Remove temp officers
VigilanceMainActors.RemoveRef(Alias_Ops_Crew01.GetRef())
VigilanceMainActors.RemoveRef(Alias_Ops_Crew02.GetRef())
VigilanceMainActors.RemoveRef(Alias_Ops_Crew03.GetRef())
VigilanceMainActors.RemoveRef(Alias_Ops_Crew04.GetRef())
VigilanceMainActors.RemoveRef(Alias_Ops_Crew05.GetRef())

Alias_Ops_Crew01.GetRef().DisableNoWait()
Alias_Ops_Crew02.GetRef().DisableNoWait()
Alias_Ops_Crew03.GetRef().DisableNoWait()
Alias_Ops_Crew04.GetRef().DisableNoWait()
Alias_Ops_Crew05.GetRef().DisableNoWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CF01_Kibwe Auto Const Mandatory

ReferenceAlias Property Alias_CF01_UCSGuard01 Auto Const Mandatory

ReferenceAlias Property Alias_CF01_UCSGuard02 Auto Const Mandatory

ObjectReference Property CF01PlayerStartMarker Auto Const Mandatory

Scene Property CF01_Stage120_InitialGuardScene Auto Const Mandatory

Message Property CF01_Stage10Temp_Message Auto Const Mandatory

MiscObject Property CF01_AuroraShipSample Auto Const Mandatory

ReferenceAlias Property Alias_CF01_AuroraSample Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Medium Auto Const Mandatory

LC082_VigilanceQuestScript Property LC082 Auto Const Mandatory

ObjectReference Property CF01KibweOpsMarker Auto Const Mandatory

ObjectReference Property LC082_InterrogationRoomDoorRef Auto Const Mandatory

ObjectReference Property LC082_PlayerShipDockingPortAccessDoorRef Auto Const Mandatory

ObjectReference Property LC082_OperationsCenterElevatorAccessDoorRef Auto Const Mandatory

ObjectReference Property CF01UCSGuard01AfterLtMarker Auto Const Mandatory

Scene Property CF01_Stage165_UCSGuard01_EnterRoomScene Auto Const Mandatory

Quest Property CF02 Auto Const Mandatory

ReferenceAlias Property Alias_CF01_KarlFielding Auto Const Mandatory

GlobalVariable Property CF_SysDefShutdown Auto Const Mandatory

ReferenceAlias Property Alias_Vigilance Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

Scene Property CF01_Stage140_Kibwe_AcceptOfferScene Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory

ObjectReference Property CF01KibweStartMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF01_AdlerKemp Auto Const Mandatory

Scene Property CF01_Stage180_UCSGuard01_EscortingScene Auto Const Mandatory

Scene Property CF01_Stage185_UCSGuard01_EscortingSceneEnding Auto Const Mandatory

Quest Property CFSD01 Auto Const Mandatory

Message Property CF01_Stage205Debug_Message Auto Const Mandatory

ObjectReference Property LC082_Quickstart_DockingPort Auto Const Mandatory

Scene Property CF01_Stage209_UCSoldier_AssignmentFinalScene Auto Const Mandatory

ObjectReference Property CF01_AltMeet_UCGuard01Marker Auto Const Mandatory

Scene Property CF01_Stage208_UCSoldier_AssignmentEscortScene Auto Const Mandatory

ReferenceAlias Property Alias_CF01_Sebastian Auto Const Mandatory

ReferenceAlias Property Alias_CF01_InviteSlate Auto Const Mandatory

ObjectReference Property CF01_InterrogationChairRef Auto Const Mandatory

ObjectReference Property LoadElevator_ProximityTrigger017 Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

GlobalVariable Property CF01_KarlDebt Auto Const Mandatory

SQ_FollowersScript Property SQ_Followers Auto Const

ObjectReference Property CF01_FollowerWaitMarker Auto Const Mandatory

Quest Property CF01_KarlFielding_SpeechChallenges Auto Const Mandatory

ReferenceAlias Property Alias_CF01_Toft Auto Const Mandatory

Cell Property LC082Vigilance01 Auto Const Mandatory

ReferenceAlias Property Alias_Ops_Crew01 Auto Const Mandatory

ReferenceAlias Property Alias_Ops_Crew02 Auto Const Mandatory

ReferenceAlias Property Alias_Ops_Crew03 Auto Const Mandatory

ReferenceAlias Property Alias_Ops_Crew04 Auto Const Mandatory

ReferenceAlias Property Alias_Ops_Crew05 Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

Quest Property DialogueCrimeGuards Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

RefCollectionAlias Property VigilanceMainActors Auto Const Mandatory

Faction Property CrimeFactionUCSysDef Auto Const Mandatory

ReferenceAlias Property Alias_HomeShip Auto Const Mandatory
