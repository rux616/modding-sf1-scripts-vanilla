;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CRWMarikaBoros_00014380 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
CRWMarikaHire.SetValue(CRWMarikaHire.GetValue() - 100)
UpdateCurrentInstanceGlobal(CRWMarikaHire)
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
kmyQuest.HireCrew(CRWMarikaHire.GetValue())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property CRWMarikaHire Auto Const Mandatory
