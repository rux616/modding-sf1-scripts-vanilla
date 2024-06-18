Scriptname OLD_BE_QuestScript extends Quest Conditional
{ parent script for BE quests }

ReferenceAlias property TargetShip auto const
{ this ship }

RefCollectionAlias property CrewCollection auto const
{ OPTIONAL: collection of crew actors
    if included, will move crew collection to matching markers in CrewMarkers array, and assign them to matching aliases in CrewAliases
 }

ReferenceAlias[] property CrewMarkers auto const
{ OPTIONAL: collection of markers for crew
    only used with CrewCollection; if provided, will move crew collection to matching markers in CrewMarkers array, and assign them to matching aliases in CrewAliases
 }

ReferenceAlias[] property CrewAliases auto const
{ array of ref aliases for individual crew actors }

ActorValue property SpaceshipCrew auto const
{ tracks number of crew on a ship }

bool property StopQuestOnUndock = true auto const
{ stop quest when player undocks - should be TRUE unless you are doing special handling to shut down the quest some other way }

Event OnQuestInit()
	SpaceshipReference shipRef = TargetShip.GetShipRef()
	; register for undocking so we can shut down quest
	RegisterForRemoteEvent(shipRef, "OnShipUndock")
    ; difference between the two values is how many crew have died prior to boarding
    int crewValue = shipRef.GetValue(SpaceshipCrew) as int
    int baseCrewValue = shipRef.GetBaseValue(SpaceshipCrew) as int
    
    if CrewCollection
        ; set up crew aliases and move to crew markers
        debug.trace(" Setting up CrewCollection:") 
        int i = 0
        while i < baseCrewValue && i < CrewCollection.GetCount()
            debug.trace(self + " i=" + i)
            Actor theCrew = CrewCollection.GetAt(i) as Actor
            debug.trace(self + " i=" + i + ": setting up " + theCrew)
            CrewAliases[i].ForceRefTo(theCrew)
            ; move to marker
            if CrewMarkers && i < CrewMarkers.Length
                ObjectReference theMarker = CrewMarkers[i].GetRef()
                if theMarker
                    theCrew.MoveTo(theMarker)
                endif
            endif
            i += 1
        EndWhile
    endif
    ; go through crew aliases and enable/kill as appropriate
    debug.trace(" Setting up CrewAliases array:") 

    int i = 0
    while i < baseCrewValue && i < CrewAliases.Length
        debug.trace(self + " i=" + i)
        ; enable this crewman
        Actor theCrew = CrewAliases[i].GetActorRef()
        debug.trace(self + " i=" + i + ": enabling " + theCrew)
        theCrew.EnableNoWait()
        if i >= crewValue
            ; kill crew that should have died prior to boarding
            debug.trace(self + " i=" + i + ": killing " + theCrew)
            theCrew.KillSilent()
        endif
        ; register for OnDeath so we can decrement SpaceshipCrew as they die
        RegisterForRemoteEvent(theCrew, "OnDying")
        i += 1
    EndWhile
    
EndEvent

; convenience function
Function StartCombatWithPlayer()
    debug.trace(" StartCombatWithPlayer") 
    ; run through crew and start combat
    Actor player = Game.GetPlayer()
    int i = 0
    while i < CrewAliases.Length
        ; enable this crewman
        Actor theCrew = CrewAliases[i].GetActorRef()
        theCrew.StartCombat(player)
        i += 1
    EndWhile
EndFunction

Event SpaceshipReference.OnShipUndock(SpaceshipReference akSource, bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)
	debug.trace(self + " OnShipUndock akSource=" + akSource)
    if StopQuestOnUndock
	    Stop()
    endif
endEvent

Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
    debug.trace(self + "OnDying " + akSender)
    SpaceshipReference shipRef = TargetShip.GetShipRef()
    shipRef.ModValue(SpaceshipCrew, -1)
EndEvent
