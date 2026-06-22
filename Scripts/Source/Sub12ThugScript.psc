Scriptname Sub12ThugScript extends Actor Const

Faction property City_NA_Viewport03_GangFaction_Combat auto Const

Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)
    if(aeCombatState == 1)
        self.AddToFaction(City_NA_Viewport03_GangFaction_Combat)
    endIf
EndEvent