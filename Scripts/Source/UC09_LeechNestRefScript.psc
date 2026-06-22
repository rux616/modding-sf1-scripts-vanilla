Scriptname UC09_LeechNestRefScript extends ObjectReference

GlobalVariable Property UC09_Result Mandatory Const Auto
{Global used to manage the player's gameplay results after the UC questline}

GlobalVariable Property UC09_LeechNestCleanUpChance Mandatory Const Auto
{Percent chance a Heatleech nest will clean itself up when its loaded post-UC questline}

GlobalVariable Property UC09_LeechNestCleanUpCooldownLength Mandatory Const Auto
{If this nest isn't turned off, this global is used to manage how long we wait before checking again}

bool Property DisableOnLoadAfterQuestline = true Const Auto
{If you don't want this Heatleech nest disabling automatically on load, set this to "FALSE". 
NOTE: This should only be used for quest-related or scene objects. Ambiently placed ones should be always be marked "TRUE"}

float Timestamp = 0.0 ;Used to time stamp this object so it's not constantly reevaluating every time a player approaches the object

Event OnCellLoad()
    if DisableOnLoadAfterQuestline
        if UC09_Result.GetValue() > 0 && !IsDisabled() && !IsDestroyed() && Timestamp < Utility.GetCurrentGameTime()

            int iRand = Utility.RandomInt(0, 100)

            ;Turn off this nest permanently
            if iRand <= UC09_LeechNestCleanUpChance.GetValueInt()
                Disable()
                SetDestroyed()

            ;Leave this nest on for now and timestamp it
            else
                Timestamp = Utility.GetCurrentGameTime() + UC09_LeechNestCleanUpCooldownLength.GetValue()
            endif
        endif
    endif
EndEvent