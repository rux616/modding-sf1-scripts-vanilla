Scriptname OutpostHarvesterFaunaScript extends OutpostEventHandlerParent
{ manages creating the appropriate actor for a fauna harvester }

struct ResourceGlobalData
    ; used for matching a global variable with a resource AV
    ActorValue resourceAV
    GlobalVariable resourceGlobal
endStruct

struct FaunaCreationData
    Keyword CreatureKeyword
    int createCount
endStruct


group Required_Properties
    bool property DeleteActorWhenDestroyed = true auto const
    { if TRUE, actor will be deleted when this object is destroyed (actor will be recreated when object is repaired) }

    Keyword property OutpostLinkCreatedActorTarget auto const Mandatory
    { AUTOFILL - used to get reference to link created actor to }

    FaunaCreationData[] property FaunaCreation Auto const mandatory
    { array used to decide how many to create
        order with highest CreationCount first in the array }
    
    Faction property OutpostFaunaFaction auto const mandatory
    { faction to put on all created actors to be friends with player }

    ReferenceAlias property OutpostFauna auto const mandatory
    { alias on SQ_Parent used to stamp data on created fauna }

    ActorValue property OrganicResourceAV auto hidden
    { set by menu from build menu event }

    ActorValue property HandScannerTarget auto mandatory
    { used to tag created actors }
  
endGroup

group Optional_Properties

    LocationRefType property CreatedActorBaseRefType auto const
    { OPTIONAL: loc ref to tag created actor }

    Keyword property OutpostLinkCreatedActor auto const
    { OPTIONAL: used to link actor to this ref }

    ResourceGlobalData[] property ResourceGlobals auto const
    { OPTIONAL - array of global variables to update when the builder is set to build the matching resource AV}

    float property ResourceGlobalValueToSet = 25.0 auto const
    { value to set resourceGlobal to }
endGroup

group Respawn_Properties
    { How long to wait after an actor dies before respawning?}

    float property RespawnSecondsMin = 10.0 auto const
    { min value for RespawnSeconds - this is the starting value }

    float property RespawnSecondsMax = 120.0 auto const
    { max that RespawnSeconds is allowed to reach }

    float property RespawnSecondsAddPerDeath = 10.0 auto const
    { how many seconds to add to RespawnSeconds per death }

    float property RespawnResetSeconds = 900.0 auto const
    { how long after last death to reset Respawn time to min }

endGroup

Guard createdActorsGuard

Actor[] property createdActors auto hidden RequiresGuard(createdActorsGuard) 


float RespawnSeconds = 0.0 ; current respawn time - initialized to RespawnSecondsMin
int RespawnTimerID = 1 const
int RespawnResetTimerID = 2 const
int InitTimerID = 3 const

Event OnInit()
    debug.trace(self + " OnInit")
    LockGuard createdActorsGuard
        createdActors = new Actor[0]
    EndLockGuard
    RespawnSeconds = RespawnSecondsMin
    StartTimer(1.0, InitTimerID)
EndEvent

; player has selected a new resource to build
Event OnBuilderMenuSelect(ActorValue akActorValue)
    debug.trace(self + " OnBuilderMenuSelect " + akActorValue)
    OrganicResourceAV = akActorValue
    UpdateResource()
    ; increment global if in the resource globals list
    if ResourceGlobals.Length > 0
        int resourceGlobalIndex = ResourceGlobals.FindStruct("resourceAV", OrganicResourceAV)
        if resourceGlobalIndex > -1
            ; found - update global
            GlobalVariable globalToSet = ResourceGlobals[resourceGlobalIndex].resourceGlobal
            if globalToSet &&  globalToSet.GetValue() != ResourceGlobalValueToSet
                globalToSet.SetValue(ResourceGlobalValueToSet)
            endif
        endif
    endif
endEvent

Event Actor.OnEnterBleedout(Actor akSource)
    debug.trace(self + " OnEnterBleedout from " + akSource)
    ;DamageObject(9999)
    ; NOTE: don't call ClearCreatedActor - since actor isn't dead, no need to clear
EndEvent

Event Actor.OnDeath(Actor akSource, ObjectReference akKiller)
	debug.trace(self + " OnDeath from " + akSource)
    ; run respawn timer
    StartTimer(RespawnSeconds, RespawnTimerID)
EndEvent

Event OnObjectRepaired(ObjectReference akReference)
    debug.trace(self + " OnObjectRepaired")
    ; when repaired, make sure actors are alive and healed
    CreateActors()
EndEvent

; override parent function
Function HandleOnWorkshopObjectPlaced(ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectPlaced")
EndFunction

; override parent function
Function HandleOnWorkshopObjectRemoved(ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectRemoved")
    ClearCreatedActors(true)
EndFunction

Event OnObjectDestroyed(ObjectReference akReference)
   debug.trace(self + " OnObjectDestroyed akReference=" + akReference)
    ; when this object is destroyed, should created actors also be destroyed?
    if DeleteActorWhenDestroyed
        ClearCreatedActors(true)
    endif
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == RespawnTimerID
       RespawnCreatedActor()
    elseif aiTimerID == RespawnResetTimerID
        ; reset time to min
        debug.trace(self + " resetting RespawnSeconds to " + RespawnSecondsMin)
        RespawnSeconds = RespawnSecondsMin
    elseif aiTimerID == InitTimerID
        UpdateResource()
    endif
EndEvent

function UpdateResource()
    ClearCreatedActors(true)
    CreateActors()
endFunction

function ClearCreatedActors(bool bDeleteActor = false)
    debug.trace(self + " ClearCreatedActors")
    LockGuard createdActorsGuard
        int i = createdActors.Length - 1
        while i > -1
            ClearCreatedActor(createdActors[i], bDeleteActor)
            createdActors.RemoveLast()
            i -= 1
        EndWhile
    EndLockGuard
endFunction

function ClearCreatedActor(Actor createdActorRef, bool bDeleteActor = false)
    debug.trace(self + " ClearCreatedActor " + bDeleteActor)

    if (createdActorRef != None)
        UnregisterForRemoteEvent(createdActorRef, "OnDeath")
        UnregisterForRemoteEvent(createdActorRef, "OnEnterBleedout")

        if bDeleteActor
            debug.trace(self + " deleting createdActorRef " + createdActorRef)
            createdActorRef.Delete()
        endif

        createdActorRef = NONE
    endif
endFunction

; respawn a dead actor
function RespawnCreatedActor()
    debug.trace(self + " RespawnCreatedActor")
    LockGuard createdActorsGuard

        bool respawnedActor = false
        int i = 0
        while i < createdActors.Length && respawnedActor == false
            Actor createdActorRef = createdActors[i]
            if createdActorRef.IsDead()
                if allowRespawn && respawnedActor == false
                    respawnedActor = true
                    createdActors[i] = CreateActor(NONE)
                endif
            endif
            i += 1
        EndWhile
        ; check if we need to rerun respawn timer
        CheckForRespawnOrDestroy()
    EndLockGuard
endFunction

function CreateActors()
    debug.trace(self + " CreateActors")
    LockGuard createdActorsGuard

        ; failsafe
        if createdActors == None
            createdActors = new Actor[0]
        EndIf

        if createdActors.Length <= 0
            ; need to repopulate the list:

            ; always create at least one
            Actor newActor = CreateActor(NONE)
            if newActor
                createdActors.Add(newActor)
                ; how many more to create?
                int i = 0
                int createCount = 0
                while i < FaunaCreation.Length && createCount == 0
                    FaunaCreationData theData = FaunaCreation[i]
                    if newActor.HasKeyword(theData.CreatureKeyword)
                        createCount = theData.createCount
                    EndIf
                    i += 1
                EndWhile
                
                if createCount > 1
                    createCount -= 1 ; decrement: we already created one
                    ; create the rest
                    i = 0
                    while i < createCount
                        Actor createdActor = CreateActor(NONE)
                        createdActors.Add(createdActor)
                        i += 1
                    EndWhile
                endif
            EndIf
        EndIf
    EndLockGuard
endFunction

Actor function CreateActor(Actor createdActorRef)
    debug.trace(self + " CreateActor " + createdActorRef)
    if createdActorRef
        ; make sure not bleeding out
        if createdActorRef.IsDead() == false
            createdActorRef.RestoreValue(Game.GetHealthAV(), 9999)
        endif
    elseif OrganicResourceAV
        ObjectReference workshopRef = GetWorkshop()
        debug.trace(self + " calling GetActorBaseForResource")
        ActorBase createdActorBase = GetActorBaseForResource(OrganicResourceAV)
        debug.trace(self + " creating new actor from " + createdActorBase)
        if createdActorBase
            createdActorRef = PlaceAtMe(CreatedActorBase, abInitiallyDisabled = true, abForcePersist = false) as Actor
            createdActorRef.IgnoreFriendlyHits(true)
            createdActorRef.SetValue(HandScannerTarget, 1)
            createdActorRef.SetScanned(true)
            OutpostFauna.ApplyToRef(createdActorRef)
            createdActorRef.AddToFaction(OutpostFaunaFaction)
            RegisterForRemoteEvent(createdActorRef, "OnDeath")
            RegisterForRemoteEvent(createdActorRef, "OnEnterBleedout")
            debug.trace(self + " created actor " + createdActorRef + ", workshopRef=" + workshopRef)

            if OutpostLinkCreatedActor
                ObjectReference createdActorTargetRef = GetLinkedRef(OutpostLinkCreatedActorTarget)
                if createdActorTargetRef == NONE
                    createdActorTargetRef = self
                endif
                debug.trace(self + " linking actor to " + createdActorTargetRef)
                createdActorRef.SetLinkedRef(createdActorTargetRef, OutpostLinkCreatedActor, abPromoteParentRefr = false)
                createdActorRef.MoveTo(createdActorTargetRef)
            endif

            if CreatedActorBaseRefType
                ; set loc ref type on actor
                Location workshopLocation = workshopRef.GetCurrentLocation()
                debug.trace(self + " setting loc ref type " + CreatedActorBaseRefType + " on location " + workshopLocation)
                createdActorRef.SetLocRefType(workshopLocation, CreatedActorBaseRefType)
                debug.trace(self + " after setting, location.HasRefType=" + workshopLocation.HasRefType(CreatedActorBaseRefType))
            endif

            ; now enable
            createdActorRef.Enable()
        Else
            debug.trace(self + " WARNING: unable to create actor from resourceAV " + OrganicResourceAV)
        endif
    Else
        debug.trace(self + " not creating actor - resourceAV not set")
    endif
    return createdActorRef
endFunction

bool allowRespawn = true

function CheckForRespawnOrDestroy() RequiresGuard(createdActorsGuard)
    debug.trace(self + " CheckForRespawnOrDestroy")
    allowRespawn = false
    ; if all actors are dead, destroy object
    int deadCount = 0
    int i = 0
    while i < createdActors.Length
        if createdActors[i].IsDead()
            deadCount += 1
        endif
        i += 1
    endwhile
    debug.trace(self + " deadcount=" + deadCount)
    if deadCount >= createdActors.Length
        debug.trace(self + " all actors dead - destroy me")
        DamageObject(9999)
        SetDestroyed(true)
        ClearCreatedActors()
    Elseif deadCount > 0
        debug.trace(self + " some actors dead - run respawn timer")
        ; run respawn timer
        StartTimer(RespawnSeconds, RespawnTimerID)
        ; increase timer for each death
        RespawnSeconds += RespawnSecondsAddPerDeath
        ; don't let this go past the max
        RespawnSeconds = Math.Min(RespawnSecondsMax, RespawnSeconds)
        debug.trace(self + " RespawnSeconds=" + RespawnSeconds)

        ; start reset timer
        StartTimer(RespawnResetSeconds, RespawnResetTimerID)
    endif
    allowRespawn = true
endFunction


