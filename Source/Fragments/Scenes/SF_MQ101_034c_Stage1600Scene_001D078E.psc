;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_034c_Stage1600Scene_001D078E Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE mq101script
mq101script kmyQuest = GetOwningQuest() as mq101script
;END AUTOCAST
;BEGIN CODE
kmyquest.MQ101EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
