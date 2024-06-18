Scriptname TestSpaceshipReferenceScript extends SpaceshipReference Const

Event OnUnload()
    debug.trace(self + " OnUnload")
EndEvent

Event OnDestroyed(ObjectReference akDestroyer)
    debug.trace(self + " OnDestroyed akDestroyer=" + akDestroyer)
EndEvent

Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)
    debug.trace(self + " OnCombatStateChanged akTarget=" + akTarget + " aeCombatState=" + aeCombatState)
EndEvent

Function TestFaction(Faction akFaction)
	debug.trace(self + " GetFactionRank " + akFaction + "=" + GetFactionRank(akFaction))
	debug.trace(self + " IsInFaction " + akFaction + "=" + IsInFaction(akFaction))
EndFunction

Function TestDocking()
    debug.trace(self + " IsDocked = " + IsDocked())
    debug.trace(self + " IsDockedAsChild = " + IsDockedAsChild())
    debug.trace(self + " All Docked Ship = " + GetDockedShips())

    SpaceshipReference dockedShip = GetFirstDockedShip()
    if dockedShip != none
        debug.trace(self + " First Docked Ship = " + dockedShip)
        debug.trace(self + " IsDockedWith " + dockedShip + " = " + IsDockedWith(dockedShip))
    endIf
EndFunction

Function TestLanding()
    debug.trace(self + " IsLanded = " + IsLanded())
EndFunction

string Function GetPartName(int aiPartIndex)
    if aiPartIndex == 0
        return "weapon"
    ElseIf aiPartIndex == 1
        return "engine"
    ElseIf aiPartIndex == 2
        return "shields"
    ElseIf aiPartIndex == 3
        return "grav drive"
    EndIf
EndFunction

Function TestPowerAllocation()
    debug.trace(self + " has " + GetPartCount(0) + " weapon parts.")
    debug.trace(self + " has " + GetPartCount(1) + " engine parts.")
    debug.trace(self + " has " + GetPartCount(2) + " shields parts.")
    debug.trace(self + " has " + GetPartCount(3) + " grav drive parts.")

    int partType = 0
    While (partType < 4)
        int partCount = GetPartCount(partType)
        int partIndex = 0
        While (partIndex < partCount)
            int power = GetPartPower(partType, partIndex)
            debug.trace(self + " has " + power + " power allocated in its " + GetPartName(partType) + " #" + (partIndex+1))
            partIndex += 1
        EndWhile
        partType += 1
    EndWhile
EndFunction