Scriptname RI08_PostQuestScript extends Quest

Int Property iTimer Auto Const Mandatory
Int Property iQuestStage Auto Const Mandatory

Function StartPostQuestTimer()
    StartTimerGameTime(iTimer, 1)
EndFunction

Event OnTimerGameTime(Int aiTimerID)
    If aiTimerID == 1
        SetStage(iQuestStage)
    EndIf
EndEvent
