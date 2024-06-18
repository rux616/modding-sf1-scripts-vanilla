;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CF07_zLegacy006_Callout_H_001EB825 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
CF07_LegacyVoice_Shipwide.TryToMoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
LC107.StartBreachSequenceExplosions()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
WwiseEvent_QST_CF07_BlackScreen.Play(Game.GetPlayer())
GetOwningQuest().SetStage(395)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LC107QuestScript Property LC107 Auto Const

WwiseEvent Property WwiseEvent_QST_CF07_BlackScreen Auto Const Mandatory

ReferenceAlias Property CF07_LegacyVoice_Shipwide Auto Const
