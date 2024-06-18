;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CREW_EliteCrew_CoraCoe_Gi_002EF26F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE COM_CoraBookGuard
COM_CoraBookGuard kmyQuest = GetOwningQuest() as COM_CoraBookGuard
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckCountAndOpenMenu()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE COM_CoraBookGuard
COM_CoraBookGuard kmyQuest = GetOwningQuest() as COM_CoraBookGuard
;END AUTOCAST
;BEGIN CODE
kmyQuest.CalculateReward()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Cora Auto Const Mandatory

FormList Property BookFormList Auto Const Mandatory

Keyword Property BookKeyword Auto Const Mandatory

GlobalVariable Property CoraBookGlobal Auto Const Mandatory

Scene Property CREW_EliteCrew_CoraCoe_GiveBooks Auto Const Mandatory

Int Property XPperbook Auto Const Mandatory
