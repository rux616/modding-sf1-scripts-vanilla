Scriptname LandingPadBlastShields extends ObjectReference
{Handle the opening and closing of the landing pad blast shields.}

float Property BaseAnimSpeed = 1.0 Const Auto
float Property AnimSpeedVariance = 0.0 Const Auto
float Property BeforeOpenTimer = 12.0 Auto const
float Property OpenToCloseTimer = 13.0 Auto const
Keyword Property LinkedRef_LandingPadShield_EnableMarker Const Auto Mandatory

String property blastShieldOpen = "Play01" auto const
String property blastShieldClose = "Play02" auto const
String property blastShieldInstantClose = "StateA_Idle" auto Const

int BeforeOpenTimerID = 3 Const
int OpenToCloseTimerID = 2 Const

Function ActivateBlastShields(bool isLanding)
    GoToState("Busy")
    if isLanding
        StartTimer(BeforeOpenTimer, BeforeOpenTimerID) ; Time before opening
    Else
        StartTimer(0, BeforeOpenTimerID) ; Time before opening
    endif
EndFunction

Event SpaceshipReference.OnShipTakeOff(SpaceshipReference akSender, bool abComplete)
    ; do nothing
EndEvent

Event OnCellLoad()
    Debug.Trace(self + " OnCellLoad - reset blast shields to down")
    ; reset to down position
    AnimateBlastShields(blastShieldInstantClose)
EndEvent

auto State Idle
    ;Don't do anything if Blast shields are not linked to the landing marker.
    Event OnActivate(ObjectReference akActionRef)
        Debug.Trace(self + " OnActivate " + akActionRef)
        ObjectReference[] linkedrefs = GetLinkedRefChain()
        if(linkedrefs.Length > 0)
            SpaceshipReference spaceshipRef = akActionRef as SpaceshipReference
            if spaceshipRef
                RegisterForRemoteEvent(spaceshipRef, "OnShipTakeOff")
                ActivateBlastShields(true)
            endif
        endif
    EndEvent

    Event SpaceshipReference.OnShipTakeOff(SpaceshipReference akSender, bool abComplete)
        Debug.Trace(self + " OnShipTakeOff")
        if(!abComplete)
            Debug.Trace(self + " Takeoff Started")
            ActivateBlastShields(false)      
            UnregisterForRemoteEvent(akSender, "OnShipTakeOff")
        endif
    EndEvent
EndState

State Busy
    Event OnUnload()
        Debug.Trace(self + " OnUnload (BUSY)")
        CancelTimer(OpenToCloseTimerID)
        CancelTimer(BeforeOpenTimerID)
        GotoState("Idle")
    EndEvent
    
    Event OnTimer(int aiTimerID)
        Debug.trace(self + " OnTimer " + aiTimerID)
        if aiTimerID == OpenToCloseTimerID
            AnimateBlastShields(blastShieldClose)
            ObjectReference EnableMarker = GetLinkedRef(LinkedRef_LandingPadShield_EnableMarker)
            If EnableMarker
                EnableMarker.Disable()
            EndIf
            GoToState("Idle")
        elseif aiTimerID == BeforeOpenTimerID
            AnimateBlastShields(blastShieldOpen)
            ObjectReference EnableMarker = GetLinkedRef(LinkedRef_LandingPadShield_EnableMarker)
            If EnableMarker
                EnableMarker.Enable()
            EndIf
            StartTimer(OpenToCloseTimer, OpenToCloseTimerID) ; Time until Close.
        endif
    EndEvent

    Event SpaceshipReference.OnShipTakeOff(SpaceshipReference akSender, bool abComplete)
        Debug.Trace(self + " OnShipTakeOff - BUSY - do nothing")
    EndEvent
EndState

function AnimateBlastShields(String animationString)
    ObjectReference[] linkedrefs = GetLinkedRefChain()
    int index = 0
    While (index < linkedrefs.Length)
        ObjectReference blastShield = linkedrefs[index]
        AnimateBlastShield(blastShield, animationString)
        index += 1
    EndWhile
endFunction

function AnimateBlastShield(ObjectReference blastShield, String animationString)
    if blastShield && blastShield.Is3DLoaded()
        ;set blast shield animspeed
        blastShield.SetAnimationVariableFloat("AnimSpeed", BaseAnimSpeed + Utility.RandomFloat(-AnimSpeedVariance, AnimSpeedVariance))
        ; open the blast shields.
        blastShield.PlayAnimation(animationString)
    endif
endFunction
