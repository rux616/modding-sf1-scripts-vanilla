;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RQ_Settlement_HarvestMine_0011BB87 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE RQ_HarvestMineScript
Quest __temp = self as Quest
RQ_HarvestMineScript kmyQuest = __temp as RQ_HarvestMineScript
;END AUTOCAST
;BEGIN CODE
; Set the group to stop asking for help.
kmyquest.SetDialogueAV_Hello_None()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE RQ_HarvestMineScript
Quest __temp = self as Quest
RQ_HarvestMineScript kmyQuest = __temp as RQ_HarvestMineScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(100)

kmyquest.SetDialogueAV_PrimaryObjectiveKnown()
kmyquest.SetDialogueAV_Hello_Calm_PostAccept()

; Add the Group's Overlay Map Marker to the map,

; in case it is not already discovered
Alias_OverlayMapMarker.GetRef().AddToMapScanned(true)

; add dungeon map marker to the map
Alias_MineralLocationMapMarker.GetRef().AddToMapScanned(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

If !GetStageDone(990)
   SetStage(995)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Set by OnDeath Script on the Quest Giver Alias.
If GetStageDone(100)
   SetStage(990)
Else
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
; Stage is set by DefaultQuestChangeLocationScript
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN AUTOCAST TYPE RQ_HarvestMineScript
Quest __temp = self as Quest
RQ_HarvestMineScript kmyQuest = __temp as RQ_HarvestMineScript
;END AUTOCAST
;BEGIN CODE
; If the player accepted the quest, it can be failed.
If GetStageDone(100)
   FailAllObjectives()
   kmyquest.SetDialogueAV_PrimaryObjectiveFail()
EndIf

SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0995_Item_00
Function Fragment_Stage_0995_Item_00()
;BEGIN AUTOCAST TYPE RQ_HarvestMineScript
Quest __temp = self as Quest
RQ_HarvestMineScript kmyQuest = __temp as RQ_HarvestMineScript
;END AUTOCAST
;BEGIN CODE
; If the quest has not been failed, the quest can be completed.
If !GetStageDone(990)
   CompleteAllObjectives()
   kmyquest.SetDialogueAV_PrimaryObjectiveSuccess()
   kmyquest.SetDialogueAV_Hello_Stressed_Success()
EndIf

SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_OverlayMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_MineralLocationMapMarker Auto Const Mandatory
