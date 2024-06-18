Scriptname MQ_Temple_SubScript extends Quest

ReferenceAlias property PlayerShip auto const mandatory

LocationAlias property PlanetWithTrait auto const mandatory

Keyword property LocTypeMajorOrbital auto const mandatory

LocationAlias property TempleLocation auto const mandatory

Int Property QuestInitStage=-1 Auto Const

Int Property LandingSetStage=30 Auto Const

Int Property PowerReceivedStage=60 Const Auto

Int Property PowerNumber=-1 Const Auto
Int iArtifactNumber

ReferenceAlias Property TemplePowerTrigger Mandatory Const Auto
ReferenceAlias Property AnomalyMapMarker Mandatory Const Auto
ReferenceAlias Property TempleMapMarker Mandatory Const Auto
Quest Property StarbornTempleQuest Mandatory Const Auto
ActorValue Property OutpostScannerMultiplier Mandatory Const Auto
Keyword Property MQTempleQuestActive Mandatory Const Auto
Keyword Property PlanetTrait26GravitationalAnomaly Mandatory Const Auto
Quest Property MQ_TempleQuest_SpawnTemple Mandatory Const Auto
Message Property MQ_TempleTutorial_DistanceMSG Mandatory Const Auto
ReferenceAlias Property TempleStarbornMarker Const Auto
ActorBase Property LvlStarborn_Boss_Aggro Mandatory Const Auto
ReferenceAlias Property TempleStarborn Const Auto
Quest Property MQ106 Mandatory Const Auto
LocationAlias Property AnomalyLocation Mandatory Const Auto

Actor playerRef

GlobalVariable Property MQ401_SkipMQ Mandatory Const Auto

Event OnQuestInit()
    playerRef = Game.GetPlayer()
    RegisterForRemoteEvent(PlayerShip, "OnShipLanding")
    RegisterForRemoteEvent(playerRef, "OnExitShipInterior")
    RegisterForRemoteEvent(PlayerREF, "OnLocationChange")

    ;determine which Artifact Power we're looking for
    If PowerNumber == -1
        ;find a random Aritfact the player has but doesn't have a Power for
        iArtifactNumber = (StarbornTempleQuest as StarbornTempleQuestScript).CheckPlayerArtifactForPower()

        ;if no valid Artifact is found, shut down early
        If iArtifactNumber == -1
            Stop()
            return
        EndIf
    Else
        iArtifactNumber = PowerNumber
    EndIf

    If iArtifactNumber != -1
        ;make sure the right map marker flags are set
        SetMapMarkerFlags(AnomalyMapMarker.GetRef())

        ;add a keyword to the planet we picked so other temple quests don't pick this planet
        PlanetWithTrait.GetLocation().GetCurrentPlanet().GetLocation().AddKeyword(MQTempleQuestActive)

        ;set player as having found the Temple so that we don't spawn a second Temple with same power
        (StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerFoundTemple(iArtifactNumber)

        ;set init stage if one is specified
        If (QuestInitStage > -1) 
            SetStage(QuestInitStage)
        EndIf
    EndIf
EndEvent

Function SetMapMarkerFlags(ObjectReference akMapMarker)
    akMapMarker.Enable()
    akMapMarker.AddToMapScanned(True)
    akMapMarker.SetMarkerVisibleOnStarMap()
    akMapMarker.SetRequiresScanning(false)
    akMapMarker.EnableFastTravel()
EndFunction

Function TempleDiscovered()
    debug.trace(self + " TempleDiscovered")
    ;Temple can now be seen on Planet Map and can be fast-travelled to
    SetMapMarkerFlags(TempleMapMarker.GetRef())

    ;turn off the anomaly map marker
    AnomalyMapMarker.GetRef().Disable()

    ;failsafe re-register for temple power acquired event
    RegisterForCustomEvent((TemplePowerTrigger.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
EndFunction

Function PowerReceived()
    ;make sure we stop the scanning IMOD
    LockGuard CheckForTempleScanningGuard
        StopTempleScanning()
    EndLockGuard
EndFunction

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSource, bool abComplete)
    ; watch for ship to land on target planet and spawn Temple
    debug.trace(self + " OnShipLanding abComplete=" + abComplete)
    if (abComplete)
        if (TempleLocation.GetLocation() == None)
    	    RefillTemple()
        EndIf
        CheckForTempleScanning()
    endif
endEvent

function RefillTemple()
        Location landingLocation = PlayerShip.GetRef().GetCurrentLocation()
        Location planetLocation = PlanetWithTrait.GetLocation()
        debug.trace(self + " RefillTemple: landingLocation=" + landingLocation + " planetLocation=" + planetLocation)
        if landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital)
            debug.trace(" target planet - refill templeLocation")
            TempleLocation.RefillAlias()
            TempleLocation.RefillDependentAliases()
            RegisterForCustomEvent((TemplePowerTrigger.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
            (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(iArtifactNumber, TempleLocation.GetLocation())
        endif
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    debug.trace(self + " OnLocationChange akNewLoc=" + akNewLoc)
    ObjectReference ScanTarget = TempleMapMarker.GetRef()

    ;turn the scanner gameplay on and off as the player enters or leaves the planet
    ;only do this if the temple has been spawned
    If (akSender == Game.GetPlayer()) && (ScanTarget != None) && (GetStageDone(PowerReceivedStage) == 0)
        CheckForTempleScanning()
    EndIf
EndEvent

Event Actor.OnExitShipInterior(Actor akSource, ObjectReference akShip)
    debug.trace(self + " OnExitShipInterior")
    if GetStageDone(LandingSetStage) == false
        ; see if we're in target location
        Location landingLocation = akShip.GetCurrentLocation()
        Location planetLocation = PlanetWithTrait.GetLocation()
        debug.trace(self + " OnExitShipInterior landingLocation=" + landingLocation + " planetLocation=" + planetLocation)
        if landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital)
            SetStage(LandingSetStage)
        EndIf
    EndIf
EndEvent

Guard CheckForTempleScanningGuard ProtectsFunctionLogic

function CheckForTempleScanning()
    debug.trace(self + "CheckForTempleScanning")
    LockGuard CheckForTempleScanningGuard

        ;turn the scanner gameplay on and off based on how far the player is from the temple
        ;only do this if the temple has been spawned

        ObjectReference ScanTarget = TempleMapMarker.GetRef()
        If (ScanTarget != None) && (GetStageDone(PowerReceivedStage) == 0)
            Location TemplePlanetLocation = PlanetWithTrait.GetLocation()
            SpaceshipReference playerShipRef = PlayerShip.GetShipRef()

            Location playerCurrentLocation = playerRef.GetCurrentLocation()
            Location landingLocation = playerShipRef.GetCurrentLocation()

            debug.trace(self + "    playerCurrentLocation=" + playerCurrentLocation + " TemplePlanetLocation=" + TemplePlanetLocation + " ScanTarget=" + ScanTarget)

            bool onTargetPlanet = playerCurrentLocation.IsSameLocation(TemplePlanetLocation, LocTypeMajorOrbital) || landingLocation.IsSameLocation(TemplePlanetLocation, LocTypeMajorOrbital)
            bool nearTemple = playerRef.GetDistance(ScanTarget) < MaxScanEffectDistance || playerShipRef.GetDistance(ScanTarget) < MaxScanEffectDistance
            debug.trace(self + "    onTargetPlanet=" + onTargetPlanet + " nearTemple=" + nearTemple)
            If onTargetPlanet && nearTemple
                StartTempleScanning(ScanTarget)
            Else
                StopTempleScanning()
            EndIf
        EndIf
    EndLockGuard
endFunction

Event SBPowerCollectionActivatorScript.PowerAcquiredEvent(SBPowerCollectionActivatorScript akSender, Var[] akArgs)
    If (akSender == TemplePowerTrigger.GetRef()) && (GetStageDone(PowerReceivedStage) == False)
        SetStage(PowerReceivedStage)
        (StarbornTempleQuest as StarbornTempleQuestScript).SetPlayerAcquiredPower(iArtifactNumber)
    EndIf
EndEvent

Event MQSpawnTempleScript.TempleSpawnedEvent(MQSpawnTempleScript akSender, Var[] akArgs)
    ;we are trying to force spawn a temple through the MQ_TempleQuest_SpawnTemple quest. Update aliases to use the newly spawned temple location
    Location myLocation = akArgs[0] as Location
    ObjectReference myMapMarker = akArgs[1] as ObjectReference
    UnRegisterForCustomEvent(akSender, "TempleSpawnedEvent")
    TempleLocation.ForceLocationTo(myLocation)
    TempleLocation.RefillDependentAliases()
    RegisterForCustomEvent((TemplePowerTrigger.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(iArtifactNumber, TempleLocation.GetLocation())
EndEvent

MusicType Property MUSGenesisStingerStarbornAppearB Mandatory Const Auto

Function SpawnStarborn()
    ;spawn a Starborn at the Temple
    If (MQ106.IsCompleted()) || (MQ401_SkipMQ.GetValueInt() >= 1 );MQ106, where the Starborn are introduced, must be complete, or the MQ must have been skipped
        Actor StarbornREF = TempleStarbornMarker.GetRef().PlaceActorAtMe(LvlStarborn_Boss_Aggro)
        ;play music
        MUSGenesisStingerStarbornAppearB.Add()
        TempleStarborn.ForceRefTo(StarbornREF)
        ;rename the Starborn to the Temple Specific name based on the Artifact number set earlier on QuestInit
        (StarbornTempleQuest as StarbornTempleQuestScript).RenameTempleStarborn(iArtifactNumber, StarbornREF)
    EndIf
EndFunction

;/ 
********************************************************
Scanning for temple
********************************************************
/;

struct imageSpaceData
    ImageSpaceModifier scanTempleImod
    int distortionLevel = 1
    WwiseEvent soundEvent
    float requiredAngleExtent ; when angle extent is <= requiredAngleExtent, this imod can start showing up within that angle
    float loopTime ; how long between reapplying the imod?
endStruct

imageSpaceData[] property TempleScanImods auto Const
{ array of imod data, ordered from highest priority (index 0) to lowest - use first one where currentAnglePercent <= maxPercent }

;WwiseEvent Property ArtifactPuzzle_TempleDistance Auto Const mandatory

float property MinAngle = 0.0 auto Const
float property MaxAngle = 85.0 auto Const

float property MinDistance = 300.0 auto Const
float property MaxDistance = 1200.0 auto const
float property MaxScanEffectDistance = 5000.0 auto const
{ outside this distance, turn off temple scan effect }

group soundData
    ; sound handles
    String property ArtifactPuzzle_TempleDistance = "ArtifactPuzzle_TempleDistance" Auto Const
EndGroup

int scanTempleTimerID = 1 Const
float scanTempleTimerSeconds = 0.5 Const

bool usingHandscanner = false  ; this may not be reliable - if not, we'll need a function to check if you have the scanner up or not
ObjectReference currentTarget
int currentImodIndex = -1 ; track what's our current index for TempleScanImods
float currentImodTime ; how long since the current imod was applied - used to determine when to reapply
float DistanceDiff ; difference between MaxDistance and MinDistance
float AngleDiff ; difference between MaxAngle and MinAngle

function StartTempleScanning(ObjectReference targetRef) RequiresGuard(CheckForTempleScanningGuard)
    debug.trace(self + " StartTempleScanning " + targetRef)
    DistanceDiff = MaxDistance - MinDistance
    AngleDiff = MaxAngle - MinAngle

    RegisterForMenuOpenCloseEvent("MonocleMenu")
    currentTarget = targetRef
EndFunction

function StopTempleScanning() RequiresGuard(CheckForTempleScanningGuard)
    debug.trace(self + " StopTempleScanning")
    UnRegisterForMenuOpenCloseEvent("MonocleMenu")
    currentTarget = NONE
endFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == scanTempleTimerID
        UpdateTempleScan()
    endif
EndEvent

guard handscannerGuard ProtectsFunctionLogic

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    If asMenuName== "MonocleMenu"
        LockGuard handscannerGuard
            usingHandscanner = abOpening
            if abOpening
                StartTimer(scanTempleTimerSeconds, scanTempleTimerID)
            EndIf
        EndLockGuard
    endif
EndEvent

function UpdateTempleScan()
    debug.trace(self + "UpdateTempleScan: usingHandscanner=" + usingHandscanner)
    if usingHandscanner && currentTarget
        ; get angle to currentTarget
        float zAngle = Game.GetCameraHeadingAngle(currentTarget)

        ; modify min/max angle by distance to target
        float currentMaxImodAngle = GetAngleExtent()

        debug.trace(self + "    zAngle=" + zAngle)
        debug.trace(self + "    currentMaxImodAngle=" + currentMaxImodAngle)

        if Math.abs(zAngle) <= MaxAngle
            UpdateImod(zAngle, currentMaxImodAngle)
        Else
            RemoveAllImods()
        endif
        
        ; rerun timer
        StartTimer(scanTempleTimerSeconds, scanTempleTimerID)
    Else
        ; kill VFX, don't rerun timer
        RemoveAllImods()
    endif
EndFunction

; returns value between MinAngle and MaxAngle, based on how close the player is to the target
float function GetAngleExtent()
    ; get distance to target
    float distance = GetClampedDistance()

    ; get multiplier based on how far from target
    float distanceMult = (distance - MinDistance)/DistanceDiff

    ; scale angle extent by distance mult
    float angleExtent = MinAngle + distanceMult*AngleDiff
    debug.trace(self + "    clamped distance=" + distance)
    return angleExtent
endFunction

float function GetClampedDistance()
    ; get distance to target
    float distance = Math.Clamp(playerRef.GetDistance(currentTarget), MinDistance, MaxDistance)
    return distance
EndFunction

function UpdateImod(float currentAngle, float currentMaxImodAngle)
    bool foundValidImod = false
    debug.trace(self + "    UpdateImod:")
    debug.trace(self + "        currentAngle=" + currentAngle)
    debug.trace(self + "        currentMaxImodAngle=" + currentMaxImodAngle)

    int i = 0
    while i < TempleScanImods.Length
        imageSpaceData theData = TempleScanImods[i]
        if foundValidImod
            ; if we already found one, make sure others are removed
            if theData.scanTempleImod
                theData.scanTempleImod.Remove()
            endif
        Else
            ; check if this imod is valid:
            ;   - currentMaxImodAngle <= requiredAngleExtent
            ;   - current angle is within requiredAngleExtent
            if currentMaxImodAngle <= theData.requiredAngleExtent && Math.abs(currentAngle) <= theData.requiredAngleExtent 
                debug.trace(self + "        found valid data: i="+ i + ": theData.requiredAngleExtent=" + theData.requiredAngleExtent + " - distortionLevel=" + theData.distortionLevel)
                foundValidImod = true

                float distance = GetClampedDistance()

                if currentImodIndex != i
                    currentImodIndex = i
                    debug.trace(self + "            different from current distortion level - applying")
                    Game.SetHandscannerDistortionLevel(theData.distortionLevel)
                    if theData.scanTempleImod
                        theData.scanTempleImod.Apply()
                    endif
                    ; sound
                    if theData.soundEvent
                        theData.soundEvent.PlayWithRTPC(playerRef, ArtifactPuzzle_TempleDistance, distance)
                    endif
                    ; reset currentImodTime
                    currentImodTime = 0.0
                Else
                    debug.trace(self + "            same as current distortion level - currentImodTime=" + currentImodTime + " loopTime=" + theData.loopTime)
                    ; check if it's time to reapply
                    if currentImodTime >= theData.loopTime
                        debug.trace(self + "                reapplying imod " + currentImodIndex)
                        if theData.scanTempleImod
                            theData.scanTempleImod.Apply()
                        endif
                        ; sound
                        if theData.soundEvent
                            theData.soundEvent.PlayWithRTPC(playerRef, ArtifactPuzzle_TempleDistance, distance)
                        endif
                        ; reset currentImodTime
                        currentImodTime = 0.0
                    Else
                        ; increment currentImodTime
                        currentImodTime += scanTempleTimerSeconds
                    endif
                endif
            endif
        endif
        i += 1
    EndWhile
    if foundValidImod == false
        currentImodIndex = 0
        Game.SetHandscannerDistortionLevel(0)
    endif
endFunction

function RemoveAllImods()
    Game.SetHandscannerDistortionLevel(0)
    currentImodIndex = -1
    currentImodTime = 0.0

    int i = 0
    while i < TempleScanImods.Length
        if TempleScanImods[i].scanTempleImod
            TempleScanImods[i].scanTempleImod.Remove()
        endif
        i += 1
    EndWhile
endFunction

;SF-26384: Adding a "Refresh your anomaly/temple aliases" function to fix cases where the game couldn't place a the anomaly on first pass
Function RefillAnomalyOE()
    AnomalyLocation.RefillAlias()
    AnomalyMapMarker.RefillAlias()
    SetMapMarkerFlags(AnomalyMapMarker.GetRef())
EndFunction 