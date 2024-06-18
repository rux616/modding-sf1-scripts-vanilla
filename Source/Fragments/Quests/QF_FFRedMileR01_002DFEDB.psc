;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFRedMileR01_002DFEDB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
PlayerCompletedRedMile.SetValue(18)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE ffredmiler01questscript
Quest __temp = self as Quest
ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
;END AUTOCAST
;BEGIN CODE
Alias_Mei.GetActorRef().EvaluatePackage()

If FFRedMileR01Misc.IsRunning()
	FFRedMileR01Misc.SetStage(1000)
EndIf

SetObjectiveDisplayed(100)

;Turn on stage lights
Alias_StageLightsEnableMarker.GetRef().Enable()

;Clean up existing creatures, spawn new ones
kmyQuest.SpawnCreatures(0)

;Open Door
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE ffredmiler01questscript
Quest __temp = self as Quest
ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

;Prevent the player from Fast Traveling while running the Red Mile
kmyQuest.RMDisableFastTravel()

;Open Door to the Red Mile 
Alias_RedMileStartingDoor.GetRef().SetOpen(True)
;enable lights
Alias_DoorLightsEnableMarker.GetRef().Enable()
;Turn off stage lights
Alias_StageLightsEnableMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE ffredmiler01questscript
Quest __temp = self as Quest
ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

;Spawn new creatures after the Player hits the button
kmyQuest.SpawnCreatures(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
PlayerCompletedRedMile.Mod(1)
UpdateCurrentInstanceGlobal(PlayerCompletedRedMile)
DialogueRedMile.UpdateCurrentInstanceGlobal(PlayerCompletedRedMile)

;Close Door to the Red Mile 
Alias_RedMileStartingDoor.GetRef().SetOpen(False)
;Disable lights
Alias_DoorLightsEnableMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
;Close door to Red Mile Course 
Alias_RedMileStartingDoor.GetRef().SetOpen(False)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE ffredmiler01questscript
Quest __temp = self as Quest
ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

;Increment the run count. If the player has completed more than 
;the high score, grant a one-time bonus reward.
float runCountNewValue = FFRedMileR01_RunCount.Mod(1.0)

; ===== REWARDS =====
Actor playerRef = Game.GetPlayer()

; Always grant credits.
playerRef.AddItem(CreditsReward)

if runCountNewValue == 1
    ; Grant a reward for completing the Red Mile the first time.
    playerRef.AddItem(LL_Weapon_Pacifier_Unique_01)
elseif runCountNewValue == FFRedMileR01_RunCountRecord.GetValue()
    ; Grant a reward for becoming the Red Mile record holder.
    playerRef.AddItem(LL_Weapon_AA99_Unique_02)
    FFRedMileR01_BuildRewardMsg.Show()
else
    ; Grant standard reward
    playerRef.AddItem(LL_FFRedMileR01_Reward)
endif

;Reenable Fast Travel after the player finishes their Red Mile run.
kmyQuest.RMEnableFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN AUTOCAST TYPE ffredmiler01questscript
Quest __temp = self as Quest
ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
;Reenable Fast Travel after the player leaves and fails the quest.
kmyQuest.RMEnableFastTravel()

;Close the door to the course and turn off lights
Alias_RedMileStartingDoor.GetRef().SetOpen(False)
Alias_DoorLightsEnableMarker.GetRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property PlayerCompletedRedMile Auto Const Mandatory

Quest Property FFRedMileR01Misc Auto Const Mandatory

Quest Property DialogueRedMile Auto Const Mandatory

ReferenceAlias Property Alias_RedMileStartingDoor Auto Const Mandatory

RefCollectionAlias Property Alias_LightRotationHelpers Auto Const Mandatory

ReferenceAlias Property Alias_DoorLightsEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_StageLightsEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Mei Auto Const Mandatory

GlobalVariable Property FFRedMileR01_RunCount Auto Const Mandatory

GlobalVariable Property FFRedMileR01_RunCountRecord Auto Const Mandatory

LeveledItem Property LL_Weapon_AA99_Unique_02 Auto Const Mandatory

LeveledItem Property CreditsReward Auto Const

LeveledItem Property LL_FFRedMileR01_Reward Auto Const Mandatory

Message property FFRedMileR01_BuildRewardMsg auto const mandatory

LeveledItem Property LL_Weapon_Pacifier_Unique_01 Auto Const Mandatory
