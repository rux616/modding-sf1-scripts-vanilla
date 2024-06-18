Scriptname ShipVendorScript extends Actor conditional

Keyword property LinkShipLandingMarker01 auto const mandatory
{ link vendor to landing marker }

Keyword property SpaceshipStoredLink auto const mandatory
{ link ships to landing marker }

SQ_PlayerShipScript property SQ_PlayerShip Auto Const Mandatory
{ The main Player Ship system quest }

Location property ShipVendorLocation auto const
{ OPTIONAL - The location used to spawn vendor ships at for leveling purposes.
    If not filled in, script will use vendor's current location }

ShipVendorListScript property ShipsToSellListRandomDataset auto const
{ The data set for random ships to sell. }

ShipVendorListScript property ShipsToSellListAlwaysDataset auto const
{ The data set for ships that should always be available for sale. }

ShipVendorListScript property ShipsToSellListUniqueDataset auto const
{ The data set for unique ships to make available for sale. (Never respawns) }

int property ShipsForSaleMin = 4 auto const
{ NOTE: if these are 0, the only ships for sale will be from ShipsToSellListAlwaysDataset }

int property ShipsForSaleMax = 8 auto const

ObjectReference property myLandingMarker auto hidden
{ landing marker, set by OnInit }

RefCollectionAlias property PlayerShips auto const Mandatory
{ from SQ_Playership - need to know when player sells ships }

float property DaysUntilInventoryRefresh = 7.0 auto const
{ how many days until next inventory refresh? }

bool property BuysShips = true auto conditional
bool property SellsShips = true auto conditional

bool property InitializeOnLoad = true auto Const
{ if false, Initialize() needs to be called manually (e.g. for outpost ship vendor) }

ShipVendorListScript:ShipToSell[] ShipsToSellRandom
ShipVendorListScript:ShipToSell[] ShipsToSellAlways
ShipVendorListScript:ShipToSell[] ShipsToSellUnique
float lastInventoryRefreshTimestamp ; timestamp when last refresh happened

SpaceshipReference[] shipsForSale RequiresGuard(shipsForSaleGuard)


Guard shipsForSaleGuard

bool initialized = false

Event OnLoad()
    debug.trace(self + " OnLoad")
    HandleOnLoad()
EndEvent

Function Initialize(ObjectReference landingMarkerRef)
    debug.trace(self + " Initialize " + landingMarkerRef)
    if initialized == false
        ; Initialize arrays using datasets.
        ShipsToSellRandom = CopyShipToSellArray(ShipsToSellListRandomDataset.ShipList)
        ShipsToSellAlways = CopyShipToSellArray(ShipsToSellListAlwaysDataset.ShipList)
        ShipsToSellUnique = CopyShipToSellArray(ShipsToSellListUniqueDataset.ShipList)

        LockGuard shipsForSaleGuard
            myLandingMarker = landingMarkerRef
            debug.trace(self + " setting myLandingMarker=" + myLandingMarker)
            shipsForSale = new SpaceshipReference[0]
            initialized = true
        endLockGuard
        CheckForInventoryRefresh()
    endif
EndFunction

 ShipVendorListScript:ShipToSell[] function CopyShipToSellArray(ShipVendorListScript:ShipToSell[] arrayToCopy)
    ShipVendorListScript:ShipToSell[] myShipsToSell = new ShipVendorListScript:ShipToSell[arrayToCopy.Length]
    int i = 0
    while (i < arrayToCopy.Length)
        myShipsToSell[i] = arrayToCopy[i]
        i += 1
    endWhile
    return myShipsToSell
 endFunction

Function HandleOnLoad()
    ; register for ship sell events
    RegisterForRemoteEvent(PlayerShips, "OnShipSold")
    if initialized == false && InitializeOnLoad
        myLandingMarker = GetLinkedRef(LinkShipLandingMarker01)
        Initialize(myLandingMarker)
    endif
    if initialized
        CheckForInventoryRefresh()
    endif
endFunction

Function TestLinkedRefChildren(ObjectReference refToCheck, Keyword theKeyword)
    debug.trace(self + " GetRefsLinkedToMe=" + refToCheck.GetRefsLinkedToMe(theKeyword))
EndFunction

Event RefCollectionAlias.OnShipSold(RefCollectionAlias akSender, ObjectReference akSenderRef)
    debug.trace(self + " OnShipSold " + akSenderRef)
    ; if this ship is linked to this landing marker, add it to vendor's list
    SpaceshipReference soldShip = akSenderRef as SpaceshipReference
    if soldShip && soldShip.GetLinkedRef(SpaceshipStoredLink) == myLandingMarker
        LockGuard shipsForSaleGuard
            shipsForSale.Add(soldShip)
        endLockGuard
    endif
EndEvent

Event SpaceshipReference.OnShipBought(SpaceshipReference akSenderRef)
    debug.trace(self + " OnShipBought " + akSenderRef)
        LockGuard shipsForSaleGuard
            int shipsForSaleIndex = shipsForSale.Find(akSenderRef)
            if shipsForSaleIndex > -1
                shipsForSale.Remove(shipsForSaleIndex)
                ; remove from unique list if it exists
                if ShipsToSellUnique.Length > 0
                    LeveledSpaceshipBase soldLeveledSpaceshipBase = akSenderRef.GetBaseObject() as LeveledSpaceshipBase
                    debug.trace(self + " soldLeveledSpaceshipBase=" + soldLeveledSpaceshipBase)
                    int uniqueIndex = ShipsToSellUnique.FindStruct("leveledShip", soldLeveledSpaceshipBase)
                    if uniqueIndex > -1
                        debug.trace(self + " unique ship was bought - remove it from unique list")
                        ShipsToSellUnique.Remove(uniqueIndex)
                    endif
                endif
            endif
        endLockGuard
EndEvent

Function CheckForInventoryRefresh(bool bForceRefresh = false)
    if SellsShips
        float currentGameTime = Utility.GetCurrentGameTime()
        float nextRefreshTime = lastInventoryRefreshTimestamp + DaysUntilInventoryRefresh
        debug.trace(self + " CheckForInventoryRefresh currentGameTime=" + currentGameTime + " nextRefreshTime=" + nextRefreshTime)
        if bForceRefresh || lastInventoryRefreshTimestamp == 0 || (currentGameTime >= nextRefreshTime)
            debug.trace(self + " time to refresh inventory")

            LockGuard shipsForSaleGuard
                RefreshInventoryList(myLandingMarker, shipsForSale)
                debug.trace(self + " RefreshInventory: shipsForSale=" + shipsForSale)
            EndLockGuard
        EndIf
    endif
EndFunction

Function RefreshInventoryList(ObjectReference createMarker, SpaceshipReference[] shipList)
    debug.trace(self + " RefreshInventoryList: createMarker=" + createMarker + " ShipsToSellAlways=" + ShipsToSellAlways + " shipList=" + shipList)
    if createMarker
        Actor playerRef = Game.GetPlayer()
        int playerLevel = playerRef.GetLevel()

        ; clear existing list
        int i = shipList.Length - 1
        while i > -1
            SpaceshipReference theShip = shipList[i]
            theShip.Delete()
            i += -1
        endWhile
        shipList.Clear()

        ; how many ships do I want in my list?
        int totalShipsToCreateCount = Utility.RandomInt(ShipsForSaleMin, ShipsForSaleMax)
        int nonRandomShipsToCreateCount = (ShipsToSellAlways.Length + ShipsToSellUnique.Length)
        if totalShipsToCreateCount < nonRandomShipsToCreateCount
            totalShipsToCreateCount = nonRandomShipsToCreateCount
        EndIf
        int randomShipsToCreateCount = totalShipsToCreateCount - nonRandomShipsToCreateCount
        debug.trace(self + " RefreshInventoryList: creating " + totalShipsToCreateCount + " ships at landing marker " + createMarker)

        ; create priority ships
        debug.trace(self + " RefreshInventoryList: creating " + ShipsToSellAlways.Length + " priority ships (max)")
        CreateShipsForSale(ShipsToSellAlways, playerLevel, createMarker, shipList)        
            
        debug.trace(self + " RefreshInventoryList: creating " + randomShipsToCreateCount + " random ships")
        if randomShipsToCreateCount > 0
            ; Build a list of ships from the Random list that the player qualifies for that were not already included.
            ShipVendorListScript:ShipToSell[] currentShipsRandom = new ShipVendorListScript:ShipToSell[0]
            int currentShipsRandomIndex = 0
            while (currentShipsRandomIndex < ShipsToSellRandom.Length)
                ShipVendorListScript:ShipToSell theShipToSell = ShipsToSellRandom[currentShipsRandomIndex]
                if theShipToSell.minLevel <= playerLevel && ShipsToSellAlways.FindStruct("leveledShip", theShipToSell.leveledShip) == -1 && ShipsToSellUnique.FindStruct("leveledShip", theShipToSell.leveledShip) == -1
                    currentShipsRandom.Add(ShipsToSellRandom[currentShipsRandomIndex])
                endif
                currentShipsRandomIndex += 1
            endWhile

            ; Select random ships from the Random list.
            i = 0
            while i < randomShipsToCreateCount && currentShipsRandom.Length > 0
                int randomIndex = Utility.RandomInt(0, currentShipsRandom.Length-1)
                CreateShipForSale(currentShipsRandom[randomIndex].leveledShip, createMarker, shipList)

                ; Remove the entry we just selected to prevent it from being selected in this refresh again.
                currentShipsRandom.Remove(randomIndex)
                i += 1
            EndWhile
        endif

        ; Lastly, create unique ships that appear at the end of the list
        debug.trace(self + " RefreshInventoryList: creating " + ShipsToSellUnique.Length + " unique ships (max)")
        CreateShipsForSale(ShipsToSellUnique, playerLevel, createMarker, shipList)

        lastInventoryRefreshTimestamp = Utility.GetCurrentGameTime()
    endif
    
    debug.trace(self + " RefreshInventoryList: DONE: shipList=" + shipList)
    debug.trace(self + " RefreshInventoryList: Leveled Base Ships in shipList:")
    int i = 0
    while i < shipList.Length
        debug.trace(self + " RefreshInventoryList:    " + shipList[i].GetBaseObject())
        i += 1
    endWhile
endFunction

function CreateShipsForSale(ShipVendorListScript:ShipToSell[] shipToSellList, int playerLevel, ObjectReference createMarker, SpaceshipReference[] shipList)
    int i = 0
    if shipToSellList.Length > 0
        while i < shipToSellList.Length
            ShipVendorListScript:ShipToSell theShipToSell = shipToSellList[i]
            if playerLevel >= theShipToSell.minLevel
                CreateShipForSale(theShipToSell.leveledShip, createMarker, shipList)
                debug.trace(self + " CreateShipsForSale: shipList=" + shipList)
            Else
                debug.trace(self + " player level not high enough for " + theShipToSell)
            endif
            i += 1
        endWhile
    endif
EndFunction

function CreateShipForSale(LeveledSpaceshipBase leveledShipToCreate, ObjectReference landingMarker, SpaceshipReference[] shipList)
    debug.trace(self + " CreateShipForSale: landingMarker=" + landingMarker)
    ObjectReference createMarker = landingMarker
    
    SpaceshipReference landingMarkerShipRef = landingMarker.GetCurrentShipRef()
    if landingMarkerShipRef
        ; create new ship at my ship rather than the landing marker to avoid issues with creating a ship inside a ship
        createMarker = landingMarkerShipRef
        debug.trace(self + " landingMarker is in a ship; create new ship at the shipRef=" + landingMarkerShipRef)
    endif

    Location encounterLocation = ShipVendorLocation
    if encounterLocation == None
        encounterLocation = GetCurrentLocation()
    endif
    SpaceshipReference newShip = createMarker.PlaceShipAtMe(leveledShipToCreate, aiLevelMod = 2, abInitiallyDisabled = true, akEncLoc = encounterLocation)
    if newShip
        shipList.Add(newShip)
        ; link to landing pad
        newShip.SetLinkedRef(landingMarker, SpaceshipStoredLink)
        ; assign vendor ownership
        newShip.SetActorRefOwner(self)
        ; register for player buying event
        RegisterForRemoteEvent(newShip, "OnShipBought")
        ; clear inventory
        newShip.RemoveAllItems()

        debug.trace(self + "   created " + newShip + " array is now: " + shipList)
    Else
        debug.trace(self + "   PlaceShipAtMe failed to create a ship at " + landingMarker)
    endif
endFunction

SpaceshipReference function GetShipForSale(int index = 0)
    SpaceshipReference shipforSale = NONE
    LockGuard shipsForSaleGuard
        if shipsForSale.Length > 0
            if index > -1 && index < shipsForSale.Length
                shipforSale = shipsForSale[index]
            elseif index >= shipsForSale.Length
                shipforSale = shipsForSale[shipsForSale.Length-1]
            else
                shipforSale = shipsForSale[0]
            endif
        endif
    endLockGuard
    debug.trace(self + " GetShipForSale " + index + " " + shipforSale)
    return shipforSale
endFunction

function TestShowHangarMenu()
    myLandingMarker.ShowHangarMenu(0, self, NONE)
endFunction

function TestOutputShipsForSale()
    LockGuard shipsForSaleGuard

    int i = 0
    while i < shipsForSale.Length
        SpaceshipReference theShip = shipsForSale[i]
        debug.trace(self + " i=" + i + ": " + theShip)
        i += 1
    endWhile
    EndLockGuard
EndFunction
