Scriptname TestKurtEventsScript extends ReferenceAlias
{trace events}

Event OnDeath(ObjectReference akKiller)
    debug.trace(self + " OnDeath akKiller=" + akKiller)
EndEvent

Event OnUnload()
    debug.trace(self + " OnUnload")
EndEvent

Event OnDestroyed(ObjectReference akDestroyer)
    debug.trace(self + " OnDestroyed akDestroyer=" + akDestroyer)
EndEvent

Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)
    debug.trace(self + " OnCombatStateChanged akTarget=" + akTarget + " aeCombatState=" + aeCombatState)
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    debug.trace(self + " OnLocationChange akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
EndEvent
