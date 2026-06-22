Scriptname SFBGS00D:EMPulseVFXScript extends ObjectReference
{Manages the VFX for the EM Pulse equipment module.}

;Properties
MovableStatic Property EMPulseVFX Mandatory Const Auto
WwiseEvent Property EMPulseAudio Mandatory Const Auto
float Property FXTimerLifespan = 5.0 Const Auto
float Property AudioWaitTime = 0.25 Const Auto

;Non-Properties
    ObjectReference EMPulseRef 
int TimerID = 0

Event OnLoad()
    EMPulseRef = self.PlaceAtMe(EMPulseVFX)
    StartTimer(FXTimerLifespan, TimerID)
    Utility.Wait(AudioWaitTime)
    int instance1 = EMPulseAudio.Play(Game.GetPlayer())
    Debug.Trace("EM Pulse VFX Placed")
EndEvent

Event OnTimer(int aiTimerID)
    If (aiTimerID == TimerID)
        EMPulseRef.Disable()
        EMPulseRef.Delete()
        Debug.Trace("EMPulseRef deleted")

        self.Disable()
        self.Delete()
        Debug.Trace("EMPulse Activator deleted")
    EndIf
EndEvent

