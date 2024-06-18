Scriptname LC119PuzzleButtonScript extends ObjectReference
{Turret puzzle button script for LC119.}

Keyword property LC119TurretKeyword Auto Const Mandatory
Keyword property LC119PuzzleDoorLink Auto Const Mandatory

Auto State Waiting
    Event OnActivate(ObjectReference akActionRef)
        GotoState("Done")
        GetLinkedRef(LC119PuzzleDoorLink).SetOpen()
        ObjectReference[] turretLinks = GetLinkedRefChain(LC119TurretKeyword)
        int i = 0
        While (i < turretLinks.Length)
            (turretLinks[i] as Actor).SetUnconscious(True)
            i += 1
        EndWhile
    EndEvent
EndState

State Done
EndState