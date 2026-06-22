Scriptname UC04_LodgeDoorTriggerRefScript extends ObjectReference

Message Property UC04_LodgeBlocked Mandatory Const Auto
{Message to show when the player activates this trigger}

int Property CooldownTimer = 5 Const Auto
{How often we show the warning prompt}

bool Property InCooldown = false Auto
{If true, don't reshow the warning message}

;LOCAL VARS
int iCooldownTimerID = 1 const

Event OnActivate(ObjectReference akActionRef)
    if !InCooldown
        InCooldown = true
        UC04_LodgeBlocked.Show()
        StartTimer(CooldownTimer, iCooldownTimerID)
    endif   
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == iCooldownTimerID
        InCooldown = false
    endif
EndEvent