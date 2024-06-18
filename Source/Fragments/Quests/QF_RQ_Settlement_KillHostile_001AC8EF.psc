;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RQ_Settlement_KillHostile_001AC8EF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; quest started
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE rqscript
Quest __temp = self as Quest
rqscript kmyQuest = __temp as rqscript
;END AUTOCAST
;BEGIN CODE
; Set the group to stop asking for help.
kmyquest.SetDialogueAV_Hello_None()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE rqscript
Quest __temp = self as Quest
rqscript kmyQuest = __temp as rqscript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetDialogueAV_PrimaryObjectiveKnown()
kmyquest.SetDialogueAV_Hello_Stressed_PostAccept()

Alias_DungeonMapMarker.GetRef().AddToMapScanned()

; Add the Group's Overlay Map Marker to the map,
; in case it is not already discovered
Alias_OverlayMapMarker.GetRef().AddToMapScanned(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(100)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(150)
SetStage(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetStage(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
; player is Crimson Fleet
If GetStageDone(150)
   SetStage(260)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Direct Player to Complete Quest - Reward Scene
if IsObjectiveDisplayed(150)
  SetObjectiveCompleted(150)
  SetObjectiveDisplayed(100, false, false)
else
  SetObjectiveCompleted(100)
endif

SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
SetObjectiveFailed(150)

If GetStageDone(300)
   SetStage(350)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE rqscript
Quest __temp = self as Quest
rqscript kmyQuest = __temp as rqscript
;END AUTOCAST
;BEGIN CODE
; Player killed boss before learning about the quest; shutdown
If !GetStageDone(100)
    SetStage(999)
Else
    if GetStageDone(150)
       ; fail optional objective
       SetStage(260)
    endif
    SetObjectiveCompleted(100)
    SetStage(350)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(150)
   If !GetStageDone(250) && !GetStageDone(260)
      SetObjectiveSkipped(150)
   EndIf 
EndIf 

SetObjectiveDisplayed(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(350)

If !GetStageDone(990)
   SetStage(995)
Else
   SetStage(999)
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
; stage is set by defaultquestchangelocationscript
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN AUTOCAST TYPE rqscript
Quest __temp = self as Quest
rqscript kmyQuest = __temp as rqscript
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
;BEGIN AUTOCAST TYPE rqscript
Quest __temp = self as Quest
rqscript kmyQuest = __temp as rqscript
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

Perk Property FactionCrimsonFleetPerk Auto Const

MiscObject Property Credits Auto Const

GlobalVariable Property RQ_KillHostileHumans02_BossBribe Auto Const Mandatory

ReferenceAlias Property Boss Auto Const Mandatory
