;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_LC088_Space_SD_225_Batter_0008D561 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE lc088_spacequestscript
lc088_spacequestscript kmyQuest = GetOwningQuest() as lc088_spacequestscript
;END AUTOCAST
;BEGIN CODE
kMyQuest.SD_PlayBatteryPhaseCompleteScene()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
