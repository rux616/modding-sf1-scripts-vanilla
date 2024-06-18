;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RQ_Settlement_Heal_01_Script Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RQ_Heal_01_Script
Quest __temp = self as Quest
RQ_Heal_01_Script kmyQuest = __temp as RQ_Heal_01_Script
;END AUTOCAST
;BEGIN CODE
; Pre-compute the Quest Giver's story by setting the appropriate AVs.
kmyquest.SetQuestHookDialogueAVs()

; Set the group to start asking for help
kmyquest.SetDialogueAV_Hello_Stressed_PreAccept()

; Move Wounded Person to the Marker
Alias_WoundedPerson.GetRef().MoveTo( Alias_WoundedMarker.GetRef() )

; Flag the wounded person as being hurt
Alias_WoundedPerson.GetActorRef().SetValue(SQ_WoundedState, SQ_WoundedState_1_Wounded.GetValue())

; Get into furniture
Alias_WoundedPerson.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Enable Wounded NPC since Player accepted the quest
Alias_WoundedPerson.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_QuestGiver.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE RQ_Heal_01_Script
Quest __temp = self as Quest
RQ_Heal_01_Script kmyQuest = __temp as RQ_Heal_01_Script
;END AUTOCAST
;BEGIN CODE
; Set the group to stop asking for help.
kmyquest.SetDialogueAV_Hello_None()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE RQ_Heal_01_Script
Quest __temp = self as Quest
RQ_Heal_01_Script kmyQuest = __temp as RQ_Heal_01_Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(100)

kmyquest.SetDialogueAV_Hello_Stressed_PostAccept()
kmyquest.SetDialogueAV_PrimaryObjectiveKnown()

Alias_DungeonMapMarker.GetRef().AddToMapScanned()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN AUTOCAST TYPE RQ_Heal_01_Script
Quest __temp = self as Quest
RQ_Heal_01_Script kmyQuest = __temp as RQ_Heal_01_Script
;END AUTOCAST
;BEGIN CODE
SetStage(10)
Alias_WoundedPerson.GetActorRef().Enable()
kmyquest.SetDialogueAV_PrimaryObjectiveKnown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE RQ_Heal_01_Script
Quest __temp = self as Quest
RQ_Heal_01_Script kmyQuest = __temp as RQ_Heal_01_Script
;END AUTOCAST
;BEGIN CODE
; Set the group to act as if the player has accepted the quest.
kmyquest.SetDialogueAV_Hello_Stressed_PostAccept()

SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
if Game.GetPlayer().GetItemCount(Aid_MedPack) >= 1
    Game.GetPlayer().RemoveItem(Aid_MedPack, 1)
endif

SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Flag the wounded person as being healed
DefaultCaptiveWoundedAlias captiveAlias = Alias_WoundedPerson as DefaultCaptiveWoundedAlias 
captiveAlias.HealActor()

; Get out of furniture
Alias_WoundedPerson.GetActorRef().EvaluatePackage()
Alias_WoundedPerson.GetActorRef().SetProtected(False)
Alias_WoundedPerson.GetRef().AddKeyword(SQ_Captive_HasFollowWaitTopics)

SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE RQ_Heal_01_Script
Quest __temp = self as Quest
RQ_Heal_01_Script kmyQuest = __temp as RQ_Heal_01_Script
;END AUTOCAST
;BEGIN CODE
kmyquest.SetDialogueAV_Hello_Stressed_Success()
kmyquest.SetDialogueAV_PrimaryObjectiveSuccess()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
Alias_QuestGiver.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE RQ_Heal_01_Script
Quest __temp = self as Quest
RQ_Heal_01_Script kmyQuest = __temp as RQ_Heal_01_Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(300)

Alias_WoundedPerson.GetRef().Removekeyword(SQ_Captive_HasFollowWaitTopics)

If !GetStageDone(990)
   SetStage(995)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE RQ_Heal_01_Script
Quest __temp = self as Quest
RQ_Heal_01_Script kmyQuest = __temp as RQ_Heal_01_Script
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
;BEGIN AUTOCAST TYPE RQ_Heal_01_Script
Quest __temp = self as Quest
RQ_Heal_01_Script kmyQuest = __temp as RQ_Heal_01_Script
;END AUTOCAST
;BEGIN CODE
If !GetStageDone(995)
   SetStage(990)
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
;BEGIN AUTOCAST TYPE RQ_Heal_01_Script
Quest __temp = self as Quest
RQ_Heal_01_Script kmyQuest = __temp as RQ_Heal_01_Script
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
;BEGIN AUTOCAST TYPE RQ_Heal_01_Script
Quest __temp = self as Quest
RQ_Heal_01_Script kmyQuest = __temp as RQ_Heal_01_Script
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

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Actor WoundedNPC = Alias_WoundedPerson.GetActorRef()

WoundedNPC.Removekeyword(SQ_Captive_HasFollowWaitTopics)
WoundedNPC.SetProtected(False)
WoundedNPC.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

ReferenceAlias Property Alias_WoundedPerson Auto Const Mandatory

RefCollectionAlias Property Alias_Actors Auto Const Mandatory

Potion Property Aid_MedPack Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

ActorValue Property SQ_WoundedState Auto Const Mandatory

GlobalVariable Property SQ_WoundedState_1_Wounded Auto Const Mandatory

GlobalVariable Property SQ_WoundedState_2_Healed Auto Const Mandatory

ReferenceAlias Property Alias_WoundedMarker Auto Const Mandatory

Keyword Property SQ_Captive_HasFollowWaitTopics Auto Const Mandatory

ReferenceAlias Property Alias_QuestGiver Auto Const Mandatory
