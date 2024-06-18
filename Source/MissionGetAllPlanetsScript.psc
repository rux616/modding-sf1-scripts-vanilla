Scriptname MissionGetAllPlanetsScript extends Quest

SQ_ParentScript property SQ_Parent auto const mandatory

LocationAlias[] property AllPlanets auto const mandatory
{ array of all planet location aliases }

int function DebugGetPlanetCount() DebugOnly
    ; count how many planets
    int planetCount = 0

    int i = 0
    while i < AllPlanets.Length
        Location thePlanet = AllPlanets[i].GetLocation()
        if thePlanet
            planetCount += 1
        endif
        i += 1
    endwhile
    debug.trace(self + " DebugGetPlanetCount: " + planetCount)
    return planetCount
EndFunction

int function GetSystemTraitValue()
    ; get total trait value for system
    int totalTraitValue = 0

    int i = 0
    while i < AllPlanets.Length
        Location thePlanetLocation = AllPlanets[i].GetLocation()
        if thePlanetLocation
            Planet thePlanet = thePlanetLocation.GetCurrentPlanet()
            int planetTraitValue = SQ_Parent.GetPlanetTraitValue(thePlanet)
            totalTraitValue += planetTraitValue
            debug.trace(self + " " + thePlanet + ": " + planetTraitValue)
        endif
        i += 1
    endwhile
    debug.trace(self + " GetSystemTraitValue: " + totalTraitValue)
    return totalTraitValue
EndFunction