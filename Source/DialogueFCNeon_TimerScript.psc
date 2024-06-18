Scriptname DialogueFCNeon_TimerScript extends Quest

Int Property StageToSet Auto Const

;wait 24 hours
Function Wait24()
    StartTimerGameTime(24, 1)
EndFunction

Event OnTimerGameTime(int aiTimerID)
    If aiTimerID == 1
        SetStage(StageToSet)
    EndIf
EndEvent

