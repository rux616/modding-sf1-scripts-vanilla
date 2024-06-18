Scriptname OE_HuntedHomesteaders_QuestScript extends Quest

Int WaitTimerID = 1
float WaitTimerLength = 0.0

Group QuestProperties
    Int Property StageToSet = 300 Const Auto
    {This is the stage that will be set when the timer ends.}
    Float Property TimeToSpawn = 15.0 Auto  
    {In Seconds -- the minimum time that must pass before the creatures spawn.} 
    Float Property MaxTimeToSpawn = 35.0 Auto 
    {In seconds, the maxinum amount of time to wait for the Predators to spawn.}
EndGroup

; Get the Day length for the Planet
Function StartWaitTimer()
    WaitTimerLength = Utility.RandomFloat(TimeToSpawn, MaxTimeToSpawn) * 0.0167
    StartTimerGametime(WaitTimerLength, WaitTimerID)
EndFunction

Function StopWaitTimer()
    CancelTimerGameTime(WaitTimerID)
EndFunction

Event OnTimerGameTime(Int aiTimerId)
    If aiTimerId == WaitTimerID
        SetStage(StageToSet)
    EndIf
EndEvent
