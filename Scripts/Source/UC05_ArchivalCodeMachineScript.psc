Scriptname UC05_ArchivalCodeMachineScript extends ObjectReference

Key Property RequiredKey Mandatory Const Auto
{Key object player must have in order to access this }

Topic Property UC05_PlayerLacksCodeMachineKey Mandatory Const Auto
{Topic to play when the player lacks the key to access this code machine}

Topic Property UC05_IssuingCode Mandatory Const Auto
{Topic to play when issuing the code}

Topic Property UC05_CodeDispensed Mandatory Const Auto
{Topic to play when the player lacks the key to access this code machine}

Quest Property UC05 Mandatory Const Auto
{Quest object for UC05}

int Property StageToSet Mandatory Auto Const
{If the player has the required key, set this stage}

int Property AudioCooldown = 7 Auto Const
{How long to wait between audio lines}

;Local vars
bool bIncooldown
bool bIssueLineOnce
int iTimerID = 1 const

Event OnActivate(ObjectReference akActionRef)
    Actor PlayACT = Game.GetPlayer()
    if akActionRef == PlayACT
        if UC05.GetStageDone(StageToSet)

            if !bIncooldown
                bIncooldown = true
                StartTimer(AudioCooldown, iTimerID)
                Say(UC05_CodeDispensed)
            endif

        elseif PlayACT.GetItemCount(RequiredKey) < 1

            if !bIncooldown
                bIncooldown = true
                StartTimer(AudioCooldown, iTimerID)
                Say(UC05_PlayerLacksCodeMachineKey)
            endif

        elseif  PlayACT.GetItemCount(RequiredKey) >= 1

            if !UC05.GetStageDone(StageToSet)

                if !bIssueLineOnce
                    bIssueLineOnce = true
                    Say(UC05_IssuingCode)
                endif
                
                Utility.Wait(2.0)
                UC05.SetStage(StageToSet)
            endif
        endif
    endif
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == iTimerID
        bIncooldown = false
    endif
EndEvent