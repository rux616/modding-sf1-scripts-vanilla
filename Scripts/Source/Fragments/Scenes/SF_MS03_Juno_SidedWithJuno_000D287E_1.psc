;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS03_Juno_SidedWithJuno_000D287E_1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Game.StopDialogueCamera()

;turn off screens
Juno00.PlayAnimation("Play02")

;disable Juno interaction
JunoPromptTrigger.BlockActivation(true,true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN CODE
Juno00.PlayAnimation("SequenceA03")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Juno00 Auto Const

ObjectReference Property JunoPromptTrigger Auto Const
