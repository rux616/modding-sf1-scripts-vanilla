Scriptname UC09_HeatleechAmbushMarkerScript extends ObjectReference

GlobalVariable Property UC09_Result Mandatory Const Auto
{Global used to manage the player's gameplay results after the UC questline}

GlobalVariable Property UC09_LeechNestCleanUpChance Mandatory Const Auto
{Percent chance a Heatleech nest will clean itself up when its loaded post-UC questline}

GlobalVariable Property UC09_LeechNestCleanUpCooldownLength Mandatory Const Auto
{If this nest isn't turned off, this global is used to manage how long we wait before checking again}

bool Property DisableOnLoadAfterQuestline = true Const Auto
{If you don't want this Heatleech nest disabling automatically on load, set this to "FALSE". 
NOTE: This should only be used for quest-related or scene objects. Ambiently placed ones should be always be marked "TRUE"}

Keyword Property DMP_AmbushMarker Mandatory Const Auto
{Keyword to connect the Leech to its ambush marker}

float Timestamp = 0.0 ;Used to time stamp this object so it's not constantly reevaluating every time a player approaches the object

Event OnLoad()
    if DisableOnLoadAfterQuestline
        if UC09_Result.GetValue() > 0 && !IsDisabled() && !IsDestroyed() && Timestamp < Utility.GetCurrentRealTime()

            ;We only want this to disable itself if it's not set up correctly as an ambush marker.
            Actor[] LinkedActors = GetActorsLinkedToMe (DMP_AmbushMarker)

            ;If there's nothing linked to this guy, check to turn it off
            if LinkedActors.Length <= 0

                int iRand = Utility.RandomInt(0, 100)

                ;Turn off this nest permanently
                if iRand <= UC09_LeechNestCleanUpChance.GetValueInt()

                    Disable()
                    SetDestroyed()
                ;Leave this nest on for now and timestamp it
                else
                    Timestamp = Utility.GetCurrentRealTime() + UC09_LeechNestCleanUpCooldownLength.GetValue()
                endif

            endif

        endif
    endif
EndEvent