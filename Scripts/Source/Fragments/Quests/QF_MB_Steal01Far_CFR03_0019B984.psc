;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MB_Steal01Far_CFR03_0019B984 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_GuardSpawn.GetRef().EnableNoWait()
Alias_TargetContainer.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MissionStealQuestScript
Quest __temp = self as Quest
MissionStealQuestScript kmyQuest = __temp as MissionStealQuestScript
;END AUTOCAST
;BEGIN CODE
;Counter to check number of missions completed
CF_TheKey_MissionBoardCounter.Mod(1)
Alias_GuardSpawn.GetRef().DisableNoWait()
Alias_TargetContainer.GetRef().Disable()

kmyQuest.MissionComplete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE MissionStealQuestScript
Quest __temp = self as Quest
MissionStealQuestScript kmyQuest = __temp as MissionStealQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MissionFailed()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CF_TheKey_MissionBoardCounter Auto Const Mandatory

ReferenceAlias Property Alias_GuardSpawn Auto Const Mandatory

ReferenceAlias Property Alias_TargetContainer Auto Const Mandatory
