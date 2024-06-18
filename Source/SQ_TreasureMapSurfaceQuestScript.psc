Scriptname SQ_TreasureMapSurfaceQuestScript extends SQ_TreasureMapQuestScript

ReferenceAlias property TreasureContainer auto const mandatory
{ Treasure container }

LocationAlias property dungeonLocation auto const mandatory
{ treasure location }

MissionParentScript property MB_Parent auto const mandatory
{ holds array of resource AVs }

; script variables
Location myDungeonLocation ; for speed
Resource myResource ; only filled in if type 1 (resources) treasure map

bool Function CreateTreasure()
    debug.trace(self + " CreateTreasure - surface")
    bool success = false

    ObjectReference treasureRef = Treasure.GetRef()
    SQ_TreasureMapScript treasureMapRef = TreasureMapOriginal.GetRef() as SQ_TreasureMapScript

    debug.trace(self + " treasureMapRef=" + treasureMapRef + " treasureRef=" + treasureRef)
    if treasureRef && treasureMapRef
        success = true ; we created a treasure!
        if treasureMapRef.TreasureMod
            treasureRef.AttachMod(treasureMapRef.TreasureMod)
        EndIf
        ; try to promote to legendary
        treasureRef.PromoteToLegendary()
        TreasureContainer.GetRef().AddItem(treasureRef)
        
        ; if necessary, add more to TreasureContainer
        if treasureMapRef.TreasureQuantityMax > 1
            int amountToAdd = Utility.RandomInt(treasureMapRef.TreasureQuantityMin, treasureMapRef.TreasureQuantityMax) - 1
            if amountToAdd > 0
                debug.trace(self + " adding " + amountToAdd + " to the treasure container")
                if treasureMapRef.TreasureAllTheSameThing
                    ; get base object from treasureRef and use that instead of Treasure
                    Form baseTreasure = treasureRef.GetBaseObject()
                    TreasureContainer.GetRef().AddItem(baseTreasure, amountToAdd)
                else
                    TreasureContainer.GetRef().AddItem(treasureMapRef.Treasure, amountToAdd)
                endif
            endif
        endif
        ; if this is a type 1 (resources) treasure map, set up cave so it has the right kind of resources
        if treasureMapRef.TreasureLocation == 1
            debug.trace(self + " resource treasure - setting resourceAV on the dungeon location")
            ; find resourceAV that matches treasure
            MiscObject treasureMiscObject = treasureRef.GetBaseObject() as MiscObject
            if treasureMiscObject
                MissionParentScript:MissionSupplyType[] resourceAVs = MB_Parent.resourceAVs
                ActorValue resourceAV = NONE
                int i = 0
                while i < resourceAVs.Length && resourceAV == NONE
                    ActorValue testResourceAV = resourceAVs[i].supplyAV
                    myResource = testResourceAV.GetResource()
                    debug.trace(self + " checking for myResource=" + myResource)
                    if myResource && treasureMiscObject.GetObjectResourceCount(myResource)
                        resourceAV = testResourceAV
                    endif
                    i += 1
                EndWhile
                debug.trace(self + " treasure resourceAV=" + resourceAV)
                if resourceAV
                    myDungeonLocation = dungeonLocation.GetLocation()
                    if myDungeonLocation
                        myDungeonLocation.SetValue(resourceAV, 1.0)
                    endif
                endif
                RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
            endif
        endif
    EndIf
    return success
endFunction

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
    if myDungeonLocation
        if akNewLoc == myDungeonLocation || akOldLoc == myDungeonLocation
            ; entering or leaving the location - update tracking
            UpdateItemTracking()
        endif
    endif
endEvent

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    debug.trace(self + " OnItemAdded akBaseItem=" + akBaseItem + " aiTransferReason=" + aiTransferReason)
    ; only count this if it comes from valid transfer reasons
    if aiTransferReason == 4 || aiTransferReason == 7 || aiTransferReason == 12 || aiTransferReason == 42
        SetStage(ObjectiveStage)
        UnregisterForRemoteEvent(Game.GetPlayer(), "OnItemAdded")
    endif
EndEvent

Guard itemTrackingGuard ProtectsFunctionLogic

Function UpdateItemTracking()
    debug.trace(self + " UpdateItemTracking")
    LockGuard itemTrackingGuard
        Actor playerRef = Game.GetPlayer()
        ; if player is currently in location, watch for item added
        if playerRef.GetCurrentLocation() == myDungeonLocation
            debug.trace(self + " in dungeon location - start tracking")
            AddInventoryEventFilter(myResource)
            RegisterForRemoteEvent(playerRef, "OnItemAdded")
        else
        ; otherwise stop tracking item added
            debug.trace(self + " NOT in dungeon location - STOP tracking")
            UnregisterForRemoteEvent(playerRef, "OnItemAdded")
        endif
    EndLockGuard
endFunction
