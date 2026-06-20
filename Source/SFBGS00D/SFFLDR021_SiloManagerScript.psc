Scriptname SFBGS00D:SFFLDR021_SiloManagerScript extends ObjectReference

Bool Property IsShuttleBayOpen Auto conditional

Bool Property IsMissileLaunching Auto conditional

Bool Property IsMissileLaunched Auto conditional

Keyword Property LinkCustom01 Auto Mandatory; Missile

Keyword Property LinkCustom02 Auto Mandatory; SFFLDR021_Door

Keyword Property LinkCustom03 Auto Mandatory; Shutters

Keyword Property LinkCustom04 Auto Mandatory; Shutters_02

Keyword Property LinkCustom05 Auto Mandatory; Doorway Collision volume

Keyword Property LinkCustom06 Auto Mandatory; Sound Sequence Source

Keyword Property LinkCustom07 Auto Mandatory; Sound Sequence Source

Guard SFFLD021BatteryCountGuard

Int Property MissileTimer Auto Const

Int Property batteryCount RequiresGuard (SFFLD021BatteryCountGuard) Auto conditional

Int Property CameraShakeTimerStart = 4 Auto Const ; Duration before the camera shakes starts

Group CameraShakeSettings

    Float Property TotalDuration = 16.0 Auto Const; total duration of the effect (ramp-up + hold + ramp-down).

    Float Property MaxIntensity = 0.4 Auto Const        ; the maximum shake strength to reach.

    Int Property Steps = 30 Auto Const      ;  the number of steps in the ramp-up and ramp-down; higher values make the transition smoother.

    Float Property HoldDuration = 6.0 Auto Const      ; duration at maximum shake intensity before the ramp-down begins.

EndGroup

;Const Variables:

Int Missile_TimerID = 316 Const

Int CameraSHake_TimerID = 112233 Const


function SetIsShuttleBayOpen(bool shuttleBayOpen)
    IsShuttleBayOpen = shuttleBayOpen
endFunction

bool function GetIsShuttleBayOpen()
    return IsShuttleBayOpen
endfunction

Function IncrementBatteryCount()
    LockGuard SFFLD021BatteryCountGuard
        batteryCount += 1
    EndLockGuard
EndFunction

int function GetBatteryCount()
    LockGuard SFFLD021BatteryCountGuard
        return batteryCount
    EndLockGuard
endfunction

Function LaunchMissileSequence()
    ; Close and lock Door A
    ObjectReference SFFLDR021_Door = GetLinkedRef(LinkCustom02)
    ObjectReference SFFLDR021_DoorwayCollision = GetLinkedRef(LinkCustom05)

    SFFLDR021_DoorwayCollision.enable()

    if SFFLDR021_Door != None
        if !SFFLDR021_Door.IsLocked()
            SFFLDR021_Door.Lock(254)
        endif

        SFFLDR021_Door.SetOpen(False)
    endif

    ; Close Shutters
    ObjectReference Shutters = GetLinkedRef(LinkCustom03)
    ObjectReference Shutters_02 = GetLinkedRef(LinkCustom04)
    
    if Shutters != None && Shutters_02 !=None
        Shutters.SetOpen(False)
        Shutters_02.SetOpen(False)
    endif

    ;Missile launching
    ObjectReference Missile = GetLinkedRef(LinkCustom01)
    ObjectReference SoundMarker = GetLinkedRef(LinkCustom06)
    
    IsMissileLaunching = true
    Missile.disable()
    StartTimer(MissileTimer, Missile_TimerID)
    SoundMarker.Enable()
    StartTimer(CameraShakeTimerStart, CameraSHake_TimerID)

EndFunction

Event OnTimer(int aiTimerID)
    
    If aiTimerID == 316
        IsMissileLaunched = true
        IsMissileLaunching = false
        GetLinkedRef(LinkCustom03).SetOpen(true)
        GetLinkedRef(LinkCustom04).SetOpen(true)
        GetLinkedRef(LinkCustom02).Unlock()
        GetLinkedRef(LinkCustom05).disable()
        GetLinkedRef(LinkCustom07).disable()
    EndIf

    If aiTimerID == 112233
        PlayFullShake()
    EndIf

EndEvent

Function PlayFullShake()
    Float StepDuration = (TotalDuration - HoldDuration) / (2.0 * Steps)
    Float IntensityStep = MaxIntensity / Steps
    Float CurrentIntensity = 0.0

    ; --- Ramp up---
    While (CurrentIntensity < MaxIntensity)
        CurrentIntensity += IntensityStep
        Game.ShakeCamera(Game.GetPlayer(), CurrentIntensity, StepDuration)
        Utility.Wait(StepDuration)
    EndWhile

    ; --- Hold ---
    Game.ShakeCamera(Game.GetPlayer(), MaxIntensity, HoldDuration)
    Utility.Wait(HoldDuration)

    ; --- Ramp down ---
    While (CurrentIntensity > 0.0)
        Game.ShakeCamera(Game.GetPlayer(), CurrentIntensity, StepDuration)
        Utility.Wait(StepDuration)
        CurrentIntensity -= IntensityStep
    EndWhile
EndFunction
