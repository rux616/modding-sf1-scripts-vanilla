;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__020019CF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
;END AUTOCAST
;BEGIN CODE
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
; Allow quest to play unique Hellos
kmyquest.SetDialogueAV_Hello_None()
ObjectReference dungeonMapMarkerRef = Alias_DungeonMapMarker.GetRef()
dungeonMapMarkerRef.AddToMapScanned()
dungeonMapMarkerRef.SetMapMarkerCategory(0)

; Add the Group's Overlay Map Marker to the map,
; in case it is not already discovered
Alias_OverlayMapMarker.GetRef().AddToMapScanned(true)

; make ally of player
Alias_Questgiver.TryToAddToFaction(REPlayerAlly)

; Head toward the quest objective
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
AssaultBarkScene.Start()

; Don't initiate combat on the way there
Alias_QuestGiver.GetActorRef().SetValue(Game.GetAggressionAV(), 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Actor QuestGiver = Alias_QuestGiver.GetActorRef()
ObjectReference EdgeMarker = Alias_DungeonEdgeMarker.GetRef()

QuestGiver.MoveTo(EdgeMarker)
QuestGiver.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Resume normal aggression behavior and head toward the boss
Actor QuestGiver = Alias_QuestGiver.GetActorRef()
QuestGiver.SetValue(Game.GetAggressionAV(), 1)
QuestGiver.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
FailAllObjectives()
SetStage(990)
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
if !IsObjectiveDisplayed(200)
    ; Player killed creature before learning about the quest; shutdown
    SetStage(990)
else
    SetObjectiveCompleted(200)
    SetObjectiveDisplayed(300)
endif
Alias_QuestGiver.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(300)
SetStage(995)
kmyquest.SetDialogueAV_PrimaryObjectiveSuccess()
kmyquest.SetDialogueAV_Hello_Calm_Success()
Alias_QuestGiver.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
FailAllObjectives()
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0995_Item_00
Function Fragment_Stage_0995_Item_00()
;BEGIN CODE
; We don't need to be allies anymore.
Alias_Questgiver.TryToRemoveFromFaction(REPlayerAlly)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0997_Item_00
Function Fragment_Stage_0997_Item_00()
;BEGIN CODE
; Bounty Hunter unloaded after completing quest.
; Send back to wherever they came from.
Actor QuestGiver = Alias_QuestGiver.GetActorRef()

QuestGiver.MoveTo(Alias_CenterMarker.GetRef())
QuestGiver.EvaluatePackage()

SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const Mandatory

ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const Mandatory

ReferenceAlias Property Alias_dungeonMapMarker Auto Const

ReferenceAlias Property Alias_OverlayMapMarker Auto Const

ReferenceAlias Property Alias_QuestGiver Auto Const

ReferenceAlias Property Alias_DungeonEdgeMarker Auto Const Mandatory

Scene Property AssaultBarkScene Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const

Faction Property REPlayerAlly Auto Const Mandatory

ReferenceAlias Property Alias_CenterMarker Auto Const
