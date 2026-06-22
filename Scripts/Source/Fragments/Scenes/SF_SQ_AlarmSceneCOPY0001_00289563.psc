;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_AlarmSceneCOPY0001_00289563 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE sq_alarmscript
sq_alarmscript kmyQuest = GetOwningQuest() as sq_alarmscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetAlarmed(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
