Scriptname SQ_ShipRespawnCollectionScript extends RefCollectionAlias Const

Event OnDeath(ObjectReference akSource, ObjectReference akKiller)
    SpaceshipReference myShipRef = akSource as SpaceshipReference
    debug.trace(self + " OnDeath - ref in alias=" + myShipRef + " IsDead? " + myShipRef.IsDead())
    ; call respawn function
    (GetOwningQuest() as SQ_ShipRespawnScript).HandleShipDeathCollection(myShipRef)
EndEvent

