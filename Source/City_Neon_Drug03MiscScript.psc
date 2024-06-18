Scriptname City_Neon_Drug03MiscScript extends Quest
{pops objective when Yannick will give you another shift}

GlobalVariable property Neon_Drug03_CooldownTimestamp auto const mandatory

int property ShiftObjective = 10 auto const 

; call this when player finishes a shift
function StartShiftTimer()
    ; hide objective
    SetObjectiveDisplayed(ShiftObjective, false)
    ; set cooldown
    Neon_Drug03_CooldownTimestamp.SetValue(Utility.GetCurrentGameTime() + 1.0) ; one shift per day    
    ; run timer
    StartTimerGameTime(24.0)
EndFunction

; call this when player starts a shift
function ClearShiftTimer()
    ; complete objective
    SetObjectiveCompleted(ShiftObjective)
    ; just in case
    CancelTimerGameTime()
EndFunction

Event OnTimerGameTime(int aiTimerID)
    ; ready for another shift
    SetObjectiveCompleted(ShiftObjective, false)
    SetObjectiveDisplayed(ShiftObjective)
    ; just in case, make sure cooldown is expired
    Neon_Drug03_CooldownTimestamp.SetValue(Utility.GetCurrentGameTime())
EndEvent

