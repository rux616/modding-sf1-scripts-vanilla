Scriptname SQ_GravitationalTraitsScript extends Quest
{quest script to randomize gravitational anomaly traits}

Keyword property PlanetTrait26GravitationalAnomaly auto const mandatory

Keyword property PlanetTrait26GravitationalAnomaly_Close auto const mandatory

LocationAlias[] property OldPlanets auto Const
{ list of planet location aliases - remove the trait from all of these}

LocationAlias[] property NewPlanets auto Const
{ list of planet location aliases - put the trait on all of these}

LocationAlias[] Property ClosePlanets Const Auto
{List of location aliases for the designated "closer" planets}

;Note: AnyPlanetLocationAlias and ClosePlanetLocationAlias will force fill
;themselves into TargetPlanetLocationAlias when filled.
struct PlanetAliasFill
    LocationAlias AnyPlanetLocationAlias
    LocationAlias ClosePlanetLocationAlias
    LocationAlias TargetPlanetLocationAlias
endstruct

;Helper struct for associating a planet location with an index
struct PlanetLocationLookup
    Location PlanetLocation
    int Index
endstruct

PlanetAliasFill[] Property PlanetAliasFillLookup Auto Const Mandatory
{ List of planet location aliases used to associate the fill method with the target of the fill. }

Event OnQuestStarted()
    ; first, remove trait from all existing planets
    int i = 0
    while i < OldPlanets.Length
        Location thePlanetLocation = OldPlanets[i].GetLocation()
        if thePlanetLocation
            thePlanetLocation.RemoveKeyword(PlanetTrait26GravitationalAnomaly)
        endif
        i += 1
    endWhile

    ; next, add the trait to the new set of planets
    i = 0
    while i < NewPlanets.Length
        Location thePlanetLocation = NewPlanets[i].GetLocation()
        if thePlanetLocation
            thePlanetLocation.AddKeyword(PlanetTrait26GravitationalAnomaly)
        endif
        i += 1
    endWhile

    ;next, tag all close alias planets that have been filled
    i = 0
    while i < ClosePlanets.Length
        Location thePlanetLocation = ClosePlanets[i].GetLocation()
        if thePlanetLocation
            thePlanetLocation.AddKeyword(PlanetTrait26GravitationalAnomaly_Close)
        endif
        i += 1
    endWhile
EndEvent

bool Function ArePlanetLocationsDuped()
    int i = 0
    Location[] knownLocations = new Location[0]
    while i < NewPlanets.Length
        Location loc = NewPlanets[i].GetLocation()
        if loc
            if knownLocations.Find(loc) >= 0
                return true
            else
                knownLocations.Add(loc)
            endif
        endif
        i += 1
    endwhile
    return false
EndFunction

Location Function RefillPlanetLocationDirect(PlanetAliasFill planetAliasToFill)
    planetAliasToFill.TargetPlanetLocationAlias.RefillAlias()
    Location newLoc = planetAliasToFill.TargetPlanetLocationAlias.GetLocation()
    if newLoc
        newLoc.AddKeyword(PlanetTrait26GravitationalAnomaly)
    endif
    return newLoc
EndFunction

Location Function RefillPlanetLocationFromAliases(PlanetAliasFill planetAliasToFill)
    Location anyLoc
    Location closeLoc
    if planetAliasToFill.AnyPlanetLocationAlias
        planetAliasToFill.AnyPlanetLocationAlias.RefillAlias()
        anyLoc = planetAliasToFill.AnyPlanetLocationAlias.GetLocation()
    endif
    if planetAliasToFill.ClosePlanetLocationAlias
        planetAliasToFill.ClosePlanetLocationAlias.RefillAlias()
        closeLoc = planetAliasToFill.ClosePlanetLocationAlias.GetLocation()
    endif
    Location newLoc
    if closeLoc || anyLoc
        newLoc = planetAliasToFill.TargetPlanetLocationAlias.GetLocation()
    endif
    if newLoc
        newLoc.AddKeyword(PlanetTrait26GravitationalAnomaly)
    endif
    return newLoc
EndFunction

Location Function RefillPlanetLocationDupe(PlanetAliasFill dupe)
    Location newLoc
    if !dupe.AnyPlanetLocationAlias && !dupe.ClosePlanetLocationAlias
        ;Both AnyPlanetLocationAlias and ClosePlanetLocationAlias are None.
        ;We can just directly refill TargetPlanetLocationAlias
        newLoc = RefillPlanetLocationDirect(dupe)
    else
        ;TargetPlanetLocationAlias is filled by AnyPlanetLocationAlias and ClosePlanetLocationAlias.
        ;Attempt a refill on both and take the result in TargetPlanetLocationAlias.
        newLoc = RefillPlanetLocationFromAliases(dupe)
    endif
    return newLoc
EndFunction

Function CheckAndRefillPlanetDupes()
    int i = PlanetAliasFillLookup.Length - 1
    PlanetLocationLookup[] knownLocations = new PlanetLocationLookup[0]
    ;Reverse traversal of PlanetAliasFillLookup. The last element of that array is a hardcoded location.
    ;If that entry ends up being marked as a dupe, refilling it will have no effect.
    while i >= 0
        Location loc = PlanetAliasFillLookup[i].TargetPlanetLocationAlias.GetLocation()
        if loc
            int dupedIndex = knownLocations.FindStruct("PlanetLocation", loc)
            if dupedIndex >= 0
                ;Dupe found. Attempt a refill.
                Location newLoc
                newLoc = RefillPlanetLocationDupe(PlanetAliasFillLookup[i])
                if !newLoc
                    ;If the first fill failed, backtrack to the other dupe and attempt a refill on it
                    newLoc = RefillPlanetLocationDupe(PlanetAliasFillLookup[knownLocations[dupedIndex].Index])
                endif
                if newLoc
                    PlanetLocationLookup newPlanetLocLookup = new PlanetLocationLookup
                    newPlanetLocLookup.PlanetLocation = loc
                    newPlanetLocLookup.Index = i
                    knownLocations.Add(newPlanetLocLookup)
                endif
            else
                PlanetLocationLookup newPlanetLocLookup = new PlanetLocationLookup
                newPlanetLocLookup.PlanetLocation = loc
                newPlanetLocLookup.Index = i
                knownLocations.Add(newPlanetLocLookup)
            endif
        endif
        i -= 1
    endwhile
EndFunction
