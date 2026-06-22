Scriptname LandyScript extends Quest

Quest Property RAD05 Auto Const Mandatory

Function RestartRAD05()
    Debug.Trace("RestartRad05 on LandryScript has been called.")
    RAD05.Reset()
    RAD05.Stop()
    RAD05.Reset()
    RAD05.Start()
EndFunction