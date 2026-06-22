Scriptname LandingZoneTriggerScript extends ObjectReference
{get creatures to flee when a ship lands}

Keyword property SQ_LinkLandingZoneTrigger auto Const mandatory
{ keyword to link creatures to the landing zone trigger }

ActorValue property LandingZoneHot auto const mandatory
{ AV to set on creatures when the ship is landing/taking off }

Keyword property LandingZoneTriggerKeyword auto const mandatory
{ keyword that links the landing marker TO the landing zone trigger }

Keyword property DMP_ShipLandingMarker auto const mandatory
{ keyword to find NPCs linked to the landing marker }

SpaceshipReference landedSpaceship
ObjectReference landingMarker
bool alerted = false ; set to true when NPCs are alerted

Guard AlertGuard ProtectsFunctionLogic

Event OnUnload()
    ; clear links
    ClearLinks()
    AlertLinkedNPCs(false)
EndEvent

Event SpaceshipReference.OnShipLanding(SpaceshipReference akSource, bool abComplete)
    debug.trace(self + " OnShipLanding " + abComplete)
    if abComplete
        ; clear links
        ClearLinks()
        ; alert NPCs linked to the landing marker
        AlertLinkedNPCs()
    endif
endEvent

Event SpaceshipReference.OnShipTakeOff(SpaceshipReference akSource, bool abComplete)
    debug.trace(self + " OnShipTakeOff " + abComplete)
    if abComplete
        landedSpaceship = NONE
		landingMarker = NONE
        ; clear links
        ClearLinks()
        UnregisterForRemoteEvent(akSource, "OnShipLanding")
        UnregisterForRemoteEvent(akSource, "OnShipTakeoff")
    Else
        ; set links
        SetLinks()
        ; clear alert on NPCs linked to the landing marker
        AlertLinkedNPCs(false)
    endif
endEvent

Event Actor.OnCombatListAdded(Actor akSource, Actor akTarget)
    debug.trace(self + " OnCombatListAdded: akSource=" + akSource)
    ; always clear alert state on linked NPCs when they get into combat with anything
    AlertLinkedNPCs(false)
EndEvent

function BeginLanding(SpaceshipReference mySpaceship, ObjectReference mylandingMarker)
    debug.trace(self + " BeginLanding: " + mySpaceship)
    ; set links for creatures to flee landing zone
    if landedSpaceship == NONE || landedSpaceship != mySpaceship
        landedSpaceship = mySpaceship
        RegisterForRemoteEvent(myspaceship, "OnShipLanding")
        RegisterForRemoteEvent(myspaceship, "OnShipTakeoff")
        SetLinks()
    endif
    landingMarker = myLandingMarker
EndFunction

function SetLinks()
    debug.trace(self + " SetLinks")
    SetValue(LandingZoneHot, 1)
    ; get everything in trigger and link them to this trigger temporarily
    ObjectReference[] triggerRefs = GetAllRefsInTrigger()
    debug.trace(self + " SetLinks: triggerRefs=" + triggerRefs)
    ; run through and link valid actors
    int i = 0
    while i < triggerRefs.Length
        Actor triggerActor = triggerRefs[i] as Actor
        if triggerActor
            debug.trace(self + "   linking " + triggerActor)
            triggerActor.SetLinkedRef(self, SQ_LinkLandingZoneTrigger)
            triggerActor.EvaluatePackage()
        endif
        i += 1
    EndWhile
endFunction

function ClearLinks()
    debug.trace(self + " ClearLinks")
    SetValue(LandingZoneHot, 0)
    ObjectReference[] linkedRefs = GetRefsLinkedToMe(SQ_LinkLandingZoneTrigger)
    ; run through and link valid actors
    int i = 0
    while i < linkedRefs.Length
        ObjectReference theRef = linkedRefs[i]
        debug.trace(self + "   unlinking " + theRef)
        theRef.SetLinkedRef(NONE, SQ_LinkLandingZoneTrigger)
        i += 1
    EndWhile
EndFunction

function AlertLinkedNPCs(bool bAlerted=true)
    debug.trace(self + " AlertLinkedNPCs: bAlerted=" + bAlerted + " alerted=" + alerted)
	LockGuard AlertGuard

        if landingMarker
            if alerted != bAlerted
                alerted = bAlerted
                ObjectReference[] linkedRefs = landingMarker.GetRefsLinkedToMe(DMP_ShipLandingMarker)
                debug.trace(self + " AlertLinkedNPCs: linkedRefs=" + linkedRefs + " bAlerted=" + bAlerted)
                ; run through and set the AV on the valid actors
                int i = 0
                while i < linkedRefs.Length
                    Actor triggerActor = linkedRefs[i] as Actor
                    if triggerActor
                        if bAlerted
                            debug.trace(self + "   alerting " + triggerActor)
                            RegisterForRemoteEvent(triggerActor, "OnCombatListAdded")
                            triggerActor.SetValue(LandingZoneHot, 1)
                        Else
                            debug.trace(self + "   clearing alert on " + triggerActor)
                            UnregisterForRemoteEvent(triggerActor, "OnCombatListAdded")
                            triggerActor.SetValue(LandingZoneHot, 0)
                        endif
                        triggerActor.EvaluatePackage()
                    endif
                    i += 1
                EndWhile
            endif
        endif
    EndLockGuard
endFunction