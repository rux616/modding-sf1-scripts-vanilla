;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Scenes:SF_CREW_EliteCrew_Muria_Recr_01083E71 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Crew_EliteCrewQuestScript kmyQuest = GetOwningQuest() as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpdateCost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN CODE
GetOwningQuest().UpdateCurrentInstanceGlobal(Crew_RecruitCost_TextReplacementValue)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Crew_RecruitCost_TextReplacementValue Auto Const Mandatory
