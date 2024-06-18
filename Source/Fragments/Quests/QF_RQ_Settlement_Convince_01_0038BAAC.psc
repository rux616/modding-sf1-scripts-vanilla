;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RQ_Settlement_Convince_01_0038BAAC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE rqscript
Quest __temp = self as Quest
rqscript kmyQuest = __temp as rqscript
;END AUTOCAST
;BEGIN CODE
; Set the group to start asking for help
kmyquest.SetDialogueAV_Hello_Stressed_PreAccept()

; Move the Target NPC to the correct furniture
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
ObjectReference TargetREF = Alias_TargetNPC.GetRef()
ObjectReference MarkerREF = Alias_TargetMarker.GetRef()

; Move the Target NPC to the correct furniture
TargetREF.Disable()
TargetREF.MoveTo(MarkerREF)
TargetREF.Enable()
(TargetREF as Actor).EvaluatePackage()
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
SetObjectiveCompleted(100)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN AUTOCAST TYPE rqscript
Quest __temp = self as Quest
rqscript kmyQuest = __temp as rqscript
;END AUTOCAST
;BEGIN CODE
If !GetStageDone(995)
   SetStage(990)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor targetNPC = Alias_TargetNPC.GetActorRef()

SetObjectiveDisplayed(300)

TargetNPC.SetProtected(False)
TargetNPC.AddKeyword(SQ_Captive_HasFollowWaitTopics)
TargetNPC.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE rqscript
Quest __temp = self as Quest
rqscript kmyQuest = __temp as rqscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(300)

Alias_TargetNPC.GetActorRef().RemoveKeyword(SQ_Captive_HasFollowWaitTopics)

If !GetStageDone(990)
   SetStage(995)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE rqscript
Quest __temp = self as Quest
rqscript kmyQuest = __temp as rqscript
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

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
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
;BEGIN AUTOCAST TYPE rqscript
Quest __temp = self as Quest
rqscript kmyQuest = __temp as rqscript
;END AUTOCAST
;BEGIN CODE
; If the player accepted the quest, it can be failed.
If GetStageDone(100)
   FailAllObjectives()
   kmyquest.SetDialogueAV_PrimaryObjectiveFail()
   kmyquest.SetDialogueAV_Hello_Stressed_Failure()
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

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

ReferenceAlias Property Alias_TargetNPC Auto Const Mandatory

RefCollectionAlias Property Alias_Actors Auto Const Mandatory

Potion Property Aid_MedPack Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

ActorValue Property SQ_WoundedState Auto Const Mandatory

GlobalVariable Property SQ_WoundedState_1_Wounded Auto Const Mandatory

ReferenceAlias Property Alias_TargetMarker Auto Const Mandatory 

ReferenceAlias Property Alias_OverlayMapMarker Auto Const Mandatory

LocationAlias Property Alias_TargetLocation Auto Const Mandatory

Keyword Property SQ_Captive_HasFollowWaitTopics Auto Const Mandatory
