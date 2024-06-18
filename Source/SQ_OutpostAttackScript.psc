Scriptname SQ_OutpostAttackScript extends Quest

REParentScript Property RE_Parent Auto const mandatory 

ReferenceAlias property OutpostBeacon auto const mandatory 
{ outpost beacon that we're attacking }

ReferenceAlias property AttackTarget auto const mandatory 
{ created marker in case outpost is removed while quest is running }

ReferenceAlias property Trigger auto const mandatory 
{ trigger in landing location - may not always exist if location isn't an OE location }

RefCollectionAlias property Attackers auto const mandatory
{ attackers will spawn into this collection }

Keyword property LocTypeMajorOrbital auto const Mandatory

ActorValue property OutpostLastAttackTimestamp auto const mandatory
{ used to timestamp last outpost attack }

bool property IsAttackStarted = false auto hidden ; set to true when attack is considered started

bool property CountsAsAttack = true auto Const
{ 
    if true, this is counted as an outpost attack - planet is stamped when this starts so another attack isn't triggered during the cooldown 
    if false, don't treat this as a normal attack (no timestamp)
}

Event OnQuestInit()
    DisableTrigger(true)

	;register for spawn event
	DefaultGroupSpawnQuestScript myDefaultGroupQuest = (self as quest) as DefaultGroupSpawnQuestScript
    if myDefaultGroupQuest
	    RegisterForCustomEvent(myDefaultGroupQuest, "SpawnEvent")
    endif

    ; register for change location event
    RegisterForRemoteEvent(Attackers, "OnLocationChange")
EndEvent

Event OnQuestStarted()
    debug.trace(self + " OnQuestStarted")
    HandleQuestStarted()
    RegisterForCustomEvent(RE_Parent, "RECheckForCleanup")
    TimestampAttack()
EndEvent

Function HandleQuestStarted()
    ; override on child scripts
EndFunction

Event OnQuestShutdown()
    DisableTrigger(false)
    HandleQuestShutdown()
EndEvent

Function HandleQuestShutdown()
    ; override on child scripts
EndFunction

function TimestampAttack()
    if CountsAsAttack
        ; timestamp the attack on this planet
        ObjectReference outpostRef = OutpostBeacon.GetRef()
        if outpostRef
            Location outpostLocation = outpostRef.GetCurrentLocation()
            Location[] parentLocations = outpostLocation.GetParentLocations(LocTypeMajorOrbital)
            if parentLocations
                Location myPlanet = parentLocations[0]
                myPlanet.SetValue(OutpostLastAttackTimestamp, Utility.GetCurrentGameTime())
            endif
        endif
    endif
EndFunction

function StartAttack(bool bSetAttackTimestamp=true)
    debug.trace(self + " StartAttack")
    IsAttackStarted = true
    if bSetAttackTimestamp
        TimestampAttack()
    endif
    HandleStartAttack()
EndFunction

function HandleStartAttack()
    ; override on extending scripts
endFunction

function DisableTrigger(bool bDisable)
    ObjectReference triggerRef = Trigger.GetRef()
    if triggerRef
        if bDisable
            triggerRef.DisableNoWait()
        Else
            triggerRef.EnableNoWait()
        endif
    endif
EndFunction

Event DefaultGroupSpawnQuestScript.SpawnEvent(DefaultGroupSpawnQuestScript akSender, var[] akArgs)
	debug.trace(self + "SpawnEvent received")
    HandleAttackersSpawning()
EndEvent

Function HandleAttackersSpawning()
    ; override on child scripts
endFunction

;sent by REParentScript but ultimately originating in RETriggerScript
Event REParentScript.RECheckForCleanup(REParentScript akSender, Var[] akArgs)
	debug.trace(self + " received RECheckForCleanup event")
	CheckForCleanup()
EndEvent

Event RefCollectionAlias.OnLocationChange(RefCollectionAlias akSource, ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
    HandleAttackerLocationChange(akSenderRef, akOldLoc, akNewLoc)
EndEvent

Function HandleAttackerLocationChange(ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)
    ; override on child scripts
EndFunction

function CheckForCleanup()
	bool shouldShutDown = false
    
    ObjectReference attackTargetRef = attackTarget.GetRef()

    if Attackers.GetCountDead() == Attackers.GetCount()
        debug.trace(self + " attackers are all dead: stopping quest")
        shouldShutDown = true
    elseif attackTargetRef && attackTargetRef.GetCurrentPlanet() != Game.GetPlayer().GetCurrentPlanet()
        debug.trace(self + " player on a different planet: stopping quest")
        shouldShutDown = true
    endif
    if shouldShutDown
        Stop()
    endif
EndFunction
