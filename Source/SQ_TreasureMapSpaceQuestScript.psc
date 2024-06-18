Scriptname SQ_TreasureMapSpaceQuestScript extends SQ_TreasureMapQuestScript

RefCollectionAlias property GeneralMarkers Auto Const Mandatory
{Possible locations at which loot items can be placed.}

RefCollectionAlias property TreasureContainers Auto Const Mandatory
{ put created containers here }

Container property SQ_TreasureMap_SpaceCrate auto const mandatory
{ standard "space crate"}

bool Function CreateTreasure()
    debug.trace(self + " CreateTreasure - space")

    bool success = false

    ObjectReference treasureRef = Treasure.GetRef()
    SQ_TreasureMapSpaceScript treasureMapRef= TreasureMapOriginal.GetRef() as SQ_TreasureMapSpaceScript

    debug.trace(self + " treasureMapRef=" + treasureMapRef + " treasureRef=" + treasureRef)
    if treasureRef && treasureMapRef
        int i = utility.RandomInt(treasureMapRef.TreasureContainersMin, treasureMapRef.TreasureContainersMax)
        int markerCount = GeneralMarkers.GetCount()
    ;Set max number of loot to place.
        if (i > markerCount)
            i = markerCount
        EndIf

        debug.trace(self + "GeneralMarkers count is " + markerCount)
        debug.trace(self + "Creating " + i + " containers")

        Form treasureItem
        if treasureMapRef.TreasureAllTheSameThing
            ; get base object from treasureRef and use that instead of Treasure
            treasureItem = treasureRef.GetBaseObject()
        else
            treasureItem = treasureMapRef.Treasure
        endif

    ;Place container at a random marker and add treasure to it until all containers are placed.
        while i > 0
            ObjectReference spawnMarker = GeneralMarkers.GetAt(Utility.RandomInt(0,GeneralMarkers.GetCount()-1)) as ObjectReference
            ObjectReference newContainer = spawnMarker.PlaceAtMe(SQ_TreasureMap_SpaceCrate)
            debug.trace(self + " Container " + newContainer + " placed at " + spawnMarker)        
            GeneralMarkers.RemoveRef(GeneralMarkers.GetAt(i))
            TreasureContainers.AddRef(newContainer)

            ; add treasure to the container
            int amountToAdd = Utility.RandomInt(treasureMapRef.TreasureQuantityMin, treasureMapRef.TreasureQuantityMax)
            if amountToAdd > 0
                newContainer.AddItem(treasureItem, amountToAdd)
                success = true
            endif

            i = i - 1
        endwhile
    endif
    return success
EndFunction


