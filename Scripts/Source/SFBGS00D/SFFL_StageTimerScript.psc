Scriptname SFBGS00D:SFFL_StageTimerScript extends Quest
{General use timer script that sets a stage on timer end. 
To use: add kmyquest.StartAttackTimer() in a Stage and set the 
timer setting properties for min/max time and starge to set. Timer
time will be an a random int between the min/max.}

Int Property StageToSet Auto Const Mandatory
{Stage to set when timer ends.}

Int Property TurnOffStage Auto Const Mandatory
{Stage to kill timer if the quest ends.}

Int Property MinTimerTime Auto Const Mandatory
{Minimum timer time in seconds. Timer will be a random int between min and max times.}

Int Property MaxTimerTime Auto Const Mandatory
{Maximum timer time in seconds. Timer will be a random int between min and max times.}

int TimerID = 1 Const

Function StartAttackTimer()
    int TimerTime = Utility.RandomInt(MinTimerTime, MaxTimerTime)
    StartTimer(TimerTime, TimerID)
EndFunction

Event OnTimer(int aiTimerID)
    If aiTimerID == TimerID && !GetStageDone(TurnOffStage)
        SetStage(StageToSet)
    EndIf
EndEvent
