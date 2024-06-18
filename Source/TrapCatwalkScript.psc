Scriptname TrapCatwalkScript extends ObjectReference
{Breakable Catwalk trap script, catwalk breaks when it it hit by enough damage to exceed a threshold.}

Keyword Property LinkNavCutPrimitive Mandatory Const Auto

auto State Waiting
    Event OnDestroyed(ObjectReference akDestroyer)
            GoToState("Done")
            GetLinkedRef(LinkNavCutPrimitive).Enable()
    EndEvent
EndState

Event OnReset()
    self.ClearDestruction()
EndEvent

State Done
    ;Do Nothing
EndState