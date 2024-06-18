Scriptname SQ_OutpostAttackHumansScript extends SQ_OutpostAttackScript

group AttackHumansData
    ReferenceAlias[] property Ships auto Const mandatory
    { array of ship aliases }

    ActorValue property OutpostBuildAreaRadius auto const mandatory
    { build radius AV - used to check for replacement outpost beacon during attack }
endGroup

int iObjectAttackTimerID = 1 Const
float fObjectAttackTimerSeconds = 3.0 Const

; override parent function
Function HandleQuestStarted()
    ; trigger ship landing
    OE_ShipsAddonScript myShipScript = (self as Quest) as OE_ShipsAddonScript
    if myShipScript
        debug.trace(self + " calling OE_ShipsAddonScript.LandShip()")
        myShipScript.LandShip()
    endif
    ; register for outpost objects being built
    RegisterForRemoteEvent(OutpostBeacon, "OnWorkshopObjectPlaced")

    ; register for attack target loading and unloading
    RegisterForRemoteEvent(AttackTarget, "OnLoad")
    RegisterForRemoteEvent(AttackTarget, "OnUnload")

    ; register for player placing new outpost - in case target outpost is removed and replaced
    RegisterForRemoteEvent(Game.GetPlayer(), "OnOutpostPlaced")
EndFunction

Event ReferenceAlias.OnLoad(ReferenceAlias akSource)
    ; make sure everyone is in combat with outpost objects
    if IsAttackStarted && Attackers.GetCountDead() < Attackers.GetCount()
        AttackOutpostObjects()
    endif
EndEvent

Event ReferenceAlias.OnUnload(ReferenceAlias akSource)
    ; attack target unloaded - if attack has started, destroy all unloaded objects if any attackers still alive
    if IsAttackStarted && Attackers.GetCountDead() < Attackers.GetCount()
        debug.trace(self + " attack target unloading, attackers still alive - destroy any unloaded destructible objects")
        ObjectReference outpostBeaconRef = OutpostBeacon.GetRef()
        if outpostBeaconRef
            ObjectReference[] destructibleObjects = outpostBeaconRef.GetDestructibleOutpostObjects()
            debug.trace(self + " destructibleObjects=" + destructibleObjects)
            int i = 0
            while i < destructibleObjects.Length
                ObjectReference theRef = destructibleObjects[i]
                if theRef.Is3DLoaded() == false
                    ; destroy it
                    debug.trace(self + " " + theRef + " is unloaded - destroying")
                    theRef.SetDestroyed()
                    debug.trace(self + " IsDestroyed=" + theRef.IsDestroyed())
                endif
                i += 1
            EndWhile
        endif
    endif
EndEvent

Event Actor.OnOutpostPlaced(Actor akSource, ObjectReference akOutpostBeacon)
    ; is this beacon near the attack target?
    float buildRadius = akOutpostBeacon.GetValue(OutpostBuildAreaRadius)
    ObjectReference attackTargetRef = AttackTarget.GetRef()
    if attackTargetRef.GetDistance(akOutpostBeacon) < buildRadius
        debug.trace(self + " replace outpost beacon attack target with " + akOutpostBeacon)
        ; new outpost built at attack target - replace outpost beacon with this new one
        OutpostBeacon.ForceRefTo(akOutpostBeacon)
        ; move attack target to new beacon position
        attackTargetRef.MoveTo(akOutpostBeacon)
    EndIf
EndEvent

; override parent function
Function HandleQuestShutdown()
    ; clean up ship(s)
    int i = 0
    while i < Ships.Length
        Ships[i].TryToDisable()
        i += 1
    EndWhile
EndFunction

Function HandleAttackersSpawning()
    ; NPCs have spawned, make sure aggression is 1
	debug.trace(self + "HandleAttackersSpawning - set aggression")
    Attackers.SetValue(Game.GetAggressionAV(), 1)
endFunction

; override parent function
Function HandleAttackerLocationChange(ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
	debug.trace(self + "HandleAttackerLocationChange " + akSenderRef + " akNewLoc=" + akNewLoc)
    ObjectReference outpostRef = OutpostBeacon.GetRef()
    Actor attackerRef = akSenderRef as Actor
    if outpostRef && attackerRef && akNewLoc == outpostRef.GetCurrentLocation()
        int i = attackerRef.AttackOutpostObjects(outpostRef)
        debug.trace(self + " " + attackerRef + " starting combat with " + i + " destructible outpost objects")
        StartAttack()
    endif 
EndFunction

Event ReferenceAlias.OnWorkshopObjectPlaced(ReferenceAlias akSource, ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectPlaced IsAttackStarted=" + IsAttackStarted)
    if IsAttackStarted
        ; run attack timer
        StartTimer(fObjectAttackTimerSeconds, iObjectAttackTimerID)
    endif
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == iObjectAttackTimerID
        debug.trace(self + " OnTimer - put attackers in combat with resource producers")
        AttackOutpostObjects()
    EndIf
EndEvent

function AttackOutpostObjects()
    ; put everyone in combat with outpost objects
    ObjectReference outpostRef = OutpostBeacon.GetRef()
    if outpostRef
        int a = 0
        while a < Attackers.GetCount()
            Actor theAttacker = Attackers.GetActorAt(a)
            if theAttacker && theAttacker.IsDead() == false
                int i = theAttacker.AttackOutpostObjects(outpostRef)
                debug.trace(self + " " + theAttacker + " starting combat with " + i + " destructible outpost objects")
            endif
            a += 1
        endWhile
    endif
EndFunction