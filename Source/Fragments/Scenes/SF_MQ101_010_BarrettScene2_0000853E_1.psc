;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_010_BarrettScene2_0000853E_1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE mq101script
mq101script kmyQuest = GetOwningQuest() as mq101script
;END AUTOCAST
;BEGIN CODE
kmyquest.VSEnableLayer.DisablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE mq101script
mq101script kmyQuest = GetOwningQuest() as mq101script
;END AUTOCAST
;BEGIN CODE
kmyquest.VSEnableLayer.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
Game.StopDialogueCamera()
Game.ForceFirstPerson()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
