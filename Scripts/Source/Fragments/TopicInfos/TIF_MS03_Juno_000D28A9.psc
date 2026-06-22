;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MS03_Juno_000D28A9 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;play the shutdown audio
JunoShutdownEvent.Play(JunoEventMarker)
Utility.Wait(2)
SoundMarkerDisabler.Disable()

;turn off screens
Juno00.PlayAnimation("Play02")

;disable Juno interaction
JunoPromptTrigger.BlockActivation(true,true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property SoundMarkerDisabler Auto Const

WwiseEvent Property JunoShutdownEvent Auto Const

ObjectReference Property JunoEventMarker Auto Const

ObjectReference Property JunoPromptTrigger Auto Const

ObjectReference Property Juno00 Auto Const
