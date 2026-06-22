Scriptname LC119RobotPodActivation extends ObjectReference
{Robot pod chain activation script for LC119.}

int property SparedLivvyStage = 400 Auto Const
int property LivvyBetrayStage = 475 Auto Const
Keyword property LinkCustom01 Auto Const Mandatory
Quest property MS04 Auto Const Mandatory

Auto State Waiting
    ;Check whether Livvy is set up to betray the player
    Event OnTriggerEnter(ObjectReference akActionRef)
        if (MS04.GetStageDone(SparedLivvyStage) && MS04.GetStageDone(LivvyBetrayStage))
            GoToState("Done")
            RobotPodScript[] linkedRobots = GetLinkedRefChain(LinkCustom01) as RobotPodScript[]
            int i = 0
            While (i < linkedRobots.Length)
                if (linkedRobots[i] != None)
                    linkedRobots[i].WakeRobotFromPod()
                EndIf
                i = i + 1
            EndWhile
        EndIf
    EndEvent
EndState

State Done
EndState