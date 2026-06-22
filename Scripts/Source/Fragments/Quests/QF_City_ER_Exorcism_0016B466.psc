;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_ER_Exorcism_0016B466 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(19)
Game.GetPlayer().MoveTo(City_ER_Ghost_DebugMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(19)
Game.GetPlayer().Moveto(Alias_DungeonDebugMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(500)
Game.GetPlayer().Moveto(City_ER_Ghost_DebugMarker02)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
SetObjectiveCompleted(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Game.GetPlayer().Moveto(Alias_DungeonDebugMarker02.GetRef())
SetStage(300)
Utility.Wait(100)
SetObjectiveCompleted(100)
SetObjectiveCompleted(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(140)
Game.GetPlayer().AddPerk(BackgroundBountyHunter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
ER_Dead_KilmansReturned.SetValue(1)
DialogueEleosRetreat.SetStage(900)
City_ER_Ghost.SetStage(1000)

DialogueEleosRetreat.SetStage(25)
DialogueEleosRetreat.SetStage(40)
DialogueEleosRetreat.SetStage(50)
DialogueEleosRetreat_OpeningScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
SetObjectiveDisplayed(110)
SetActive()

;Change the activate text on the chair
Alias_WaitChair.GetRef().SetActivateTextOverride(ER_Exorcism_ChairDisplayNameOverride)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
if GetStageDone(330)
  SetStage(350)
endif

if GetStageDone(120) && GetStageDone(130) && GetStageDone(140)
  SetStage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
if GetStageDone(110) && GetStageDone(130) && GetStageDone(140)
  SetStage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, ER_Exorcism_NevanBribeCredits.GetValueInt())

if GetStageDone(120) && GetStageDone(110) && GetStageDone(140)
  SetStage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
if GetStageDone(120) && GetStageDone(130) && GetStageDone(110)
  SetStage(150)
endif

;Trigger Sloan's comment
SetStage(145)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
City_ER_Exorcism_145_SloanResponse.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(290)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Game.FadeOutGame(true, true, 0.5, 1.0, true)
Utility.Wait(2.0)
SetStage(305)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
ObjectReference TrackRef01 = Alias_Tracker01.GetRef()
ObjectReference TrackRef02 = Alias_Tracker02.GetRef()
TrackRef01.MoveTo(Alias_HunterSpawn01.GetRef())
TrackRef02.MoveTo(Alias_HunterSpawn02.GetRef())
TrackRef01.Enable()
TrackRef02.Enable()
Game.FadeOutGame(false, true, 0.5, 1.0)
Setstage(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0307_Item_00
Function Fragment_Stage_0307_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
City_ER_Exorcism_0310_Trackers_SpotPlayer.Start()

if IsObjectiveDisplayed(110) && !IsObjectiveCompleted(110)
  SetObjectiveDisplayed(110, false, false)
endif

;Clear the override activate text on the chair
Alias_WaitChair.GetRef().SetActivateTextOverride(none)

Utility.Wait(1.0)
Alias_Tracker01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
City_ER_Exorcism_0310_Trackers_SpotPlayer.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
if GetStageDone(110)
  SetStage(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

if IsObjectiveDisplayed(110) && !IsObjectiveCompleted(110)
  SetObjectiveDisplayed(110, false, false)
endif

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
ER_Exorcism_PlayerStartedTrackersNegotiation.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;For now, we're just going to have them attack the player
;Set from the failure line in the scene

if IsObjectiveDisplayed(110) && !IsObjectiveCompleted(110)
  SetObjectiveDisplayed(110, false, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, ER_Exorcism_HunterBribeCredits.GetValueInt())
SetObjectiveCompleted(300)

if IsObjectiveDisplayed(110) && !IsObjectiveCompleted(110)
  SetObjectiveDisplayed(110, false, false)
endif

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

if IsObjectiveDisplayed(110) && !IsObjectiveCompleted(110)
  SetObjectiveDisplayed(110, false, false)
endif

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()
PlayACT.AddToFaction(ER_Exorcism_BountyHunterFaction_Enemy)
Alias_Tracker01.GetActorRef().StartCombat(PlayAct)
Alias_Tracker02.GetActorRef().StartCombat(PlayAct)

;The decision's been made. No more talking with the retreat staff objective
if IsObjectiveDisplayed(110) && !IsObjectiveCompleted(110)
  SetObjectiveDisplayed(110, false, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
if GetStageDone(480)
  SetStage(490)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
if GetStageDone(470)
  SetStage(490)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
ER_Exorcism_PlayerKilledTrackers.SetValue(1)
SetObjectiveCompleted(300)

SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set the Starborn tracking value so the player knows the outcome of this experience
Game.GetPlayer().SetValue(City_ER_Exorcism_Foreknowledge_IntimidatedTrackersAV, 1.0)

SetObjectiveCompleted(100)
SetObjectiveCompleted(310)
SetObjectiveDisplayed(500)

if IsObjectiveDisplayed(110) && !IsObjectiveCompleted(110)
  SetObjectiveDisplayed(110, false, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
Actor TrackRef01 = Alias_Tracker01.GetActorRef()
Actor TrackRef02 = Alias_Tracker02.GetActorRef()

if !TrackRef01.IsDead()
  TrackRef01.Disable()
endif

if !TrackRef02.IsDead()
  TrackRef02.Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;If the player bribed the Trackers and didn't kill them, set that global:
if !GetStageDone(490)
  if GetStageDone(420)
    ER_Exorcism_PlayerBribedTrackers.SetValue(1)
  elseif GetStageDone(430)
    ER_Exorcism_PlayerStarbornedTrackers.SetValue(1)
  endif
endif

City_ER_Peace.Start()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property ER_Exorcism_BountyHunterFaction_Enemy Auto Const Mandatory

ReferenceAlias Property Alias_Tracker01 Auto Const Mandatory

ReferenceAlias Property Alias_Tracker02 Auto Const Mandatory

ObjectReference Property City_ER_Ghost_DebugMarker01 Auto Const Mandatory

ObjectReference Property City_ER_Ghost_DebugMarker02 Auto Const Mandatory

Message Property ER_DEBUG_Exorcism_OptionalPaths Auto Const Mandatory

Quest Property City_ER_Peace Auto Const Mandatory

GlobalVariable Property ER_Exorcism_PlayerKilledTrackers Auto Const Mandatory

GlobalVariable Property ER_Exorcism_PlayerStartedTrackersNegotiation Auto Const Mandatory

GlobalVariable Property ER_Exorcism_NevanBribeCredits Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Quest Property DialogueEleosRetreat Auto Const Mandatory

Scene Property DialogueEleosRetreat_OpeningScene Auto Const Mandatory

ReferenceAlias Property Alias_DungeonDebugMarker Auto Const Mandatory

GlobalVariable Property ER_Dead_KilmansReturned Auto Const Mandatory

Quest Property City_ER_Ghost Auto Const Mandatory

Perk Property BackgroundBountyHunter Auto Const Mandatory

ReferenceAlias Property Alias_HunterSpawn01 Auto Const Mandatory

ReferenceAlias Property Alias_HunterSpawn02 Auto Const Mandatory

Message Property DEBUG_Exorcism_SitError Auto Const Mandatory

ReferenceAlias Property Alias_DungeonDebugMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_WaitChair Auto Const Mandatory

Message Property ER_Exorcism_ChairDisplayNameOverride Auto Const Mandatory

GlobalVariable Property ER_Exorcism_HunterBribeCredits Auto Const Mandatory

ActorValue Property City_ER_Exorcism_Foreknowledge_IntimidatedTrackersAV Auto Const Mandatory

GlobalVariable Property ER_Exorcism_PlayerBribedTrackers Auto Const Mandatory

GlobalVariable Property ER_Exorcism_PlayerStarbornedTrackers Auto Const Mandatory

Scene Property City_ER_Exorcism_145_SloanResponse Auto Const Mandatory

Scene Property City_ER_Exorcism_0310_Trackers_SpotPlayer Auto Const Mandatory
