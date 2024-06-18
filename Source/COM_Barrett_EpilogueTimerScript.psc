Scriptname COM_Barrett_EpilogueTimerScript extends Quest

{A timer that counts down days after an event and sets a stage}

Int Property StageToSet Auto Const Mandatory

Int Property idNumber Auto Const Mandatory

Int Property cooldownHours Auto Const Mandatory

Function StartCooldownTimer()
    StartTimerGameTime(cooldownHours, idNumber)
EndFunction

Event OnTimerGameTime(int aiTimerID)
    If aiTimerID == idNumber
        SetStage(StageToSet)
    EndIf
EndEvent

