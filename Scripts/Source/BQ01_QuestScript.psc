Scriptname BQ01_QuestScript extends Quest

Group Required
    ReferenceAlias property PlayerShip auto const mandatory
    ReferenceAlias Property MapMarker_Temple auto const mandatory
    LocationAlias property Location_Temple auto const mandatory
    LocationAlias property Location_TemplePlanet auto const mandatory
    Keyword Property MQTempleQuestActive auto const mandatory
    Keyword Property BQ01_Keyword_TempleLocation Mandatory Const Auto
    Quest Property MQ_TempleQuest_SpawnTemple auto const mandatory
    Quest Property StarbornTempleQuest Mandatory Const Auto
    InputEnableLayer Property BQ01_EnableLayer Auto
EndGroup 

Event OnQuestStarted()
    Location TemplePlanetLocation = Location_TemplePlanet.GetLocation().GetCurrentPlanet().GetLocation()
    Location TempleLocation = Location_Temple.GetLocation()
    TemplePlanetLocation.AddKeyword(MQTempleQuestActive)
    TempleLocation.AddKeyword(BQ01_Keyword_TempleLocation)
EndEvent

Function SetMapMarkerFlags(ObjectReference akMapMarker)
    akMapMarker.Enable()
    akMapMarker.AddtoMapScanned(True)
    akMapMarker.SetMarkerVisibleOnStarMap()
    akMapMarker.SetRequiresScanning(false)
    akMapMarker.EnableFastTravel()
EndFunction

; This is the public function called by the quest stage. It establishes the quest data. 
Function TempleDiscovered()
    ;if there is no Temple Location because we skipped landing at the Anomaly Site but discovered the planetary trait, then spawn a Temple
    ;MQ_TempleQuest_SpawnTemple.Start() ;when the OnQuestInit event fires, it will call the ForceSpawnTemple function in the respective quest
    ;RegisterForCustomEvent((MQ_TempleQuest_SpawnTemple as MQSpawnTempleScript), "TempleSpawnedEvent")

    SetMapMarkerFlags(MapMarker_Temple.GetRef())

    ;set the Temple as always Parellel Self (Sigma)
    Int iArtifactNumber = (StarbornTempleQuest as StarbornTempleQuestScript).FindSigmaArtifactBarrett()
    (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(iArtifactNumber, Location_Temple.GetLocation())
EndFunction

; Patch Update08 handling.

ReferenceAlias Property Barrett Auto Const Mandatory
ReferenceAlias Property OtherBarrett Auto Const Mandatory
ReferenceAlias Property Marker_Temple_Barrett Auto Const Mandatory
ReferenceAlias Property Marker_Temple_OtherBarrett Auto Const Mandatory
ReferenceAlias Property Marker_Temple_Player Auto Const Mandatory
Scene Property BQ01_Scene_BARK_8500_Barrett_Temple_PowerStart Auto Const Mandatory
Int Property iStageToStartTracking Auto Const Mandatory ; 50000 
Int Property iStageToStopTracking Auto Const Mandatory ; 9000
Int Property iStageToCheckTemple Auto Const Mandatory ; 8505

Function CheckPlayerStatus()

    Actor PlayerRef = Game.GetPlayer()
    SpaceshipReference PlayerShipRef = PlayerShip.GetShipRef()
    Actor BarrettRef = Barrett.GetActorRef()
    Location Temple = Location_Temple.GetLocation()
    Location TemplePlanet = Location_TemplePlanet.GetLocation()

    If PlayerShipRef.IsInLocation(TemplePlanet) && !PlayerShipRef.IsInSpace()

        LockPlayer()

        If PlayerRef.IsInLocation(Temple)
            If !GetStageDone(iStageToCheckTemple)
                BQ01_Scene_BARK_8500_Barrett_Temple_PowerStart.Start()
            EndIf
        Else
            RegisterForRemoteEvent(PlayerRef, "OnLocationChange")
            BarrettRef.SetRestrained(False)
        EndIf

    Else

        UnlockPlayer()
        RegisterForRemoteEvent(PlayerRef, "OnLocationChange")
        BarrettRef.SetRestrained(False)

    EndIf

EndFunction

Function LockPlayer()

    BQ01_Enablelayer = InputEnableLayer.Create()
    BQ01_Enablelayer.EnableFastTravel(False)
    BQ01_Enablelayer.EnableGravJump(False)
    BQ01_Enablelayer.EnableFarTravel(False)
    BQ01_Enablelayer.EnableTakeOff(False)

    ObjectReference[] LoadDoors = PlayerShip.GetShipRef().GetExteriorLoadDoors()

    Int Index = 0
    
    While (Index < LoadDoors.Length)
        LoadDoors[Index].BlockActivation(True, True)
        Index += 1
    EndWhile

EndFunction

Function UnlockPlayer()

    BQ01_Enablelayer.Delete()

    ObjectReference[] LoadDoors = PlayerShip.GetShipRef().GetExteriorLoadDoors()

    Int Index = 0
    
    While (Index < LoadDoors.Length)
        LoadDoors[Index].BlockActivation(False, False)
        Index += 1
    EndWhile

EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
Debug.Trace(Self + "Player changed location: akOldLoc = " + akOldLOc + "akNewLoc = " + akNewLoc)

    If GetStageDone(iStageToStartTracking) && !GetStageDone(iStageToStopTracking)
    Debug.Trace(Self + "Player passed stage check.")
        Actor PlayerRef = Game.GetPlayer()
        Actor BarrettRef = Barrett.GetActorRef()

        If akSender == PlayerRef && akNewLoc == Location_Temple.GetLocation()
        Debug.Trace(Self + "Player is arrived at Temple Sigma: akOldLoc = " + akOldLOc + "akNewLoc = " + akNewLoc)
            PlayerRef.MoveTo(Marker_Temple_Player.GetRef())
            BarrettRef.MoveTo(Marker_Temple_Barrett.GetRef())
            OtherBarrett.GetRef().MoveTo(Marker_Temple_OtherBarrett.GetRef())
          
            LockPlayer()

            BarrettRef.SetRestrained(True)

            If !GetStageDone(iStageToCheckTemple)
                BQ01_Scene_BARK_8500_Barrett_Temple_PowerStart.Start()
            EndIf

        EndIf

        ; If player somehow manages to leave the planet on lock down again, release all blocking functionality so they can return.
        If akSender == PlayerRef && akOldLoc == Location_TemplePlanet.GetLocation()
        Debug.Trace(Self + "Player left Planet location: akOldLoc = " + akOldLOc + "akNewLoc = " + akNewLoc)
            UnlockPlayer()
            BarrettRef.SetRestrained(False)

        EndIf

    EndIf

EndEvent
