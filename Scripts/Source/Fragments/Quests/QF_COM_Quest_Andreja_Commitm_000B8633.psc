;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COM_Quest_Andreja_Commitm_000B8633 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;"lock in" companion to prevent player dismissing them:
SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as CompanionActorScript, TextReplaceActivator = COM_CQ_TxtReplace_QuestName_Andreja)


Alias_MapMarker.GetReference().Enable()
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
if IsObjectiveCompleted(10)==0
SetObjectiveCompleted(10)
endif
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE com_commitmentquestscript
Quest __temp = self as Quest
com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GiveCommitmentGift()
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE com_commitmentquestscript
Quest __temp = self as Quest
com_commitmentquestscript kmyQuest = __temp as com_commitmentquestscript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

kmyquest.MakeCommitted()

;"release the lock" companion to allow player dismissing them:
SQ_Companions.LockInCompanion(Alias_Andreja.GetActorReference() as CompanionActorScript, LockedIn = false)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Andreja Auto Const

sq_companionsscript Property SQ_Companions Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

Activator Property COM_CQ_TxtReplace_QuestName_Andreja Auto Const Mandatory
