;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_GuardShipsSceneCOPY000_00211CA2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN AUTOCAST TYPE guardshipquestscript
guardshipquestscript kmyQuest = GetOwningQuest() as guardshipquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ShowContrabandScanWarning(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE guardshipquestscript
guardshipquestscript kmyQuest = GetOwningQuest() as guardshipquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ScanForContraband()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
