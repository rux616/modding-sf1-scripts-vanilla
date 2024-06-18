Scriptname UC01_LightTimingRefScript extends ObjectReference Const

float Property WaitTime = 0.0 Auto Const
{How long to wait after inital triggering before turning on this lights linked light}

float Property ShutoffDelayTime = 0.0 Auto Const
{How long to wait before triggering the shutoff impluse}

keyword Property UC01_Spotlight_Keyword Auto Const
{Keyword to control spotlight in conjuction with mural emissive turning on/off}

WwiseEvent Property QST_UC01_Lights_Power_On_WEF Mandatory Const Auto
{Sound to play when a light turns on}

WwiseEvent Property QST_UC01_Lights_Power_Off_WEF Mandatory Const Auto
{Sound to play when a light turns off}

;Local vars
int iTurnOnWaitID = 1 const
int iShutOffWaitID = 2 const

Function StartLightTimer(bool bShutoff = false)
    trace(self, "Starting Light Timer: Disabled: " + IsDisabled() + " Shutoff: " + bShutoff)
    if !bShutoff
        StartTimer(WaitTime, iTurnOnWaitID)
        trace(self, "Turn on timer started with length: " + WaitTime + " and ID: " + iTurnOnWaitID)
    else
        StartTimer(ShutoffDelayTime, iShutOffWaitID)
        trace(self, "Turn off timer started with length: " + ShutoffDelayTime + " and ID: " + iShutOffWaitID)
    endif
EndFunction

Function TriggerLightUpdate(bool bShutoff = false)
    trace(self, "Triggering Light Update: Shutoff: " + bShutoff)
    UC01_LightTimingRefScript NextLight = (GetLinkedRef() as UC01_LightTimingRefScript)
    ObjectReference Spotlight = GetLinkedRef(UC01_Spotlight_Keyword)

    if bShutoff
        CancelTimer(iTurnOnWaitID)
        PlayAnimation("Play02")
        if Spotlight != None
            Spotlight.Disable()
        endif
        QST_UC01_Lights_Power_Off_WEF.Play(Self)
        if NextLight
            NextLight.TriggerLightUpdate(bShutoff = true)
        endif
        trace(self, "Shutting this one off and handing off to next light: " + NextLight)
    else
        PlayAnimation("Play01") 
        if Spotlight != None
            Spotlight.Enable()
        endif
        QST_UC01_Lights_Power_On_WEF.Play(Self)
        if NextLight
            NextLight.StartLightTimer()
        endif
        trace(self, "Turning this one on and handing off to next light: " + NextLight)
    endif
EndFunction

Event OnTimer(int aiTimerID)
    trace(self, "Timer Done: TimerID: " + aiTimerID)
    if aiTimerID == iTurnOnWaitID
        TriggerLightUpdate()
    elseif aiTimerID == iShutOffWaitID
        TriggerLightUpdate(true)
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC01", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction
