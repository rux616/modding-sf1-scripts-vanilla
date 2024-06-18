;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RQ_Settlement_Rescue_01 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetDialogueAV_Hello_Stressed_PreAccept()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Actors.EvaluateAll()
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

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
; Add Map Markers to Map. Discover if not Discovered.
Alias_OverlayMapMarker.GetRef().AddToMapScanned(True)
kmyquest.SetDialogueAV_Hello_Stressed_PostAccept()
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
; move captive into position
SetStage(5)

SetObjectiveDisplayed(100)

kmyquest.SetDialogueAV_PrimaryObjectiveKnown()
kmyquest.SetDialogueAV_Hello_Stressed_PostAccept()

; Add Map Markers to Map. Discover if not Discovered.
Alias_DungeonMapMarker.GetRef().AddToMapScanned(True)

; allow captive blocking hellos again
Alias_CaptiveTarget.TryToSetValue(SQ_CaptiveStateNoBlockingHellos, 0)
Alias_QuestGiver.GetActorRef().SetProtected(True)

SetStage(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetStage(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Determine whether the player can do part 2
If Alias_DestinationLocation == NONE
   SetStage(475)
EndIf

SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
ObjectReference CaptiveMarker = Alias_CaptiveMarker.GetRef()
ObjectReference DungeonMarker = Alias_Item.GetRef()
Actor CaptiveNPC = Alias_CaptiveTarget.GetActorRef()

If CaptiveMarker
   CaptiveNPC.MoveTo(CaptiveMarker)
ElseIf DungeonMarker
   CaptiveNPC.MoveTo(DungeonMarker)
EndIf 

CaptiveNPC.Enable()
CaptiveNPC.EvaluatePackage()

; turn off captive blocking hellos so captive can have greeting
CaptiveNPC.SetValue(SQ_CaptiveStateNoBlockingHellos, 1)
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
defaultcaptivealias CaptiveNPC = Alias_CaptiveTarget as defaultcaptivealias

; free the captive
CaptiveNPC.FreePrisoner()
   
; Remind NPC to begin Following
CaptiveNPC.TryToEvaluatePackage()
Alias_CaptiveTarget.GetActorRef().SetProtected(False)

SetObjectiveCompleted(100)
SetObjectiveDisplayed(300)

Alias_CaptiveTarget.GetRef().AddKeyword(SQ_Captive_HasFollowWaitTopics)
kmyquest.SetDialogueAV_PrimaryObjectiveSuccess()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
Alias_BonusContainer.GetRef().AddItem(LL_OE_AlternativeReward)
SetStage(330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
;If !GetStageDone(350) 
;   SetObjectiveDisplayed(350)
;   SetObjectiveDisplayedAtTop(300)
;EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(350)
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
kmyquest.AddPassenger(Alias_CaptiveTarget)
kmyquest.AddPassengers(Alias_Actors)
((self as Quest) as RQScript).SetDialogueAV_Hello_AboardShip()

If !GetStageDone(425)
   SetStage(425)
EndIf

SetStage(405)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetObjectiveDisplayed(500)

kmyquest.SetDialogueAV_SecondaryObjectiveKnown()

Alias_DestinationMapMarker.GetRef().AddToMapScanned(True)

kmyQuest.AgreeToTransportPassenger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(300)
   SetObjectiveCompleted(300)
EndIf 

SetObjectiveCompleted(400)

Alias_QuestGiver.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
Alias_CaptiveTarget.GetRef().Removekeyword(SQ_Captive_HasFollowWaitTopics)
Alias_CaptiveTarget.GetActorRef().SetProtected(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetObjectiveDisplayed(400)

Alias_QuestGiver.GetActorRef().SetProtected(False)

If !GetStageDone(850) 
   SetStage(425)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
SetObjectiveCompleted(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 490")
kmyquest.SetDialogueAV_Hello_DepartingShip()

; Check if passengers are dead
If GetStageDone(810)
   SetObjectiveFailed(500)
   SetStage(990)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 500")
kmyquest.SetDialogueAV_Hello_Calm_Success()

; Check if passengers are dead
If GetStageDone(810)
   SetObjectiveFailed(500)
   SetStage(990)
Else
   SetObjectiveCompleted(500)
   SetStage(995)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetDialogueAV_SecondaryObjectiveFail()

; Set by OnDeath Script on the Quest Giver Alias.
If GetStageDone(75) && !GetStageDone(999)
   SetStage(990)
Else
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
; Stage is set by DefaultQuestChangeLocationScript
If GetStageDone(405) && !GetStageDone(995)
   SetStage(990)
Else
   SetStage(999)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0815_Item_00
Function Fragment_Stage_0815_Item_00()
;BEGIN CODE
; CaptiveTarget is NOT dead

If !GetStageDone(850)
   SetStage(820)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
SetStage(980)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetDialogueAV_PrimaryObjectiveFail()
SetObjectiveFailed(100)
SetObjectiveFailed(300)
SetObjectiveDisplayed(350)
SetStage(425)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_01
Function Fragment_Stage_0850_Item_01()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetDialogueAV_PrimaryObjectiveFail()
SetObjectiveFailed(100)
SetObjectiveFailed(300)
SetObjectiveDisplayed(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
If GetStageDone(300)
   SetStage(330)
Else
   SetStage(325)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
If GetStageDone(75) && !GetStageDone(999)
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
If GetStageDone(100) && !GetStageDone(999)
   SetStage(990)
Else
   SetStage(994)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN AUTOCAST TYPE rq_rescuescript
Quest __temp = self as Quest
rq_rescuescript kmyQuest = __temp as rq_rescuescript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
kmyquest.SetDialogueAV_PrimaryObjectiveSuccess()

If GetStageDone(825)
   kmyquest.SetDialogueAV_Hello_Stressed_Success()
Else
   kmyquest.SetDialogueAV_Hello_Calm_Success()
EndIf

SetStage(999)
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
FailAllObjectives()
kmyquest.SetDialogueAV_PrimaryObjectiveFail()
kmyquest.SetDialogueAV_Hello_Stressed_Failure()

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
CompleteAllObjectives()
kmyquest.SetDialogueAV_PrimaryObjectiveSuccess()

If GetStageDone(825)
   kmyquest.SetDialogueAV_Hello_Stressed_Success()
Else
   kmyquest.SetDialogueAV_Hello_Calm_Success()
EndIf

SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
If !GetStageDone(425)
   SetStage(425)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

ReferenceAlias Property Alias_CaptiveTarget Auto Const Mandatory

ReferenceAlias Property Alias_Item Auto Const Mandatory

RefCollectionAlias Property Alias_Passengers Auto Const Mandatory

RefCollectionAlias Property Alias_Actors Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const Mandatory

ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const Mandatory

ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const Mandatory

ReferenceAlias Property Alias_OverlayMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_CaptiveMarker Auto Const Mandatory

ActorValue Property SQ_CaptiveState Auto Const Mandatory

GlobalVariable Property SQ_CaptiveState_0_Unset Auto Const Mandatory

GlobalVariable Property SQ_CaptiveState_1_Captive Auto Const Mandatory

GlobalVariable Property SQ_CaptiveState_2_Freed Auto Const Mandatory

ReferenceAlias Property Alias_MysteryCaptiveMarker Auto Const Mandatory

ReferenceAlias Property Alias_Boss Auto Const Mandatory

ReferenceAlias Property Alias_QuestGiver Auto Const Mandatory

ReferenceAlias Property Alias_dungeonMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_DestinationMapMarker Auto Const Mandatory

LocationAlias Property Alias_destinationLocation Auto Const Mandatory

ReferenceAlias Property Alias_BonusContainer Auto Const Mandatory

ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const Mandatory

ReferenceAlias Property Alias_Container_Reward Auto Const Mandatory

LeveledItem Property LL_OE_AlternativeReward Auto Const Mandatory

ActorValue Property isPlayerKiller Auto Const Mandatory

Keyword Property SQ_Captive_HasFollowWaitTopics Auto Const Mandatory
