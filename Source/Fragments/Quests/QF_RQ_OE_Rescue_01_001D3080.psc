;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RQ_OE_Rescue_01_001D3080 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
; Set the group to start asking for help
kmyquest.SetDialogueAV_Hello_Calm_PreAccept()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
; Set the group to stop asking for help.
kmyquest.SetDialogueAV_Hello_None()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(100)

kmyquest.SetDialogueAV_PrimaryObjectiveKnown()
kmyquest.SetDialogueAV_Hello_Calm_PostAccept()

; Add the Group's Overlay Map Marker to the map,

; in case it is not already discovered
Alias_OverlayMapMarker.GetRef().AddToMapScanned(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(300)

kmyquest.SetDialogueAV_SecondaryObjectiveKnown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveFailedIfNotCompleted(200)
SetObjectiveCompleted(300)
SetObjectiveDisplayed(500)

kmyquest.AddPassenger(Alias_Victim)
kmyquest.AddPassengers(Alias_Actors)
((self as Quest) as RQScript).SetDialogueAV_Hello_AboardShip()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(300)

kmyquest.SetDialogueAV_SecondaryObjectiveSuccess()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetStage(495)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0495_Item_00
Function Fragment_Stage_0495_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetDialogueAV_Hello_DepartingShip()
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

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
If GetStageDone(100)
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

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
; Set by OnDeath Script on the Captive Target Alias.
If GetStageDone(100)
   SetStage(990)
Else
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetStage(990)
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
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
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
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
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

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

ReferenceAlias Property Alias_Victim Auto Const Mandatory

ReferenceAlias Property Alias_Item Auto Const Mandatory

RefCollectionAlias Property Alias_Passengers Auto Const Mandatory

RefCollectionAlias Property Alias_Actors Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const Mandatory

ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const Mandatory

ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const Mandatory

ReferenceAlias Property Alias_OverlayMapMarker Auto Const Mandatory
