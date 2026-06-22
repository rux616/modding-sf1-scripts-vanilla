Scriptname TrapElectrifiedWaterScript extends TrapBase
;Script that handles playing effects and sounds and enabling electricity hazard for water.

Group TrapElectrifiedWaterData
    VisualEffect Property HazardEffect Const Auto
    {Visual effect to play when player is in electrified water}

    WWiseEvent Property HazardSound Const Auto
    {Sound to play when player is in electrified water}
EndGroup

int soundInstanceID

Function HandleOnUnload()
    WwiseEvent.StopInstance(soundInstanceID)
endFunction

; override parent function
Function BecomeActive()
;Play electricity effects and sounds.
    Debug.Trace(self + "BecomeActive - Powering up...")
    Enable()
    HazardEffect.Play(self)
    soundInstanceID = HazardSound.Play(self)
EndFunction

; override parent function
Function BecomeInactive()
;Turn off electricity effects and sounds.
    Debug.Trace(self + "BecomeInactive - Powering down...")
    HazardEffect.Stop(self)
    Disable()
    WwiseEvent.StopInstance(soundInstanceID) 
EndFunction

