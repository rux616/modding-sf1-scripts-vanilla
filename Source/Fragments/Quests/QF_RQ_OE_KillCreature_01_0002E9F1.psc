;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RQ_OE_KillCreature_01_0002E9F1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
;END AUTOCAST
;BEGIN CODE
; Set the group to start asking for help
kmyquest.SetDialogueAV_Hello_Stressed_PreAccept()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
;END AUTOCAST
;BEGIN CODE
; Set the group to stop asking for help.
kmyquest.SetDialogueAV_Hello_None()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(100)

kmyquest.SetDialogueAV_PrimaryObjectiveKnown()
kmyquest.SetDialogueAV_Hello_Calm_PostAccept()

Alias_DungeonMapMarker.GetRef().AddToMapScanned()

; Add the Group's Overlay Map Marker to the map,
; in case it is not already discovered
Alias_OverlayMapMarker.GetRef().AddToMapScanned(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
;END AUTOCAST
;BEGIN CODE
; Shutdown if Player killed creatures before starting quest
If !IsObjectiveDisplayed(100)
    SetStage(999)
Else
    SetObjectiveCompleted(100)
    SetObjectiveDisplayed(300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetDialogueAV_PrimaryObjectiveSuccess()
kmyquest.SetDialogueAV_Hello_Calm_Success()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetStage(450)

If !GetStageDone(990)
   SetStage(995)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
;END AUTOCAST
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
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
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
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
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

ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const Mandatory

ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const Mandatory

ReferenceAlias Property Alias_dungeonMapMarker Auto Const

ReferenceAlias Property Alias_OverlayMapMarker Auto Const
