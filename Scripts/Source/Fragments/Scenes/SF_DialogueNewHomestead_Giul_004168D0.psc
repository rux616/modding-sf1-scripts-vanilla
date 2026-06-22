;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueNewHomestead_Giul_004168D0 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
If !FFNewHomesteadR02Misc.IsRunning()
	FFNewHomesteadR02MiscQuestStartKeyword.SendStoryEvent()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property FFNewHomesteadR02QuestStartKeyword Auto Const Mandatory

Keyword Property FFNewHomesteadR02MiscQuestStartKeyword Auto Const Mandatory

Quest Property FFNewHomesteadR02Misc Auto Const Mandatory
