;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COM_Quest_Barrett_Q02_00002FAE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
(Alias_Activator_Temple_Trigger.GetRef() as SBRingPuzzleNEWScript).CompletePuzzle()
BQ01_Scene_BARK_8499_Barrett_Temple_PuzzleSolved.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
; Put OtherBarrett in Holding Cell and Disable
Alias_OtherBarrett.GetRef().MoveTo(Alias_Marker_HoldingCell.GetRef())
Alias_OtherBarrett.GetActorRef().Disable()
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

;BEGIN FRAGMENT Fragment_Stage_7401_Item_00
Function Fragment_Stage_7401_Item_00()
;BEGIN CODE
SetStage(8300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8000_Item_00
Function Fragment_Stage_8000_Item_00()
;BEGIN CODE
If !GetStageDone(8010)
   SetStage(8100)
Else 
   SetStage(8300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8001_Item_00
Function Fragment_Stage_8001_Item_00()
;BEGIN CODE
SetStage(8401)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8010_Item_00
Function Fragment_Stage_8010_Item_00()
;BEGIN CODE
SetStage(8120)
SetStage(8301)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8100_Item_00
Function Fragment_Stage_8100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(8100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8101_Item_00
Function Fragment_Stage_8101_Item_00()
;BEGIN CODE
If GetStageDone(8120) && !GetStageDone(8110)
   SetObjectiveSkipped(8100)
Else 
   SetObjectiveCompleted(8100) 
EndIf 

SetStage(8300) ; Find Barrett's Temple
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8111_Item_00
Function Fragment_Stage_8111_Item_00()
;BEGIN CODE
SetStage(8120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8112_Item_00
Function Fragment_Stage_8112_Item_00()
;BEGIN CODE
SetStage(8120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8120_Item_00
Function Fragment_Stage_8120_Item_00()
;BEGIN CODE
SetStage(8101)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8200_Item_00
Function Fragment_Stage_8200_Item_00()
;BEGIN CODE
SetStage(8300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8300_Item_00
Function Fragment_Stage_8300_Item_00()
;BEGIN AUTOCAST TYPE bq01_questscript
Quest __temp = self as Quest
bq01_questscript kmyQuest = __temp as bq01_questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(7500)
SetObjectiveDisplayed(8300)

kmyQuest.TempleDiscovered()

BarrettTempleLocationAlias.ForceLocationTo(Alias_Location_Temple.GetLocation())

;"lock in" companion to prevent player dismissing them:
Actor BarrettRef = Alias_Barrett.GetActorRef()
SQ_Companions.LockInCompanion(BarrettRef as CompanionActorScript, CustomMessage = BQ02CompanionLockInMSG)
COM_BQ01_WaitToggle.SetValue(1)
SQ_Followers.CommandFollow(BarrettRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8301_Item_00
Function Fragment_Stage_8301_Item_00()
;BEGIN CODE
SetObjectiveCompleted(8300)

SetStage(8400)
SetStage(8310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8310_Item_00
Function Fragment_Stage_8310_Item_00()
;BEGIN CODE
Scene_ArrivedAtTemple.Start()
Alias_Barrett.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8400_Item_00
Function Fragment_Stage_8400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(8400)
Alias_Barrett.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8401_Item_00
Function Fragment_Stage_8401_Item_00()
;BEGIN CODE
SetObjectiveCompleted(8400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8405_Item_00
Function Fragment_Stage_8405_Item_00()
;BEGIN CODE
Alias_Marker_Temple_OtherBarrett.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8410_Item_00
Function Fragment_Stage_8410_Item_00()
;BEGIN CODE
SetStage(8415)
SetStage(8500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8415_Item_00
Function Fragment_Stage_8415_Item_00()
;BEGIN CODE
ObjectReference BarrettRef = Alias_Barrett.GetRef()
ObjectReference PlayerRef = Game.GetPlayer()

if PlayerRef.GetDistance(BarrettRef) > 10
   BarrettRef.MoveTo(Game.GetPlayer())
endif

Scene_InsideTemple.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8500_Item_00
Function Fragment_Stage_8500_Item_00()
;BEGIN AUTOCAST TYPE bq01_questscript
Quest __temp = self as Quest
bq01_questscript kmyQuest = __temp as bq01_questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.BQ01_Enablelayer = InputEnableLayer.Create()
kmyquest.BQ01_Enablelayer.EnableFastTravel(false)
kmyquest.BQ01_Enablelayer.EnableGravJump(false)
kmyquest.BQ01_Enablelayer.EnableFarTravel(false)
Alias_PlayerPilotSeat.RefillAlias()
Alias_PlayerPilotSeat.GetRef().BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8501_Item_00
Function Fragment_Stage_8501_Item_00()
;BEGIN AUTOCAST TYPE bq01_questscript
Quest __temp = self as Quest
bq01_questscript kmyQuest = __temp as bq01_questscript
;END AUTOCAST
;BEGIN CODE
BQ01_Scene_BARK_8499_Barrett_Temple_PuzzleSolved.Stop()
Actor BarrettRef = Alias_Barrett.GetActorRef()
Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef()
BarrettRef.MoveTo(Alias_Marker_Temple_Barrett.GetRef())
BarrettRef.AddSpell(AbStarbornTeleport)
BarrettRef.SetGhost()
BarrettRef.SetRestrained(true)
OtherBarrettRef.MoveTo(Alias_Marker_Temple_OtherBarrett.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8502_Item_00
Function Fragment_Stage_8502_Item_00()
;BEGIN CODE
ScenePuzzleSolved.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8505_Item_00
Function Fragment_Stage_8505_Item_00()
;BEGIN AUTOCAST TYPE bq01_questscript
Quest __temp = self as Quest
bq01_questscript kmyQuest = __temp as bq01_questscript
;END AUTOCAST
;BEGIN CODE
Actor BarrettRef = Alias_Barrett.GetActorRef()
BarrettRef.EvaluatePackage()
Utility.Wait(2.0)

SetStage(8510) ; Play Barrett's Scene
SetStage(8600) ; Get Power

ObjectReference WaitMarkerRef = Alias_Marker_Temple_Barrett.GetRef()

SQ_Followers.CommandWait(Alias_Barrett.GetActorRef(), WaitMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8510_Item_00
Function Fragment_Stage_8510_Item_00()
;BEGIN CODE
Scene_BarrettUsesPower.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8600_Item_00
Function Fragment_Stage_8600_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(8600)

SetStage(8605)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8601_Item_00
Function Fragment_Stage_8601_Item_00()
;BEGIN CODE
SetObjectiveCompleted(8600)

SetStage(8700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8605_Item_00
Function Fragment_Stage_8605_Item_00()
;BEGIN CODE
SetStage(8610)
SetStage(8001)

Alias_Barrett.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8615_Item_00
Function Fragment_Stage_8615_Item_00()
;BEGIN AUTOCAST TYPE bq01_questscript
Quest __temp = self as Quest
bq01_questscript kmyQuest = __temp as bq01_questscript
;END AUTOCAST
;BEGIN CODE
Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef()
Actor BarrettRef = Alias_Barrett.GetActorRef()
Scene_BarrettUsesPower.Stop()
Utility.Wait(1.5)

OtherBarrettRef.Enable()
OtherBarrettRef.MoveTo(Alias_Marker_Temple_OtherBarrett.GetRef())
OtherBarrettRef.AddSpell(AbStarbornTeleport)
OtherBarrettRef.SetRestrained(true)
OtherBarrettRef.SetGhost()

int i = 0
while i < BarrettSpacesuitForms.Length
if BarrettRef.IsEquipped(BarrettSpacesuitForms[i])
    OtherBarrettRef.EquipItem(BarrettSpacesuitForms[i])
endif
    i += 1
endWhile    

BarrettRef.EvaluatePackage()
kmyquest.BQ01_Enablelayer.EnableMenu(true)
SetStage(8620)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8620_Item_00
Function Fragment_Stage_8620_Item_00()
;BEGIN CODE
Scene_OtherBarrettAppears.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8625_Item_00
Function Fragment_Stage_8625_Item_00()
;BEGIN CODE
Scene_OtherBarrettAppears.Stop()
Scene_BarrettReplies.Start()
SetStage(8700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8700_Item_00
Function Fragment_Stage_8700_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(8700)
Alias_OtherBarrett.GetActorRef().SetGhost(false)
Alias_Barrett.GetActorRef().SetGhost(false)
SetStage(8601)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8701_Item_00
Function Fragment_Stage_8701_Item_00()
;BEGIN CODE
SetObjectiveCompleted(8700)
SetStage(8800)
Actor BarrettRef = Alias_Barrett.GetActorRef()
Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef()

BarrettRef.SetRestrained(false)
BarrettRef.EvaluatePackage()
OtherBarrettRef.SetRestrained(false)
OtherBarrettRef.EvaluatePackage()
SQ_Followers.CommandFollow(BarrettRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8713_Item_00
Function Fragment_Stage_8713_Item_00()
;BEGIN CODE
SpaceshipReference StarbornRef = Alias_Spaceship_Starborn.GetShipRef()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8714_Item_00
Function Fragment_Stage_8714_Item_00()
;BEGIN CODE
SpaceshipReference StarbornRef = Alias_Spaceship_Starborn.GetShipRef()

StarbornRef.EnableNoWait()
StarbornRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8720_Item_00
Function Fragment_Stage_8720_Item_00()
;BEGIN CODE
BQ01_Scene_GREET_8700_TalkToBarretts.Stop()

SetStage(8701)

if GetStageDone(8812)
    Utility.Wait(2)
    SetStage(8805)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8800_Item_00
Function Fragment_Stage_8800_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(8800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8801_Item_00
Function Fragment_Stage_8801_Item_00()
;BEGIN CODE
SetObjectiveCompleted(8800)
SetStage(8900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8805_Item_00
Function Fragment_Stage_8805_Item_00()
;BEGIN CODE
Utility.Wait(3)   ;Debug

Actor StarbornRef = Alias_Actor_Starborn.GetActorRef()

StarbornRef.Enable()
StarbornRef.MoveTo(Alias_Marker_Temple_Starborn.GetRef())
StarbornRef.AddSpell(AbStarbornTeleport)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8812_Item_00
Function Fragment_Stage_8812_Item_00()
;BEGIN CODE
if GetStageDone(8701) && GetStageDone(8720)
    SetStage(8805)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8820_Item_00
Function Fragment_Stage_8820_Item_00()
;BEGIN CODE
Actor OtherBarrettRef = Alias_OtherBarrett.GetActorRef()
Actor BarrettRef = Alias_Barrett.GetActorRef()

BarrettRef.EvaluatePackage()
OtherBarrettRef.EvaluatePackage()

BarrettRef.BlockActivation(false, true)

SetStage(8830)
SetStage(8801)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8830_Item_00
Function Fragment_Stage_8830_Item_00()
;BEGIN CODE
Scene_LosingPower.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8850_Item_00
Function Fragment_Stage_8850_Item_00()
;BEGIN CODE
Utility.Wait(3.5)
Alias_OtherBarrett.GetActorRef().AddSpell(AbStarbornDeath)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8860_Item_00
Function Fragment_Stage_8860_Item_00()
;BEGIN CODE
ObjectReference OtherBarrettRef = Alias_OtherBarrett.GetRef()
Utility.Wait(0.5)
OtherBarrettRef.Disable()

SceneThankYou.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8900_Item_00
Function Fragment_Stage_8900_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(8900)

Alias_Barrett.GetActorRef().BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8901_Item_00
Function Fragment_Stage_8901_Item_00()
;BEGIN CODE
SetObjectiveCompleted(8900)

If GetStageDone(275)
   SetStage(280)
Else 
   SetStage(9000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8920_Item_00
Function Fragment_Stage_8920_Item_00()
;BEGIN CODE
SetStage(8930)
SetStage(8901)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8930_Item_00
Function Fragment_Stage_8930_Item_00()
;BEGIN CODE
If GetStageDone(275) && !GetStageDone(280)
   SetStage(280)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN AUTOCAST TYPE bq01_questscript
Quest __temp = self as Quest
bq01_questscript kmyQuest = __temp as bq01_questscript
;END AUTOCAST
;BEGIN CODE
;"release the lock" companion to allow player dismissing them:
Actor BarrettRef = Alias_Barrett.GetActorRef()

if !Com_Quest_Barrett_Q01.IsRunning()
    SQ_Companions.LockInCompanion(BarrettRef as CompanionActorScript, LockedIn = false, CustomMessage = BQ02CompanionLockInOverMSG)
    COM_BQ01_WaitToggle.SetValue(0)
endif

BarrettRef.RemoveSpell(AbStarbornTeleport)
BarrettRef.AddSpell(AIPower_ParallelSelf)

Game.GetPlayer().SetValue(COM_Quest_Barrett_Q02_Complete_AV, 1)

Alias_CollisionMarkers.DisableAll()

kmyquest.BQ01_Enablelayer.Delete()
Alias_PlayerPilotSeat.GetRef().BlockActivation(false, false)

If GetStageDone(275)
   SetStage(9100)
Else
   SetStage(9200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9100_Item_00
Function Fragment_Stage_9100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9200_Item_00
Function Fragment_Stage_9200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN CODE
SetStage(8860)
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; Companion
sq_companionsscript Property SQ_Companions Auto Const Mandatory
sq_followersscript Property SQ_Followers Auto Const Mandatory
ReferenceAlias Property Alias_Barrett Auto Const Mandatory

; Player
Perk Property StarbornPerk Auto Const Mandatory

; Temple
Scene Property Scene_HelloBarrett Auto Const Mandatory
ReferenceAlias Property Alias_Marker_Temple_LandingPad Auto Const Mandatory
ReferenceAlias Property Alias_Marker_Temple_OtherBarrett Auto Const Mandatory
ReferenceAlias Property Alias_MapMarker_Temple Auto Const Mandatory
ReferenceAlias Property Alias_OtherBarrett Auto Const Mandatory
ReferenceAlias Property Alias_Activator_Temple_Puzzle Auto Const Mandatory
ReferenceAlias Property Alias_Actor_Starborn Auto Const Mandatory
ReferenceAlias Property Alias_Spaceship_Starborn Auto Const Mandatory
ReferenceAlias Property Alias_Marker_HoldingCell Auto Const Mandatory
Scene Property Scene_ArrivedAtTemple Auto Const Mandatory
Scene Property Scene_InsideTemple Auto Const Mandatory
Scene Property Scene_SolvedPuzzle Auto Const Mandatory
Scene Property Scene_BarrettUsesPower Auto Const Mandatory
Scene Property Scene_OtherBarrettAppears Auto Const Mandatory
Scene Property Scene_BarrettReplies Auto Const Mandatory
Scene Property Scene_LosingPower Auto Const Mandatory
Scene Property Scene_OtherBarrettExitWarning Auto Const Mandatory
Scene Property Scene_CherishThem Auto Const Mandatory
Scene Property Scene_AlreadyDo Auto Const Mandatory

; Unsorted
Quest Property BarrettQuest Auto Const Mandatory

ReferenceAlias Property Alias_Marker_Temple_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_Marker_Temple_Player Auto Const Mandatory

ReferenceAlias Property Alias_Activator_Temple_Trigger Auto Const Mandatory

ReferenceAlias Property Alias_Activator_Temple_TriggerEntry Auto Const Mandatory

Explosion Property BE_KT02_ExplosionHavok Auto Const Mandatory

Spell Property AbStarbornTeleport Auto Const Mandatory

Spell Property AbStarbornDeath Auto Const Mandatory

Scene Property BQ01_Scene_GREET_8700_TalkToBarretts Auto Const Mandatory

ActorValue Property COM_Quest_Barrett_Q01_Complete_AV Auto Const Mandatory

Message Property BQ02CompanionLockInMSG Auto Const Mandatory

Message Property BQ02CompanionLockInOverMSG Auto Const Mandatory

Scene Property SceneThankYou Auto Const Mandatory

Scene Property ScenePuzzleSolved Auto Const Mandatory

LocationAlias Property BarrettTempleLocationAlias Auto Const Mandatory

LocationAlias Property Alias_Location_Temple Auto Const Mandatory

Scene Property BQ01_Scene_BARK_8499_Barrett_Temple_PuzzleSolved Auto Const Mandatory

ActorValue Property COM_Quest_Barrett_Q02_Complete_AV Auto Const Mandatory

Spell Property BarrettSpell Auto Const Mandatory

RefCollectionAlias Property Alias_CollisionMarkers Auto Const Mandatory

Spell Property AbStarbornTeleportAlt Auto Const Mandatory

ReferenceAlias Property Alias_Marker_Temple_Starborn Auto Const Mandatory

Quest Property COM_Quest_Barrett_Q01 Auto Const Mandatory

Spell Property AIPower_ParallelSelf Auto Const Mandatory

Armor[] Property BarrettSpacesuitForms Auto Const Mandatory

GlobalVariable Property COM_BQ01_WaitToggle Auto Const Mandatory

ReferenceAlias Property Alias_PlayerPilotSeat Auto Const Mandatory
