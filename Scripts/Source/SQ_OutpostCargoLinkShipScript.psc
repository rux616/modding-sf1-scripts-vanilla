Scriptname SQ_OutpostCargoLinkShipScript extends SpaceshipReference

SQ_OutpostCargoLinkScript property SQ_OutpostCargoLink auto const mandatory

Keyword property LinkOutpostCargoShipLandingMarker01 auto const mandatory
Keyword property LinkOutpostCargoShipLandingMarker02 auto const mandatory

Keyword property LinkOutpostCargoShipLandingMarkerCurrent auto const mandatory

Keyword Property LandingMarkerKeyword Auto Mandatory Const
{ used to find landing marker }

Keyword Property LandingZoneTriggerKeyword Auto Mandatory Const
{ used to find landing zone trigger }

ActorValue property OutpostCargoLinkShipDestination auto const mandatory
{ use to condition packages }

bool property RequiresFuel = false auto hidden
{ if false, ignore CanProduce checks
    set by script when created  }

String property fCalendarTimeScaleGroundString="fCalendarTimeScaleGround" auto Const
{ gamesetting for time scale multiplier on real time for game time: game time = real time * fCalendarTimeScaleGround }

int property WaitToLoadCargoTimerID = 0 auto const 
float property WaitToLoadCargoSeconds = 30.0 auto Const
{ 0.04 game hours = 30 seconds of real time }

int property WaitToTakeoffTimerID = 1 auto const 
float property WaitToTakeoffSeconds = 15.0 auto Const
{ 0.02 game hours = 15 seconds of real time }

int property WaitForFuelTimerID = 2 auto const 
float property WaitForFuelSeconds = 30.0 auto Const
{ 0.04 game hours = 30 seconds of real time }

float fCalendarTimeScaleGround
float WaitToLoadCargoGameHours
float WaitToTakeoffGameHours
float WaitForFuelGameHours

bool timersInitialized

Event OnInit()
    InitializeTimers()
EndEvent

function InitializeTimers()
    if timersInitialized  == false
        timersInitialized = true
        fCalendarTimeScaleGround = Game.GetGameSettingFloat(fCalendarTimeScaleGroundString)
        float secondsToHours = 60*60
        WaitToLoadCargoGameHours = WaitToLoadCargoSeconds/secondsToHours * fCalendarTimeScaleGround
        WaitToTakeoffGameHours = WaitToTakeoffSeconds/secondsToHours * fCalendarTimeScaleGround
        WaitForFuelGameHours = WaitForFuelSeconds/secondsToHours * fCalendarTimeScaleGround

        debug.trace(self + " OnInit: WaitToLoadCargoGameHours=" + WaitToLoadCargoGameHours + " WaitToTakeoffGameHours=" + WaitToTakeoffGameHours + " WaitForFuelGameHours=" + WaitForFuelGameHours)
    endif
EndFunction

; called when ship is deleted
function CancelTimers()
    CancelTimerGameTime(WaitToLoadCargoTimerID)
    CancelTimerGameTime(WaitForFuelTimerID)
    CancelTimerGameTime(WaitToTakeoffTimerID)
EndFunction

function ArriveAtOutpost()
    debug.trace(self + "ArriveAtOutpost")
    ; unload cargo
    bool canproduce = TransferCargo(true)
    if canProduce || RequiresFuel == false
        debug.trace(self + " fuel available - start load timer")
        ; start timer to load cargo
        float gameTimeHours = WaitToLoadCargoGameHours
        debug.trace(self + " running timer " + WaitToLoadCargoTimerID + " for " + gameTimeHours + " game hours")
        StartTimerGameTime(gameTimeHours, WaitToLoadCargoTimerID)
    Else
        debug.trace(self + " NO fuel available - start idle timer")
        ; start idle timer to wait for fuel
        float gameTimeHours = WaitForFuelGameHours
        debug.trace(self + " running timer " + WaitForFuelTimerID + " for " + gameTimeHours + " game hours")
        StartTimerGameTime(gameTimeHours, WaitForFuelTimerID)
    endif
EndFunction

function LeaveOutpost()
    debug.trace(self + "LeaveOutpost")
    ; switch linked ref to other outpost
    ObjectReference landingMarker01Ref = GetLinkedRef(LinkOutpostCargoShipLandingMarker01)
    ObjectReference landingMarker02Ref = GetLinkedRef(LinkOutpostCargoShipLandingMarker02)

    ObjectReference landingMarkerCurrent = GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent)

    bool bAtOutpost01
    if landingMarkerCurrent == landingMarker01Ref
        bAtOutpost01 = true
        SetLinkedRef(landingMarker02Ref, LinkOutpostCargoShipLandingMarkerCurrent)
        SetValue(OutpostCargoLinkShipDestination, 1)
    Else
        bAtOutpost01 = false
        SetLinkedRef(landingMarker01Ref, LinkOutpostCargoShipLandingMarkerCurrent)
        SetValue(OutpostCargoLinkShipDestination, 0)
    EndIf
    EvaluatePackage()
    SQ_OutpostCargoLink.ShipLanding(self, bAtOutpost01, SQ_OutpostCargoLink.stateEnum02_landing) ; taking off
endFunction

bool function TransferCargo(bool bUnloadCargo = true)
    debug.trace(self + "TransferCargo bUnloadCargo=" + bUnloadCargo)
    bool bAtOutpost01 = (GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent) == GetLinkedRef(LinkOutpostCargoShipLandingMarker01))
    bool canProduce = SQ_OutpostCargoLink.TransferCargo(self, bAtOutpost01, bUnloadCargo)
    return canProduce
EndFunction

Event OnTimerGameTime(int aiTimerID)
    debug.trace(self + " OnTimerGameTime " + aiTimerID)
    InitializeTimers()
    
    if IsDisabled()
        Return
    EndIf

    if aiTimerID == WaitToLoadCargoTimerID
        ; load cargo
        TransferCargo(false)
        ; start takeoff timer
        float gameTimeHours = WaitToTakeoffGameHours
        debug.trace(self + " running timer " + WaitToTakeoffTimerID + " for " + gameTimeHours + " game hours")
        StartTimerGameTime(gameTimeHours, WaitToTakeoffTimerID)
    elseif aiTimerID == WaitToTakeoffTimerID
        LeaveOutpost()
    elseif aiTimerID == WaitForFuelTimerID
        ArriveAtOutpost()
    endif
EndEvent

Event OnShipLanding(bool abComplete)
    bool bAtOutpost01 = (GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent) == GetLinkedRef(LinkOutpostCargoShipLandingMarker01))
    if abComplete == false
		ObjectReference landingMarker = GetLinkedRef(LandingMarkerKeyword)
        debug.trace(self + " OnShipLanding landingMarker=" + landingMarker)
        if landingMarker
            ; if this landing marker has a landing zone trigger, tell it we're coming in
            LandingZoneTriggerScript landingZoneTrigger = landingMarker.GetLinkedRef(LandingZoneTriggerKeyword) as LandingZoneTriggerScript
            if landingZoneTrigger
                landingZoneTrigger.BeginLanding(self, landingMarker)
            endif
        endif
        SQ_OutpostCargoLink.ShipLanding(self, bAtOutpost01, SQ_OutpostCargoLink.stateEnum02_landing) ; landing
    Else
        SQ_OutpostCargoLink.ShipLanding(self, bAtOutpost01, SQ_OutpostCargoLink.stateEnum03_landed) ; landed
    endif
EndEvent

Event OnShipTakeOff(bool abComplete)
    if abComplete
        bool bAtOutpost01 = (GetLinkedRef(LinkOutpostCargoShipLandingMarkerCurrent) == GetLinkedRef(LinkOutpostCargoShipLandingMarker02)) ; if we're currently linked to marker02, we're "at" (leaving) outpost01
        SQ_OutpostCargoLink.ShipLanding(self, bAtOutpost01, SQ_OutpostCargoLink.stateEnum01_linked) ; back to linked state
    EndIf
EndEvent


