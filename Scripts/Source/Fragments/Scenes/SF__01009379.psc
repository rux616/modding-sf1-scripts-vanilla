;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF__01009379 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE SQ_AlarmScript
SQ_AlarmScript kmyQuest = GetOwningQuest() as SQ_AlarmScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetAlarmed(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
