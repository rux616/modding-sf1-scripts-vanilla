Scriptname UC02_QuestScript extends Quest

Struct BuildingPowerDatum
    RefCollectionAlias PowerBoxCollection
    {Ref collection that contains all the powerboxes for this building}

    ReferenceAlias PrimaryBoxAlias
    {Alias for the first box we want to direct the player towards}

    ReferenceAlias SecondaryBoxAlias
    {Alias for the second box we want to direct the player towards}

    ReferenceAlias TertiaryBoxAlias
    {Alias for the third box we want to direct the player towards}

    ReferenceAlias ObjAlias
    {Alias used to manage the objective}

    int ArrayIndex
    {An index used to look up the which array of power boxes to loop through}
EndStruct

Group ObjIndicesAndStages
    int Property ActivatePowerBoxesStage = 601 Const Auto
    {Stage set to direct the player to activate the power boxes}

    int Property PowerBoxActivatedObj = 601 Const Auto
    {Objective index for the player to start activating powerboxes}

    int Property RestoreLivestockScannerObj = 602 Const Auto
    {Objective index for "Restore the tracker" objective}

    int Property FirstLureActivatedStage = 630 Const Auto
    {Stage set when the first lure is activated}

    int Property AllPoweredUpObj = 650 Const Auto
    {Objective index to set once all the boxes are turned on}

    int Property TerrormorphDeadStage = 700 Const Auto
    {Stage set if the Terrormorph bites it}
EndGroup

Group Objects
    GlobalVariable Property UC02_PowerBoxesActivated Mandatory Const Auto
    {Global variable used to track how many power boxes the player has activated}

    GlobalVariable Property UC02_PowerBoxesTotal Mandatory Const Auto
    {Global variable used to track the total number of power boxes}

    BuildingPowerDatum[] Property BuildingPowerData Mandatory Auto
    {Array of building power data}

    WwiseEvent Property PrimeSoundEvent Auto Const Mandatory
    {Sound to play when the pumps are primed}
EndGroup

Group Aliases
    RefCollectionAlias Property PowerBoxes Mandatory Const Auto
    {General holding collection for powerboxes}

    ReferenceAlias Property Terrormorph Mandatory Const Auto
    {Ref alias for the Terrormorph}

    RefCollectionAlias[] Property PowerBoxCollections Mandatory Const Auto
    {Array of all the Powerbox collections for all the buildings}

    ReferenceAlias[] Property Building02Boxes Mandatory Auto
    {Array of all the aliases for building 01}

    ReferenceAlias[] Property Building03Boxes Mandatory Auto
    {Array of all the aliases for building 02}

    ReferenceAlias[] Property Building04Boxes Mandatory Auto
    {Array of all the aliases for building 03}

    RefCollectionAlias Property FuelTanks Mandatory Const Auto
    {Ref collection for all the fuel tanks in the area}

    ReferenceAlias Property PrimeSoundSource Auto Const Mandatory
    {Ref alias for the first prime sound source}

    RefCollectionAlias Property SecurityBldgDoors Auto Const Mandatory
    {Collection for all the doors in the security room}
EndGroup

Group Misc
    float Property MinPrimePumpDelay = 0.2 Const Auto  
    {Minimum amount of time to wait between prime pump sounds}

    float Property MaxPrimePumpDelay = 0.6 Const Auto  
    {Max amount of time to wait between prime pump sounds}
EndGroup

Function SetUpPowerboxObjective()
    int i = 0
    int iLength = PowerBoxCollections.Length
    int iCompletedBuildings
    trace(self, "SetUpPowerboxObjective(): ")

    while i < iLength
        RefCollectionAlias currColl = PowerBoxCollections[i]
        int currCount = currColl.GetCount()

        if currCount == 0
            iCompletedBuildings += 1
            trace(self, "Bulding " + currColl + " complete! Completed building count: " + iCompletedBuildings)
        endif

        i += 1
    endwhile 

    if iCompletedBuildings >= UC02_PowerBoxesTotal.GetValue()
        trace(self, "All building complete. Proceed!")
        SetStage(AllPoweredUpObj)
    else
        UC02_PowerBoxesActivated.SetValue(iCompletedBuildings)
        trace(self, "Updating the completed building global to: " + UC02_PowerBoxesActivated.GetValue())

        int j = 0
        int jLength = BuildingPowerData.Length

        trace(self, "Starting the update of the box chains!")
        while j < jLength
            BuildingPowerDatum currDatum = BuildingPowerData[j]
            RefCollectionAlias currColl = currDatum.PowerBoxCollection
            ObjectReference TargetObj
            ObjectReference FirstBox = currDatum.PrimaryBoxAlias.GetRef()
            ObjectReference SecondBox = currDatum.SecondaryBoxAlias.GetRef()
            ObjectReference ThirdBox = currDatum.TertiaryBoxAlias.GetRef()

            if currColl.Find(FirstBox) >= 0
                trace(self, "First box is still in collection: " + currColl)
                TargetObj = FirstBox
            elseif currColl.Find(SecondBox) >= 0
                trace(self, "Second box is still in collection: " + currColl)
                currDatum.PrimaryBoxAlias.Clear()
                TargetObj = SecondBox
            elseif currColl.Find(ThirdBox) >= 0
                trace(self, "Third box is still in collection: " + currColl)
                currDatum.PrimaryBoxAlias.Clear()
                currDatum.SecondaryBoxAlias.Clear()
                TargetObj = ThirdBox
            else
                trace(self, "All boxes cleared in collection: " + currColl)
                currDatum.PrimaryBoxAlias.Clear()
                currDatum.SecondaryBoxAlias.Clear()
                currDatum.TertiaryBoxAlias.Clear()
            endif

            currDatum.ObjAlias.ForceRefTo(TargetObj)
            trace(self, "Objective target for building: " + currColl + " is: " + currDatum.ObjAlias.GetRef())

            j += 1
        endwhile
    endif
EndFunction

Function UpdateBuildingPowerObjTarget(ObjectReference akSetBox, RefCollectionAlias akSourceCollection)
    int i = 0
    int iLength = PowerBoxCollections.Length
    bool bFoundBox
    BuildingPowerDatum TargetDatum
    int iArrayIndex
    ReferenceAlias TargetObjAlias
    trace(self, "UpdateBuildingPowerObjTarget(): Updating building power data from activated box: " + akSetBox)

    int iIndex = BuildingPowerData.FindStruct("PowerBoxCollection", akSourceCollection)
    TargetDatum = BuildingPowerData[iIndex]
    iArrayIndex = TargetDatum.ArrayIndex
    trace(self, "UpdateBuildingPowerObjTarget(): Found our box! It's index array is: " + iArrayIndex)

    if TargetDatum.ArrayIndex == 2
        trace(self, "Searching building 02 array for next objective target.")
        TargetObjAlias = UpdatePowerboxObjective(akSetBox, Building02Boxes)
    elseif TargetDatum.ArrayIndex == 3
        trace(self, "Searching building 03 array for next objective target.")
        TargetObjAlias = UpdatePowerboxObjective(akSetBox, Building03Boxes)
    elseif TargetDatum.ArrayIndex == 4
        trace(self, "Searching building 03 array for next objective target.")
        TargetObjAlias = UpdatePowerboxObjective(akSetBox, Building04Boxes)
    endif
        trace(self, "New objective target is: " + TargetObjAlias)

    if TargetObjAlias != none
        if TargetObjAlias.GetRef() != TargetDatum.ObjAlias.GetRef()
            TargetDatum.ObjAlias.ForceRefTo(TargetObjAlias.GetRef())
            trace(self, "New objective target is: " + TargetObjAlias)
        endif
    else
        TargetDatum.ObjAlias.Clear()
    endif
EndFunction

ReferenceAlias Function UpdatePowerboxObjective(ObjectReference akTriggeringBox, ReferenceAlias[] akTargetArray)
    int i = 0
    int iLength = akTargetArray.Length
    bool bFoundTarget
    ReferenceAlias ObjAlias
    trace(self, "UpdatePowerboxObjective(): Searching for our next objective from triggering box: " + akTriggeringBox + " in array: " + akTargetArray)

    while i < iLength && !bFoundTarget
        ReferenceAlias currAlias = akTargetArray[i]

        if currAlias.GetRef() == akTriggeringBox
            trace(self, "Just activated box was found in alias: " + currAlias)
            bFoundTarget = true
            currAlias.Clear()
        endif

        i += 1
    endwhile

    trace(self, "Now we grab the first filled alias in the array (which will be our new obj target).")
    int j = 0
    bool bFoundAlias

    while j < iLength
        ReferenceAlias currAlias = akTargetArray[j]
        trace(self, "Checking alias: " + currAlias)

        if currAlias.GetRef() != None
            trace(self, "Alias: " + currAlias + " isn't empty, so that's our target!")
            bFoundTarget = true
            ObjAlias = currAlias
        EndIf

        j += 1
    endwhile

    trace(self, "Our next obj target is: " + ObjAlias)
    return ObjAlias
EndFunction

Function UpdatePowerBoxCount(ObjectReference akTargetPowerBox, RefCollectionAlias akSourceColl)
    trace(self, "UpdatePowerBoxCount(): Activated box: " + akTargetPowerBox + " from source coll: " + akSourceColl)
    int iIndex = PowerBoxes.Find(akTargetPowerBox)
    PowerBoxes.RemoveRef(akTargetPowerBox)
    
    trace(self, "Found box at index: " + iIndex)
    trace(self, "Source collection count: " + akSourceColl.GetCount())

    if iIndex >= 0
        UpdateBuildingPowerObjTarget(akTargetPowerBox, akSourceColl)
        trace(self, "Already activated boxes: " + UC02_PowerBoxesActivated.GetValue() + ". Boxes Total: " + UC02_PowerBoxesTotal.GetValue())
    EndIf

    if akSourceColl.GetCount() <= 0 && GetStageDone(ActivatePowerBoxesStage)
        trace(self, "This one's empty! Already activated boxes: " + UC02_PowerBoxesActivated.GetValue() + ". Boxes Total: " + UC02_PowerBoxesTotal.GetValue())
        if ModObjectiveGlobal(1.0, UC02_PowerBoxesActivated, PowerBoxActivatedObj, UC02_PowerBoxesTotal.GetValue())
            trace(self, "All boxes found for collection" + akSourceColl + " Set stage: " + AllPoweredUpObj)
            SetStage(AllPoweredUpObj)
        endif
    endif
EndFunction

Function TriggerPumpPrimeAudio(float afInitialWait = 0.0)

    if afInitialWait > 0.0
        Utility.Wait(afInitialWait)
    endif

    ;Trigger the sound at the first source
    PrimeSoundEvent.Play(PrimeSoundSource.GetRef())

    Utility.Wait(Utility.RandomFloat(MinPrimePumpDelay, MaxPrimePumpDelay))

    ;Now have each other tank that's not destroyed sound off
    int i = 0
    int iCount = 1

    while i < iCount
        ObjectReference currTank = FuelTanks.GetAt(i)

        if !currTank.IsDisabled()
            Utility.Wait(Utility.RandomFloat(MinPrimePumpDelay, MaxPrimePumpDelay))
            PrimeSoundEvent.Play(currTank)
        endif
        i += 1
    endwhile
EndFunction

Function ToggleRestoreTrackerObj(bool bEnable = true)
    if !GetStageDone(TerrormorphDeadStage)
        if bEnable
            if !IsObjectiveDisplayed(RestoreLivestockScannerObj)
                SetObjectiveDisplayed(RestoreLivestockScannerObj)
            endif
        else
            if IsObjectiveDisplayed(RestoreLivestockScannerObj)
                SetObjectiveDisplayed(RestoreLivestockScannerObj, false, false)
            endif
        endif
    endif
EndFunction

Function SealSecurityBldgDoors(bool bClose = true)
    int i = 0
    int iCount = SecurityBldgDoors.GetCount()

    while i < iCount
        ObjectReference currRef = SecurityBldgDoors.GetAt(i)

        if bClose
            currRef.SetOpen(false)
            currRef.SetLockLevel(254)
            currRef.Lock()
        else
            currRef.SetLockLevel(0)
            currRef.Unlock()
            currRef.SetOpen(true)
        endif

        i += 1
    endwhile

EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC02", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction