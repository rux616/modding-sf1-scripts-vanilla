Scriptname SBRingPuzzleNEWScript extends ObjectReference conditional
{ New Ring Puzzle script. }

group keywords
    Keyword Property SBRingsPuzzleKeyword Mandatory Const Auto
    Keyword Property SBPowerTriggerEnableMarkerKeyword Mandatory Const Auto
    Keyword Property SBRumbleDebrisEnableMarkerKeyword Mandatory Const Auto
EndGroup

group effects
    Form property MarkerDummyA const auto mandatory
    { used to test solution distance }
EndGroup

struct ringData
    WwiseEvent ringToneEvent
    int ringToneInstance = -1
    WwiseEvent successEvent
    String ringTuningSoundString
    float solutionPosition = 0.0 ; solution postion for this ring
endStruct

struct solutionData
    ObjectReference solutionRef 
    float solutionPositionX = 0.0
    float solutionPositionY = 0.0
    float solutionPositionZ = 0.0
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

    WwiseEvent Property wAnomalySuccessEvent Mandatory Const Auto
    WwiseEvent Property wMoveAnomalyEvent Mandatory Const Auto
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

    float property puzzlePositionMaxZ = 15.5 auto Const
    { max Z for solution }

    float property puzzleposition_angleVmin = 0.0 auto Const
    { horizontal angle min }

    float property puzzleposition_angleVmax = 90.0 auto Const
    { horizontal angle max }

    float property puzzleposition_angleHmin = 15.0 auto Const
    { horizontal angle min }

    float property puzzleposition_angleHmax = 345.0 auto Const
    { horizontal angle max }

    float property requiredTuningSeconds = 0.5 auto Const
    { how many seconds does the player need to be within the "tuning spot" to count as the ring/puzzle being "tuned" }

    string property puzzleAnimationString_PlayerPos = "fRingTarget" auto Const
    { animation variable to update puzzle animation based on player position }

    string property puzzleAnimationString_OpenStart = "Open" auto Const
    { animation to open the puzzle rings }

    string property puzzleAnimationString_OpenFinish = "Opened" auto Const
    { event when open animation is done }
    
    string property puzzleAnimationString_Close = "Close" auto Const
    { animation to show puzzle success }

    string property puzzleAnimationString_Reset = "Reset" auto Const
    { animation to reset the puzzle }

    string property puzzleEventString_ReactionEnd = "ReactionEnd" auto Const
    { custom animation event sent when puzzle is done reacting to player on completion }

    string property puzzleWwiseEventString_RingsAll_Tuning = "ArtifactPuzzle_RingsAll_Tuning" auto Const
    { puzzle "tuning" Wwise event }

    int property solutionCount = 5 auto
    { how many times does the player need to solve the puzzle? }

    float property solutionMovementTimeStart = 10.0 auto
    { starting time for solution to move }

    float property solutionMovementTimeMin = 2.5 Auto
    { fastest solution movement time (on last solution) - so each time you solve a step, actual movement timer will be reduced by:
        (solutionMovementTimeStart - solutionMovementTimeMin) * currentSolutionIndex / solutionCount
    }

    float property minSolutionMoveDistance = 15.0 auto
    { try to make sure next solution is at least this far from previous }
endGroup

group SolutionVisibility 
    Form property SolutionVisibilityMarker const auto
    { placed at solution position }

    float property minPuzzleTuningOrientationSolution = 0.92 auto Const
    { how close is required to total puzzle completion to count as "tuned"? }

    string property solutionAnimationString_Hide = "Stage1" auto Const
    { animation to hide solution }

    string property solutionAnimationString_Appear = "Stage2" auto Const
    { animation to show solution }

    string property solutionAnimationString_Success = "Stage3" auto Const
    { animation to show solution success }

    string property solutionAnimationString_Move = "Stage4" auto Const
    { animation when solution moves }

    string property solutionAnimationString_Finish = "FXAnimFinish" auto Const
    { event when all solution animations are done }
endGroup


group quests
    Quest Property QuestToCheck Const Auto
    Int Property StageToSet Const Auto
    Quest Property MQ104A Mandatory Const Auto
    Int Property MQ104APuzzleStartedStage = 402 Const Auto
    Int Property MQ104APuzzleCompletedStage = 500 Const Auto
EndGroup

group flags
    bool property PuzzleInitialized = false auto hidden conditional
    bool property PuzzleComplete = false auto hidden conditional
    bool property PlayerIsInTrigger = false auto hidden conditional
    bool property DisableCheckRings = false Auto Const
    { For LC165, using this to disable the CheckRings function and avoid script spam. }

    GlobalVariable Property MQAutoSolvePuzzle Const Auto
EndGroup

Guard ringRotationGuard ProtectsFunctionLogic
CustomEvent PuzzleSolvedEvent

int playerMovementTimerID = 1 Const             ; check rings timer
float playerMovementTimerSeconds = 0.5 const    ; how many seconds between player movement polling
int solutionMovementTimerID = 2 Const           ; solution movement timer

float puzzleX                      ; store puzzle position data
float puzzleY
float puzzleZ

ObjectReference puzzleSolutionRef  ; ref placed at puzzle solution spot
int overallTuningCount = 0         ; count times the player has been in "tuned" position
int requiredTuningCount            ; initialized based on number of length of playerMovementTimerSeconds
solutionData[] puzzleSolutions     ; array holds solution refs + other data
int currentSolutionIndex = 0       ; increment as player solves solution - index to current puzzle solution in puzzleSolutions


Event OnInit()
    debug.trace(self + "OnInit")
    ; initialize solution array
    puzzleSolutions = new solutionData[0]

    ; initialize requiredTuningCount based on speed of timer
    requiredTuningCount = math.Floor(requiredTuningSeconds / playerMovementTimerSeconds)
    
    ResetPuzzleSolutions()
EndEvent

function PlayPuzzleAnimation(ObjectReference akRef, string asAnimation, string asEndEvent = "", bool tryAgainOnFail = true)
    ; Try to play the specified animation. Waits for the 3D of the target reference to be loaded.
    ; Because the animation graph may not yet be initialized even though the 3D is loaded (such as
    ; if this reference were recently loaded, placed, or moved), attempt playing it repeatedly if 
    ; unsuccessful unless the Try Again on Fail flag is false.
    
    debug.trace(self + "   starting animation " + asAnimation + " on " + akRef + " (asEndEvent = " + asEndEvent + ", tryAgainOnFail = " + tryAgainOnFail + ")")
    bool animSuccess = false
    int maxAnimAttemptCount = 10
    int animAttemptCount = 0

    if !tryAgainOnFail
        maxAnimAttemptCount = 1
    endif

    if akRef.WaitFor3DLoad()
        while !animSuccess && animAttemptCount < maxAnimAttemptCount
            if asEndEvent
                animSuccess = akRef.PlayAnimationAndWait(asAnimation, asEndEvent)
            else
                animSuccess = akRef.PlayAnimation(asAnimation)
            endif

            if !animSuccess && tryAgainOnFail
                Utility.Wait(0.1)
                debug.trace(self + "   playback for animation " + asAnimation + " on " + akRef + " unsuccessful, trying again (attempt " + (animAttemptCount + 1) + " / " + maxAnimAttemptCount + ")")
            endif

            animAttemptCount += 1
        endWhile
    else
        debug.trace(self + "   3D FAILED TO LOAD for " + akRef)
    endif

    if animSuccess
        debug.trace(self + "   finished animation " + asAnimation + " on " + akRef)
    else
        debug.trace(self + "   PLAYBACK FAILED for animation " + asAnimation + " on " + akRef)
    endif
endFunction

function ResetPuzzleSolutions()
    debug.trace(self + " ResetPuzzleSolutions")
    ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)

    puzzleX = puzzleRef.GetPositionX()
    puzzleY = puzzleRef.GetPositionY()
    puzzleZ = puzzleRef.GetPositionZ()

    currentSolutionIndex = 0 ; reset current solution
    puzzleSolutions.Clear()

    int i = 0
    ObjectReference lastSolution = NONE
    while i < solutionCount
        solutionData newPuzzleSolution = ResetPuzzleSolution(lastSolution)
        debug.trace(self + "  ResetPuzzleSolutions: adding solution " + i)
        puzzleSolutions.Add(newPuzzleSolution)
        lastSolution = newPuzzleSolution.solutionRef
        i += 1
    EndWhile

    DebugTraceSolutionData()

    debug.trace(self + "  ResetPuzzleSolutions: creating visible solution")
    SetPuzzleSolutionRef(false)
EndFunction

solutionData function ResetPuzzleSolution(ObjectReference distanceTestRef = NONE)
    debug.trace(self + " ResetPuzzleSolution")

    ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)
    solutionData puzzleSolutionData = new solutionData

    float solutionX
    float solutionY
    float solutionZ

    ; initialize puzzle solution
    bool foundSolution = false
    int failsafeCount = 5
    
    while foundSolution == false && failsafeCount > 0
        ; find two random angles
        ; angle above horizontal plane - 0 to 90
        float angleV = Utility.RandomFloat(puzzleposition_angleVmin, puzzleposition_angleVmax)
        float angleH = Utility.RandomFloat(puzzleposition_angleHmin, puzzleposition_angleHmax)
        float solutionRadius = Utility.RandomFloat(puzzlePositionMinZ, puzzlePositionMaxZ)

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
        float radiusH = math.sqrt((solutionRadius * solutionRadius) - (solutionZ * solutionZ))
        debug.trace(self + " radiusH: " + radiusH)

        ; find y:
        ;    sin(angleH) = y/radiusH
        ;    y = sin(angleH)*radiusH
        solutionY = Math.sin(angleH) * radiusH

        ;    cos(angleH) = x/radiusH
        ;    x = cos(angleH)*radiusH
        solutionX = Math.cos(angleH) * radiusH

        debug.trace(self + " solutionX: " + solutionX)
        debug.trace(self + " solutionY: " + solutionY)

        if distanceTestRef
            ; check distance between test reference and this one
            ObjectReference testRef = puzzleRef.PlaceAtMe(MarkerDummyA)
            testRef.MoveTo(puzzleRef, solutionX, solutionY, solutionZ)
            float moveDistance = testRef.GetDistance(distanceTestRef)
            debug.trace(self + " distance from last solution = " + moveDistance)
            if  moveDistance >= minSolutionMoveDistance
                foundSolution = true
            Else
                debug.trace(self + " ---->TOO CLOSE to last solution - try again")
                failsafeCount += 1
            endif
            testRef.Delete()
        Else
            foundSolution = true
        endif
    EndWhile

    puzzleSolutionData.solutionPositionX = solutionX
    puzzleSolutionData.solutionPositionY = solutionY
    puzzleSolutionData.solutionPositionZ = solutionZ

    ; create solution marker
    puzzleSolutionData.solutionRef = puzzleRef.PlaceAtMe(SolutionVisibilityMarker)

    ; move it to the solution position
    puzzleSolutionData.solutionRef.MoveTo(puzzleRef, solutionX, solutionY, solutionZ)

    debug.trace(self + " ResetPuzzleSolution DONE: Puzzle solution: " + puzzleSolutionData.solutionRef + ": " + solutionX + ", " + solutionY + ", " + solutionZ)

    return puzzleSolutionData
EndFunction

function SetPuzzleSolutionRef(bool bShowSolution = true)
    debug.trace(self + "SetPuzzleSolutionRef bShowSolution =" + bShowSolution)
    ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)

    ; move it to the current solution position
    solutionData currentSolution = puzzleSolutions[currentSolutionIndex]
    puzzleSolutionRef = currentSolution.solutionRef

    PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Hide, solutionAnimationString_Finish)
    if bShowSolution
        PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Appear, solutionAnimationString_Finish)
    endif
EndFunction

function ClearSolutionRef()
    debug.trace(self + "ClearSolutionRef")
    if puzzleSolutionRef
        puzzleSolutionRef.Disable()
        puzzleSolutionRef.Delete()
        puzzleSolutionRef = None
    endif
EndFunction

function MoveSolution()
    debug.trace(self + " MoveSolution " + currentSolutionIndex)
    LockGuard ringRotationGuard
        if PuzzleComplete == false
            ; get old solution ref
            ObjectReference oldSolutionRef = puzzleSolutions[currentSolutionIndex].solutionRef
            debug.trace(self + "   current solution ref=" + oldSolutionRef)

            ; play move animation and SFX
            PlayPuzzleAnimation(oldSolutionRef, solutionAnimationString_Move, solutionAnimationString_Finish)
            wMoveAnomalyEvent.Play(oldSolutionRef)

            ; create new solution ref
            solutionData newPuzzleSolution = ResetPuzzleSolution(Game.GetPlayer())
            puzzleSolutions[currentSolutionIndex] = newPuzzleSolution
            SetPuzzleSolutionRef()
            debug.trace(self + "    new solution ref=" + puzzleSolutionRef)

            ; clean up old solution
            oldSolutionRef.Delete()

            ; start solution movement timer
            StartSolutionMovementTimer()
        endif
    EndLockGuard
EndFunction

function StartSolutionMovementTimer()
    ; calculate current solution movement time
    float solutionTimeDifference = (solutionMovementTimeStart - solutionMovementTimeMin) * currentSolutionIndex / solutionCount
    float solutionTime = solutionMovementTimeStart - solutionTimeDifference
    debug.trace(self + " StartSolutionMovementTimer solutionTime=" + solutionTime + " solutionTimeDifference=" + solutionTimeDifference)
    StartTimer(solutionTime, solutionMovementTimerID)
EndFunction

Event OnTriggerEnter(ObjectReference akActionRef)
    If (PuzzleComplete == False && akActionRef == Game.GetPlayer())
        debug.trace(self + " OnTriggerEnter")
        CheckRotateRingsStart()
    EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    If (PuzzleComplete == False && akActionRef == Game.GetPlayer())
        debug.trace(self + " OnTriggerLeave")
        CheckRotateRingsStart()
    EndIf
EndEvent

Event OnTimer(int aiTimerID)
    debug.trace(self + " OnTimer: aiTimerID=" + aiTimerID)
    LockGuard ringRotationGuard
        if aiTimerID == playerMovementTimerID
            RotateRings()
        elseif aiTimerID == solutionMovementTimerID
            MoveSolution()
        endif
    EndLockGuard
EndEvent

function CancelAllTimers()
    CancelTimer(playerMovementTimerID)
    CancelTimer(solutionMovementTimerID)
endFunction

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

function RotateRings(bool usePlayerPosition = True) RequiresGuard(ringRotationGuard) 
    if PuzzleComplete == false && (playerIsInTrigger || usePlayerPosition == false)
        debug.trace(self + " ***********RotateRings " + usePlayerPosition + " ***********")

        ; this changes to just track if player is in solution - we aren't changing ring speed here

        ObjectReference playerRef = Game.GetPlayer()
        
        ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)

        float distanceToSolution = Game.GetPlayer().GetDistance(puzzleSolutionRef)
        float maxDistanceToSolution = puzzlePositionMaxZ * 2
        debug.trace(self + " Distance to solution: " + distanceToSolution)
        distanceToSolution = Math.Min(distanceToSolution, maxDistanceToSolution)
        debug.trace(self + " Distance to solution (clamped): " + distanceToSolution)

        float fTotalPuzzleComplete = 1.0 - (distanceToSolution / maxDistanceToSolution) ; 1.0 = at solution, 0.0 = far from solution

        Debug.Trace(self + "  Rings sound instances: instanceAllTuning=" + instanceAllTuning + " instanceRingsIdling=" + instanceRingsIdling)

        Debug.Trace(self + "  My total puzzle completeness is " + fTotalPuzzleComplete)

        if fTotalPuzzleComplete >= minPuzzleTuningOrientationSolution
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

        ;debug.trace(self + " RotateRings: restarting timer")
        StartTimer(playerMovementTimerSeconds, playerMovementTimerID)
    endif
endFunction

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
                PlayPuzzleAnimation(puzzleRef, puzzleAnimationString_OpenStart, puzzleAnimationString_OpenFinish)
            Else
                debug.Trace(self + " InitializePuzzle - nothing linked with keyword " + SBRingsPuzzleKeyword + " - PUZZLE WILL NOT WORK", aiSeverity=2)
            EndIf

            If (MQ104A.IsRunning()) && (MQ104A.GetStageDone(MQ104APuzzleStartedStage) == False)
                MQ104A.SetStage(MQ104APuzzleStartedStage)
            EndIf

            ; initialize puzzle rings
            InitializeRings()

            ; start solution movement timer
            StartSolutionMovementTimer()
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

    ; For LC165, disable the rings check and just bail out.
    if (DisableCheckRings)
        return
    EndIf

    int i = 0
    while i < Rings.Length
        ringData theRing = Rings[i]
        theRing.ringToneInstance = theRing.ringToneEvent.PlayWithRTPC(puzzleRef, theRing.ringTuningSoundString, 0.0)
        i += 1
    EndWhile

    instanceAllTuning = AllRingsToneEvent.PlayWithRTPC(puzzleRef, puzzleWwiseEventString_RingsAll_Tuning, 0.0)
    instanceRingsIdling = wRingsIdleSoundEvent.PlayWithRTPC(puzzleRef, puzzleWwiseEventString_RingsAll_Tuning, 0.0)

    if puzzleSolutionRef && !puzzleSolutionRef.IsDeleted()
        debug.trace(self + " enabling puzzleSolutionRef " + puzzleSolutionRef)
        puzzleSolutionRef.Enable()
        PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Hide, solutionAnimationString_Finish)
        PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Appear)
    endif

    Debug.Trace(self + "  Rings idle sound started: instanceAllTuning=" + instanceAllTuning + " instanceRingsIdling=" + instanceRingsIdling)
EndFunction

Function CompletePuzzle()
    LockGuard ringRotationGuard    
        Debug.Trace(self + "CompletePuzzle START")

        currentSolutionIndex += 1

        ; did we complete the puzzle or just one step?
        if currentSolutionIndex < puzzleSolutions.Length
            ; complete a step:
            float fTotalPuzzleComplete = (currentSolutionIndex as float)/puzzleSolutions.Length

            WwiseEvent.UpdateInstanceRTPC(instanceAllTuning, puzzleWwiseEventString_RingsAll_Tuning, fTotalPuzzleComplete)
            WwiseEvent.UpdateInstanceRTPC(instanceRingsIdling, puzzleWwiseEventString_RingsAll_Tuning, fTotalPuzzleComplete)

            wAnomalySuccessEvent.Play(game.GetPlayer())

            Debug.Trace(self + "  My total puzzle completeness is " + fTotalPuzzleComplete)
            ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)
            puzzleRef.SetAnimationVariableFloat(puzzleAnimationString_PlayerPos, fTotalPuzzleComplete)

            ; play success animation
            PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Success, solutionAnimationString_Finish)

            ; enable new solution
            SetPuzzleSolutionRef()

            StartSolutionMovementTimer()          
        Else
            ; complete puzzle

            If (MQ104A.IsRunning()) && (MQ104A.GetStageDone(MQ104APuzzleCompletedStage) == False)
                MQ104A.SetStage(MQ104APuzzleCompletedStage)
            EndIf

            PuzzleComplete = true
            DisableNoWait()

            if puzzleSolutionRef
                PlayPuzzleAnimation(puzzleSolutionRef, solutionAnimationString_Success)
            EndIf

            ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)
            ObjectReference powerTriggerEnableMarkerRef = GetLinkedRef(SBPowerTriggerEnableMarkerKeyword)

            int i = 0
            while i < Rings.Length
                ringData theRing = Rings[i]
                StopSoundInstanceIfSet(theRing.ringToneInstance)
                i += 1
            endWhile
            StopSoundInstanceIfSet(instanceAllTuning)

            WwiseEvent_ShakeController_p5_p5_02.Play(game.GetPlayer())

            int instanceSuccess = wSuccessEvent.Play(game.GetPlayer())
            RegisterForAnimationEvent(puzzleRef, puzzleEventString_ReactionEnd)
            PlayPuzzleAnimation(puzzleRef, puzzleAnimationString_Close)
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
        endif
        Debug.Trace(self + "CompletePuzzle END")
    EndLockGuard
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    debug.trace(self + " OnAnimationEvent akSource=" + akSource + " event=" + asEventName)
    if asEventName == puzzleEventString_ReactionEnd
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
        StopSoundInstanceIfSet(instanceRingsIdling)

        ; unregister for the event
        ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)
        UnregisterForAnimationEvent(puzzleRef, puzzleEventString_ReactionEnd)
    endif
EndEvent

Event OnLoad()
    debug.trace(self + "OnLoad")
    ResetPuzzle()
EndEvent

Event OnUnload()
    debug.trace(self + "OnUnload")
    LockGuard ringRotationGuard
        CancelAllTimers()
        ClearSolutionRef()
    EndLockGuard
endEvent

function ResetPuzzle(bool override=false)
    debug.trace(self + "ResetPuzzle")
    if PuzzleComplete == false || override
        LockGuard ringRotationGuard    
            ; put puzzle back into starting state
            currentSolutionIndex = 0
            SetPuzzleSolutionRef(false)

            ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)
            PlayPuzzleAnimation(puzzleRef, puzzleAnimationString_Reset, tryAgainOnFail = false)
            StopSoundInstanceIfSet(instanceRingsIdling)

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

function StopSoundInstanceIfSet(int aiSoundInstance)
    if aiSoundInstance > -1
        WwiseEvent.StopInstance(aiSoundInstance)
    endif
endFunction

Function StopSounds()
    int i = 0
    while i < Rings.Length
        StopSoundInstanceIfSet(Rings[i].ringToneInstance)
        i += 1
    endWhile
    StopSoundInstanceIfSet(instanceAllTuning)
    StopSoundInstanceIfSet(instanceRingsIdling)
endFunction

function testmovetosolution()
    Game.GetPlayer().MoveTo(puzzleSolutionRef)
EndFunction

function DebugTraceSolutionData()
    debug.trace(self + "DebugTraceSolutionData")
    int i = 0
    while i < puzzleSolutions.Length
        solutionData thePuzzleSolution = puzzleSolutions[i]
        debug.trace(self + " i=" + i + ": " + thePuzzleSolution)
        i += 1
    EndWhile
EndFunction

function debugSetSolutionCount(int newCount)
    debug.trace(self + " debugSetSolutionCount " + newCount)
    solutionCount = newCount 
    ResetPuzzleSolutions()
    ResetPuzzle()
    CheckRotateRingsStart()
endFunction

function debugSetSolutionTimes(float startTime, float minTime)
    solutionMovementTimeStart = startTime 
    solutionMovementTimeMin = minTime
endFunction