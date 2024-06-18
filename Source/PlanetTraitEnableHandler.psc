Scriptname PlanetTraitEnableHandler extends ObjectReference

Keyword Property PlanetTrait13GaseousFont Mandatory Const Auto
Keyword Property PlanetTrait17PrimordialNetwork Mandatory Const Auto

Planet Property TestPlanet Mandatory Auto

Keyword ChosenTraitToEnable

Event OnLoad()
    HandleTraitEnabling()
EndEvent


; Currently in a rough state since it was used for a simple prototype. Will require a pass if we decide to fully use this system.
Function HandleTraitEnabling()

    Keyword[] ThisPlanetsTraits
    Keyword[] MatchingTraitsWithThisPlanet = new Keyword[0]

    If (ChosenTraitToEnable == NONE)

        ThisPlanetsTraits = GetCurrentPlanet().GetKeywordTypeList(44)
        debug.Trace(self + "|PlanetTraitHandler| This Planets Traits" + ThisPlanetsTraits)

        int CountMatchingTraits = 0
        While (CountMatchingTraits < ThisPlanetsTraits.length)
            Keyword currentKeyword = ThisPlanetsTraits[CountMatchingTraits]
                If GetRefsLinkedToMe(currentKeyword).Length > 0
                    MatchingTraitsWithThisPlanet.Add(currentKeyword)
                    debug.Trace(self + "|PlanetTraitHandler| This Overlay also includes Keyword: " + currentKeyword)
                Else
                    debug.Trace(self + "|PlanetTraitHandler| This Overlay does NOT include Keyword: " + currentKeyword)
                EndIf
            CountMatchingTraits += 1
        EndWhile

        debug.Trace(self + "|PlanetTraitHandler| Matching Traits with this Planet" + MatchingTraitsWithThisPlanet)

        If (MatchingTraitsWithThisPlanet.Length > 1)
            Int RandomlySelectedTrait = Utility.RandomInt(MatchingTraitsWithThisPlanet.Length)
            ChosenTraitToEnable = MatchingTraitsWithThisPlanet[RandomlySelectedTrait]
            debug.Trace(self + "|PlanetTraitHandler| More than one matching trait. Randomly selected: " + MatchingTraitsWithThisPlanet[RandomlySelectedTrait])
        Else
            GetRefsLinkedToMe(MatchingTraitsWithThisPlanet[0])[0].EnableNoWait()
            debug.Trace(self + "|PlanetTraitHandler| Only one matching Trait: " + MatchingTraitsWithThisPlanet[0])
        EndIf

        debug.Trace(self + "|PlanetTraitHandler| Enabling " +  GetRefsLinkedToMe(MatchingTraitsWithThisPlanet[0])[0])
    EndIf
EndFunction