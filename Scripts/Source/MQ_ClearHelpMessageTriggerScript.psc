Scriptname MQ_ClearHelpMessageTriggerScript extends ObjectReference

Auto State WaitingForPlayer
    Event OnTriggerEnter(ObjectReference akActionRef)
        If akActionRef == Game.GetPlayer()
            GotoState("HasBeenTriggered")
            Message.ClearHelpMessages()
            Self.Disable()
        EndIf
    EndEvent
EndState

State HasBeenTriggered
    Event OnTriggerEnter(ObjectReference akActionRef)
        ;empty
    EndEvent
EndState