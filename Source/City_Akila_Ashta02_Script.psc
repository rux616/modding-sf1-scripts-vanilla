Scriptname City_Akila_Ashta02_Script extends Quest

; !!!BIG NOTE!!!: This script is shared between Ashta02 and Ashta 03

; Wait 24 hours to progress quest
Function Wait24()
    Debug.Trace("Ashta02 - 24 hour timer kicked off")
    StartTimerGameTime(24, 1)
EndFunction

Event OnTimerGameTime(int aiTimerID)
    Debug.Trace("Ashta02 timer check")
    If aiTimerID == 1
        Debug.Trace("Ashta02 - 24 hour timer has fired")
        SetStage(StageToSet)
    EndIf
EndEvent

Int Property StageToSet Auto Const
