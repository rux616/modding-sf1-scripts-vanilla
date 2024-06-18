;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_GuardShipsSceneCOPY000_001581ED Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE guardshipquestscript
guardshipquestscript kmyQuest = GetOwningQuest() as guardshipquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ClearScanStatus()
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

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN AUTOCAST TYPE guardshipquestscript
guardshipquestscript kmyQuest = GetOwningQuest() as guardshipquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.debugAlarmStatus()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
