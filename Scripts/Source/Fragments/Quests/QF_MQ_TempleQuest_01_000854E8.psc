;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ_TempleQuest_01_000854E8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set player as having acquired the Artifacts
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(0)
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(1)
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(2)
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(3)
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(4)
(StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredArtifact(5)

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(3)

MQ_TurnOnTemples.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_01
Function Fragment_Stage_0005_Item_01()
;BEGIN CODE
;if Vladimir is disabled, point to the Eye trigger
Alias_EyeScanner.GetRef().Enable()
SetObjectiveDisplayed(5)

MQ_TurnOnTemples.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
MQ401EyeScanMSG.Show()
Utility.Wait(0.1)
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
MQ_TurnOnTemples.SetValueInt(1)
Alias_EyeScanner.GetRef().Disable()

;check if the player is going far away
If (Alias_PlanetUnexploredTraitClose.GetLocation() == None) && (Alias_PlanetExploredTrait.GetLocation() == None)
  ;if the player's ship grav jump range is too short, pop objective
  If Alias_PlayerShip.GetShipReference().GetGravJumpRange() < 28
    Setstage(12)
  EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveCompleted(3)
SetObjectiveDisplayed(10)

MQ_TurnOnTemples.SetValueInt(1)

;check if the player is going far away
If (Alias_PlanetUnexploredTraitClose.GetLocation() == None) && (Alias_PlanetExploredTrait.GetLocation() == None)
  ;if the player's ship grav jump range is too short, pop objective
  If Alias_PlayerShip.GetShipReference().GetGravJumpRange() < 28
    Setstage(12)
  EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN AUTOCAST TYPE MQCheckGravJumpQuestScript
Quest __temp = self as Quest
MQCheckGravJumpQuestScript kmyQuest = __temp as MQCheckGravJumpQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(7)

kmyquest.CheckSkillsMenu()

MQ_TutorialQuest.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
SetObjectiveCompleted(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
IF Alias_PlanetExploredTrait.GetLocation() == None
  SetObjectiveDisplayed(15)
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE MQ_Temple_SubScript
Quest __temp = self as Quest
MQ_Temple_SubScript kmyQuest = __temp as MQ_Temple_SubScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(15)
kmyquest.TempleDiscovered()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE MQ_Temple_SubScript
Quest __temp = self as Quest
MQ_Temple_SubScript kmyQuest = __temp as MQ_Temple_SubScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PowerReceived()
kmyquest.SpawnStarborn()

CompleteAllObjectives()
Stop()
Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_01
Function Fragment_Stage_0060_Item_01()
;BEGIN AUTOCAST TYPE MQ_Temple_SubScript
Quest __temp = self as Quest
MQ_Temple_SubScript kmyQuest = __temp as MQ_Temple_SubScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PowerReceived()

CompleteAllObjectives()
Stop()
Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_AnomalyMapMarker Auto Const Mandatory

Message Property MQ_TempleTutorialMSG Auto Const Mandatory

Quest Property MQ104A Auto Const Mandatory

LocationAlias Property Alias_PlanetExploredTrait Auto Const Mandatory

ReferenceAlias Property Alias_TempleMapMarker Auto Const Mandatory

GlobalVariable Property MQTempleQuest_HaveTempleObj Auto Const Mandatory

GlobalVariable Property MQ_TurnOnTemples Auto Const Mandatory

ReferenceAlias Property Alias_EyeScanner Auto Const Mandatory

ReferenceAlias Property Alias_VladimirSall Auto Const Mandatory

Message Property MQ401EyeScanMSG Auto Const Mandatory

ReferenceAlias Property Alias_TempleStarborn Auto Const Mandatory

ActorBase Property LvlStarborn_Boss_Aggro Auto Const Mandatory

ReferenceAlias Property Alias_TemplePrayMarker Auto Const Mandatory

LocationAlias Property Alias_TempleLocation Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

LocationAlias Property Alias_PlanetUnexploredTrait Auto Const Mandatory

LocationAlias Property Alias_PlanetUnexploredTraitClose Auto Const Mandatory

Quest Property StarbornTempleQuest Auto Const Mandatory

Quest Property MQ_TutorialQuest Auto Const Mandatory
