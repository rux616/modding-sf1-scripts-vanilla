;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueFCRyujinTower_Min_0000BF58 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
DemoMiniBot.GetActorRef().SetUnconscious(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
LC044_DRONEDemoRunning.SetValue(0)
DemoMiniBot.GetActorRef().SetUnconscious(True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property LC044_DRONEDemoRunning Auto Const Mandatory

ReferenceAlias Property DemoMiniBot Auto Const
