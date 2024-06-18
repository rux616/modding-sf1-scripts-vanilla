;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI08_0018B717 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE Ri08_QuestScript
Quest __temp = self as Quest
Ri08_QuestScript kmyQuest = __temp as Ri08_QuestScript
;END AUTOCAST
;BEGIN CODE
RI_Support.SetStage(2)

; Turn off generics on Executive floor
Alias_ExecutiveGenericNPCs.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(200)
Game.GetPlayer().MoveTo(Alias_MasakoOfficeQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(670) ; YES to Neuroamps
SetStage(680) ; YES to Infinity
SetStage(695) ; NO to Masako
SetStage(200)
Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(200)
SetStage(275)
SetStage(280)
SetStage(300)
SetStage(375)
SetStage(380)
SetStage(400)
SetStage(475)
SetStage(480)
SetStage(500)
SetStage(575)
SetStage(580)
SetStage(600)
SetStage(675)
SetStage(680)
SetStage(700)
SetStage(775)
SetStage(780)
SetStage(800)
;/
If RI08_InfinityYayCount.GetValue() == 0 && RI08_InfinityNayCount.GetValue() == 0
     RI08_InfinityYayCount.SetValue(7)
EndIf
If RI08_NeuroampYayCount.GetValue() == 0 && RI08_NeuroampNayCount.GetValue() == 0
     RI08_NeuroampNayCount.SetValue(7)
EndIf
If RI08_MasakoYayCount.GetValue() == 0 && RI08_MasakoNayCount.GetValue() == 0
     RI08_MasakoYayCount.SetValue(7)
EndIf
/;

Game.GetPlayer().MoveTo(Alias_ConferenceRoomQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(0)
;/ 
If RI08_InfinityYayCount.GetValue() == 0 && RI08_InfinityNayCount.GetValue() == 0
     RI08_InfinityNayCount.SetValue(7)
EndIf
If RI08_NeuroampYayCount.GetValue() == 0 && RI08_NeuroampNayCount.GetValue() == 0
     RI08_NeuroampNayCount.SetValue(7)
EndIf
If RI08_MasakoYayCount.GetValue() == 0 && RI08_MasakoNayCount.GetValue() == 0
     RI08_MasakoNayCount.SetValue(7)
EndIf
/;
SetStage(100)
SetStage(200)
SetStage(275)
SetStage(285)
SetStage(295)
SetStage(300)
SetStage(375)
SetStage(385)
SetStage(395)
SetStage(400)
SetStage(475)
SetStage(485)
SetStage(495)
SetStage(500)
SetStage(575)
SetStage(585)
SetStage(595)
SetStage(600)
SetStage(675)
SetStage(685)
SetStage(695)
SetStage(700)
SetStage(775)
SetStage(785)
SetStage(795)
SetStage(800)

Game.GetPlayer().MoveTo(Alias_ConferenceRoomQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(200) ; Talk to the Board Members
SetStage(300) ; Spoke to Alexis
SetStage(400) ; Spoke to Dalton
SetStage(500) ; Spoke to Genevieve
SetStage(600) ; Spoke to Linden
SetStage(700) ; Spoke to Ularu
SetStage(800) ; Spoke to Veena

If RI08_InfinityYayCount.GetValue() == 0 && RI08_InfinityNayCount.GetValue() == 0
     RI08_InfinityYayCount.SetValue(7)
EndIf
If RI08_NeuroampYayCount.GetValue() == 0 && RI08_NeuroampNayCount.GetValue() == 0
     RI08_NeuroampNayCount.SetValue(7)
EndIf
If RI08_MasakoYayCount.GetValue() == 0 && RI08_MasakoNayCount.GetValue() == 0
     RI08_MasakoYayCount.SetValue(7)
EndIf

SetStage(900) ; Attend the meeting
SetStage(1000) ; Talk to Masako

Game.GetPlayer().MoveTo(Alias_ConferenceRoomQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SetStage(0)
SetStage(100)
SetStage(200)
SetStage(300)
SetStage(400)
SetStage(500)
SetStage(600)
SetStage(700)
SetStage(800)

If RI08_InfinityYayCount.GetValue() == 0 && RI08_InfinityNayCount.GetValue() == 0
     RI08_InfinityNayCount.SetValue(7)
EndIf
If RI08_NeuroampYayCount.GetValue() == 0 && RI08_NeuroampNayCount.GetValue() == 0
     RI08_NeuroampNayCount.SetValue(7)
EndIf
If RI08_MasakoYayCount.GetValue() == 0 && RI08_MasakoNayCount.GetValue() == 0
     RI08_MasakoNayCount.SetValue(7)
EndIf

SetStage(900)
SetStage(1100)

Game.GetPlayer().MoveTo(Alias_ConferenceRoomQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)

; Swap Ularu's base furniture so she's using a chair instead of
; her computer.
Alias_UlaruChairSwapMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetActive()

If RI05_UlaruDead.GetValue() == 0
     ; Swap Ularu's base furniture so she's using a chair instead of
     ; her computer.
     Alias_UlaruChairSwapMarker.GetRef().Disable()
Else
     ModObjectiveGlobal(-1, RI08_BoardMemberTotal)
EndIf

SetObjectiveDisplayedAtTop(200)
SetObjectiveDisplayed(201) ; For acquiring Infinity LTD
SetObjectiveDisplayed(202) ; For continuing Neuroamp research
If GetStageDone(100) 
     SetObjectiveCompleted(100)
     SetObjectiveDisplayed(203) ; For keeping Masako as CEO
     ModObjectiveGlobal(1, RI08_MasakoYayCount, 203) ; Masako vote
     ModObjectiveGlobal(1, RI08_BoardMemberCount, 200) ; Ularu lobbied
EndIf

; Set Ularu's votes
If GetStageDone(670)
     ModObjectiveGlobal(1, RI08_NeuroampYayCount, 202)
EndIf
If GetStageDone(675)
     ModObjectiveGlobal(1, RI08_NeuroampNayCount, 202)
EndIf
If GetStageDone(680)
     ModObjectiveGlobal(1, RI08_InfinityYayCount, 201)
EndIf
If GetStageDone(685)
     ModObjectiveGlobal(1, RI08_InfinityNayCount, 202)
EndIf
If GetStageDone(695)
     ModObjectiveGlobal(1, RI08_MasakoNayCount, 203)
EndIf

; Set Masako's votes
ModObjectiveGlobal(1, RI08_BoardMemberCount, 200) ; Masako lobbied 
ModObjectiveGlobal(1, RI08_InfinityYayCount, 201)
ModObjectiveGlobal(1, RI08_NeuroampYayCount, 202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_NeuroampYayCount, 202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_NeuroampNayCount, 202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_InfinityYayCount, 201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0285_Item_00
Function Fragment_Stage_0285_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_InfinityNayCount, 201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_MasakoYayCount, 203)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0295_Item_00
Function Fragment_Stage_0295_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_MasakoNayCount, 203)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_BoardMemberCount, 200)

If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue()
     SetStage(900)
     Alias_Alexis.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
;RI08_VoteNeuroamps_YES.SetValue(RI08_VoteNeuroamps_YES.GetValue() + 1)
ModObjectiveGlobal(1, RI08_NeuroampYayCount, 202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
;RI08_VoteNeuroamps_NO.SetValue(RI08_VoteNeuroamps_NO.GetValue() + 1)
ModObjectiveGlobal(1, RI08_NeuroampNayCount, 202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
;RI08_VoteAcquireInfinity_YES.SetValue(RI08_VoteAcquireInfinity_YES.GetValue() + 1)
ModObjectiveGlobal(1, RI08_InfinityYayCount, 201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0385_Item_00
Function Fragment_Stage_0385_Item_00()
;BEGIN CODE
;RI08_VoteAcquireInfinity_NO.SetValue(RI08_VoteAcquireInfinity_NO.GetValue() + 1)
ModObjectiveGlobal(1, RI08_InfinityNayCount, 201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
;RI08_VoteMasakoCEO_YES.SetValue(RI08_VoteMasakoCEO_YES.GetValue() + 1)
ModObjectiveGlobal(1, RI08_MasakoYayCount, 203)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0395_Item_00
Function Fragment_Stage_0395_Item_00()
;BEGIN CODE
;RI08_VoteMasakoCEO_NO.SetValue(RI08_VoteMasakoCEO_NO.GetValue() + 1)
ModObjectiveGlobal(1, RI08_MasakoNayCount, 203)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_BoardMemberCount, 200)

If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue()
     SetStage(900)
     Alias_Dalton.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
;RI08_VoteNeuroamps_YES.SetValue(RI08_VoteNeuroamps_YES.GetValue() + 1)
ModObjectiveGlobal(1, RI08_NeuroampYayCount, 202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
;RI08_VoteNeuroamps_NO.SetValue(RI08_VoteNeuroamps_NO.GetValue() + 1)
ModObjectiveGlobal(1, RI08_NeuroampNayCount, 202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
;RI08_VoteAcquireInfinity_YES.SetValue(RI08_VoteAcquireInfinity_YES.GetValue() + 1)
ModObjectiveGlobal(1, RI08_InfinityYayCount, 201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0485_Item_00
Function Fragment_Stage_0485_Item_00()
;BEGIN CODE
;RI08_VoteAcquireInfinity_NO.SetValue(RI08_VoteAcquireInfinity_NO.GetValue() + 1)
ModObjectiveGlobal(1, RI08_InfinityNayCount, 201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
;RI08_VoteMasakoCEO_YES.SetValue(RI08_VoteMasakoCEO_YES.GetValue() + 1)
ModObjectiveGlobal(1, RI08_MasakoYayCount, 203)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0495_Item_00
Function Fragment_Stage_0495_Item_00()
;BEGIN CODE
;RI08_VoteMasakoCEO_NO.SetValue(RI08_VoteMasakoCEO_NO.GetValue() + 1)
ModObjectiveGlobal(1, RI08_MasakoNayCount, 203)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_BoardMemberCount, 200)

If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue()
     SetStage(900)
     Alias_Genevieve.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
;RI08_VoteNeuroamps_YES.SetValue(RI08_VoteNeuroamps_YES.GetValue() + 1)
ModObjectiveGlobal(1, RI08_NeuroampYayCount, 202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0575_Item_00
Function Fragment_Stage_0575_Item_00()
;BEGIN CODE
;RI08_VoteNeuroamps_NO.SetValue(RI08_VoteNeuroamps_NO.GetValue() + 1)
ModObjectiveGlobal(1, RI08_NeuroampNayCount, 202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0580_Item_00
Function Fragment_Stage_0580_Item_00()
;BEGIN CODE
;RI08_VoteAcquireInfinity_YES.SetValue(RI08_VoteAcquireInfinity_YES.GetValue() + 1)
ModObjectiveGlobal(1, RI08_InfinityYayCount, 201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0585_Item_00
Function Fragment_Stage_0585_Item_00()
;BEGIN CODE
;RI08_VoteAcquireInfinity_NO.SetValue(RI08_VoteAcquireInfinity_NO.GetValue() + 1)
ModObjectiveGlobal(1, RI08_InfinityNayCount, 201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN CODE
If RI05_Track_PlayerSidedWithUlaru.GetValue() == 1
     ModObjectiveGlobal(1, RI08_MasakoYayCount, 203)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0595_Item_00
Function Fragment_Stage_0595_Item_00()
;BEGIN CODE
If RI05_Track_PlayerSidedWithUlaru.GetValue() == 1
     ModObjectiveGlobal(1, RI08_MasakoNayCount, 203)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_BoardMemberCount, 200)

If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue()
     SetStage(900)
     Alias_Linden.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0670_Item_00
Function Fragment_Stage_0670_Item_00()
;BEGIN CODE
If !GetStageDone(100)
     ModObjectiveGlobal(1, RI08_NeuroampYayCount, 202)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0675_Item_00
Function Fragment_Stage_0675_Item_00()
;BEGIN CODE
If !GetStageDone(100)
     ModObjectiveGlobal(1, RI08_NeuroampNayCount, 202)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN CODE
If !GetStageDone(100)
     ModObjectiveGlobal(1, RI08_InfinityYayCount, 201)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0685_Item_00
Function Fragment_Stage_0685_Item_00()
;BEGIN CODE
If !GetStageDone(100)
     ModObjectiveGlobal(1, RI08_InfinityNayCount, 201)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
If !GetStageDone(100)
     ModObjectiveGlobal(1, RI08_MasakoYayCount, 203)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0695_Item_00
Function Fragment_Stage_0695_Item_00()
;BEGIN CODE
If !GetStageDone(100)
     ModObjectiveGlobal(1, RI08_MasakoNayCount, 203)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_BoardMemberCount, 200)

If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue()
     SetStage(900)
     Alias_Ularu.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0770_Item_00
Function Fragment_Stage_0770_Item_00()
;BEGIN CODE
;RI08_VoteNeuroamps_YES.SetValue(RI08_VoteNeuroamps_YES.GetValue() + 1)
ModObjectiveGlobal(1, RI08_NeuroampYayCount, 202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0775_Item_00
Function Fragment_Stage_0775_Item_00()
;BEGIN CODE
;RI08_VoteNeuroamps_NO.SetValue(RI08_VoteNeuroamps_NO.GetValue() + 1)
ModObjectiveGlobal(1, RI08_NeuroampNayCount, 202)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0780_Item_00
Function Fragment_Stage_0780_Item_00()
;BEGIN CODE
;RI08_VoteAcquireInfinity_YES.SetValue(RI08_VoteAcquireInfinity_YES.GetValue() + 1)
ModObjectiveGlobal(1, RI08_InfinityYayCount, 201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0785_Item_00
Function Fragment_Stage_0785_Item_00()
;BEGIN CODE
;RI08_VoteAcquireInfinity_NO.SetValue(RI08_VoteAcquireInfinity_NO.GetValue() + 1)
ModObjectiveGlobal(1, RI08_InfinityNayCount, 201)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0790_Item_00
Function Fragment_Stage_0790_Item_00()
;BEGIN CODE
;RI08_VoteMasakoCEO_YES.SetValue(RI08_VoteMasakoCEO_YES.GetValue() + 1)
ModObjectiveGlobal(1, RI08_MasakoYayCount, 203)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0795_Item_00
Function Fragment_Stage_0795_Item_00()
;BEGIN CODE
;RI08_VoteMasakoCEO_NO.SetValue(RI08_VoteMasakoCEO_NO.GetValue() + 1)
ModObjectiveGlobal(1, RI08_MasakoNayCount, 203)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
ModObjectiveGlobal(1, RI08_BoardMemberCount, 200)

If RI08_BoardMemberCount.GetValue() == RI08_BoardMemberTotal.GetValue()
     SetStage(900)
     Alias_Veena.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE Ri08_QuestScript
Quest __temp = self as Quest
Ri08_QuestScript kmyQuest = __temp as Ri08_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(201, False, False)
SetObjectiveDisplayed(202, False, False)
SetObjectiveDisplayed(203, False, False)
SetObjectiveDisplayedAtTop(900)

Alias_ConferenceRoomChairsEnableMarker.GetRef().Disable()

If RI05_UlaruDead.GetValue() == 0
     Alias_UlaruConferenceChair.GetRef().Enable()
     Alias_UlaruConferencePlayerChair.GetRef().Disable()
EndIf
Alias_DaltonConferenceChair.GetRef().Enable()
Alias_DaltonConferencePlayerChair.GetRef().Disable()
Alias_VeenaConferenceChair.GetRef().Enable()
Alias_VeenaConferencePlayerChair.GetRef().Disable()

Alias_Alexis.GetActorRef().EvaluatePackage()
Alias_Dalton.GetActorRef().EvaluatePackage()
Alias_Genevieve.GetActorRef().EvaluatePackage()
Alias_Linden.GetActorRef().EvaluatePackage()
Alias_Ularu.GetActorRef().EvaluatePackage()
Alias_Veena.GetActorRef().EvaluatePackage()
Alias_Masako.GetActorRef().EvaluatePackage()

kmyQuest.CalculateVotes()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0901_Item_00
Function Fragment_Stage_0901_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
Actor MasakoRef = Alias_Masako.GetActorRef()
Actor UlaruRef = Alias_Ularu.GetActorRef()
ObjectReference MoveMarkerRef = Alias_MasakoUlaruMoveToMarker.GetRef()
ObjectReference TriggerRef = Alias_PlayerEnteredConferenceRoomTrigger.GetRef()
If !PlayerRef.HasDetectionLOS(MasakoRef) && !TriggerRef.IsInTrigger(MasakoRef)
     MasakoRef.MoveTo(MoveMarkerRef)
EndIf
If !PlayerRef.HasDetectionLOS(UlaruRef) && !TriggerRef.IsInTrigger(UlaruRef) && RI05_UlaruDead.GetValue() == 0
     UlaruRef.MoveTo(MoveMarkerRef)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0905_Item_00
Function Fragment_Stage_0905_Item_00()
;BEGIN AUTOCAST TYPE Ri08_QuestScript
Quest __temp = self as Quest
Ri08_QuestScript kmyQuest = __temp as Ri08_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FreezeControlsMeeting()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0909_Item_00
Function Fragment_Stage_0909_Item_00()
;BEGIN CODE
SetStage(925)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN AUTOCAST TYPE Ri08_QuestScript
Quest __temp = self as Quest
Ri08_QuestScript kmyQuest = __temp as Ri08_QuestScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(927)
     SetObjectiveCompleted(927)
EndIf
If IsObjectiveDisplayed(925)
     SetObjectiveCompleted(925)
EndIf

If GetStageDone(918)
     If !IsObjectiveDisplayed(900)
          SetObjectiveDisplayed(900)
     EndIf
     If RI05_Track_PlayerSidedWithMasako.GetValue() == 1
          RI08_0910_Meeting_MasakoWinsScene.Start()
     Else 
          RI08_0910_Meeting_UlaruWinsScene.Start()
     EndIf
Else
     SetObjectiveDisplayed(925)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0911_Item_00
Function Fragment_Stage_0911_Item_00()
;BEGIN CODE
If RI05_UlaruDead.GetValue() == 0
     If GetStageDone(912) && GetStageDone(913) && GetStageDone(914) && GetStageDone(915) && GetStageDone(916) && GetStageDone(917)
          SetStage(918)
     EndIf
Else
     If GetStageDone(912) && GetStageDone(913) && GetStageDone(914) && GetStageDone(916) && GetStageDone(917)
          SetStage(918)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0912_Item_00
Function Fragment_Stage_0912_Item_00()
;BEGIN CODE
If RI05_UlaruDead.GetValue() == 0
     If GetStageDone(911) && GetStageDone(913) && GetStageDone(914) && GetStageDone(915) && GetStageDone(916)  && GetStageDone(917)
          SetStage(918)
     EndIf
Else
     If GetStageDone(911) && GetStageDone(913) && GetStageDone(914) && GetStageDone(916)  && GetStageDone(917)
          SetStage(918)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0913_Item_00
Function Fragment_Stage_0913_Item_00()
;BEGIN CODE
If RI05_UlaruDead.GetValue() == 0
     If GetStageDone(911) && GetStageDone(912) && GetStageDone(914) && GetStageDone(915) && GetStageDone(916) && GetStageDone(917)
          SetStage(918)
     EndIf
Else
     If GetStageDone(911) && GetStageDone(912) && GetStageDone(914)&& GetStageDone(916) && GetStageDone(917)
          SetStage(918)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0914_Item_00
Function Fragment_Stage_0914_Item_00()
;BEGIN CODE
If RI05_UlaruDead.GetValue() == 0
     If GetStageDone(911) && GetStageDone(912) && GetStageDone(913) && GetStageDone(915) && GetStageDone(916) && GetStageDone(917)
          SetStage(918)
     EndIf
Else
     If GetStageDone(911) && GetStageDone(912) && GetStageDone(913) && GetStageDone(916) && GetStageDone(917)
          SetStage(918)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0915_Item_00
Function Fragment_Stage_0915_Item_00()
;BEGIN CODE
If GetStageDone(911) && GetStageDone(912) && GetStageDone(913) && GetStageDone(914) && GetStageDone(916) && GetStageDone(917)
     SetStage(918)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0916_Item_00
Function Fragment_Stage_0916_Item_00()
;BEGIN CODE
If RI05_UlaruDead.GetValue() == 0
     If GetStageDone(911) && GetStageDone(912) && GetStageDone(913) && GetStageDone(914) && GetStageDone(915) && GetStageDone(917)
          SetStage(918)
     EndIf
Else
     If GetStageDone(911) && GetStageDone(912) && GetStageDone(913) && GetStageDone(916) && GetStageDone(917)
          SetStage(918)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0917_Item_00
Function Fragment_Stage_0917_Item_00()
;BEGIN CODE
If RI05_UlaruDead.GetValue() == 0
     If GetStageDone(911) && GetStageDone(912) && GetStageDone(913) && GetStageDone(914) && GetStageDone(915) && GetStageDone(916)
          SetStage(918)
     EndIf
Else
     If GetStageDone(911) && GetStageDone(912) && GetStageDone(913) && GetStageDone(914) && GetStageDone(916)
          SetStage(918)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0918_Item_00
Function Fragment_Stage_0918_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(925)
     SetObjectiveCompleted(925)
EndIf

Actor PlayerRef = Game.GetPlayer()
ObjectReference PlayerFurniture = PlayerRef.GetFurnitureUsing()
Debug.Trace(Self + " Stage 917 DONE: PlayerFurniture = " + PlayerFurniture)
If (PlayerRef.GetSitState() == 3) && PlayerFurniture.HasKeyword(RI08_PlayerFurnitureKeyword) == 1
     Utility.Wait(5)     
     SetStage(910)
Else
     Debug.Trace(Self + "Conditions Failed: SitStage = " + PlayerRef.GetSitState() + " Does furniture have keyword = " + PlayerFurniture.HasKeyword(RI08_PlayerFurnitureKeyword))
     SetStage(927)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
If !GetStageDone(915) && RI05_UlaruDead.GetValue() == 0
     Alias_Ularu.GetActorRef().SnapIntoInteraction(Alias_UlaruConferenceChair.GetRef())
EndIf
If !GetStageDone(916)
     Alias_Veena.GetActorRef().SnapIntoInteraction(Alias_VeenaConferenceChair.GetRef())
EndIf
If !GetStageDone(911)
     Alias_Alexis.GetActorRef().SnapIntoInteraction(Alias_AlexisConferenceChair.GetRef())
EndIf
If !GetStageDone(914)
     Alias_Linden.GetActorRef().SnapIntoInteraction(Alias_LindenConferenceChair.GetRef())
EndIf
If !GetStageDone(913)
     Alias_Genevieve.GetActorRef().SnapIntoInteraction(Alias_GenevieveConferenceChair.GetRef())
EndIf
If !GetStageDone(912)
     Alias_Dalton.GetActorRef().SnapIntoInteraction(Alias_DaltonConferenceChair.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0925_Item_00
Function Fragment_Stage_0925_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(925)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0927_Item_00
Function Fragment_Stage_0927_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(927)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN AUTOCAST TYPE Ri08_QuestScript
Quest __temp = self as Quest
Ri08_QuestScript kmyQuest = __temp as Ri08_QuestScript
;END AUTOCAST
;BEGIN CODE
RI08_UlaruRemainedCFO.SetValue(0)
kmyQuest.ModifyVotes()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0985_Item_00
Function Fragment_Stage_0985_Item_00()
;BEGIN CODE
RI08_UlaruRemainedCFO.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN AUTOCAST TYPE Ri08_QuestScript
Quest __temp = self as Quest
Ri08_QuestScript kmyQuest = __temp as Ri08_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ModifyVotes()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN AUTOCAST TYPE Ri08_QuestScript
Quest __temp = self as Quest
Ri08_QuestScript kmyQuest = __temp as Ri08_QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_Masako.GetActorRef().EvaluatePackage()
Alias_Ularu.GetActorRef().EvaluatePackage()

If IsObjectiveDisplayed(1000)
     SetObjectiveCompleted(1000)
ElseIf IsObjectiveDisplayed(1100)
     SetObjectiveCompleted(1100)
EndIf

If RI05_ImogeneDead.GetValue() == 0 && RI05_Track_PlayerSidedWithMasako.GetValue() == 1
     RI08_PostQuest.SetStage(100)
Else
     MissionBoardAccessAllowed_RI.SetValue(1)
     RI08_PostQuest.SetStage(200)     
EndIf

; Unlock door to player's office.
Alias_PlayerOfficeDoor.GetRef().Lock(False)

Game.GetPlayer().SetValue(RI08_Foreknowledge_QuestLineCompletedAV, 1)

If RI08_ContinuedNeuroampResearch.GetValue() == 1
     MQ305_RI_NeuroampPromoted.SetValue(1)
Else
     MQ305_RI_NeuroampNotPromoted.SetValue(1)
EndIf

;Send Affinity Event
COM_WantsToTalkEvent_RyujinFaction.Send()

;Achievement Unlocked
Game.AddAchievement(19)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE Ri08_QuestScript
Quest __temp = self as Quest
Ri08_QuestScript kmyQuest = __temp as Ri08_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)
kmyQuest.UnfreezeControlsMeeting()
Actor UlaruRef = Alias_Ularu.GetActorRef()

UlaruRef.MoveTo(Alias_UlaruOfficeQS.GetRef())
UlaruRef.EvaluatePackage()
Alias_RyujinIndustriesSecurity.GetRef().MoveTo(Alias_SecurityPostFurniture.GetRef())

(Game.GetPlayer().GetFurnitureUsing()).Activate(Game.GetPlayer())
Alias_Masako.GetActorRef().EvaluatePackage()
Alias_Alexis.GetActorRef().EvaluatePackage()
Alias_Dalton.GetActorRef().EvaluatePackage()
Alias_Genevieve.GetActorRef().EvaluatePackage()
Alias_Linden.GetActorRef().EvaluatePackage()
Alias_Veena.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE Ri08_QuestScript
Quest __temp = self as Quest
Ri08_QuestScript kmyQuest = __temp as Ri08_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1100)
kmyQuest.UnfreezeControlsMeeting()
Actor MasakoRef = Alias_Masako.GetActorRef()

MasakoRef.MoveTo(Alias_MasakoOfficeQS.GetRef())
MasakoRef.EvaluatePackage()
Alias_RyujinIndustriesSecurity.GetRef().MoveTo(Alias_SecurityGuardMasakoFurniture.GetRef())

(Game.GetPlayer().GetFurnitureUsing()).Activate(Game.GetPlayer())
Alias_Alexis.GetActorRef().EvaluatePackage()
Alias_Dalton.GetActorRef().EvaluatePackage()
Alias_Genevieve.GetActorRef().EvaluatePackage()
Alias_Linden.GetActorRef().EvaluatePackage()
Alias_Ularu.GetActorRef().EvaluatePackage()
Alias_Veena.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
Alias_ConferenceRoomChairsEnableMarker.GetRef().Enable()
If RI05_UlaruDead.GetValue() == 0
     Alias_UlaruConferenceChair.GetRef().Disable()
     Alias_UlaruConferencePlayerChair.GetRef().Enable()
EndIf
Alias_DaltonConferenceChair.GetRef().Disable()
Alias_DaltonConferencePlayerChair.GetRef().Enable()
Alias_VeenaConferenceChair.GetRef().Disable()
Alias_VeenaConferencePlayerChair.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property RI08_BoardMemberCount Auto Const Mandatory

ReferenceAlias Property Alias_MasakoOfficeQS Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

Faction Property RyujinIndustriesFaction Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

Perk Property Manipulation Auto Const Mandatory

Scene Property RI08_0910_Meeting_MasakoWinsScene Auto Const Mandatory

GlobalVariable Property RI08_BoardMemberTotal Auto Const Mandatory

ReferenceAlias Property Alias_ConferenceRoomQS Auto Const Mandatory

GlobalVariable Property RI08_InfinityYayCount Auto Const Mandatory

GlobalVariable Property RI08_InfinityNayCount Auto Const Mandatory

GlobalVariable Property RI08_NeuroampNayCount Auto Const Mandatory

GlobalVariable Property RI08_NeuroampYayCount Auto Const Mandatory

GlobalVariable Property RI08_MasakoYayCount Auto Const Mandatory

GlobalVariable Property RI08_MasakoNayCount Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

ReferenceAlias Property Alias_RyujinIndustriesSecurity Auto Const Mandatory

ReferenceAlias Property Alias_UlaruOfficeChair Auto Const Mandatory

ReferenceAlias Property Alias_SecurityPostFurniture Auto Const Mandatory

GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const Mandatory

GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const Mandatory

GlobalVariable Property RI08_AcquiredInfinity Auto Const Mandatory

GlobalVariable Property RI08_ContinuedNeuroampResearch Auto Const Mandatory

GlobalVariable Property RI08_MasakoRemainedCEO Auto Const Mandatory

ReferenceAlias Property Alias_UlaruOfficeQS Auto Const Mandatory

Scene Property RI08_0910_Meeting_UlaruWinsScene Auto Const Mandatory

ReferenceAlias Property Alias_MasakoOfficeChair Auto Const Mandatory

ReferenceAlias Property Alias_SecurityGuardMasakoFurniture Auto Const Mandatory

ReferenceAlias Property Alias_Alexis Auto Const Mandatory

ReferenceAlias Property Alias_Dalton Auto Const Mandatory

ReferenceAlias Property Alias_Genevieve Auto Const Mandatory

ReferenceAlias Property Alias_Linden Auto Const Mandatory

ReferenceAlias Property Alias_Veena Auto Const Mandatory

ReferenceAlias Property Alias_UlaruConferenceChair Auto Const Mandatory

ReferenceAlias Property Alias_VeenaConferenceChair Auto Const Mandatory

ReferenceAlias Property Alias_AlexisConferenceChair Auto Const Mandatory

ReferenceAlias Property Alias_DaltonConferenceChair Auto Const Mandatory

ReferenceAlias Property Alias_LindenConferenceChair Auto Const Mandatory

ReferenceAlias Property Alias_GenevieveConferenceChair Auto Const Mandatory

Quest Property RI08_PostQuest Auto Const Mandatory

GlobalVariable Property RI05_ImogeneDead Auto Const Mandatory

GlobalVariable Property MissionBoardAccessAllowed_RI Auto Const Mandatory

GlobalVariable Property RI_RadiantQuestGiver Auto Const Mandatory

ActorValue Property RI08_Foreknowledge_QuestLineCompletedAV Auto Const Mandatory

GlobalVariable Property MQ305_RI_NeuroampPromoted Auto Const Mandatory

GlobalVariable Property MQ305_RI_NeuroampNotPromoted Auto Const Mandatory

ReferenceAlias Property Alias_ExecutiveGenericNPCs Auto Const Mandatory

Perk Property Skill_Manipulation_InternalNeuroampBonus Auto Const Mandatory

GlobalVariable Property RI07_PlayerHasInternalNeuroamp Auto Const Mandatory

Quest Property RI07 Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

Quest Property RI_Support Auto Const Mandatory

ReferenceAlias Property Alias_UlaruChairSwapMarker Auto Const Mandatory

GlobalVariable Property RI05_UlaruDead Auto Const Mandatory

GlobalVariable Property RI08_UlaruRemainedCFO Auto Const Mandatory

Keyword Property RI08_PlayerFurnitureKeyword Auto Const Mandatory

ReferenceAlias Property Alias_ConferenceRoomChairsEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_UlaruConferencePlayerChair Auto Const Mandatory

ReferenceAlias Property Alias_VeenaConferencePlayerChair Auto Const Mandatory

ReferenceAlias Property Alias_DaltonConferencePlayerChair Auto Const Mandatory

ReferenceAlias Property Alias_MasakoUlaruMoveToMarker Auto Const Mandatory

ReferenceAlias Property Alias_PlayerEnteredConferenceRoomTrigger Auto Const Mandatory

ReferenceAlias Property Alias_PlayerOfficeDoor Auto Const Mandatory

AffinityEvent Property COM_WantsToTalkEvent_RyujinFaction Auto Const Mandatory
