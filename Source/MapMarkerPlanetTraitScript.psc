Scriptname MapMarkerPlanetTraitScript extends ObjectReference
{ temp script for showing message about a planet trait when this location is entered }

SQ_ParentScript property SQ_Parent auto const mandatory
{ use to get planet trait data }

int property DiscoveryTimerID = 1 auto Const
float property DiscoveryTimeSeconds = 0.5 auto const
{ how long after discovery to show the message }

Keyword property LocationTraitOverride auto hidden
{ set by HandleTraitEnabling, if this map marker has any trait enable linked refs
    if this is set, use this trait instead of looking for a trait keyword on the Location }

bool TraitOverrideInitDone = false

Event OnLoad()
    if TraitOverrideInitDone == false
        HandleTraitEnabling()
    endif
	; get planet trait data
	SQ_ParentScript:PlanetTraitData theData = SQ_Parent.GetPlanetTraitData(self)
    if theData
        Location traitLocation = GetCurrentLocation()    
        Planet planetToCheck = GetCurrentPlanet()
   		if planetToCheck.IsTraitKnown(theData.PlanetTrait)
            ; update location name immediately
            traitLocation.SetExplored()
        Else
            int scanCountNeeded = traitLocation.GetRefTypeAliveCount(SQ_Parent.PlanetTraitScanTargetLocRef)
            ; set needed count on location
            debug.trace(self + " trait location " + traitLocation + ": setting PlanetTraitLocationScanCountRequired=" + scanCountNeeded )
            traitLocation.SetValue(SQ_Parent.PlanetTraitLocationScanCountRequired, scanCountNeeded)
        EndIf
    endif
EndEvent

Event OnMapMarkerDiscovered()
    debug.trace(self + " OnMapMarkerDiscovered")
    ; run short timer before showing message
    StartTimer(DiscoveryTimeSeconds, DiscoveryTimerID)
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == DiscoveryTimerID
        ; show explore message
        SQ_Parent.DiscoverMatchingPlanetTraits(self, false)
    endif
EndEvent

; Currently in a rough state since it was used for a simple prototype. Will require a pass if we decide to fully use this system.
Function HandleTraitEnabling()
    if TraitOverrideInitDone == false
        If (LocationTraitOverride == NONE)
            Keyword[] matchingTraits = new Keyword[0]
            Keyword[] planetTraits = GetCurrentPlanet().GetKeywordTypeList(SQ_Parent.KeywordType_PlanetTrait)
            debug.Trace(self + "|HandleTraitEnabling| This Planets Traits" + planetTraits)

            int planetTraitsIndex = 0
            While (planetTraitsIndex < planetTraits.length)
                Keyword currentKeyword = planetTraits[planetTraitsIndex]
                If GetRefsLinkedToMe(currentKeyword).Length > 0
                    matchingTraits.Add(currentKeyword)
                    debug.Trace(self + "|HandleTraitEnabling| This Overlay also includes Keyword: " + currentKeyword)
                Else
                    debug.Trace(self + "|HandleTraitEnabling| This Overlay does NOT include Keyword: " + currentKeyword)
                EndIf
                planetTraitsIndex += 1
            EndWhile

            debug.Trace(self + "|HandleTraitEnabling| Matching Traits with this Planet" + matchingTraits)

            If (matchingTraits.Length > 0)
                int traitToEnable = Utility.RandomInt(0, matchingTraits.Length-1)
                LocationTraitOverride = matchingTraits[traitToEnable]

                debug.Trace(self + "|HandleTraitEnabling| Picked trait to enable: " + LocationTraitOverride)
                GetRefsLinkedToMe(LocationTraitOverride)[0].EnableNoWait()
            EndIf
        EndIf
    EndIf
    TraitOverrideInitDone = true
EndFunction