;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COM_Quest_Barrett_Commitm_001C7185 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
ObjectReference EllieRef = Alias_Ellie.GetRef()
ObjectReference ChairRef = EllieRef.GetLinkedRef()

EllieRef.MoveTo(ChairRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
If GetStageDone(51) || GetStageDone(52) 
   SetStage(100)
Else
   SetObjectiveDisplayed(50)
EndIf 

; Convert AV to Global for now to compare in a condition
GlobalTimesMarried.SetValue( Game.GetPlayer().GetValue(AVTimesMarried) as Int )

Actor BarrettRef = Alias_Barrett.GetActorReference()

;"lock in" companion to prevent player dismissing them:
SQ_Companions.SetRoleActive(BarrettRef)
SQ_Companions.LockInCompanion(BarrettRef as CompanionActorScript, CustomMessage = BQ01_BarrettCommitmentMSG, TextReplaceActivator = COM_CQ_TxtReplace_QuestName_Barrett)
COM_BQ01_WaitToggle.SetValue(1)
SQ_Followers.CommandFollow(BarrettRef)
SetStage(87)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
ObjectReference EllieRef = Alias_Ellie.GetRef()
ObjectReference ChairRef = EllieRef.GetLinkedRef()

EllieRef.MoveTo(ChairRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0071_Item_00
Function Fragment_Stage_0071_Item_00()
;BEGIN CODE
SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0072_Item_00
Function Fragment_Stage_0072_Item_00()
;BEGIN CODE
SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0073_Item_00
Function Fragment_Stage_0073_Item_00()
;BEGIN CODE
SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0074_Item_00
Function Fragment_Stage_0074_Item_00()
;BEGIN CODE
SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0076_Item_00
Function Fragment_Stage_0076_Item_00()
;BEGIN CODE
SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0079_Item_00
Function Fragment_Stage_0079_Item_00()
;BEGIN CODE
SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0081_Item_00
Function Fragment_Stage_0081_Item_00()
;BEGIN CODE
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0082_Item_00
Function Fragment_Stage_0082_Item_00()
;BEGIN CODE
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0083_Item_00
Function Fragment_Stage_0083_Item_00()
;BEGIN CODE
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0084_Item_00
Function Fragment_Stage_0084_Item_00()
;BEGIN CODE
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0088_Item_00
Function Fragment_Stage_0088_Item_00()
;BEGIN AUTOCAST TYPE com_commitmentquestscript
Quest __temp = self as Quest
com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.GiveCommitmentGift()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN CODE
If GetStageDone(52)
   SetStage(190)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0092_Item_00
Function Fragment_Stage_0092_Item_00()
;BEGIN CODE
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0093_Item_00
Function Fragment_Stage_0093_Item_00()
;BEGIN CODE
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0094_Item_00
Function Fragment_Stage_0094_Item_00()
;BEGIN CODE
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
SetStage(190)
Alias_BarrettCommitmentPosition.ForceRefTo(Alias_Xmarker_Lodge_Barrett.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0096_Item_00
Function Fragment_Stage_0096_Item_00()
;BEGIN CODE
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)

If GetStageDone(52)
   SetObjectiveDisplayed(110)
Else
   SetObjectiveDisplayed(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(110)

SetStage(201)

If GetStageDone(52)
   SetStage(300)
Else
   SetStage(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
SetStage(520)  ;Start moving Ellie into position
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, MediumCredits.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetStage(60)
SetStage(350)
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_01
Function Fragment_Stage_0320_Item_01()
;BEGIN CODE
Alias_Ellie.GetRef().MoveTo(Alias_Xmarker_LibertySquare_Ellie.GetRef())
Alias_BarrettCommitmentPosition.ForceRefTo(Alias_Xmarker_LibertySquare_Barrett.GetRef())
ObjectReference BarrettRef = Alias_Barrett.GetRef()
ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef()

if BarrettRef.GetDistance(BarrettPosition) > 5
   BarrettRef.MoveTo(BarrettPosition)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_02
Function Fragment_Stage_0320_Item_02()
;BEGIN CODE
Alias_Ellie.GetActorRef().EvaluatePackage()
Alias_BarrettCommitmentPosition.ForceRefTo(Alias_Xmarker_LawOffice_Barrett01.GetRef())
ObjectReference BarrettRef = Alias_Barrett.GetRef()
ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef()

if BarrettRef.GetDistance(BarrettPosition) > 5
   BarrettRef.MoveTo(BarrettPosition)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_03
Function Fragment_Stage_0320_Item_03()
;BEGIN CODE
Alias_Ellie.GetActorRef().EvaluatePackage()
Alias_BarrettCommitmentPosition.ForceRefTo(Alias_XMarker_LizzyBar_Barrett.GetRef())
ObjectReference BarrettRef = Alias_Barrett.GetRef()
ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef()

if BarrettRef.GetDistance(BarrettPosition) > 5
   BarrettRef.MoveTo(BarrettPosition)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
ObjectReference BarrettRef = Alias_Barrett.GetRef()
ObjectReference BarrettPosition = Alias_BarrettCommitmentPosition.GetRef()

if BarrettRef.GetDistance(BarrettPosition) > 10
   BarrettRef.MoveTo(BarrettPosition)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Alias_Vasco.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_01
Function Fragment_Stage_0400_Item_01()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_02
Function Fragment_Stage_0400_Item_02()
;BEGIN CODE
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveCompleted(300)
SetObjectiveDisplayed(500)
Actor VascoRef = Alias_Vasco.GetActorRef()
SetStage(60)

If GetStageDone(51)  ; Vasco officiates
   SetStage(510)
    if GetStageDone(95)
        VascoRef.EvaluatePackage()
    endif
Else                 ; Ellie officiates
   SetStage(505)
EndIf

(SQ_Crew as SQ_CrewScript).SetRoleInactive(ActorToUpdate=VascoREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
CrewGoingToOutposts.RemoveRef(VascoREF)
DisembarkingCrew.RemoveRef(VascoREF)
DismissedCrew.RemoveRef(VascoREF)
VascoRef.SetValue(CrewReassignDisabled, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN CODE
Actor VascoRef = Alias_Vasco.GetActorRef()
VascoRef.MoveTo(Alias_Xmarker_Lodge_Vasco.GetRef())
VascoRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
Alias_Ellie.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
If GetStageDone(90)
   SQ_Followers.SetRoleActive(Alias_Vasco.GetActorRef())
   SQ_Followers.CommandFollow(Alias_Vasco.GetActorRef())
   Alias_Vasco.TryToEvaluatePackage()
Else
   Alias_Vasco.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0535_Item_00
Function Fragment_Stage_0535_Item_00()
;BEGIN CODE
SetStage(5000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0557_Item_00
Function Fragment_Stage_0557_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveCompleted(300)
SetObjectiveCompleted(400)
SetStage(60)
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0558_Item_00
Function Fragment_Stage_0558_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveCompleted(300)
SetObjectiveCompleted(400)
SetStage(60)
SetStage(500)

;Alias_Vasco.GetRef().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4000_Item_00
Function Fragment_Stage_4000_Item_00()
;BEGIN CODE
;"release the lock" companion to allow player dismissing them:
SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as CompanionActorScript, LockedIn = false, CustomMessage = BQ01_BarretCommitmentQuestOverMSG)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5000_Item_00
Function Fragment_Stage_5000_Item_00()
;BEGIN AUTOCAST TYPE com_commitmentquestscript
Quest __temp = self as Quest
com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
COM_Companion_Barrett.SetStage(1000)
SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as CompanionActorScript, LockedIn = false, CustomMessage = BQ01_BarretCommitmentQuestOverMSG)
COM_BQ01_WaitToggle.SetValue(0)
kmyquest.MakeCommitted()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6000_Item_00
Function Fragment_Stage_6000_Item_00()
;BEGIN CODE
;"release the lock" companion to allow player dismissing them:
SQ_Companions.LockInCompanion(Alias_Barrett.GetActorReference() as CompanionActorScript, LockedIn = false, CustomMessage = BQ01_BarretCommitmentQuestOverMSG)
COM_Companion_Barrett.SetStage(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Actor VascoRef = Alias_Vasco.GetActorRef()
if VascoRef.GetValue(CrewReassignDisabled) == 1
    VascoRef.SetValue(CrewReassignDisabled, 0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property BQ01_ForeknowledgeBarrettAV Auto Const Mandatory

Quest Property COM_Companion_Barrett Auto Const Mandatory

GlobalVariable Property MediumCredits Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_XMarker_LibertySquare_Ellie Auto Const Mandatory

ReferenceAlias Property Alias_XMarker_GuestHome_Ellie Auto Const Mandatory

ReferenceAlias Property Alias_XMarker_LawOffice_Ellie Auto Const Mandatory

ReferenceAlias Property Alias_XMarker_LizzyBar_Ellie Auto Const Mandatory

ReferenceAlias Property Alias_Ellie Auto Const Mandatory

ReferenceAlias Property Alias_Vasco Auto Const Mandatory

SQ_FollowersScript Property SQ_Followers Mandatory Const Auto

GlobalVariable Property GlobalTimesMarried Auto Const Mandatory

ActorValue Property AVTimesEnteredUnity Auto Const Mandatory

ActorValue Property AVTimesMarried Auto Const Mandatory

Scene Property COM_Scene_Barrett_Commitment_Vasco_GREET_AskToOfficiate Auto Const Mandatory

SQ_CompanionsScript Property SQ_Companions Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

Message Property BQ01_BarrettCommitmentMSG Auto Const Mandatory

Message Property BQ01_BarretCommitmentQuestOverMSG Auto Const Mandatory

ReferenceAlias Property Alias_BarrettCommitmentPosition Auto Const Mandatory

ReferenceAlias Property Alias_XMarker_LibertySquare_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_XMarker_LawOffice_Barrett01 Auto Const Mandatory

ReferenceAlias Property Alias_XMarker_Lodge_Barrett Auto Const Mandatory

MiscObject Property CommitmentGift_Barrett_MiscObj Auto Const Mandatory

ReferenceAlias Property HarveyGiftName Auto Const Mandatory

ReferenceAlias Property Alias_XMarker_LizzyBar_Barrett Auto Const Mandatory

ReferenceAlias Property Alias_XMarker_Lodge_Vasco Auto Const Mandatory

Activator Property COM_CQ_TxtReplace_QuestName_Barrett Auto Const Mandatory

sq_crewscript Property SQ_Crew Auto Const Mandatory

ActorValue Property CrewReassignDisabled Auto Const Mandatory

RefCollectionAlias Property DisembarkingCrew Auto Const Mandatory

RefCollectionAlias Property DismissedCrew Auto Const Mandatory

RefCollectionAlias Property CrewGoingToOutposts Auto Const Mandatory

GlobalVariable Property COM_BQ01_WaitToggle Auto Const Mandatory
