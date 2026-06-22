;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_AnchorpointZ02A_02037148 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_AnchrpointZ02QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_AnchrpointZ02QuestScript kmyQuest = __temp as SFBGS00D:SFFL_AnchrpointZ02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.GenerateEscorts()

SetObjectiveDisplayed(30)

; Close out the misc objective to talk to Maddies
If SFFL_DialogueAnchorpoint.IsObjectiveDisplayed(30)
  SFFL_DialogueAnchorpoint.SetStage(800)
endif
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
if !GetStageDone(40)
  Alias_CargoTargetRef.Clear()
  Alias_PrimaryRef.GetRef().RemoveItem(SFFL_AnchorpointZ02_Parts)
  Alias_PrimaryRef.GetRef().AddAliasedItem(SFFL_AnchorpointZ02_Parts_Damaged, Alias_DamagedRobotParts)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)

; Remove the quest items from the player
Game.GetPlayer().RemoveItem(Alias_CargoTargetRef.GetRef())
Game.GetPlayer().RemoveItem(Alias_DamagedRobotParts.GetRef())

; Update the global that controls repeatability
SFFL_AnchorpointZ02_RepeatGlobal.SetValue(1)

; Start the reset timer on the manager quest
SFFL_AnchorpointQuestRepeatManager.SetStage(100)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CF_TheKey_MissionBoardCounter Auto Const Mandatory

ReferenceAlias Property Alias_CargoTargetRef Auto Const Mandatory

ObjectReference Property SFFL_AnchorpointZ02_PT1 Auto Const Mandatory

Quest Property SFFL_DialogueAnchorpoint Auto Const Mandatory

GlobalVariable Property SFFL_AnchorpointZ02_RepeatGlobal Auto Const Mandatory

LocationAlias Property Alias_TargetPlanetOrbitLocation Auto Const Mandatory

RefCollectionAlias Property Alias_SpaceCellRefs Auto Const Mandatory

ReferenceAlias Property Alias_SpawnMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_SpaceMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_PrimaryRef Auto Const Mandatory

LocationAlias Property Alias_TargetShipInteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_CaptainsLocker Auto Const Mandatory

ReferenceAlias Property Alias_DamagedRobotParts Auto Const Mandatory

MiscObject Property SFFL_AnchorpointZ02_Parts_Damaged Auto Const Mandatory

MiscObject Property SFFL_AnchorpointZ02_Parts Auto Const Mandatory

Quest Property SFFL_AnchorpointQuestRepeatManager Auto Const Mandatory
