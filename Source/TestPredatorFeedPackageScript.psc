Scriptname TestPredatorFeedPackageScript extends Package
{testing resetting package when entering combat}

Actor combatTarget

Event OnStart(Actor akActor)
    RegisterForRemoteEvent(akActor, "OnCombatStateChanged")
EndEvent

Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, int aeCombatState)
    Debug.Trace(self + " OnCombatStateChanged akTarget=" + akTarget + " aecombatstate=" + aeCombatState + " combatTarget=" + combatTarget)
    if aeCombatState == 1 && akTarget != combatTarget
        debug.trace(self + " starting combat - resetAI")
        combatTarget = akTarget as Actor
        akSource.EvaluatePackage(true)
    endif
endEvent