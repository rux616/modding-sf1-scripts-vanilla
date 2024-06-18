;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI08_PostQuest_000C41A4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE RI08_PostQuestScript
Quest __temp = self as Quest
RI08_PostQuestScript kmyQuest = __temp as RI08_PostQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartPostQuestTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
Alias_Imogene.GetRef().Enable()
Alias_Imogene.GetRef().MoveTo(Alias_ImogeneOfficeMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(100) == 1
     SetObjectiveCompleted(100)
     MissionBoardAccessAllowed_RI.SetValue(1)
EndIf

SetObjectiveDisplayed(200)

MissionStoryKeywordHack_RIR01.SendStoryEvent()
MissionStoryKeywordPlantEvidence_RIR02.SendStoryEvent()
MissionStoryKeywordSabotage_RIR04.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)

If GetStageDone(500)
     SetStage(10000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; If player acquired Infinity LTD
If RI08_AcquiredInfinity.GetValue() == 1
     LC044.SetStage(2000)
     LC051.SetStage(1000)
     Alias_InfinityRyujinEnableMarker.GetRef().Enable()
     Alias_InfinityPosterEnableMarker.GetRef().Disable()
     Alias_Angelo.GetRef().Disable()
     Alias_Stanley.GetRef().Disable()
Else
     Alias_InfinityShutdownEnableMarker.GetRef().Enable()
     Alias_InfinityDeziEnableMarker.GetRef().Disable()
     Alias_Angelo.GetRef().Disable()
     Alias_Stanley.GetRef().Disable()
     LC051.SetStage(2000)
EndIf

; If player withheld clinic names
If RI06_Track_PlayerWitholdsClinicNames.GetValue() == 1
     RI_Support.SetStage(2100)
EndIf

; If player sided with Ularu, but Masako won, and player told Masako
; that Imogene was innocent.
If RI05_Track_PlayerSidedWithUlaru.GetValue() == 1 && RI08_MasakoRemainedCEO.GetValue() == 1 && RI08.GetStageDone(1010)
     RI_Support.SetStage(4000)
EndIf 

; Still set stage 600 as a precaution - it should already be set.
SetStage(600)

If GetStageDone(300)
     SetStage(10000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Float fMasakoCEO = RI08_MasakoRemainedCEO.GetValue()

If fMasakoCEO == 1
     Alias_Ularu.GetRef().Disable()
ElseIf fMasakoCEO == 0
     Alias_Masako.GetRef().Disable()
     RI_Support.SetStage(3000)
EndIf

Alias_ExecutiveGenericNPCs.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MissionBoardAccessAllowed_RI Auto Const Mandatory

Keyword Property MissionStoryKeywordHack_RIR01 Auto Const Mandatory

Keyword Property MissionStoryKeywordPlantEvidence_RIR02 Auto Const Mandatory

Keyword Property MissionStoryKeywordSabotage_RIR04 Auto Const Mandatory

GlobalVariable Property RI08_AcquiredInfinity Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

ReferenceAlias Property Alias_InfinityShutdownEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_InfinityRyujinEnableMarker Auto Const Mandatory

GlobalVariable Property RI08_MasakoRemainedCEO Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

GlobalVariable Property RI06_Track_PlayerWitholdsClinicNames Auto Const Mandatory

Quest Property RI_Support Auto Const Mandatory

ReferenceAlias Property Alias_ExecutiveGenericNPCs Auto Const Mandatory

GlobalVariable Property RI05_Track_PlayerSidedWithUlaru Auto Const Mandatory

Quest Property RI08 Auto Const Mandatory

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

ReferenceAlias Property Alias_InfinityDeziEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_InfinityPosterEnableMarker Auto Const Mandatory

Quest Property LC051 Auto Const Mandatory

ReferenceAlias Property Alias_Angelo Auto Const Mandatory

ReferenceAlias Property Alias_Stanley Auto Const Mandatory

ReferenceAlias Property Alias_ImogeneOfficeMarker Auto Const Mandatory
