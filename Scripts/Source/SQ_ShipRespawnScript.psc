Scriptname SQ_ShipRespawnScript extends Quest

ReferenceAlias property ShipRespawnPoint auto const mandatory
{ where to respawn ships }

RefCollectionAlias property ShipRespawnCollection auto Const
{ OPTIONAL - if respawning ships in a ref collection }

int respawnAliasTimerID = 1 Const
int respawnShipTimerID = 2 Const

float property respawnTimeSeconds = 120.0 auto const
{ how long between respawn tries }

; TEMP
ActorValue property SpaceshipCrew auto const

Guard respawnArrayGuard

ReferenceAlias[] respawnAliases RequiresGuard(respawnArrayGuard)
SpaceshipReference[] respawnShips RequiresGuard(respawnArrayGuard)

Event OnQuestInit()
    LockGuard respawnArrayGuard
        respawnAliases = new ReferenceAlias[0]
        respawnShips = new SpaceshipReference[0]
    EndLockGuard
EndEvent

function HandleShipDeath(ReferenceAlias shipAlias)
    debug.trace(self + " HandleShipDeath " + shipAlias)
    if AllowRespawn()
        ; respawn ship
        LockGuard respawnArrayGuard
            RespawnShip(shipAlias.GetShipRef(), shipAlias)
        EndLockGuard
    Else
        ; add to respawn array and run timer
        AddToRespawnArray(shipAlias)
    EndIf
EndFunction

function HandleShipDeathCollection(SpaceshipReference shipRef)
    debug.trace(self + " HandleShipDeathCollection " + shipRef)
    if AllowRespawn()
        ; respawn ship
        LockGuard respawnArrayGuard
            RespawnShip(shipRef)
        EndLockGuard
    Else
        ; add to respawn array and run timer
        AddToRespawnShipArray(shipRef)
    EndIf
EndFunction

bool function AllowRespawn()
    bool bAllowRespawn = false
    ObjectReference respawnMarker = ShipRespawnPoint.GetRef()
    if respawnMarker
        ; don't respawn if player is in same orbit as respawn point
        Planet respawnPlanet = respawnMarker.GetCurrentPlanet()
        ; get player's current ship if any
        SpaceshipReference playerShipRef = Game.GetPlayer().GetCurrentShipRef()
        if playerShipRef == NONE || playerShipRef.IsInSpace() == false || playerShipRef.GetCurrentPlanet() != respawnPlanet
            bAllowRespawn = true
        EndIf
    Else
        Game.Warning(self + " AllowRespawn: No respawn marker - unable to respawn ships")
    EndIf
    debug.trace(self + " AllowRespawn=" + bAllowRespawn)
    return bAllowRespawn
EndFunction

; if shipAlias is not provided, will respawn into ShipRespawnCollection
Function RespawnShip(SpaceshipReference shipRef, ReferenceAlias shipAlias=NONE) RequiresGuard(respawnArrayGuard)
    ObjectReference respawnMarker = ShipRespawnPoint.GetRef()
    debug.trace(self + " RespawnShip shipRef=" + shipRef + " shipAlias=" + shipAlias + " spaceshipCrew=" + shipRef.GetValue(SpaceshipCrew))
    if respawnMarker && shipRef
        ; get base ship
        SpaceshipBase baseShip = shipRef.GetBaseObject() as SpaceshipBase
        debug.trace(self + " RespawnShip: baseShip=" + baseShip)
        if baseShip
            SpaceshipReference newShipRef = respawnMarker.PlaceShipAtMe(baseShip)
            if shipAlias
                shipAlias.ForceRefTo(newShipRef)
            Else
                ShipRespawnCollection.RemoveRef(shipRef)
                ShipRespawnCollection.AddRef(newShipRef)
            endif
            ; remove this alias from respawnAliases (might not be in it)
            int index = respawnAliases.Find(shipAlias)
            if index > -1
                respawnAliases.Remove(index)
            endif
            ; remove this ship from respawnShips (might not be in it)
            index = respawnShips.Find(shipRef)
            if index > -1
                respawnShips.Remove(index)
            endif
        Else
            Game.Warning(self + " RespawnShip: Unable to create new ship for ship " + shipRef)
        endif
    Else
        Game.Warning(self + " RespawnShip: No respawn marker - unable to respawn ship for ship " + shipRef)    
    endif
EndFunction

Function AddToRespawnArray(ReferenceAlias shipAlias)
    debug.Trace(self + " AddToRespawnArray " + shipAlias)
    LockGuard respawnArrayGuard
        ; if not already in the array, add it and start (restart) the timer
        if respawnAliases.Find(shipAlias) < 0
            respawnAliases.Add(shipAlias)
            StartTimer(respawnTimeSeconds, respawnAliasTimerID)
        endif
    EndLockGuard
endFunction

Function AddToRespawnShipArray(SpaceshipReference shipRef)
    debug.Trace(self + " AddtoRespawnShipArray " + shipRef)
    LockGuard respawnArrayGuard
        ; if not already in the array, add it and start (restart) the timer
        if respawnShips.Find(shipRef) < 0
            respawnShips.Add(shipRef)
            StartTimer(respawnTimeSeconds, respawnShipTimerID)
        endif
    EndLockGuard
endFunction

Event OnTimer(int aiTimerID)
    debug.Trace(self + " OnTimer " + aiTimerID)
    if aiTimerID == respawnAliasTimerID || aiTimerID == respawnShipTimerID
        if AllowRespawn()
            LockGuard respawnArrayGuard
                if aiTimerID == respawnAliasTimerID
                    ; count down from top of array since we're removing elements as we go
                    int i = respawnAliases.Length - 1
                    while i > -1 
                        RespawnShip(respawnAliases[i].GetShipRef(), respawnAliases[i])
                        i -= 1 ; decrement
                    endWhile
                elseif aiTimerID == respawnShipTimerID
                    ; count down from top of array since we're removing elements as we go
                    int i = respawnShips.Length - 1
                    while i > -1 
                        RespawnShip(respawnShips[i])
                        i -= 1 ; decrement
                    endWhile
                endif
            EndLockGuard
        Else
            ; run timer again
            debug.trace(self + " OnTimer: restarting timer " + aiTimerID)
            StartTimer(respawnTimeSeconds, aiTimerID)
        endif
    endif
EndEvent