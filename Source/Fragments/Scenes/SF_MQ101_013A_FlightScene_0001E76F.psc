;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_013A_FlightScene_0001E76F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE mq101script
mq101script kmyQuest = GetOwningQuest() as mq101script
;END AUTOCAST
;BEGIN CODE
; KMK - don't want to set stage 405 immediately if 485 is already done (since it does that)
if kmyquest.GetStageDone(485) == false
  kmyQuest.SetStage(405)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
