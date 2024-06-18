Scriptname TestKurtArtifactTempleQuestScript extends Quest

ReferenceAlias property PlayerShip auto const mandatory

LocationAlias property PlanetWithTrait auto const mandatory

Keyword property LocTypeMajorOrbital auto const mandatory

LocationAlias property TempleLocation auto const mandatory

Int Property LandingSetStage=30 Auto Const

Int Property PowerSetStage=50 Auto Const

ReferenceAlias Property TemplePowerTrigger Mandatory Const Auto

Event OnQuestInit()
    RegisterForRemoteEvent(PlayerShip, "OnShipLanding")
    RegisterForRemoteEvent(Game.GetPlayer(), "OnExitShipInterior")
    RegisterForRemoteEvent(TemplePowerTrigger, "OnAliasChanged")
EndEvent

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSource, bool abComplete)
    ; watch for ship to land on target planet
    if abComplete
    	RefillTemple()
    endif
endEvent

function RefillTemple()
        Location landingLocation = PlayerShip.GetRef().GetCurrentLocation()
        Location planetLocation = PlanetWithTrait.GetLocation()
        debug.trace(self + " RefillTemple landingLocation=" + landingLocation + " planetLocation=" + planetLocation)
        if landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital)
            debug.trace(" target planet - refill templeLocation")
            TempleLocation.RefillAlias()
            TempleLocation.RefillDependentAliases()
        endif
endFunction

Event Actor.OnExitShipInterior(Actor akSource, ObjectReference akShip)
    Location landingLocation = akShip.GetCurrentLocation()
    Location planetLocation = PlanetWithTrait.GetLocation()
    if landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital)
        SetStage(LandingSetStage)
    EndIf
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, bool abRemove)
    ;when this alias fills, register for the custom event letting us know the player finished the puzzle
    RegisterForCustomEvent((TemplePowerTrigger.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
EndEvent

Event SBPowerCollectionActivatorScript.PowerAcquiredEvent(SBPowerCollectionActivatorScript akSender, Var[] akArgs)
    If (akSender == TemplePowerTrigger.GetRef()) && (GetStageDone(PowerSetStage) == False)
        SetStage(PowerSetStage)
    EndIf
EndEvent