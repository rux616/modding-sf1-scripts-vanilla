Scriptname OutpostStarstationActorScript extends Actor

Keyword property SQ_OutpostCreateStarstationStoryEvent auto const mandatory
{ used to create orbital marker }

Keyword property LinkOutpostStarstationObject auto const mandatory
{ used to link actor to outpost functional proxy }

SpaceshipBase property OutpostStarstationShip01 auto const mandatory
{ use to create defense ships in orbit }

ObjectReference property myLandingMarker auto hidden
{ landing marker, set by Initialize }

SQ_OutpostCreateStarstationScript property SQ_OutpostCreateStarstation auto hidden
{ quest that holds orbital marker data }

ActorValue property SpaceshipRegistration auto const mandatory
{ to register the starstation }

ActorValue property PowerGenerated auto const mandatory
{ outpost stat }

ActorValue property OutpostStarstationShips auto const mandatory
{ create ships in orbit to match this }

ActorValue property OutpostScannerMultiplier auto const mandatory
{ outpost stat }

ActorValue property OutpostScannerRadius auto const mandatory
{ outpost stat }

float property OutpostScannerMultBase = 5.0 auto Const
{ this is what the outpost OutpostScannerMultiplier will be set to if the starstation OutpostScannerMultiplier > 0 }

float property OutpostScannerRadiusMax = 1000.0 auto Const
{ outpost scanner radius can't exceed this no matter what value is on the starstation }

SpaceshipReference orbitalShip

SpaceshipReference orbitalStarstation

ObjectReference myOutpostObject

bool initialized = false

; called by activator after linked refs are set up
Function Initialize(ObjectReference landingMarkerRef)
    debug.trace(self + " Initialize " + landingMarkerRef)
    if initialized == false
        myLandingMarker = landingMarkerRef
        debug.trace(self + " setting myLandingMarker=" + myLandingMarker)
        ; get my outpost object
        myOutpostObject = myLandingMarker.GetLinkedRef(LinkOutpostStarstationObject)

        ; create orbital
        SQ_OutpostCreateStarstationScript[] createOrbitalQuests = SQ_OutpostCreateStarstationStoryEvent.SendStoryEventAndWait(akRef1=myLandingMarker) as SQ_OutpostCreateStarstationScript[]
        if createOrbitalQuests.Length > 0
            SQ_OutpostCreateStarstation = createOrbitalQuests[0]
            while SQ_OutpostCreateStarstation.IsStarting()
                utility.wait(0.5)
            endWhile
            CreateStarstation()
            initialized = true
        Else
            Game.Warning(self + " failed to start a create starstation quest - no outpost starstation created")
        endif
    endif
EndFunction

function Cleanup()
    if SQ_OutpostCreateStarstation
        SQ_OutpostCreateStarstation.Stop()
    endif
EndFunction

Function ModifyStarstation()
    if initialized
        ObjectReference myOrbitMarker = SQ_OutpostCreateStarstation.CreatedOrbitalMarker.GetRef()
        myOrbitMarker.ShowHangarMenu(0, self, akMenuTarget=orbitalStarstation, abOpenToAvailableTab = false)
    endif
EndFunction

Function CreateStarstation()
    orbitalStarstation = SQ_OutpostCreateStarstation.Starstation.GetShipRef()
    ObjectReference myOrbitMarker = SQ_OutpostCreateStarstation.CreatedOrbitalMarker.GetRef()
    if orbitalStarstation
        ; orbitalStarstation vendor ownership
        orbitalStarstation.SetActorRefOwner(self)
        ; register for mod events
        RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerModifiedShip")
        
        ; add to player ship list (in order to be able to mod)
        ; TEMP until we get the event: GEN-527399
        SQ_PlayerShipScript SQ_PlayerShip = Game.GetForm(0x000174a2) as SQ_PlayerShipScript
        SQ_PlayerShip.AddPlayerOwnedShip(orbitalStarstation)
        ; once bug is fixed, can return to using:
        ;Game.AddPlayerOwnedShip(orbitalStarstation)
        
        ; register it
        orbitalStarstation.SetValue(SpaceshipRegistration, 1)
        ; update stats
        UpdateStarstationStats()
        debug.trace(self + "   created " + orbitalStarstation)
    Else
        debug.trace(self + " CreateStarstation: " + SQ_OutpostCreateStarstation + " failed to create a ship")
    endif
endFunction

Event Actor.OnPlayerModifiedShip(Actor akSender, SpaceshipReference akShip)
    debug.trace(self + " OnPlayerModifiedShip akShip=" + akShip)
    if akShip == orbitalStarstation
        debug.trace(self + " my starstation - check for updated stats etc.")
        UpdateStarstationStats()
    endif
EndEvent

; call this to update outpost object stats to match the starstation
Function UpdateStarstationStats()
    debug.trace(self + "UpdateStarstationStats")
    if orbitalStarstation
        ; power generated?
        float powerStat = orbitalStarstation.GetValue(PowerGenerated)
        debug.trace(self + " current power = " + powerStat)
        myOutpostObject.SetValue(PowerGenerated, powerStat)

        ; scan booster?
        float scanStat = orbitalStarstation.GetValue(OutpostScannerRadius)
        debug.trace(self + " scan boost range from starstation = " + scanStat)
        if scanStat > 0
            ; set to base multiplier (starstation doesn't increase the multiplier, just the range)
            myOutpostObject.SetValue(OutpostScannerMultiplier, OutpostScannerMultBase)
            scanStat = Math.Min(scanStat, OutpostScannerRadiusMax)
            myOutpostObject.SetValue(OutpostScannerRadius, scanStat)
        Else
            ; set back to 1 - no mult
            myOutpostObject.SetValue(OutpostScannerMultiplier, 1)
            myOutpostObject.SetValue(OutpostScannerRadius, 0)
        endif

        ; orbital ships?
        int shipsStat = orbitalStarstation.GetValueInt(OutpostStarstationShips)
        int currentShipCount = SQ_OutpostCreateStarstation.Ships.GetCount()
        debug.trace(self + " ships= " + shipsStat + " currentShipCount=" + currentShipCount)
        if shipsStat > currentShipCount
            ; need to create new ships
            int numberToCreate = shipsStat - currentShipCount
            debug.trace(self + " creating " + numberToCreate + " new ships")
            ObjectReference orbitMarker = SQ_OutpostCreateStarstation.CreatedOrbitalPatrolStart.GetRef()
            while numberToCreate > 0
                SpaceshipReference newShip = orbitMarker.PlaceShipAtMe(OutpostStarstationShip01)
                SQ_OutpostCreateStarstation.Ships.AddRef(newShip)
                debug.trace(self + "     created " + newShip)
                numberToCreate -= 1
            endWhile
        elseif shipsStat < currentShipCount
            ; need to delete ships to match shipsStat
            int numberToDelete = currentShipCount - shipsStat
            debug.trace(self + " deleting " + numberToDelete + " ships")
            while numberToDelete > 0
                ObjectReference shipToDelete = SQ_OutpostCreateStarstation.Ships.GetAt(0)
                debug.trace(self + "    removing " + shipToDelete + " from collection")
                SQ_OutpostCreateStarstation.Ships.RemoveRef(shipToDelete)
                shipToDelete.DisableNoWait()
                numbertoDelete -= 1
            EndWhile
        endif

    endif
EndFunction

function TestShowHangarMenu()
    myLandingMarker.ShowHangarMenu(0, self, NONE)
endFunction

