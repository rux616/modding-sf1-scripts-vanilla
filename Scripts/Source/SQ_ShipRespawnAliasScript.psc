Scriptname SQ_ShipRespawnAliasScript extends ReferenceAlias Const

Event OnDeath(ObjectReference akKiller)
    SpaceshipReference myShipRef = GetShipRef()
    debug.trace(self + " OnDeath - ref in alias=" + myShipRef + " IsDead? " + myShipRef.IsDead())
    ; call respawn function
    (GetOwningQuest() as SQ_ShipRespawnScript).HandleShipDeath(self)
EndEvent

