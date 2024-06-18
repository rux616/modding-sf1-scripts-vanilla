Scriptname UC_WeatherTriggerScript extends ObjectReference Const
{Set or force a weather on the player when this trigger loads}

Group Required_Properties
    Weather Property TargetWeather Mandatory Const Auto
    {The weather we want to turn on}
EndGroup

Group Optional_Properties
    bool Property SetAsOverride = false Const Auto
    {If TRUE, this weather will remain in place until the player leaves this planet OR this trigger unloads}

    bool Property UseAcceleratedTransition = false Const Auto
    {If TRUE, the game will attempt to transition to this weather in its accelerated state}
EndGroup

int iTimerID = 1 const
int iTimerLoop = 5 const

Event OnLoad()
    if (IsEnabled())
        trace(self, "Starting up weather transition. Player location: " + Game.GetPlayer().GetCurrentLocation() + ". Weather to swap to: " + TargetWeather + ". Current Weather: " + Weather.GetCurrentWeather())
        StartWeatherChange()
    EndIf
EndEvent

Function StartWeatherChange()
    if Weather.GetCurrentWeather() != TargetWeather
        TargetWeather.SetActive(SetAsOverride, UseAcceleratedTransition)
        trace(self, "Changed weather. Player location: " + Game.GetPlayer().GetCurrentLocation() + ". Current Weather is now: " + Weather.GetCurrentWeather())
    endif
    StartTimer(iTimerLoop, iTimerID)
EndFunction

Function CleanupWeather()
    if SetAsOverride
        Weather.ReleaseOverride()
    endif 
EndFunction

Function CheckCleanupCriteria()
    trace(self, "Checking for clean up.")
    if !Is3DLoaded()
        trace(self, "Trigger isn't loaded. Clean it up! Player location: " + Game.GetPlayer().GetCurrentLocation())
        CleanupWeather()
    else
        trace(self, "Trigger is still loaded. Player location: " + Game.GetPlayer().GetCurrentLocation())
        StartWeatherChange()
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