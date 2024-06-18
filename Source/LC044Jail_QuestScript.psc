Scriptname LC044Jail_QuestScript extends Quest

Int Property iStageToSet Auto Const Mandatory
Int Property iTurnOffStage Auto Const Mandatory

Function StartJailTimer()
    StartTimer(60, 1)
EndFunction

Event OnTimer(Int aiTimerID)
    if aiTimerID == 1 && !GetStageDone(iTurnOffStage)
        SetStage(iStageToSet)
    EndIf
EndEvent