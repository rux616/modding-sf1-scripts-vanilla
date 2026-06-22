Scriptname FFParadisoZ01QuestScript extends Quest

Int Property WaitTimerEndStage = 450 Const Auto
ReferenceAlias Property Akachi Mandatory Const Auto
ReferenceAlias Property Computer Mandatory Const Auto

Float Property WaitTimerLength = 43200.0 Auto
Int WaitTimerID = 1

Function ComputerNoActivate()
    Computer.GetRef().BlockActivation(True, True)
EndFunction

Function ComputerAllowActivate()
    Computer.GetRef().BlockActivation(False, False)
EndFunction

;Get the Day length for Gagarin and start the timer.
Function StartWaitTimer()
    WaitTimerLength = Utility.GetHoursUntilLocalHour(11.0)
    StartTimerGametime(WaitTimerLength, WaitTimerID)
EndFunction

Function StopWaitTimer()
    CancelTimerGameTime(WaitTimerID)
EndFunction


Event OnTimerGameTime(Int aiTimerId)
    If aiTimerId == WaitTimerID
        SetStage(WaitTimerEndStage)
    EndIf
EndEvent
