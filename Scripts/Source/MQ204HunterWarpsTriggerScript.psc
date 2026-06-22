Scriptname MQ204HunterWarpsTriggerScript extends ObjectReference

Quest Property MQ204 Mandatory Const Auto
Int Property WarpPrereqStage=105 Const Auto
Int Property WarpTurnOffStage=600 Const Auto
Int CooldownTimer=10

Auto State WaitingForTrigger
    Event OnTriggerEnter(ObjectReference akActionRef)
        if akActionRef == Game.GetPlayer()
            If MQ204.GetStageDone(WarpPrereqStage)
                If MQ204.GetStageDone(WarpTurnOffStage)
                    ;disable if we're far enough along in the quest
                    Self.Disable()
                Else
                    GoToState("CooldownState")
                    ;call function in quest to move the Hunter
                    (MQ204 as MQ204Script).HunterWarps(Self.getLinkedRef())
                EndIf
            EndIf
        EndIf
    EndEvent
EndState

State CooldownState
    Event OnBeginState(string asOldState)
        StartTimer(10)
    EndEvent

    Event OnTriggerEnter(ObjectReference akActionRef)
        ;do nothing
    EndEvent

    Event OnTimer(int aiTimerID)
        GoToState("WaitingForTrigger")
    EndEvent
EndState