;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_FC06_AriWalkToTerminal_0004B1F7 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
FC06_AriSearchRecords.Start()
GetOwningQuest().SetStage(420)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property FC06_AriSearchRecords Auto Const Mandatory
