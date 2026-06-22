Scriptname OE_ShipsAddonScript extends Quest
{Must be used with OEScript.}

import CommonArrayFunctions

Struct ShipDatum 
    SpaceshipBase ShipToSpawn
    {SpaceshipBase may be templated to a leveled list of ships. If blank, will attempt to get ship from DefaultGroupSpawnQuestScript.}
    int SpawnGroupID = 0
    { if ShipToSpawn is blank, use this groupID to get a ship from DefaultGroupSpawnQuestScript.}
    GlobalVariable SpawnGroupShipType
    { can be used to specify a specific type of ship from DefaultGroupSpawnQuestScript.
        Filter on SQ_Group_SpawnType_Ship* }
    ConditionForm SpawnConditions 
    {Conditions must be True at the time of spawning for the ship to spawn.}
    ConditionForm LaunchConditions 
    {If blank, ship will launch when LaunchShip() is called. If filled, when LaunchShip() is called, the ship's LaunchConditions must also be met.}
    int ShipLevelMod = 1
    {Default=1 (Medium). The aiLevelMod of the spawned spaceship; 0=Easy, 1=Medium, 2=Hard, 3=Boss.}
    bool TryToStartLanded = False
    {DEFAULT=False. 
        Spaceship starts the quest while landed, if a marker exists. 
        When markers are exhausted, ships may still spawn and land later, if it works out.
        These are considered in order of top to bottom, so the last Ship with this set to True gets whatever marker is left, if any.}       
    GlobalVariable LockLevel = NONE 
    { Filter for: LockLevel_* }
    ReferenceAlias ShipOwner = None
    { if ShipOwner will be used to set ownership on the ship and doors }
    Faction ShipFaction = None
    { if ShipOwner is not set, ShipFaction will be used to set ownership on the ship and doors }
    bool hasLanded = False hidden
    {Set by the Script, do not alter. TODO: GEN-341055 Hidden Struct Members Remain Visible.}
    SpaceshipReference SpaceshipREF = None  hidden 
    {Set by the Script, do not alter. TODO: GEN-341055 Hidden Struct Members Remain Visible.}
    ObjectReference LandingMarkerREF = None hidden 
    {Set by the Script, do not alter. TODO: GEN-341055 Hidden Struct Members Remain Visible.}
    int StageToSetOnLanding = -1
    { set this stage when this ship lands }
    int StageToSetOnTakeoff = -1
    { set this stage when this ship takes off }
    int StageToSetOnPlayerBoarding = -1
    { set this stage when this ship is boarded by the player }
    bool StopQuestIfPlayerHomeShip = true 
    { if true, stop my quest if this ship becomes the player's home ship (meaning they stole it) }
EndStruct 

Struct LandingMarkerDatum 
    ReferenceAlias LandingMarkerAlias = NONE hidden 
    {Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible.}
    ObjectReference LandingMarkerREF = NONE hidden 
    {Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible.}
    ReferenceAlias LandedShipAlias = NONE hidden 
    {Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible.}
    int ShipDatumIndex = -1 hidden 
    {Filled by script. TODO: GEN-341055 Hidden Struct Members Remain Visible.}
EndStruct

Group Ships
    ShipDatum[] property ShipData Auto 
    {These ships are eligible to start landed or land during the encounter.}
    bool property TryToUseAllStartLandedShips = True Auto const
    {DEFAULT=True. If there are more ships with TryToStartLanded=True than Landing Markers, the ships not selected to Start Landed will be available to 
        land later unless this is marked as False. Ships will still need to pass the conditions to land later.}
    bool property RandomizeStartLandedShips = True Auto const
    {DEFAULT=True. If multiple ships are set to TryToStartLanded=True then pick from the TryToStartLanded ships with true conditions randomly until there
        are no more Landing Markers. 
        FALSE=Picks in the order that they are entered into the array, if conditions are met.}
    bool property RandomizeLandingShips = True Auto const
    {DEFAULT=TRUE. When ships land after the start of the quest, any available ship that hasn't already landed is eligible to land.
        FALSE=Selects the next landing ship in order in the array, if conditions are met.}
    int property minShipsStartLanded = 1 Auto
    {Minimum number of ships to Start Landed. Ships must exist with the TryToStartLanded flag set to True to be eligible.
    If 2 ships are desired, set min and max to 2.}
    int property maxShipsStartLanded = 3 Auto
    {This is how many ships will start landed, at max. Ships must exist with the TryToStartLanded flag set to True to be eligible.}
EndGroup

;-----------AUTOFILL PROPERTIES------------------------> 
Group AutofillProperties
    ; Ships
    ReferenceAlias property Marker_ShipLandingA Auto const Mandatory  ; Only one Landing Marker alias *must* fill
    ReferenceAlias property Marker_ShipLandingB Auto const
    ReferenceAlias property Marker_ShipLandingC Auto const
    ReferenceAlias property ShipA Auto const
    ReferenceAlias property ShipB Auto const
    ReferenceAlias property ShipC Auto const

    ; Keywords
    Keyword Property LandingZoneTriggerKeyword Auto Const Mandatory     
    Keyword property OEShipStartsLandedKeyword Auto Const Mandatory
    Keyword property OELinkLandingMarkerKeyword Auto Const Mandatory
    Keyword property SpaceshipLinkedInterior Auto Const Mandatory

    ; Global Lock Levels
    GlobalVariable Property LockLevel_Inaccessible Auto Const Mandatory
    GlobalVariable Property LockLevel_Master Auto Const Mandatory
    GlobalVariable Property LockLevel_Expert Auto Const Mandatory
    GlobalVariable Property LockLevel_Advanced Auto Const Mandatory
    GlobalVariable Property LockLevel_Novice Auto Const Mandatory

    SQ_PlayerShipScript property SQ_PlayerShip auto const mandatory
EndGroup 

;-----------SCRIPT VARIABLES---------------------------> 
;-- GENERAL 
    Actor PlayerREF
    bool gbStartLandedMode      = True 
    LandingMarkerDatum[] LandingMarkerData

;-- SHIPS
    SpaceshipReference[] gLandedShipRefsArray               ; Index matches ShipIndex and stores a landed Spaceship Reference
    int[] gStartLandedShipsArray
    int[] gLandingShipsArray
    bool gbEnableShips = false                              ; Until set to true, ships cannot start landed or land during the encounter. Ships are "off".
    bool initialized = false                                ; set to true when OnQuestStarted() completes

;-- LOG SETTINGS
    String property LocalScriptName 	= "OE_ShipsAddonScript" auto const
    {Name of the local script. Don't modify.}
    String Property MainLogName         = "OE" Auto const hidden
    {OPTIONAL: Modify with your specific OE Name, if desired. This is the name of your log in Genesis\Build\PC\Logs\Script\User}
    String Property SubLogName          = "Ships" Auto const hidden
    {OPTIONAL: Leave as Warnings -- this appends to the MainLogName with its own file for serious issues.}    

;-------INITIALIZAION FUNCTIONS---------------------------> 
Event OnQuestStarted()
    string FunctionName = "OnQuestStarted()"
    PlayerREF = Game.GetPlayer()

    ; Ships
    gStartLandedShipsArray          = new Int[0]        ; Holds ShipData indices for ships that are chosen to Start Landed. 
    gLandingShipsArray              = new Int[0]
    gLandedShipRefsArray            = new SpaceshipReference[ShipData.Length] ; set to a ref when matching ship from ShipData array lands
    gbStartLandedMode               = True
    gbEnableShips                   = False  ; needs to be set to true by _ErrorCheck

    ; Landing Markers 
    LandingMarkerData               = new LandingMarkerDatum[0]

    ; This prints before the Logs are setup just in case logs are not activating.
    Trace(Self, FunctionName + ": Script starting: " + LocalScriptName )

    ; Check that the designer input is valid.
    gbEnableShips = ErrorCheck()
    
    ; Set up Landing Markers 
    SetupLandingMarkers() 

    ; Set up Ships that want to Start Landed, if they exist.
    SetupStartLandedShips()

    ; Sets up Ships that Land during the encounter, if they exist. 
    SetupLandingShips() 

    ; Spawn ships that Start Landed
    SpawnStartLandedShips()

    Trace(Self, FunctionName + ": gbEnableShips: " + gbEnableShips )
    Trace(Self, FunctionName + ": Script finished: " + LocalScriptName )

    initialized = true
EndEvent 

;------------INITIAL SETUP 

; Check for critical issues that might prevent the Addon from working. Called by Initialize(). Returns True if there are no critical errors.
bool Function ErrorCheck() Private
    string FunctionName = "ErrorCheck()"
    int ShipDataIndex = 0   
    int enabledMarkers = 0   ; Used to report issues in traces
    int numShips = 0
    int index = 0

    ; Make sure we have ships. If there are no ships, turn off the feature. 
    If ShipData.Length <= 0
        Warning(Self, FunctionName + ": --> BUG! There are no ships defined in the script properties! Script requires ship data. Ending " + LocalScriptName )
        Return False 
    Else 
        ; Clear out any cruft in the Ships aliases. These are filled by the script.
        If ShipA != NONE 
            ShipA.Clear()
        EndIf 

        If ShipB != NONE
            ShipB.Clear()
        EndIf 

        If ShipC != NONE
            ShipC.Clear()
        EndIf 

        ; Check that at least 1 Landing Markers filled, if none filled, disable the Ships Addon
        If Marker_ShipLandingA != NONE && Marker_ShipLandingA.GetRef() != None 
            enabledMarkers += 1
        EndIf 
        
        If Marker_ShipLandingB != NONE && Marker_ShipLandingB.GetRef() != None 
            enabledMarkers += 1
        EndIf 
        
        If Marker_ShipLandingC != NONE && Marker_ShipLandingC.GetRef() != None 
            enabledMarkers += 1
        EndIf 

        ; All markers are broken --> end the script.
        If enabledMarkers == 0
            Warning(Self, functionName + ": --> BUG! Landing Marker Reference Aliases were NOT filled! Ships cannot land. No Landing Marker at this Overlay? Ending " + LocalScriptName )
            Return False 
        EndIf 

        ; No ships are available --> end the script.
        numShips = ShipData.Length
        If numShips < 1
            Trace(Self, functionName + ": --> BUG! ShipData has no valid Ships! Ensure SpaceshipBase in ShipData contains valid ships in script properties. Ending " + LocalScriptName )
            Return False 
        EndIf 

        DefaultGroupSpawnQuestScript myGroupSpawnQuest = (self as Quest) as DefaultGroupSpawnQuestScript

        ; Ensure ShipData holds Ships and that all of them have valid data. 
        While ShipDataIndex < numShips
            ShipDatum theShipDatum = ShipData[ShipDataIndex]
            ; bad data protection
            If theShipDatum.hasLanded
                theShipDatum.hasLanded = False
                Warning(Self, functionName + ": --> BUG! ShipData[" + ShipDataIndex + "].hasLanded should NOT be set by script properties manually. Setting to false. Repairing bad data...")
            EndIf
            ; try to get ship owner faction from DefaultGroupSpawnQuestScript
            if myGroupSpawnQuest && theShipDatum.ShipFaction == NONE && theShipDatum.ShipOwner == NONE
                theShipDatum.ShipFaction = myGroupSpawnQuest.GetGroupOwnershipFaction(theShipDatum.SpawnGroupID)
                Trace(Self, functionName + ": Got ShipFaction from DefaultGroupSpawnQuestScript: " + theShipDatum.ShipFaction )
            EndIf

            ShipDataIndex += 1
        EndWhile  

        ; Set all Landing Markers to available
        _ResetLandingMarkers()
    EndIf

    Trace(Self, functionName + ": Landing Markers filled: " + enabledMarkers + ", Ships in the landing queue: " + numShips )
    Return True
EndFunction 

;------------SETUP MARKERS SECTION

; Add any Landing Marker Refs to the global LandingMarkerArrays. Called by Initialize(). Returns False is there are no landing markers to set up.
Function SetupLandingMarkers() Private
    string FunctionName = "SetupLandingMarkers()"
    bool MarkerStatus = False

    ; If the module has been disabled, exit the function.
    If !gbEnableShips
        Return  
    EndIf 

    ; Add any filled Landing Markers to the Landing Marker Struct. 
    _SetupLandingMarker(Marker_ShipLandingA, ShipA)
    _SetupLandingMarker(Marker_ShipLandingB, ShipB)
    _SetupLandingMarker(Marker_ShipLandingC, ShipC)

    ; Clamp values to appropriate amounts. OEs have 1-3 Landing Markers.
    If LandingMarkerData.Length > 0
        MarkerStatus = True 

        minShipsStartLanded = Math.Clamp(minShipsStartLanded as Float, 0.0, LandingMarkerData.Length as Float) as Int 
        maxShipsStartLanded = Math.Clamp(maxShipsStartLanded as Float, 0.0, LandingMarkerData.Length as Float) as Int 

        Trace(Self, functionName + ": LandingMarkerData.Length=[" + LandingMarkerData.Length + "] minShipsStartLanded=[" + minShipsStartLanded + "] maxShipsStartLanded=[" + maxShipsStartLanded + "]" )
    EndIf 
    
    If MarkerStatus 
        Trace(Self, functionName + ": Finished setting up " + LandingMarkerData.Length + " Landing Markers." ) 
    Else 
        Warning(Self, functionName + ": no Landing Markers are available, turning off " + LocalScriptName ) 
    EndIf 

    gbEnableShips = MarkerStatus 
EndFunction 

; Helper function for SetupLandingMarkers(). This adds any filled Landing Markers to the Landing Marker Struct. 
Function _SetupLandingMarker(ReferenceAlias akRefAlias, ReferenceAlias akShipAlias) Private
    if akRefAlias && akRefAlias.GetRef()
        LandingMarkerDatum temp = new LandingMarkerDatum 

        temp.LandingMarkerAlias = akRefAlias 
        temp.LandedShipAlias = akShipAlias

        LandingMarkerData.Add(temp)
        Trace(Self, "_SetupLandingMarker: RefAlias=" + temp.LandingMarkerAlias + " --> " + temp.LandingMarkerAlias.GetRef() )
    EndIf
EndFunction 

;------------SETUP SHIPS SECTION

; Set up any Ships set to Start Landed (snap into the landing marker instantly upon loading). Called by OnQuestStarted(). 
Function SetupStartLandedShips() Private
    string FunctionName = "SetupStartLandedShips()"
    int[] allStartLandedShips = new int[0]    
    bool enableStartLandedMode = True  
    int allowedLandingMarkers = 0
    int StartLandedShipsIndex = 0
    int ShipDataIndex = 0
    int index = 0

    ; If the module has been disabled, exit the function.
    If !gbEnableShips
        Return  
    EndIf 

    ; Get all StartLanded ships that pass Condition checks. 
    allStartLandedShips = _GetAllStartLandedShips()
    allowedLandingMarkers = Utility.RandomInt(minShipsStartLanded, maxShipsStartLanded)

    ; These values are verified & clamped in ErrorCheck()
    If !gbStartLandedMode
        Trace(Self, functionName + ": gbStartLandedMode: " + gbStartLandedMode ) 
        Return  
    Else
        ; Some ships want to Start Landed *and* we have at least one selected Landing Marker. 
        Trace(Self, functionName + ": allStartLandedShips.Length: " + allStartLandedShips.Length )
        Trace(Self, functionName + ": minShipsStartLanded: " + minShipsStartLanded )
        Trace(Self, functionName + ": maxShipsStartLanded: " + maxShipsStartLanded )
        Trace(Self, functionName + ": allowedLandingMarkers: " + allowedLandingMarkers )
    EndIf 
   
    ; No StartLanded Ships
    If allStartLandedShips.Length < 1
        Trace(Self, functionName + ": no ships qualified to Start Landed." ) 

    ; No Landing Markers
    ElseIf allowedLandingMarkers < 1       
        ; Move any Start Landed Ships to the regular Ships queue. 
        While index < ShipData.Length
            If TryToUseAllStartLandedShips
                Trace(Self, FunctionName + ": setting ShipData[" + index + "].TryToStartLanded to false - no landing markers. allowedLandingMarkers: " + allowedLandingMarkers)
                ShipData[index].TryToStartLanded = False
            EndIf 
            index += 1
        EndWhile

    Else 
        ; There are more Ships that qualify to Start Landed than Landing Markers. Select which ones will Start Landed. Handle the leftovers per settings.
        If allowedLandingMarkers < allStartLandedShips.Length
            ; ToDo: Remove
            Trace(Self, functionName + ": selecting " + allowedLandingMarkers + " ship(s) to Start Landed out of " + allStartLandedShips.Length + " eligible ship(s).") 

            ; Select a Ship Randomly or in order of entry in ShipData 
            While index < allStartLandedShips.Length && allowedLandingMarkers > 0
                ; e.g. allStartLandedShips [0]=2    [1]=4   [2]=5   [3]=9  <-- grab the index first
                If RandomizeStartLandedShips
                    StartLandedShipsIndex = Utility.RandomInt(0, allStartLandedShips.Length-1)
                    Trace(Self, functionName + ": RandomizeStartLandedShips: True. Selecting ships randomly from the queue of Start Landed ships." )
                Else 
                    StartLandedShipsIndex = index
                    Trace(Self, functionName + ": RandomizeStartLandedShips: False. Selecting the first ships that qualify to Start Landed." )
                EndIf 

                ; Now get the ShipDataIndex from the array using the selected index 
                ShipDataIndex = allStartLandedShips[StartLandedShipsIndex]
                Trace(Self, functionName + ": ShipDataIndex = allStartLandedShips[StartLandedShipsIndex=" + StartLandedShipsIndex + "] = " + ShipDataIndex ) 

                ; Add the ShipData Index from the array of all Start Landed Ships to the global list of Ships that will spawn. 
                gStartLandedShipsArray.Add(ShipDataIndex)

                ; Remove it from the temp array so we can handle any leftovers. This also controls the Loop. 
                allStartLandedShips.Remove(index)

                ; Each selected ship takes up one Landing Marker. Once we have no more landing markers, we're done. Break out of the loop. 
                AllowedLandingMarkers -= 1
                Trace(Self, FunctionName + ": gStartLandedShipsArray.Add(" + ShipDataIndex + "), allStartLandedShips.Remove(" + index + ")" )
            EndWhile 
        Else 
            ; There's at least one Landing Marker for each of the Start Landed ships, so all of them may attempt to Start Landed.
            Trace(Self, functionName + ": there are " + allStartLandedShips.Length + " eligible ships and " + AllowedLandingMarkers + " Landing Markers are available. All ships will try to land.")

            ; Copy the ShipDataIndices from allStartLandedShips into the global array, then clear out allStartLandedShips. 
            gStartLandedShipsArray = CopyIntArray(allStartLandedShips, "gStartLandedShipsArray", "allStartLandedShips", functionName )

            Trace(Self, functionName + ": allStartLandedShips.Length: " + allStartLandedShips.Length )            
            Trace(Self, functionName + ": gStartLandedShipsArray.Length: " + gStartLandedShipsArray.Length )

            allStartLandedShips.Clear()
        EndIf

        ; If any ships remain in the StartLanded array, deal with them according to settings. 
        If TryToUseAllStartLandedShips && allStartLandedShips.Length > 0
            While allStartLandedShips.Length > 0
                index = allStartLandedShips[0]
                Trace(Self, functionName + ": moving ship #" + index + " from the StartLanded queue to the LandLater queue.")
                ShipData[index].TryToStartLanded = False
                allStartLandedShips.Remove(0)
            EndWhile 
        EndIf 

        ; Clear potentialShips array just in case.
        allStartLandedShips.Clear()
    EndIf

    ; finished start landed mode
    Trace(Self, functionName + ": ships selected to Start Landed:" + gStartLandedShipsArray.Length )
EndFunction

; Returns all ShipData indices that want to Start Landed and pass conditions.
;   Called by _SetupStartLandedShips()
;   Returns array of ShipIndexes that want to start landed.
int[] Function _GetAllStartLandedShips() private 
    string FunctionName = "GetAllStartLandedShips()"
    int[] potentialShips = new int[0]
    int index = 0

    ; Sort the ShipData into an array of ships that want to Start Landed.
    While index < ShipData.Length
        If ShipData[index].TryToStartLanded 
            ; Since we only start ships landed once, only accept those whose conditions are true right now.
            If _CanShipLand(index)
                Trace(Self, functionName + ": Ship #" + index + " is set to Start Landed and Conditions are valid. Adding to potentialShips." )
                potentialShips.Add(index)
            ElseIf TryToUseAllStartLandedShips 
                ; The Designer wants start landed ships to be able to land later if their conditions fail here.
                ShipData[index].TryToStartLanded = False
                Trace(Self, functionName + ": Ship #" + index + " cannot land. Conditions? Since TryToUseAllStartLandedShips=" + TryToUseAllStartLandedShips + ", setting TryToStartLanded to False so it may attempt to land during the encounter.")
            EndIf 
        EndIf 
        index += 1
    EndWhile 
    Trace(Self, functionName + ": potentialShips.Length: " + potentialShips.Length )
    Return potentialShips
EndFunction 

; Sets up Ships that are eligible to land during the encounter. Called by _SetupShips() after _SetupStartLandedShips() is complete.
Function SetupLandingShips() Private
    string FunctionName = "SetupLandingShips()"
    int ShipDataIndex = 0

    ; If the module has been disabled, exit the function.
    If !gbEnableShips
        Return  
    EndIf 

    While ShipDataIndex < ShipData.Length
        bool hasLanded = ShipData[ShipDataIndex].hasLanded
        bool startsLanded = ShipData[ShipDataIndex].TryToStartLanded

        Trace(Self, functionName + ": ShipData[" + ShipDataIndex + "].TryToStartLanded=[" + startsLanded + "]" ) 
        Trace(Self, functionName + ": ShipData[" + ShipDataIndex + "].hasLanded=[" + hasLanded + "]" )

        ; Fill the array with all of the ships that will land during the encounter 
        If !hasLanded && !startsLanded
            Trace(Self, functionName + ": Ship #" + ShipDataIndex + " selected to land during the encounter." )
            gLandingShipsArray.Add(ShipDataIndex)
        EndIf 
        ShipDataIndex += 1
    EndWhile 

    Trace(Self, functionName + ": ships eligible to land during the encounter: " + gLandingShipsArray.Length )
EndFunction 

;------------LAND SHIPS SECTION

; Called to internally land a specific ship reference at any available marker. This uses gbStartLandedMode to determine how the ship lands. 
SpaceshipReference Function _LandSpecificShip(int aiShipDataIndex) Private 
    String FunctionName = "_LandSpecificShip()"
    LandingZoneTriggerScript TriggerREF = NONE 
    ObjectReference LandingMarkerREF = NONE 
    SpaceshipReference SpaceshipREF = NONE
    int ShipDataIndex = aiShipDataIndex
    SpaceshipBase Spaceship = NONE 
    Package RunningPackage = NONE 
    ReferenceAlias ShipAlias = NONE 
    int LandingMarkerIndex = -1
    int ShipLevelMod = 0

    Trace(self, FunctionName + ": aiShipDataIndex=" + aiShipDataIndex)

    ; Ensure a Landing Marker is available
    LandingMarkerIndex = _GetLandingMarkerIndex(ShipDataIndex)

    ; A Landing Marker is available
    If LandingMarkerIndex > -1 
        LandingMarkerREF = LandingMarkerData[LandingMarkerIndex].LandingMarkerAlias.GetRef()
        TriggerREF = LandingMarkerREF.GetLinkedRef(LandingZoneTriggerKeyword) as LandingZoneTriggerScript
    Else 
        Trace(Self, FunctionName + ": Could not acquire Landing Marker. None are available. [invalid LandingMarkerIndex]" )
        Return None
    EndIf 

    ; Bail out if no LandingMarker could be acquired
    Trace(Self, FunctionName + ": LandingMarkerIndex=" + LandingMarkerIndex + ", LandingMarkerREF=" + LandingMarkerREF + ", TriggerREF=" + TriggerREF)  
    Trace(Self, FunctionName + ": LandingMarkerData" + LandingMarkerData[LandingMarkerIndex])

    If LandingMarkerREF == None 
        Warning(Self, FunctionName + ": Could not acquire Landing Marker. Cannot land ship #" + aiShipDataIndex)
        Return None
    EndIf 

    ; The Index is pointing to a specific ship
    If aiShipDataIndex > -1 && aiShipDataIndex < ShipData.Length 
        ShipDatum theShipDatum = ShipData[ShipDataIndex]

        ; no ship specified
        If theShipDatum.ShipToSpawn == None
            ; try to get a ship from DefaultGroupSpawnQuestScript
            DefaultGroupSpawnQuestScript myGroupSpawnQuest = (self as Quest) as DefaultGroupSpawnQuestScript
            if myGroupSpawnQuest
                theShipDatum.ShipToSpawn = myGroupSpawnQuest.GetShipToSpawnForGroup(theShipDatum.SpawnGroupID, LandingMarkerRef, theShipDatum.SpawnGroupShipType )
                Trace(Self, functionName + ": Got shipToSpawn from DefaultGroupSpawnQuestScript: " + theShipDatum.ShipToSpawn )
            EndIf
        EndIf

        if theShipDatum.ShipToSpawn == None
            Warning(Self, functionName + ": --> BUG! ShipData[" + ShipDataIndex + "].ShipToSpawn does NOT exist or is NOT a SpaceshipBase!")
            return None
        endif

        ; Start Landed and Landing Ships both have this data
        Spaceship = theShipDatum.ShipToSpawn
        ShipLevelMod = theShipDatum.ShipLevelMod
        ShipAlias = LandingMarkerData[LandingMarkerIndex].LandedShipAlias

        ; Set up Start Landed Ships
        If gbStartLandedMode
            ; Create a Spaceship that's initially disabled
            SpaceshipREF = LandingMarkerREF.PlaceShipAtMe(Spaceship, ShipLevelMod, abPlayFX=False, abInitiallyDisabled=True, akAliasToFill=ShipAlias)
            
            If SpaceshipREF 
                ; Add Keyword that ensures the use of the Start Landed Package on the Alias
                SpaceshipREF.AddKeyword(OEShipStartsLandedKeyword)                        
            EndIf 
        Else 
            ; Set up Landing Ships
            SpaceshipREF = LandingMarkerREF.PlaceShipAtMe(Spaceship, ShipLevelMod, abPlayFX=False, abInitiallyDisabled=True, akAliasToFill=ShipAlias)

            If SpaceshipREF
                ; Remove Keyword so it uses the Landing package
                SpaceshipREF.RemoveKeyword(OEShipStartsLandedKeyword)
            EndIf 
            Trace(Self, FunctionName + ": Try to land Ship #" + aiShipDataIndex )
        EndIf 

        If !SpaceshipREF
            Warning(Self, FunctionName + ": Could not place Ship#" + aiShipDataIndex + ", ShipAlias: " + ShipAlias + ", Spaceship:" + Spaceship + ", LandingMarkerREF:" + LandingMarkerREF)
            Return None
        else
            Trace(Self, FunctionName + ": Created SpaceshipREF=" + SpaceshipREF)
        EndIf 

        ; refill dependent aliases
        ShipAlias.RefillDependentAliases()

        ; Recorded Landing Marker as being used and by which ship
        LandingMarkerData[LandingMarkerIndex].LandingMarkerREF = LandingMarkerREF 
        theShipDatum.SpaceshipREF = SpaceshipREF

        ; Add LinkedRefs
        LandingMarkerREF.SetLinkedRef(SpaceshipREF, OELinkLandingMarkerKeyword, abPromoteParentRefr = false)
        SpaceshipREF.SetLinkedRef(LandingMarkerREF, OELinkLandingMarkerKeyword, abPromoteParentRefr = false)          

        if theShipDatum.StageToSetOnLanding > -1              
            RegisterForRemoteEvent(SpaceshipRef, "OnShipLanding")
        endif

        ; Notify landing zone trigger the ship is landing
        if TriggerREF
            TriggerREF.BeginLanding(SpaceshipREF, LandingMarkerREF)
        EndIf

        If gbStartLandedMode 
            ; Ship should snap into furniture via the Sit package on the Alias 
            SpaceshipREF.Enable()

            ; Remind it to start Landing
            SpaceshipREF.EvaluatePackage()  

            Trace(Self, FunctionName + ": ship #" + ShipDataIndex + " has SNAPPED into a Landing Marker!")

            if theShipDatum.StageToSetOnLanding > -1
                SetStage(theShipDatum.StageToSetOnLanding)
            endif
        Else 
            ; Remind it to start Landing
            SpaceshipREF.EnableWithLanding()  
            Trace(Self, FunctionName + ": ship #" + ShipDataIndex + " is LANDING into a Landing Marker!")                
        EndIf 

        RunningPackage = SpaceShipREF.GetCurrentPackage()
        
        Trace(Self, FunctionName + ": running Package: " + RunningPackage)  

        ; register for player boarding if necessary
        if theShipDatum.StageToSetOnPlayerBoarding > -1
            RegisterForRemoteEvent(Game.GetPlayer(), "OnEnterShipInterior")
        endif

        if theShipDatum.StopQuestIfPlayerHomeShip
            RegisterForRemoteEvent(Game.GetPlayer(), "OnHomeShipSet")
        endif

        ; Mark as Landed 
        theShipDatum.hasLanded = True 
        gLandedShipRefsArray[ShipDataIndex] = SpaceshipREF

        ; Remove Ship from the Queue
        If gLandingShipsArray != None 
            gLandingShipsArray.Remove(aiShipDataIndex)
        EndIf

        ; set up locks and ownership if appropriate
        GlobalVariable gLockLevel = theShipDatum.LockLevel
        Trace(Self, FunctionName + ": gLockLevel: " + gLockLevel)  

        Actor ShipOwner = NONE
        Faction ShipFaction = NONE
        if theShipDatum.ShipOwner
            ShipOwner = theShipDatum.ShipOwner.GetActorRef()
        endif
        if ShipOwner == NONE
            ShipFaction = theShipDatum.ShipFaction
        endif
        Trace(Self, FunctionName + ": ShipOwner= " + ShipOwner + " ShipFaction=" + ShipFaction)  

        ; Set Ship Doors to Accessible
        SpaceshipREF.SetExteriorLoadDoorInaccessible(False)

        ; Lock Ship Doors if needed.
        If gLockLevel == NONE
            SpaceshipREF.Unlock(True)
            SpaceshipREF.Lock(False, True)
        Else 
            SpaceshipREF.Lock(True, True)
            LockShipDoors(SpaceshipREF, gLockLevel, ShipOwner, ShipFaction)
        EndIf

        ; give ownership to ship interior
        if ShipOwner || ShipFaction
            ; get interior cell
            Cell shipInterior = SpaceshipRef.GetLinkedCell(SpaceshipLinkedInterior)
            if shipInterior
                if ShipOwner
                    shipInterior.SetActorOwner(ShipOwner.GetLeveledActorBase())
                else
                    shipInterior.SetFactionOwner(ShipFaction)
                endif
                shipInterior.SetPublic(true) ; anything that is player-accessible should not trigger trespassing
            else
                Warning(self, "Could not get linked interior for " + SpaceshipRef)
            endif
        endif
    Else 
        ; The Index is not pointing to a valid ship. 
        Warning(Self, "Could not spawn ship#" + aiShipDataIndex + " invalid Ship #.")
    EndIf 
    Return SpaceshipREF
EndFunction 

Event SpaceshipReference.OnShipLanding(SpaceshipReference akSource, bool abComplete)
    Trace(self, " OnShipLanding " + akSource + " " + abComplete)
    if abComplete
        ; find this ship in our array
        int shipIndex = ShipData.FindStruct("SpaceshipRef", akSource)
        if shipIndex > -1
            ShipDatum theShipDatum = ShipData[shipIndex]
            if theShipDatum.StageToSetOnLanding > -1
                Trace(self, " OnShipLanding: setting stage " + theShipDatum.StageToSetOnLanding)
                SetStage(theShipDatum.StageToSetOnLanding)
            endif
        endif
    endif
EndEvent

Event Actor.OnEnterShipInterior(Actor akSource, ObjectReference akShip)
    ; find this ship in our array
    int shipIndex = ShipData.FindStruct("SpaceshipRef", akShip as SpaceshipReference)
    if shipIndex > -1
        if ShipData[shipIndex].StageToSetOnPlayerBoarding > -1
            SetStage(ShipData[shipIndex].StageToSetOnPlayerBoarding)
        endif
    endif
EndEvent

Event Actor.OnHomeShipSet(Actor akSource, SpaceshipReference akShip, SpaceshipReference akPrevious)
	debug.trace(self + " OnHomeShipSet akShip=" + akShip + " akprevious=" + akPrevious)
    ; find this ship in our array
    int shipIndex = ShipData.FindStruct("SpaceshipRef", akShip)
    if shipIndex > -1
        if ShipData[shipIndex].StopQuestIfPlayerHomeShip
        	debug.trace(self + " " + akShip + " became player's home ship - stopping quest")
            Stop()
        endif
    endif
EndEvent

; Force Ships to Start Landed. Called from OnQuestStarted. 
; Sets gbStartLandedMode to False so fragment calls to LandShip() will make ships use landing animations instead of snapping into a landing marker.
Function SpawnStartLandedShips() Private
    string FunctionName = "SpawnStartLandedShips()"
    SpaceshipReference SpaceshipREF = NONE
    int ShipDataIndex = -1  
    int index = 0

    If !gbStartLandedMode
        Trace(self, functionName + ": denied. gbStartLandedMode=" + gbStartLandedMode )
        Return 
    EndIf 

    Trace(Self, functionName + ": Spawning Start Landed ships." )

    ; All ships in gStartLandedShipsArray are pre-qualified (and may also be pre-randomized, according to settings.) All of these ships must attempt to land. 
    While index < gStartLandedShipsArray.Length
        ShipDataIndex = gStartLandedShipsArray[index]
        SpaceshipREF = _LandSpecificShip(ShipDataIndex)
        gLandedShipRefsArray[ShipDataIndex] = SpaceshipREF

        ShipDatum theShipDatum = ShipData[ShipDataIndex]    
        index += 1
    EndWhile
    
    ; Clean up the queue and end Start Landed Mode
    gStartLandedShipsArray.Clear()
    gbStartLandedMode = False 

    Trace(Self, functionName + ": Start Landed Mode is complete. (" + index + ") ships Started Landing on Landing Markers." )
EndFunction 

; Set the Doors on a Ship to be Locked/Unlocked. Private function called by SpawnStartLandedShips().
Function LockShipDoors(SpaceshipReference akSpaceship, GlobalVariable gLockLevel = NONE, Actor akShipOwner = NONE, Faction akShipFaction = NONE) Private
    ObjectReference[] ShipDoors = akSpaceship.GetExteriorLoadDoors()
    bool LockDoor = True
    int iLockLevel = 0
    int i = 0

    ; Adjust iLockLevel if needed. Note: use correct globals, no error checking.
    If gLockLevel != NONE 
        iLockLevel = gLockLevel.GetValueInt()
    EndIf 

    Trace(Self, "LockShipDoors for ship: " + akSpaceship)
    Trace(Self, " iLockLevel=" + iLockLevel)
    Trace(Self, " ShipDoors=" + ShipDoors)

    While (i < ShipDoors.Length )
        ObjectReference doorRef = ShipDoors[i]
        doorRef.SetLockLevel(iLockLevel)
        Trace(Self, "iLockLevel: [" + iLockLevel + "]" )        
        if akShipOwner
            doorRef.SetActorRefOwner(akShipOwner)
        elseif akShipFaction
            doorRef.SetFactionOwner(akShipFaction)
        endif
        If iLockLevel == 0
            doorRef.UnLock()
        Else 
            doorRef.Lock()
        EndIf 

        i += 1
    EndWhile
EndFunction 

; Actually land the specici ship. Called by _SpawnStartLandedShips() and LandShip()
SpaceshipReference Function _LandShip(int aiShipDataIndex = -1) Private
    string FunctionName = "LandShip()"
    int ShipDataIndex = aiShipDataIndex
    int index = 0

    Trace(Self, functionName + ": aiShipDataIndex=" + aiShipDataIndex)

    ; Error check
    If ShipDataIndex > ShipData.Length
        Warning(Self, "Ship #" + ShipDataIndex + " does not exist in the ShipData array.")
        Return None
    ElseIf ShipDataIndex < 0      ; Random Ship requested if below 0
        ShipDataIndex = Utility.RandomInt(0, gLandingShipsArray.Length)
    EndIf

    Return _LandSpecificShip(ShipDataIndex)
EndFunction 

; Place a Ship at a Landing Marker 
int Function _GetLandingMarkerIndex(int aiShipDataIndex)
    string FunctionName = "GetLandingMarkerIndex()"
    int index = 0

    Trace(self, FunctionName + ": aiShipDataIndex=" + aiShipDataIndex + ": LandingMarkerData=" + LandingMarkerData)

    While index < LandingMarkerData.Length
        ; If this is set to a 0 or positive number, it has been claimed by another ship.
        If LandingMarkerData[index].ShipDatumIndex < 0
            ; Claim the Marker right away. 
            LandingMarkerData[index].ShipDatumIndex = aiShipDataIndex
            Trace(Self, functionName + ": claiming Landing Marker. ShipDataIndex #" + aiShipDataIndex)
            Return index 
        Else 
            Trace(Self, functionName + ": LandingMarkerData[" + index + "].ShipDatumIndex: " + LandingMarkerData[index].ShipDatumIndex)
        EndIf 
        index += 1 
    EndWhile 

    ; No Landing Marker was found (otherwise, it would have Returned)
    Trace(Self, functionName + ": no Landing Marker found." )
    Return -1
EndFunction 

; Checks a Ship's Conditions and whether it has already landed. If it is eligible to land, returns True. Called by _GetAllStartLandedShips() and _LandShip()
bool Function _CanShipLand(int aiShipDataIndex)
    string FunctionName = "CanShipLand()"
    bool LandingConditions = False 

    Trace(Self, functionName + ": aiShipDataIndex=" + aiShipDataIndex)

    If ShipData[aiShipDataIndex].hasLanded
        Trace(Self, functionName + ": ship #" + aiShipDataIndex + " has already landed. hasLanded: " + ShipData[aiShipDataIndex].hasLanded) 
        Return False 
    ElseIf ShipData[aiShipDataIndex].SpawnConditions 
        LandingConditions = ShipData[aiShipDataIndex].SpawnConditions.IsTrue()
        If !LandingConditions
            Trace(Self, functionName + ": ship #" + aiShipDataIndex + " Landing Conditions: " + LandingConditions ) 
            Return False 
        EndIf 
    EndIf 

    Trace(Self, functionName + ": aiShipDataIndex=" + aiShipDataIndex + ": TRUE")

    Return True 
EndFunction

; Launches a ship. Called by kmyQuest.LaunchShip(). Can launch via index or reference. 
bool Function _LaunchShip(int aiShipDataIndex=-1, SpaceshipReference akSpaceship=None, bool bForceLaunch=False) Private
    string FunctionName = "LaunchShip()"
    bool SuccessfullyLaunched = False 

    ; Handle aiShipDataIndex first, then Reference if given
    If aiShipDataIndex >= 0 && (aiShipDataIndex < ShipData.Length )
        If gLandedShipRefsArray[aiShipDataIndex] != None
            ; Ensure ship is available to launch
            If !bForceLaunch && !_CanShipLaunch(aiShipDataIndex)
                Trace(Self, functionName + ": ship #" + aiShipDataIndex + " can't launch. Conditions not met.")
            Else
                ; make sure this isn't current player ship or player owned ship
                if SQ_PlayerShip.IsPlayerShip(gLandedShipRefsArray[aiShipDataIndex]) == false

                    ; Launch the Ship
                    gLandedShipRefsArray[aiShipDataIndex].TakeOff()
                    SuccessfullyLaunched = True
                    Trace(Self, functionName + ": Launching Ship #" + aiShipDataIndex + "... success. " )

                    ; Remove Ship from the array of Landed Ships
                    gLandedShipRefsArray[aiShipDataIndex] = None

                    ; Release Landing Marker
                    _ReleaseLandingMarker(aiShipDataIndex)
                    
                    ; set takeoff stage
                    if ShipData[aiShipDataIndex].StageToSetOnTakeoff > -1
                        SetStage(ShipData[aiShipDataIndex].StageToSetOnTakeoff)
                    endif
                else
                    Trace(Self, functionName + ": ship #" + aiShipDataIndex + " can't launch. Player-owned.")
                endif
            EndIf 
        Else 
            Trace(Self, functionName + ": Ship is not currently on a Landing Marker.")
        EndIf 
    ElseIf akSpaceship != None 
    Else
        Trace(Self, functionName + ": Must specify a ship via index or reference.")
    EndIf 
    
    Return SuccessfullyLaunched
EndFunction 

;-- Determines whether a ship that has landed may launch
bool Function _CanShipLaunch(int aiShipDataIndex)
    string FunctionName = "CanShipLaunch()"
    bool LaunchShip = False 
    ShipDatum theShipDatum = ShipData[aiShipDataIndex]
    SpaceshipReference currentPlayerShip = Game.GetPlayer().GetCurrentShipRef()

    If theShipDatum.hasLanded && (theShipDatum.LaunchConditions.IsTrue() || theShipDatum.LaunchConditions == None)
        Trace(Self, functionName + ": Ship is cleared to launch.") 
        LaunchShip = True
    Else 
        Trace(Self, functionName + ": Ship #" + aiShipDataIndex + " is NOT cleared to launch. currentPlayerShip=" + currentPlayerShip + " + hasLanded=[" + theShipDatum.hasLanded + "] + Conditions: [" + theShipDatum.LaunchConditions.IsTrue() + "], LaunchConditions=" + ShipData[aiShipDataIndex].LaunchConditions + "]" )
    EndIf  
    
    Return LaunchShip
EndFunction 

; Set all Landing Markers to available.
Function _ResetLandingMarkers()
    int index = 0 

    If ShipData.Length > 0 && LandingMarkerData.Length > 0 
        While index < LandingMarkerData.Length
            LandingMarkerData[index].ShipDatumIndex = -1
            index += 1 
        EndWhile 
    EndIf 
EndFunction 

;-- Allows a Landing Marker to be re-used for another landing ship. Used when a ship launches. 
int Function _ReleaseLandingMarker(int aiShipDataIndex)
    int iFound = LandingMarkerData.FindStruct("ShipDatumIndex", aiShipDataIndex)
    If iFound > -1 
    Else 
    EndIf 
    Return iFound 
EndFunction 

; Helper Function. Returns an Object Reference from an Array of Object References. 
ObjectReference Function _GetMarkerFromArray(ObjectReference[] akMarkerArray=None, ObjectReference akSpecificMarkerRef=None, bool bAllowRandomIfSpecificFails=True, bool bRemoveElementFromArray=True)
    string FunctionName = "GetMarkerFromArray()"
    ObjectReference MarkerREF = None 
    int RandomIndex = 0
    int index = 0 

    If akSpecificMarkerRef != None
        Trace(Self, functionName + ": SpecificMarkerRef: " + akSpecificMarkerRef)
    EndIf
    
    If akMarkerArray.Length <= 0
        Trace(Self, functionName + ": MarkerArray " + akMarkerArray + " is empty.")
        Return None
    EndIf 

    ; First check to see if any requested specific Markers exist, if so, claim them.
    If akSpecificMarkerRef != None 
        While index < akMarkerArray.Length && MarkerREF == None
            Trace(Self, functionName + ": MarkerArray[" + index + "]") 

            ; Requesting a Specific Marker
            If akMarkerArray[index] == akSpecificMarkerRef 

                Trace(Self, functionName + ": Requested MarkerREF [" + akSpecificMarkerRef + "] is available.")

                ; Remove the element from the array, if requested.
                If bRemoveElementFromArray 
                    Trace(Self, functionName + ": MarkerREF #" + index + " removed from array.")
                    akMarkerArray.Remove(index)
                EndIf 

                ; Found it in the Array 
                MarkerREF = akSpecificMarkerRef
            EndIf 

            Trace(Self, functionName + ": Retrieved MarkerREF[" + MarkerREF + "]")
            index += 1
        EndWhile            
    EndIf 

    ; Returns any available marker by request. Also, if a specific marker is unavailable and a random one is acceptable, return it. 
    If MarkerREF == None && (akSpecificMarkerRef == None || (akSpecificMarkerRef != None && bAllowRandomIfSpecificFails) )
        RandomIndex = Utility.RandomInt(0, akMarkerArray.Length - 1 )
        MarkerREF = akMarkerArray[RandomIndex]

        If MarkerREF != None
            If akSpecificMarkerRef != None
                Trace(Self, functionName + ": Retrieved MarkerREF[" + MarkerREF + "] - this is a random marker since the specific one was already used.")
            Else 
                Trace(Self, functionName + ": Retrieved MarkerREF[" + MarkerREF + "]")
            EndIf 
        EndIf

        If bRemoveElementFromArray
            akMarkerArray.Remove(RandomIndex)
            Trace(Self, functionName + ": MarkerREF #" + RandomIndex + " removed from array.")
        EndIf 
    EndIf

    ; Debug Status Traces
    Trace(Self, functionName + ": Claimed MarkerREF #" + RandomIndex + " " + MarkerREF + " from Array.")
    Trace(Self, functionName + ": akMarkerArray.Length: " + akMarkerArray.Length)

    ; Return the Marker 
    return MarkerREF
EndFunction         

; Helper Function. Copy an Array of References to another Array. Returns an array of References. 
ObjectReference[] Function CopyArray(ObjectReference[] akInputArray, string akOutputArrayName="OutputArray", string akInputArrayName="InputArray")
    string FunctionName = "CopyArray()"
    ObjectReference[] outputArray = new ObjectReference[akInputArray.Length]
    int i = 0

    While (i < akInputArray.Length)
        outputArray[i] = akInputArray[i]
        i += 1
    EndWhile

    If akInputArray.Length == outputArray.Length 
        Trace( Self, functionName + ": Successfully copied old array: " + akInputArrayName + ".Length(" + akInputArray.Length + ") into new array: " + akOutputArrayName + ".Length (" + outputArray.Length + ")" )
    EndIf

    return outputArray
EndFunction 

; Helper Function. Copy an Array of ints to another Array. Returns an array of ints.
int[] Function CopyIntArray(int[] akInputArray, string akOutputArrayName="OutputArray", string akInputArrayName="InputArray", string akFunctionName="CopyIntArray()" )
    int[] outputArray = new int[akInputArray.Length]
    int i = 0

    While (i < akInputArray.Length)
        outputArray[i] = akInputArray[i]
        i += 1
    EndWhile

    If akInputArray.Length == outputArray.Length 
        Trace( Self, akFunctionName + ": successfully copied old array: " + akInputArrayName + ".Length(" + akInputArray.Length + ") into new array: " + akOutputArrayName + ".Length (" + outputArray.Length + ")")
    EndIf

    return outputArray
EndFunction 

;--------------------------------------------------------------------------------------------------
; PUBLIC FUNCTIONS
;--------------------------------------------------------------------------------------------------
; Attempts to land specific ship if provided, any other number will land the first ship that qualifies. 
; Must pass conditions. Called by kmyQuest.LandShip(#) on a stage.
bool Function LandShip(int aiShipDataIndex = -1) 
    string FunctionName = "kmyQuest.LandShip()"
    int failsafe = 100
    int index = 0

    bool bSuccess = false

    ; If we are still initializing; or setting up the Start Landed ships, then wait for that to finish.
    While _IsReadyToLandShip() == false && failsafe > 0
        Trace(Self, functionName + ": Waiting to land ship... " + failsafe)
        Utility.Wait(1)
        failsafe -= 1
    EndWhile 

    if gbEnableShips
        Trace(Self, functionName + ": Attempting to land ship #" + aiShipDataIndex)
        If aiShipDataIndex >= 0 && aiShipDataIndex < ShipData.Length
            _LandShip(aiShipDataIndex)
            bSuccess = true
        Else
            Trace(Self, functionName + ": Try to land all ships: gLandingShipsArray=" + gLandingShipsArray)
        
            While index < gLandingShipsArray.Length 
                Trace(Self, functionName + ": Attempting to land ship #" + index)
                If _CanShipLand(gLandingShipsArray[index])
                    _LandShip(gLandingShipsArray[index])
                    bSuccess = true
                EndIf 
                index += 1 
            EndWhile 
        EndIf
    endif
    Return bSuccess
EndFunction 

bool Function _IsReadyToLandShip()
    ; ready when:
    ;    script is initialized, AND ships are NOT enabled - this means there's no point waiting
    ;   OR
    ;    script is initialized AND ships are enabled AND start landed mode is done - this means we're really ready to go
    return (initialized && gbEnableShips == false) || (initialized && gbEnableShips && gbStartLandedMode == false )
EndFunction

; Public Function for launching specific ships. Called by kmyQuest.LaunchShip(#) on a stage. 
bool Function LaunchShip(int aiShipDataIndex, SpaceshipReference akSpaceship=None, bool abForceLaunch=False)
    Trace(Self, "kmyQuest.LaunchShip(): Ship #" + aiShipDataIndex)
    Return _LaunchShip(aiShipDataIndex, akSpaceship, abForceLaunch)
EndFunction 

; Public Function for launching all landed ships. Called by kmyQuest.LaunchAllShips() on a stage. Returns # of ships launched.
int Function LaunchAllShips(bool bForceLaunch=False)
    string FunctionName = "kmyQuest.LaunchAllShips()" 
    int LaunchedShips = 0            
    int index = 0

    Trace(Self, functionName + ": gLandedShipRefsArray.Length: " + gLandedShipRefsArray.Length)

    While index < gLandedShipRefsArray.Length
        If gLandedShipRefsArray[index] != None 
            Trace(Self, functionName + ": gLandedShipRefsArray[ " + index + " ]: " + gLandedShipRefsArray[index])
            If _LaunchShip(index, gLandedShipRefsArray[index], bForceLaunch)
                LaunchedShips += 1
            EndIf 
        EndIf 
        index += 1
    EndWhile 
    Return LaunchedShips 
EndFunction 

; Public Function to see how many ships are available to land. Called by kmyQuest.AllowShips() on a stage. 
int Function getLandingQueueCount()
    Return gLandingShipsArray.Length 
EndFunction 

; Public Function to return the references of all the ships that are currently using the landing markers.
SpaceshipReference[] Function GetShipRefs()
    Return gLandedShipRefsArray
EndFunction 

; Public Function that opens and closes ship doors. If no ShipRef is specified, all doors on each Ship will be changed.
Key[] Function ToggleShipDoors(GlobalVariable gLockLevel, SpaceshipReference akSpaceshipREF = NONE, bool bGetKey = false, bool abSetAccessible = True)
    SpaceshipReference ShipREF = akSpaceshipREF
    Key[] ShipKeys = NONE 
    int iLockLevel = 0 
    int i = 0

    ; If we want a key, generate and return it. 
    If akSpaceshipREF == NONE
        While i < gLandedShipRefsArray.Length 
            ShipREF = gLandedShipRefsArray[i]

            If ShipREF != NONE 
                LockShipDoors( ShipREF, gLockLevel )
                If bGetKey
                    ShipKeys.Add( ShipREF.GetKey() )
                EndIf 
            EndIf 
            i += 1
        EndWhile
    Else 
        LockShipDoors( akSpaceshipREF, gLockLevel )
        If bGetKey 
            ShipKeys.Add( ShipREF.GetKey() )
        EndIf 
    EndIf 

    Return ShipKeys
EndFunction 

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName="OE", string SubLogName="Ships", bool bShowNormalTrace = true, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string LogName="OE", string SubLogName="Ships", bool bShowNormalTrace = true, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction