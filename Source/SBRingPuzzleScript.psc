Scriptname SBRingPuzzleScript extends ObjectReference conditional
{ runs the starborn temple puzzle
    starts tracking the player's position relative to the "solution spot" when player enters trigger
    updates animation variables on puzzle to modify how "tuned" each ring is
    complete puzzle when the player is at "solution spot" (within a tolerance)
}

group keywords
    Keyword Property SBRingsPuzzleKeyword Mandatory Const Auto
    Keyword Property SBPowerTriggerEnableMarkerKeyword Mandatory Const Auto
    Keyword Property SBRumbleDebrisEnableMarkerKeyword Mandatory Const Auto
EndGroup

group effects
    Form property MarkerDummyA const auto mandatory
    { placed at solution position }
EndGroup

struct ringData
    WwiseEvent ringToneEvent
    int ringToneInstance = -1
    WwiseEvent successEvent
    String ringTuningSoundString
    float solutionPosition = 0.0 ; solution postion for this ring
endStruct

group soundData
    WwiseEvent Property AllRingsToneEvent Mandatory Const Auto
    WwiseEvent Property wSuccessEvent Mandatory Const Auto
    WwiseEvent Property wCloseAnimationEvent Mandatory Const Auto
    WwiseEvent Property wRingsIdleSoundEvent Mandatory Const Auto

    WwiseEvent Property wRumble Mandatory Const Auto
    WwiseEvent Property wRingsRelease Mandatory Const Auto
    WwiseEvent Property wOpenAnimation Mandatory Const Auto

    WwiseEvent Property wRingRotationSoundEvent Const Auto Mandatory

    WwiseEvent Property WwiseEvent_ShakeController_p5_p5_05 Mandatory Const Auto
    WwiseEvent Property WwiseEvent_ShakeController_p5_p5_02 Mandatory Const Auto

    ; sound handles
    int property instanceRingsIdling = -1 Auto hidden
    int property instanceAllTuning = -1 Auto hidden
EndGroup

group PuzzleData
    ringData[] property Rings auto mandatory

    float property fRingSpeedMin = 0.1 auto Const
    float property fRingSpeedMax = 10.0 auto Const

    float property minPuzzleTuningOrientation = 0.8 auto Const
    { how close is required to total puzzle completion to count as "tuned"? }

    float property puzzlePositionMaxXY = 20.0 auto const
    { how far away max can the "solution" position be? }

    float property puzzlePositionMinZ = 8.0 auto Const
    { min Z for solution }

    float property puzzlePositionMaxZ = 18.0 auto Const
    { max Z for solution; (min is always 0)}

    float property puzzleposition_angleVmin = 0.0 auto Const
    { horizontal angle min }

    float property puzzleposition_angleVmax = 90.0 auto Const
    { horizontal angle max }

    float property puzzleposition_angleHmin = 15.0 auto Const
    { horizontal angle min }

    float property puzzleposition_angleHmax = 345.0 auto Const
    { horizontal angle max }

    float property requiredTuningSeconds = 3.0 auto Const
    { how many seconds does the player need to be within the "tuning spot" to count as the ring/puzzle being "tuned" }

    string property puzzleAnimationString = "fRingTarget" auto Const
    { animation variable to update puzzle animation based on player position }
endGroup

group SolutionVisibility 
    GlobalVariable property SBPuzzleSolutionVisible const Auto
    { set to 1 to use solution visibility ref }

    string property solutionAnimationString = "fHintVisibility" auto Const
    { animation variable to update solution animation based on player position }

    Form property SolutionVisibilityMarker const auto
    { placed at solution position if SBPuzzleSolutionVisible > 0 }

    float property minPuzzleTuningOrientationSolution = 0.92 auto Const
    { how close is required to total puzzle completion to count as "tuned"? }

endGroup


group quests
    Quest Property QuestToCheck Const Auto
    Int Property StageToSet Const Auto
    Quest Property MQ104A Mandatory Const Auto
    Int Property MQ104APuzzleStartedStage=402 Const Auto
    Int Property MQ104APuzzleCompletedStage=500 Const Auto
EndGroup

group flags
    bool property PuzzleInitialized = false auto hidden conditional

    bool property PuzzleComplete = false auto hidden conditional

    bool property PlayerIsInTrigger = false auto hidden conditional

    bool property DisableCheckRings = false Auto Const
    {TEMP. For LC165, using this to disable the CheckRings function and avoid script spam.}

    GlobalVariable Property MQAutoSolvePuzzle Const Auto
EndGroup

; check rings timer
int playerMovementTimerID = 1 Const
float playerMovementTimerSeconds = 0.5 const ; how many seconds between player movement polling

int instanceRingMovement

Guard ringRotationGuard ProtectsFunctionLogic

; store puzzle position
float puzzleX
float puzzleY
float puzzleZ

; ref placed at puzzle solution spot
ObjectReference puzzleSolutionRef

; ref placed at solution, more or less visible
ObjectReference visibleSolutionRef

; count times the player has been in "tuned" position
int overallTuningCount = 0
int requiredTuningCount ; initialized based on number of length of playerMovementTimerSeconds

CustomEvent PuzzleSolvedEvent

Event OnInit()
    debug.trace(self + "OnInit")
    ; initialize requiredTuningCount based on speed of timer
    requiredTuningCount = math.Floor(requiredTuningSeconds/playerMovementTimerSeconds)

    ResetPuzzleSolution()
EndEvent

function ResetPuzzleSolution(bool bUseMax = false)
    debug.trace(self + "ResetPuzzleSolution")
    ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)

    puzzleX = puzzleRef.GetPositionX()
    puzzleY = puzzleRef.GetPositionY()
    puzzleZ = puzzleRef.GetPositionZ()

    float solutionX
    float solutionY
    float solutionZ

    ; initialize puzzle solution
    ; find two random angles
    ; angle above horizontal plane - 0 to 90
    float angleV = Utility.RandomFloat(puzzleposition_angleVmin, puzzleposition_angleVmax)
    float angleH = Utility.RandomFloat(puzzleposition_angleHmin, puzzleposition_angleHmax)
    float solutionRadius = Utility.RandomFloat(puzzlePositionMinZ, puzzlePositionMaxZ)
    if bUseMax
        solutionRadius = puzzlePositionMaxZ
    endif

    debug.trace(self + " Puzzle solution calculation: ")
    debug.trace(self + " angleV: " + angleV)
    debug.trace(self + " angleH: " + angleH)
    debug.trace(self + " solutionRadius: " + solutionRadius)

    ; find z: 
    ;    sin(angleV) = z/solutionRadius
    ;    z = solutionRadius*sin(angleV)
    solutionZ = solutionRadius * Math.sin(angleV)
    debug.trace(self + " solutionZ: " + solutionZ)

    ; find radiusH (radius on XY plane)
    ;    radiusH^2 + z^2 = solutionRadius^2
    ;    radiusH = sqrt(solutionRadius^2 - z^2)
    float radiusH = math.sqrt((solutionRadius*solutionRadius) - (solutionZ*solutionZ))
    debug.trace(self + " radiusH: " + radiusH)

    ; find y:
    ;    sin(angleH) = y/radiusH
    ;    y = sin(angleH)*radiusH
    solutionY = Math.sin(angleH)*radiusH

    ;    cos(angleH) = x/radiusH
    ;    x = cos(angleH)*radiusH
    solutionX = Math.cos(angleH)*radiusH

    debug.trace(self + " solutionX: " + solutionX)
    debug.trace(self + " solutionY: " + solutionY)

    rings[0].solutionPosition = solutionX
    rings[1].solutionPosition = solutionY
    rings[2].solutionPosition = solutionZ

    debug.trace(self + " Puzzle solution: " + solutionX + ", " + solutionY + ", " + solutionZ)

    DebugTraceRingData()

    CreateSolutionRef()
EndFunction

function CreateSolutionRef()
    debug.trace(self + "CreateSolutionRef")
    ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)

    ; place solution marker
    if puzzleSolutionRef == None
        ; create one
        puzzleSolutionRef = puzzleRef.PlaceAtMe(MarkerDummyA)
    EndIf
    ; move it to the solution position
    debug.trace(self + "  move solution to solution position: " + rings[0].solutionPosition + ", " + rings[1].solutionPosition + ", " + rings[2].solutionPosition)
    
    puzzleSolutionRef.MoveTo(puzzleRef, rings[0].solutionPosition, rings[1].solutionPosition, rings[2].solutionPosition)

    if SBPuzzleSolutionVisible.GetValue() > 0
        if visibleSolutionRef == None
            visibleSolutionRef = puzzleSolutionRef.PlaceAtMe(SolutionVisibilityMarker, abInitiallyDisabled = true)
        Else
            visibleSolutionRef.MoveTo(puzzleSolutionRef)
        endif
        visibleSolutionRef.SetAnimationVariableFloat(solutionAnimationString, 0.0)
        visibleSolutionRef.Enable()
    endif
EndFunction

function ClearSolutionRef()
    debug.trace(self + "ClearSolutionRef")
    puzzleSolutionRef = None
    if visibleSolutionRef
        visibleSolutionRef.Disable()
        visibleSolutionRef.Delete()
        visibleSolutionRef = None
    endif
EndFunction

Event OnTriggerEnter(ObjectReference akActionRef)
    If (PuzzleComplete==false && akActionRef == game.getplayer())
        debug.trace(self + " OnTriggerEnter")
        CheckRotateRingsStart()
    EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    If (PuzzleComplete==false && akActionRef == game.getplayer())
        debug.trace(self + " OnTriggerLeave")
        CheckRotateRingsStart()
    EndIf
EndEvent

Event OnTimer(int aiTimerID)
    debug.trace(self + " OnTimer: aiTimerID=" + aiTimerID)
    if aiTimerID == playerMovementTimerID
        LockGuard ringRotationGuard
            RotateRings()
        EndLockGuard
    endif
EndEvent

function CheckRotateRingsStart()
    debug.trace(self + " CheckRotateRingsStart ")
    LockGuard ringRotationGuard
        playerIsInTrigger = IsInTrigger(Game.GetPlayer())
        Cell myCell = GetParentCell()
        debug.trace(self + " myCell=" + myCell)
        if playerIsInTrigger
            debug.trace(self + " setting gravity to 0.0")
            myCell.SetGravityScale(0.0)
            InitializePuzzle()
            RotateRings()
        Else
            RotateRings(false)        
        endif
    EndLockGuard
EndFunction

function RotateRings(bool usePlayerPosition=true) RequiresGuard(ringRotationGuard) 
    if PuzzleComplete == false && (playerIsInTrigger || usePlayerPosition==false)
        debug.trace(self + " ***********RotateRings " + usePlayerPosition + " ***********")
        ObjectReference playerRef = Game.GetPlayer()
        
        ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)

        float distanceToSolution = Game.GetPlayer().GetDistance(puzzleSolutionRef)
        float maxDistanceToSolution = puzzlePositionMaxZ*2
        debug.trace(self + " Distance to solution: " + distanceToSolution)
        distanceToSolution = Math.Min(distanceToSolution, maxDistanceToSolution)
        debug.trace(self + " Distance to solution (clamped): " + distanceToSolution)

        float fTotalPuzzleComplete = 1.0 - (distanceToSolution/maxDistanceToSolution) ; 1.0 = at solution, 0.0 = far from solution

        Debug.Trace(self + "  Rings sound instances: instanceAllTuning=" + instanceAllTuning + " instanceRingsIdling=" + instanceRingsIdling)

        WwiseEvent.UpdateInstanceRTPC(instanceAllTuning, "ArtifactPuzzle_RingsAll_Tuning", fTotalPuzzleComplete)
        WwiseEvent.UpdateInstanceRTPC(instanceRingsIdling, "ArtifactPuzzle_RingsAll_Tuning", fTotalPuzzleComplete)

        Debug.Trace(self + "  My total puzzle completeness is " + fTotalPuzzleComplete)
        puzzleRef.SetAnimationVariableFloat(puzzleAnimationString, fTotalPuzzleComplete)
        if visibleSolutionRef
            visibleSolutionRef.SetAnimationVariableFloat(solutionAnimationString, fTotalPuzzleComplete)
        EndIf

        if (fTotalPuzzleComplete >= minPuzzleTuningOrientation && visibleSolutionRef == NONE) || ( fTotalPuzzleComplete >= minPuzzleTuningOrientationSolution)
            overallTuningCount += 1
            debug.trace(self + " Player in solution spot!!! overallTuningCount=" + overallTuningCount)
            if overallTuningCount >= requiredTuningCount
                Utility.Wait(0.1)
                debug.trace(self + " Puzzle solved!")
                CompletePuzzle()
            endif
        else
            overallTuningCount = 0
        EndIf

        debug.trace(self + " RotateRings: restarting timer")
        StartTimer(playerMovementTimerSeconds, playerMovementTimerID)
    endif
endFunction

function testmovetosolution()
    Game.GetPlayer().MoveTo(puzzleSolutionRef)
EndFunction

function DebugTraceRingData()
    int i = 0
    while i < 3
        ringData theRing = rings[i]
        debug.trace(self + " RING " + i + ": " + theRing)
        i += 1
    EndWhile
EndFunction

Function InitializePuzzle()
    debug.trace(self + "InitializePuzzle")
    LockGuard ringRotationGuard    

        if PuzzleInitialized == false
            PuzzleInitialized = true

            ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)

            debug.trace(self + "**********************")
            debug.trace(self + "InitializePuzzle:")
            debug.trace(self + " puzzleRef=" + puzzleRef)
            debug.trace(self + "**********************")

            if PuzzleComplete
                debug.trace(self + " Puzzle is complete - do nothing")
                return
            EndIf

            int instanceRumble = wRumble.Play(game.GetPlayer())
            GetLinkedRef(SBRumbleDebrisEnableMarkerKeyword).Enable()
            WwiseEvent_ShakeController_p5_p5_05.Play(game.GetPlayer())

            Utility.Wait(2)

            if puzzleRef
                wRingsRelease.Play(puzzleRef)
                Utility.Wait(0.3)
                wOpenAnimation.Play(puzzleRef)
                debug.trace(self + " starting OPEN")
                puzzleRef.PlayAnimationAndWait("Open", "Opened")
                debug.trace(self + " finished OPEN")
            Else
                debug.Trace(self + " InitializePuzzle - nothing linked with keyword " + SBRingsPuzzleKeyword + " - PUZZLE WILL NOT WORK", aiSeverity=2)
            EndIf

            If (MQ104A.IsRunning()) && (MQ104A.GetStageDone(MQ104APuzzleStartedStage) == False)
                MQ104A.SetStage(MQ104APuzzleStartedStage)
            EndIf

            ; initialize puzzle rings
            InitializeRings()
        endif
        debug.Trace(self + "InitializePuzzle - DONE")
    EndLockGuard
EndFunction

Function InitializeRings() RequiresGuard(ringRotationGuard) 
    debug.trace(self + " InitializeRings")
    ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)
    Utility.Wait(1)
    puzzleRef.SetAnimationVariableFloat("Speed", 0.03)
    int count = 0
    ObjectReference[] myDebris = GetRefsLinkedToMe()
    debug.trace(self + " myDebris=" + myDebris)
    While (count < myDebris.length)
        ObjectReference currentObjectReference = myDebris[count]
        if currentObjectReference.Is3DLoaded()
            currentObjectReference.SetMotionType(currentObjectReference.Motion_Dynamic, false)
        endif
        count += 1
    EndWhile
    Utility.Wait(0.2)

    ;TEMP: For LC165, disable the rings check and just bail out.
    if (DisableCheckRings)
        return
    EndIf

    int i = 0
    while i < Rings.Length
        ringData theRing = Rings[i]
        theRing.ringToneInstance = theRing.ringToneEvent.PlayWithRTPC(puzzleRef, theRing.ringTuningSoundString, 0.0)
        i += 1
    EndWhile

    instanceAllTuning = AllRingsToneEvent.PlayWithRTPC(puzzleRef, "ArtifactPuzzle_RingsAll_Tuning", 0.0)
    instanceRingsIdling = wRingsIdleSoundEvent.PlayWithRTPC(puzzleRef, "ArtifactPuzzle_RingsAll_Tuning", 0.0)
    Debug.Trace(self + "  Rings idle sound started: instanceAllTuning=" + instanceAllTuning + " instanceRingsIdling=" + instanceRingsIdling)
EndFunction

Function CompletePuzzle()
    LockGuard ringRotationGuard    
        Debug.Trace(self + "CompletePuzzle START")

        If (MQ104A.IsRunning()) && (MQ104A.GetStageDone(MQ104APuzzleCompletedStage) == False)
            MQ104A.SetStage(MQ104APuzzleCompletedStage)
        EndIf

        PuzzleComplete = true
        DisableNoWait()

        if visibleSolutionRef
            visibleSolutionRef.SetAnimationVariableFloat(solutionAnimationString, 0.0)
        EndIf

        ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)
        ObjectReference powerTriggerEnableMarkerRef = GetLinkedRef(SBPowerTriggerEnableMarkerKeyword)

        int i = 0
        while i < Rings.Length
            ringData theRing = Rings[i]
            WwiseEvent.StopInstance(theRing.ringToneInstance)
            i += 1
        endWhile
        WwiseEvent.StopInstance(instanceAllTuning)

        WwiseEvent_ShakeController_p5_p5_02.Play(game.GetPlayer())

        int instanceSuccess = wSuccessEvent.Play(game.GetPlayer())
        RegisterForAnimationEvent(puzzleRef, "ReactionEnd")
        puzzleRef.PlayAnimation("Close")
        int instanceCloseAnimation = wCloseAnimationEvent.Play(puzzleRef)
        int count = 0
        ObjectReference[] myDebris = GetRefsLinkedToMe()
        While (count < myDebris.length)
            ObjectReference currentObjectReference = myDebris[count]
            currentObjectReference.SetMotionType(currentObjectReference.Motion_Dynamic, false)
            count += 1
        EndWhile

        WwiseEvent_ShakeController_p5_p5_05.Play(game.GetPlayer())

        count = 0
        While (count < myDebris.length)
            float fRandom = Utility.RandomFloat(0.3, 1.4)
            ObjectReference currentObjectReference = myDebris[count]
            currentObjectReference.ApplyHavokImpulse(0.0, 0.0, 1.0, fRandom)
            count += 1
        EndWhile
        
        ; NOTE: rest of sequence is handled by OnAnimationEvent

        Debug.Trace(self + "CompletePuzzle END")
    EndLockGuard
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    debug.trace(self + " OnAnimationEvent akSource=" + akSource + " event=" + asEventName)
    if asEventName == "ReactionEnd"
        if QuestToCheck && StageToSet > -1
            QuestToCheck.SetStage(StageToSet)
            Debug.Trace(self + "Stage " + StageToSet + " set on quest " + QuestToCheck)
        endif

        ;notify any scripts listening for the puzzle to be solved
        SendCustomEvent("PuzzleSolvedEvent")

        ObjectReference powerTriggerEnableMarkerRef = GetLinkedRef(SBPowerTriggerEnableMarkerKeyword)
        if powerTriggerEnableMarkerRef
            powerTriggerEnableMarkerRef.Enable()
        endif

        Utility.Wait(2)
        WwiseEvent.StopInstance(instanceRingsIdling)

        ; unregister for the event
        ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)
        UnregisterForAnimationEvent(puzzleRef, "ReactionEnd")
    endif
EndEvent

Event OnLoad()
    debug.trace(self + "OnLoad")
    ResetPuzzle()
EndEvent

Event OnUnload()
    debug.trace(self + "OnUnload")
    ClearSolutionRef()
endEvent

function ResetPuzzle(bool override=false)
    debug.trace(self + "ResetPuzzle")
    if PuzzleComplete == false || override
        LockGuard ringRotationGuard    
            ; put puzzle back into starting state
            CreateSolutionRef()

            ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)
            puzzleRef.PlayAnimation("Reset")
            WwiseEvent.StopInstance(instanceRingsIdling)

            ObjectReference powerTriggerEnableMarkerRef = GetLinkedRef(SBPowerTriggerEnableMarkerKeyword)
            if powerTriggerEnableMarkerRef
                powerTriggerEnableMarkerRef.DisableNoWait()
            endif

            EnableNoWait()
            playerIsInTrigger = false
            PuzzleInitialized = false
            if override
                PuzzleComplete = false
            endif
        EndLockGuard
    endif
endFunction

Function StopSounds()
    int i = 0
    while i < Rings.Length 
        WwiseEvent.StopInstance(Rings[i].ringToneInstance)
        i += 1
    endWhile
    WwiseEvent.StopInstance(instanceAllTuning)
    WwiseEvent.StopInstance(instanceRingsIdling)
endFunction
