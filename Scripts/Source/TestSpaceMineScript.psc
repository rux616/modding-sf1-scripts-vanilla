Scriptname TestSpaceMineScript extends SpaceshipReference Const

Explosion Property SpaceMineExplosion01 auto const mandatory

ReferenceAlias Property PlayerShip auto const mandatory

Event OnLoad()
    RegisterForDistanceLessThanEvent(PlayerShip, self, 75.0)
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    debug.trace(self + " OnDistanceLessThan")
    Kill()
endEvent