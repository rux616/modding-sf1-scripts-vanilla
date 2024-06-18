Scriptname MQ101BoringMachineScript extends ObjectReference Const

Quest Property MQ101 Mandatory Const Auto
Int Property iDrillStage=33 Const Auto

Event OnLoad()
    ;set to post-drill state if we've advanced far enough
    If MQ101.IsCompleted() || MQ101.GetStageDone(iDrillStage)
        Self.PlayAnimation("Stage2NoTransition")
    EndIf
EndEvent