Scriptname CF03QuestScript extends Quest

;Fires after player completes Stage 180 (find's Kryx's Cell)
; Wait 2 minutes of game time until popping a direct QT to the lamp
Function WaitQT()
    StartTimer(120, 1)
EndFunction

Event OnTimer(int aiTimerID)
    If aiTimerID == 1
        SetStage(StageToSet)
    EndIf
EndEvent

Int Property StageToSet Auto Const