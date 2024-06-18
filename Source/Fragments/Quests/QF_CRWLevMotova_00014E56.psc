;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CRWLevMotova_00014E56 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
CRWLevHire.SetValue(CRWLevHire.GetValue() - 100)
UpdateCurrentInstanceGlobal(CRWLevHire)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE CRWCrewScript
Quest __temp = self as Quest
CRWCrewScript kmyQuest = __temp as CRWCrewScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.HireCrew(CRWLevHire.GetValue())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE CRWQuestScript
Quest __temp = self as Quest
CRWQuestScript kmyQuest = __temp as CRWQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CrewFired()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CRWLevHire Auto Const Mandatory

ReferenceAlias Property Alias_LevMotova Auto Const Mandatory
