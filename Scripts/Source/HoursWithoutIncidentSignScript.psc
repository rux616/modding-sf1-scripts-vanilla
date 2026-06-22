Scriptname HoursWithoutIncidentSignScript extends ObjectReference Const

ActorValue property Variable09 auto const mandatory
{ use this AV to track last time we rolled for an incident}

ActorValue property Variable10 auto const mandatory
{ use this AV to track elapsed time since "last incident"}

int property incidentChancePerInterval = 10 auto Const
{ for each elapsed day, this is the chance for an incident }

float property incidentRollInterval = 0.5 auto Const
{ interval in days per roll }

float property maxTimeSinceIncident = 999.0 auto Const
float property minTimeSinceIncident = 0.0 auto Const

int iOneHourTimerID = 1 Const

Event OnLoad()
    ResetSign()
    StartTimerGameTime(1.0, iOneHourTimerID)
    RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerAssaultActor")
EndEvent

Event OnUnload()
    CancelTimerGameTime(iOneHourTimerID)
    UnregisterForRemoteEvent(Game.GetPlayer(), "OnPlayerAssaultActor")
EndEvent

Event OnTimerGameTime(int aiTimerID)
    ResetSign()
    StartTimerGameTime(1.0, iOneHourTimerID)
EndEvent

Event Actor.OnPlayerAssaultActor(Actor akSource, ObjectReference akVictim, Location akLocation, bool aeCrime )
    debug.trace(self + " OnPlayerAssaultActor aeCrime=" + aeCrime)
    if aeCrime
        ; flag an incident
        SetValue(Variable10, Utility.GetCurrentGameTime())
        ResetSign()
    endif
EndEvent

function ResetSign()
    ; check if should reset to 0
    float currentTime = Utility.GetCurrentGameTime()
    float elapsedTimeSinceRoll = currentTime - GetValue(Variable09)
    debug.trace(self + " ResetSign: currentTime=" + currentTime)
    bool incidentHappened = false
    while elapsedTimeSinceRoll > 0.0 && incidentHappened == false
        incidentHappened = Game.GetDieRollSuccess(incidentChancePerInterval)
        elapsedTimeSinceRoll -= incidentRollInterval
        debug.trace(self + "elapsedTimeSinceRoll=" + elapsedTimeSinceRoll + ": roll for incident: " + incidentHappened)
    endWhile
    if incidentHappened
        ; update date when incident happened
        float lastIncident = currentTime - elapsedTimeSinceRoll - incidentRollInterval
        debug.trace(self + "update Variable10 to (currentTime - elapsedTimeSinceRoll - incidentRollInterval)=" + lastIncident)
        SetValue(Variable10, lastIncident)
    EndIf
    ; get current elapsed time
    float timeSinceIncident = currentTime - GetValue(Variable10)
    debug.trace(self + " base timeSinceIncident=" + timeSinceIncident + " currentTime=" + currentTime)

    ; show elapsed time on the board in hours
    timeSinceIncident = Math.Min(timeSinceIncident*24.0, maxTimeSinceIncident)
    timeSinceIncident = Math.Max(timeSinceIncident, minTimeSinceIncident)

    float currentPosition = timeSinceIncident/maxTimeSinceIncident
    debug.trace(self + " modified elapsedTime=" + timeSinceIncident + " currentPosition=" + currentPosition)

    SetAnimationVariableFloat("CurrentPosition", currentPosition)

    ; set last check
    SetValue(Variable09, currentTime)
EndFunction