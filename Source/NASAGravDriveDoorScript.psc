Scriptname NASAGravDriveDoorScript extends ObjectReference Const

Quest Property MQ301 Mandatory Const Auto
Int Property iAnimatedStage = 170 Const Auto
String Property sAnimationEvent = "Opened" Const Auto

Event OnLoad()
    ;set to post-animated state if we've advanced far enough
    If MQ301.IsCompleted() || MQ301.GetStageDone(iAnimatedStage)
        Self.PlayAnimation("sAnimationEvent")
    EndIf
EndEvent