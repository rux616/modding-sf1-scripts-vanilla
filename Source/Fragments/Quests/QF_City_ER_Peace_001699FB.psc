;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_ER_Peace_001699FB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(19)
Utility.Wait(1.0)
Game.GetPlayer().MoveTo(City_ER_Peace_DebugMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(19)
Utility.Wait(1.0)
SetStage(200)
Game.GetPlayer().Moveto(City_ER_Peace_DebugMarker02)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
ER_Exorcism_PlayerKilledTrackers.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
ER_Exorcism_PlayerStartedTrackersNegotiation.SetValue(1)
ER_Exorcism_PlayerKilledTrackers.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Game.GetPlayer().AddPerk(BackgroundSoldier)
Game.GetPlayer().AddPerk(BackgroundDiplomat)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
ER_Exorcism_PlayerBribedTrackers.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
ER_Exorcism_PlayerStarbornedTrackers.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
ER_Dead_KilmansReturned.SetValue(1)
DialogueEleosRetreat.SetStage(900)

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
SetActive()

Alias_Nevan.GetActorRef().EvaluatePackage()
Alias_Nevan.GetActorRef().MoveToPackageLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE uc09questscript
Quest __temp = self as Quest
uc09questscript kmyQuest = __temp as uc09questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

;Turn off Reisha and Snead's city life scene
DialogueFCAkilaCity.SetStage(2051)

Alias_EnableMarker.GetRef().Enable()

kmyquest.GetNPCsInPlace()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
City_ER_Peace_0200_Snead_CheckIn.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
if !GetStageDone(300)
  City_ER_Peace_0290_Snead_PlayerSneaksBy.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_Snead.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(200)

if !GetStageDone(340)
  SetObjectiveDisplayed(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
City_ER_Peace_0340_Lance_Attract.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
City_ER_Peace_0400_Lance_MainScene.Start()
SetObjectiveCompleted(350)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()
PlayACT.AddItem(LL_Spacesuit_Recon_01_PeaceReward_HighestQuality, 1)
PlayACT.AddItem(LL_Spacesuit_Recon_Backpack_01_PeaceReward_HighestQuality, 1)
PlayACT.AddItem(LL_Spacesuit_Recon_Helmet_01_PeaceReward_HighestQuality, 1)
PlayACT.AddItem(LL_Weapon_Reward_City_ER_Peace, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Kill the questline support quest
City_ER_Ghost_SupportQuest.SetStage(1000)

;Get the worker markers turned on back at the retreat
DialogueEleosRetreat.SetStage(5000)

;Give the player the pointer back to the Retreat
City_ER_Peace_Misc.Start()

;Mark the questline officially complete
ER_QuestlineComplete.SetValue(1)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_EnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Snead Auto Const Mandatory

ReferenceAlias Property Alias_Nevan Auto Const Mandatory

ObjectReference Property City_ER_Peace_DebugMarker01 Auto Const Mandatory

ObjectReference Property City_ER_Peace_DebugMarker02 Auto Const Mandatory

Scene Property City_ER_Peace_0340_Lance_Attract Auto Const Mandatory

Scene Property City_ER_Peace_0400_Lance_MainScene Auto Const Mandatory

GlobalVariable Property ER_Exorcism_PlayerKilledTrackers Auto Const Mandatory

GlobalVariable Property ER_Exorcism_PlayerStartedTrackersNegotiation Auto Const Mandatory

Scene Property City_ER_Peace_0200_Snead_CheckIn Auto Const Mandatory

Scene Property City_ER_Peace_0290_Snead_PlayerSneaksBy Auto Const Mandatory

Armor Property Spacesuit_Recon_01_PeaceReward Auto Const Mandatory

Armor Property Spacesuit_Recon_Backpack_01_PeaceReward Auto Const Mandatory

Armor Property Spacesuit_Recon_Helmet_01_PeaceReward Auto Const Mandatory

GlobalVariable Property ER_Dead_KilmansReturned Auto Const Mandatory

Quest Property DialogueEleosRetreat Auto Const Mandatory

Scene Property DialogueEleosRetreat_OpeningScene Auto Const Mandatory

Perk Property BackgroundSoldier Auto Const Mandatory

Perk Property BackgroundDiplomat Auto Const Mandatory

Quest Property City_ER_Ghost_SupportQuest Auto Const Mandatory

GlobalVariable Property ER_Exorcism_PlayerBribedTrackers Auto Const Mandatory

GlobalVariable Property ER_Exorcism_PlayerStarbornedTrackers Auto Const Mandatory

Quest Property City_ER_Peace_Misc Auto Const Mandatory

Quest Property DialogueFCAkilaCity Auto Const Mandatory

GlobalVariable Property ER_QuestlineComplete Auto Const Mandatory

LeveledItem Property LL_Weapon_Reward_City_ER_Peace Auto Const Mandatory

LeveledItem Property LL_Spacesuit_Recon_01_PeaceReward_HighestQuality Auto Const Mandatory

LeveledItem Property LL_Spacesuit_Recon_Backpack_01_PeaceReward_HighestQuality Auto Const Mandatory

LeveledItem Property LL_Spacesuit_Recon_Helmet_01_PeaceReward_HighestQuality Auto Const Mandatory
