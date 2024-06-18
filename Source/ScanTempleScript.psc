Scriptname ScanTempleScript extends Quest
{prototyping temple scanning via imod}

ImageSpaceModifier property TestScanTempleImod Auto Const Mandatory

float property MinAngle = 10.0 auto Const
float property MaxAngle = 90.0 auto Const

float property MinDistance = 200.0 auto Const
float property MaxDistance = 1000.0 auto const

int scanTempleTimerID = 1 Const
float scanTempleTimerSeconds = 0.5 Const

bool usingHandscanner = false  ; this isn't going to work for real - we'll need a way to check if you have the scanner up or not
ObjectReference currentTarget

Actor playerRef
float DistanceDiff ; difference between MaxDistance and MinDistance
float AngleDiff ; difference between MaxAngle and MinAngle

function StartTempleScanning(ObjectReference targetRef)
    playerRef = Game.GetPlayer()
    DistanceDiff = MaxDistance - MinDistance
    AngleDiff = MaxAngle - MinAngle

    RegisterForMenuOpenCloseEvent("MonocleMenu")
    currentTarget = targetRef
EndFunction

function StopTempleScanning()
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
    if usingHandscanner
        ; get angle to currentTarget
        float zAngle = Game.GetCameraHeadingAngle(currentTarget)

        ; TODO - modify min/max angle by distance to target
        float angleExtent = GetAngleExtent()
        float currentMaxAngle = angleExtent/2
        float currentMinAngle = currentMaxAngle * -1

        debug.trace(self + " zAngle=" + zAngle + " currentMin=" + currentMinAngle + " currentMax=" + currentMaxAngle)
        if zAngle >= currentMinAngle && zAngle <= currentMaxAngle
            ; make sure VFX is up
            TestScanTempleImod.Apply()
        Else
            TestScanTempleImod.Remove()
        endif
        ; rerun timer
        StartTimer(scanTempleTimerSeconds, scanTempleTimerID)
    Else
        ; kill VFX, don't rerun timer
        TestScanTempleImod.Remove()
    endif
EndFunction

float function GetAngleExtent()
    ; get distance to target
    float distance = Math.Clamp(playerRef.GetDistance(currentTarget), MinDistance, MaxDistance)

    ; get multiplier based on how far from target
    float distanceMult = (distance - MinDistance)/DistanceDiff

    ; scale angle extent by distance mult
    float angleExtent = MinAngle + distanceMult*AngleDiff
    debug.trace(self + " clamped distance=" + distance + ", angleExtent=" + angleExtent)
    return angleExtent
endFunction
