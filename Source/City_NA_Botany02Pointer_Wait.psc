Scriptname City_NA_Botany02Pointer_Wait extends Quest

;Fires after player completes Botany01
; Wait 24 hours to progress into Botany02
Function Wait24()
    StartTimerGameTime(12, 1)
EndFunction

Event OnTimerGameTime(int aiTimerID)
    If aiTimerID == 1
        SetStage(StageToSet)
    EndIf
EndEvent

Int Property StageToSet Auto Const