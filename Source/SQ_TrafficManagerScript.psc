Scriptname SQ_TrafficManagerScript extends Quest
{Quest script for Traffic Manager}

RefCollectionAlias property Alias_EnterPoints Auto Const Mandatory
{RC of markers that represent where ships are entering and leaving the planet's atmosphere}

RefCollectionAlias property Alias_HoldPoints Auto Const Mandatory
{RC of markers that represent where ships might hold and park in the middle of the space}

RefCollectionAlias property Alias_ExitPoints Auto Const Mandatory
{RC of markers that represent where ships are entering and leaving the planet's gravity well via grav jump}

RefCollectionAlias property Alias_ShipsTransitNoWaitEntering Auto Const Mandatory
RefCollectionAlias property Alias_ShipsTransitNoWaitExiting Auto Const Mandatory
{RCs to hold ships that are going to fly straight through without waiting. Different group for different behaviors}

ReferenceAlias property Alias_Settings Auto Const Mandatory
{Object in the cell that holds all of the settings}

ReferenceAlias property PlayerShip Auto Const Mandatory
{PlayerShip Alias}

LocationAlias property PlayerShipLocation Auto Const Mandatory

Keyword Property LinkKeywordHold Auto Const Mandatory
{Keyword to define the hold point the ships are linked to, referred to by it's package}

Keyword Property LinkKeywordDestination Auto Const Mandatory
{Keyword to define the destination the ships are linked to, referred to by it's package}

Keyword Property SQ_TrafficManager_ToDelete Auto Const Mandatory
{Keyword to mark ships that are disabled and ready to be deleted}

;Local Variables - defined on settings object
int maxShips
Formlist TrafficShiplist
float MinRefreshTime
float MaxRefreshTime

;Local Variables - General
SpaceshipReference[] AllShips
int CheckStateTimerID = 1 Const
int despawnDist = 500 Const
float percentMaxSpeed = 1.0 Const
bool IsEntering

Event OnQuestinit()

    ;ships that are initially in the cell are placed in one of the marker cells dependent on density.
    
    ;derive settings from a script placed on an object in the cell.
    ObjectReference SettingsMarker = Alias_Settings.GetRef()
    SQ_TrafficManagerSettingsScript SettingsScript = SettingsMarker as SQ_TrafficManagerSettingsScript
    maxShips = SettingsScript.MaxShips
    TrafficShiplist = SettingsScript.TrafficShiplist
    MinRefreshTime = SettingsScript.MinRefreshTime
    MaxRefreshTime = SettingsScript.MaxRefreshTime

    RegisterForRemoteEvent(PlayerShip, "OnLocationChange")

    AllShips = new SpaceshipReference[0]

    ObjectReference[] myObjectRefs = Alias_ShipsTransitNoWaitEntering.GetArray()
    SpaceshipReference[] myShipRefs = myObjectRefs as SpaceshipReference[]
    int i = 0
    While (i < myShipRefs.Length)
		AllShips.Add(myShipRefs[i])
		i = i + 1
	EndWhile

    myObjectRefs = Alias_ShipsTransitNoWaitExiting.GetArray()
    myShipRefs = myObjectRefs as SpaceshipReference[]
    i = 0
    While (i < myShipRefs.Length)
		AllShips.Add(myShipRefs[i])
		i = i + 1
	EndWhile

    CheckState()

EndEvent


Function SpawnShip()
    
        ;spawn a ship, link it to it's points and add it to an alias
    
        SpaceshipReference newShip
        ObjectReference	DestinationLink
 
           ;switch between if they are entering (moving from exit points to entrance points) or exiting (moving from entrance points to exit points) from the planet
            
            if IsEntering == 1

                int tempSpawnPoint = Utility.RandomInt(0, (Alias_ExitPoints.GetCount()-1))
                int tempDestinationPoint = Utility.RandomInt(0, (Alias_EnterPoints.GetCount()-1))
                ObjectReference spawnMarkerRef = Alias_ExitPoints.GetAt(tempSpawnPoint)
                DestinationLink = Alias_EnterPoints.GetAt(tempDestinationPoint)

                newShip = spawnMarkerRef.PlaceShipAtMe(TrafficShiplist.GetAt(Utility.RandomInt(0,TrafficShiplist.GetSize()-1)), abplayfx=false, abInitiallyDisabled=True)
                
                ;TODO - needs to use whatever "arrival from planet into orbit solution" we have
                newship.EnableWithGravJump()
                Alias_ShipsTransitNoWaitEntering.AddRef(newShip)
                IsEntering = 0

            ElseIf IsEntering == 0

                int tempSpawnPoint = Utility.RandomInt(0, (Alias_EnterPoints.GetCount()-1))
                int tempDestinationPoint = Utility.RandomInt(0, (Alias_ExitPoints.GetCount()-1))
                ObjectReference spawnMarkerRef = Alias_EnterPoints.GetAt(tempSpawnPoint)
                DestinationLink = Alias_ExitPoints.GetAt(tempDestinationPoint)

                newShip = spawnMarkerRef.PlaceShipAtMe(TrafficShiplist.GetAt(Utility.RandomInt(0,TrafficShiplist.GetSize()-1)), abplayfx=false, abInitiallyDisabled=True, abDeleteWhenAble = true)
                
                newship.EnableWithGravJump()                
                Alias_ShipsTransitNoWaitExiting.AddRef(newShip)
                IsEntering = 1

                Endif

        newShip.SetLinkedRef(DestinationLink, LinkKeywordDestination, abPromoteParentRefr = false)
        newShip.SetForwardVelocity(percentMaxSpeed)

        Allships.Add(newShip)
        
EndFunction

Function CheckState()
   
    int i = AllShips.length-1
    ;check to see if any ships need to be despawned
    
    while i >= 0       

       SpaceshipReference currentShip = AllShips[i]

        if currentShip.HasKeyword(SQ_TrafficManager_ToDelete)
            AllShips.Remove(i)
            ;will be deleted automatically as the ship is spawned with abDeleteWhenAble = true  
            currentShip.Disable()
        EndIf

        if currentShip.GetDistance(currentShip.GetLinkedRef(LinkKeywordDestination)) < despawnDist
            
            if (currentShip.GetLinkedRef(LinkKeywordHold)) != None
                Alias_HoldPoints.AddRef(currentShip.GetLinkedRef(LinkKeywordHold))
            EndIf

            if Alias_ShipsTransitNoWaitExiting.Find(currentShip) >= 0
                Alias_ShipsTransitNoWaitExiting.RemoveRef(currentShip)
                currentShip.DisableWithGravJumpNoWait()
                currentShip.AddKeyword(SQ_TrafficManager_ToDelete)
            ElseIf Alias_ShipsTransitNoWaitEntering.Find(currentShip) >= 0
                Alias_ShipsTransitNoWaitEntering.RemoveRef(currentShip)
                currentShip.DisableWithTakeOffOrLandingNoWait()
                currentShip.AddKeyword(SQ_TrafficManager_ToDelete)
            endif
            
        endif

        i=i-1
        
    endwhile

    ;check to see if any ships need to be spawned
    if AllShips.length<maxShips
        SpawnShip()
    endif

    float TimerDuration = Utility.RandomFloat(MinRefreshTime,MaxRefreshTime)

    StartTimer(TimerDuration, CheckStateTimerID)

EndFunction

Event OnTimer(int timerID)
    if timerID == CheckStateTimerID
        CheckState()
    endif
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias source, Location akOldLoc, Location akNewLoc)
    if (akNewLoc != PlayerShipLocation.GetLocation())

        int i = AllShips.length-1
    
        while i >= 0

            SpaceshipReference currentShip = AllShips[i]
            currentShip.SetLinkedRef(None, LinkKeywordDestination, abPromoteParentRefr = false)
            currentShip.DisableNoWait()
            i=i-1
    
        EndWhile

    AllShips.Clear()
   	Stop()

    EndIf
EndEvent