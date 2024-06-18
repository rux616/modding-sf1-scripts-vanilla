Scriptname ExpandingBiomassScript extends ObjectReference

float property initialScaleMultiplier = 1.0 auto const
float property minScaleMultiplier = 0.5 auto const
float property maxScaleMultiplier = 2.0 auto const
float property expandingSpeed = 0.01 auto const
float property contractingSpeed = 0.01 auto const
float property damageContractingSpeed = 0.05 auto const
float property detectionDistance = 15.0 auto const
Keyword property RL039_AwarenessVolume auto const
Keyword property RL039_BlobTarget auto const

float minScale
float restingScale
float maxScale

bool shouldExpandToMax = false
bool shouldReturnToRest = false
bool shouldDamageContract = false
float waitSeconds = 0.01
float waitAfterDamageSeconds = 0.25
float scaleReductionPerHit = 0.1
int hitCount = 0
ObjectReference[] awarenessVolumes
bool hasAwarenessVolumes = false
ObjectReference[] actorsInAwarenessVolumes
int detectedActorCount = 0

CustomEvent ContractBlobEvent

event OnCellLoad()
    RegisterForHitEvent(self)
    RegisterForCustomEvent(self, "ContractBlobEvent")

    ; set resting scale
    restingScale = self.GetScale()
    minScale = restingScale * minScaleMultiplier
    maxScale = restingScale * maxScaleMultiplier

    SetScale(restingScale * initialScaleMultiplier)

    ; set up awareness volumes
    awarenessVolumes = GetRefsLinkedToMe(RL039_AwarenessVolume)
    if(awarenessVolumes.Length > 0)
        hasAwarenessVolumes = true   

        actorsInAwarenessVolumes = new ObjectReference[0]

        int i = 0
        while(i < awarenessVolumes.Length)
            ObjectReference awarenessVolume = awarenessVolumes[i]

            RegisterForRemoteEvent(awarenessVolume, "OnTriggerEnter")
            RegisterForRemoteEvent(awarenessVolume, "OnTriggerLeave")
            
            i += 1
        EndWhile     
    Else
        ; register for player distance events
        RegisterForDistanceLessThanEvent(Game.GetPlayer(), self, detectionDistance)
    endIf

    ObjectReference[] initialBlobTargets = GetRefsLinkedToMe(RL039_BlobTarget)
    if(initialBlobTargets.Length > 0)
        int i = 0
        while(i < initialBlobTargets.Length)
            ObjectReference initialBlobTarget = initialBlobTargets[i]
            float distance = GetDistance(initialBlobTarget)

            if(distance < detectionDistance)
                RegisterForDistanceGreaterThanEvent(initialBlobTarget, self, detectionDistance)
                detectedActorCount += 1
            Else
                RegisterForDistanceLessThanEvent(initialBlobTarget, self, detectionDistance)
            EndIf
            
            i += 1
        EndWhile

        if(detectedActorCount > 0)
            shouldReturnToRest = false
            ExpandBlob()
        endIf
    EndIf
endEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
    if(akActionRef is Actor)
        int index = actorsInAwarenessVolumes.Find(akActionRef)
        
        if(index < 0)
            actorsInAwarenessVolumes.Add(akActionRef)

            float distance = GetDistance(akActionRef)

            if(distance < detectionDistance)
                DetectActor(akActionRef)
            EndIf
        EndIf
    endIf
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akActionRef)
    if(akActionRef is Actor)
        int index = actorsInAwarenessVolumes.Find(akActionRef)
            
        if(index >= 0)
            actorsInAwarenessVolumes.Remove(index)

            UndetectActor(akActionRef, false)
        EndIf
    EndIF
EndEvent

event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    DetectActor(akObj1)
endEvent

event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    UndetectActor(akObj1)
endEvent

event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    RegisterForHitEvent(self)
    
    TakeHits(1)
endEvent

function TakeHits(int count)
    hitCount += count

    if(!shouldDamageContract)
        SendCustomEvent("ContractBlobEvent")
    endIF
endFunction

Event ExpandingBiomassScript.ContractBlobEvent(ExpandingBiomassScript akSender, Var[] akArgs)
    ContractBlobOnDamage()
EndEvent

function DetectActor(ObjectReference akActor)
    RegisterForDistanceGreaterThanEvent(akActor, self, detectionDistance)
    
    detectedActorCount += 1

    if(detectedActorCount == 1)
        shouldReturnToRest = false
        ExpandBlob()
    endif
endFunction

function UndetectActor(ObjectReference akActor, bool registerForDistanceEvents = true)
    
    if(registerForDistanceEvents)
        RegisterForDistanceLessThanEvent(akActor, self, detectionDistance)
    Else
        UnregisterForDistanceEvents(akActor, self)
    EndIf

    detectedActorCount -= 1

    if(detectedActorCount < 0)
        detectedActorCount == 0
    endIf

    if(detectedActorCount == 0)
        shouldExpandToMax = false
        ReturnToRest()
    endif
endFunction

bool function IsReferenceInAwarenessVolumes(ObjectReference reference)
    int i = 0
    while(i < awarenessVolumes.Length)
        ObjectReference awarenessVolume = awarenessVolumes[i]

        if(awarenessVolume.IsInTrigger(reference))
            return true
        endIf

        i += 1
    endWhile

    return false
endFunction

function ExpandBlob()
    shouldExpandToMax = true

    while(shouldExpandToMax && !shouldDamageContract)
        float currentScale = self.GetScale()
        float nextScale = currentScale + expandingSpeed
        bool expansionComplete = false

        if(nextScale > maxScale)
            nextScale = maxScale
            expansionComplete = true
        endIf

        self.SetScale(nextScale)

        if(expansionComplete)
            shouldExpandToMax = false
        else
            Utility.Wait(waitSeconds)
        endIf
    endWhile
endFunction

function ReturnToRest()
    shouldReturnToRest = true

    float currentScale = self.GetScale()

    float speed = expandingSpeed
    int direction = 1

    if(currentScale > restingScale)
        speed = -contractingSpeed
        direction = -1
    endIf

    while(shouldReturnToRest && !shouldDamageContract)
        currentScale = self.GetScale()
        float nextScale = currentScale + speed
        bool returnComplete = false

        if(direction == 1)
            if(nextScale > restingScale)
                nextScale = restingScale
                returnComplete = true
            endIf
        elseif (direction == -1)
            if(nextScale < restingScale)
                nextScale = restingScale
                returnComplete = true
            endIf
        endIf

        self.SetScale(nextScale)

        if(returnComplete)
            shouldReturnToRest = false
        else
            Utility.Wait(waitSeconds)
        endIf
    endWhile
endFunction

function ContractBlobOnDamage()
    shouldDamageContract = true
    bool minScaleReached = false

    while(hitCount > 0 && !minScaleReached)
        float currentScale = self.GetScale()
        float targetScale = Math.Clamp(currentScale - scaleReductionPerHit, minScale, currentScale)
        bool hitContractionComplete = false
        
        while(!hitContractionComplete)
            currentScale = self.GetScale()
            float nextScale = Math.Clamp(currentScale - damageContractingSpeed, minScale, currentScale)

            if(nextScale == minScale)
                hitContractionComplete = true
                minScaleReached = true
            elseif (nextScale == targetScale)
                hitContractionComplete = true
            endIf

            self.SetScale(nextScale)

            if(hitContractionComplete)
                hitCount -= 1
            else
                Utility.Wait(waitSeconds)
            endIf
        endWhile
    endWhile

    Utility.Wait(waitAfterDamageSeconds)

    shouldDamageContract = false

    if(detectedActorCount > 0)
        ExpandBlob()
    elseif(self.GetScale() != restingScale)
        ReturnToRest()
    endIf
endFunction
