;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueECS_Abe_Greeting__00089465 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
FFConstantR02MiscQuestStartKeyword.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
FFConstantR02Misc.SetStage(101)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property FFConstantR02MiscQuestStartKeyword Auto Const Mandatory

Quest Property FFConstantR02Misc Auto Const Mandatory
