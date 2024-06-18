Scriptname FFNewHomesteadR05QuestScript extends Quest

Float Property CooldownTimerDays = 3.0 Const Auto
GlobalVariable Property FFNewHomesteadR05_CooldownTime Mandatory Const Auto

;Sets the cooldown time for this quest to the current game time, plus a number of days. 
;This will be checked via condition on the NPC's dialogue so they won't offer the quest until the GameDaysPassed Global exceeds this Global value.
Function SetCooldown()
    FFNewHomesteadR05_CooldownTime.SetValue(Utility.GetCurrentGameTime() + CooldownTimerDays)
EndFunction