Scriptname UC_WeatherTriggerScript_OnEnter extends ObjectReference Const
{Set or force a weather on the player when this trigger is entered by the player}

Group Required_Properties
    Weather Property TargetWeather Mandatory Const Auto
    {The weather we want to turn on}
EndGroup

Group Optional_Properties
    bool Property SetAsOverride = false Const Auto
    {If TRUE, this weather will remain in place until the player leaves this planet OR this trigger unloads}

    bool Property UseAcceleratedTransition = false Const Auto
    {If TRUE, the game will attempt to transition to this weather in its accelerated state}

    int Property ShutdownStage = -1 Const Auto
    {If this stage has been set, clean up this weather}

    Quest Property ShutdownQuest Const Auto
    {The quest to check to see if we should shut down this weather}
EndGroup

int iTimerID = 1 const
int iTimerLoop = 10 const

Event OnTriggerEnter(ObjectReference akActionRef)
    trace(self, "Starting up weather transition. Player location: " + Game.GetPlayer().GetCurrentLocation() + ". Weather to swap to: " + TargetWeather + ". Current Weather: " + Weather.GetCurrentWeather())
    if (ShutdownStage == -1 || !ShutdownQuest.GetStageDone(ShutdownStage))
        StartWeatherChange()
    else
        CleanupWeather()
    endif
EndEvent

Function StartWeatherChange()
    if (ShutdownStage == -1 || !ShutdownQuest.GetStageDone(ShutdownStage))
        if Weather.GetCurrentWeather() != TargetWeather
            TargetWeather.SetActive(SetAsOverride, UseAcceleratedTransition)
            trace(self, "Changed weather. Player location: " + Game.GetPlayer().GetCurrentLocation() + ". Current Weather is now: " + Weather.GetCurrentWeather())
        endif
        StartTimer(iTimerLoop, iTimerID)
    else
        CleanupWeather()
    endif
EndFunction

Function CleanupWeather()
    if SetAsOverride
        Weather.ReleaseOverride()
    endif 
EndFunction

Function CheckCleanupCriteria()
    trace(self, "Checking for clean up.")
    if IsInTrigger(Game.GetPlayer()) && (ShutdownStage == -1 || !ShutdownQuest.GetStageDone(ShutdownStage))
        trace(self, "Player's in trigger. Player location: " + Game.GetPlayer().GetCurrentLocation())
        StartWeatherChange()
    else
        trace(self, "Player's not in trigger or shutdown stage has been hit. Clean it up! Player location: " + Game.GetPlayer().GetCurrentLocation())
        CleanupWeather()
    endif
EndFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == iTimerID
        CheckCleanupCriteria()
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC02", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction