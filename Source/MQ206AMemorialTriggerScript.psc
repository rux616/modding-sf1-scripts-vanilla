Scriptname MQ206AMemorialTriggerScript extends ReferenceAlias

Scene Property MQ206A_004_Casket Mandatory Const Auto

Auto State WaitingForPlayer
    Event OnActivate(ObjectReference akActionRef)
        If akActionRef == Game.GetPlayer()
            GotoState("HasBeenTriggered")
            MQ206A_004_Casket.Start()
            Utility.Wait(3.0) ;wait a few seconds for scene to start, then allow activation again
            GotoState("WaitingForPlayer")
        EndIf
    EndEvent
EndState

State HasBeenTriggered
    Event OnActivate(ObjectReference akActionRef)
        ;do nothing
    EndEvent
EndState