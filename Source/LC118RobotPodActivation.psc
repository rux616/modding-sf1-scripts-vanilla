Scriptname LC118RobotPodActivation extends ObjectReference
{Robot pod chain activation script for LC118.}

ObjectReference Property Robot1 Auto Const
ObjectReference Property Robot2 Auto Const
ObjectReference Property Robot3 Auto Const

Keyword property LinkCustom01 Auto Const Mandatory

Auto State Waiting
    Event OnTriggerEnter(ObjectReference akActionRef)
    GoToState("Done")
    RobotPodScript[] linkedRobots = GetLinkedRefChain(LinkCustom01) as RobotPodScript[]
    int i = 0
    While (i < linkedRobots.Length)
        if (linkedRobots[i] != None)
            linkedRobots[i].WakeRobotFromPod()
        EndIf
        i = i + 1
    EndWhile
    EndEvent
EndState

State Done
EndState