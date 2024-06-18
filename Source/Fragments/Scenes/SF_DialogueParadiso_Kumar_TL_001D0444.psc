;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueParadiso_Kumar_TL_001D0444 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
If FFParadisoZ03.IsCompleted()
	GetOwningQuest().SetStage(1303)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFParadisoZ03 Auto Const Mandatory
